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
    --body '{"artifactPath": "bRzcr1vB", "image": "vLROTM3E", "namespace": "fuURGg85", "persistent": true, "version": "zWxm6YCP"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "Z3b1Z7C5", "dockerPath": "yiBDJHMC", "image": "VzAZStlC", "imageSize": 51, "namespace": "XgHF7bRo", "persistent": true, "version": "KLgC7bMq"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "GTDC0uwd", "dockerPath": "8Xyx2OY8", "image": "G09BpQGK", "imageSize": 80, "namespace": "Ls6kifo2", "patchVersion": "jyx9BT23", "persistent": true, "version": "gYHDYyO4"}' \
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
    --body '{"claim_timeout": 79, "creation_timeout": 13, "default_version": "ZKoXRH4X", "port": 14, "ports": {"F9aIKS4U": 91, "X1ih5Y7M": 11, "6CJWd7oT": 18}, "protocol": "Aswxk919", "providers": ["5VDfyiwA", "uSNsL4jZ", "H1n7zevl"], "session_timeout": 65, "unreachable_timeout": 65}' \
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
    --body '{"claim_timeout": 38, "creation_timeout": 64, "default_version": "CCkPJHly", "port": 78, "protocol": "oeYyGjnR", "providers": ["pz36XDEz", "LDnqGasG", "bTPZlPv9"], "session_timeout": 24, "unreachable_timeout": 14}' \
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
    --name 'OT370BLc' \
    --count '68' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'nUXYWYnq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'DCv5499Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 84, "buffer_percent": 41, "configuration": "vjEi2hJ8", "enable_region_overrides": true, "game_version": "YVJNKkmY", "max_count": 12, "min_count": 22, "overrides": {"O0IsABFL": {"buffer_count": 51, "buffer_percent": 85, "configuration": "d2CwSmmf", "enable_region_overrides": false, "game_version": "SpxC1ymx", "max_count": 12, "min_count": 66, "name": "G4bLynxr", "region_overrides": {"clHh4h9d": {"buffer_count": 1, "buffer_percent": 53, "max_count": 83, "min_count": 47, "name": "R6oKziiN", "use_buffer_percent": false}, "C1JRbqjW": {"buffer_count": 47, "buffer_percent": 69, "max_count": 33, "min_count": 94, "name": "qhLp814b", "use_buffer_percent": true}, "kQI66E88": {"buffer_count": 88, "buffer_percent": 51, "max_count": 61, "min_count": 57, "name": "zqblgCvJ", "use_buffer_percent": false}}, "regions": ["wv4L0oAb", "xv7F97Hi", "4vdgBldx"], "session_timeout": 87, "use_buffer_percent": true}, "ijUplwJg": {"buffer_count": 94, "buffer_percent": 14, "configuration": "xN2a7Pia", "enable_region_overrides": false, "game_version": "FlXOSpFy", "max_count": 55, "min_count": 77, "name": "TrW173d8", "region_overrides": {"MhmqGsqW": {"buffer_count": 13, "buffer_percent": 14, "max_count": 39, "min_count": 17, "name": "qmBcpNaP", "use_buffer_percent": false}, "cIW3d4ss": {"buffer_count": 39, "buffer_percent": 8, "max_count": 8, "min_count": 45, "name": "lm46IwtQ", "use_buffer_percent": false}, "oLRdPbwx": {"buffer_count": 7, "buffer_percent": 58, "max_count": 98, "min_count": 60, "name": "jdDY6lxj", "use_buffer_percent": false}}, "regions": ["enmQm8q1", "6tGCYusG", "fLeA8rHT"], "session_timeout": 44, "use_buffer_percent": false}, "eZ7DuLI7": {"buffer_count": 70, "buffer_percent": 0, "configuration": "OHMwXsJK", "enable_region_overrides": true, "game_version": "lueQVX7B", "max_count": 58, "min_count": 85, "name": "xxQ9tms5", "region_overrides": {"Jb2W9IsY": {"buffer_count": 82, "buffer_percent": 64, "max_count": 33, "min_count": 98, "name": "Vk74X57Y", "use_buffer_percent": false}, "lcTClifl": {"buffer_count": 74, "buffer_percent": 23, "max_count": 70, "min_count": 86, "name": "T23w1gw8", "use_buffer_percent": true}, "it1qRlAm": {"buffer_count": 88, "buffer_percent": 90, "max_count": 23, "min_count": 63, "name": "WKcGPBcY", "use_buffer_percent": true}}, "regions": ["yufVZON7", "MHZ0J8m1", "FFGx9v6L"], "session_timeout": 5, "use_buffer_percent": false}}, "region_overrides": {"C8vuCU9o": {"buffer_count": 82, "buffer_percent": 49, "max_count": 24, "min_count": 89, "name": "GyI3zaZj", "use_buffer_percent": false}, "R8eYXxND": {"buffer_count": 81, "buffer_percent": 24, "max_count": 40, "min_count": 68, "name": "B4hVha3d", "use_buffer_percent": false}, "f9u4hbx0": {"buffer_count": 2, "buffer_percent": 53, "max_count": 46, "min_count": 96, "name": "RFBjF8r8", "use_buffer_percent": false}}, "regions": ["8qFuwKUb", "vlzP6Ypa", "kulDDzWF"], "session_timeout": 53, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'i0GAErYe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'D79w9SDn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 21, "buffer_percent": 91, "configuration": "g79eXUUD", "enable_region_overrides": false, "game_version": "gcpVUzI8", "max_count": 12, "min_count": 54, "regions": ["uMF5apBQ", "bBeSmv3X", "Dvmpe2wN"], "session_timeout": 44, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'u6Bl2hT4' \
    --namespace "$AB_NAMESPACE" \
    --region 'shrAGLtW' \
    --body '{"buffer_count": 66, "buffer_percent": 25, "max_count": 81, "min_count": 29, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'OijjNoaV' \
    --namespace "$AB_NAMESPACE" \
    --region 'fN3jvPvP' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'wkD7qQKR' \
    --namespace "$AB_NAMESPACE" \
    --region 'ahZG0QGs' \
    --body '{"buffer_count": 3, "buffer_percent": 62, "max_count": 95, "min_count": 72, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'ahtGEdWf' \
    --namespace "$AB_NAMESPACE" \
    --version 'G8ptohQK' \
    --body '{"buffer_count": 1, "buffer_percent": 47, "configuration": "mmLrA4Sz", "enable_region_overrides": true, "game_version": "lpzHkx7E", "max_count": 4, "min_count": 20, "region_overrides": {"wXwkzbOF": {"buffer_count": 72, "buffer_percent": 0, "max_count": 62, "min_count": 71, "name": "eT91DhYt", "use_buffer_percent": false}, "iHwnh3zN": {"buffer_count": 80, "buffer_percent": 76, "max_count": 57, "min_count": 43, "name": "5W0kwJ0y", "use_buffer_percent": false}, "xTetEpfJ": {"buffer_count": 57, "buffer_percent": 87, "max_count": 40, "min_count": 89, "name": "WPUGvjQI", "use_buffer_percent": false}}, "regions": ["gulbemqB", "jRbjo9uG", "d7npINIo"], "session_timeout": 39, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'XLCD4vgM' \
    --namespace "$AB_NAMESPACE" \
    --version 'tHNY393j' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'nVgj1ZUa' \
    --namespace "$AB_NAMESPACE" \
    --version 'SIlDydp1' \
    --body '{"buffer_count": 42, "buffer_percent": 51, "configuration": "OmPUwQMo", "enable_region_overrides": true, "game_version": "RWg8ioNS", "max_count": 85, "min_count": 76, "regions": ["Cb6aZ6cW", "jlZKvBvc", "y0OY7d8A"], "session_timeout": 100, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'AjYuv0sB' \
    --namespace "$AB_NAMESPACE" \
    --region 'VXaClDaa' \
    --version 'zDZzHwTZ' \
    --body '{"buffer_count": 90, "buffer_percent": 6, "max_count": 62, "min_count": 2, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'NYU2HMI2' \
    --namespace "$AB_NAMESPACE" \
    --region 'wj9Uzj5m' \
    --version '01w4evLi' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'onzKS98P' \
    --namespace "$AB_NAMESPACE" \
    --region 'UkRK1SkE' \
    --version 'leOHRd5d' \
    --body '{"buffer_count": 45, "buffer_percent": 32, "max_count": 75, "min_count": 1, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '3' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name '0J7RnT1K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'mZgdUXHv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 4, "mem_limit": 28, "params": "rf39rmmh"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'b7bwEkHe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'NsTrdvSj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 6, "mem_limit": 84, "name": "XYoOCXvT", "params": "npfNPAcT"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'dDMow4UQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 58}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'LzQtlFBp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'zpIwgyNm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "kLSNxXBE", "port": 52}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '2GQyLMGq' \
    --sortBy 'createdAt' \
    --sortDirection 'desc' \
    --count '89' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'jlXjVAl1' \
    --version 'KvFz9aep' \
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
    --imageURI 'JskLLvvQ' \
    --version '8701uOtR' \
    --versionPatch 'Q9Q5arqB' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'ti59ZtYb' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '9U0oAcwM' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '4V1LBSpy' \
    --versionPatch 'FqE4hdRa' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region '3Q9foXsM' \
    --count '66' \
    --offset '5' \
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
    --region '7kefmq2Y' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'LPUkOnRq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'Eu1Dc0WK' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName '3MuEYf4U' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'BaXmdhnA' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'p2qnXtbl' \
    --withServer  \
    --count '10' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'dsmwaXa7' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'kPOsXWli' \
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
    --version 'ja49260B' \
    > test.out 2>&1
eval_tap $? 56 'ImageDetailClient' test.out

#- 57 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "cTU0MeAt"}' \
    > test.out 2>&1
eval_tap $? 57 'DeregisterLocalServer' test.out

#- 58 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "z51HcOrT", "ip": "SoB6eSTv", "name": "lTfy2vvL", "port": 69}' \
    > test.out 2>&1
eval_tap $? 58 'RegisterLocalServer' test.out

#- 59 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "CFT0t5PZ", "pod_name": "Mx23RUdV"}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterServer' test.out

#- 60 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "AS33ID7s"}' \
    > test.out 2>&1
eval_tap $? 60 'ShutdownServer' test.out

#- 61 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'iRvHqgYT' \
    > test.out 2>&1
eval_tap $? 61 'GetServerSession' test.out

#- 62 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "bt4wDpBH", "configuration": "GMpYuVi4", "deployment": "6eOVnJQr", "game_mode": "J4IY7aTj", "matching_allies": [{"matching_parties": [{"party_attributes": {"Z2vBONOI": {}, "cGnxdhEU": {}, "TYHOVqPP": {}}, "party_id": "hrGqHQUT", "party_members": [{"user_id": "l4xgYze7"}, {"user_id": "UJZp8Hc4"}, {"user_id": "lXsHKgiV"}]}, {"party_attributes": {"kU6vqA3L": {}, "q5v5xmm6": {}, "bcnt8tB0": {}}, "party_id": "dkwRSM8o", "party_members": [{"user_id": "D4Z7r4hG"}, {"user_id": "9vMt28WN"}, {"user_id": "dYDbRUSz"}]}, {"party_attributes": {"YtabYD0F": {}, "6pYYO7tY": {}, "xY8TvZJt": {}}, "party_id": "KiU5m2d5", "party_members": [{"user_id": "xQUGB9UO"}, {"user_id": "P5aPtPAg"}, {"user_id": "pDsBzTND"}]}]}, {"matching_parties": [{"party_attributes": {"rLMUfU5R": {}, "QIHKqeHb": {}, "ViBW7Gau": {}}, "party_id": "ePcUADox", "party_members": [{"user_id": "4r9PKRJv"}, {"user_id": "AQ32gt7n"}, {"user_id": "T35F28ud"}]}, {"party_attributes": {"NsmSICno": {}, "Q1DeUnow": {}, "k2IijcpU": {}}, "party_id": "UnSy5DAv", "party_members": [{"user_id": "nKrHJxT2"}, {"user_id": "lZcFicqB"}, {"user_id": "REopRXrw"}]}, {"party_attributes": {"Y4BE8YZO": {}, "niF0QBpm": {}, "TMLW3iko": {}}, "party_id": "V9RMO0Xk", "party_members": [{"user_id": "h66iPpyn"}, {"user_id": "5jEyudON"}, {"user_id": "HcsHuliY"}]}]}, {"matching_parties": [{"party_attributes": {"kGxX6SrU": {}, "2t2E2nbK": {}, "JhyqYrhk": {}}, "party_id": "UnctEWmm", "party_members": [{"user_id": "OjbvtlVl"}, {"user_id": "Rl5xlUHA"}, {"user_id": "DyK66rCf"}]}, {"party_attributes": {"SZ4JRRe5": {}, "fOSiuGsc": {}, "ODmSVlB2": {}}, "party_id": "JwwFaLdh", "party_members": [{"user_id": "PfdhYmPp"}, {"user_id": "ggmqETIY"}, {"user_id": "aPxDvaYd"}]}, {"party_attributes": {"oUcdAygx": {}, "1bXiF0Vj": {}, "iCCvcA6v": {}}, "party_id": "p8fZ0m7n", "party_members": [{"user_id": "iGce38Wi"}, {"user_id": "hLdS5iIt"}, {"user_id": "HTe8MQhf"}]}]}], "namespace": "vtZXZqpo", "notification_payload": {}, "pod_name": "ZW7tWU3F", "region": "ip778npu", "session_id": "V62cmYJZ"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateSession' test.out

#- 63 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "5wjPts02"}' \
    > test.out 2>&1
eval_tap $? 63 'ClaimServer' test.out

#- 64 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'MZO8mHaZ' \
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
    --region 'xA2JWUSB' \
    > test.out 2>&1
eval_tap $? 67 'ListProvidersByRegion' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE