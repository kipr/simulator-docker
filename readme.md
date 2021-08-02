# simulator-docker

A meta-repository used for building a docker image of the simulator.

## Usage

```sh
git clone --recurse-submodules https://github.com/kipr/simulator-docker
cd simulator-docker
# If you don't have jq, you can just use export VERSION=latest
export VERSION=$(jq -r .version simulator/package.json)
docker build -t kipr/simulator:$VERSION .
docker run -d -p 3000:3000 kipr/simulator:$VERSION
```
