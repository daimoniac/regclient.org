---
title: regctl manifest head
layout: single
warning: Auto generated content
---

## Synopsis

Shows the digest or headers from an http manifest head request.

```shell
regctl manifest head <image_ref> [flags]
```

## Aliases

- digest

## Examples

```shell
# show the digest for an image
regctl manifest head alpine

# "regctl image digest" is an alias
regctl image digest alpine

# show the digest for a specific platform (this will perform a GET request)
regctl manifest head alpine --platform linux/arm64

# show all headers for the request
regctl manifest head alpine --format raw-headers
```

## Options

```text
      --format string     Format output with go template syntax (use "raw-body" for the original manifest)
  -p, --platform string   Specify platform (e.g. linux/amd64 or local, requires a get request)
      --require-digest    Fallback to a GET request if digest is not received
      --require-list      Fail if manifest list is not received
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
