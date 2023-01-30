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
    --body '{"artifactPath": "gaO0iBBj", "image": "DPwRgopb", "namespace": "793ri9Om", "persistent": true, "version": "Bs4Wq89G"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "QRBuW95q", "dockerPath": "1Oh01MMd", "image": "LtKB2WFk", "imageSize": 77, "namespace": "OP5n9blm", "persistent": false, "version": "H5RrxHaD"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "87PM6fHW", "dockerPath": "Nab0FJNl", "image": "D9YOeNW1", "imageSize": 17, "namespace": "wC1mjgrt", "patchVersion": "QxwIZOhl", "persistent": true, "version": "yIFHyKcW"}' \
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
    --body '{"claim_timeout": 82, "creation_timeout": 49, "default_version": "vTUeApfe", "port": 49, "ports": {"QXMyA1C4": 5, "f6fmWaza": 15, "KdWqedjz": 23}, "protocol": "aCcaZlE5", "providers": ["Uk3qJwFR", "J14jxeRb", "IobZmI5i"], "session_timeout": 28, "unreachable_timeout": 86}' \
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
    --body '{"claim_timeout": 19, "creation_timeout": 68, "default_version": "wZUKM8Y5", "port": 27, "protocol": "xRuDjSeG", "providers": ["xRTJ25CY", "BicDpdGI", "4w3fTdGG"], "session_timeout": 94, "unreachable_timeout": 12}' \
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
    --name 'zSL8aemQ' \
    --count '51' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'KXvrjX3m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment '6LFHxo2r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 65, "buffer_percent": 75, "configuration": "7iFrUtTI", "enable_region_overrides": true, "game_version": "ayAQl9xD", "max_count": 16, "min_count": 27, "overrides": {"f4BoQfpO": {"buffer_count": 89, "buffer_percent": 57, "configuration": "EolzdxvJ", "enable_region_overrides": true, "game_version": "lzxEv3CZ", "max_count": 34, "min_count": 77, "name": "GURrLp4J", "region_overrides": {"ur1ZMbqr": {"buffer_count": 45, "buffer_percent": 89, "max_count": 66, "min_count": 90, "name": "tllT4svb", "unlimited": false, "use_buffer_percent": true}, "4kkBAByh": {"buffer_count": 91, "buffer_percent": 22, "max_count": 94, "min_count": 71, "name": "ezgbMLqi", "unlimited": true, "use_buffer_percent": true}, "PjibclbQ": {"buffer_count": 50, "buffer_percent": 53, "max_count": 45, "min_count": 55, "name": "3r8K5CVY", "unlimited": true, "use_buffer_percent": true}}, "regions": ["k2eF1DiC", "c0CZ00xB", "7SfvIZ0E"], "session_timeout": 51, "unlimited": true, "use_buffer_percent": true}, "xVDLvRqQ": {"buffer_count": 7, "buffer_percent": 53, "configuration": "Zip0dolS", "enable_region_overrides": false, "game_version": "MsOt1dUN", "max_count": 14, "min_count": 13, "name": "kMhYA1s1", "region_overrides": {"wEph6gCh": {"buffer_count": 36, "buffer_percent": 91, "max_count": 6, "min_count": 59, "name": "eOcZM5zX", "unlimited": false, "use_buffer_percent": true}, "Iv5xg7h5": {"buffer_count": 7, "buffer_percent": 78, "max_count": 7, "min_count": 1, "name": "FMOh4AdM", "unlimited": true, "use_buffer_percent": true}, "CG7KVeCy": {"buffer_count": 20, "buffer_percent": 25, "max_count": 72, "min_count": 77, "name": "2ggvI7bA", "unlimited": true, "use_buffer_percent": true}}, "regions": ["09QEqaRW", "3izUwKYH", "JQVSqcJ1"], "session_timeout": 32, "unlimited": true, "use_buffer_percent": false}, "ijwyi0uZ": {"buffer_count": 15, "buffer_percent": 22, "configuration": "uBw5cki1", "enable_region_overrides": false, "game_version": "XosUZkg2", "max_count": 93, "min_count": 88, "name": "1QRh5XSh", "region_overrides": {"gzu4wZmH": {"buffer_count": 67, "buffer_percent": 95, "max_count": 26, "min_count": 32, "name": "ko77hrhU", "unlimited": true, "use_buffer_percent": true}, "etPCIbLs": {"buffer_count": 30, "buffer_percent": 49, "max_count": 4, "min_count": 65, "name": "GKkiyhYm", "unlimited": true, "use_buffer_percent": false}, "zBwTrAU6": {"buffer_count": 19, "buffer_percent": 33, "max_count": 64, "min_count": 80, "name": "QdVfNOTm", "unlimited": true, "use_buffer_percent": false}}, "regions": ["F0QPrNwu", "D2Wct5T8", "Lsp7ZxyB"], "session_timeout": 7, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"HPHKxN9h": {"buffer_count": 17, "buffer_percent": 71, "max_count": 16, "min_count": 99, "name": "Gmnoiax8", "unlimited": true, "use_buffer_percent": true}, "eSLCtV21": {"buffer_count": 88, "buffer_percent": 4, "max_count": 3, "min_count": 19, "name": "zINyYuKG", "unlimited": false, "use_buffer_percent": false}, "eJEV2WoU": {"buffer_count": 35, "buffer_percent": 6, "max_count": 85, "min_count": 24, "name": "PucvNrBY", "unlimited": true, "use_buffer_percent": true}}, "regions": ["m3ZbLp69", "zBTUgciO", "nYncdAGf"], "session_timeout": 36, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment '4PcVSWRQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'VnsFhNNC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 27, "buffer_percent": 27, "configuration": "7dEXxWx8", "enable_region_overrides": false, "game_version": "j8hkU57S", "max_count": 11, "min_count": 81, "regions": ["bGWtxBor", "LbO0Z7FN", "VDGXWkV3"], "session_timeout": 35, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'F0opOTkq' \
    --namespace "$AB_NAMESPACE" \
    --region 'UEXVgpMw' \
    --body '{"buffer_count": 76, "buffer_percent": 49, "max_count": 30, "min_count": 90, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'KNwpc6K7' \
    --namespace "$AB_NAMESPACE" \
    --region 'Wg0Eq49q' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '887gBgVt' \
    --namespace "$AB_NAMESPACE" \
    --region 'P9ralt0A' \
    --body '{"buffer_count": 0, "buffer_percent": 72, "max_count": 12, "min_count": 98, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'Csx8BMqB' \
    --namespace "$AB_NAMESPACE" \
    --version 'Pjf645uO' \
    --body '{"buffer_count": 61, "buffer_percent": 8, "configuration": "s24ZplnB", "enable_region_overrides": false, "game_version": "Je2mK7G9", "max_count": 44, "min_count": 22, "region_overrides": {"8m6THXl1": {"buffer_count": 54, "buffer_percent": 12, "max_count": 98, "min_count": 5, "name": "YybB6p17", "unlimited": true, "use_buffer_percent": true}, "kJE7L0ap": {"buffer_count": 41, "buffer_percent": 1, "max_count": 14, "min_count": 13, "name": "0za3XGSR", "unlimited": true, "use_buffer_percent": true}, "5qtKPdjG": {"buffer_count": 10, "buffer_percent": 21, "max_count": 82, "min_count": 66, "name": "NCA7cEjU", "unlimited": true, "use_buffer_percent": false}}, "regions": ["ZYXwtONF", "MWbcWdf8", "8srVDYDZ"], "session_timeout": 31, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '5Lb1rqLP' \
    --namespace "$AB_NAMESPACE" \
    --version 'AK4VFYYG' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment '51Txm6Qy' \
    --namespace "$AB_NAMESPACE" \
    --version 'Csc64AxF' \
    --body '{"buffer_count": 85, "buffer_percent": 33, "configuration": "qHvYFPXc", "enable_region_overrides": false, "game_version": "JMu6sKh8", "max_count": 24, "min_count": 83, "regions": ["yrJxzqQo", "4zgq33td", "oJkKwDE0"], "session_timeout": 43, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'VJXsM0KG' \
    --namespace "$AB_NAMESPACE" \
    --region 'OjDOnfoM' \
    --version 'wABHF0Zc' \
    --body '{"buffer_count": 97, "buffer_percent": 51, "max_count": 74, "min_count": 87, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'BquuBuRf' \
    --namespace "$AB_NAMESPACE" \
    --region 'TjKqgBLG' \
    --version 'Ml1UU3Ej' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '2luGFjIx' \
    --namespace "$AB_NAMESPACE" \
    --region '4gYSA0mE' \
    --version 'bxRnDjFu' \
    --body '{"buffer_count": 34, "buffer_percent": 46, "max_count": 84, "min_count": 9, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '46' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'LeQ4Yfga' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'K3HVgz0P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 89, "mem_limit": 8, "params": "Zx10q4r1"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'LWTyWxKM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'IOg2BSjs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 72, "mem_limit": 35, "name": "YgzlJw5B", "params": "y9OGtX9Z"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '2yd6mszG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 66}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'ceIgaYK1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'rLaQ9Owq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "zo4YSvBZ", "port": 82}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'ygKYIxXd' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '9' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'BgAvOvTc' \
    --version 'E2tFz7Bq' \
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
    --imageURI 'JfvPE6SV' \
    --version 'oLmlCx8G' \
    --versionPatch 'UjleV9ll' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'WiJXIIDW' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '6MEvDQwZ' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'YcUTwkqg' \
    --versionPatch '0I72bF45' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'lqly0uym' \
    --count '99' \
    --offset '9' \
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
    --region 'x38UKA0S' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'DMRAVdDA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '2aHkEODZ' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'Lh7zQX84' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '93z4Z8Ai' \
    --withServer  \
    --count '30' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'TotHQ3Y9' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'JXMtu87m' \
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
    --version 'QJDu7DoN' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "iLLlBg74"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "apWkpjeW", "ip": "9Ea9aie8", "name": "UE6WC1i5", "port": 92}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "p2DSX3rx", "pod_name": "VCtU8XZX"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "biy5vnlD"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '7no3E4Kc' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "RQuyKjzD", "configuration": "lWdRj1Dm", "deployment": "n546aPSr", "game_mode": "mJgBK3Kt", "matching_allies": [{"matching_parties": [{"party_attributes": {"d2VS4HWK": {}, "cIFtxGUS": {}, "0ihO7xEk": {}}, "party_id": "GkKYEE9w", "party_members": [{"user_id": "7D6aYyvq"}, {"user_id": "DlooHfb4"}, {"user_id": "QFKmL1pE"}]}, {"party_attributes": {"H3sIm4im": {}, "ix1RRG6H": {}, "CAHarwMr": {}}, "party_id": "1W0Dvhez", "party_members": [{"user_id": "DpywRvqE"}, {"user_id": "XRGNTs6z"}, {"user_id": "nOV0irGM"}]}, {"party_attributes": {"Yg7ZUjod": {}, "6usejlV6": {}, "yTmfUbGH": {}}, "party_id": "UTYoeXtP", "party_members": [{"user_id": "pO24cDbn"}, {"user_id": "XZkN45jM"}, {"user_id": "0ymVAu8c"}]}]}, {"matching_parties": [{"party_attributes": {"oMuLg5X5": {}, "EmvpeRK7": {}, "hgXtE7sc": {}}, "party_id": "ENWXOYCT", "party_members": [{"user_id": "uj3VeGHN"}, {"user_id": "aylPnU3T"}, {"user_id": "wVIUUwDt"}]}, {"party_attributes": {"MumjgXki": {}, "XbfSnw9G": {}, "T7cbkWRG": {}}, "party_id": "hMBi7toc", "party_members": [{"user_id": "4HlSobtC"}, {"user_id": "zLXUpTse"}, {"user_id": "HPOq364X"}]}, {"party_attributes": {"Ucj2munU": {}, "yiJpNkaA": {}, "huDc3ZyJ": {}}, "party_id": "vaWpS5Vm", "party_members": [{"user_id": "2q2o3N8I"}, {"user_id": "WK8zEzfG"}, {"user_id": "FYWQACOD"}]}]}, {"matching_parties": [{"party_attributes": {"XOwb9OK3": {}, "4O419fbc": {}, "RbYEO1jd": {}}, "party_id": "xEOk4D3Z", "party_members": [{"user_id": "KxKVMPPh"}, {"user_id": "M0hBWnEw"}, {"user_id": "tCKa7LZi"}]}, {"party_attributes": {"8ErzuIAR": {}, "kQKlU519": {}, "1lxRyUk6": {}}, "party_id": "WOosS3Ng", "party_members": [{"user_id": "BwKkUOnM"}, {"user_id": "S9UiX2AV"}, {"user_id": "7yq0WuI7"}]}, {"party_attributes": {"Yf5RSQML": {}, "nWg4ONUM": {}, "cqpFKq8D": {}}, "party_id": "YViK2nFw", "party_members": [{"user_id": "39leMLgx"}, {"user_id": "wtd50Bq3"}, {"user_id": "ioZfGQJ4"}]}]}], "namespace": "DFON0vp5", "notification_payload": {}, "pod_name": "8ZQqWunJ", "region": "5tIo5gd1", "session_id": "MDwF7OKO"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "D0hTAZ2I"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'J19Dy2Ch' \
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
    --region 'e2QHLQnK' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE