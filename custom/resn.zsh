resn_list() {
  prefix=$1
  reply=( $(resn list $prefix) )
}

compctl -K resn_list resn
