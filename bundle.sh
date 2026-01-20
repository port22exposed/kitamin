#!/bin/bash

trap 'kill $(jobs -p) 2>/dev/null' EXIT

darklua process --watch src/MainModule/init.luau dist &
darklua process --watch src/Server/init.server.luau dist &
darklua process --watch src/Client/init.client.luau dist &

wait
