# Create a branch in first repo to pull the changes from second repo.
➜  repo1 git:(main) git checkout -b new_merger
Switched to a new branch 'new_merger'
➜  repo1 git:(new_merger) git remote add new_merger https://github.com/askumardev/repo2.git
➜  repo1 git:(new_merger) git pull new_merger master --allow-unrelated-histories

➜  repo1 git:(new_merger) git status
On branch new_merger
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
➜  repo1 git:(new_merger) ✗ git add .
➜  repo1 git:(new_merger) ✗ git commit -m "new merger branch"   
[new_merger 9b48e20] new merger branch
 1 file changed, 1 deletion(-)
➜  repo1 git:(new_merger) git push
fatal: The current branch new_merger has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin new_merger

➜  repo1 git:(new_merger) git push --set-upstream origin new_merger

# Create a PR and merge the new_merger branch into main
