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
    --body '{"artifactPath": "RXYvvyH6", "image": "rDyldr6y", "namespace": "fW2JHl6i", "persistent": true, "version": "MqMUMIqO"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "eOUzGO8G", "dockerPath": "BkBP9k8n", "image": "PP2pGWzP", "namespace": "ltzvGW54", "persistent": false, "version": "4xUY4LBX"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "kX5N4hDO", "dockerPath": "wDHdqn0Z", "image": "asmGFVP5", "namespace": "Oroc0xxU", "patchVersion": "VXhzr001", "persistent": false, "version": "FIIyA5AB"}' \
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
    --body '{"claim_timeout": 23, "creation_timeout": 67, "default_version": "6LcvDpKy", "port": 73, "ports": {"U1EJiaF8": 51, "YndVlq4v": 30, "7EvSCBCN": 8}, "protocol": "UoJKUyXy", "providers": ["SlPu8XHu", "PGZ4Pa05", "gPiyA5VI"], "session_timeout": 73, "unreachable_timeout": 64}' \
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
    --body '{"claim_timeout": 62, "creation_timeout": 51, "default_version": "wJrabchI", "port": 58, "protocol": "Ldjqrx3k", "providers": ["6XBq2jZs", "kiY0mBSH", "PNHRLAwI"], "session_timeout": 84, "unreachable_timeout": 47}' \
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
    --name 'qpK8IHEp' \
    --count '16' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'T8nwPbMi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'vVIuGD2t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 73, "buffer_percent": 87, "configuration": "4hWsSckD", "enable_region_overrides": false, "game_version": "fZSrVMbM", "max_count": 65, "min_count": 29, "overrides": {"43QF6t9p": {"buffer_count": 33, "buffer_percent": 58, "configuration": "mDNOl5yw", "enable_region_overrides": true, "game_version": "zdsZKpao", "max_count": 32, "min_count": 47, "name": "CfPxSXsg", "region_overrides": {"rbsqQ6l0": {"buffer_count": 42, "buffer_percent": 80, "max_count": 94, "min_count": 88, "name": "aRLDPfnW", "use_buffer_percent": true}, "i2XdZIBU": {"buffer_count": 95, "buffer_percent": 35, "max_count": 54, "min_count": 77, "name": "T9dy0vdC", "use_buffer_percent": true}, "IHqJjwLj": {"buffer_count": 43, "buffer_percent": 34, "max_count": 74, "min_count": 33, "name": "aONYf1wD", "use_buffer_percent": false}}, "regions": ["oZCzKfcL", "kjI1rKzT", "jMnVhkwk"], "session_timeout": 74, "use_buffer_percent": false}, "9WE2chUx": {"buffer_count": 88, "buffer_percent": 3, "configuration": "6YeQLG1E", "enable_region_overrides": true, "game_version": "Zh9vy1wM", "max_count": 83, "min_count": 22, "name": "z0CHUpue", "region_overrides": {"pc8fqO1f": {"buffer_count": 99, "buffer_percent": 24, "max_count": 62, "min_count": 33, "name": "1SwsIgiy", "use_buffer_percent": false}, "sT3AutwB": {"buffer_count": 13, "buffer_percent": 57, "max_count": 32, "min_count": 36, "name": "HWrovwI3", "use_buffer_percent": false}, "fgZLCV3T": {"buffer_count": 33, "buffer_percent": 54, "max_count": 99, "min_count": 90, "name": "EtWfKGr6", "use_buffer_percent": true}}, "regions": ["mJTSOoxH", "hHdr3asH", "BEVXEeRS"], "session_timeout": 38, "use_buffer_percent": false}, "WvQRkkWE": {"buffer_count": 88, "buffer_percent": 65, "configuration": "4ZGAkX5C", "enable_region_overrides": false, "game_version": "e8n1ahMm", "max_count": 37, "min_count": 50, "name": "XWQA4cnH", "region_overrides": {"w9e2v3TG": {"buffer_count": 61, "buffer_percent": 76, "max_count": 36, "min_count": 49, "name": "APOjvEwF", "use_buffer_percent": true}, "zH4qCvlC": {"buffer_count": 86, "buffer_percent": 90, "max_count": 49, "min_count": 95, "name": "MabYZqsO", "use_buffer_percent": false}, "zVVtryyz": {"buffer_count": 30, "buffer_percent": 69, "max_count": 66, "min_count": 37, "name": "T6bCIDcE", "use_buffer_percent": false}}, "regions": ["gZRQou85", "DioxlJAU", "HjO2sG7F"], "session_timeout": 54, "use_buffer_percent": true}}, "region_overrides": {"ShWgd0BH": {"buffer_count": 90, "buffer_percent": 38, "max_count": 52, "min_count": 11, "name": "gQzLAdLy", "use_buffer_percent": true}, "DNwGYYSb": {"buffer_count": 67, "buffer_percent": 56, "max_count": 49, "min_count": 83, "name": "inCCGZIL", "use_buffer_percent": true}, "mObzRWW5": {"buffer_count": 23, "buffer_percent": 51, "max_count": 88, "min_count": 98, "name": "Yzfz9ez3", "use_buffer_percent": true}}, "regions": ["af3qIiPc", "y19IrWHW", "YIVWnRsn"], "session_timeout": 65, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'k9KCtQbM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'Ze8Yvhxi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 77, "buffer_percent": 37, "configuration": "Mhq4ix7b", "enable_region_overrides": false, "game_version": "lfXwytw8", "max_count": 100, "min_count": 14, "regions": ["uaB8kmZO", "FIttZ0RQ", "XJiWzatZ"], "session_timeout": 75, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'L6A6KazF' \
    --namespace "$AB_NAMESPACE" \
    --region 'XVqwGZ7L' \
    --body '{"buffer_count": 57, "buffer_percent": 30, "max_count": 0, "min_count": 80, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'AsB5c4c2' \
    --namespace "$AB_NAMESPACE" \
    --region 'EEq9Qgj8' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'd2EHRzYn' \
    --namespace "$AB_NAMESPACE" \
    --region 'A9FGgv3j' \
    --body '{"buffer_count": 46, "buffer_percent": 75, "max_count": 32, "min_count": 27, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'xyEMlFKd' \
    --namespace "$AB_NAMESPACE" \
    --version 'N1uFuAeX' \
    --body '{"buffer_count": 15, "buffer_percent": 3, "configuration": "zpS0GNF3", "enable_region_overrides": false, "game_version": "hOphNwAU", "max_count": 49, "min_count": 36, "region_overrides": {"e2gAyDKo": {"buffer_count": 5, "buffer_percent": 79, "max_count": 11, "min_count": 41, "name": "Mbpb0Z9y", "use_buffer_percent": false}, "RkkrfBht": {"buffer_count": 58, "buffer_percent": 38, "max_count": 58, "min_count": 79, "name": "eA1hhLqr", "use_buffer_percent": false}, "gPoVcQi2": {"buffer_count": 32, "buffer_percent": 67, "max_count": 34, "min_count": 21, "name": "hG2IQ5Xo", "use_buffer_percent": false}}, "regions": ["UkhDal2W", "FkeRKxYm", "6trMVv5O"], "session_timeout": 35, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '3DkPxl3J' \
    --namespace "$AB_NAMESPACE" \
    --version '5nLn2GOU' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'EspN52bp' \
    --namespace "$AB_NAMESPACE" \
    --version 'TN2Qblk7' \
    --body '{"buffer_count": 8, "buffer_percent": 40, "configuration": "B7P5LpHD", "enable_region_overrides": false, "game_version": "lYW1HPBM", "max_count": 63, "min_count": 65, "regions": ["kakgNFUb", "lBfC3rI0", "1f0QxYGt"], "session_timeout": 18, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'bCSjd0Xn' \
    --namespace "$AB_NAMESPACE" \
    --region 'D47QZfMF' \
    --version 'oCjFK2yv' \
    --body '{"buffer_count": 16, "buffer_percent": 9, "max_count": 25, "min_count": 29, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'asPUbdbg' \
    --namespace "$AB_NAMESPACE" \
    --region 'bSXxuyys' \
    --version 'M0aNKNpS' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'NEGfgzOx' \
    --namespace "$AB_NAMESPACE" \
    --region 'Mj2lIj5Z' \
    --version 'YyokNJb6' \
    --body '{"buffer_count": 96, "buffer_percent": 50, "max_count": 86, "min_count": 93, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '30' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'FBqh3ed1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '2ryvEIqA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 67, "mem_limit": 65, "params": "WjTBbGeq"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'uf1dTKX7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'riY39bgv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 24, "mem_limit": 89, "name": "5KQcD8XH", "params": "8PoTmyul"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'HbxUYjDM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 24}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'PFPtNhll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'wCN8O6ZP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ZdqMoZ3q", "port": 60}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'umlo88Co' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '14' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'wl8RtTdn' \
    --version '2BOnCNgw' \
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
    --imageURI 'LZ6SHNWr' \
    --version '3C6H7pUw' \
    --versionPatch '4oL2Tb9C' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version '3HOEifaI' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'b3c60Ebd' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'dggNXL4Z' \
    --versionPatch 'J94aeoap' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'pyjV41OG' \
    --count '46' \
    --offset '18' \
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
    --region 'Bs92GHvw' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'YHUjd22Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'pbHw1NQa' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'KXZTAzPp' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'AAG582h9' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'dDbdczu4' \
    --withServer  \
    --count '54' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'qTJJd7eo' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'rNzcyUAG' \
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
    --version 'psW9HdIA' \
    > test.out 2>&1
eval_tap $? 56 'ImageDetailClient' test.out

#- 57 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tOXExYAX"}' \
    > test.out 2>&1
eval_tap $? 57 'DeregisterLocalServer' test.out

#- 58 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "4oPZBAcu", "ip": "C9ExDmIG", "name": "qKy4nOEO", "port": 85}' \
    > test.out 2>&1
eval_tap $? 58 'RegisterLocalServer' test.out

#- 59 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "YbB4MGpx", "pod_name": "ikUhlDs6"}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterServer' test.out

#- 60 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "kq2RQwfK"}' \
    > test.out 2>&1
eval_tap $? 60 'ShutdownServer' test.out

#- 61 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '9hh247Ua' \
    > test.out 2>&1
eval_tap $? 61 'GetServerSession' test.out

#- 62 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "oYjiRFAx", "configuration": "58dlFd1J", "deployment": "ZemHgg9b", "game_mode": "CoJHthOx", "matching_allies": [{"matching_parties": [{"party_attributes": {"TLmKQlWK": {}, "856i8psO": {}, "O6vJPtEH": {}}, "party_id": "qaX82LLj", "party_members": [{"user_id": "O75Qn9Bd"}, {"user_id": "NoVvHR4Z"}, {"user_id": "Vvs3fKsc"}]}, {"party_attributes": {"IzDBjeNv": {}, "rxC7E7BV": {}, "Ryi0npr8": {}}, "party_id": "MDuaWd5C", "party_members": [{"user_id": "PAhpwih2"}, {"user_id": "a7LsPTNW"}, {"user_id": "CtByKKKS"}]}, {"party_attributes": {"41ZNAyPB": {}, "v2l73m0H": {}, "1B2UptW4": {}}, "party_id": "k9rFxp42", "party_members": [{"user_id": "YeazkAzQ"}, {"user_id": "3XVTG64u"}, {"user_id": "cakWUOjR"}]}]}, {"matching_parties": [{"party_attributes": {"3X7jz0Gc": {}, "2yI95gbo": {}, "6toRMWP7": {}}, "party_id": "lm9xCieP", "party_members": [{"user_id": "QtftgYfo"}, {"user_id": "mRUDSQ6y"}, {"user_id": "vaIiD8Mw"}]}, {"party_attributes": {"k8YIQd5B": {}, "2hlGxlbD": {}, "azCPLkoi": {}}, "party_id": "5DxRVLJO", "party_members": [{"user_id": "fUvFWndr"}, {"user_id": "pTUtl26R"}, {"user_id": "VtYYDS4U"}]}, {"party_attributes": {"oACA4oTW": {}, "inHax59h": {}, "mxqWmXtr": {}}, "party_id": "FauTco77", "party_members": [{"user_id": "ub1tA46n"}, {"user_id": "PF2tCyq2"}, {"user_id": "hAIRr02g"}]}]}, {"matching_parties": [{"party_attributes": {"2ZhfYjRT": {}, "AqNv0RiM": {}, "6ROfru9y": {}}, "party_id": "9vApDWbb", "party_members": [{"user_id": "Xw1mTWGt"}, {"user_id": "Cc63gQXK"}, {"user_id": "ctSnGHHO"}]}, {"party_attributes": {"MIEmImQA": {}, "ei2bqMy2": {}, "VnHNS919": {}}, "party_id": "P2tmU32B", "party_members": [{"user_id": "He1T3vaN"}, {"user_id": "vXLPXaN7"}, {"user_id": "q5u5pot0"}]}, {"party_attributes": {"5JQGGOZK": {}, "0JqaGgOq": {}, "uBkCy9uR": {}}, "party_id": "f7gl3PZK", "party_members": [{"user_id": "thDf0E6e"}, {"user_id": "FZintbLb"}, {"user_id": "Q3OmqYHB"}]}]}], "namespace": "ZlcOFPFl", "notification_payload": {}, "pod_name": "XQFvlb0H", "region": "0J5vJYWs", "session_id": "r0AiTsUV"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateSession' test.out

#- 63 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "YAEsiO6N"}' \
    > test.out 2>&1
eval_tap $? 63 'ClaimServer' test.out

#- 64 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ToW4nVN2' \
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
    --region 'qPj5QVuU' \
    > test.out 2>&1
eval_tap $? 67 'ListProvidersByRegion' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE