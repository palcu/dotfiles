#!/bin/bash

repos=("thehole" "deploy" "puppet" "uberbot")
repo_path="/Users/alex/uberVU/"
exists=`git show-ref refs/heads/master`
no_stash_save="No local changes to save"

for repo in ${repos[*]}
do
    path=$repo_path$repo
    cd $path
    echo $path
    git sweep
done

