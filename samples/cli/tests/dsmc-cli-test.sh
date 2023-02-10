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
    --body '{"artifactPath": "Zozx2LtK", "image": "w19fFX3E", "namespace": "758CKshA", "persistent": false, "version": "81hCaHGc"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "k8hGzH83", "dockerPath": "fLUDw1zD", "image": "vHesbyGW", "imageSize": 32, "namespace": "JnyeLL6y", "persistent": false, "version": "d9oXpRJ2"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "HuF7EnA2", "dockerPath": "BipBzrU2", "image": "Mo8TYFer", "imageSize": 15, "namespace": "9bw1ixWb", "patchVersion": "XlsOoxim", "persistent": false, "version": "ajTReDtv"}' \
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
    --body '{"claim_timeout": 79, "creation_timeout": 90, "default_version": "5mVZcSxy", "port": 12, "ports": {"IhyjFnKF": 67, "ba87p7TJ": 79, "6a9WTEUN": 19}, "protocol": "1R1kUgSJ", "providers": ["GeGEuYDz", "6p7jautG", "K64PkqlJ"], "session_timeout": 0, "unreachable_timeout": 63}' \
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
    --body '{"claim_timeout": 11, "creation_timeout": 4, "default_version": "BgylEa0l", "port": 41, "protocol": "TsiZdXUv", "providers": ["cCMUOPSJ", "JTFxKRdN", "fpCLHgR1"], "session_timeout": 59, "unreachable_timeout": 68}' \
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
    --name 'TAE91tqn' \
    --count '24' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'OOVYpcTX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'OmaniDNL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 1, "buffer_percent": 97, "configuration": "GqIzflN4", "enable_region_overrides": false, "game_version": "n9goxdfK", "max_count": 1, "min_count": 62, "overrides": {"owQgVQm5": {"buffer_count": 85, "buffer_percent": 48, "configuration": "8H3paen9", "enable_region_overrides": true, "game_version": "mUbJ4Z7Z", "max_count": 99, "min_count": 98, "name": "HEoKf7tH", "region_overrides": {"4vu8foWv": {"buffer_count": 58, "buffer_percent": 20, "max_count": 64, "min_count": 49, "name": "FMRZ1JuZ", "unlimited": true, "use_buffer_percent": false}, "gMyrpAnA": {"buffer_count": 87, "buffer_percent": 0, "max_count": 3, "min_count": 60, "name": "n8ioE1MU", "unlimited": false, "use_buffer_percent": false}, "0kTQxCs7": {"buffer_count": 37, "buffer_percent": 79, "max_count": 54, "min_count": 34, "name": "bGs99D2z", "unlimited": false, "use_buffer_percent": true}}, "regions": ["Qw7kfEoP", "OELZRdVT", "7en0RcNA"], "session_timeout": 33, "unlimited": false, "use_buffer_percent": true}, "8FeEDfgJ": {"buffer_count": 84, "buffer_percent": 15, "configuration": "EVFdftZ4", "enable_region_overrides": false, "game_version": "NRuuPuDX", "max_count": 83, "min_count": 30, "name": "WJ0K1iAT", "region_overrides": {"jJuu3rcs": {"buffer_count": 83, "buffer_percent": 19, "max_count": 89, "min_count": 68, "name": "LT3WI64F", "unlimited": true, "use_buffer_percent": false}, "oDseLaIk": {"buffer_count": 38, "buffer_percent": 46, "max_count": 5, "min_count": 48, "name": "HWcT9Sfy", "unlimited": false, "use_buffer_percent": true}, "5dTVNY4j": {"buffer_count": 8, "buffer_percent": 99, "max_count": 86, "min_count": 67, "name": "q6ullqTy", "unlimited": true, "use_buffer_percent": false}}, "regions": ["SR7kAQZh", "vyOVVxnu", "PulaglHe"], "session_timeout": 30, "unlimited": false, "use_buffer_percent": true}, "vVZTDpIH": {"buffer_count": 61, "buffer_percent": 40, "configuration": "UQomZMDP", "enable_region_overrides": true, "game_version": "m3iSTIm6", "max_count": 28, "min_count": 94, "name": "EyIp0ZIA", "region_overrides": {"SyV4dIy9": {"buffer_count": 77, "buffer_percent": 18, "max_count": 49, "min_count": 58, "name": "WxfBcq7W", "unlimited": false, "use_buffer_percent": true}, "1jDvxzOP": {"buffer_count": 31, "buffer_percent": 94, "max_count": 0, "min_count": 8, "name": "L4L0KBlm", "unlimited": true, "use_buffer_percent": false}, "Fg1AuTPz": {"buffer_count": 5, "buffer_percent": 23, "max_count": 41, "min_count": 23, "name": "HSrNOTWW", "unlimited": true, "use_buffer_percent": false}}, "regions": ["hT0El7ct", "pYfUvIIn", "KuDMksc9"], "session_timeout": 20, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"xLQAW1FA": {"buffer_count": 64, "buffer_percent": 7, "max_count": 71, "min_count": 54, "name": "fsBkdIT4", "unlimited": true, "use_buffer_percent": true}, "ogFIErjf": {"buffer_count": 65, "buffer_percent": 38, "max_count": 97, "min_count": 27, "name": "4YLXf6Wq", "unlimited": false, "use_buffer_percent": false}, "KUEOgKNr": {"buffer_count": 67, "buffer_percent": 47, "max_count": 3, "min_count": 68, "name": "yfFJmH2o", "unlimited": false, "use_buffer_percent": true}}, "regions": ["OIRAVVUe", "gagPWOVx", "jQev5Jlb"], "session_timeout": 5, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'ZgOX8QgH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'DV66lJhP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 42, "buffer_percent": 51, "configuration": "TsFdUtJF", "enable_region_overrides": true, "game_version": "K6Q0nbNg", "max_count": 47, "min_count": 9, "regions": ["ebjrhafA", "QRObb6KP", "fLoDhpvo"], "session_timeout": 60, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'LDkcBtgM' \
    --namespace "$AB_NAMESPACE" \
    --region 'HB72LRMV' \
    --body '{"buffer_count": 57, "buffer_percent": 79, "max_count": 63, "min_count": 61, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'sCcWIm42' \
    --namespace "$AB_NAMESPACE" \
    --region 'LKrpUjFC' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'Sap4vPSl' \
    --namespace "$AB_NAMESPACE" \
    --region 'Knq7OPDw' \
    --body '{"buffer_count": 53, "buffer_percent": 77, "max_count": 61, "min_count": 54, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'QOajtR7B' \
    --namespace "$AB_NAMESPACE" \
    --version 'ytxV04kp' \
    --body '{"buffer_count": 90, "buffer_percent": 58, "configuration": "dq5dzp79", "enable_region_overrides": false, "game_version": "zotwrr1i", "max_count": 46, "min_count": 37, "region_overrides": {"sWUroYJf": {"buffer_count": 53, "buffer_percent": 33, "max_count": 71, "min_count": 8, "name": "xGiyPXWa", "unlimited": false, "use_buffer_percent": true}, "JiIcAfXD": {"buffer_count": 93, "buffer_percent": 29, "max_count": 35, "min_count": 74, "name": "a7zOQZjU", "unlimited": true, "use_buffer_percent": false}, "X7D71ehh": {"buffer_count": 83, "buffer_percent": 28, "max_count": 94, "min_count": 94, "name": "e3cqdx3w", "unlimited": false, "use_buffer_percent": true}}, "regions": ["AWnykG36", "OedC9ekZ", "ZwMbrEJt"], "session_timeout": 86, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'dTyZWt4P' \
    --namespace "$AB_NAMESPACE" \
    --version 'B5wqgvn9' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'TXwMhJpt' \
    --namespace "$AB_NAMESPACE" \
    --version 'hKPbWRrh' \
    --body '{"buffer_count": 72, "buffer_percent": 20, "configuration": "6YLkPhWY", "enable_region_overrides": true, "game_version": "3q8Z1vUL", "max_count": 58, "min_count": 94, "regions": ["P5SKZ50I", "fpCLgJRw", "lTVdAHD5"], "session_timeout": 81, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'TBCFpasf' \
    --namespace "$AB_NAMESPACE" \
    --region 'jBi1j9jr' \
    --version 'x1PuQ5qA' \
    --body '{"buffer_count": 75, "buffer_percent": 0, "max_count": 68, "min_count": 2, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'jsC3Ocry' \
    --namespace "$AB_NAMESPACE" \
    --region 'mvA8Pp5P' \
    --version 'Dn3KbEKZ' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'fJK0yTKO' \
    --namespace "$AB_NAMESPACE" \
    --region 'B5I6i7bQ' \
    --version 'Mq7HQZlR' \
    --body '{"buffer_count": 27, "buffer_percent": 78, "max_count": 78, "min_count": 0, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '78' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'Je36kbuz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'nUS11szI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 92, "mem_limit": 64, "params": "OTeGoXax"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'BTJcH3ms' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '3C02pv55' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 3, "mem_limit": 47, "name": "fjM8Uy5K", "params": "OBCee8a4"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'Mgc8rymr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 24}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'QUEJwWeV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'br2uccEC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "nQ1evSrP", "port": 65}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'gxxw4vE3' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '70' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'XDH3tgvV' \
    --version 'SzZWzrX3' \
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
    --imageURI 'l6Iwj3k6' \
    --version 'BzUiN8ju' \
    --versionPatch 'AEwaUC9l' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'zwzr2rLE' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'oK3NlSHf' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'ZLxnyikN' \
    --versionPatch 'e1UiowjD' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'b77fBO9j' \
    --count '51' \
    --offset '56' \
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
    --region 'zsnUnne8' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name '5xQVgdjv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'rks6L73Z' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'DMOT7wHp' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'dCg5LF7s' \
    --withServer  \
    --count '74' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'lVY8A1FJ' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'CzgyJ61b' \
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
    --version 'W1A9cTXR' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "qdUQvQQm"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "0GypJwGM", "ip": "QgB4Q4ZH", "name": "dMM1FAlw", "port": 25}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "tF2nGCoI", "pod_name": "VMqmSxGO"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "sZ7zJKHW"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 's1WpKGvV' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "Lgb1YvH4", "configuration": "WMpzdvnl", "deployment": "FG3c9pSf", "game_mode": "2MImZ3GD", "matching_allies": [{"matching_parties": [{"party_attributes": {"ioQhozld": {}, "Qy7Fe83r": {}, "6ejxNr8x": {}}, "party_id": "4W7lXdNp", "party_members": [{"user_id": "GgZ6kf15"}, {"user_id": "U0BK7snV"}, {"user_id": "sY5kptWM"}]}, {"party_attributes": {"gYalVkr1": {}, "Ych5nPUL": {}, "Awdu4xHM": {}}, "party_id": "kulqG8IN", "party_members": [{"user_id": "z1djHbyV"}, {"user_id": "X8sIqM6B"}, {"user_id": "zrf7BeYl"}]}, {"party_attributes": {"ZOhCKwbM": {}, "BxrGcTYW": {}, "bE7iDODZ": {}}, "party_id": "irJMG5Uw", "party_members": [{"user_id": "XVKNlQwJ"}, {"user_id": "QWoewedF"}, {"user_id": "P4ulViqi"}]}]}, {"matching_parties": [{"party_attributes": {"7OiFFqfS": {}, "H1am37vf": {}, "Ke7zyl7Z": {}}, "party_id": "iRQCI6bZ", "party_members": [{"user_id": "h1HCvga3"}, {"user_id": "tCgM2J4C"}, {"user_id": "6ZgCUExZ"}]}, {"party_attributes": {"FwrCtqhe": {}, "iIeR14UD": {}, "7Cki5esH": {}}, "party_id": "ToCuAfxY", "party_members": [{"user_id": "1gtVlf6f"}, {"user_id": "7sRA7TM4"}, {"user_id": "r5FhhYIg"}]}, {"party_attributes": {"V1mkHtNR": {}, "Vx6oqYjA": {}, "sFWoIC5r": {}}, "party_id": "IrSN5CVX", "party_members": [{"user_id": "gnF3JA7K"}, {"user_id": "EdkaeHSY"}, {"user_id": "EzLyOUKN"}]}]}, {"matching_parties": [{"party_attributes": {"JnBrZc6L": {}, "J7xL8LGc": {}, "jXqRo4zQ": {}}, "party_id": "PNYUkrvc", "party_members": [{"user_id": "0C4lwRgN"}, {"user_id": "URv3t7Cb"}, {"user_id": "Vh81jyqq"}]}, {"party_attributes": {"yeZYAt3H": {}, "QcigxAIj": {}, "Z4IxzSuW": {}}, "party_id": "qzy1UF03", "party_members": [{"user_id": "xn8fSVQE"}, {"user_id": "N4yElDi9"}, {"user_id": "qowRXl8U"}]}, {"party_attributes": {"hwspVhxc": {}, "xCRzwycw": {}, "xCV7fxov": {}}, "party_id": "8LFWpVDB", "party_members": [{"user_id": "b1PfEqsY"}, {"user_id": "0KmH8jMV"}, {"user_id": "MqwRlGse"}]}]}], "namespace": "CcTHmxlc", "notification_payload": {}, "pod_name": "RaFa9IYg", "region": "8zfaI3lq", "session_id": "YRtzX6QK"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "FFFzowln"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'AuIpl7fW' \
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
    --region '7Xkjv4hs' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE