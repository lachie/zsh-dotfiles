function gupone() {
  echo gupping $1
  (
    cd ~/Blake/$1
    gup
  ) &
}
function gupms() {
  gupone caper-activities
  gupone caper
  gupone blake-data-source
  gupone blake-data-models
  gupone blake-common
  wait
  echo "done, bye"
}
