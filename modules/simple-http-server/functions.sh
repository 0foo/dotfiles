
function mutant-http-server() {
  # python -m SimpleHTTPServer
  docker run  \
    --rm \
    -it \
    -v $PWD:/data \
    -p 8080:8080 \
    simple-http-server
}