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
    --body '{"artifactPath": "6JUGHOad", "image": "rVSCBvHB", "namespace": "FawHdzCX", "persistent": false, "version": "onQ4wLB3"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "6vAwKVhq", "dockerPath": "xOUWkKYe", "image": "iBfsRVjb", "imageSize": 85, "namespace": "PReMsAae", "persistent": true, "version": "tZE0GM4y"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "nFBsGpOj", "dockerPath": "1e9foTOL", "image": "pTvCWGBg", "imageSize": 86, "namespace": "qiH66aeB", "patchVersion": "QbcWsBTl", "persistent": true, "version": "lj1UXLUD"}' \
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
    --body '{"claim_timeout": 66, "creation_timeout": 86, "default_version": "my26dOlj", "port": 83, "ports": {"GGveWwee": 24, "7tRWw1Bt": 19, "xZFi8HWa": 87}, "protocol": "NPYCfbEB", "providers": ["tmnBlNJW", "RoEqZlYR", "WnKE144z"], "session_timeout": 80, "unreachable_timeout": 51}' \
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
    --body '{"claim_timeout": 36, "creation_timeout": 18, "default_version": "Sl23CjAR", "port": 20, "protocol": "1p1qtoZo", "providers": ["HPPq6PXc", "5jaauyL7", "7NPo3OaP"], "session_timeout": 96, "unreachable_timeout": 17}' \
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
    --name 'lfDfZOhr' \
    --count '57' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'hi7GGhmG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'MgN4xH9I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 48, "buffer_percent": 13, "configuration": "hRf9xuPY", "enable_region_overrides": true, "game_version": "vmAcR09V", "max_count": 28, "min_count": 1, "overrides": {"TKdNfA1N": {"buffer_count": 70, "buffer_percent": 17, "configuration": "p10bPdhF", "enable_region_overrides": true, "game_version": "EWCoalNN", "max_count": 14, "min_count": 97, "name": "MhhsBCwB", "region_overrides": {"VnqWwUXl": {"buffer_count": 16, "buffer_percent": 86, "max_count": 39, "min_count": 25, "name": "0yEMAZ1s", "unlimited": false, "use_buffer_percent": false}, "r1mDco2x": {"buffer_count": 29, "buffer_percent": 41, "max_count": 59, "min_count": 42, "name": "yE0SdDng", "unlimited": false, "use_buffer_percent": true}, "sOKyY3p9": {"buffer_count": 5, "buffer_percent": 1, "max_count": 64, "min_count": 19, "name": "MCEBIxqm", "unlimited": true, "use_buffer_percent": true}}, "regions": ["LY9YwPGk", "y0BkkqXi", "nD2dBbbk"], "session_timeout": 9, "unlimited": true, "use_buffer_percent": true}, "DkOOs7Jf": {"buffer_count": 20, "buffer_percent": 68, "configuration": "YC406WOF", "enable_region_overrides": false, "game_version": "JLrVmfwQ", "max_count": 67, "min_count": 86, "name": "QvWTysLn", "region_overrides": {"8kRNRllm": {"buffer_count": 52, "buffer_percent": 95, "max_count": 6, "min_count": 11, "name": "oKSodTda", "unlimited": true, "use_buffer_percent": true}, "xt1hfoMC": {"buffer_count": 53, "buffer_percent": 8, "max_count": 9, "min_count": 78, "name": "AEDiegzr", "unlimited": true, "use_buffer_percent": true}, "4z8bFUwk": {"buffer_count": 87, "buffer_percent": 86, "max_count": 20, "min_count": 85, "name": "YTIxtIdE", "unlimited": false, "use_buffer_percent": true}}, "regions": ["tREpqDCs", "3eugQBjx", "iLr3YKoK"], "session_timeout": 18, "unlimited": false, "use_buffer_percent": false}, "p2wMaFYm": {"buffer_count": 50, "buffer_percent": 28, "configuration": "x52SoIws", "enable_region_overrides": true, "game_version": "cfQ4pH3v", "max_count": 19, "min_count": 80, "name": "Bf97poHe", "region_overrides": {"VMyHWiut": {"buffer_count": 43, "buffer_percent": 63, "max_count": 92, "min_count": 17, "name": "yh0KybU6", "unlimited": false, "use_buffer_percent": false}, "kBbSnCOy": {"buffer_count": 19, "buffer_percent": 44, "max_count": 7, "min_count": 18, "name": "HJUiDe6E", "unlimited": true, "use_buffer_percent": true}, "4OGyOgjE": {"buffer_count": 66, "buffer_percent": 23, "max_count": 88, "min_count": 85, "name": "A0c5i9c7", "unlimited": true, "use_buffer_percent": true}}, "regions": ["VksfG2wR", "6N0DaPJv", "c7qC1RMT"], "session_timeout": 42, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"3gWm353U": {"buffer_count": 53, "buffer_percent": 61, "max_count": 93, "min_count": 35, "name": "DaKIHbet", "unlimited": true, "use_buffer_percent": false}, "rpDu95SC": {"buffer_count": 78, "buffer_percent": 66, "max_count": 47, "min_count": 58, "name": "llBFSgLG", "unlimited": false, "use_buffer_percent": true}, "gxWuFoCI": {"buffer_count": 24, "buffer_percent": 67, "max_count": 96, "min_count": 35, "name": "bVByFVwn", "unlimited": true, "use_buffer_percent": true}}, "regions": ["nvSnBXjT", "ybXxHyL7", "A7f24sCs"], "session_timeout": 82, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'va1BATfF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'jUSH2FCO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 64, "buffer_percent": 73, "configuration": "odZWK9m5", "enable_region_overrides": false, "game_version": "nAu4LDMe", "max_count": 95, "min_count": 99, "regions": ["eEDWScQb", "vyroevuI", "4Qj7W5GQ"], "session_timeout": 7, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'Ga5XSCnD' \
    --namespace "$AB_NAMESPACE" \
    --region 'pIYFhFPx' \
    --body '{"buffer_count": 52, "buffer_percent": 55, "max_count": 81, "min_count": 57, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'JSsXBkAR' \
    --namespace "$AB_NAMESPACE" \
    --region '5IkUlVkw' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'ucpBW1Jq' \
    --namespace "$AB_NAMESPACE" \
    --region 'Y5LH7zo2' \
    --body '{"buffer_count": 75, "buffer_percent": 37, "max_count": 21, "min_count": 88, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'CC30sc9P' \
    --namespace "$AB_NAMESPACE" \
    --version 'fBCkjwK8' \
    --body '{"buffer_count": 86, "buffer_percent": 60, "configuration": "K7FTzPSM", "enable_region_overrides": false, "game_version": "GSgfgnLc", "max_count": 19, "min_count": 36, "region_overrides": {"uZfh5Hbl": {"buffer_count": 33, "buffer_percent": 6, "max_count": 100, "min_count": 49, "name": "J0vTKR7T", "unlimited": false, "use_buffer_percent": true}, "YO3mjKGj": {"buffer_count": 9, "buffer_percent": 80, "max_count": 84, "min_count": 86, "name": "r3BuBcEV", "unlimited": false, "use_buffer_percent": false}, "ZKc4P8ew": {"buffer_count": 71, "buffer_percent": 90, "max_count": 88, "min_count": 57, "name": "5XmtbY2o", "unlimited": true, "use_buffer_percent": true}}, "regions": ["LgGwDdr6", "7akHiUD7", "wrku3tUP"], "session_timeout": 80, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'W1xXpVvK' \
    --namespace "$AB_NAMESPACE" \
    --version 'OhPZw0Sc' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'BarjkWHr' \
    --namespace "$AB_NAMESPACE" \
    --version 'WeR1VWBo' \
    --body '{"buffer_count": 64, "buffer_percent": 51, "configuration": "p1vAsme7", "enable_region_overrides": true, "game_version": "2vKcjWOP", "max_count": 93, "min_count": 62, "regions": ["n55wOyEW", "bPd53hbz", "j8xIWK2I"], "session_timeout": 55, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'vtcAcyTv' \
    --namespace "$AB_NAMESPACE" \
    --region 'jAV4JBlz' \
    --version 'kW9oQGLS' \
    --body '{"buffer_count": 54, "buffer_percent": 25, "max_count": 83, "min_count": 7, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'RbCixR2s' \
    --namespace "$AB_NAMESPACE" \
    --region 'S0t88Zeg' \
    --version 'tjIpmF8g' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'VEfiNmqP' \
    --namespace "$AB_NAMESPACE" \
    --region 'kUkXlqv4' \
    --version '1ZZNpO1y' \
    --body '{"buffer_count": 77, "buffer_percent": 26, "max_count": 35, "min_count": 11, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '64' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'iO9G0pp2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'W8tRJJTH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 66, "mem_limit": 53, "params": "95bj4gtn"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '2IlNH0tl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '3GAKuphq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 3, "mem_limit": 40, "name": "D55U9mdr", "params": "WwWohhkS"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'YNcbuEzw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 9}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'w9MVH7Kg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'atHOTvdP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "QaeVgbR3", "port": 97}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '7GD52aMm' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '15' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'BD9yqm04' \
    --version 'UyoLwUwB' \
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
    --imageURI 'pgX1ZMDE' \
    --version 'PAWOlIYC' \
    --versionPatch '8SxBn5y1' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'ycsl3Jb0' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'qX2zlWh6' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '02QJ0ADL' \
    --versionPatch 'dkQuo4zi' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'ZnOVujNB' \
    --count '25' \
    --offset '91' \
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
    --region 'NfLJ4okO' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'EM0gvlPR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '6XYUNEC8' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'LNffpBiC' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'JbBwLidq' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'V7AxIXdP' \
    --withServer  \
    --count '12' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'PGRf1TqD' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '72pLEMGQ' \
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
    --version 'gCcUVHIl' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "w7uJMjPK"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "vWpBwGJ5", "ip": "4hjq7x3n", "name": "xAgwKLrm", "port": 34}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "aIczH7zC", "pod_name": "I4DnJwmG"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "HDZEQqjo"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'xTjowsu0' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "upjo53Ef", "configuration": "blzh55dG", "deployment": "jk6IJMcC", "game_mode": "fMyGINtE", "matching_allies": [{"matching_parties": [{"party_attributes": {"ipTRT5nM": {}, "3EZE5cKU": {}, "Up3CQYiV": {}}, "party_id": "l1XlJ1mw", "party_members": [{"user_id": "KMhTmvya"}, {"user_id": "9BrNDaKE"}, {"user_id": "syXS5Uzm"}]}, {"party_attributes": {"Ucj79zDu": {}, "dFfyJJFi": {}, "rdcGttvh": {}}, "party_id": "NFv15x0t", "party_members": [{"user_id": "ZEei6law"}, {"user_id": "mczle2NI"}, {"user_id": "rggFiedG"}]}, {"party_attributes": {"PaHboUY7": {}, "0t8fM2HJ": {}, "TtUtuZW3": {}}, "party_id": "4Yp2SH3X", "party_members": [{"user_id": "qAcQ2vGp"}, {"user_id": "r1FojpzL"}, {"user_id": "Sb45Jx4g"}]}]}, {"matching_parties": [{"party_attributes": {"DZV0sVEz": {}, "E33BSZ27": {}, "GEiWSAQJ": {}}, "party_id": "KXOGw8E1", "party_members": [{"user_id": "pX6McySH"}, {"user_id": "7aMTD5k3"}, {"user_id": "uYMlGnaU"}]}, {"party_attributes": {"XMG9b8H2": {}, "HWcZhEGz": {}, "2PtpcBfG": {}}, "party_id": "lZsrElSJ", "party_members": [{"user_id": "dTeA09s3"}, {"user_id": "TywAE9T8"}, {"user_id": "UQshWP64"}]}, {"party_attributes": {"EyCS5Wbx": {}, "0AuRYuwm": {}, "NOnnM2FX": {}}, "party_id": "HH7TOrVb", "party_members": [{"user_id": "JkDqAyMI"}, {"user_id": "172NvMkV"}, {"user_id": "uySbcGqr"}]}]}, {"matching_parties": [{"party_attributes": {"JK5mN4Sp": {}, "ge3Yvf4k": {}, "qFnAZLDV": {}}, "party_id": "J4WZ0Ufi", "party_members": [{"user_id": "sJqdhrPk"}, {"user_id": "e1QYsZgC"}, {"user_id": "Xh0aP5GG"}]}, {"party_attributes": {"2ISR2u56": {}, "SAZf4ovx": {}, "SnS3z6Gy": {}}, "party_id": "Df9AiF5a", "party_members": [{"user_id": "apH5Ddos"}, {"user_id": "0kv6coSW"}, {"user_id": "8d24CYPs"}]}, {"party_attributes": {"NiuAnmPl": {}, "X2zc89U9": {}, "jdQFsL5e": {}}, "party_id": "RU9xdVYD", "party_members": [{"user_id": "P1DRhKhF"}, {"user_id": "6oFvNDhQ"}, {"user_id": "fkCE9utE"}]}]}], "namespace": "sFdXRzb1", "notification_payload": {}, "pod_name": "TK3AfuIf", "region": "tXGxAJV6", "session_id": "NESjdKTP"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "G9FpFmnP"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6UToge0f' \
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
    --region 'TWBddKni' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE