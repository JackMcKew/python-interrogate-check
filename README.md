# python-interrogate-check

A customisable GitHub action to check the style of Python code with [interrogate](https://pypi.org/project/interrogate/).

## Inputs

You can use inputs to alter how `interrogate` will check your code docstrings.

### Path

This tells `interrogate` where to look for files to check.

### fail-under (optional)

Fail when coverage % is less than a given amount.

**Default**: `80`

<!-- 
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
uses: JackMcKew/python-interrogate-check@main
with:
  path: 'package_name'
```

## Full Example

Here is an entire workflow for updating a badge as well. Note you will need to set up an access token for the repository.

``` yaml

name: Interrogate documentation

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Set up Python 3.8
      uses: actions/setup-python@v2
      with:
        python-version: 3.8

    - name: Python Interrogate Check
      uses: JackMcKew/python-interrogate-check@main
      with:
        path: 'sample_package'
        badge-location: 'badges/interrogate_badge.svg'

    - name: Commit files
      run: |
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
        git add badges/interrogate_badge.svg
        git diff --exit-code || git commit -m "Update interrogate_badge.svg" -a

    - name: Push changes
      if: success()
      uses: ad-m/github-push-action@master
      with:
        github_token: ${{ secrets.ACCESS_TOKEN }}
```
