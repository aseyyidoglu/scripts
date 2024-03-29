# Reference: https://confluence.atlassian.com/bitbucketserver/basic-git-commands-776639767.html

# GET STARTED
# Configure git
git config --global user.name "Sam Smith"
git config --global user.email sam@example.com

# Check existing configuration
git config --list

# WORKING WITH REMOTE DIRECTORY
# Make a copy of remote
git clone /path/to/repository
git clone username@host:/path/to/repository

# Connect to remote respository and fetch
git remote add origin git@github.com:USERNAME/REPOSITORY.git
git fetch origin REMOTE_BRANCH
git merge origin/main #this could be: origin/master

# List remote repositories
git remote -v

# Check current branches
git branch -r # for remote
git branch  # for local

# Overwrite your local files
git fetch --all
git reset --hard origin/master
