#!/bin/sh
set -e

PREFIX="fermayo/"

for D in *; do
  if [ -d "${D}" ]; then
    cd ${D}
    for F in *; do
      if [ "${F}" = "Dockerfile" ]; then
        TAG="latest"
      else
        TAG="${F:11}"
      fi
      echo "Building ${PREFIX}${D}:${TAG}"
      docker build --pull -t ${PREFIX}${D}:${TAG} -f ${F} .
      # docker push ${PREFIX}${D}:${TAG}
    done
    cd ..
  fi
done
