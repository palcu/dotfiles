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
    current_branch=$(git branch | awk '/^\*/{print $2}')
    if [ "$current_branch" == "master" ]; then
        git pull
    else
        stash_message=$(git stash)
        git checkout master
        git pull
        git checkout $current_branch
        if [ "$stash_message" != "$no_stash_save" ]; then
            git stash pop
        fi
    fi
done

