---
title: regctl manifest put
layout: single
warning: Auto generated content
---

## Synopsis

Pushes a manifest or manifest list to a repository.

```shell
regctl manifest put <image_ref> [flags]
```

## Aliases

- push

## Examples

```shell
# push an image manifest
regctl manifest put \
  --content-type application/vnd.oci.image.manifest.v1+json \
  registry.example.org/repo:v1 <manifest.json
```

## Options

```text
      --by-digest             Push manifest by digest instead of tag
  -t, --content-type string   Specify content-type (e.g. application/vnd.docker.distribution.manifest.v2+json)
      --format string         Format output with go template syntax
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
