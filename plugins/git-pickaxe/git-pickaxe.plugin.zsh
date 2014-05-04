function pickaxe() {
  git log --color=always -p -S"$1" $2 | less "+/$1" -R
}
