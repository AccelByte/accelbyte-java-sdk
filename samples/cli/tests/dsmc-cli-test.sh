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
    --body '{"artifactPath": "FtBxyZcD", "image": "XBpGlsQu", "namespace": "Ju8vMf0I", "persistent": true, "version": "JkTrd8ID"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "cV2zXnTK", "dockerPath": "jXY1bPqa", "image": "miBxx9Cs", "namespace": "18EY84ek", "persistent": true, "version": "qRzHU1oh"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "570KQBVa", "dockerPath": "ewc72krS", "image": "ha68n3Yn", "namespace": "ozp1C2Km", "patchVersion": "IQTuBdNE", "persistent": true, "version": "xFb8CJ17"}' \
    > test.out 2>&1
eval_tap $? 7 'CreateImagePatch' test.out

#- 8 GetConfig
./ng net.accelbyte.sdk.cli.Main dsmc getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'GetConfig' test.out

#- 9 CreateConfig
./ng net.accelbyte.sdk.cli.Main dsmc createConfig \
    --body '{"claim_timeout": 76, "creation_timeout": 59, "default_version": "JZaMSxEC", "port": 2, "ports": {"Zbygyoar": 81}, "protocol": "RoeNHSb8", "providers": ["Rh3kgs9q"], "session_timeout": 33, "unreachable_timeout": 71}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'CreateConfig' test.out

#- 10 DeleteConfig
./ng net.accelbyte.sdk.cli.Main dsmc deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'DeleteConfig' test.out

#- 11 UpdateConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateConfig \
    --body '{"claim_timeout": 2, "creation_timeout": 27, "default_version": "QsoBgiVp", "port": 82, "protocol": "8Cm3yvAS", "providers": ["UoxdxxFq"], "session_timeout": 24, "unreachable_timeout": 52}' \
    --namespace "$AB_NAMESPACE" \
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
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'GTJ8IEda' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --body '{"allow_version_override": false, "buffer_count": 60, "buffer_percent": 38, "configuration": "p4w29KOu", "enable_region_overrides": false, "game_version": "19R6XDqW", "max_count": 67, "min_count": 20, "overrides": {"kP8npLEK": {"buffer_count": 76, "buffer_percent": 11, "configuration": "jiX7jpkV", "enable_region_overrides": false, "game_version": "3IaQYEmq", "max_count": 64, "min_count": 29, "name": "dOEGt9gP", "region_overrides": {"Oj0c6i0J": {"buffer_count": 21, "buffer_percent": 42, "max_count": 69, "min_count": 0, "name": "s73ucYnF", "use_buffer_percent": true}}, "regions": ["J3DK5T4E"], "use_buffer_percent": false}}, "region_overrides": {"gg0Y39Uo": {"buffer_count": 23, "buffer_percent": 31, "max_count": 43, "min_count": 3, "name": "VAgtsDhU", "use_buffer_percent": true}}, "regions": ["UscbQDjb"], "use_buffer_percent": true}' \
    --deployment 'PMz2PTRl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'kyU89ZPO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --body '{"allow_version_override": true, "buffer_count": 50, "buffer_percent": 83, "configuration": "FJ42cwmz", "enable_region_overrides": true, "game_version": "BSMNcoAA", "max_count": 81, "min_count": 19, "regions": ["KNjfcYHm"], "use_buffer_percent": false}' \
    --deployment 'YgBU1sqj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --body '{"buffer_count": 49, "buffer_percent": 72, "max_count": 99, "min_count": 66, "use_buffer_percent": false}' \
    --deployment 'RSOFQBtu' \
    --namespace "$AB_NAMESPACE" \
    --region '23REZ8hR' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'VX7LGOvD' \
    --namespace "$AB_NAMESPACE" \
    --region 'dYiQS9i7' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --body '{"buffer_count": 24, "buffer_percent": 94, "max_count": 57, "min_count": 30, "use_buffer_percent": false}' \
    --deployment 'G9gpxL6y' \
    --namespace "$AB_NAMESPACE" \
    --region 'cTQdvln2' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --body '{"buffer_count": 74, "buffer_percent": 52, "configuration": "uSQWEXL6", "enable_region_overrides": true, "game_version": "E1YHo9m1", "max_count": 96, "min_count": 4, "region_overrides": {"8hHtWvbN": {"buffer_count": 33, "buffer_percent": 12, "max_count": 92, "min_count": 33, "name": "slArFPiH", "use_buffer_percent": true}}, "regions": ["aCv8kU9d"], "use_buffer_percent": true}' \
    --deployment 'BpdsJLhs' \
    --namespace "$AB_NAMESPACE" \
    --version 'VyExrkxo' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'ot0B7WOf' \
    --namespace "$AB_NAMESPACE" \
    --version 'ercZdpMc' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --body '{"buffer_count": 17, "buffer_percent": 58, "configuration": "s7YSfExa", "enable_region_overrides": true, "game_version": "zLteMbFA", "max_count": 23, "min_count": 39, "regions": ["4hr7HmOY"], "use_buffer_percent": false}' \
    --deployment 'BA5ltAOX' \
    --namespace "$AB_NAMESPACE" \
    --version 'mlG6eh1d' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --body '{"buffer_count": 90, "buffer_percent": 6, "max_count": 29, "min_count": 91, "use_buffer_percent": true}' \
    --deployment 'pBIcuC1d' \
    --namespace "$AB_NAMESPACE" \
    --region 'QY93OJnJ' \
    --version '6Te9vD8l' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'dz7Hu8AD' \
    --namespace "$AB_NAMESPACE" \
    --region '79kdWunv' \
    --version 'izU0q1pH' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --body '{"buffer_count": 49, "buffer_percent": 15, "max_count": 15, "min_count": 61, "use_buffer_percent": false}' \
    --deployment 'GgdrysMi' \
    --namespace "$AB_NAMESPACE" \
    --region 'zBGSRdP2' \
    --version 'l7DNSZ8A' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '33' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'iPLQXSe0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --body '{"cpu_limit": 7, "mem_limit": 6, "params": "OGTMlJjB"}' \
    --name 'wj9HJHQK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'seEdSXRD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --body '{"cpu_limit": 89, "mem_limit": 43, "name": "guauw1xT", "params": "7eMwSl9M"}' \
    --name 'LH0NnTJ2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --body '{"port": 41}' \
    --name 'lNzBvwJa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'Qa547Jll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --body '{"name": "vA8RWSpa", "port": 2}' \
    --name 'Ut7xk6Qx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'yWhfqoWf' \
    --version 'Jw2o8oWU' \
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
    --imageURI 'qvPCZ2Hz' \
    --version 'T7NXmWDl' \
    --versionPatch 'XsuNIdQJ' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'R5lsNOlv' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'kfwaSbns' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'uLCgToxu' \
    --versionPatch 'VTekJgvg' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
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
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name '6h5HIpH0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'DviplEk4' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'vj3LDp4y' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'qDt8QUZD' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'pxlHasin' \
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
    > test.out 2>&1
eval_tap $? 55 'ImportConfigV1' test.out

#- 56 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'GcjrkmRM' \
    > test.out 2>&1
eval_tap $? 56 'ImageDetailClient' test.out

#- 57 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --body '{"name": "ttgjDSaI"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeregisterLocalServer' test.out

#- 58 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --body '{"custom_attribute": "VBmft3Ud", "ip": "g7p9PGmY", "name": "2H5kX4Ms", "port": 17}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'RegisterLocalServer' test.out

#- 59 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --body '{"custom_attribute": "sSX28nAR", "pod_name": "xWRpv5ou"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'RegisterServer' test.out

#- 60 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --body '{"kill_me": true, "pod_name": "tvd28OUf"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'ShutdownServer' test.out

#- 61 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'Ct8UJC5f' \
    > test.out 2>&1
eval_tap $? 61 'GetServerSession' test.out

#- 62 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --body '{"client_version": "lNyj6HsT", "configuration": "tX8P3lln", "deployment": "aaS9lqyy", "game_mode": "gPcfkJIx", "matching_allies": [{"matching_parties": [{"party_attributes": {"fQZza8kN": {}}, "party_id": "VbDxVMq7", "party_members": [{"user_id": "HJk0F89x"}]}]}], "namespace": "Ac3YVfaE", "notification_payload": {}, "pod_name": "Ntrl0pTK", "region": "ZTXqzHuB", "session_id": "MYQSA2jz"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'CreateSession' test.out

#- 63 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --body '{"session_id": "1ZOpdOjS"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'ClaimServer' test.out

#- 64 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'yMddB41J' \
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
    --region 'uMf7RUyB' \
    > test.out 2>&1
eval_tap $? 67 'ListProvidersByRegion' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE