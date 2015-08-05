#!/usr/bin/python
import os

green  = "%{[32m%}"
red    = "%{[31m%}"
branchIcon = "⎇"

def run(cmd):
  return os.popen(cmd).read()

def repoExists():
  return os.path.exists(".git")

def branchName(status):
  return " " + status[10:status.find("\n")]

def newFiles(status):
  if "not staged" in status or "Untracked" in status: return red + " +"
  else: return ""


if repoExists():
  status = run("git status")
  prompt = " " + green + branchIcon + branchName(status) + newFiles(status)
else:
  prompt = ""

print(prompt)