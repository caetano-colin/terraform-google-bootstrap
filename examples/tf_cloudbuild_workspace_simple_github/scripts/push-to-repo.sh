#!/usr/bin/env bash
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


set -ex

if [ "$#" -lt 3 ]; then
    >&2 echo "Not all expected arguments set."
    exit 1
fi

GITHUB_TOKEN=$1
REPO_URL=$2
TF_CONFIG_PATH=$3


# extract portion after https:// from URL
IFS="/"; mapfile -t -d / URL_PARTS < <(echo "$REPO_URL")
# construct the new authenticated URL
AUTH_REPO_URL="https://${GITHUB_TOKEN}:@${URL_PARTS[2]}/${URL_PARTS[3]}/${URL_PARTS[4]}"

tmp_dir=$(mktemp -d)
git clone "${AUTH_REPO_URL}" "${tmp_dir}"
cp -r "${TF_CONFIG_PATH}/." "${tmp_dir}"
pushd "${tmp_dir}"
git config init.defaultBranch main
git config user.email "terraform-robot@example.com"
git config user.name "TF Robot"
git checkout plan || git checkout -b plan
git add -A
git commit -m "init tf configs"
git push origin plan -f
sleep 60
git checkout main || git checkout -b main
git push origin main -f
sleep 120
