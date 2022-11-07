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
    --body '{"artifactPath": "RwrQoALw", "image": "HftoXxK7", "namespace": "YaM1kFBy", "persistent": false, "version": "OxL6xY4m"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "w112yQ1F", "dockerPath": "a6LOPXW4", "image": "XVUBrZ7l", "imageSize": 2, "namespace": "o9OnFZk7", "persistent": true, "version": "IA09nb6S"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "Y0XTYtuu", "dockerPath": "V08ZU3Ir", "image": "NXhZRPdG", "imageSize": 95, "namespace": "7JIEDUtZ", "patchVersion": "Wvh1wWff", "persistent": false, "version": "Lbt2DX1q"}' \
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
    --body '{"claim_timeout": 73, "creation_timeout": 4, "default_version": "3m0Tu8Um", "port": 56, "ports": {"xEY9kaQo": 18, "tm6NKh0T": 32, "XIndeqly": 70}, "protocol": "RWd79c3V", "providers": ["61G2sA4c", "95QMla2Q", "wlMLOzCD"], "session_timeout": 61, "unreachable_timeout": 19}' \
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
    --body '{"claim_timeout": 65, "creation_timeout": 23, "default_version": "lBR4vK3b", "port": 30, "protocol": "0HLm3GXV", "providers": ["0cllQrZY", "s5oKpzQi", "IZMoeBUG"], "session_timeout": 7, "unreachable_timeout": 70}' \
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
    --name 'NL1tTZpJ' \
    --count '20' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '0WCb1hIg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment '16KzEycc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 92, "buffer_percent": 86, "configuration": "TN9akaZ7", "enable_region_overrides": false, "game_version": "CUUdg9PU", "max_count": 56, "min_count": 70, "overrides": {"QuOgUoBD": {"buffer_count": 31, "buffer_percent": 64, "configuration": "uMx5SVdX", "enable_region_overrides": false, "game_version": "r612eCZf", "max_count": 31, "min_count": 24, "name": "OUm2UtIM", "region_overrides": {"lctY2t6B": {"buffer_count": 7, "buffer_percent": 14, "max_count": 85, "min_count": 37, "name": "NeseVPUa", "unlimited": false, "use_buffer_percent": true}, "hMiNmUoy": {"buffer_count": 22, "buffer_percent": 4, "max_count": 22, "min_count": 42, "name": "V2v2dTvB", "unlimited": false, "use_buffer_percent": false}, "8d3Fq5it": {"buffer_count": 17, "buffer_percent": 42, "max_count": 80, "min_count": 81, "name": "mtdfoIoN", "unlimited": true, "use_buffer_percent": false}}, "regions": ["OUuEKgmi", "DUGCW49u", "ZlnLNlld"], "session_timeout": 30, "unlimited": true, "use_buffer_percent": false}, "fRFU2sLS": {"buffer_count": 36, "buffer_percent": 51, "configuration": "bUmvHzEj", "enable_region_overrides": true, "game_version": "UHKB46Ij", "max_count": 93, "min_count": 61, "name": "WeKHE8gm", "region_overrides": {"Pf1L1YPO": {"buffer_count": 75, "buffer_percent": 93, "max_count": 83, "min_count": 63, "name": "IvuMrsQt", "unlimited": true, "use_buffer_percent": true}, "ReZrGGcG": {"buffer_count": 2, "buffer_percent": 80, "max_count": 52, "min_count": 25, "name": "NwLO6wHm", "unlimited": true, "use_buffer_percent": false}, "EJfFrTPS": {"buffer_count": 19, "buffer_percent": 49, "max_count": 41, "min_count": 75, "name": "vwweCNDe", "unlimited": false, "use_buffer_percent": true}}, "regions": ["NDyTESb3", "t2Dt19Ic", "WXAUNKs4"], "session_timeout": 25, "unlimited": false, "use_buffer_percent": false}, "06LFgRBq": {"buffer_count": 90, "buffer_percent": 21, "configuration": "LhNLge0X", "enable_region_overrides": false, "game_version": "ewNTY0SA", "max_count": 84, "min_count": 40, "name": "D68OJoI5", "region_overrides": {"M4M46g56": {"buffer_count": 43, "buffer_percent": 1, "max_count": 27, "min_count": 55, "name": "RX89t01L", "unlimited": false, "use_buffer_percent": false}, "izEH6OoO": {"buffer_count": 57, "buffer_percent": 23, "max_count": 91, "min_count": 54, "name": "hSB7VDt7", "unlimited": true, "use_buffer_percent": false}, "v96y78mZ": {"buffer_count": 29, "buffer_percent": 61, "max_count": 65, "min_count": 6, "name": "hOgXBpiz", "unlimited": false, "use_buffer_percent": true}}, "regions": ["MaMCqeUU", "wzr0nTxF", "YQKADXX6"], "session_timeout": 42, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"xYPmAk5B": {"buffer_count": 91, "buffer_percent": 31, "max_count": 15, "min_count": 45, "name": "FI060PEK", "unlimited": true, "use_buffer_percent": true}, "nDJQzhfF": {"buffer_count": 63, "buffer_percent": 60, "max_count": 50, "min_count": 98, "name": "AHsq1Gur", "unlimited": true, "use_buffer_percent": false}, "J3LyEq0l": {"buffer_count": 75, "buffer_percent": 78, "max_count": 30, "min_count": 9, "name": "bl3t3WxQ", "unlimited": false, "use_buffer_percent": false}}, "regions": ["FmBpBFTj", "MFBy8ShC", "jCFnd7or"], "session_timeout": 61, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'qXR4wP5f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'gwdfJcJU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 47, "buffer_percent": 50, "configuration": "AXOjCMzc", "enable_region_overrides": false, "game_version": "VrZct1Kg", "max_count": 7, "min_count": 74, "regions": ["c1WcBKzW", "tGuQNKyp", "F3bido2y"], "session_timeout": 78, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'CI18e1SG' \
    --namespace "$AB_NAMESPACE" \
    --region '577Zqvqa' \
    --body '{"buffer_count": 99, "buffer_percent": 62, "max_count": 98, "min_count": 6, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'PkVgOydu' \
    --namespace "$AB_NAMESPACE" \
    --region 'wS92tOpe' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'Rcb79pfY' \
    --namespace "$AB_NAMESPACE" \
    --region 'lJWwfiUO' \
    --body '{"buffer_count": 89, "buffer_percent": 59, "max_count": 49, "min_count": 77, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment '1PH6vCU4' \
    --namespace "$AB_NAMESPACE" \
    --version 'z7xkKpPg' \
    --body '{"buffer_count": 48, "buffer_percent": 85, "configuration": "iWCwKwaH", "enable_region_overrides": false, "game_version": "TGAgl6bG", "max_count": 80, "min_count": 73, "region_overrides": {"RuUWgcEZ": {"buffer_count": 14, "buffer_percent": 69, "max_count": 58, "min_count": 3, "name": "0uXfrJmC", "unlimited": true, "use_buffer_percent": false}, "zdepB8RM": {"buffer_count": 51, "buffer_percent": 12, "max_count": 87, "min_count": 22, "name": "Fmau10tP", "unlimited": false, "use_buffer_percent": false}, "IrAgumAI": {"buffer_count": 55, "buffer_percent": 32, "max_count": 6, "min_count": 79, "name": "xvCBL6hs", "unlimited": true, "use_buffer_percent": true}}, "regions": ["megFO7US", "7NOgWJOp", "w4kTAbqm"], "session_timeout": 72, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '0zjhl21V' \
    --namespace "$AB_NAMESPACE" \
    --version 'Ercze09d' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'u4vN9qt8' \
    --namespace "$AB_NAMESPACE" \
    --version 'oTLTX79k' \
    --body '{"buffer_count": 40, "buffer_percent": 67, "configuration": "kL9JeMvB", "enable_region_overrides": true, "game_version": "DtgI3FdM", "max_count": 55, "min_count": 7, "regions": ["TDPt27zt", "oZKa8bSB", "tmmjjGn9"], "session_timeout": 73, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'ec7R0j0X' \
    --namespace "$AB_NAMESPACE" \
    --region 'fXai809L' \
    --version '52G3SrXN' \
    --body '{"buffer_count": 67, "buffer_percent": 7, "max_count": 91, "min_count": 20, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'ohedYkk7' \
    --namespace "$AB_NAMESPACE" \
    --region '7fueqTzA' \
    --version 'u3bO8kpZ' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'q5M8d0YR' \
    --namespace "$AB_NAMESPACE" \
    --region 'iXGUGl3G' \
    --version '25WwP7LO' \
    --body '{"buffer_count": 5, "buffer_percent": 49, "max_count": 79, "min_count": 87, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '40' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'Mb9k394h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'PuCyVkrq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 87, "mem_limit": 100, "params": "YcQZbg6b"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '0G7FH8fX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'HtHngsIL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 28, "mem_limit": 43, "name": "tDAinJWU", "params": "kxmuJRP1"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'QOvGvkHo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 17}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'rWRAmTsJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'Kgvol5Gs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "KmIQZoru", "port": 32}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'IU9rvj5J' \
    --sortBy 'createdAt' \
    --sortDirection 'desc' \
    --count '2' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'DcYc3z18' \
    --version 'GbFl6hIG' \
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
    --imageURI 'wkLehY8W' \
    --version 'npLxbwe4' \
    --versionPatch 'oNXEojUt' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'fU1c9HtD' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'jvkDQqSr' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'mKnCyJYs' \
    --versionPatch 'SSf3IiyS' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'Xx4r6TsK' \
    --count '45' \
    --offset '16' \
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
    --region 'tgt59p63' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'Vah2dvvM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'MzZLm8Hz' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'BLITU4JV' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName '7dIJzzUU' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '3DKZ9BjR' \
    --withServer  \
    --count '56' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Ku47k1G8' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'KfpRjHS8' \
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
    --version '2utxr73P' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tsKLPZUg"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "PQqUweIp", "ip": "OhydCfwO", "name": "ESHVRpU9", "port": 11}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "87raY1xw", "pod_name": "msYAyGEQ"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "NYhq1qZG"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'P5tGB0zB' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "Vnj9Zobv", "configuration": "uFXxTK37", "deployment": "YOKAqTx2", "game_mode": "1KoiBHIM", "matching_allies": [{"matching_parties": [{"party_attributes": {"fcwsR7py": {}, "oZAp4oEX": {}, "W3i86hdd": {}}, "party_id": "LEjgsQiY", "party_members": [{"user_id": "TmHpJVmv"}, {"user_id": "EQnN9JLV"}, {"user_id": "EfLCvHvh"}]}, {"party_attributes": {"9Ty5sLAz": {}, "4funq9uN": {}, "fCArIy12": {}}, "party_id": "Eb3ePkn7", "party_members": [{"user_id": "wFbrZn0U"}, {"user_id": "IcAJu8ht"}, {"user_id": "VXndFJEA"}]}, {"party_attributes": {"qFIFjyQc": {}, "E81lLfi5": {}, "qKihXnZY": {}}, "party_id": "ltZ5QTko", "party_members": [{"user_id": "jLVnBbyo"}, {"user_id": "iIwyaTdG"}, {"user_id": "ey6td6wB"}]}]}, {"matching_parties": [{"party_attributes": {"tGFdVWti": {}, "pVHp6xWI": {}, "ncdyRhqH": {}}, "party_id": "7Sxe0qI3", "party_members": [{"user_id": "QYDP2YM1"}, {"user_id": "RKFgKlbg"}, {"user_id": "8Ocaor1i"}]}, {"party_attributes": {"0l3nLQnb": {}, "OI8yJlod": {}, "MZCeMuBb": {}}, "party_id": "2WgBHM8e", "party_members": [{"user_id": "YeWNgqlK"}, {"user_id": "ejmPaEvL"}, {"user_id": "n4oXqp4S"}]}, {"party_attributes": {"sdKRpizS": {}, "Bw9BIEwj": {}, "exNy2fO8": {}}, "party_id": "OxyPQB2K", "party_members": [{"user_id": "qBCArwF6"}, {"user_id": "fWLBTyXO"}, {"user_id": "Jj1ATzcA"}]}]}, {"matching_parties": [{"party_attributes": {"ToZugVMl": {}, "Bz7iLiPf": {}, "u3VVM35q": {}}, "party_id": "Sh5oLRNN", "party_members": [{"user_id": "jVNRpeuB"}, {"user_id": "KgApCEuZ"}, {"user_id": "YJU8dx5v"}]}, {"party_attributes": {"BCE98LBT": {}, "tZ92dX95": {}, "qXt3pWyC": {}}, "party_id": "rTO9GS0p", "party_members": [{"user_id": "rVnxHYDb"}, {"user_id": "qGlhkPaH"}, {"user_id": "eljXU4aT"}]}, {"party_attributes": {"gcHQZ6RF": {}, "9XxIxSK5": {}, "FjXU4u71": {}}, "party_id": "9DfzVr5q", "party_members": [{"user_id": "LyuwLNv0"}, {"user_id": "NxSv08JP"}, {"user_id": "UsKKIcAz"}]}]}], "namespace": "HJwdpMk0", "notification_payload": {}, "pod_name": "XS96DPSv", "region": "PaSWcnyz", "session_id": "V44d3F58"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "JDr3mxhU"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'jyYmHlM7' \
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
    --region 'fI1ju3ea' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE