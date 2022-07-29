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
    --body '{"artifactPath": "pkjGupii", "image": "LGGejnPh", "namespace": "IuLAMh0F", "persistent": false, "version": "85YCMutp"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "OROOWkrl", "dockerPath": "HSH4OYmE", "image": "hKph3aZj", "namespace": "f5oDeLfJ", "persistent": true, "version": "D6OqVoKe"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "JSctwKWM", "dockerPath": "QInmyLTE", "image": "UmHE3kuk", "namespace": "Z2NpgGLn", "patchVersion": "AojBzZJk", "persistent": false, "version": "5ANaAjs1"}' \
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
    --body '{"claim_timeout": 77, "creation_timeout": 26, "default_version": "KOr9z6Hp", "port": 91, "ports": {"T0DXKPo8": 35, "fsVNw5dX": 1, "2pDbp4CY": 3}, "protocol": "XtLpxRuK", "providers": ["AFBakgaD", "zq0pXpEa", "Bj1h740j"], "session_timeout": 11, "unreachable_timeout": 63}' \
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
    --body '{"claim_timeout": 27, "creation_timeout": 39, "default_version": "wxEYYCFg", "port": 7, "protocol": "qJQfNhib", "providers": ["3QW2o959", "deNcFP25", "pSCGHjc8"], "session_timeout": 26, "unreachable_timeout": 74}' \
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
    --name 'P06fE4Eh' \
    --count '30' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'kVnKexUh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'lS9TldNg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 11, "buffer_percent": 11, "configuration": "Ya8okNwM", "enable_region_overrides": true, "game_version": "dkyCecvH", "max_count": 81, "min_count": 40, "overrides": {"JeObgZzd": {"buffer_count": 61, "buffer_percent": 70, "configuration": "A2bi4dce", "enable_region_overrides": true, "game_version": "0b8ZoFLk", "max_count": 53, "min_count": 57, "name": "5WdffMMf", "region_overrides": {"gBfyqvxz": {"buffer_count": 56, "buffer_percent": 10, "max_count": 75, "min_count": 50, "name": "0tidYZWk", "use_buffer_percent": true}, "vi9D6t7O": {"buffer_count": 84, "buffer_percent": 38, "max_count": 34, "min_count": 64, "name": "tNO0rMzy", "use_buffer_percent": false}, "J0zlx2zh": {"buffer_count": 43, "buffer_percent": 13, "max_count": 42, "min_count": 59, "name": "boZ1WoDS", "use_buffer_percent": false}}, "regions": ["H1CiZs1Y", "ie7aFeJx", "VOijBE3b"], "session_timeout": 39, "use_buffer_percent": true}, "QnkMjbx5": {"buffer_count": 30, "buffer_percent": 21, "configuration": "zSLvzXbz", "enable_region_overrides": true, "game_version": "MNqF6srE", "max_count": 86, "min_count": 58, "name": "oWiU6i2K", "region_overrides": {"NxwnkOJj": {"buffer_count": 98, "buffer_percent": 20, "max_count": 98, "min_count": 78, "name": "lo6lhtGi", "use_buffer_percent": true}, "zIEjjRzC": {"buffer_count": 14, "buffer_percent": 11, "max_count": 31, "min_count": 45, "name": "FnHm81vX", "use_buffer_percent": false}, "xaMWKyYR": {"buffer_count": 86, "buffer_percent": 34, "max_count": 26, "min_count": 49, "name": "HTaFwdz5", "use_buffer_percent": true}}, "regions": ["yRhHOo2s", "4sN2JMQf", "6IeX0LYM"], "session_timeout": 46, "use_buffer_percent": false}, "W3B7JO2V": {"buffer_count": 76, "buffer_percent": 1, "configuration": "3I1DFbzr", "enable_region_overrides": true, "game_version": "86VeyuH4", "max_count": 86, "min_count": 94, "name": "65Ykmd4F", "region_overrides": {"9x9a2HtW": {"buffer_count": 84, "buffer_percent": 96, "max_count": 65, "min_count": 2, "name": "0V9PKIoz", "use_buffer_percent": false}, "KRFCacm1": {"buffer_count": 40, "buffer_percent": 21, "max_count": 46, "min_count": 50, "name": "Sgo4GQLo", "use_buffer_percent": true}, "WgwOTsgs": {"buffer_count": 19, "buffer_percent": 5, "max_count": 41, "min_count": 96, "name": "KFGRMRr5", "use_buffer_percent": false}}, "regions": ["A5ZqnVIR", "fJLyQTX0", "AJ3HxyJT"], "session_timeout": 93, "use_buffer_percent": true}}, "region_overrides": {"vCnQuDS3": {"buffer_count": 5, "buffer_percent": 61, "max_count": 7, "min_count": 63, "name": "kSQAL3N6", "use_buffer_percent": true}, "aFt4ZFr3": {"buffer_count": 32, "buffer_percent": 19, "max_count": 51, "min_count": 56, "name": "LZfJKHjt", "use_buffer_percent": true}, "wTm2vZ8Y": {"buffer_count": 4, "buffer_percent": 38, "max_count": 6, "min_count": 51, "name": "rdKtVNQi", "use_buffer_percent": false}}, "regions": ["1trSFarS", "kIgdTOXI", "nCyXUVH4"], "session_timeout": 87, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'YlULtRJY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'vNblXUzo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 19, "buffer_percent": 51, "configuration": "CIUtDhlm", "enable_region_overrides": false, "game_version": "3FeJw3Gc", "max_count": 43, "min_count": 85, "regions": ["43wBBbUB", "UYgs5QNY", "x1pOHytJ"], "session_timeout": 14, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '0926PXCX' \
    --namespace "$AB_NAMESPACE" \
    --region 'KnjuXVGd' \
    --body '{"buffer_count": 30, "buffer_percent": 48, "max_count": 4, "min_count": 85, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'QW0Tqr3N' \
    --namespace "$AB_NAMESPACE" \
    --region 'YRcNAHJB' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'gyORtGBd' \
    --namespace "$AB_NAMESPACE" \
    --region 'BnU0fbtW' \
    --body '{"buffer_count": 0, "buffer_percent": 89, "max_count": 37, "min_count": 71, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'oKsldduG' \
    --namespace "$AB_NAMESPACE" \
    --version 'TBz4hm3j' \
    --body '{"buffer_count": 84, "buffer_percent": 79, "configuration": "v9EUkpIJ", "enable_region_overrides": false, "game_version": "96VZI4vg", "max_count": 81, "min_count": 77, "region_overrides": {"7QEovXEV": {"buffer_count": 61, "buffer_percent": 82, "max_count": 37, "min_count": 45, "name": "8o7L5bF9", "use_buffer_percent": false}, "IoMc3RQe": {"buffer_count": 44, "buffer_percent": 40, "max_count": 10, "min_count": 54, "name": "MVIIB9nH", "use_buffer_percent": true}, "y9qiRrQk": {"buffer_count": 92, "buffer_percent": 3, "max_count": 24, "min_count": 5, "name": "bjtkWqU2", "use_buffer_percent": false}}, "regions": ["Cc7yYEj2", "mK98IHbb", "vm2swEYa"], "session_timeout": 76, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '62xg57wd' \
    --namespace "$AB_NAMESPACE" \
    --version 'V76jrgrj' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'Pr2ZKBzl' \
    --namespace "$AB_NAMESPACE" \
    --version 'lRq6SbwJ' \
    --body '{"buffer_count": 83, "buffer_percent": 79, "configuration": "KQaWkKsu", "enable_region_overrides": false, "game_version": "5616Nszg", "max_count": 47, "min_count": 37, "regions": ["VwthZ4Cj", "lj24i6WL", "IV8dvRtZ"], "session_timeout": 13, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'Mjw9hD4i' \
    --namespace "$AB_NAMESPACE" \
    --region 'BwMbHVj0' \
    --version '3cFTZ4tu' \
    --body '{"buffer_count": 28, "buffer_percent": 91, "max_count": 78, "min_count": 25, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'yIcl5D3M' \
    --namespace "$AB_NAMESPACE" \
    --region 'uYzNFqFS' \
    --version '3WK9rupG' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '2MFwmK2b' \
    --namespace "$AB_NAMESPACE" \
    --region '41kW2rSF' \
    --version 'KSaq8bC9' \
    --body '{"buffer_count": 69, "buffer_percent": 79, "max_count": 51, "min_count": 56, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '47' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'ne2ZnyCl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'TrSHGtvA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 70, "mem_limit": 79, "params": "fLkHHwzd"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'k8A6ZCcp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '6vhmPyJQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 82, "mem_limit": 62, "name": "4GXl4lC0", "params": "vvpA4YQF"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'edpNyUqW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 6}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'MqZhaDDi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'CxI6AuqZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "D5a9rqGt", "port": 96}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'w08iVIe0' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '4' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '7y9Fjxqm' \
    --version 'lwckLAQ2' \
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
    --imageURI 'CtLpZn30' \
    --version 'w2C6pbB0' \
    --versionPatch 'yW3cUzKj' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'zlrIpJaK' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'KpjNaxWV' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'FZDyMPvV' \
    --versionPatch 'm4u0qlsM' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'RbC2zrSk' \
    --count '35' \
    --offset '61' \
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
    --region '6RZx6ACm' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'zurHeex5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '4khX4Xcf' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'UzMzxSRR' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'gkWCIhfR' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'mrMmgDFd' \
    --withServer  \
    --count '11' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'lvPF0K4H' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '5wpOUwpd' \
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
    --version 'cx5DDbfi' \
    > test.out 2>&1
eval_tap $? 56 'ImageDetailClient' test.out

#- 57 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "PM0phMSf"}' \
    > test.out 2>&1
eval_tap $? 57 'DeregisterLocalServer' test.out

#- 58 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "EAKuYLuF", "ip": "dJmRyDwY", "name": "erlPyxuV", "port": 11}' \
    > test.out 2>&1
eval_tap $? 58 'RegisterLocalServer' test.out

#- 59 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "uiNFhJty", "pod_name": "77hlaC4u"}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterServer' test.out

#- 60 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "M7Wt0v1d"}' \
    > test.out 2>&1
eval_tap $? 60 'ShutdownServer' test.out

#- 61 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'sXALVGFZ' \
    > test.out 2>&1
eval_tap $? 61 'GetServerSession' test.out

#- 62 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "xdp8NUKT", "configuration": "VVev2Lzn", "deployment": "MIo31ka7", "game_mode": "wt7FeREq", "matching_allies": [{"matching_parties": [{"party_attributes": {"pPceYOTC": {}, "Qf2Td6tV": {}, "jc5IOEAJ": {}}, "party_id": "TFtaPNqH", "party_members": [{"user_id": "QtnMY5Oy"}, {"user_id": "sVyXdHOi"}, {"user_id": "ruWf8VKM"}]}, {"party_attributes": {"skv0LQGb": {}, "cULwnAoQ": {}, "Z4tAgzre": {}}, "party_id": "RIwtO4wz", "party_members": [{"user_id": "uRrG7fXs"}, {"user_id": "pZI6sHeq"}, {"user_id": "ZWNdM2zP"}]}, {"party_attributes": {"jm6PVAAL": {}, "7BzFZv9y": {}, "UXtCNFsv": {}}, "party_id": "YhAbBaeY", "party_members": [{"user_id": "PpDvpqYc"}, {"user_id": "zJxdrHIt"}, {"user_id": "lBlwNknG"}]}]}, {"matching_parties": [{"party_attributes": {"IJyjj8Fm": {}, "ZH5eW17v": {}, "xFFblZHJ": {}}, "party_id": "galoETLz", "party_members": [{"user_id": "gZBmpkmF"}, {"user_id": "2E23NdnZ"}, {"user_id": "gmU9AyUR"}]}, {"party_attributes": {"3JG5EP35": {}, "dh28qzmi": {}, "GHvrGvwT": {}}, "party_id": "uBHyV8So", "party_members": [{"user_id": "5GB36dHz"}, {"user_id": "WOlWWCt0"}, {"user_id": "3YOBlJD8"}]}, {"party_attributes": {"AYcBOwyk": {}, "oSSUU8l1": {}, "RDdi6hkA": {}}, "party_id": "2C2MIcU7", "party_members": [{"user_id": "c6bzOEPj"}, {"user_id": "YHJsQqQI"}, {"user_id": "Dh10lFek"}]}]}, {"matching_parties": [{"party_attributes": {"RdXVIg0S": {}, "ESViJzTA": {}, "Fjjm6bEC": {}}, "party_id": "RYOgYSBn", "party_members": [{"user_id": "IQg5V8hB"}, {"user_id": "Uh4slAYw"}, {"user_id": "AWjXZSr9"}]}, {"party_attributes": {"TpyYoRzb": {}, "Gzsk3oBh": {}, "WSVeiI0j": {}}, "party_id": "d5jZoA0M", "party_members": [{"user_id": "UXwcfxwt"}, {"user_id": "7hSfI7rD"}, {"user_id": "RWCkVriV"}]}, {"party_attributes": {"UjwcZcSO": {}, "PYvpDQoz": {}, "z7RwFLya": {}}, "party_id": "x9gjKmGn", "party_members": [{"user_id": "FRm4anpt"}, {"user_id": "k8GxWkws"}, {"user_id": "TqjZsCkb"}]}]}], "namespace": "zy09G7Ly", "notification_payload": {}, "pod_name": "DNgg97LT", "region": "nUUuyTZc", "session_id": "JrJo9FPr"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateSession' test.out

#- 63 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "dsuuQIaE"}' \
    > test.out 2>&1
eval_tap $? 63 'ClaimServer' test.out

#- 64 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'tBWCFgk4' \
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
    --region 'bxKSCtVq' \
    > test.out 2>&1
eval_tap $? 67 'ListProvidersByRegion' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE