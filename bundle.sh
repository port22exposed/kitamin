#!/bin/bash

trap 'kill $(jobs -p) 2>/dev/null' EXIT

mkdir -p dist
mkdir -p dist/server

darklua process --watch src/MainModule/init.luau dist &
darklua process --watch src/server/init.server.luau dist/server/init.server.luau &
darklua process --watch src/client/init.client.luau dist/server/client.client.luau &

wait
