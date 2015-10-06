# MineDigger
MineDigger is a voxel game based on Minetest from celeron55. It aims to be a fun game and lightweight. New features will be added on an ongoing basis.

# Install on Debian GNU/Linux and Ubuntu.

First as root:
-------------

1) apt-get update
2) apt-get install -y build-essential git cmake libspatialindex-dev libhiredis-dev libsqlite3-dev libleveldb-dev libopenal-dev libvorbis-dev libfreetype6-dev libcurl4-openssl-dev libgmp-dev libirrlicht-dev libluajit-5.1-dev libogg-dev libpng++-dev libjpeg62-turbo-dev libjson-c-dev libjsoncpp-dev zlib1g-dev libbz2-dev libxxf86vm-dev libgl1-mesa-dev

Now as normal user:
-------------------

1) cd ~
2) git clone -b Unstable --depth=1 https://www.github.com/RegLnx/MineDigger.git
3) cd MineDigger
4) mkdir build && cd build
5) cmake ../ -DRUN_IN_PLACE=1 -DENABLE_SYSTEM_GMP=1 -DENABLE_SYSTEM_JSONCPP=1 -DENABLE_REDIS=1 -DENABLE_LUAJIT=1 -DENABLE_LEVELDB=1
6) make -j $(nproc)
7) cd ..
8) bin/MineDigger
