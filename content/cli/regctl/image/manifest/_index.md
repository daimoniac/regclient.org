---
title: regctl image manifest
layout: single
warning: Auto generated content
---

## Synopsis

Shows the manifest or manifest list of the specified image.

```shell
regctl image manifest <image_ref> [flags]
```

## Examples

```shell
# return the manifest of the golang image
regctl image manifest golang
```

## Options

```text
      --format string     Format output with go template syntax (use "raw-body" for the original manifest) (default "{{printPretty .}}")
  -p, --platform string   Specify platform (e.g. linux/amd64 or local)
      --require-list      Fail if manifest list is not received
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
