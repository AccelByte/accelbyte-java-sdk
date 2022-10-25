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
    --body '{"artifactPath": "c6RwtQFf", "image": "wEFXqEqg", "namespace": "cT6MBUzV", "persistent": false, "version": "xWJUyev5"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "UULE1wUx", "dockerPath": "KQJkASzj", "image": "ANdYcvWU", "imageSize": 81, "namespace": "hovhqmR1", "persistent": false, "version": "WZTOYdAF"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "A7MajF4u", "dockerPath": "ggZc8Lu9", "image": "e0xeIb9L", "imageSize": 57, "namespace": "3CKxEyaP", "patchVersion": "FkXfhVzF", "persistent": false, "version": "HYhAv2OD"}' \
    > test.out 2>&1
eval_tap $? 7 'CreateImagePatch' test.out

#- 8 GetConfig
./ng net.accelbyte.sdk.cli.Main dsmc getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'GetConfig' test.out

#- 9 CreateConfig
./ng net.accelbyte.sdk.cli.Main dsmc createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 87, "creation_timeout": 94, "default_version": "3PqcSLN3", "port": 33, "ports": {"WL4xLI9O": 66, "CvuPBWfX": 25, "XiEUl5m5": 28}, "protocol": "QfrXtjLZ", "providers": ["uZEDvqJW", "G1eEwMZS", "WGcUnaSH"], "session_timeout": 51, "unreachable_timeout": 88}' \
    > test.out 2>&1
eval_tap $? 9 'CreateConfig' test.out

#- 10 DeleteConfig
./ng net.accelbyte.sdk.cli.Main dsmc deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'DeleteConfig' test.out

#- 11 UpdateConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 51, "creation_timeout": 59, "default_version": "MeXLE0wu", "port": 79, "protocol": "TH6XZ0F2", "providers": ["lTfIDq0Y", "Qy39CeeM", "uOC4JMe8"], "session_timeout": 69, "unreachable_timeout": 78}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateConfig' test.out

#- 12 ClearCache
./ng net.accelbyte.sdk.cli.Main dsmc clearCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ClearCache' test.out

#- 13 GetAllDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeployment \
    --namespace "$AB_NAMESPACE" \
    --name 'DyKGOuGq' \
    --count '36' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'ly67aMAN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Tu8XTVHy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 53, "buffer_percent": 63, "configuration": "5GHiaSIy", "enable_region_overrides": false, "game_version": "mBQegpcx", "max_count": 41, "min_count": 29, "overrides": {"v4Qn21Oz": {"buffer_count": 16, "buffer_percent": 78, "configuration": "rC2dZ4cG", "enable_region_overrides": false, "game_version": "Vo2EE7eR", "max_count": 16, "min_count": 25, "name": "jMgJaHcE", "region_overrides": {"XJ4CCwfo": {"buffer_count": 57, "buffer_percent": 2, "max_count": 13, "min_count": 36, "name": "XYk8JSpg", "unlimited": true, "use_buffer_percent": true}, "a9Rb97Ra": {"buffer_count": 79, "buffer_percent": 36, "max_count": 14, "min_count": 23, "name": "8IXA7d0R", "unlimited": false, "use_buffer_percent": false}, "83qYr7ZF": {"buffer_count": 35, "buffer_percent": 62, "max_count": 69, "min_count": 85, "name": "vxoKe6oW", "unlimited": false, "use_buffer_percent": false}}, "regions": ["46j5t11n", "BJga9LdF", "PN0fSdVW"], "session_timeout": 25, "unlimited": false, "use_buffer_percent": false}, "zAmDnf9l": {"buffer_count": 77, "buffer_percent": 36, "configuration": "oz8EriGJ", "enable_region_overrides": false, "game_version": "wjlGgJfd", "max_count": 40, "min_count": 82, "name": "n37cvFIK", "region_overrides": {"f5o5UMDz": {"buffer_count": 72, "buffer_percent": 27, "max_count": 92, "min_count": 56, "name": "vXnnQlIg", "unlimited": true, "use_buffer_percent": false}, "WdXp3T9X": {"buffer_count": 28, "buffer_percent": 64, "max_count": 24, "min_count": 27, "name": "Hhyq60uc", "unlimited": true, "use_buffer_percent": false}, "sArn2lA8": {"buffer_count": 40, "buffer_percent": 33, "max_count": 52, "min_count": 77, "name": "dYu97oZc", "unlimited": false, "use_buffer_percent": true}}, "regions": ["WpqR511R", "n3zHKJ58", "sVOwMCIm"], "session_timeout": 31, "unlimited": false, "use_buffer_percent": false}, "Nh6JIgFv": {"buffer_count": 1, "buffer_percent": 81, "configuration": "FiFJkY9n", "enable_region_overrides": true, "game_version": "zMKxJJPb", "max_count": 4, "min_count": 39, "name": "D0oTJITC", "region_overrides": {"8BlJjxRq": {"buffer_count": 67, "buffer_percent": 44, "max_count": 15, "min_count": 44, "name": "S4VvEu58", "unlimited": false, "use_buffer_percent": false}, "sMyYJ8jZ": {"buffer_count": 80, "buffer_percent": 64, "max_count": 66, "min_count": 14, "name": "LHNCmc72", "unlimited": false, "use_buffer_percent": false}, "PMT5nWa7": {"buffer_count": 79, "buffer_percent": 66, "max_count": 52, "min_count": 54, "name": "4Yptoyur", "unlimited": false, "use_buffer_percent": false}}, "regions": ["PA1CAUF3", "IFyh6XBh", "Jl331iQv"], "session_timeout": 54, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"gwDTnD8J": {"buffer_count": 65, "buffer_percent": 44, "max_count": 22, "min_count": 7, "name": "C2FG7fLt", "unlimited": false, "use_buffer_percent": false}, "gqUL7xGc": {"buffer_count": 84, "buffer_percent": 4, "max_count": 16, "min_count": 29, "name": "INskUV8E", "unlimited": true, "use_buffer_percent": false}, "l8Upk89P": {"buffer_count": 9, "buffer_percent": 22, "max_count": 79, "min_count": 78, "name": "VQTYiStY", "unlimited": false, "use_buffer_percent": true}}, "regions": ["jWCnZ4B3", "9S3w9pXv", "ZJ9CsD0L"], "session_timeout": 75, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'zSjBksBL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'wOD2s9gA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 1, "buffer_percent": 23, "configuration": "rWl8YPtr", "enable_region_overrides": true, "game_version": "EbNqO5Ax", "max_count": 47, "min_count": 59, "regions": ["4gYsLw50", "hFoDi5o7", "Ls5uEl2m"], "session_timeout": 4, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'Ba3I83Gv' \
    --namespace "$AB_NAMESPACE" \
    --region 'hmQLYLqs' \
    --body '{"buffer_count": 16, "buffer_percent": 15, "max_count": 32, "min_count": 99, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'oTEiX1EI' \
    --namespace "$AB_NAMESPACE" \
    --region 'aNeuGCSI' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'Rsd8vGN0' \
    --namespace "$AB_NAMESPACE" \
    --region 'vF02mh7H' \
    --body '{"buffer_count": 98, "buffer_percent": 16, "max_count": 91, "min_count": 88, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'FXwZC4aA' \
    --namespace "$AB_NAMESPACE" \
    --version 'QNseXEME' \
    --body '{"buffer_count": 66, "buffer_percent": 36, "configuration": "G6YFKPtW", "enable_region_overrides": true, "game_version": "hhAoZBi8", "max_count": 23, "min_count": 39, "region_overrides": {"pzETMvEY": {"buffer_count": 69, "buffer_percent": 9, "max_count": 16, "min_count": 94, "name": "BZqasJC7", "unlimited": false, "use_buffer_percent": false}, "53hN35pC": {"buffer_count": 36, "buffer_percent": 78, "max_count": 10, "min_count": 56, "name": "uqxC2NYF", "unlimited": true, "use_buffer_percent": false}, "emQX75LA": {"buffer_count": 89, "buffer_percent": 38, "max_count": 91, "min_count": 56, "name": "qj8XVwkk", "unlimited": true, "use_buffer_percent": false}}, "regions": ["muUWUUi3", "VkGBwpve", "BB8EXeUh"], "session_timeout": 67, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'EE5sXKyB' \
    --namespace "$AB_NAMESPACE" \
    --version 'TP9jgfHQ' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'pDtnq932' \
    --namespace "$AB_NAMESPACE" \
    --version '6XyqvyVX' \
    --body '{"buffer_count": 59, "buffer_percent": 99, "configuration": "Jdp4L8UZ", "enable_region_overrides": true, "game_version": "U0NQVlA9", "max_count": 95, "min_count": 86, "regions": ["vtGSWxns", "DmwtUG5K", "leo5Gbfg"], "session_timeout": 88, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment '3CrjJ8tz' \
    --namespace "$AB_NAMESPACE" \
    --region 'CXKS0juW' \
    --version 'lWRK7HdS' \
    --body '{"buffer_count": 88, "buffer_percent": 62, "max_count": 8, "min_count": 4, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'mQcMmsMD' \
    --namespace "$AB_NAMESPACE" \
    --region 'xC4FOJnn' \
    --version '2rnhf0jk' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'uepNU92I' \
    --namespace "$AB_NAMESPACE" \
    --region '1w2ZavLE' \
    --version 'SblN2g5t' \
    --body '{"buffer_count": 21, "buffer_percent": 77, "max_count": 69, "min_count": 99, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '6' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'SCrlDYn8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'F9wc9l6Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 21, "mem_limit": 96, "params": "lDpMutda"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'zAs6BZO3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '5eE1vTT2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 4, "mem_limit": 36, "name": "dj15RuSX", "params": "k8VPJGii"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'ULj4VE84' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 92}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'OBMfgBHs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'OrK1OYIc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "MhH7JDmx", "port": 26}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'lGw2CGY0' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '22' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'TWftSIEB' \
    --version 'k6fz3KKJ' \
    > test.out 2>&1
eval_tap $? 36 'DeleteImage' test.out

#- 37 ExportImages
./ng net.accelbyte.sdk.cli.Main dsmc exportImages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'ExportImages' test.out

#- 38 GetImageLimit
./ng net.accelbyte.sdk.cli.Main dsmc getImageLimit \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'GetImageLimit' test.out

#- 39 DeleteImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc deleteImagePatch \
    --namespace "$AB_NAMESPACE" \
    --imageURI '4qzYoN4p' \
    --version '8S2tOEuM' \
    --versionPatch 'oiKuVoIS' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version '1xkoKPaN' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'TV7k9xAM' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'Rv6GjJ4f' \
    --versionPatch '6VpyqcKL' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region '4OCl4GMC' \
    --count '19' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 43 'ListServer' test.out

#- 44 CountServer
./ng net.accelbyte.sdk.cli.Main dsmc countServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'CountServer' test.out

#- 45 CountServerDetailed
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailed \
    --namespace "$AB_NAMESPACE" \
    --region 'iptfMVHk' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name '6Dhi6Exz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'EaXKymbX' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'e0p6m6Oe' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'IEdBY3Uv' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '1ck0aAKt' \
    --withServer  \
    --count '78' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Dfd3eTyU' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '06PxDoWI' \
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
    --version '9bp3ZwkW' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "GZJUh9lL"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "XoxnD559", "ip": "p570PVnE", "name": "9oU3iXhO", "port": 23}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "wsIImzob", "pod_name": "6w6tovmS"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "Mcf3vygc"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'w4n7MufL' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "BV49SSff", "configuration": "t9TKPrp9", "deployment": "P0Fuovo8", "game_mode": "5ybmaiRZ", "matching_allies": [{"matching_parties": [{"party_attributes": {"6joOGmA0": {}, "FhG2Cngf": {}, "Sc1x9i8b": {}}, "party_id": "MxEf9iI7", "party_members": [{"user_id": "YKEXbYb9"}, {"user_id": "Mxe3Lw0H"}, {"user_id": "cg5Kh5Sw"}]}, {"party_attributes": {"fh2zXCfd": {}, "WjVpOoug": {}, "Im5OOEKz": {}}, "party_id": "YHgdyHSo", "party_members": [{"user_id": "pwTCjTOe"}, {"user_id": "7Uw5n3wb"}, {"user_id": "HLVZR2dK"}]}, {"party_attributes": {"sgoU4MSZ": {}, "VtrZZiMu": {}, "AUXDgxNv": {}}, "party_id": "M8Dy9WCn", "party_members": [{"user_id": "j0wh7Td2"}, {"user_id": "54Q8SaDw"}, {"user_id": "tdxlIDaK"}]}]}, {"matching_parties": [{"party_attributes": {"jRCmi0gJ": {}, "B5jxp4Ua": {}, "dGL9eLPs": {}}, "party_id": "P2kcz9Fu", "party_members": [{"user_id": "jLzRPqZF"}, {"user_id": "j4gIgTne"}, {"user_id": "rFvretUR"}]}, {"party_attributes": {"RqSgzAUf": {}, "1g9xh1Dh": {}, "f3llCIPz": {}}, "party_id": "jrTFAAWu", "party_members": [{"user_id": "wBmuejOL"}, {"user_id": "5O03SHjy"}, {"user_id": "8jyG9ox1"}]}, {"party_attributes": {"W9V74GoQ": {}, "RqU1FPSA": {}, "46P6k7jr": {}}, "party_id": "C9Ba2Wh4", "party_members": [{"user_id": "H1i2J4gU"}, {"user_id": "XuXa4gzS"}, {"user_id": "SRHvq1mV"}]}]}, {"matching_parties": [{"party_attributes": {"0beMjRRW": {}, "sND8EW0e": {}, "LNZ8RfoG": {}}, "party_id": "Tl75t08L", "party_members": [{"user_id": "VTPSTtGj"}, {"user_id": "9Xn8eU2e"}, {"user_id": "zPgVenoh"}]}, {"party_attributes": {"HCL1metj": {}, "kodHrwQJ": {}, "EKfHH2Nh": {}}, "party_id": "30cx05k3", "party_members": [{"user_id": "lHDX2iRd"}, {"user_id": "bWqU6UbV"}, {"user_id": "6MJ5QbIQ"}]}, {"party_attributes": {"5tGmVZqW": {}, "ATimZp1s": {}, "9R5xeJ26": {}}, "party_id": "2FZmVAE7", "party_members": [{"user_id": "Z96pwlEO"}, {"user_id": "LBoFMgWv"}, {"user_id": "isXnrcTf"}]}]}], "namespace": "aM3Tw4Tf", "notification_payload": {}, "pod_name": "UIx623nc", "region": "X5xsu6my", "session_id": "cczH0AwA"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "leZqGPK9"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'NwST3Q04' \
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
    --region 'Dn6OvUN8' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE