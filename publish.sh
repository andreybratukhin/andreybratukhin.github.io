#!/bin/bash

hugo
git add --all && git commit -m "Save sources"
cd public && git add --all && git commit -m "Publish content" && cd ..
