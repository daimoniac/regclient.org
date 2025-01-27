---
title: regsync check
layout: single
warning: Auto generated content
---

## Synopsis

Processes each sync command in the configuration file in order.
Manifests are checked to see if a copy is needed, but only log, skip copying.
No jobs are run in parallel, and the command returns after any error or last
sync step is finished.

```shell
regsync check
```

## Options from parent commands

```text
  -c, --config string        Config file
      --logopt stringArray   Log options
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "INFO")
```
