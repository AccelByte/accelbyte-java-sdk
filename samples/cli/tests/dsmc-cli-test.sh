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
    --body '{"artifactPath": "7kMX6M76", "image": "P8dKcUUH", "namespace": "ZqhPUuxc", "persistent": true, "version": "dYOXUFAQ"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "ztg2n0Jd", "dockerPath": "rPBqDUB6", "image": "80gzsovy", "imageSize": 60, "namespace": "cZY36MmY", "persistent": false, "version": "3TENlqSz"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "afTCTC1a", "dockerPath": "EH61k718", "image": "MjnU2GwA", "imageSize": 95, "namespace": "AFb1hp4T", "patchVersion": "dCqmIAm0", "persistent": false, "version": "QhU5ToVg"}' \
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
    --body '{"claim_timeout": 24, "creation_timeout": 87, "default_version": "6rAqsDNX", "port": 8, "ports": {"huBeuZZM": 21, "cwcH1GBd": 81, "LVOuViRo": 12}, "protocol": "nnFvM8iB", "providers": ["GNsF93aw", "DnDYttOO", "TL0ecrmR"], "session_timeout": 29, "unreachable_timeout": 58}' \
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
    --body '{"claim_timeout": 49, "creation_timeout": 52, "default_version": "LAO5DbWZ", "port": 64, "protocol": "V3cEZina", "providers": ["uYUdxuV8", "KlA5koXb", "VAu0Sl15"], "session_timeout": 3, "unreachable_timeout": 4}' \
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
    --name 'xCotyg3I' \
    --count '40' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'd4jENNAw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment '50iVH72q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 41, "buffer_percent": 22, "configuration": "32eFkhbV", "enable_region_overrides": false, "game_version": "jwTPGXVZ", "max_count": 21, "min_count": 82, "overrides": {"ZaBsrsiH": {"buffer_count": 51, "buffer_percent": 9, "configuration": "GfOx5WdO", "enable_region_overrides": false, "game_version": "p32tKnfK", "max_count": 96, "min_count": 18, "name": "otS3u8wd", "region_overrides": {"dQWCef1f": {"buffer_count": 41, "buffer_percent": 42, "max_count": 49, "min_count": 63, "name": "TgL1sMaM", "unlimited": false, "use_buffer_percent": true}, "RNvCAB75": {"buffer_count": 88, "buffer_percent": 81, "max_count": 21, "min_count": 25, "name": "bCzC2bFi", "unlimited": true, "use_buffer_percent": false}, "JQCnUuNR": {"buffer_count": 41, "buffer_percent": 63, "max_count": 12, "min_count": 20, "name": "Ix0iCY2S", "unlimited": false, "use_buffer_percent": false}}, "regions": ["jZaVsLqH", "0TLLnutK", "pNR9VUvj"], "session_timeout": 28, "unlimited": false, "use_buffer_percent": true}, "lm8C0YAa": {"buffer_count": 12, "buffer_percent": 52, "configuration": "RnwiwQTP", "enable_region_overrides": true, "game_version": "o92ZeZ3Q", "max_count": 25, "min_count": 39, "name": "YDdsLlhk", "region_overrides": {"O67DB8YX": {"buffer_count": 53, "buffer_percent": 18, "max_count": 7, "min_count": 84, "name": "ugsNJUMq", "unlimited": false, "use_buffer_percent": false}, "ux1I9obl": {"buffer_count": 16, "buffer_percent": 95, "max_count": 77, "min_count": 0, "name": "3hveESdZ", "unlimited": true, "use_buffer_percent": false}, "URWhwO8o": {"buffer_count": 30, "buffer_percent": 86, "max_count": 71, "min_count": 98, "name": "2TxHy6pN", "unlimited": false, "use_buffer_percent": true}}, "regions": ["5WzqSf35", "Gat2A4hw", "mWhbPRBL"], "session_timeout": 32, "unlimited": false, "use_buffer_percent": false}, "z60NwILz": {"buffer_count": 37, "buffer_percent": 10, "configuration": "SJ6aX5NZ", "enable_region_overrides": false, "game_version": "MjwTwbI9", "max_count": 96, "min_count": 31, "name": "fQS3hrrS", "region_overrides": {"18Ilxam6": {"buffer_count": 52, "buffer_percent": 84, "max_count": 55, "min_count": 4, "name": "2ApRzOSL", "unlimited": true, "use_buffer_percent": true}, "VJu8PTei": {"buffer_count": 85, "buffer_percent": 3, "max_count": 73, "min_count": 33, "name": "QxS38pzY", "unlimited": false, "use_buffer_percent": true}, "pqzPZdeg": {"buffer_count": 32, "buffer_percent": 75, "max_count": 21, "min_count": 29, "name": "TiHi5geC", "unlimited": true, "use_buffer_percent": true}}, "regions": ["1vR4FVNJ", "EmTtzmlB", "5OnlR2xj"], "session_timeout": 56, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"JeYGo9mH": {"buffer_count": 18, "buffer_percent": 89, "max_count": 15, "min_count": 65, "name": "mvxbpkg2", "unlimited": true, "use_buffer_percent": true}, "rEomBHCf": {"buffer_count": 24, "buffer_percent": 24, "max_count": 32, "min_count": 19, "name": "Awh4RDvG", "unlimited": true, "use_buffer_percent": false}, "qKdsoPKJ": {"buffer_count": 63, "buffer_percent": 7, "max_count": 90, "min_count": 70, "name": "0WiRPbIB", "unlimited": false, "use_buffer_percent": true}}, "regions": ["QDEAnSks", "MevO0tNd", "FPojG1Lj"], "session_timeout": 86, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment '45zAhySO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'WDpiMVwP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 75, "buffer_percent": 0, "configuration": "e5XedaFf", "enable_region_overrides": false, "game_version": "tNJEmizd", "max_count": 32, "min_count": 86, "regions": ["8N5b2rJF", "tc4awGvl", "w9JA9WA2"], "session_timeout": 66, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '3lvlKnXw' \
    --namespace "$AB_NAMESPACE" \
    --region 'KVpOXCTx' \
    --body '{"buffer_count": 52, "buffer_percent": 35, "max_count": 53, "min_count": 10, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'SZcKpefW' \
    --namespace "$AB_NAMESPACE" \
    --region 'vCCg8pdD' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'r7JyBu5T' \
    --namespace "$AB_NAMESPACE" \
    --region 'wntbRXYF' \
    --body '{"buffer_count": 20, "buffer_percent": 33, "max_count": 67, "min_count": 70, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'GAInuD92' \
    --namespace "$AB_NAMESPACE" \
    --version '29N1RPJe' \
    --body '{"buffer_count": 28, "buffer_percent": 4, "configuration": "jORZILxg", "enable_region_overrides": false, "game_version": "JYHGlQuO", "max_count": 61, "min_count": 59, "region_overrides": {"5bW7x7mL": {"buffer_count": 27, "buffer_percent": 99, "max_count": 56, "min_count": 53, "name": "wlSINMRp", "unlimited": true, "use_buffer_percent": true}, "876tcYT7": {"buffer_count": 37, "buffer_percent": 47, "max_count": 65, "min_count": 24, "name": "azCzEoyh", "unlimited": false, "use_buffer_percent": true}, "lAIxHozy": {"buffer_count": 54, "buffer_percent": 25, "max_count": 30, "min_count": 63, "name": "oveteupN", "unlimited": true, "use_buffer_percent": false}}, "regions": ["zWUesYok", "az199cBb", "tYvHnnwr"], "session_timeout": 77, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'KL715piD' \
    --namespace "$AB_NAMESPACE" \
    --version 'wJ1kDS7T' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'LC3Go1oi' \
    --namespace "$AB_NAMESPACE" \
    --version 'TYtJv5gR' \
    --body '{"buffer_count": 72, "buffer_percent": 74, "configuration": "1Vq6A5lo", "enable_region_overrides": true, "game_version": "ccMD4LyL", "max_count": 14, "min_count": 69, "regions": ["qYPP5EY8", "euI9qvVD", "CrzhAHzw"], "session_timeout": 56, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'DM4GvcZD' \
    --namespace "$AB_NAMESPACE" \
    --region '0m4Ii46u' \
    --version 'z11uUVfg' \
    --body '{"buffer_count": 20, "buffer_percent": 55, "max_count": 84, "min_count": 65, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'tBMLQZVj' \
    --namespace "$AB_NAMESPACE" \
    --region 'hMhz2Eif' \
    --version 'tySiBLxb' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'brN7Wlrr' \
    --namespace "$AB_NAMESPACE" \
    --region 'a0xrVpwV' \
    --version 'vkD0sS3t' \
    --body '{"buffer_count": 46, "buffer_percent": 69, "max_count": 76, "min_count": 58, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '100' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'SR5D2RtJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'nPUXEUwR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 22, "mem_limit": 24, "params": "dPl6ttf3"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'uFMvi9H0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'BlpFUO05' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 44, "mem_limit": 14, "name": "3KKvmq1a", "params": "mfDjqzjy"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'BqN9Y8Zf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 41}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'N7XxSEFX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'Uun2vvjl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "OJZBfQGU", "port": 7}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'og9xgAMD' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '75' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'iBD3Fwv4' \
    --version 'EwwaT2HR' \
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
    --imageURI 'Tx4fss9F' \
    --version 'vcL14lOt' \
    --versionPatch 'VqWr0PZ7' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'gXTYKUiw' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'Jt5Ao1qw' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'rb5LZTS2' \
    --versionPatch 'vRtFd5T5' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'Y5Asj0n1' \
    --count '15' \
    --offset '55' \
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
    --region 'tFhzdgzH' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'jF0ObVh8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'naRIQLDv' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'nck3H5X0' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '9etvZHcV' \
    --withServer  \
    --count '75' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'wM6IQHSO' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'buQCcNid' \
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
    --version '7vu0qbM8' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "aL6tGAnT"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "t9nSG2gN", "ip": "gFcCosIx", "name": "TcoZpRfX", "port": 19}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "vY1tV9Lm", "pod_name": "pJupBY5k"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "9nt8JqFB"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'y1W0cSXn' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "URD5d7JH", "configuration": "lXfj6Ous", "deployment": "gyFirEKH", "game_mode": "b6BkaIQ8", "matching_allies": [{"matching_parties": [{"party_attributes": {"7GZJwbzZ": {}, "lhaHk0Jp": {}, "AqaVlvnW": {}}, "party_id": "XvJBhCRp", "party_members": [{"user_id": "r3fdOgNc"}, {"user_id": "LpPcQzY5"}, {"user_id": "U5AIsTtl"}]}, {"party_attributes": {"WSpmoPtL": {}, "TUeVjk4k": {}, "bMttO1N8": {}}, "party_id": "MCYgzeLH", "party_members": [{"user_id": "mowBo2ZB"}, {"user_id": "PUkW9jgf"}, {"user_id": "sxnHn0Fn"}]}, {"party_attributes": {"tGIKBOgY": {}, "wy09BJ7Q": {}, "QuefOUBS": {}}, "party_id": "dK6Vojcg", "party_members": [{"user_id": "EX6SUmpQ"}, {"user_id": "sDkL3jQy"}, {"user_id": "Ko07wkPb"}]}]}, {"matching_parties": [{"party_attributes": {"T3cGTMXs": {}, "rgKkUJTt": {}, "vh1Ygm6I": {}}, "party_id": "B4lsKwhh", "party_members": [{"user_id": "dGSCnhnj"}, {"user_id": "sxYZ4zzt"}, {"user_id": "Eib4MSsN"}]}, {"party_attributes": {"SVjcSSBP": {}, "P1BoLlbp": {}, "ao8fkKfX": {}}, "party_id": "7RGjghp8", "party_members": [{"user_id": "2SlAeEnn"}, {"user_id": "3I6is9VZ"}, {"user_id": "pIVrXKjj"}]}, {"party_attributes": {"qIslJVCq": {}, "SLIYOo5n": {}, "d0ZtPfda": {}}, "party_id": "FcpAjgq3", "party_members": [{"user_id": "pFrpOuaM"}, {"user_id": "dWRO5AWv"}, {"user_id": "Ogre2Sjm"}]}]}, {"matching_parties": [{"party_attributes": {"SdyXCC4q": {}, "fQt1ZTTO": {}, "Jsp2SAqR": {}}, "party_id": "jHStLQ88", "party_members": [{"user_id": "Z2dz5KyY"}, {"user_id": "ZZQHSEsx"}, {"user_id": "ALPT2NL2"}]}, {"party_attributes": {"P4YomyjG": {}, "oBmlk26o": {}, "v82nkXhk": {}}, "party_id": "9SYCWCmM", "party_members": [{"user_id": "v3vk1NT3"}, {"user_id": "1ws8M66y"}, {"user_id": "h1fgsIZ8"}]}, {"party_attributes": {"0CwO3iuV": {}, "OwFcEdtu": {}, "U6J2UQnb": {}}, "party_id": "dKNwpGkH", "party_members": [{"user_id": "OOaP9Jic"}, {"user_id": "PoKahaGS"}, {"user_id": "7pRXcIEA"}]}]}], "namespace": "LnzvChQH", "notification_payload": {}, "pod_name": "dvq42f5c", "region": "HFsoVT0U", "session_id": "nTiFkE0q"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "ceUyi0yt"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'wG8Gp7aw' \
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
    --region 'TBb1OIvj' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE