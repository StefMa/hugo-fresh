---
title: Hugo module
sidebar: true
sidebarlogo: fresh-white
include_footer: false
---

## Module

The theme is an [hugo modules](https://gohugo.io/hugo-modules/)-theme.
It is not possible to add this theme as a git submodule anymore.

This provides several benefits for the development of this theme.

### Versioning / stable theme

With modules it is possible to point to any git hash you like. Nevertheless, it is strongly recommended to only use a versionised version of this theme. Checkout the [GitHub Release page](https://github.com/StefMa/hugo-fresh/releases/) for the latest version.

You can run the follwing command to update/change the theme version:

```
hugo mod get -u github.com/StefMa/hugo-fresh@v[SEMVER_VERSION]
```

There can be als an `hash` or an `branch` name after the `@`-sign.

### Usage

1. To use the theme you first have to transform your own hugo site to an module. Doing this is possible with the following command:

```
hugo mod init MODULE_NAME
```

A typical module name follows the following convention: `domain-name.tld/something`.

2. After that you can declare the hugo module in your config file (yaml example):

```yaml
module:
  imports:
    path: github.com/StefMa/hugo-fresh
```
