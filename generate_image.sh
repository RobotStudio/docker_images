#!/bin/bash

[ "$1" == "" ] && { echo "Please provide path (ie-'ros/indigo/indigo-ros-core')" >&2; exit 1; }


dockfile="${1}/Dockerfile"
[ -f "$dockfile" ] || { echo "Dockerfile does not exist: $dockfile" >&2; exit 1; }

header="$(head -1 "${1}/Dockerfile")"
tag="${header##* }"
[ "$tag" == "" ] && { echo "Tag appears to be missing from $dockfile; header: $header" >&2; exit 1; }

docker build --pull=false -t "$tag" --file="${1}/Dockerfile" .

exit 0
