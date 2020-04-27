read msg

if [ -n "$msg" ]; then
  gitbook build
  git add .
  git commit -m "$msg"
  git pull origin master
  git push
  git status
  git checkout gh-pages

else
    echo "commit message is nil!!!!"
fi
