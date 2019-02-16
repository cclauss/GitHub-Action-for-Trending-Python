workflow "on push" {
  on = "push"
  resolves = ["Trending Python Syntax Checker"]
}

action "Trending Python Syntax Checker" {
  uses = "cclauss/GitHub-Action-for-Trending-Python@master"
}
