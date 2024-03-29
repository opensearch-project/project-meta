<img src="https://opensearch.org/assets/img/opensearch-logo-themed.svg" height="64px">

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
  - [Make a Change in Many Repos](#make-a-change-in-many-repos)
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
./bin/check-repos.sh
```

### Create or Update Labels in All Repos

You can create labels in all opensearch-project repos without checking out any code.

```
for r in $(gh repo list opensearch-project --limit 100 | cut -f1); do echo $r ;  gh label create 'hacktoberfest' --description 'Global event that encourages people to contribute to open-source.' -c '#3B6BBD' --repo https://github.com/$r; done
```

For control over a list of repos, use meta.

```
meta exec "gh label create 'backwards-compatibility' -c '#773AA8'
```

This makes it easy to create version labels.

```
meta exec "gh label create 'untriaged' -c '#fbca04'"
meta exec "gh label create 'v1.0.0' -c '#d4c5f9'"
meta exec "gh label create 'v1.1.0' -c '#c5def5'"
meta exec "gh label create 'v2.0.0' -c '#b94c47'"
meta exec "gh label create 'patch' -c '#dd8e2c'"
```

### Create an Issue in All Repos

Create a file for the issue body, e.g. `issue.md`.

```
meta exec "gh issue create --label backwards-compatibility --title 'Ensure backwards compatibility' --body-file ../issue.md"
```

### Find Labeled Issues

Find all issues labeled `v1.0.0`.

```
meta exec "gh issue list -l v1.0.0"
```

How many are left?

```
meta exec "gh issue list -l v1.0.0" | wc -l
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

### Make a Change in Many Repos

In [.github#21](https://github.com/opensearch-project/.github/issues/121) we needed to update all MAINTAINERS.md files.

Check out the source code in all the repos.

```
meta git update
```

Ensure you have a fork for your code. Choose "no" when promoted to add a remote.

```
meta exec "gh repo fork"
```

Ensure remotes to your fork. Replace `your-github-username` with your GitHub username.

```
meta exec "git remote get-url origin | sed s/opensearch-project/your-github-username/g | xargs git remote add your-github-username"
```

Make code changes as needed. In our example, we used VSCode, opened all files called MAINTAINERS.md (using a open all files extension) and made bulk search/replace edits.

Create a new branch with the changes and commit the code. Replace `your-github-username` with your GitHub username.

```
meta exec "git checkout -b updated-maintainers"
meta exec "git add --all"
meta exec "git commit -s -m 'Updated MAINTAINERS.md to match recommended opensearch-project format.'"
meta exec "git push your-github-username updated-maintainers"
```

Set the default repo.

```
meta exec "git remote get-url origin | sed s/git@github.com\://g | sed s/.git//g | xargs gh repo set-default"
```

Make pull requests. Because you are creating many issues make sure to reference a parent issue in the body so that they can be easily linked together. Pick your fork when asked where to push the code every time and examine the first couple of pull requests for correctness before proceeding with the rest.

```
meta exec "gh pr create --title 'Updated MAINTAINERS.md format.' --body='Coming from https://github.com/opensearch-project/.github/issues/121, updated MAINTAINERS.md to match opensearch-project recommended format.'"
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

Copyright OpenSearch Contributors. See [NOTICE](NOTICE.txt) for details.