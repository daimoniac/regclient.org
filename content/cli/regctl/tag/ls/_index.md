---
title: regctl tag ls
layout: single
warning: Auto generated content
---

## Synopsis

List tags in a repository.
Note: many registries ignore the pagination options.
For an OCI Layout, the index is available as Index (--format "{{.Index}}").

```shell
regctl tag ls <repository> [flags]
```

## Aliases

- list

## Examples

```shell
# list all tags in a repository
regctl tag ls registry.example.org/repo

# exclude tags starting with sha256- from the listing
regctl tag ls registry.example.org/repo --exclude 'sha256-.*'
```

## Options

```text
      --exclude stringArray   Regexp of tags to exclude (expression is bound to beginning and ending of tag)
      --format string         Format output with go template syntax (default "{{printPretty .}}")
      --include stringArray   Regexp of tags to include (expression is bound to beginning and ending of tag)
      --last string           Specify the last tag from a previous request for pagination (depends on registry support)
      --limit int             Specify the number of tags to retrieve (depends on registry support)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
