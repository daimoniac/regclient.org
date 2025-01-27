---
title: regctl blob head
layout: single
warning: Auto generated content
---

## Synopsis

Shows the headers for a blob head request.

```shell
regctl blob head <repository> <digest> [flags]
```

## Aliases

- digest

## Examples

```shell
# verify the existence of a blob
regctl blob head alpine \
  sha256:9123ac7c32f74759e6283f04dbf571f18246abe5bb2c779efcb32cd50f3ff13c
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
