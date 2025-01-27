---
title: regctl image ratelimit
layout: single
warning: Auto generated content
---

## Synopsis

Shows the rate limit using an http head request against the image manifest.
If Set is false, the Remain value was not provided.
The other values may be 0 if not provided by the registry.

```shell
regctl image ratelimit <image_ref> [flags]
```

## Aliases

- rate-limit

## Examples

```shell
# return the current rate limit for pulling the alpine image
regctl image ratelimit alpine

# return the number of pulls remaining
regctl image ratelimit alpine --format '{{.Remain}}'
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
