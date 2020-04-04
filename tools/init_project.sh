#
# I am using wsl to develop this image, so it is meant to be fairly
# compatibile between posix shells even if using Windows as docker host.
#

mkdir -p src

IS_OS_WSL=false
[ "$(grep Microsoft /proc/version)" ] && IS_OS_WSL=true

MOUNT_SOURCE_PATH="$(pwd)/src"
#
# wslpath is a wsl tool for transcribing paths between OSes
# on wsl you have to expose docker daemon on host OS
# (https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)
# and provided path has to be in host OS format
#
[ $IS_OS_WSL = true ] && MOUNT_SOURCE_PATH="$(wslpath -w $MOUNT_SOURCE_PATH)"

docker container run \
  --rm \
  --mount type=bind,source=$MOUNT_SOURCE_PATH,target=/code/app \
  -it \
  danielduel/react-native-dei-core:latest \
  /bin/sh -c "
    mkdir -p /code/app;\
    cd /code;\
    react-native init app .
  "
#
# Your app is called an "app"
#
