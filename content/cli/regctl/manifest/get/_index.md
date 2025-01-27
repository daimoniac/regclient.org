---
title: regctl manifest get
layout: single
warning: Auto generated content
---

## Synopsis

Shows the manifest or manifest list of the specified image.

```shell
regctl manifest get <image_ref> [flags]
```

## Aliases

- pull

## Examples

```shell
# retrieve the manifest (pretty formatting)
regctl manifest get alpine

# show the original manifest body for the local platform
regctl manifest get alpine --format raw-body --platform local

# retrieve the manifest for a specific windows version
regctl manifest get golang --platform windows/amd64,osver=10.0.17763.4974
```

## Options

```text
      --format string     Format output with go template syntax (use "raw-body" for the original manifest) (default "{{printPretty .}}")
  -p, --platform string   Specify platform (e.g. linux/amd64 or local)
      --require-list      Deprecated: Fail if manifest list is not received
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
