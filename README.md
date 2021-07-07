<img src="https://opensearch.org/assets/brand/SVG/Logo/opensearch_logo_default.svg" height="64px"/>

- [Meta](#meta)
  - [Install Meta](#install-meta)
  - [Use Meta](#use-meta)
  - [Updating Repos](#updating-repos)
- [Contributing](#contributing)
- [Security](#security)
- [Code of Conduct](#code-of-conduct)
- [License](#license)
- [Copyright](#copyright)

## Meta

This project uses [meta](https://github.com/mateodelnorte/meta) to operate on all the repositories in the [opensearch-project organization](https://github.com/opensearch-project/).

### Install Meta

```
npm install -g meta
```

### Use Meta

```
meta git update
```

Subsequently, use `meta git pull` to update all repos.

### Updating Repos

Meta stores a list of repositories in [.meta](.meta). You can bulk update this file as follows.

```
./scripts/update.sh
```

This script requires aa working copy of [GitHub CLI](https://github.com/cli/cli), installed via `brew install gh` on OSX.

If a new repo is added, run `meta project import [repo] [git]`.

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