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
    --body '{"artifactPath": "96tpbRae", "image": "yrqWSxi3", "namespace": "IzJpi3lO", "persistent": true, "version": "1o2PyyMi"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "vZzvJLGG", "dockerPath": "kz3LKGNZ", "image": "lq4f7CNC", "imageSize": 8, "namespace": "m5MjTLXu", "persistent": true, "version": "QNAyJOAk"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "iD2SBZJq", "dockerPath": "sureGEev", "image": "YetW1FW8", "imageSize": 27, "namespace": "diYfIp7c", "patchVersion": "pZmaFfoV", "persistent": false, "version": "LxyupTYg"}' \
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
    --body '{"claim_timeout": 47, "creation_timeout": 51, "default_version": "kiB8Ck5W", "port": 33, "ports": {"MiWVxrOM": 70, "FwSULBIB": 53, "oMv2WiUa": 70}, "protocol": "am8AhL7J", "providers": ["jtVSerzl", "sNVnbdcn", "SAsmuVMP"], "session_timeout": 78, "unreachable_timeout": 92}' \
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
    --body '{"claim_timeout": 37, "creation_timeout": 26, "default_version": "ZwodpioV", "port": 100, "protocol": "HCatNcdq", "providers": ["hVzK1tv8", "LcE6jXIa", "VKdxJEKO"], "session_timeout": 42, "unreachable_timeout": 21}' \
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
    --name 'P5Fc7WxK' \
    --count '40' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'TSCtezGM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'IlD0g5mI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 98, "buffer_percent": 51, "configuration": "vr7wjBrC", "enable_region_overrides": false, "game_version": "tBzo3qhk", "max_count": 60, "min_count": 93, "overrides": {"v4EkGBfN": {"buffer_count": 99, "buffer_percent": 11, "configuration": "4LO04xlZ", "enable_region_overrides": false, "game_version": "4gU4vFQI", "max_count": 36, "min_count": 50, "name": "pEqQeWgd", "region_overrides": {"AhUB0BtR": {"buffer_count": 92, "buffer_percent": 33, "max_count": 60, "min_count": 88, "name": "TC8sPN9T", "unlimited": false, "use_buffer_percent": true}, "1uR4PCc2": {"buffer_count": 81, "buffer_percent": 6, "max_count": 45, "min_count": 41, "name": "F7wtpDlQ", "unlimited": false, "use_buffer_percent": true}, "k1eUNzip": {"buffer_count": 72, "buffer_percent": 50, "max_count": 28, "min_count": 29, "name": "OzPRZGtM", "unlimited": false, "use_buffer_percent": false}}, "regions": ["11BrH94C", "5TmyAchd", "l90UrQkJ"], "session_timeout": 12, "unlimited": true, "use_buffer_percent": false}, "isWpo9Xo": {"buffer_count": 74, "buffer_percent": 1, "configuration": "CAgiOnLh", "enable_region_overrides": true, "game_version": "KBMi8z1S", "max_count": 12, "min_count": 62, "name": "bGzLLpk5", "region_overrides": {"rdL34a2u": {"buffer_count": 53, "buffer_percent": 66, "max_count": 6, "min_count": 94, "name": "klSFIt51", "unlimited": true, "use_buffer_percent": true}, "VUQpZaXx": {"buffer_count": 28, "buffer_percent": 44, "max_count": 96, "min_count": 45, "name": "UdDViBYk", "unlimited": false, "use_buffer_percent": true}, "xMZfBwYY": {"buffer_count": 55, "buffer_percent": 43, "max_count": 49, "min_count": 10, "name": "JItTE8qD", "unlimited": true, "use_buffer_percent": false}}, "regions": ["XZtjiPpY", "ztBpbGsv", "KeZTuy95"], "session_timeout": 95, "unlimited": false, "use_buffer_percent": false}, "HHASwufN": {"buffer_count": 45, "buffer_percent": 94, "configuration": "ja8DyRyK", "enable_region_overrides": true, "game_version": "wz4JkrGi", "max_count": 84, "min_count": 60, "name": "XEBaBkDP", "region_overrides": {"JTybazjs": {"buffer_count": 17, "buffer_percent": 26, "max_count": 0, "min_count": 88, "name": "lK0drYuO", "unlimited": true, "use_buffer_percent": false}, "vOrS85rO": {"buffer_count": 5, "buffer_percent": 11, "max_count": 31, "min_count": 10, "name": "BYy03d9y", "unlimited": true, "use_buffer_percent": false}, "saOR93ex": {"buffer_count": 90, "buffer_percent": 16, "max_count": 4, "min_count": 8, "name": "8gos8c9g", "unlimited": true, "use_buffer_percent": false}}, "regions": ["IvZOtl7Z", "e23uwEno", "tdZCo614"], "session_timeout": 30, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"2piMjNuF": {"buffer_count": 97, "buffer_percent": 21, "max_count": 100, "min_count": 90, "name": "hUtz21hN", "unlimited": false, "use_buffer_percent": false}, "fGHonCSy": {"buffer_count": 95, "buffer_percent": 71, "max_count": 45, "min_count": 39, "name": "iKH4yXlZ", "unlimited": false, "use_buffer_percent": false}, "eTilV0bz": {"buffer_count": 15, "buffer_percent": 47, "max_count": 52, "min_count": 64, "name": "kYGQogsz", "unlimited": true, "use_buffer_percent": false}}, "regions": ["u2ZDYlp6", "uaES3UJL", "vdPjgVWH"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'qJKq6NRM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment '4Yr3FAYL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 9, "buffer_percent": 35, "configuration": "TtNXnCW1", "enable_region_overrides": false, "game_version": "HCbU3lCB", "max_count": 100, "min_count": 72, "regions": ["eNfTXhiZ", "q3ZbIMVJ", "nYVhRJdG"], "session_timeout": 23, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'TjJ4dlpD' \
    --namespace "$AB_NAMESPACE" \
    --region 'ZvtVejlf' \
    --body '{"buffer_count": 53, "buffer_percent": 91, "max_count": 44, "min_count": 86, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'ACp0fkv1' \
    --namespace "$AB_NAMESPACE" \
    --region '87xzgvok' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '9SYBLs87' \
    --namespace "$AB_NAMESPACE" \
    --region '6zauP1Go' \
    --body '{"buffer_count": 13, "buffer_percent": 77, "max_count": 85, "min_count": 44, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'cNRD79Uf' \
    --namespace "$AB_NAMESPACE" \
    --version 'sklYYOqx' \
    --body '{"buffer_count": 41, "buffer_percent": 35, "configuration": "Y0hJHE34", "enable_region_overrides": true, "game_version": "Cc2TscnM", "max_count": 96, "min_count": 76, "region_overrides": {"RQu37rSQ": {"buffer_count": 81, "buffer_percent": 70, "max_count": 70, "min_count": 21, "name": "Kr0yUpma", "unlimited": true, "use_buffer_percent": true}, "IpdWu0Ba": {"buffer_count": 57, "buffer_percent": 41, "max_count": 98, "min_count": 32, "name": "a1bPxenW", "unlimited": false, "use_buffer_percent": false}, "sQzu2N2X": {"buffer_count": 57, "buffer_percent": 46, "max_count": 14, "min_count": 43, "name": "rrqZXgeS", "unlimited": false, "use_buffer_percent": false}}, "regions": ["f264IVkr", "7NBf2Uw0", "P21DGidr"], "session_timeout": 72, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'l7ggF5YS' \
    --namespace "$AB_NAMESPACE" \
    --version 'HVxMhPbV' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'grI6gLFQ' \
    --namespace "$AB_NAMESPACE" \
    --version 'ZYoRWOmE' \
    --body '{"buffer_count": 83, "buffer_percent": 94, "configuration": "Qj18Sy5B", "enable_region_overrides": false, "game_version": "fRCxB9AA", "max_count": 65, "min_count": 85, "regions": ["2of8NmBg", "JZrLcLUL", "vSRgEDe8"], "session_timeout": 68, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'xSgeVjfE' \
    --namespace "$AB_NAMESPACE" \
    --region 'n8YuhHXK' \
    --version 'OOM8UqJp' \
    --body '{"buffer_count": 95, "buffer_percent": 74, "max_count": 63, "min_count": 0, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'd9acNIAU' \
    --namespace "$AB_NAMESPACE" \
    --region 'fXyxnDK3' \
    --version 'zcMzUt84' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'G3fcwo5w' \
    --namespace "$AB_NAMESPACE" \
    --region 'QlNwufHA' \
    --version 'zc2Pphnn' \
    --body '{"buffer_count": 25, "buffer_percent": 48, "max_count": 3, "min_count": 85, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '69' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'BMIao7ii' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '5yPInOhm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 32, "mem_limit": 42, "params": "sLxzCgbX"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'YWCrcwxH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '5B44wAOq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 73, "mem_limit": 23, "name": "3EzYB2GH", "params": "fkRkBgmg"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'zHoyLBHz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 91}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'vG7yX0ny' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'd7PI6GdZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "WoiQCzDX", "port": 30}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'p79ZRBDp' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '56' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'Ab8RuCLW' \
    --version '4L56al6j' \
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
    --imageURI 'oitVApmX' \
    --version 'ALjr2Yhc' \
    --versionPatch 'HYp5bx2Z' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'phonPDL3' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'hF6uqJOy' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'STCT9iYf' \
    --versionPatch 'TVWEVW9p' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'vIDDlWyu' \
    --count '38' \
    --offset '69' \
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
    --region 's2waVPhX' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'MQ1zFQC2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'OIlxjozS' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'QrBGUEJ3' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'fWc9yGCJ' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'L838Zx0y' \
    --withServer  \
    --count '32' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'lNKoqaed' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'FrRcKiRr' \
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
    --version 'GNEbJNKR' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "P10HNpKU"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "LMQmsckt", "ip": "kwHSDYSP", "name": "Eg2g8HDJ", "port": 0}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "Z9PWJIt0", "pod_name": "GwTSrqaW"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "KRmWa8FX"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'gQkOgNa2' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "OZubwwqv", "configuration": "c9E1VFoY", "deployment": "nSDh9WqU", "game_mode": "aFm2RNVV", "matching_allies": [{"matching_parties": [{"party_attributes": {"Y9rxqGzK": {}, "qqREmMuo": {}, "hyCElWtF": {}}, "party_id": "k7JEbFUV", "party_members": [{"user_id": "JkDExAwN"}, {"user_id": "fVTemznP"}, {"user_id": "EqLH2SN7"}]}, {"party_attributes": {"TA2eqALr": {}, "cVFTyHfG": {}, "3luq9rZb": {}}, "party_id": "TnrKe5OO", "party_members": [{"user_id": "ExwWz8kf"}, {"user_id": "FGhkYE9c"}, {"user_id": "ZbQQtlkH"}]}, {"party_attributes": {"0v3d7oiD": {}, "Rv7rUSID": {}, "OWei2GRP": {}}, "party_id": "nmxnHoJW", "party_members": [{"user_id": "HQvqQMJI"}, {"user_id": "4vUybqbO"}, {"user_id": "rNa9FrHt"}]}]}, {"matching_parties": [{"party_attributes": {"zKCEUIyV": {}, "OWY9L9sb": {}, "xGh9BURS": {}}, "party_id": "CNBMrQo7", "party_members": [{"user_id": "o36wQxZu"}, {"user_id": "nmpCdbGS"}, {"user_id": "WMfRxlQy"}]}, {"party_attributes": {"FSy5RkRK": {}, "0CQBWkj0": {}, "RqWwUg6X": {}}, "party_id": "V5dvaZdl", "party_members": [{"user_id": "gzRjQxNA"}, {"user_id": "dxoCd5DZ"}, {"user_id": "4poQVyaf"}]}, {"party_attributes": {"DrZ0WnZp": {}, "7VjwgL9u": {}, "cWsWgOFc": {}}, "party_id": "nog4LIbg", "party_members": [{"user_id": "gZQH5fWr"}, {"user_id": "no8K60j7"}, {"user_id": "Wr0wUWCP"}]}]}, {"matching_parties": [{"party_attributes": {"NiNkMHqO": {}, "KftY4lDd": {}, "mjLkY9Ei": {}}, "party_id": "ezDD3YJE", "party_members": [{"user_id": "hih0BzWX"}, {"user_id": "YuyQpo8f"}, {"user_id": "QI8edl6y"}]}, {"party_attributes": {"tBVW4hLK": {}, "IZa66nZ4": {}, "vjqxn86h": {}}, "party_id": "72dTTj5B", "party_members": [{"user_id": "mqdVlhsQ"}, {"user_id": "DuvNuZ6O"}, {"user_id": "YZV1jeTp"}]}, {"party_attributes": {"fyUqpwlJ": {}, "mzHQU6gt": {}, "A5zcRolD": {}}, "party_id": "ovElrdz7", "party_members": [{"user_id": "MIQ4Lfly"}, {"user_id": "WUEmfeLS"}, {"user_id": "dsEEl5Rd"}]}]}], "namespace": "LLIeDw52", "notification_payload": {}, "pod_name": "zys8Te5y", "region": "6IG3pbcN", "session_id": "gx6tHowZ"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "31wRgvUb"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'fLnuYAUy' \
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
    --region 'HqD4PLoS' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE