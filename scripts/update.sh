#!/bin/bash

for repo in `gh repo list -L 100 --public opensearch-project | cut -f1 | cut -d/ -f2 | sort -f` 
do
    if [ ! -d $repo ]; then
        git clone --depth 1 https://github.com/opensearch-project/$repo.git
    fi
done

for repo in `gh repo list -L 100 --public opensearch-project | cut -f1 | cut -d/ -f2 | sort -f` 
do
    echo ⌛ Checking $repo ...
    meta project import $repo git@github.com:opensearch-project/$repo.git
done