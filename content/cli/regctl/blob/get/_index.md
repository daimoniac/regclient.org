---
title: regctl blob get
layout: single
warning: Auto generated content
---

## Synopsis

Download a blob from the registry. The output is the blob itself which may
be a compressed tar file, a json config, or any other blob supported by the
registry. The blob or layer digest can be found in the image manifest.

```shell
regctl blob get <repository> <digest> [flags]
```

## Aliases

- pull

## Examples

```shell
# inspect the layer contents of a busybox image
regctl blob get busybox \
  sha256:a58ecd4f0c864650a4286c3c2d49c7219a3f2fc8d7a0bf478aa9834acfe14ae7 \
  | tar -tvzf -
```

## Options

```text
      --format string   Format output with go template syntax (default "{{printPretty .}}")
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
