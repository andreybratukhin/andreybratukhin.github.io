#!/bin/bash

hugo
git add --all && git commit -m "Save sources" && git push
cd public && git add --all && git commit -m "Publish content" && git push && cd ..
