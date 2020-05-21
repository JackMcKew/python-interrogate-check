# python-interrogate-check

A customisable GitHub action to check the style of Python code with [interrogate](https://pypi.org/project/interrogate/).

## Inputs

You can use inputs to alter how `interrogate` will check your code docstrings.

### Path

This tells `interrogate` where to look for files to check.

<!-- 
### fail-under (optional)

Fail when coverage % is less than a given amount.

**Default**: `80`

### exclude (optional)

Exclude PATHs of files and/or directories.

### ignore-init-method (optional)

Ignore `__init__` method of classes.

**Default**: `False`

### ignore-init-module (optional)

Ignore `__init__.py` modules.

**Default**: `False` -->

### badge-location (optional)

Generate a `shields.io` status badge (an SVG image) in at a given file or directory.

**Default**: `.`

## Example usage

Include this in your `.github/workflows/main.yaml`:

```yaml
uses: JackMcKew/python-interrogate-check@master
```

or, if you want to override any of the defaults,

```yaml
uses: JackMcKew/python-interrogate-check@master
with:
  path: 'package_name/'
```
