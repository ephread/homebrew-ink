# Homebrew Tap for Inkle's Ink
[![Build Status](https://travis-ci.org/ephread/homebrew-ink.svg?branch=master)](https://travis-ci.org/ephread/homebrew-ink)

Formulae to install inklecate with Homebrew.

## Installation

Tap into into this repository.

```bash
$ brew tap ephread/ink
```

### Latest version

You can now install the latest version of `inklecate`.

```bash
$ brew install inklecate
```

Then you can run `inklecate`:

```bash
$ inklecate
```

### Versioned formulae

You can also install a previous version of `inklecate`.

```bash
$ brew install inklecate@<version>
```

`brew search` will show you a list of available versions:

```bash
$ brew search inklecate
```

Since these formulae may conflict with the regular version of `inklecate`, they are _keg only_. It means that they are only installed in the cellar and are not available in the `PATH`.

You can use `brew link` or update the `$PATH` in your shell profile file to make them available.

## Mono dependency

The Mono dependency is marked as optional. Hence, if you already have a specific version of Mono installed and don't want Homebrew to mess with it (e. g. if you're using Ink with Godot), you can ignore Mono by specifying the `--without-mono` option:

```bash
$ brew install --without-mono inklecate
```

## LICENSE

The formulae are under the [BSD 2-clause "Simplified" License](https://github.com/ephread/homebrew-ink/blob/master/LICENSE).
