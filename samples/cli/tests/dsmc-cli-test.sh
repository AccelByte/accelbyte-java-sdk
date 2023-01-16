#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..69"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListConfig
./ng net.accelbyte.sdk.cli.Main dsmc listConfig \
    > test.out 2>&1
eval_tap $? 2 'ListConfig' test.out

#- 3 SaveConfig
eval_tap 0 3 'SaveConfig # SKIP deprecated' test.out

#- 4 UpdateImage
./ng net.accelbyte.sdk.cli.Main dsmc updateImage \
    --body '{"artifactPath": "hthy6Uxp", "image": "nYyHjOP6", "namespace": "hVV8N2z5", "persistent": true, "version": "dWkl9BGE"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "hsOeBQaE", "dockerPath": "PH7u7nms", "image": "rXdKIQZK", "imageSize": 47, "namespace": "Yo5nb4R5", "persistent": false, "version": "qgLO5xji"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "a9tEFEBh", "dockerPath": "nahxwpOX", "image": "f1GpMLi7", "imageSize": 17, "namespace": "shTigG3e", "patchVersion": "gE4gDenX", "persistent": false, "version": "JZAFr4fQ"}' \
    > test.out 2>&1
eval_tap $? 7 'CreateImagePatch' test.out

#- 8 GetLowestInstanceSpec
./ng net.accelbyte.sdk.cli.Main dsmc getLowestInstanceSpec \
    > test.out 2>&1
eval_tap $? 8 'GetLowestInstanceSpec' test.out

#- 9 GetConfig
./ng net.accelbyte.sdk.cli.Main dsmc getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'GetConfig' test.out

#- 10 CreateConfig
./ng net.accelbyte.sdk.cli.Main dsmc createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 46, "creation_timeout": 77, "default_version": "uf1LshKd", "port": 43, "ports": {"qpBzzR8d": 73, "K7G0Owny": 4, "0Xoh1JDo": 67}, "protocol": "MhJJsHfY", "providers": ["ZiPLb2Jd", "P2ugFYiq", "oOqXPQWE"], "session_timeout": 66, "unreachable_timeout": 86}' \
    > test.out 2>&1
eval_tap $? 10 'CreateConfig' test.out

#- 11 DeleteConfig
./ng net.accelbyte.sdk.cli.Main dsmc deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteConfig' test.out

#- 12 UpdateConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 81, "creation_timeout": 4, "default_version": "WTh4dp7L", "port": 83, "protocol": "ZRJk4Ap8", "providers": ["UnzVDuHM", "utGduWG5", "mbIdNCey"], "session_timeout": 23, "unreachable_timeout": 50}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateConfig' test.out

#- 13 ClearCache
./ng net.accelbyte.sdk.cli.Main dsmc clearCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'ClearCache' test.out

