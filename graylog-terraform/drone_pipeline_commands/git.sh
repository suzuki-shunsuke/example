git status --porcelain || exit 1
if `git diff --exit-code --quiet terraform.tfstate`; then
  echo "terraform.tfstate isn't changed"
  exit 0
else
  git config user.name drone
  git config user.email drone@example.com
  git add . || exit 1
  git commit -m "build: commit by drone" || exit 1
  git push origin HEAD:master || exit 1
fi
