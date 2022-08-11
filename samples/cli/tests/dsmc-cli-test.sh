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
    --body '{"artifactPath": "ls2B8RSI", "image": "LjpYzi03", "namespace": "6ZAn9JhV", "persistent": false, "version": "fdmKLjkE"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "kn27Y911", "dockerPath": "sCwZKDeX", "image": "Vc8IN2Yn", "imageSize": 26, "namespace": "m1VUxvSe", "persistent": true, "version": "2mhqELbL"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "LV1tEmV6", "dockerPath": "vAfiNQgQ", "image": "ys5z6nMr", "imageSize": 51, "namespace": "PZUFt0Li", "patchVersion": "DeLmDXEe", "persistent": true, "version": "DQPF8wjY"}' \
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
    --body '{"claim_timeout": 79, "creation_timeout": 76, "default_version": "VniL7fAj", "port": 96, "ports": {"fYIfP4XI": 76, "zQFAIuMs": 29, "FdWUKSka": 60}, "protocol": "2rS9Cgpo", "providers": ["qvEwVqwr", "jdbO2luA", "eEoHQcdD"], "session_timeout": 59, "unreachable_timeout": 4}' \
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
    --body '{"claim_timeout": 69, "creation_timeout": 84, "default_version": "1ChnjRlq", "port": 54, "protocol": "qqFrau5j", "providers": ["vU0QuRhy", "4nzVrsoP", "eqE0Vlvd"], "session_timeout": 14, "unreachable_timeout": 61}' \
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
    --name 'wouH7HGF' \
    --count '43' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '2spPWCtr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'gHIM2HQQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 81, "buffer_percent": 67, "configuration": "kwfi0WD5", "enable_region_overrides": false, "game_version": "wO7Sa0zw", "max_count": 86, "min_count": 11, "overrides": {"Z3oh6Dm2": {"buffer_count": 87, "buffer_percent": 6, "configuration": "cXgqu5W6", "enable_region_overrides": false, "game_version": "li08NYob", "max_count": 5, "min_count": 33, "name": "7oCuAE67", "region_overrides": {"ZFX89uJY": {"buffer_count": 79, "buffer_percent": 58, "max_count": 17, "min_count": 57, "name": "boBmB5sj", "unlimited": true, "use_buffer_percent": false}, "cjqJC7fk": {"buffer_count": 97, "buffer_percent": 48, "max_count": 62, "min_count": 98, "name": "UKyWbuz7", "unlimited": true, "use_buffer_percent": false}, "Gvdcz478": {"buffer_count": 89, "buffer_percent": 89, "max_count": 13, "min_count": 80, "name": "qX9os8jr", "unlimited": false, "use_buffer_percent": true}}, "regions": ["WJrzHYBK", "uMsNeHNL", "ns0e8NRd"], "session_timeout": 7, "unlimited": true, "use_buffer_percent": true}, "cnB4QXeo": {"buffer_count": 31, "buffer_percent": 17, "configuration": "dBV5v4Js", "enable_region_overrides": false, "game_version": "0dKo6SoD", "max_count": 17, "min_count": 38, "name": "NHGdDdD5", "region_overrides": {"DEkOaB8p": {"buffer_count": 73, "buffer_percent": 40, "max_count": 9, "min_count": 76, "name": "ROfV37d8", "unlimited": false, "use_buffer_percent": true}, "oxPaSzNj": {"buffer_count": 83, "buffer_percent": 76, "max_count": 9, "min_count": 38, "name": "6CphD3Wy", "unlimited": false, "use_buffer_percent": true}, "Hsuddorp": {"buffer_count": 9, "buffer_percent": 54, "max_count": 26, "min_count": 49, "name": "0X8JGKli", "unlimited": true, "use_buffer_percent": true}}, "regions": ["TGsBvFhg", "wwgCPyZO", "x8S2y9SQ"], "session_timeout": 56, "unlimited": false, "use_buffer_percent": true}, "Q0isgR47": {"buffer_count": 94, "buffer_percent": 5, "configuration": "8FXJieTR", "enable_region_overrides": true, "game_version": "jln6g5X7", "max_count": 100, "min_count": 16, "name": "HoMPlOX1", "region_overrides": {"ekLXmoaT": {"buffer_count": 82, "buffer_percent": 85, "max_count": 79, "min_count": 76, "name": "K8subEEA", "unlimited": false, "use_buffer_percent": true}, "dVKYL8WW": {"buffer_count": 65, "buffer_percent": 88, "max_count": 22, "min_count": 28, "name": "m6EzUF18", "unlimited": true, "use_buffer_percent": false}, "JfHIao0M": {"buffer_count": 16, "buffer_percent": 57, "max_count": 21, "min_count": 8, "name": "GWjtOtzi", "unlimited": false, "use_buffer_percent": false}}, "regions": ["rsm3pWUr", "UO0jymZI", "gFqZZ6xr"], "session_timeout": 40, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"NX0UrECd": {"buffer_count": 15, "buffer_percent": 3, "max_count": 92, "min_count": 90, "name": "4ia1ys8i", "unlimited": false, "use_buffer_percent": false}, "VOsiA5Vj": {"buffer_count": 8, "buffer_percent": 94, "max_count": 81, "min_count": 51, "name": "rA4cGvdh", "unlimited": true, "use_buffer_percent": true}, "JDCpbQY2": {"buffer_count": 37, "buffer_percent": 48, "max_count": 18, "min_count": 99, "name": "fuTWM5fa", "unlimited": true, "use_buffer_percent": false}}, "regions": ["st0NjYvN", "CGerN3zD", "ZvG2AhI2"], "session_timeout": 8, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'Cs1HRm6c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'T0O0Sjl7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 46, "buffer_percent": 33, "configuration": "lr7QM3p4", "enable_region_overrides": true, "game_version": "xbdcJ1Y4", "max_count": 16, "min_count": 75, "regions": ["QDjD886Y", "tQ4r1Jh9", "mdDKlLiJ"], "session_timeout": 58, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'QTzThiLh' \
    --namespace "$AB_NAMESPACE" \
    --region '5mIQFMGU' \
    --body '{"buffer_count": 66, "buffer_percent": 99, "max_count": 13, "min_count": 34, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'amCjFfr1' \
    --namespace "$AB_NAMESPACE" \
    --region 'fx8DSXAt' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'Doj7oOC5' \
    --namespace "$AB_NAMESPACE" \
    --region 'd0MzZOon' \
    --body '{"buffer_count": 21, "buffer_percent": 76, "max_count": 6, "min_count": 17, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'xZWZnxIo' \
    --namespace "$AB_NAMESPACE" \
    --version 'cpJjftmA' \
    --body '{"buffer_count": 11, "buffer_percent": 61, "configuration": "2To52Gy4", "enable_region_overrides": true, "game_version": "JHK6w2Le", "max_count": 82, "min_count": 87, "region_overrides": {"rh1PRyO2": {"buffer_count": 65, "buffer_percent": 84, "max_count": 65, "min_count": 70, "name": "q32lcc5C", "unlimited": false, "use_buffer_percent": false}, "4Y0MqTUu": {"buffer_count": 3, "buffer_percent": 12, "max_count": 30, "min_count": 12, "name": "KvBsUfV0", "unlimited": true, "use_buffer_percent": false}, "BuzzAsO1": {"buffer_count": 96, "buffer_percent": 19, "max_count": 59, "min_count": 57, "name": "GERk78JF", "unlimited": false, "use_buffer_percent": false}}, "regions": ["fqpu3sl8", "jb0nShfh", "BkTJHuOv"], "session_timeout": 27, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'aWVYhfBo' \
    --namespace "$AB_NAMESPACE" \
    --version 'OTkInPP4' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'a6o2ViCb' \
    --namespace "$AB_NAMESPACE" \
    --version 'FOSLZB0i' \
    --body '{"buffer_count": 61, "buffer_percent": 85, "configuration": "msYJ0IvD", "enable_region_overrides": false, "game_version": "wdHYAhZW", "max_count": 44, "min_count": 12, "regions": ["tVpfi8c1", "PUvld9KD", "0RFVocUm"], "session_timeout": 40, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'NjpWWMnw' \
    --namespace "$AB_NAMESPACE" \
    --region 'm9Njk63z' \
    --version 'E0CJdLcU' \
    --body '{"buffer_count": 65, "buffer_percent": 64, "max_count": 86, "min_count": 0, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'jmiEbmzk' \
    --namespace "$AB_NAMESPACE" \
    --region 'brTgXTTS' \
    --version 'HFLFUwud' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'OFMSO32g' \
    --namespace "$AB_NAMESPACE" \
    --region 'ugiR6Tri' \
    --version 'LdIP0dw7' \
    --body '{"buffer_count": 95, "buffer_percent": 72, "max_count": 63, "min_count": 1, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '31' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'HGjION8y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'K34Obkej' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 25, "mem_limit": 5, "params": "YW5HfLsC"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'Zt4xGsSW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'yFz2oDbc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 86, "mem_limit": 59, "name": "Oy2H2cHD", "params": "ehYCq3XY"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'TD4seRPC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 10}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'gDlKwwPw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'aWqAhqwa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "lqz9WJHX", "port": 24}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'YWGl3ebl' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '2' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'QGFuJza5' \
    --version 'llrGRNwI' \
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
    --imageURI 'u2NhbIfT' \
    --version 'f9bfdaod' \
    --versionPatch 'vsjBMOVv' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'ddSyCg9C' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '7HKPnODJ' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '9mxNvVTH' \
    --versionPatch '76dWwevR' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region '03pjhyur' \
    --count '27' \
    --offset '39' \
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
    --region 'pBFwVOBv' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'CbHaZogA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'TZ0ptTXX' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'hNWWz1wV' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'EGGQtBOB' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'D7AMw0oZ' \
    --withServer  \
    --count '24' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'VrfRCBDq' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'HbGcktWb' \
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
    --version 'sBBtmkJK' \
    > test.out 2>&1
eval_tap $? 56 'ImageDetailClient' test.out

#- 57 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "mjbYu4MW"}' \
    > test.out 2>&1
eval_tap $? 57 'DeregisterLocalServer' test.out

#- 58 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "e8JYc7Ma", "ip": "yxA1TeWQ", "name": "BzDXAdxd", "port": 31}' \
    > test.out 2>&1
eval_tap $? 58 'RegisterLocalServer' test.out

#- 59 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "h9FUdigH", "pod_name": "fLpQRJvy"}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterServer' test.out

#- 60 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "rallNcF6"}' \
    > test.out 2>&1
eval_tap $? 60 'ShutdownServer' test.out

#- 61 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'afs27gnl' \
    > test.out 2>&1
eval_tap $? 61 'GetServerSession' test.out

#- 62 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "DbAQuJzZ", "configuration": "NEkaYlKL", "deployment": "zFte4uJu", "game_mode": "kltbN2ly", "matching_allies": [{"matching_parties": [{"party_attributes": {"X0IZr0jq": {}, "sd9klC2M": {}, "I6uYfA2Q": {}}, "party_id": "h2ADlzC9", "party_members": [{"user_id": "g9DzOxA3"}, {"user_id": "tE2NXkPh"}, {"user_id": "n81xMeWV"}]}, {"party_attributes": {"3OfKMBkj": {}, "yeL9uG7u": {}, "R0oi2FuF": {}}, "party_id": "c8voKBxo", "party_members": [{"user_id": "hjNjZVGZ"}, {"user_id": "BOJnAKh3"}, {"user_id": "hWl31ov3"}]}, {"party_attributes": {"k5wHTWOm": {}, "OYJrqKqt": {}, "ZgIrvqcS": {}}, "party_id": "X552cfav", "party_members": [{"user_id": "NufuKMo8"}, {"user_id": "ph0iilj1"}, {"user_id": "7tnxx0bf"}]}]}, {"matching_parties": [{"party_attributes": {"WU7LpF9X": {}, "wABDUfOa": {}, "KboYV2Q2": {}}, "party_id": "pOjz4Zmq", "party_members": [{"user_id": "p9HcrDBk"}, {"user_id": "7CdBVWYO"}, {"user_id": "iiHHOyRY"}]}, {"party_attributes": {"17qo3O3U": {}, "Fcg3Herv": {}, "dDQOf1EC": {}}, "party_id": "q9cgeOql", "party_members": [{"user_id": "kyOWPONl"}, {"user_id": "tkrkn1ol"}, {"user_id": "YketvVP1"}]}, {"party_attributes": {"Cr1XVHgm": {}, "Gk12NlqE": {}, "Hbv3qRMS": {}}, "party_id": "loBck9rQ", "party_members": [{"user_id": "AirDH0jm"}, {"user_id": "5j8hlbHo"}, {"user_id": "t1zQZAuR"}]}]}, {"matching_parties": [{"party_attributes": {"QARW3ZWg": {}, "uSOaqJ84": {}, "CqFfpR71": {}}, "party_id": "PEdhPVla", "party_members": [{"user_id": "U4wfLo1x"}, {"user_id": "HT72krXa"}, {"user_id": "4RtvfyxZ"}]}, {"party_attributes": {"GinZAFRs": {}, "MbvWUjnC": {}, "RDdwgsY1": {}}, "party_id": "B0JLfb3m", "party_members": [{"user_id": "XWmQFB2K"}, {"user_id": "AaJGJDYR"}, {"user_id": "m2CuJpco"}]}, {"party_attributes": {"kpwGyhUr": {}, "NuGNmRof": {}, "xXcj15Z6": {}}, "party_id": "uqM58Iv9", "party_members": [{"user_id": "Z0kBXn2k"}, {"user_id": "2PEEhpdD"}, {"user_id": "yGagxyLP"}]}]}], "namespace": "xcOYT2oh", "notification_payload": {}, "pod_name": "MsgWnzxk", "region": "RCeMbhES", "session_id": "N3iVPRTu"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateSession' test.out

#- 63 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "Dv5m0VUL"}' \
    > test.out 2>&1
eval_tap $? 63 'ClaimServer' test.out

#- 64 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'HY9kvYkL' \
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
    --region 'KDh9o7fs' \
    > test.out 2>&1
eval_tap $? 67 'ListProvidersByRegion' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE