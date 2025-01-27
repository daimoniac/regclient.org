---
title: regctl index delete
layout: single
warning: Auto generated content
---

## Synopsis

Delete an entry from a manifest list or OCI Index.

```shell
regctl index delete <image_ref> [flags]
```

## Aliases

- del
- rm
- remove

## Examples

```shell
# remove the several platforms from an image
regctl index delete registry.example.org/repo:v1 \
  --platform unknown/unknown --platform linux/s390x \
  --platform linux/ppc64le --platform linux/mips64le
```

## Options

```text
      --digest stringArray     Digest to delete
      --platform stringArray   Platform to delete
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
