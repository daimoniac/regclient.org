---
title: regctl blob diff-config
layout: single
warning: Auto generated content
---

## Synopsis

This returns the difference between two configs, comparing the contents of each config json.

```shell
regctl blob diff-config <repository> <digest> <repository> <digest> [flags]
```

## Examples

```shell
# compare two versions of busybox
regctl blob diff-config \
  busybox sha256:0c00acac9c2794adfa8bb7b13ef38504300b505a043bf68dff7a00068dcc732b \
  busybox sha256:3f57d9401f8d42f986df300f0c69192fc41da28ccc8d797829467780db3dd741
```

## Options

```text
      --context int    Lines of context (default 3)
      --context-full   Show all lines of context
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
