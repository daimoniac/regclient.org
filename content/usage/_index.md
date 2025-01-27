---
title: Usage
layout: single
date: 2025-01-01
---

{{% toc %}}

## Image References

regclient extends the typical image reference to make it easier to access data in more locations.

- **Registry**
  - This is the traditional image syntax used by many tools: `registry.example.com/group/project:tag`
  - Docker Hub defaults are used with short references. `docker.io` is the default registry, `library` is the default repository on Docker Hub, and `latest` is the default tag.
  - Registry names must always contain a `.`, `:`, or be set to `localhost` to distinguish from a short reference to Docker Hub.
  - Registries always default to using https/TLS for securing connections.
  - Examples:
    - `alpine` becomes `docker.io/library/alpine:latest`
    - `registry.example.com:5000/username/project:v1.2@sha256:3f5754829e9747db418bd1a5a40f418b073ed863cba4d57aaeaefa08118c4743` pulls the pinned reference (ignoring the `v1.2` tag)
  
- **OCI Layout**
  - The prefix `ocidir://` on a reference accesses content in an OCI Layout on the local filesystem.
  - The path is absolute when there is a third slash. `ocidir:///tmp/name:tag` refers to `/tmp/name`, while `ocidir://name:tag` or `ocidir://./name:tag` refers to the `./name` directory.
  - Multiple tags or digests may be pushed/pulled to the same directory, making it equivalent to a repository on a registry.
  - regclient performs a garbage collection after writing to an OCI Layout, deleting unreferenced content in the blob store.
  - See the [OCI Layout documentation](https://github.com/opencontainers/image-spec/blob/main/image-layout.md) for details of this directory structure.

These schemes can be used anywhere a repository or image is referenced in regclient.

## Template Functions

Go templates are used in multiple regclient based commands.
See the [golang documentation](https://golang.org/pkg/text/template/) for details on base functionality.
The following functions have been added in addition to the defaults available in Go:

- `default`:
  Provide a default value when input is empty, e.g. `{{ env "VAR" | default "undefined" }}`.
- `env`:
  Expands provided environment variable, e.g. `{{ env "USER" }}`.
- `file`:
  Outputs contents of the file, leading and trailing whitespace is removed.
- `join`:
  Append array entries into a string with a separator.
- `json`:
  Output the variable with json formatting.
- `jsonPretty`:
  Same as json with linefeeds and indentation.
- `lower`:
  Converts a string to lowercase.
- `printPretty`:
  Outputs a user readable view of the object when available, otherwise falling back to `jsonPretty` output.
  This is useful for manifest lists and tag lists.
- `split`:
  Split a string based on a separator.
- `time`:
  See [Go time package](https://pkg.go.dev/time) for more details on implemented functions:
  - `time.Now`:
    Returns current time object, e.g. `{{ $t := time.Now }}{{printf "%d%d%d" $t.Year $t.Month $t.Day}}`.
  - `time.Parse`:
    Parses string using layout into time object, e.g. `{{ $t := time.Parse "2006-01-02" "2020-06-07"}}`.
- `trimSpace`:
  Trim whitespace from the start and end of a string.
- `upper`:
  Converts a string to uppercase.
