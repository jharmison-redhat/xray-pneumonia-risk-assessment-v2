#!/bin/bash

set -ex

starttime=$(date)

cd "$(dirname "$(realpath "$0")")"

pushd training

if [ -d data/chest_xray ]; then
    mkdir -p data
    pushd data
    s3cmd get --host s3.jharmison.com --recursive s3://xray
    popd
fi

podman build . -t xray-training

podman run --rm -it -v ../model:/model:z xray-training

popd

model=$(find model -type f -newermt "$starttime")

cp -f "$model" risk-assessment/pneumonia_model.h5

pushd risk-assessment

podman build . -t risk-assessment

popd
