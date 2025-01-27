---
title: regctl image get-file
layout: single
warning: Auto generated content
---

## Synopsis

Go through each of the image layers searching for the requested file.

```shell
regctl image get-file <image_ref> <filename> [out-file] [flags]
```

## Aliases

- cat

## Examples

```shell
# get the alpine-release file from the latest alpine image
regctl image get-file --platform local alpine /etc/alpine-release
```

## Options

```text
      --format string     Format output with go template syntax
  -p, --platform string   Specify platform (e.g. linux/amd64 or local)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
