if [[ -n $(git status)  ]]
then
  echo $(git status)
  echo 'dirty'
else
  echo 'clean'
fi
