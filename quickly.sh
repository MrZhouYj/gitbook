echo "please input commit message:"
read msg

if [ -n "$msg" ]; then
  gitbook build
  git add .
  git commit -m "$msg"
  git pull origin master
  git push
  git status
  git checkout gh-pages

  rm -rf gitbook index.html rust_book search_index.json
  mv _book/* ./
  rm -rf _book/
  git status

  git add .
  git commit -m "$msg"
  git push origin gh-pages
  git status
  git checkout master

else
    echo "commit message is nil!!!!"
fi
