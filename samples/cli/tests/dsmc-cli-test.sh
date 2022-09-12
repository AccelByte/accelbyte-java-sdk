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
    --body '{"artifactPath": "Vb4RPofJ", "image": "4iIt3jB3", "namespace": "SdM4eSfy", "persistent": false, "version": "V2Mkzesr"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "JKIFcFob", "dockerPath": "1jLaRSbz", "image": "bZV1VuND", "imageSize": 42, "namespace": "tKd1UFWZ", "persistent": true, "version": "n9EOHfX1"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "b3ZTQIdr", "dockerPath": "RGrh5yLT", "image": "0rmg2Fl3", "imageSize": 19, "namespace": "Be50daDm", "patchVersion": "1rlPRDlE", "persistent": false, "version": "WURaQuhT"}' \
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
    --body '{"claim_timeout": 98, "creation_timeout": 22, "default_version": "3xyfqXob", "port": 98, "ports": {"lt98Qquj": 11, "Pvr4vr99": 57, "QKsMZ9ig": 95}, "protocol": "Id9aX9nr", "providers": ["iSemsIBo", "UcyOzAaA", "zO4ygmfG"], "session_timeout": 10, "unreachable_timeout": 36}' \
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
    --body '{"claim_timeout": 35, "creation_timeout": 37, "default_version": "0WiateSr", "port": 50, "protocol": "s7UDlD0m", "providers": ["JDd0IcN9", "bC440Ito", "TYaGaNNF"], "session_timeout": 2, "unreachable_timeout": 70}' \
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
    --name 'ahkUBU6U' \
    --count '17' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'vtfm7OOm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'KFT3qk5w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 19, "buffer_percent": 66, "configuration": "Gp9KSaGe", "enable_region_overrides": false, "game_version": "Loy8rUMK", "max_count": 17, "min_count": 5, "overrides": {"VaglL2cv": {"buffer_count": 47, "buffer_percent": 28, "configuration": "LHRZvcnC", "enable_region_overrides": true, "game_version": "yY003Y3i", "max_count": 57, "min_count": 94, "name": "wvMJa6b5", "region_overrides": {"WXo3Yrml": {"buffer_count": 18, "buffer_percent": 78, "max_count": 66, "min_count": 12, "name": "e1oFx6ry", "unlimited": true, "use_buffer_percent": false}, "eqWbjjxx": {"buffer_count": 59, "buffer_percent": 83, "max_count": 85, "min_count": 52, "name": "ZgKQQj1q", "unlimited": true, "use_buffer_percent": true}, "UdOrVrqQ": {"buffer_count": 13, "buffer_percent": 25, "max_count": 6, "min_count": 88, "name": "y0QHFuER", "unlimited": true, "use_buffer_percent": false}}, "regions": ["CAEFrZp8", "weagefis", "LMoIV6Qf"], "session_timeout": 68, "unlimited": true, "use_buffer_percent": false}, "xqwjVYpE": {"buffer_count": 51, "buffer_percent": 88, "configuration": "174RAnEj", "enable_region_overrides": true, "game_version": "J3e2OKh2", "max_count": 4, "min_count": 51, "name": "weJDxCtJ", "region_overrides": {"bnvGeKH3": {"buffer_count": 36, "buffer_percent": 85, "max_count": 68, "min_count": 45, "name": "lhdmdm10", "unlimited": false, "use_buffer_percent": false}, "VzOsoM7B": {"buffer_count": 29, "buffer_percent": 53, "max_count": 67, "min_count": 38, "name": "zqGmuHyl", "unlimited": true, "use_buffer_percent": false}, "VcWx0tsW": {"buffer_count": 44, "buffer_percent": 19, "max_count": 32, "min_count": 37, "name": "PR8QsdRu", "unlimited": false, "use_buffer_percent": true}}, "regions": ["iC5oNWb8", "acWpWB7y", "5IbNY0pn"], "session_timeout": 1, "unlimited": false, "use_buffer_percent": false}, "MMjhvnot": {"buffer_count": 66, "buffer_percent": 7, "configuration": "6Qs7T5DS", "enable_region_overrides": true, "game_version": "jp3GiFts", "max_count": 28, "min_count": 79, "name": "qV1ZpEqn", "region_overrides": {"hlUBoTHs": {"buffer_count": 44, "buffer_percent": 32, "max_count": 2, "min_count": 0, "name": "hj97d3Ea", "unlimited": true, "use_buffer_percent": false}, "Td9CEFXC": {"buffer_count": 97, "buffer_percent": 30, "max_count": 34, "min_count": 56, "name": "Z2taLSrA", "unlimited": true, "use_buffer_percent": true}, "kLOc2TAH": {"buffer_count": 16, "buffer_percent": 41, "max_count": 73, "min_count": 72, "name": "GJxZMOjG", "unlimited": false, "use_buffer_percent": true}}, "regions": ["eaHOUwaO", "R52E7D0G", "raSvQtvy"], "session_timeout": 36, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"VvRP6KUt": {"buffer_count": 34, "buffer_percent": 25, "max_count": 81, "min_count": 74, "name": "ccsets0m", "unlimited": false, "use_buffer_percent": false}, "ON4ZKhid": {"buffer_count": 2, "buffer_percent": 62, "max_count": 55, "min_count": 60, "name": "5eWbpq8i", "unlimited": false, "use_buffer_percent": false}, "mJaL7UcS": {"buffer_count": 74, "buffer_percent": 7, "max_count": 53, "min_count": 46, "name": "fPrpUdz3", "unlimited": false, "use_buffer_percent": false}}, "regions": ["7dt28caW", "3YgHNOFG", "vkW4wflo"], "session_timeout": 12, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'M4aHrgX1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'eKuL0yRk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 44, "buffer_percent": 9, "configuration": "5SsDfzIl", "enable_region_overrides": false, "game_version": "uDxIH3w0", "max_count": 4, "min_count": 26, "regions": ["uPmSWGRA", "wFGdVKA1", "GL7NlxgF"], "session_timeout": 70, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'weyxYl7z' \
    --namespace "$AB_NAMESPACE" \
    --region 's4oUIc89' \
    --body '{"buffer_count": 3, "buffer_percent": 98, "max_count": 85, "min_count": 85, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'CGqrX3Zi' \
    --namespace "$AB_NAMESPACE" \
    --region '4TljcBK4' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'tWog0fIk' \
    --namespace "$AB_NAMESPACE" \
    --region '1VgQLOPk' \
    --body '{"buffer_count": 0, "buffer_percent": 54, "max_count": 38, "min_count": 46, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment '19WsdB5W' \
    --namespace "$AB_NAMESPACE" \
    --version 'Df6gYDYy' \
    --body '{"buffer_count": 60, "buffer_percent": 13, "configuration": "68w8EKmt", "enable_region_overrides": true, "game_version": "6ElLLePj", "max_count": 80, "min_count": 96, "region_overrides": {"PKPS3qUh": {"buffer_count": 26, "buffer_percent": 66, "max_count": 26, "min_count": 33, "name": "DNNHpmuC", "unlimited": false, "use_buffer_percent": true}, "ubJDvUpO": {"buffer_count": 92, "buffer_percent": 11, "max_count": 72, "min_count": 34, "name": "N7E8tdmm", "unlimited": false, "use_buffer_percent": true}, "TFQkPG3M": {"buffer_count": 34, "buffer_percent": 49, "max_count": 45, "min_count": 12, "name": "eVkIBxiQ", "unlimited": true, "use_buffer_percent": true}}, "regions": ["18VpG2P7", "EMGY82P8", "fzBXVk7s"], "session_timeout": 39, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'Ic9410j9' \
    --namespace "$AB_NAMESPACE" \
    --version 'aTG7LHUi' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'Lvg1LrnA' \
    --namespace "$AB_NAMESPACE" \
    --version 'P9LOlre8' \
    --body '{"buffer_count": 97, "buffer_percent": 83, "configuration": "WoTK5yVT", "enable_region_overrides": false, "game_version": "Jn8msSJP", "max_count": 9, "min_count": 23, "regions": ["BRy6apZ2", "yCtrwFEv", "ayxxfXVX"], "session_timeout": 63, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'ZztniJFs' \
    --namespace "$AB_NAMESPACE" \
    --region 'iQaJgbSb' \
    --version '44lwOWvW' \
    --body '{"buffer_count": 71, "buffer_percent": 71, "max_count": 47, "min_count": 66, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'vOmYdZ8F' \
    --namespace "$AB_NAMESPACE" \
    --region 'IwiBdmGy' \
    --version '7uPBtkJw' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'WoVsIHeJ' \
    --namespace "$AB_NAMESPACE" \
    --region 'TO3WPDpf' \
    --version 'Xss6KMud' \
    --body '{"buffer_count": 94, "buffer_percent": 62, "max_count": 17, "min_count": 47, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '54' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'saf4XQo2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'egFykUTR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 26, "mem_limit": 38, "params": "CfgigWNc"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'MhclbwJO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'rafW2gMs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 5, "mem_limit": 32, "name": "xkM4cqbx", "params": "FJzMEgQN"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'sITdnxoR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 84}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'Pyn0y2ra' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'QAFuWmka' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "9kMRQ2Hi", "port": 31}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'C3e9W28D' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '34' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'UoGjLjpc' \
    --version 'Dd7QTS67' \
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
    --imageURI 'EYMU3kkO' \
    --version 'X0FozljK' \
    --versionPatch 'sKVbGjZ3' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'MZI8RbXn' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '0dq8nABz' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'w71B7axe' \
    --versionPatch '9QworUav' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'Z0oj5yds' \
    --count '80' \
    --offset '33' \
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
    --region 'MWpPY2da' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'FG6kDVsa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'wgQgeEGX' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'ELFQYAZr' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'DIO9p5Tt' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Z7y1TbKE' \
    --withServer  \
    --count '27' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'mC9aPtxq' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6cuQyVUb' \
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
    --version '3r3JIi0C' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "DXKB1wfl"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "5Mdx1QuF", "ip": "nnZe2MMY", "name": "HR3H2v3A", "port": 40}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "gWUpnjhX", "pod_name": "1COgU0LW"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "g0iKhgxW"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'UpgrClkK' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "RGcj2FSh", "configuration": "Dj2HyI55", "deployment": "2Ikq64q6", "game_mode": "Rw6dprMs", "matching_allies": [{"matching_parties": [{"party_attributes": {"bV2wlcBw": {}, "c7q65eqM": {}, "k5Joxbu2": {}}, "party_id": "Dhd5FhKM", "party_members": [{"user_id": "FFJLEIkI"}, {"user_id": "AZFk39wv"}, {"user_id": "NPHMUdNh"}]}, {"party_attributes": {"va0QZuBf": {}, "eEUVBE4A": {}, "dkyBWJxb": {}}, "party_id": "O9PfzbeU", "party_members": [{"user_id": "1j4XhL5N"}, {"user_id": "EqqYCP5t"}, {"user_id": "txpC9nDd"}]}, {"party_attributes": {"kYCNQXyv": {}, "emCU5lZN": {}, "qnNZcA3Y": {}}, "party_id": "9mBXlaIQ", "party_members": [{"user_id": "E2ccCgnW"}, {"user_id": "WhqyFzfh"}, {"user_id": "k8IFwWXD"}]}]}, {"matching_parties": [{"party_attributes": {"KwN6ZSRp": {}, "t0MLVdoW": {}, "P55RLXEU": {}}, "party_id": "KSifdkmf", "party_members": [{"user_id": "3vYYo2x2"}, {"user_id": "EBQn51FN"}, {"user_id": "oQ2BGuGi"}]}, {"party_attributes": {"Z0WxLZ43": {}, "FsC6TKMZ": {}, "di2Q5LiJ": {}}, "party_id": "iLEsyY6Y", "party_members": [{"user_id": "wDZV0ruv"}, {"user_id": "wkWvT68t"}, {"user_id": "c5YLRsQJ"}]}, {"party_attributes": {"3hZFOqaa": {}, "VnMJlBGx": {}, "YZz7ZVU3": {}}, "party_id": "Jtq0Mxum", "party_members": [{"user_id": "yjHFZJdo"}, {"user_id": "ZpLqO49m"}, {"user_id": "Mon3DPjB"}]}]}, {"matching_parties": [{"party_attributes": {"jYLfZJVa": {}, "Za6dhM0s": {}, "IIlfmPVp": {}}, "party_id": "zLdJgUut", "party_members": [{"user_id": "NtGF1M8Z"}, {"user_id": "MMM1oxpy"}, {"user_id": "gAYhlFZR"}]}, {"party_attributes": {"ijx6sTqN": {}, "NOeMIIWP": {}, "Frk2mf1q": {}}, "party_id": "7KjOzNlq", "party_members": [{"user_id": "C25aW0Mw"}, {"user_id": "UBOsNn97"}, {"user_id": "nGQem2Sa"}]}, {"party_attributes": {"qPfon3Cr": {}, "Oun0madd": {}, "aRI2cfhl": {}}, "party_id": "j2VDjU1C", "party_members": [{"user_id": "aWOz0Lp3"}, {"user_id": "YnpBwK0m"}, {"user_id": "KBhrmsvl"}]}]}], "namespace": "amQ5JhI7", "notification_payload": {}, "pod_name": "dfuphUFn", "region": "eo9oQG0n", "session_id": "qB5biNcc"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "HsuUyWgw"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'oKZ6STeJ' \
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
    --region 'DseEJ5GT' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE