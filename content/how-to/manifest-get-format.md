---
title: Formatting Output From regctl manifest get
---

{{% toc %}}

The `regctl manifest get` command returns a [regclient Manifest](https://pkg.go.dev/github.com/regclient/regclient/types/manifest#Manifest) that can be formatted using Go's [text templates](https://pkg.go.dev/text/template).
The available templates and methods are a powerful way to extract the exact data desired without depending on any other tooling.

## Available Fields, Methods, and Functions

Depending on the content queried, the embedded manifest will likely be one of:

- [OCI Index](https://pkg.go.dev/github.com/regclient/regclient/types/oci/v1#Index)
- [OCI Manifest](https://pkg.go.dev/github.com/regclient/regclient/types/oci/v1#Manifest)
- [Docker Manifest List](https://pkg.go.dev/github.com/regclient/regclient/types/docker/schema2#ManifestList)
- [Docker Manifest](https://pkg.go.dev/github.com/regclient/regclient/types/docker/schema2#Manifest)

The following methods may be available depending on the type of manifest and source:

- `GetAnnotations`: Returns the annotations that were defined on the manifest (note this does not return annotations set on nested descriptors).
- `GetConfig`: Returns the config OCI descriptor when the manifest is an OCI Manifest or Docker Manifest.
- `GetDescriptor`: This returns an OCI descriptor for the manifest.
- `GetLayers`: This returns the slice of layer descriptors when the manifest is an OCI Manifest or Docker Manifest.
- `GetManifestList`: This returns the slice of manifest descriptors when the manifest is an OCI Index or Docker Manifest List.
- `GetRef`: Returns a [reference](https://pkg.go.dev/github.com/regclient/regclient/types/ref#Ref) to the manifest.
- `GetSize`: Returns a computed size of all layers in bytes. This is a network bandwidth size, not the decompressed image size.
- `IsList`: Returns a boolean true/false on whether the manifest contains a list of manifests (an OCI Index or Docker Manifest List).
- `MarshalJSON`: Returns the json formatted manifest. Calling the `json` or `jsonPretty` custom template functions is preferred.
- `MarshalPretty`: Returns a human formatted manifest. Calling the `printPretty` custom template function is preferred.
- `RawBody`: Returns the original bytes of the manifest, useful to avoid changing the digest of the content.
- `RawHeaders`: Returns the [HTTP headers](https://pkg.go.dev/net/http#Header) when pulled from a registry server.

Note that [Descriptors](https://pkg.go.dev/github.com/regclient/regclient/types/descriptor#Descriptor) should have at least a media type, digest, and a size defined.

In addition to Go's [text template](https://pkg.go.dev/text/template) functions, regclient has a list of custom functions documented on the [usage page](/usage#template-functions).

## Shortcuts

A few shortcuts are included in `regctl manifest get` to make common outputs easier:

- `raw`: this returns a combination of the raw headers and raw body.
- `rawBody`, `raw-body`, or `body`: each of these will output the original manifest body without any reformatting.
- `rawHeaders`, `raw-headers`, or `headers`: each of these will output the headers for requests to a registry.

For example:

```shell
$ regctl manifest get localhost:5002/regclient/regctl:edge --format headers
Accept-Ranges: bytes
Content-Length: 2273
Content-Type: application/vnd.oci.image.index.v1+json
Date: Wed, 26 Mar 2025 17:25:27 GMT
Docker-Content-Digest: sha256:03c65b18c20ea542873a9873bc0aea53db13032c510b44e412e5fe99b78dd65c
Docker-Distribution-Api-Version: registry/2.0
```

## Generating a List Of Platforms

To generate a list of platforms for a given image, the following format string can be used:

```shell
regctl manifest get alpine:latest \
  --format '
{{- if .IsList }}
  {{- range $desc := .GetManifestList }}
    {{- $plat := $desc.Platform.String }}
     {{- if ne $plat "unknown/unknown" }}
      {{- println $plat }}
    {{- end }}
  {{- end }}
{{- else }}
  {{- println "returned manifest is not a manifest list:" .GetDescriptor.MediaType }}
{{- end }}'
```

The components of this format include:

- `.`: this is the manifest passed to the format.
- `if .IsList`: this avoids running `GetManifestList` on manifests that are not a manifest list.
- `GetManifestList`: returns the manifest list, which will only work on an OCI Index and Docker Manifest List.
- `range`: is a Go template command to iterate over the returned slice, setting `$desc` for each iteration.
- `$desc.Platform.String`: extracts the `Platform` field from the [`Descriptor`](https://pkg.go.dev/github.com/regclient/regclient/types/descriptor#Descriptor) and formats it as a [`String`](https://pkg.go.dev/github.com/regclient/regclient/types/platform#Platform.String).
- `if ne $plat "unknown/unknown"`: this condition excludes the `unknown/unknown` platforms that Docker uses to embed their build attestations.
- `println`: this is a Go template function to output the string value with a linefeed.
- `.GetDescriptor.MediaType`: this generates a descriptor for the returned manifest and extracts the media type field.
