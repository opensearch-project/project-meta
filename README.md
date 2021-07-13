<img src="https://opensearch.org/assets/brand/SVG/Logo/opensearch_logo_default.svg" height="64px"/>

- [Meta](#meta)
  - [Install GitHub CLI](#install-github-cli)
  - [Install Meta](#install-meta)
  - [Check Out Repos](#check-out-repos)
  - [Get Repo Info](#get-repo-info)
  - [Add a New Repo](#add-a-new-repo)
  - [Create or Update Labels in All Repos](#create-or-update-labels-in-all-repos)
  - [Create an Issue in All Repos](#create-an-issue-in-all-repos)
  - [Find Labeled Issues](#find-labeled-issues)
  - [Check Tags](#check-tags)
- [Contributing](#contributing)
- [Security](#security)
- [Code of Conduct](#code-of-conduct)
- [License](#license)
- [Copyright](#copyright)

## Meta

This project uses [meta](https://github.com/mateodelnorte/meta) to operate on all the repositories in the [opensearch-project organization](https://github.com/opensearch-project/).

### Install GitHub CLI

Install and configure GitHub CLI from [cli.github.com/manual/installation](https://cli.github.com/manual/installation). Authenticate with `gh auth login` and ensure that it works, e.g. `gh issue list`.

### Install Meta

```sh
npm install -g meta
```

### Check Out Repos

```sh
meta git update
```

Use `meta git pull` to subsequently pull the latest revisions.

### Get Repo Info

```sh
meta gh issue list
```

### Add a New Repo

```sh
meta project import new-repo git@github.com:opensearch-project/new-repo.git
```

Meta stores a list of repositories in [.meta](.meta). You can bulk update this file from the opensearch-project org as follows.

```
./scripts/update.sh
```

### Create or Update Labels in All Repos

Install [ghi](https://github.com/stephencelis/ghi), e.g. `brew install ghi`.

```
meta exec "ghi label 'backwards-compatibility' -c '#773AA8'
```

This makes it easy to create version labels.

```
meta exec "ghi label 'untriaged' -c '#fbca04'"
meta exec "ghi label 'v1.0.0' -c '#d4c5f9'"
meta exec "ghi label 'v1.1.0' -c '#c5def5'"
meta exec "ghi label 'v2.0.0' -c '#b94c47'"
meta exec "ghi label 'patch' -c '#dd8e2c'"
```

### Create an Issue in All Repos

Create a file for the issue body, e.g. `issue.md`.

```
meta exec "gh issue create --label backwards-compatibility --title 'Ensure backwards compatibility' --body-file ../issue.md"
```

### Find Labeled Issues

Find all issues labeled `v1.0.0`.

```
meta exec "gh issue list -l 'v1.0.0'"
```

How many are left?

```
meta exec "gh issue list -l 'v1.0.0'" | wc -l
```

### Check Tags

Find out whether 1.0.0 tag exists in all repos.

```
meta exec "git ls-remote | grep -w 'refs/tags/1.0.0$' || echo missing"
```

Or using local tags.

```
meta git pull --tags
meta exec "git tag | grep -w '^1.0.0$' || echo missing"
```

## Contributing

Please contribute! See [CONTRIBUTING](CONTRIBUTING.md), [Maintainer](MAINTAINERS.md) and [Admin Responsibilities](ADMINS.md) for more information.

## Security

See [Security](SECURITY.md)

## Code of Conduct

This project has adopted the [Amazon Open Source Code of Conduct](CODE_OF_CONDUCT.md). For more information see the [Code of Conduct FAQ](https://aws.github.io/code-of-conduct-faq), or contact [opensource-codeofconduct@amazon.com](mailto:opensource-codeofconduct@amazon.com) with any additional questions or comments.

## License

This project is licensed under the [Apache v2.0 License](LICENSE.txt).

## Copyright

Copyright 2020-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.