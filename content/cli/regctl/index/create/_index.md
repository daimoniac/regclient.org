---
title: regctl index create
layout: single
warning: Auto generated content
---

## Synopsis

Create a manifest list or OCI Index.

```shell
regctl index create <image_ref> [flags]
```

## Aliases

- init
- new
- put

## Examples

```shell
# create an empty index
regctl index create registry.example.org/repo:v1

# create an index from the amd64 and arm64 platforms
regctl index create registry.example.org/alpine:latest \
  --ref alpine:latest --platform linux/amd64 --platform linux/arm64

# create a docker manifest list
regctl index create registry.example.org/busybox:1.34 \
  --media-type application/vnd.docker.distribution.manifest.list.v2+json \
  --ref busybox:1.34 --platform linux/amd64 --platform linux/arm64

# create an index of windows images
regctl index create registry.example.org/library/golang:windows \
  --ref golang:latest \
	--platform windows/amd64,osver=10.0.20348.2322 \
	--platform windows/amd64,osver=10.0.17763.5458
```

## Options

```text
      --annotation stringArray        Annotation to set on manifest
      --artifact-type string          Include an artifactType value
      --by-digest                     Push manifest by digest instead of tag
      --desc-annotation stringArray   Annotation to add to descriptors of new entries
      --desc-platform string          Platform to set in descriptors of new entries
      --digest stringArray            Digest to include in new index
      --digest-tags                   Include digest tags
      --format string                 Format output with go template syntax
  -m, --media-type string             Media-type for manifest list or OCI Index (default "application/vnd.oci.image.index.v1+json")
      --platform stringArray          Platforms to include from ref
      --ref stringArray               References to include in new index
      --referrers                     Include referrers
      --subject string                Specify a subject tag or digest (this manifest must already exist in the repo)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
