#!/usr/bin/env bash

expo_app_version=${!1}
useOldExpoCli=${!2}

git branch $expo_app_version
git checkout $expo_app_version
git pull origin $expo_app_version

if [ $useOldExpoCli ]; then
  npx install -g expo-cli -y
fi

npm install
npx expo prebuild --no-install

git add .
git commit -m "Prebuild $expo_app_version"
git push origin $expo_app_version
