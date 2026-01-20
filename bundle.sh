#!/bin/bash

trap 'kill $(jobs -p) 2>/dev/null' EXIT

mkdir -p dist
mkdir -p dist/Server

darklua process --watch src/MainModule/init.luau dist &
darklua process --watch src/Server/init.server.luau dist/Server/init.server.luau &
darklua process --watch src/Client/init.client.luau dist/Server/Client.client.luau &

wait