#- 14 GetAllDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeployment \
    --namespace "$AB_NAMESPACE" \
    --name 'MiVZT9gc' \
    --count '38' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'xFeIyPak' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment '83CPe8kZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 68, "buffer_percent": 42, "configuration": "KqUJxJHV", "enable_region_overrides": true, "game_version": "xLE9nqmx", "max_count": 59, "min_count": 57, "overrides": {"134olTsM": {"buffer_count": 52, "buffer_percent": 70, "configuration": "JmyXjv4a", "enable_region_overrides": true, "game_version": "fmW1v665", "max_count": 20, "min_count": 84, "name": "yXAN40VC", "region_overrides": {"WelAbt4C": {"buffer_count": 15, "buffer_percent": 19, "max_count": 55, "min_count": 9, "name": "lhEHiuzJ", "unlimited": true, "use_buffer_percent": false}, "GB3z5IEa": {"buffer_count": 21, "buffer_percent": 85, "max_count": 16, "min_count": 60, "name": "rpGcN19Z", "unlimited": false, "use_buffer_percent": true}, "hFiZhT7I": {"buffer_count": 99, "buffer_percent": 14, "max_count": 10, "min_count": 94, "name": "xtm9iykp", "unlimited": true, "use_buffer_percent": false}}, "regions": ["CuAi7cuL", "AgFpHul8", "X1dXRmWE"], "session_timeout": 21, "unlimited": false, "use_buffer_percent": false}, "YTNa72bu": {"buffer_count": 93, "buffer_percent": 62, "configuration": "NWbrrYVU", "enable_region_overrides": false, "game_version": "tJG9CwjM", "max_count": 60, "min_count": 54, "name": "sfIFNW6T", "region_overrides": {"Bw0iGoij": {"buffer_count": 29, "buffer_percent": 71, "max_count": 26, "min_count": 10, "name": "1B3PQc8B", "unlimited": false, "use_buffer_percent": false}, "EfNyNiHl": {"buffer_count": 70, "buffer_percent": 51, "max_count": 81, "min_count": 39, "name": "PpCEKwZW", "unlimited": false, "use_buffer_percent": true}, "bGVmBWTV": {"buffer_count": 73, "buffer_percent": 40, "max_count": 81, "min_count": 76, "name": "WqFkyjFg", "unlimited": true, "use_buffer_percent": true}}, "regions": ["SePn26UV", "9k7cEeyD", "BqIXcbne"], "session_timeout": 67, "unlimited": false, "use_buffer_percent": false}, "tCDWHD6a": {"buffer_count": 29, "buffer_percent": 87, "configuration": "I5nHSXW0", "enable_region_overrides": false, "game_version": "qhfiBtzM", "max_count": 64, "min_count": 22, "name": "n4C2wbWj", "region_overrides": {"3iXo7YEB": {"buffer_count": 15, "buffer_percent": 0, "max_count": 57, "min_count": 66, "name": "UERun4ll", "unlimited": true, "use_buffer_percent": true}, "exzBTNcP": {"buffer_count": 71, "buffer_percent": 7, "max_count": 91, "min_count": 81, "name": "Kd90qzOJ", "unlimited": true, "use_buffer_percent": false}, "tbueALd6": {"buffer_count": 41, "buffer_percent": 39, "max_count": 50, "min_count": 99, "name": "eSBZ86z9", "unlimited": false, "use_buffer_percent": true}}, "regions": ["Eyr3NfB9", "lDKCIclN", "eFpahEGE"], "session_timeout": 44, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"u776cnQm": {"buffer_count": 83, "buffer_percent": 83, "max_count": 13, "min_count": 73, "name": "XzFH72wP", "unlimited": true, "use_buffer_percent": false}, "VUCTDH2H": {"buffer_count": 61, "buffer_percent": 9, "max_count": 42, "min_count": 98, "name": "2vnxRN8z", "unlimited": true, "use_buffer_percent": true}, "HqMnKZng": {"buffer_count": 37, "buffer_percent": 22, "max_count": 49, "min_count": 57, "name": "UNPhR0yk", "unlimited": false, "use_buffer_percent": true}}, "regions": ["lFSoN7je", "GkFb1mkA", "l8rr2ouJ"], "session_timeout": 57, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'j6WDTLaC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'TQHrv0tj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 83, "buffer_percent": 14, "configuration": "cRAR9fMc", "enable_region_overrides": true, "game_version": "rokEzpCh", "max_count": 83, "min_count": 48, "regions": ["lfBdhhCW", "IbH0Nn8M", "Hnr1X1fG"], "session_timeout": 68, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'tlxzikYB' \
    --namespace "$AB_NAMESPACE" \
    --region 'DuB85OJP' \
    --body '{"buffer_count": 17, "buffer_percent": 24, "max_count": 21, "min_count": 38, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'a6wrW09M' \
    --namespace "$AB_NAMESPACE" \
    --region '2yZPjcYU' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'VDI8lTlI' \
    --namespace "$AB_NAMESPACE" \
    --region 'AYmhPdF0' \
    --body '{"buffer_count": 1, "buffer_percent": 43, "max_count": 23, "min_count": 91, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'iZO2KOOS' \
    --namespace "$AB_NAMESPACE" \
    --version 'aqlivYsl' \
    --body '{"buffer_count": 14, "buffer_percent": 37, "configuration": "u7M7Qhgx", "enable_region_overrides": true, "game_version": "gqClND5p", "max_count": 22, "min_count": 63, "region_overrides": {"SbqC7etD": {"buffer_count": 91, "buffer_percent": 37, "max_count": 2, "min_count": 73, "name": "WvsuZVCX", "unlimited": true, "use_buffer_percent": true}, "AJGtHX2S": {"buffer_count": 42, "buffer_percent": 8, "max_count": 81, "min_count": 66, "name": "tPoBUdoP", "unlimited": true, "use_buffer_percent": false}, "aejglBh3": {"buffer_count": 55, "buffer_percent": 24, "max_count": 71, "min_count": 95, "name": "8GedDRj2", "unlimited": false, "use_buffer_percent": false}}, "regions": ["bvBkkxIV", "oDomudRQ", "oALku1OQ"], "session_timeout": 31, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'LKs4OdwJ' \
    --namespace "$AB_NAMESPACE" \
    --version 'h7rVjllH' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'viHFVYj6' \
    --namespace "$AB_NAMESPACE" \
    --version 'uhjl4cm0' \
    --body '{"buffer_count": 38, "buffer_percent": 39, "configuration": "aSw3f0N8", "enable_region_overrides": true, "game_version": "ztVyogwL", "max_count": 99, "min_count": 12, "regions": ["lyqF2tZl", "CFXU8LfR", "tnTbWQiw"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'NCTKB1Ma' \
    --namespace "$AB_NAMESPACE" \
    --region 'VX45UbBF' \
    --version 'NxXm3dys' \
    --body '{"buffer_count": 21, "buffer_percent": 65, "max_count": 14, "min_count": 56, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'qiVCXTPX' \
    --namespace "$AB_NAMESPACE" \
    --region 'sat7INNM' \
    --version 'iXs7mBa8' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '7iRDZRkb' \
    --namespace "$AB_NAMESPACE" \
    --region 'mn4GnceC' \
    --version 'yXXAW27m' \
    --body '{"buffer_count": 87, "buffer_percent": 73, "max_count": 71, "min_count": 80, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '2' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'tYEK0wgi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'nM3URLLj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 18, "mem_limit": 36, "params": "TjIOL2TX"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'awEd6Dk6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'cdp8NaC1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 24, "mem_limit": 0, "name": "WOtQVaKz", "params": "B6ZZYYHB"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'mXPrJJ7x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 31}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'xglNmMnF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'FqN1k5ub' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "9HS7R6Hm", "port": 53}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'fVdpB0B5' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '62' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'LoayMpQ0' \
    --version '7VUaqXMZ' \
    > test.out 2>&1
eval_tap $? 37 'DeleteImage' test.out

#- 38 ExportImages
./ng net.accelbyte.sdk.cli.Main dsmc exportImages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'ExportImages' test.out

#- 39 GetImageLimit
./ng net.accelbyte.sdk.cli.Main dsmc getImageLimit \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetImageLimit' test.out

#- 40 DeleteImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc deleteImagePatch \
    --namespace "$AB_NAMESPACE" \
    --imageURI '1QhtuGEF' \
    --version 'mELcHk3g' \
    --versionPatch 'ArMPlmyo' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'bETHwano' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '46AKDeP3' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'UKSUoUAZ' \
    --versionPatch 'A2vAauAq' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'aLOg2xcE' \
    --count '53' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 44 'ListServer' test.out

#- 45 CountServer
./ng net.accelbyte.sdk.cli.Main dsmc countServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'CountServer' test.out

#- 46 CountServerDetailed
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailed \
    --namespace "$AB_NAMESPACE" \
    --region 'JxAW5uei' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name '9xWRDkO9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'CaHjmBX5' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'Vu0O5Zlx' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'TN58ShHY' \
    --withServer  \
    --count '94' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Pd157wdV' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'hgbE1zxQ' \
    > test.out 2>&1
eval_tap $? 53 'DeleteSession' test.out

#- 54 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'ExportConfigV1' test.out

#- 55 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 55 'ImportConfigV1' test.out

#- 56 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'ImageLimitClient' test.out

#- 57 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'PAwvoTNz' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EjGTyBl1"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ChwuKXkP", "ip": "mov2kmru", "name": "aEyHlefz", "port": 32}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "Uzx9uPAG", "pod_name": "rZqV1m0y"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "YHfDPFW3"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'kY8czpGU' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "0nxfvXNu", "configuration": "pBiVvytm", "deployment": "QWvzKbAZ", "game_mode": "4XUvwhxz", "matching_allies": [{"matching_parties": [{"party_attributes": {"ty9QMFqo": {}, "lQphbRXg": {}, "0Oq2nT4V": {}}, "party_id": "tylPSEvD", "party_members": [{"user_id": "qNEBzhVT"}, {"user_id": "ylCULlzL"}, {"user_id": "O4b9Emyb"}]}, {"party_attributes": {"sclblbfL": {}, "z3ZpA1pR": {}, "yF8PqRx7": {}}, "party_id": "RSycxfjG", "party_members": [{"user_id": "3JR5yKQy"}, {"user_id": "8EKOYS3V"}, {"user_id": "IZZzftvy"}]}, {"party_attributes": {"3aHmJGlq": {}, "9R7NAOg3": {}, "Ee617u5d": {}}, "party_id": "FyvQSgS8", "party_members": [{"user_id": "fxXpbXnl"}, {"user_id": "KuCgmEgi"}, {"user_id": "fW7H59Yr"}]}]}, {"matching_parties": [{"party_attributes": {"ybvIlwdy": {}, "h4VWYMgA": {}, "up53IvZU": {}}, "party_id": "oLpVe8Rj", "party_members": [{"user_id": "xlu0kgwh"}, {"user_id": "nwk3tQyA"}, {"user_id": "ZRuiNvhi"}]}, {"party_attributes": {"ZWc0meo0": {}, "bE7uC2Ci": {}, "PVaPVW6J": {}}, "party_id": "bsszS2WA", "party_members": [{"user_id": "XY5HZlsM"}, {"user_id": "jaQpmkJ5"}, {"user_id": "ihcoDZd6"}]}, {"party_attributes": {"JZmYobr2": {}, "otFDxAy7": {}, "lj60rypP": {}}, "party_id": "dpwheaQv", "party_members": [{"user_id": "dHVy52ln"}, {"user_id": "YOAC8MaW"}, {"user_id": "BWoRobYG"}]}]}, {"matching_parties": [{"party_attributes": {"Vqaiy4Pa": {}, "n5mtl3ZC": {}, "Gvv5DTWZ": {}}, "party_id": "TiXJs2Tg", "party_members": [{"user_id": "qJn72FZN"}, {"user_id": "Z2r8mRUL"}, {"user_id": "igAwTXHy"}]}, {"party_attributes": {"fGgAr4rw": {}, "blbOhh7b": {}, "DqVyARIM": {}}, "party_id": "9ZFYmWc3", "party_members": [{"user_id": "dX4EowJ9"}, {"user_id": "xfhap89c"}, {"user_id": "i5PsEYFq"}]}, {"party_attributes": {"3FOtEhwT": {}, "bxxij4OA": {}, "KBSb8Q9j": {}}, "party_id": "51ZtkBME", "party_members": [{"user_id": "9qJClM6q"}, {"user_id": "i8sYuKPW"}, {"user_id": "dplN0biq"}]}]}], "namespace": "9a24dVXw", "notification_payload": {}, "pod_name": "0vrrSCeH", "region": "cqnCsFSH", "session_id": "q8lbHu3s"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "bTiyo75u"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'rjbsQmZh' \
    > test.out 2>&1
eval_tap $? 65 'GetSession' test.out

#- 66 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 66 'GetDefaultProvider' test.out

#- 67 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 67 'ListProviders' test.out

#- 68 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region 'UXOatrH3' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE