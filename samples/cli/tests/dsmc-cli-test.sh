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
echo "1..68"

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
    --body '{"artifactPath": "8V1zPtDb", "image": "cK0IaVjR", "namespace": "CMYSP4Vy", "persistent": true, "version": "kILqpDNu"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "7bUvnU5I", "dockerPath": "FyEpuSTd", "image": "f32n6Dvn", "imageSize": 59, "namespace": "c2N7B46x", "persistent": true, "version": "qWQ0BV29"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "GFO4kuWO", "dockerPath": "jdjNVBwf", "image": "LQjIQrZE", "imageSize": 89, "namespace": "m1LYaR6v", "patchVersion": "tmvUyWMh", "persistent": true, "version": "y2pGuvxI"}' \
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
    --body '{"claim_timeout": 52, "creation_timeout": 68, "default_version": "WKvBLjOC", "port": 40, "ports": {"Afm2BaPb": 34, "b5t5Sl7h": 11, "jCKHJM48": 73}, "protocol": "7DE9TSEo", "providers": ["eMKlXy0U", "6bFZlxHe", "vHT6WId4"], "session_timeout": 49, "unreachable_timeout": 83}' \
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
    --body '{"claim_timeout": 52, "creation_timeout": 87, "default_version": "a6EYYYIB", "port": 37, "protocol": "MVszZzKU", "providers": ["GNahhUJR", "CVQMUXjh", "CKlqFpC0"], "session_timeout": 69, "unreachable_timeout": 80}' \
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
    --name 'BlsinK7o' \
    --count '74' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'LgAbyCvE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'aXkeSdHc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 54, "buffer_percent": 14, "configuration": "PmQUml6l", "enable_region_overrides": false, "game_version": "noZ4OtvG", "max_count": 69, "min_count": 21, "overrides": {"rY5rOvLZ": {"buffer_count": 6, "buffer_percent": 7, "configuration": "MbbwpCu5", "enable_region_overrides": true, "game_version": "LZgHvuJK", "max_count": 71, "min_count": 62, "name": "gsCbGIb4", "region_overrides": {"dWw30O9T": {"buffer_count": 0, "buffer_percent": 36, "max_count": 67, "min_count": 37, "name": "4VTR5Sdc", "unlimited": false, "use_buffer_percent": false}, "8uegcB5f": {"buffer_count": 79, "buffer_percent": 47, "max_count": 83, "min_count": 78, "name": "ONuckzxa", "unlimited": false, "use_buffer_percent": true}, "jl6C2F09": {"buffer_count": 20, "buffer_percent": 59, "max_count": 41, "min_count": 31, "name": "1fFYKiNL", "unlimited": false, "use_buffer_percent": true}}, "regions": ["o4nIYFvn", "s9Lk6aZ0", "sqkMe1X3"], "session_timeout": 36, "unlimited": true, "use_buffer_percent": false}, "eddkNoVC": {"buffer_count": 82, "buffer_percent": 44, "configuration": "1OyYMT2u", "enable_region_overrides": true, "game_version": "NgsoRaRK", "max_count": 27, "min_count": 93, "name": "cAEMRMVd", "region_overrides": {"zidnNWOJ": {"buffer_count": 52, "buffer_percent": 38, "max_count": 62, "min_count": 26, "name": "yvN9R7MA", "unlimited": true, "use_buffer_percent": false}, "Ij4UTkvq": {"buffer_count": 97, "buffer_percent": 0, "max_count": 84, "min_count": 27, "name": "ZHDUEo9l", "unlimited": true, "use_buffer_percent": false}, "WEwoq15J": {"buffer_count": 29, "buffer_percent": 58, "max_count": 42, "min_count": 60, "name": "THqwOiHX", "unlimited": false, "use_buffer_percent": true}}, "regions": ["QbAXliqr", "C24UgpgD", "CoHpcbC3"], "session_timeout": 40, "unlimited": false, "use_buffer_percent": false}, "CcuSFl8R": {"buffer_count": 5, "buffer_percent": 75, "configuration": "PiKMHVXF", "enable_region_overrides": false, "game_version": "GkfimcnO", "max_count": 26, "min_count": 57, "name": "Vdwwlune", "region_overrides": {"pR3SXU0G": {"buffer_count": 82, "buffer_percent": 62, "max_count": 68, "min_count": 11, "name": "Fredl12w", "unlimited": true, "use_buffer_percent": true}, "ViEBEpZE": {"buffer_count": 67, "buffer_percent": 47, "max_count": 21, "min_count": 67, "name": "uWuTDVqu", "unlimited": false, "use_buffer_percent": false}, "3NhG6Hls": {"buffer_count": 93, "buffer_percent": 32, "max_count": 31, "min_count": 22, "name": "crGuhwpw", "unlimited": true, "use_buffer_percent": false}}, "regions": ["43uhKRzi", "0MzA7rok", "1A8tWjTH"], "session_timeout": 85, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"0LX2Gktj": {"buffer_count": 4, "buffer_percent": 44, "max_count": 15, "min_count": 48, "name": "K7aFNV97", "unlimited": false, "use_buffer_percent": true}, "ucrpI5K5": {"buffer_count": 32, "buffer_percent": 96, "max_count": 84, "min_count": 27, "name": "nE5ucyZ6", "unlimited": true, "use_buffer_percent": false}, "hoJIFyH0": {"buffer_count": 44, "buffer_percent": 99, "max_count": 93, "min_count": 25, "name": "B9plkZ4z", "unlimited": false, "use_buffer_percent": true}}, "regions": ["lKY4AcQS", "BmVLdHLO", "zN57IGVV"], "session_timeout": 54, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'OaqSzwRJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'UorzXJIV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 8, "buffer_percent": 51, "configuration": "yuNDNJiV", "enable_region_overrides": false, "game_version": "fZaRrSZm", "max_count": 62, "min_count": 18, "regions": ["WwjyHT0Y", "BD86vco5", "hLSRWPR6"], "session_timeout": 83, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'wOsmRmfY' \
    --namespace "$AB_NAMESPACE" \
    --region 'bRfB4vUx' \
    --body '{"buffer_count": 61, "buffer_percent": 25, "max_count": 75, "min_count": 7, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'hpx2sTp6' \
    --namespace "$AB_NAMESPACE" \
    --region 'ffDDf7P8' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '8wjRO4A8' \
    --namespace "$AB_NAMESPACE" \
    --region 'zI1pFXm4' \
    --body '{"buffer_count": 5, "buffer_percent": 69, "max_count": 29, "min_count": 70, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'gwreBKKw' \
    --namespace "$AB_NAMESPACE" \
    --version 'pK8ExaPu' \
    --body '{"buffer_count": 2, "buffer_percent": 58, "configuration": "L1yYmwc9", "enable_region_overrides": true, "game_version": "9lN4seBR", "max_count": 96, "min_count": 56, "region_overrides": {"ZmEZViaJ": {"buffer_count": 16, "buffer_percent": 11, "max_count": 4, "min_count": 75, "name": "xkfunhtp", "unlimited": true, "use_buffer_percent": false}, "CESNDc33": {"buffer_count": 65, "buffer_percent": 84, "max_count": 95, "min_count": 41, "name": "LqkDcsWN", "unlimited": true, "use_buffer_percent": false}, "BnhgQzom": {"buffer_count": 73, "buffer_percent": 11, "max_count": 46, "min_count": 86, "name": "CgbFZvRS", "unlimited": true, "use_buffer_percent": true}}, "regions": ["SU4j9JRO", "55aNaLBX", "wLXlNna8"], "session_timeout": 43, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'HVppq1TH' \
    --namespace "$AB_NAMESPACE" \
    --version 'UBG5VR4z' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'FGTBhMM0' \
    --namespace "$AB_NAMESPACE" \
    --version 'l12rE1ye' \
    --body '{"buffer_count": 33, "buffer_percent": 42, "configuration": "2S7VI42f", "enable_region_overrides": true, "game_version": "8irOxRVc", "max_count": 80, "min_count": 14, "regions": ["TP3UqV3r", "3LIst8IO", "Hw7USkBM"], "session_timeout": 100, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'o0CKQMe3' \
    --namespace "$AB_NAMESPACE" \
    --region 'ozDFIg74' \
    --version '8y0HZGGt' \
    --body '{"buffer_count": 44, "buffer_percent": 3, "max_count": 44, "min_count": 51, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'tOv8xSQi' \
    --namespace "$AB_NAMESPACE" \
    --region 'DLl4ThoH' \
    --version 'd6q9ESdg' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'azDLD9Su' \
    --namespace "$AB_NAMESPACE" \
    --region 'kjAKwQo5' \
    --version '3oqbvNY0' \
    --body '{"buffer_count": 88, "buffer_percent": 53, "max_count": 82, "min_count": 21, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '65' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'kjMrQfkD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'JxaR31tC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 81, "mem_limit": 96, "params": "8zB6mNN7"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'FUK538Xj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'Y17zu1Gc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 35, "mem_limit": 11, "name": "yQ2awhyX", "params": "OXGZA6BK"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '4Gdo1NLk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 61}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'idHGMW1Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name '77LxkqSN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "h9X56rRU", "port": 7}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '6Rmz0jGm' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '58' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'e75Hlmyq' \
    --version '75QPOydq' \
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
    --imageURI 'mBZwAQmq' \
    --version '8nwQ7QP5' \
    --versionPatch 'kXHE54sG' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version '9wwLzz7c' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'P8XwcFp2' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'vzU1RapO' \
    --versionPatch 'RrTRkUzh' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'bhqw3Pr3' \
    --count '71' \
    --offset '15' \
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
    --region '2ysjkTgM' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'mFfkE7vq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'qN8SjjKL' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'bj4l2jL3' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'R08p3xu3' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'MXsTQjig' \
    --withServer  \
    --count '69' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'knjgc847' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'RGTGKqpH' \
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

#- 56 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'qlsFQC2y' \
    > test.out 2>&1
eval_tap $? 56 'ImageDetailClient' test.out

#- 57 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "RDV119vI"}' \
    > test.out 2>&1
eval_tap $? 57 'DeregisterLocalServer' test.out

#- 58 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "A4NVrsBl", "ip": "M4Yx6n8p", "name": "O08uyRlX", "port": 64}' \
    > test.out 2>&1
eval_tap $? 58 'RegisterLocalServer' test.out

#- 59 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "rl2UhUsV", "pod_name": "5iG8ksPz"}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterServer' test.out

#- 60 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "Eerrrzry"}' \
    > test.out 2>&1
eval_tap $? 60 'ShutdownServer' test.out

#- 61 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '6PhopRRy' \
    > test.out 2>&1
eval_tap $? 61 'GetServerSession' test.out

#- 62 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "s1Rsr6Gk", "configuration": "AcPjS319", "deployment": "H6tvC57v", "game_mode": "G4jp7GMV", "matching_allies": [{"matching_parties": [{"party_attributes": {"8GE7CYM2": {}, "YQyfVVlq": {}, "h7XliaJE": {}}, "party_id": "iEp6s2q4", "party_members": [{"user_id": "ddk9PgEZ"}, {"user_id": "96y9Pkn0"}, {"user_id": "jJi1a08k"}]}, {"party_attributes": {"gL4KfZxR": {}, "mOF5wZYJ": {}, "6NTDchWw": {}}, "party_id": "l7E4taZb", "party_members": [{"user_id": "AgGvV785"}, {"user_id": "3LmO1mB2"}, {"user_id": "n4EqzO8v"}]}, {"party_attributes": {"CRoaVil7": {}, "L5EIwSIt": {}, "4BGPMokH": {}}, "party_id": "rW01QOx2", "party_members": [{"user_id": "oqJ5knyC"}, {"user_id": "9gTdDaBI"}, {"user_id": "b5UnhVxo"}]}]}, {"matching_parties": [{"party_attributes": {"Ba5gFog7": {}, "spC3RXmG": {}, "dlqvW47M": {}}, "party_id": "xOhxCYiR", "party_members": [{"user_id": "iWvfihsU"}, {"user_id": "mLq5mWdC"}, {"user_id": "UO6mkiP2"}]}, {"party_attributes": {"bQGmDWqg": {}, "vaUsW29x": {}, "aTQVFxC7": {}}, "party_id": "ZhzJwA2t", "party_members": [{"user_id": "YgBqoXeY"}, {"user_id": "jqiTGM8h"}, {"user_id": "X3MtUoQS"}]}, {"party_attributes": {"iVDXVx0E": {}, "js6c8exf": {}, "qZEqQ28c": {}}, "party_id": "mbvBZ6L3", "party_members": [{"user_id": "zAHCZM8w"}, {"user_id": "s1RVyAUI"}, {"user_id": "vylGYCIv"}]}]}, {"matching_parties": [{"party_attributes": {"DeJUoVjq": {}, "yp8C8x1z": {}, "W4Rnlnly": {}}, "party_id": "ehhC4DCe", "party_members": [{"user_id": "xZJi5L3M"}, {"user_id": "AIc8nGcv"}, {"user_id": "XPNeSJTZ"}]}, {"party_attributes": {"2LC0r5eK": {}, "wtCoDnDR": {}, "DJI0Raxe": {}}, "party_id": "eJLcVvV6", "party_members": [{"user_id": "M1vgoT0z"}, {"user_id": "SADjK44h"}, {"user_id": "5vRmxV4Y"}]}, {"party_attributes": {"sAkJ4o0g": {}, "GycAk3xR": {}, "drQeDdTc": {}}, "party_id": "CTxcrseM", "party_members": [{"user_id": "AZ0aynwu"}, {"user_id": "HcNdKZQA"}, {"user_id": "SpqOeDtH"}]}]}], "namespace": "pByFoi6J", "notification_payload": {}, "pod_name": "X9shqfAA", "region": "VxDzSDqk", "session_id": "9nHSijjy"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateSession' test.out

#- 63 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "vwkKMRg1"}' \
    > test.out 2>&1
eval_tap $? 63 'ClaimServer' test.out

#- 64 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ePwPf8vt' \
    > test.out 2>&1
eval_tap $? 64 'GetSession' test.out

#- 65 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 65 'GetDefaultProvider' test.out

#- 66 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 66 'ListProviders' test.out

#- 67 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region 'Uza3lY17' \
    > test.out 2>&1
eval_tap $? 67 'ListProvidersByRegion' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE