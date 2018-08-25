#!/bin/bash


yx() {
  rm -rf node_modules/ yarn.lock package-lock.json
  yarn install
  npm ls
}
