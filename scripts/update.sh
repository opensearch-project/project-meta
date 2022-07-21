#!/bin/bash

for repo in `gh repo list -L 100 --visibility=public opensearch-project --json name --jq '.[].name' | sort -f`
do
    if [ ! -d $repo ]; then
        git clone --depth 1 https://github.com/opensearch-project/$repo.git
    fi
done

for repo in `gh repo list -L 100 --visibility=public opensearch-project --json name --jq '.[].name' | sort -f`
do
    echo ⌛ Checking $repo ...
    meta project import $repo git@github.com:opensearch-project/$repo.git
done
