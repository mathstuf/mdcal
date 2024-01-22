#!/bin/sh

set -e

readonly year="$1"
shift

readonly month="$1"
shift

python3 ./mdcal.py "$year" "$month" | \
    sed \
        -e "s,|\([1-9]\)|,|[0\1](journal/$year/$month/0\1)|,g" \
        -e "s,|\([1-9]\)|,|[0\1](journal/$year/$month/0\1)|,g" \
        -e "s,|\([1-9][0-9]\)|,|[\1](journal/$year/$month/\1)|,g" \
        -e "s,|\([1-9][0-9]\)|,|[\1](journal/$year/$month/\1)|,g"
