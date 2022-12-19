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
    --body '{"artifactPath": "9oPsNNuR", "image": "vFVo9GHO", "namespace": "gmV2it6l", "persistent": true, "version": "uMfXB86r"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "CufqGGJj", "dockerPath": "F2C5CpC8", "image": "fOMUJlCu", "imageSize": 2, "namespace": "9VPykQik", "persistent": true, "version": "E1W7mtTA"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "ohiyVQwb", "dockerPath": "FRhpI2qm", "image": "OGkqDMR6", "imageSize": 86, "namespace": "5YVYYSZ7", "patchVersion": "bRFJFm7l", "persistent": true, "version": "LklP39Z5"}' \
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
    --body '{"claim_timeout": 65, "creation_timeout": 100, "default_version": "p9py58FN", "port": 78, "ports": {"z3bVHkqv": 27, "tQjmC95N": 46, "ggz77fWK": 31}, "protocol": "3tjufi8z", "providers": ["NhwOxAqs", "gLEaLsPO", "MVO1iyUo"], "session_timeout": 10, "unreachable_timeout": 45}' \
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
    --body '{"claim_timeout": 22, "creation_timeout": 22, "default_version": "fcjp2jCw", "port": 84, "protocol": "x0cl1Gbu", "providers": ["yyt54Pgl", "zC8yayRx", "L4PjhBHA"], "session_timeout": 100, "unreachable_timeout": 8}' \
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
    --name 'L56hI7xu' \
    --count '27' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'I1wOobCd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'iLLACmQ1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 90, "buffer_percent": 66, "configuration": "qYMZpAB4", "enable_region_overrides": false, "game_version": "hjQmEpEz", "max_count": 45, "min_count": 62, "overrides": {"G1Ucctkn": {"buffer_count": 95, "buffer_percent": 98, "configuration": "08n9CbHF", "enable_region_overrides": true, "game_version": "5upKlJDM", "max_count": 6, "min_count": 94, "name": "rv99dBxX", "region_overrides": {"m3GYAmmt": {"buffer_count": 58, "buffer_percent": 100, "max_count": 68, "min_count": 23, "name": "zecaU8DO", "unlimited": true, "use_buffer_percent": false}, "dC8gXXVD": {"buffer_count": 36, "buffer_percent": 92, "max_count": 69, "min_count": 47, "name": "3NXHDvDh", "unlimited": true, "use_buffer_percent": false}, "PEk61HXr": {"buffer_count": 74, "buffer_percent": 78, "max_count": 55, "min_count": 87, "name": "L996Z1bW", "unlimited": false, "use_buffer_percent": false}}, "regions": ["gvcm7vHA", "EvbDR4T0", "QMbq50O3"], "session_timeout": 54, "unlimited": true, "use_buffer_percent": true}, "ELk7JHGQ": {"buffer_count": 60, "buffer_percent": 77, "configuration": "RQfzdusc", "enable_region_overrides": false, "game_version": "Ek86VAtk", "max_count": 80, "min_count": 0, "name": "PKmZwNDO", "region_overrides": {"oDfQXSjE": {"buffer_count": 67, "buffer_percent": 36, "max_count": 89, "min_count": 9, "name": "XpZopEZ3", "unlimited": false, "use_buffer_percent": false}, "IxnDOwBC": {"buffer_count": 18, "buffer_percent": 41, "max_count": 39, "min_count": 40, "name": "ZVQFqdpx", "unlimited": false, "use_buffer_percent": false}, "om2MRm1O": {"buffer_count": 65, "buffer_percent": 20, "max_count": 53, "min_count": 1, "name": "Sc5uQvI9", "unlimited": false, "use_buffer_percent": false}}, "regions": ["lWcXe4hY", "BFzDrWu6", "JmZrUHvO"], "session_timeout": 77, "unlimited": false, "use_buffer_percent": false}, "TI0PKz6J": {"buffer_count": 74, "buffer_percent": 13, "configuration": "TBdrH4pR", "enable_region_overrides": true, "game_version": "B1CqyDTE", "max_count": 3, "min_count": 36, "name": "6BGYFDRL", "region_overrides": {"2sOPH9BE": {"buffer_count": 52, "buffer_percent": 26, "max_count": 33, "min_count": 86, "name": "vsHI6Pve", "unlimited": true, "use_buffer_percent": true}, "ocreD39d": {"buffer_count": 26, "buffer_percent": 61, "max_count": 12, "min_count": 72, "name": "CUbtK8YU", "unlimited": false, "use_buffer_percent": true}, "XdDDGzsS": {"buffer_count": 43, "buffer_percent": 42, "max_count": 37, "min_count": 87, "name": "bS0Y93Ec", "unlimited": true, "use_buffer_percent": false}}, "regions": ["TuWrJkdi", "qxSLn0pa", "DhYn92o4"], "session_timeout": 12, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"ICV4nFG6": {"buffer_count": 3, "buffer_percent": 60, "max_count": 35, "min_count": 85, "name": "PwfuNZwz", "unlimited": false, "use_buffer_percent": false}, "niIawpIs": {"buffer_count": 54, "buffer_percent": 21, "max_count": 8, "min_count": 89, "name": "L3UqbwJP", "unlimited": true, "use_buffer_percent": false}, "pbmJpmVZ": {"buffer_count": 49, "buffer_percent": 32, "max_count": 32, "min_count": 58, "name": "TMZR5JMB", "unlimited": true, "use_buffer_percent": true}}, "regions": ["6wMUYro8", "vVlSXR0K", "7z0GauHs"], "session_timeout": 96, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment '9jBSEnN9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment '35bt8DKg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 18, "buffer_percent": 81, "configuration": "O2pQ4olQ", "enable_region_overrides": false, "game_version": "bE8m6EME", "max_count": 25, "min_count": 49, "regions": ["07KEWzh9", "Gg1hf5IL", "loB9HzXT"], "session_timeout": 81, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'A8L0j8DW' \
    --namespace "$AB_NAMESPACE" \
    --region 'z76FSaG9' \
    --body '{"buffer_count": 47, "buffer_percent": 59, "max_count": 37, "min_count": 15, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'p7wIPTJk' \
    --namespace "$AB_NAMESPACE" \
    --region 'orTATM9w' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'b60qkvV6' \
    --namespace "$AB_NAMESPACE" \
    --region 'dvm8kRLp' \
    --body '{"buffer_count": 36, "buffer_percent": 55, "max_count": 37, "min_count": 83, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'kPXezBm7' \
    --namespace "$AB_NAMESPACE" \
    --version 'wO9VT4O7' \
    --body '{"buffer_count": 9, "buffer_percent": 87, "configuration": "17872zI2", "enable_region_overrides": true, "game_version": "oWYnfpxt", "max_count": 0, "min_count": 58, "region_overrides": {"key0W5f6": {"buffer_count": 95, "buffer_percent": 96, "max_count": 42, "min_count": 90, "name": "gUCrqV9U", "unlimited": true, "use_buffer_percent": true}, "YYMPRAsj": {"buffer_count": 72, "buffer_percent": 35, "max_count": 53, "min_count": 53, "name": "U9MzJg4h", "unlimited": false, "use_buffer_percent": true}, "gX7coIyw": {"buffer_count": 53, "buffer_percent": 21, "max_count": 14, "min_count": 72, "name": "NY2JzrQI", "unlimited": true, "use_buffer_percent": true}}, "regions": ["Dc2cZ9sF", "4EVGgZRG", "5WWpQ9Xb"], "session_timeout": 18, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'GRRLKUEh' \
    --namespace "$AB_NAMESPACE" \
    --version 'SSYhXxXv' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'eCNupOVj' \
    --namespace "$AB_NAMESPACE" \
    --version 'GxIhlTf8' \
    --body '{"buffer_count": 68, "buffer_percent": 45, "configuration": "8FgVb75M", "enable_region_overrides": true, "game_version": "UhFkivX7", "max_count": 51, "min_count": 77, "regions": ["w13sUryf", "HNM8yLix", "IoOcVCFl"], "session_timeout": 19, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'yOkQprzD' \
    --namespace "$AB_NAMESPACE" \
    --region 'OnvJNDUA' \
    --version 'I4yoeaBz' \
    --body '{"buffer_count": 66, "buffer_percent": 18, "max_count": 77, "min_count": 61, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'MzxJQdz9' \
    --namespace "$AB_NAMESPACE" \
    --region 'hdr7IDIB' \
    --version '7oBTyOsI' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'tq1DEab0' \
    --namespace "$AB_NAMESPACE" \
    --region 'nQWdn0Gv' \
    --version 'RgeGBeVA' \
    --body '{"buffer_count": 100, "buffer_percent": 23, "max_count": 31, "min_count": 15, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '39' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'tHtphd9d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'xprV7SOZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 13, "mem_limit": 36, "params": "5CMw7lRx"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'McfA3ePc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'hngC42Te' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 37, "mem_limit": 65, "name": "KMh8yIsB", "params": "rd9a8d2z"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '4JrCs4Jo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 7}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '54ZtCYmv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'lEGfWrFD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "odipOR4G", "port": 62}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'TLvf7VAe' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '7' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'KIzPCYfq' \
    --version 'iLMrKLmD' \
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
    --imageURI 'OjuLM8ie' \
    --version '5s4cHHX0' \
    --versionPatch 'YFi8JUVT' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'blTVIzy7' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'P8M8kNZs' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'R7g0rxzk' \
    --versionPatch 'UPgugtD8' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'sD4K61uV' \
    --count '84' \
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
    --region 'FYSCOwfx' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name '3p6mFzdJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '28W2m1S1' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName '2FqT03rk' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'sRgdyqnV' \
    --withServer  \
    --count '89' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'SsOO9e7Z' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'mD9ee2jJ' \
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
    --version 'U3hBvBUe' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "TgcMA8jj"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ohvDIsML", "ip": "9pdujgKa", "name": "LFkgAC16", "port": 90}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "crn0W0Az", "pod_name": "UFkJQPqj"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "1sVTTsCC"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'SG3qjAu0' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "BAgrzZkA", "configuration": "VOsI0Lmc", "deployment": "xvmUfVct", "game_mode": "0qsSeR8y", "matching_allies": [{"matching_parties": [{"party_attributes": {"rND9hexL": {}, "kCZeUKD4": {}, "oM5is4AY": {}}, "party_id": "yxF4a1AD", "party_members": [{"user_id": "5uJmaX9d"}, {"user_id": "KqCUr7Xz"}, {"user_id": "uVtQXTfr"}]}, {"party_attributes": {"n73Vl9Lq": {}, "UhRjduuo": {}, "YiprBBdK": {}}, "party_id": "F0B4XwzK", "party_members": [{"user_id": "DR7dDbVb"}, {"user_id": "fFkMgpQq"}, {"user_id": "PXrw2t4x"}]}, {"party_attributes": {"JjkNlN0B": {}, "w176ABqA": {}, "bZMMmMH8": {}}, "party_id": "a3zphUYt", "party_members": [{"user_id": "l5HZzP3X"}, {"user_id": "IVbbiZx0"}, {"user_id": "HFKC22u4"}]}]}, {"matching_parties": [{"party_attributes": {"JVKU4JWJ": {}, "BnjNtnL1": {}, "B2oPPKUd": {}}, "party_id": "G48zFK09", "party_members": [{"user_id": "k4upGsrA"}, {"user_id": "WOCQJDU6"}, {"user_id": "mxj0Yg8z"}]}, {"party_attributes": {"0it32pgB": {}, "KHMn4cMu": {}, "od5AxCcT": {}}, "party_id": "1d8n8GxL", "party_members": [{"user_id": "xquqKRdk"}, {"user_id": "AbOV6OBZ"}, {"user_id": "lAAQqQDw"}]}, {"party_attributes": {"Ev2Kf6HQ": {}, "7L0IkfgS": {}, "38shPS0r": {}}, "party_id": "8r6b7RwO", "party_members": [{"user_id": "Sl0SSuCQ"}, {"user_id": "ePThm5kS"}, {"user_id": "Qc1QQBaO"}]}]}, {"matching_parties": [{"party_attributes": {"dHzvqfDW": {}, "1g8Zxmwe": {}, "kxrYXRBI": {}}, "party_id": "YGR6djCR", "party_members": [{"user_id": "MvvE6oui"}, {"user_id": "QvvdrI6Q"}, {"user_id": "fPNNrPbh"}]}, {"party_attributes": {"bmGblBIM": {}, "pa2EL69t": {}, "ku88fGve": {}}, "party_id": "MQSE80A2", "party_members": [{"user_id": "39yOVuwV"}, {"user_id": "oauLJtAI"}, {"user_id": "p6gvDQV5"}]}, {"party_attributes": {"wqAmzlAG": {}, "OTuXQjKc": {}, "OObCRoDz": {}}, "party_id": "DyKDMpe2", "party_members": [{"user_id": "DlIr3kpK"}, {"user_id": "A4IZv0Pv"}, {"user_id": "HpjKJZRK"}]}]}], "namespace": "CdXSC5HL", "notification_payload": {}, "pod_name": "HbdO73N2", "region": "twV9DeKm", "session_id": "IeOlm39Z"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "zNNKCJgJ"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'qtSsR1MR' \
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
    --region 'JhkT18Xs' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE