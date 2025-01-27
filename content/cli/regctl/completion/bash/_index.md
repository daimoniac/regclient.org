---
title: regctl completion bash
layout: single
warning: Auto generated content
---

## Synopsis

Generate the autocompletion script for the bash shell.

This script depends on the 'bash-completion' package.
If it is not installed already, you can install it via your OS's package manager.

To load completions in your current shell session:

	source <(regctl completion bash)

To load completions for every new session, execute once:

#### Linux:

	regctl completion bash > /etc/bash_completion.d/regctl

#### macOS:

	regctl completion bash > $(brew --prefix)/etc/bash_completion.d/regctl

You will need to start a new shell for this setup to take effect.

```shell
regctl completion bash
```

## Options

```text
      --no-descriptions   disable completion descriptions
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
