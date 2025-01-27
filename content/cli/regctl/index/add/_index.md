---
title: regctl index add
layout: single
warning: Auto generated content
---

## Synopsis

Add an entry to a manifest list or OCI Index.

```shell
regctl index add <image_ref> [flags]
```

## Aliases

- append
- insert

## Examples

```shell
# add arm64 to the v1 image
regctl index add registry.example.org/repo:v1 --ref registry.example.org/repo:arm64
```

## Options

```text
      --desc-annotation stringArray   Annotation to add to descriptors of new entries
      --desc-platform string          Platform to set in descriptors of new entries
      --digest stringArray            Digest to add
      --digest-tags                   Include digest tags
      --platform stringArray          Platforms to include from ref
      --ref stringArray               References to add
      --referrers                     Include referrers
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
