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
    --body '{"artifactPath": "jO1ifdNI", "image": "2DO24GsN", "namespace": "r7OtTqN0", "persistent": false, "version": "uajTUg2w"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "svbDVFlW", "dockerPath": "YdtECBbU", "image": "lBvCh9WU", "imageSize": 82, "namespace": "Q2DBNpbg", "persistent": false, "version": "ShrB17Jv"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "R5gSeuZn", "dockerPath": "GMkSSNp3", "image": "4Po6PFLh", "imageSize": 80, "namespace": "0mxBMNSM", "patchVersion": "xCy8kf6b", "persistent": false, "version": "bKrXYi6V"}' \
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
    --body '{"claim_timeout": 90, "creation_timeout": 71, "default_version": "bwkptonQ", "port": 63, "ports": {"GGKpluNU": 72, "dalGRAIE": 39, "lhMcudyY": 64}, "protocol": "IfwONlPX", "providers": ["JRBgQVvv", "DLi67tfy", "ypjamQs9"], "session_timeout": 49, "unreachable_timeout": 99}' \
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
    --body '{"claim_timeout": 0, "creation_timeout": 41, "default_version": "TWV8DRvk", "port": 98, "protocol": "MoGkOsJ3", "providers": ["Xdy8URtc", "8Oswd9rS", "v3PlVHEv"], "session_timeout": 44, "unreachable_timeout": 30}' \
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
    --name 'xja4ogZ6' \
    --count '57' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'HOmRx64k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'KVpU421h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 75, "buffer_percent": 5, "configuration": "MHVTnNga", "enable_region_overrides": true, "game_version": "A7wRCifO", "max_count": 24, "min_count": 21, "overrides": {"if4JxJ9I": {"buffer_count": 73, "buffer_percent": 93, "configuration": "8N3bO4lw", "enable_region_overrides": true, "game_version": "oSAKFTu2", "max_count": 35, "min_count": 59, "name": "6fZX9y2d", "region_overrides": {"MlFxg7jS": {"buffer_count": 7, "buffer_percent": 74, "max_count": 41, "min_count": 59, "name": "7FbiV7HX", "unlimited": true, "use_buffer_percent": false}, "BnXgwAmM": {"buffer_count": 83, "buffer_percent": 61, "max_count": 61, "min_count": 81, "name": "Vyiy5Tji", "unlimited": true, "use_buffer_percent": true}, "rbTAesOT": {"buffer_count": 36, "buffer_percent": 62, "max_count": 54, "min_count": 98, "name": "C3mAp47Y", "unlimited": true, "use_buffer_percent": true}}, "regions": ["bw9A1C5i", "Ilq24YDh", "xi2eHsqq"], "session_timeout": 87, "unlimited": false, "use_buffer_percent": false}, "erP8v2e3": {"buffer_count": 61, "buffer_percent": 87, "configuration": "VzxhxcRH", "enable_region_overrides": true, "game_version": "L0D5aB9k", "max_count": 71, "min_count": 96, "name": "SCbcWJxR", "region_overrides": {"5sVs1iiM": {"buffer_count": 53, "buffer_percent": 100, "max_count": 10, "min_count": 42, "name": "Ws3JropD", "unlimited": true, "use_buffer_percent": true}, "basqyKyP": {"buffer_count": 12, "buffer_percent": 72, "max_count": 3, "min_count": 13, "name": "N85smwz7", "unlimited": true, "use_buffer_percent": false}, "uCP95m47": {"buffer_count": 21, "buffer_percent": 51, "max_count": 66, "min_count": 55, "name": "EBO7bbH5", "unlimited": false, "use_buffer_percent": true}}, "regions": ["cOpzH9Pm", "NTQzMVp5", "7KNag0nQ"], "session_timeout": 40, "unlimited": false, "use_buffer_percent": false}, "EVYAv8Jo": {"buffer_count": 1, "buffer_percent": 25, "configuration": "GDPCpoaH", "enable_region_overrides": true, "game_version": "y4QoGcX3", "max_count": 76, "min_count": 58, "name": "9tZrWHnW", "region_overrides": {"h1fnbCkS": {"buffer_count": 77, "buffer_percent": 20, "max_count": 64, "min_count": 27, "name": "NLO3mByO", "unlimited": false, "use_buffer_percent": true}, "9N9q5Uba": {"buffer_count": 52, "buffer_percent": 9, "max_count": 86, "min_count": 32, "name": "MCgzCTkX", "unlimited": false, "use_buffer_percent": true}, "wmUuF8SC": {"buffer_count": 43, "buffer_percent": 86, "max_count": 48, "min_count": 20, "name": "ArnyAjyT", "unlimited": false, "use_buffer_percent": false}}, "regions": ["FX0jsR9k", "feoghcc2", "T60FHEDx"], "session_timeout": 61, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"NOPbgGUo": {"buffer_count": 88, "buffer_percent": 8, "max_count": 26, "min_count": 71, "name": "PUB2m5el", "unlimited": false, "use_buffer_percent": false}, "j5dblzMI": {"buffer_count": 70, "buffer_percent": 66, "max_count": 80, "min_count": 27, "name": "XlPI8J8m", "unlimited": false, "use_buffer_percent": false}, "N6JyPWny": {"buffer_count": 97, "buffer_percent": 82, "max_count": 36, "min_count": 45, "name": "xUUZRvG9", "unlimited": true, "use_buffer_percent": true}}, "regions": ["c6kRIUFo", "YBEay4z3", "sOiYl2m2"], "session_timeout": 6, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment '4FTCuZCV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment '3FK27GOD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 13, "buffer_percent": 96, "configuration": "IyYhz5eO", "enable_region_overrides": false, "game_version": "S9IgzncO", "max_count": 13, "min_count": 76, "regions": ["vlpAbQmz", "JPlaohzr", "RYzzF4Z3"], "session_timeout": 1, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'TDuKSVOx' \
    --namespace "$AB_NAMESPACE" \
    --region '04DRLyRy' \
    --body '{"buffer_count": 55, "buffer_percent": 58, "max_count": 78, "min_count": 16, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'HRdnxoML' \
    --namespace "$AB_NAMESPACE" \
    --region 'uOzoWaQR' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'SRVgCylK' \
    --namespace "$AB_NAMESPACE" \
    --region 'agKx6oWJ' \
    --body '{"buffer_count": 28, "buffer_percent": 88, "max_count": 84, "min_count": 4, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'rjrwK8zw' \
    --namespace "$AB_NAMESPACE" \
    --version 'V1Z3ZgMW' \
    --body '{"buffer_count": 9, "buffer_percent": 95, "configuration": "AkiAVBla", "enable_region_overrides": true, "game_version": "9dy6cUmY", "max_count": 70, "min_count": 28, "region_overrides": {"59KhrleN": {"buffer_count": 92, "buffer_percent": 94, "max_count": 47, "min_count": 15, "name": "9HHlHuSG", "unlimited": false, "use_buffer_percent": false}, "Nr4r7RDa": {"buffer_count": 52, "buffer_percent": 33, "max_count": 54, "min_count": 57, "name": "I4HYTLPC", "unlimited": false, "use_buffer_percent": false}, "HwlWcxUs": {"buffer_count": 40, "buffer_percent": 85, "max_count": 15, "min_count": 96, "name": "vQJeSzV2", "unlimited": true, "use_buffer_percent": true}}, "regions": ["ZDftks6I", "iEAgo37z", "uJEB5VLY"], "session_timeout": 98, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'YdvRv1lb' \
    --namespace "$AB_NAMESPACE" \
    --version 'xDuoGEtm' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'GDesN8nr' \
    --namespace "$AB_NAMESPACE" \
    --version 'NbHyUnJK' \
    --body '{"buffer_count": 64, "buffer_percent": 67, "configuration": "xMGnSz38", "enable_region_overrides": false, "game_version": "MXkhzJQV", "max_count": 80, "min_count": 53, "regions": ["UsQiKqsu", "oYkJG8u7", "QTYYHMhA"], "session_timeout": 55, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'l6spaXfj' \
    --namespace "$AB_NAMESPACE" \
    --region 'JlWEcO8s' \
    --version 'CKLNEcMp' \
    --body '{"buffer_count": 16, "buffer_percent": 17, "max_count": 62, "min_count": 69, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment '0MYgqmV1' \
    --namespace "$AB_NAMESPACE" \
    --region 'x3EdAJue' \
    --version 'CHOKgKSb' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'oTzsZREs' \
    --namespace "$AB_NAMESPACE" \
    --region 't2i7ToAE' \
    --version 'orf4eS8D' \
    --body '{"buffer_count": 50, "buffer_percent": 71, "max_count": 29, "min_count": 86, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '11' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name '5z453G5X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'qKNVxiir' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 15, "mem_limit": 56, "params": "zDyS0PBw"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '9NLdR9vF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'G0T6KF5w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 66, "mem_limit": 46, "name": "Lu0flO0k", "params": "W3lUoaAg"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'uRZmwFp1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 45}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'G0TjYSVU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'lqDdGxbJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "1vmyaKdQ", "port": 11}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'MrFSd6ab' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '82' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'k4t8qwWW' \
    --version 'Q7JunQaq' \
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
    --imageURI 'QbkpCKRS' \
    --version 'o4Z0N387' \
    --versionPatch 'QhV2SWx5' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'GrIsOwLh' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'kZN9KIez' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'x01O1jot' \
    --versionPatch '9TEHmoy9' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region '7i31mxDI' \
    --count '72' \
    --offset '7' \
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
    --region 'pqN0KPGE' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name '0JUwX0cr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'TJkafapT' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'OjZ1LqGG' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'JLR02Xh0' \
    --withServer  \
    --count '54' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'xEopcRY8' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '4Nb1FriO' \
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
    --version 'N7jRnThZ' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8SGhxsfQ"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "Y3Bfh9yB", "ip": "sicoUiI5", "name": "gU31YdMZ", "port": 31}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "blsRO3d8", "pod_name": "56Lj5J1Y"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "pXZes8ix"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'IXjeptbl' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "HENwa444", "configuration": "ONLWTm2U", "deployment": "c5bokvAD", "game_mode": "aEw6CsIe", "matching_allies": [{"matching_parties": [{"party_attributes": {"sEpgZ7td": {}, "AqTFymdt": {}, "FLGSXcWh": {}}, "party_id": "2HRY10QS", "party_members": [{"user_id": "zpMWwxTi"}, {"user_id": "WKwapAKk"}, {"user_id": "Gdwp04q7"}]}, {"party_attributes": {"OwBuJV5x": {}, "27XvZf4f": {}, "VYwGwvuv": {}}, "party_id": "Yqf9eE2L", "party_members": [{"user_id": "9cWeUZyL"}, {"user_id": "A6gNhbkN"}, {"user_id": "BD43NMbD"}]}, {"party_attributes": {"g4pR7yKf": {}, "goptWTK0": {}, "uZmyK8fw": {}}, "party_id": "gX2q3enA", "party_members": [{"user_id": "x6MfyL5h"}, {"user_id": "tOz7Te3R"}, {"user_id": "cppolOcR"}]}]}, {"matching_parties": [{"party_attributes": {"axYOjv1E": {}, "jFNWI1Ac": {}, "Yl6AnmtA": {}}, "party_id": "bL2hbY4C", "party_members": [{"user_id": "GfWevq7o"}, {"user_id": "76lUQnPi"}, {"user_id": "iCZcZmi7"}]}, {"party_attributes": {"7B71iSCK": {}, "eOAeAhg5": {}, "boNvf4JY": {}}, "party_id": "ZCTLvk7J", "party_members": [{"user_id": "QfRAFfmp"}, {"user_id": "8OV0sI9r"}, {"user_id": "L6Tz4Jvd"}]}, {"party_attributes": {"S5m6rCDJ": {}, "IhGF6yO5": {}, "iVrNS8pD": {}}, "party_id": "p4eKEnVA", "party_members": [{"user_id": "it1dUioK"}, {"user_id": "Eei1dgVp"}, {"user_id": "YkPjDxUL"}]}]}, {"matching_parties": [{"party_attributes": {"SGAQeMjv": {}, "e33hktls": {}, "jPLHUmlu": {}}, "party_id": "UYZQ4m7W", "party_members": [{"user_id": "uSf182D1"}, {"user_id": "sufz0S6y"}, {"user_id": "GlsE5f5x"}]}, {"party_attributes": {"fAgBVvAE": {}, "ladPt9vr": {}, "hp1BEPww": {}}, "party_id": "RcuBRPdw", "party_members": [{"user_id": "AufgZtPP"}, {"user_id": "UrADZsXf"}, {"user_id": "YbkOZoRe"}]}, {"party_attributes": {"WuL70tdq": {}, "6l1jYBdk": {}, "x6Qqsde6": {}}, "party_id": "bSPl4OMz", "party_members": [{"user_id": "bsCwdGGJ"}, {"user_id": "suCJXj51"}, {"user_id": "4BZ4PFEk"}]}]}], "namespace": "gHwbei7e", "notification_payload": {}, "pod_name": "UKjMU5BV", "region": "3TyAcYVB", "session_id": "hkOsrm3E"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "EB936onk"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'yB8HKaOQ' \
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
    --region '6q10r2W0' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE