---
title: regctl blob diff-layer
layout: single
warning: Auto generated content
---

## Synopsis

This returns the difference between two layers, comparing the contents of each tar.

```shell
regctl blob diff-layer <repository> <digest> <repository> <digest> [flags]
```

## Examples

```shell
# compare two versions of busybox, ignoring timestamp changes
regctl blob diff-layer \
  busybox sha256:2354422721e449fa3fa83b84465b9d5bb65ac5415ec93c06f598854312e8957e \
  busybox sha256:9ad63333ebc97e32b987ae66aa3cff81300e4c2e6d2f2395cef8a3ae18b249fe --ignore-timestamp
```

## Options

```text
      --context int        Lines of context (default 3)
      --context-full       Show all lines of context
      --ignore-timestamp   Ignore timestamps on files
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
