#!/usr/bin/env bash

userName=$2
repoName=$3
usage="$(basename "$0")"

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "" ]; then
  echo "$usage -a  [ username ] [ repoName ]\t --create GitHub & local repo(must input all argument)"
  echo "$usage -as [ username ] [ repoName ]\t --add remote with ssh link"
  exit
elif [ "$1" = "-a" ] || [ "$1" = "-as" ]; then
  curl -i -u "$userName" https://api.github.com/user/repos -d" {\"name\":\"$repoName\"}"
  mkdir $repoName
  cd $repoName
  git init
  if [ "$1" = "-as" ] ; then
    #for ssh
    git remote add origin git@github.com:$userName/$repoName.git
    echo "## successfully create $repoName remote with ssh" >> README.md
  elif [[ condition ]]; then
    #for  http
    git remote add origin https://github.com/$userName/$repoName.git
    echo "## successfully create $repoName remote with https" >> README.md
  fi
  git add README.md
  git commit -m "added README.md"
  git push -u origin master
  clear
  ls | grep $repoName
  echo "create $repoName repository in GitHub and local project"
  echo "Happy working."
fi
