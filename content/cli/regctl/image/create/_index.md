---
title: regctl image create
layout: single
warning: Auto generated content
---

## Synopsis

Create a new image manifest from an initially empty (scratch) state.

```shell
regctl image create <image_ref> [flags]
```

## Aliases

- init
- new

## Examples

```shell
# create a scratch image
regctl image create ocidir://new-image:scratch
```

## Options

```text
      --annotation stringArray   Annotation to set on manifest
      --by-digest                Push manifest by digest instead of tag
      --created string           Created timestamp to set (use "now" or RFC3339 syntax)
      --format string            Format output with go template syntax
      --label stringArray        Labels to set in the image config
      --media-type string        Media-type for manifest (default "application/vnd.oci.image.manifest.v1+json")
      --platform string          Platform to set on the image
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
