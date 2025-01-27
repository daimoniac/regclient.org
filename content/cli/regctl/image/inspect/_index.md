---
title: regctl image inspect
layout: single
warning: Auto generated content
---

## Synopsis

Shows the config json for an image and is equivalent to pulling the image
in docker, and inspecting it, but without pulling any of the image layers.

```shell
regctl image inspect <image_ref> [flags]
```

## Aliases

- config

## Examples

```shell
# return the image config for the nginx image
regctl image inspect --platform local nginx
```

## Options

```text
      --format string     Format output with go template syntax (default "{{printPretty .}}")
  -p, --platform string   Specify platform (e.g. linux/amd64 or local)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
