#!/bin/bash
git status &>/dev/null
if [ $? == 128 ]; then
  echo "fatal: `pwd` Not a git repository (or any of the parent directories): .git"
  exit;
fi
echo "======================================================================================="
echo "Your Current Directory is:    $PWD"
echo "Your Current Branch is:       `git status  | head -n1 | awk '{print $3}'`"
echo -e "\n============================================================================"
echo -e "New Files added:                     \n`git ls-files --others --exclude-standard`"
echo -e "\n============================================================================"
echo -e "Modified files:                      \n`git status |grep modified`"
echo -e "\n============================================================================"
chdir=$PWD
cd $chdir
branch=`git status  | head -n1 | awk '{print $3}'`
if [ "$branch" == "master" ]; then
  echo "Warning: You cannot write to master branch, please switch to your branch and then run this script again"
  exit 1
fi
if [ "$#" -eq 0 ]
then
                echo "please add commit message before pushing"
    exit 1
fi
commit_message="$1"
for i in $(git ls-files --others --exclude-standard); do
  if [ "$i" == " " ]; then
    echo "no files to add, no changes detected"
    exit 1
  fi
  git add $i
done
git commit -am "$commit_message"
if [ $? == 0 ]; then
  echo -e "\n\n"
  echo "Commit: '"$commit_message"' Commit Done..."
  echo -e "\n\n"
else
  echo "failed to commit"
  exit 1
fi
git push origin $branch
if [ $? == "0" ]; then
  echo -e "\n\n"
  echo "$branch pushed to remote repository. Done.."
else
  echo "failed to push on the remote system"
fi
echo -e "======================================================================================="
