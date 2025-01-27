---
title: regctl completion fish
layout: single
warning: Auto generated content
---

## Synopsis

Generate the autocompletion script for the fish shell.

To load completions in your current shell session:

	regctl completion fish | source

To load completions for every new session, execute once:

	regctl completion fish > ~/.config/fish/completions/regctl.fish

You will need to start a new shell for this setup to take effect.

```shell
regctl completion fish [flags]
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
