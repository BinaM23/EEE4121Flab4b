#!/bin/bash

echo "Setting up router"

make run

make stop

echo "stopping router and cleaning network"

make clean

echo "Done"
