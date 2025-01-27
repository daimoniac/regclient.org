---
title: regctl blob get-file
layout: single
warning: Auto generated content
---

## Synopsis

This returns a requested file from a layer.

```shell
regctl blob get-file <repository> <digest> <file> [out-file] [flags]
```

## Aliases

- cat

## Examples

```shell
# retrieve the contents of /etc/alpine-release
regctl blob get-file alpine \
  sha256:9123ac7c32f74759e6283f04dbf571f18246abe5bb2c779efcb32cd50f3ff13c \
  /etc/alpine-release
```

## Options

```text
      --format string   Format output with go template syntax
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
