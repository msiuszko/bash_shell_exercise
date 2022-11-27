#!/bin/bash
# Tests whether a network socket is open

port=${1:-22}
ip=${2:-127.0.0.1}
protocol=${3:-tcp}

: < /dev/${protocol}/${ip}/${port}
