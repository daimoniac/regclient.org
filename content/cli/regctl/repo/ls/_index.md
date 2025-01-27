---
title: regctl repo ls
layout: single
warning: Auto generated content
---

## Synopsis

List repositories in a registry.
Note: Docker Hub does not support this API request.

```shell
regctl repo ls <registry> [flags]
```

## Aliases

- list

## Examples

```shell
# list all repositories
regctl repo ls registry.example.org

# list the next 5 repositories after repo1
regctl repo ls --last repo1 --limit 5 registry.example.org
```

## Options

```text
      --format string   Format output with go template syntax (default "{{printPretty .}}")
      --last string     Specify the last repo from a previous request for pagination
      --limit int       Specify the number of repos to retrieve
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
