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
    --body '{"artifactPath": "d2jmy2Jz", "image": "NrGxSQ2u", "namespace": "j1GfYb7H", "persistent": false, "version": "JmOKli4l"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "naLGCSnb", "dockerPath": "ffkd1Rga", "image": "OBKqB37R", "imageSize": 4, "namespace": "tBJLBwUb", "persistent": true, "version": "pmhXP7Ew"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "xINXfJt2", "dockerPath": "fEX5k0Nn", "image": "9ovkcrq4", "imageSize": 43, "namespace": "5WBvancm", "patchVersion": "Os9HW9kv", "persistent": false, "version": "AqZmUN5d"}' \
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
    --body '{"claim_timeout": 30, "creation_timeout": 44, "default_version": "IwBj9KIB", "port": 46, "ports": {"N2i6EF8C": 82, "H380ce38": 82, "AozmzCRG": 38}, "protocol": "Ia8ktnmm", "providers": ["6Q7WwAT7", "VrKPUMI8", "O0LeSdcm"], "session_timeout": 86, "unreachable_timeout": 49}' \
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
    --body '{"claim_timeout": 53, "creation_timeout": 83, "default_version": "jTluZ6sx", "port": 92, "protocol": "Ml0Sujer", "providers": ["qHsDrfmm", "heyzPpMX", "aoavA70m"], "session_timeout": 79, "unreachable_timeout": 8}' \
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
    --name '2GTGd9oA' \
    --count '93' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'vIpOV5c5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'ZKt8gUYb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 37, "buffer_percent": 67, "configuration": "8ss7O3ZC", "enable_region_overrides": true, "game_version": "dI95Odf6", "max_count": 45, "min_count": 4, "overrides": {"FvXh1IhW": {"buffer_count": 71, "buffer_percent": 7, "configuration": "hqZTC1x3", "enable_region_overrides": true, "game_version": "YV68X2Tg", "max_count": 25, "min_count": 83, "name": "AAcjKuFP", "region_overrides": {"sSFvzPAc": {"buffer_count": 53, "buffer_percent": 89, "max_count": 41, "min_count": 79, "name": "bfo6F98A", "unlimited": false, "use_buffer_percent": false}, "DPoAKUIs": {"buffer_count": 73, "buffer_percent": 84, "max_count": 48, "min_count": 22, "name": "LQT3sEsl", "unlimited": true, "use_buffer_percent": true}, "IZBhh9S5": {"buffer_count": 16, "buffer_percent": 86, "max_count": 95, "min_count": 83, "name": "9GGaqK6i", "unlimited": false, "use_buffer_percent": true}}, "regions": ["3paQIByF", "XwyUkuRl", "cyW4uhK0"], "session_timeout": 36, "unlimited": true, "use_buffer_percent": false}, "iqPskn6b": {"buffer_count": 23, "buffer_percent": 13, "configuration": "telzSGjn", "enable_region_overrides": false, "game_version": "xiE8gXKR", "max_count": 9, "min_count": 59, "name": "ICH711rN", "region_overrides": {"0SBREQ8D": {"buffer_count": 54, "buffer_percent": 17, "max_count": 76, "min_count": 77, "name": "ItnCbp8I", "unlimited": false, "use_buffer_percent": true}, "kR3k3RcW": {"buffer_count": 74, "buffer_percent": 1, "max_count": 29, "min_count": 68, "name": "IzMCaoIQ", "unlimited": true, "use_buffer_percent": false}, "cx3kCDwW": {"buffer_count": 31, "buffer_percent": 81, "max_count": 49, "min_count": 38, "name": "SF3PGjcd", "unlimited": false, "use_buffer_percent": false}}, "regions": ["Nqa35P2R", "hnhRyRTV", "xYSR9s7l"], "session_timeout": 81, "unlimited": true, "use_buffer_percent": false}, "CoilLv9x": {"buffer_count": 76, "buffer_percent": 99, "configuration": "SQRG79ef", "enable_region_overrides": false, "game_version": "VP5WUDUq", "max_count": 20, "min_count": 95, "name": "kUCdXk9C", "region_overrides": {"jwuXq2xL": {"buffer_count": 51, "buffer_percent": 51, "max_count": 87, "min_count": 38, "name": "gpW5ymht", "unlimited": true, "use_buffer_percent": true}, "vPVjZCbG": {"buffer_count": 72, "buffer_percent": 3, "max_count": 68, "min_count": 100, "name": "rHG3l141", "unlimited": false, "use_buffer_percent": true}, "kgsor9ah": {"buffer_count": 42, "buffer_percent": 64, "max_count": 41, "min_count": 47, "name": "sgcMFCka", "unlimited": true, "use_buffer_percent": true}}, "regions": ["t7ScoYpI", "1fbX4q4h", "cm1AA9dr"], "session_timeout": 38, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"AQ2oVDHu": {"buffer_count": 70, "buffer_percent": 15, "max_count": 72, "min_count": 34, "name": "SUdIscMU", "unlimited": false, "use_buffer_percent": false}, "yHJecBzc": {"buffer_count": 91, "buffer_percent": 33, "max_count": 69, "min_count": 74, "name": "Cf8BHZ9H", "unlimited": false, "use_buffer_percent": false}, "XHRHUBo5": {"buffer_count": 58, "buffer_percent": 39, "max_count": 41, "min_count": 43, "name": "bQbmj2pR", "unlimited": false, "use_buffer_percent": true}}, "regions": ["lfvxhnoo", "p4Ue4hAC", "685JOc5t"], "session_timeout": 80, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'll8UXh16' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'isJO6Gln' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 43, "buffer_percent": 7, "configuration": "M3iVgV4n", "enable_region_overrides": true, "game_version": "PMlWViru", "max_count": 47, "min_count": 39, "regions": ["pmV7Lc1q", "eexjzU27", "4FaO0pOg"], "session_timeout": 12, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '8p74TerB' \
    --namespace "$AB_NAMESPACE" \
    --region '6Nqudgqw' \
    --body '{"buffer_count": 23, "buffer_percent": 76, "max_count": 98, "min_count": 54, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'Y8xkNWzZ' \
    --namespace "$AB_NAMESPACE" \
    --region 'eXZF7UBQ' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '1zrUUXMK' \
    --namespace "$AB_NAMESPACE" \
    --region 'cYDHfV4m' \
    --body '{"buffer_count": 33, "buffer_percent": 87, "max_count": 36, "min_count": 41, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'lsUh8Htr' \
    --namespace "$AB_NAMESPACE" \
    --version 'anrg3KBE' \
    --body '{"buffer_count": 71, "buffer_percent": 18, "configuration": "u9ffyxYA", "enable_region_overrides": false, "game_version": "HXDWSnvZ", "max_count": 35, "min_count": 3, "region_overrides": {"cNMLTeOl": {"buffer_count": 11, "buffer_percent": 44, "max_count": 49, "min_count": 5, "name": "5SbuZl8n", "unlimited": true, "use_buffer_percent": true}, "pSdDVJ6E": {"buffer_count": 34, "buffer_percent": 38, "max_count": 98, "min_count": 55, "name": "Cc21MLBC", "unlimited": false, "use_buffer_percent": false}, "3wOuUXoW": {"buffer_count": 54, "buffer_percent": 68, "max_count": 33, "min_count": 8, "name": "KjDj8Ob8", "unlimited": true, "use_buffer_percent": false}}, "regions": ["vutYDM0r", "sFJImPP1", "ymwtj9oP"], "session_timeout": 23, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'NqdiBaU3' \
    --namespace "$AB_NAMESPACE" \
    --version 'i4Y2FXtC' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'tagmZ2GQ' \
    --namespace "$AB_NAMESPACE" \
    --version 'dmnSuanl' \
    --body '{"buffer_count": 50, "buffer_percent": 44, "configuration": "JRWBBRzn", "enable_region_overrides": false, "game_version": "uVDN1SS9", "max_count": 41, "min_count": 45, "regions": ["q2vF81rq", "giZj6cfH", "tfeLJBpX"], "session_timeout": 96, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'eHeoIIoE' \
    --namespace "$AB_NAMESPACE" \
    --region 'fhNI44i9' \
    --version 'sS0gWRkw' \
    --body '{"buffer_count": 67, "buffer_percent": 51, "max_count": 17, "min_count": 17, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'OgjKPA2j' \
    --namespace "$AB_NAMESPACE" \
    --region 'QOntPUu6' \
    --version 'W2otj9ye' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'umdm6fsa' \
    --namespace "$AB_NAMESPACE" \
    --region 'taQFFKj4' \
    --version 'w5oD1zGQ' \
    --body '{"buffer_count": 99, "buffer_percent": 97, "max_count": 74, "min_count": 95, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '55' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'F4VqxWDt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'EhVSLtPI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 74, "mem_limit": 56, "params": "8p6mOtIz"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'Man5ytBu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'ovkydQN4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 87, "mem_limit": 12, "name": "rPZUKoqk", "params": "fBp0lwY9"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'OZ4XQ6tM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 6}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '2lWMM1bF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name '3uu0EZO8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "UbOgvn1V", "port": 82}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'uCDIqPVD' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '43' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '4DfeeBrF' \
    --version 'VyuBv98S' \
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
    --imageURI 'HAPUZ0n3' \
    --version 'SKGwoW6F' \
    --versionPatch 'r3PWh9rX' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'C4z7lFIU' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'KuXkQYOL' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'AAXjIL0x' \
    --versionPatch 'kl7RKnvF' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'kbC1C1wv' \
    --count '10' \
    --offset '30' \
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
    --region '3qYX29Bj' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'zB6o6gfz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'eiOVlepe' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'YrljpIhW' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'MmYCPKgB' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'RvSFrm8M' \
    --withServer  \
    --count '36' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'QAlJqsij' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '1ApxhCG8' \
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
    --version 'oMd0Wt6S' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "m28n7l3Q"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "datJYB8B", "ip": "b5AMhAhB", "name": "1ijLW7Nn", "port": 46}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "kTO0GWRw", "pod_name": "DdwrqOr3"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "nvBiS8Tp"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '3SLrw2Ff' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "lgwRZSGr", "configuration": "UuzBT6BX", "deployment": "KqTmNRIa", "game_mode": "2stnQuKt", "matching_allies": [{"matching_parties": [{"party_attributes": {"GQAT6Fbm": {}, "z7Dxtg6B": {}, "goxtQqm9": {}}, "party_id": "Hiex86uI", "party_members": [{"user_id": "xCEZ3DSg"}, {"user_id": "m6PDsSbo"}, {"user_id": "nLGC311b"}]}, {"party_attributes": {"dLqsv9QP": {}, "BiXH75w5": {}, "RieN9EiV": {}}, "party_id": "58rng8fG", "party_members": [{"user_id": "WOkPaLp2"}, {"user_id": "vqGebonH"}, {"user_id": "hZ1g1kvN"}]}, {"party_attributes": {"7JXZ63nB": {}, "BXSainKs": {}, "1NBQ1PL1": {}}, "party_id": "M8A4NLvl", "party_members": [{"user_id": "v7pofFc5"}, {"user_id": "J52anmEr"}, {"user_id": "mz03n3Bt"}]}]}, {"matching_parties": [{"party_attributes": {"mq49jeuQ": {}, "sfxdW2G9": {}, "LoiiyPuN": {}}, "party_id": "sGewbUsh", "party_members": [{"user_id": "e7qOQaYJ"}, {"user_id": "o5rbBQSc"}, {"user_id": "oMgyieLb"}]}, {"party_attributes": {"iIPcYMNW": {}, "ljnffvPH": {}, "j9xIt0Dw": {}}, "party_id": "3jKzuS6D", "party_members": [{"user_id": "Ivliljed"}, {"user_id": "czDEsK3M"}, {"user_id": "yy7DUYwR"}]}, {"party_attributes": {"wlFuQpVZ": {}, "cgfFUHzH": {}, "6QDqG80i": {}}, "party_id": "dCp5tHDV", "party_members": [{"user_id": "MwYvbtYY"}, {"user_id": "9eyVbQPO"}, {"user_id": "vOWKG3Us"}]}]}, {"matching_parties": [{"party_attributes": {"B4XFfdIY": {}, "t0skyEGS": {}, "7MntOWrZ": {}}, "party_id": "GVJ45x9D", "party_members": [{"user_id": "pPvkXkQm"}, {"user_id": "vYDDJbRA"}, {"user_id": "G46QzHpr"}]}, {"party_attributes": {"bi1DQjBY": {}, "iICR1nK0": {}, "Bay9wCsn": {}}, "party_id": "NjQtmOwD", "party_members": [{"user_id": "Df7qtlx7"}, {"user_id": "S8mkg916"}, {"user_id": "DjmxBQsv"}]}, {"party_attributes": {"PKSEUQ9z": {}, "onhZwhVT": {}, "GMBDW8XA": {}}, "party_id": "vtV2RuCx", "party_members": [{"user_id": "0QZEPaXY"}, {"user_id": "YIBxzpdU"}, {"user_id": "MoY1yAJk"}]}]}], "namespace": "R9dz4myi", "notification_payload": {}, "pod_name": "7xUTDC7c", "region": "BUZcMP9Y", "session_id": "CWgpvisV"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "r6i2XKDS"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '3lxJ8ddC' \
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
    --region 'Zcc535bE' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE