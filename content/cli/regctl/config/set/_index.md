---
title: regctl config set
layout: single
warning: Auto generated content
---

## Synopsis

Modifies an option used in future executions.

```shell
regctl config set [flags]
```

## Examples

```shell
# disable loading credentials from docker
regctl config set --docker-cred=false

# enable loading credentials from docker
regctl config set --docker-cred
```

## Options

```text
      --blob-limit int               limit for blob chunks, this is stored in memory
      --default-cred-helper string   default credential helper
      --docker-cert                  load certificates from docker
      --docker-cred                  load credentials from docker
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
