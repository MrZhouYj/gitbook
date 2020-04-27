read -p "please input commit message: "  msg

if [ -n "$msg" ]; then

  git add .
  git commit -m "$msg"
  git pull origin master
  git push
  git status

  if [ "$0" = 1 ]; then
    echo "ignore gh-pages"
    exit
  fi

  gitbook build
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

  read -p "open gitbook with Safari? (y/n):" isopen
  if [ "$isopen" = "y" ]; then
     open -a "/Applications/Safari.app" https://mrzhouyj.github.io/gitbook
  else
    exit
  fi

else
    echo "commit message is nil, cancled opertion"
    exit
fi
