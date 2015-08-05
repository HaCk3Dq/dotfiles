#!/usr/bin/python
import os

green  = "%{[32m%}"
red    = "%{[31m%}"
branchIcon = "⎇"

def run(cmd):
  return os.popen(cmd).read()

def RepoExists():
  return os.path.exists(".git")

def branchName():
  return run("git branch")[1:-1]

def newFiles():
  if "not staged" in run("git status") or "Untracked" in run("git status"): return red + " +"
  else: return ""


if RepoExists():
  prompt = " " + green + branchIcon + branchName() + newFiles()
else:
  prompt = ""

print(prompt)