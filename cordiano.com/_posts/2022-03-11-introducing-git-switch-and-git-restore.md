---
layout: post
title: Introducing git switch and git restore
description: git switch and git restore are valid alternatives to the overused git checkout command
summary: git switch and git restore are valid alternatives to the overused git checkout command
date: "2022-03-11 09:07:58 +0100"
tags: [git]
---

When you work with Git using the command line, you know the `git checkout` command for sure.

`git checkout` command is the overused command, and it does many things. We mainly use `git checkout` to switch or create new branches and restore files in the working tree.

Let's see some examples of usages.

```
# switch to an existing branch
$ git checkout <existing_branch>

# create and switch to a new branch
$ git checkout -b <new_branch>
```

```
# restore filename.ext from the index
git checkout filename.ext
```

These two completely different purposes could lead to confusion, so Git developers have taken this into account.
In fact, Git 2.23 release [introduces](https://github.com/git/git/blob/master/Documentation/RelNotes/2.23.0.txt) the `git switch` and `git restore` commands.
It is clearer how to switch/create branches and restore files with two different commands.

**Disclaimer**: `git switch` and `git restore` are still marked as experimental on docs. Their behavior may change.

But let's go deeper with both commands.

## git switch in action

```
# switch to an existing branch
$ git switch <existing_branch>
```

```
# create and switch to a new branch
$ git switch -c <new_branch>
```

```
# switch to the previous branch
$ git switch -
```

## git restore in action

`git restore` is used to revert non-committed changes:

- changes in the working copy;
- content in the index (also called staging area).


```
# discard the local changes of filename1.ext and filename2.ext
git restore filename1.ext filename2.ext
```

```
# discard all local changes
git restore .
```

The restore command will take the contents from `HEAD` by default. You can change this behavior, as shown in the following example.

```
# restore filename.ext from the commit with hash 049c0bb432
git restore --source 049c0bb432 filename.ext

# restore filename.ext from 2 commits before 
# the current tip of the master branch
git restore --source master~2 filename.ext
```

You can restore the index and the working tree using the `--worktree` option.

```
$ git restore --worktree filename.ext
```

The last command does two things:

- revert your working copy to HEAD;
- unstage previously staged work.

That's all Folks!
