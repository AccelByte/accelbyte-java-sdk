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
echo "1..70"

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
    --body '{"artifactPath": "gEQXthWH", "image": "EYERqcGi", "namespace": "XAZOmKB7", "persistent": false, "version": "hg0caJMS"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "XFKUG2QE", "dockerPath": "FYjTEEG9", "image": "1MU8r5L6", "imageSize": 27, "namespace": "qHuOAgg8", "persistent": false, "version": "LbvioUWp"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "0r7zVSBG", "dockerPath": "74SigvcQ", "image": "FoacB8mc", "imageSize": 79, "namespace": "A7quDoEf", "patchVersion": "3bExg10n", "persistent": true, "version": "kaWxajgK"}' \
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
    --body '{"claim_timeout": 96, "creation_timeout": 68, "default_version": "K02OBCLn", "port": 23, "ports": {"0PI4Qkio": 89, "uqRSiVFc": 7, "g6qEef0w": 10}, "protocol": "PtGJLAiN", "providers": ["59vc1F0V", "FX5wp4AL", "gfAT0kwt"], "session_timeout": 75, "unreachable_timeout": 54}' \
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
    --body '{"claim_timeout": 82, "creation_timeout": 91, "default_version": "lpi4KxJA", "port": 50, "protocol": "oCocv9J7", "providers": ["OrtWuj3T", "dasxzQiC", "bnnjDGId"], "session_timeout": 26, "unreachable_timeout": 60}' \
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
    --name 'MDDeQmPA' \
    --count '1' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '6Gw2fDs0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'HD5bDKj0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 88, "buffer_percent": 46, "configuration": "gq54RxDn", "enable_region_overrides": true, "game_version": "E1H3XiYP", "max_count": 93, "min_count": 28, "overrides": {"S9hve2rQ": {"buffer_count": 69, "buffer_percent": 75, "configuration": "zlReuQWJ", "enable_region_overrides": false, "game_version": "KGfuf54X", "max_count": 78, "min_count": 11, "name": "Pey9pgup", "region_overrides": {"Jh1XQsSd": {"buffer_count": 2, "buffer_percent": 71, "max_count": 85, "min_count": 50, "name": "87kw0TqX", "unlimited": false, "use_buffer_percent": false}, "8bG3rbqt": {"buffer_count": 82, "buffer_percent": 20, "max_count": 50, "min_count": 71, "name": "6EuWFBYm", "unlimited": true, "use_buffer_percent": false}, "SxQZXMM4": {"buffer_count": 44, "buffer_percent": 98, "max_count": 86, "min_count": 40, "name": "RCgDH92Y", "unlimited": false, "use_buffer_percent": true}}, "regions": ["ywAcYYcK", "WM4ZXmUG", "rynYmB10"], "session_timeout": 54, "unlimited": false, "use_buffer_percent": false}, "tdfXpGvo": {"buffer_count": 56, "buffer_percent": 52, "configuration": "X480kYfk", "enable_region_overrides": true, "game_version": "MytYGHdw", "max_count": 41, "min_count": 4, "name": "PBhXyLXJ", "region_overrides": {"D9vCHJJt": {"buffer_count": 72, "buffer_percent": 51, "max_count": 36, "min_count": 89, "name": "KrzEBEVH", "unlimited": true, "use_buffer_percent": false}, "r1mxCbMY": {"buffer_count": 18, "buffer_percent": 46, "max_count": 92, "min_count": 72, "name": "1fBAkS1v", "unlimited": false, "use_buffer_percent": true}, "7Z0z40UV": {"buffer_count": 28, "buffer_percent": 69, "max_count": 5, "min_count": 7, "name": "x1qvGfdO", "unlimited": false, "use_buffer_percent": true}}, "regions": ["sZEnwjHI", "jGxUhir7", "mcJt0x7K"], "session_timeout": 12, "unlimited": true, "use_buffer_percent": true}, "xuWQH4kO": {"buffer_count": 13, "buffer_percent": 81, "configuration": "7ujMBCmO", "enable_region_overrides": false, "game_version": "z8bBAWBc", "max_count": 53, "min_count": 87, "name": "sbItsYsl", "region_overrides": {"6DXNfIzj": {"buffer_count": 9, "buffer_percent": 37, "max_count": 87, "min_count": 55, "name": "YhQ0l5rC", "unlimited": true, "use_buffer_percent": false}, "0Rj07O1U": {"buffer_count": 1, "buffer_percent": 34, "max_count": 30, "min_count": 66, "name": "drCdqIfQ", "unlimited": true, "use_buffer_percent": true}, "k1bLVga6": {"buffer_count": 68, "buffer_percent": 37, "max_count": 80, "min_count": 53, "name": "HdSzTfT7", "unlimited": true, "use_buffer_percent": false}}, "regions": ["RNIHImi0", "STLmMwcn", "pDnYM1tU"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"ngfmT9aa": {"buffer_count": 87, "buffer_percent": 46, "max_count": 88, "min_count": 55, "name": "mlaYJjWt", "unlimited": true, "use_buffer_percent": false}, "5LDBl1jR": {"buffer_count": 87, "buffer_percent": 27, "max_count": 93, "min_count": 36, "name": "GS1NZzyc", "unlimited": true, "use_buffer_percent": true}, "ep6x8ZGK": {"buffer_count": 97, "buffer_percent": 20, "max_count": 56, "min_count": 4, "name": "e3JACflb", "unlimited": true, "use_buffer_percent": true}}, "regions": ["d7zo0ASU", "RAbweLly", "UgAZFH94"], "session_timeout": 74, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'atWtdZd5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'gWlelVaZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 2, "buffer_percent": 48, "configuration": "wDEBSFaM", "enable_region_overrides": true, "game_version": "aqs4EPDH", "max_count": 56, "min_count": 46, "regions": ["IxfItm6N", "1JcxFRbe", "fgJOdWyr"], "session_timeout": 80, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'MMYOGpma' \
    --namespace "$AB_NAMESPACE" \
    --region '16D7JuDv' \
    --body '{"buffer_count": 71, "buffer_percent": 99, "max_count": 53, "min_count": 13, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'viSQwQmB' \
    --namespace "$AB_NAMESPACE" \
    --region 'De4ZhJRa' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 't6dn2sON' \
    --namespace "$AB_NAMESPACE" \
    --region 'd1LHO9Sb' \
    --body '{"buffer_count": 87, "buffer_percent": 53, "max_count": 18, "min_count": 46, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'yM45OAAs' \
    --namespace "$AB_NAMESPACE" \
    --version '8Z7lOSIn' \
    --body '{"buffer_count": 63, "buffer_percent": 35, "configuration": "LRLScouV", "enable_region_overrides": false, "game_version": "paSFZ7o9", "max_count": 70, "min_count": 55, "region_overrides": {"ekqs8Xsd": {"buffer_count": 29, "buffer_percent": 90, "max_count": 74, "min_count": 81, "name": "HxMkiUbS", "unlimited": true, "use_buffer_percent": false}, "p5TPuPhU": {"buffer_count": 91, "buffer_percent": 2, "max_count": 78, "min_count": 91, "name": "k58J78lI", "unlimited": false, "use_buffer_percent": true}, "Swhc7SRZ": {"buffer_count": 89, "buffer_percent": 74, "max_count": 73, "min_count": 7, "name": "bhoWYNqh", "unlimited": true, "use_buffer_percent": true}}, "regions": ["86yMyn7x", "FBbEIEFa", "oV1ICCfW"], "session_timeout": 65, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'CHobtUtq' \
    --namespace "$AB_NAMESPACE" \
    --version 'd0r4sh18' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'uQ3HpJCm' \
    --namespace "$AB_NAMESPACE" \
    --version 'ejaoUuHT' \
    --body '{"buffer_count": 1, "buffer_percent": 68, "configuration": "scBy9WIC", "enable_region_overrides": true, "game_version": "6iIXvxmn", "max_count": 56, "min_count": 62, "regions": ["kPudsFE7", "FI423QxW", "pf2dh0Y9"], "session_timeout": 16, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'Zm1Xck1a' \
    --namespace "$AB_NAMESPACE" \
    --region '05g8e2lv' \
    --version 'qMG4fj3S' \
    --body '{"buffer_count": 82, "buffer_percent": 28, "max_count": 80, "min_count": 10, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment '5KRDP6nW' \
    --namespace "$AB_NAMESPACE" \
    --region '3Tzf731Q' \
    --version 'CHBGkb0r' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'QcqlZ5jl' \
    --namespace "$AB_NAMESPACE" \
    --region 'tj8sgXdq' \
    --version '4qtsP0d4' \
    --body '{"buffer_count": 25, "buffer_percent": 97, "max_count": 31, "min_count": 21, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '20' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'VTvwqG8l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'kXPESI4f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 54, "mem_limit": 64, "params": "yKYwSb2H"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'Ib98lybP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'GU0JFLis' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 28, "mem_limit": 36, "name": "omBPxOIo", "params": "rdBlRjLo"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '7cMACaSs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 10}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'SlFJXRGz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'h97HhnXK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ArD1ECsg", "port": 72}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '4j26M38D' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '85' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'nLzSFRkZ' \
    --version 'ROWDLvPI' \
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
    --imageURI 'GATPCQTT' \
    --version 'PFfiLk9j' \
    --versionPatch 'RzoCyLLu' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'UA8BlR9X' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '9joee1Yd' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'OaGzwH9m' \
    --versionPatch 'xFZO4d81' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'jzEgcufG' \
    --count '99' \
    --offset '54' \
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
    --region 'roy9LcIm' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'oTh5XJWe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'ZK7ubjih' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'xStxvImU' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'n9UtYPL6' \
    > test.out 2>&1
eval_tap $? 51 'GetServerLogs' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'SB9tBwfo' \
    --withServer  \
    --count '90' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '7IJ7VZjH' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'UvN3LeWc' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'ExportConfigV1' test.out

#- 56 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 56 'ImportConfigV1' test.out

#- 57 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'ImageLimitClient' test.out

#- 58 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'IAV9PxEi' \
    > test.out 2>&1
eval_tap $? 58 'ImageDetailClient' test.out

#- 59 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "WqvcSWAV"}' \
    > test.out 2>&1
eval_tap $? 59 'DeregisterLocalServer' test.out

#- 60 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "zZC3dgen", "ip": "hUDopW3C", "name": "zf8jcUzs", "port": 73}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterLocalServer' test.out

#- 61 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "oeWhOONf", "pod_name": "QKvLYLp6"}' \
    > test.out 2>&1
eval_tap $? 61 'RegisterServer' test.out

#- 62 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "jO5o9GYb"}' \
    > test.out 2>&1
eval_tap $? 62 'ShutdownServer' test.out

#- 63 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'UzJ71F3s' \
    > test.out 2>&1
eval_tap $? 63 'GetServerSession' test.out

#- 64 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "JgtLgJ2S", "configuration": "o2zzksGq", "deployment": "6Hg2vvcB", "game_mode": "aKcXbxLK", "matching_allies": [{"matching_parties": [{"party_attributes": {"Hd5NMDFb": {}, "FEB6YJfk": {}, "9bwjLLOv": {}}, "party_id": "ok9PuVor", "party_members": [{"user_id": "stpOTF6J"}, {"user_id": "Ys31Y7sc"}, {"user_id": "Uj50WdlJ"}]}, {"party_attributes": {"17Ao5UEE": {}, "poCeO6Qu": {}, "Ehh7qh81": {}}, "party_id": "HRl086oH", "party_members": [{"user_id": "HX0SRTeY"}, {"user_id": "jOrXagqX"}, {"user_id": "ywmHDPuU"}]}, {"party_attributes": {"cyt7rZIE": {}, "GT3mLWXv": {}, "05ML4dMm": {}}, "party_id": "L0GnPcpo", "party_members": [{"user_id": "FeQNo3d4"}, {"user_id": "455GguD2"}, {"user_id": "8VsQWhjv"}]}]}, {"matching_parties": [{"party_attributes": {"0OY9Rk5N": {}, "Alkv49kg": {}, "lSuN4Hvm": {}}, "party_id": "piL3we3r", "party_members": [{"user_id": "m24P7xmR"}, {"user_id": "hK3WtENQ"}, {"user_id": "tbWYQedt"}]}, {"party_attributes": {"tVRwdqfR": {}, "IB2taaXw": {}, "zcDJ6hfy": {}}, "party_id": "ODjQzlE9", "party_members": [{"user_id": "hsEt3hUy"}, {"user_id": "6MbCNGYn"}, {"user_id": "7lvuyaof"}]}, {"party_attributes": {"cnNmRK7J": {}, "Awdfbb9K": {}, "ZNZAuR8H": {}}, "party_id": "9G0rP8ry", "party_members": [{"user_id": "zLb8F4zr"}, {"user_id": "TrUiFyyU"}, {"user_id": "WLBNCYeS"}]}]}, {"matching_parties": [{"party_attributes": {"1l4PIVIJ": {}, "cS7uqGoH": {}, "XYgePf8P": {}}, "party_id": "XQb2XR5K", "party_members": [{"user_id": "rKx9bbKl"}, {"user_id": "IyPMqkuZ"}, {"user_id": "uM41dn37"}]}, {"party_attributes": {"2rRh3Xuw": {}, "O5F8au8T": {}, "mVmzbHlM": {}}, "party_id": "q5tRftzd", "party_members": [{"user_id": "CQoAb5VK"}, {"user_id": "AmRSaoTC"}, {"user_id": "yIdEDcMI"}]}, {"party_attributes": {"5cAgN43x": {}, "QzhWFZpQ": {}, "JctZluJO": {}}, "party_id": "VHeJIRLW", "party_members": [{"user_id": "zD3NTKFa"}, {"user_id": "cpHR0Q0X"}, {"user_id": "rTqCWQIb"}]}]}], "namespace": "wOzAiADQ", "notification_payload": {}, "pod_name": "Fppf9yLm", "region": "kC6fy4eV", "session_id": "X3HXn2G6"}' \
    > test.out 2>&1
eval_tap $? 64 'CreateSession' test.out

#- 65 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "6snx1iKP"}' \
    > test.out 2>&1
eval_tap $? 65 'ClaimServer' test.out

#- 66 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '20M0SwXe' \
    > test.out 2>&1
eval_tap $? 66 'GetSession' test.out

#- 67 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 67 'GetDefaultProvider' test.out

#- 68 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 68 'ListProviders' test.out

#- 69 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region '69d0dXBZ' \
    > test.out 2>&1
eval_tap $? 69 'ListProvidersByRegion' test.out

#- 70 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 70 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE