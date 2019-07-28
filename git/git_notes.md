# Git commands

* Forking a repo gives you a copy of that repo on your account.
* To get a copy of a repo on github, get the URL from the clone feature and use

`git clone <url of the repo from github>`

* Create a branch so you can make changes:

```bash
cd the_repo/
git checkout <your branch name>
```

* Committing your changes:

```bash
git add <file you changed>
git commit -m "Message about your changes"
```

* Pushing your changes to github:

`git push origin <your branch name>`

* Merging your branch into your local master branch:

```bash
git checkout master
git merge <your branch name>
```

* Deleting old branches:

```bash
git checkout <any branch not to be deleted>
git branch -d <branch to be deleted>
```

* Show all your branches (active branch is noted by an \*):

`git branch`
