#!/bin/bash

yx() {
  rm -rf node_modules/
  yarn install
  npm ls
}
