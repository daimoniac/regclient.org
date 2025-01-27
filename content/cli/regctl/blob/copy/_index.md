---
title: regctl blob copy
layout: single
warning: Auto generated content
---

## Synopsis

Copy a blob between repositories. This works in the same registry only. It
attempts to mount the layers between repositories. And within the same repository
it only sends the manifest with the new tag.

```shell
regctl blob copy <src_image_ref> <dst_image_ref> <digest>
```

## Aliases

- cp

## Examples

```shell
# copy a blob
regctl blob copy alpine registry.example.org/library/alpine \
  sha256:9123ac7c32f74759e6283f04dbf571f18246abe5bb2c779efcb32cd50f3ff13c
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
