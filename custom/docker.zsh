if command -v boot2docker > /dev/null; then
  # check its running?
  export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
  alias d=docker
else
  alias d="sudo docker"
fi


db() {
  sudo docker build -t "$1" .
}

dbb() {
  local name=$(basename $PWD)
  db blake/$name
}
