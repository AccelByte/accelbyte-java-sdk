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
    --body '{"artifactPath": "EAxcVpFrttufHIRd", "image": "H9UzVRiXbqlAw7r6", "namespace": "W2ktQG0h5JAav5kR", "persistent": false, "version": "4n8mzZ0m8SAMTwE6"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "I56IaRDBXxyaNoMR", "dockerPath": "6hkspInrAip6lyzS", "image": "xwElFHHdgs21Jub7", "imageSize": 98, "namespace": "CUkNmKJfh5pUkHOD", "persistent": true, "version": "FcDtgOjchIua5tWE"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "IC32ogW7olvbTgrh", "dockerPath": "RTcPiSuL0Sly6XM4", "image": "OI18mAQLnzjMf8GZ", "imageSize": 0, "namespace": "WBZqxYG3aREAu2D6", "patchVersion": "QVKNCWP75TB0i7pK", "persistent": true, "version": "c8OumKtPDKJDXn7Z"}' \
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
    --body '{"claim_timeout": 96, "creation_timeout": 4, "default_version": "68su8XfqlqNiTvB6", "port": 92, "ports": {"7AorKsxwkosAVerX": 31, "Ki5r6QEa1ysLEzth": 67, "mXhzkzWkFeZSoEAc": 57}, "protocol": "0P7MIIR7CkyF6C7d", "providers": ["uuyZ0GhDogqrhBRd", "8lDR6qVNPRZYdFLI", "AjGGJddVCvu9vx5K"], "session_timeout": 88, "unreachable_timeout": 22}' \
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
    --body '{"claim_timeout": 76, "creation_timeout": 75, "default_version": "GMS0lyuI9a2I9u6V", "port": 31, "protocol": "aT5kPxUfofvnnSuB", "providers": ["0y5WUlrMdI4sNvea", "bntBSxTeIv53HGCi", "ljvjKoyD6SCwGrnc"], "session_timeout": 34, "unreachable_timeout": 21}' \
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
    --name 'mLtjQHAf8TgoNm03' \
    --count '98' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 's9Q0mPVo3twu0Mes' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'TCf9x4rt69lna7qx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 10, "buffer_percent": 20, "configuration": "IxPz6MbwL6IY69z1", "enable_region_overrides": false, "game_version": "aLqYSYWytLPziZMd", "max_count": 19, "min_count": 89, "overrides": {"xcBZufQxGiHPllG4": {"buffer_count": 5, "buffer_percent": 42, "configuration": "EzfTD1ZBm3MqHcUm", "enable_region_overrides": false, "game_version": "trkmu0hpDDWVAla2", "max_count": 24, "min_count": 43, "name": "5BYNtIuS5S5XUdjs", "region_overrides": {"oqwGyzzWi9gwQYv7": {"buffer_count": 39, "buffer_percent": 50, "max_count": 42, "min_count": 30, "name": "7Vk6Jt4Ymos9Jcdo", "unlimited": true, "use_buffer_percent": true}, "4fYcTVU6RBt0zYoM": {"buffer_count": 4, "buffer_percent": 54, "max_count": 68, "min_count": 13, "name": "yCUEXlAvxJMdalwS", "unlimited": true, "use_buffer_percent": false}, "PX2bOItRMvqtlB2j": {"buffer_count": 72, "buffer_percent": 58, "max_count": 61, "min_count": 92, "name": "I8JlDbPWbQ6Q9lNm", "unlimited": true, "use_buffer_percent": false}}, "regions": ["RBaAkLnvxkT1X68c", "mDc3fxU8MyKrQpM4", "hkkK6KKXNB3Gv0Iq"], "session_timeout": 26, "unlimited": true, "use_buffer_percent": false}, "51TkhjYnaq6foWvX": {"buffer_count": 0, "buffer_percent": 84, "configuration": "3bMrXsDr6kILsSSy", "enable_region_overrides": true, "game_version": "Rrvjj7il35MXbN9o", "max_count": 59, "min_count": 76, "name": "MNqq98SjTvhZNkSQ", "region_overrides": {"70D0H6BXksUC9b6i": {"buffer_count": 23, "buffer_percent": 32, "max_count": 30, "min_count": 58, "name": "D3Qgb3boLQQ1MzH7", "unlimited": true, "use_buffer_percent": false}, "ZNBdte9NDUPVJf6c": {"buffer_count": 13, "buffer_percent": 87, "max_count": 55, "min_count": 64, "name": "xfgPubTDIHrvqATh", "unlimited": true, "use_buffer_percent": false}, "wjRHpKKTlmVr9Xuo": {"buffer_count": 74, "buffer_percent": 11, "max_count": 4, "min_count": 89, "name": "vneSD2Tb3g7mSQUh", "unlimited": true, "use_buffer_percent": true}}, "regions": ["RENjEEztx1WsYSiZ", "qan0nSBJroav91GX", "lvPG6bFYReVHQipc"], "session_timeout": 59, "unlimited": false, "use_buffer_percent": true}, "gWa24CKNS0GqVvUf": {"buffer_count": 70, "buffer_percent": 62, "configuration": "QvsHXNUNe4mhgo5Q", "enable_region_overrides": true, "game_version": "48l9lyNApflxqMrj", "max_count": 66, "min_count": 29, "name": "gbLdLsFzHkBMr1yr", "region_overrides": {"OMlNFSrUEirnjX9f": {"buffer_count": 60, "buffer_percent": 0, "max_count": 26, "min_count": 18, "name": "IbeZxzfTcyiuATus", "unlimited": false, "use_buffer_percent": false}, "TBcvrbYCwZtxFHyP": {"buffer_count": 77, "buffer_percent": 57, "max_count": 39, "min_count": 81, "name": "I8ilbyDPUIj88cek", "unlimited": false, "use_buffer_percent": true}, "qCt81P1ktfIovmv9": {"buffer_count": 13, "buffer_percent": 35, "max_count": 38, "min_count": 84, "name": "R5cJcHm3SZLxoRDF", "unlimited": true, "use_buffer_percent": true}}, "regions": ["fRByjlBiuFM3FIoV", "k8T3GpAnkCmBUqg2", "SCnqntX9y1aZSWMi"], "session_timeout": 98, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"10sG6vxkfUcmqRRb": {"buffer_count": 5, "buffer_percent": 96, "max_count": 10, "min_count": 56, "name": "J5i0EeDxOgBnhhqE", "unlimited": false, "use_buffer_percent": true}, "IaDml48wdNFLTm5T": {"buffer_count": 39, "buffer_percent": 48, "max_count": 43, "min_count": 88, "name": "WT0GfH2rtOa4EXsX", "unlimited": true, "use_buffer_percent": true}, "XQAk4mqrxzTtuLl4": {"buffer_count": 77, "buffer_percent": 22, "max_count": 61, "min_count": 2, "name": "x9gIiDandpGT2t24", "unlimited": false, "use_buffer_percent": false}}, "regions": ["OMh5eC3IHeHSKLCa", "3xreNDUWehwH3q31", "A806DJgas4b6z3LN"], "session_timeout": 96, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'oKFeIaFQCYoDPICp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'nduEEQlULdJz4mnR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 90, "buffer_percent": 22, "configuration": "CAcf80zfFyabWAgI", "enable_region_overrides": false, "game_version": "XiI07A68eaqC2J9j", "max_count": 51, "min_count": 61, "regions": ["XzjjI5YbsKoADkzJ", "EN2VHzih3bit0VWn", "3CO39PXDNxtXgeO3"], "session_timeout": 64, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'kXhjDzaQY3snn2Zk' \
    --namespace "$AB_NAMESPACE" \
    --region 'P7cFdP43e5dC9XIB' \
    --body '{"buffer_count": 43, "buffer_percent": 3, "max_count": 8, "min_count": 90, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'grbHDIDm4hMzF4Tx' \
    --namespace "$AB_NAMESPACE" \
    --region 'odenSrUTvfqU0bfo' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'Mm5cTtFWbotQyXJR' \
    --namespace "$AB_NAMESPACE" \
    --region 'cQWsmqPNs92epxk0' \
    --body '{"buffer_count": 18, "buffer_percent": 41, "max_count": 44, "min_count": 97, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'TZBRujIUE1Tq5jyA' \
    --namespace "$AB_NAMESPACE" \
    --version 'ZvkRCMNFIurjh2im' \
    --body '{"buffer_count": 6, "buffer_percent": 9, "configuration": "b4rbkXj0ZwsVC0gL", "enable_region_overrides": true, "game_version": "ZVJSPqJiwv1qlYB1", "max_count": 90, "min_count": 82, "region_overrides": {"SKs6gQxC3Gb7S0o4": {"buffer_count": 51, "buffer_percent": 18, "max_count": 66, "min_count": 31, "name": "YY7KQI1AeFgPqaOk", "unlimited": true, "use_buffer_percent": false}, "Wql4nmwAft4gqkNN": {"buffer_count": 24, "buffer_percent": 99, "max_count": 18, "min_count": 22, "name": "MD3cym8xIfkOVW2g", "unlimited": true, "use_buffer_percent": true}, "REOLx0KOww3HICQL": {"buffer_count": 11, "buffer_percent": 39, "max_count": 23, "min_count": 23, "name": "7MUBG7qtPu64yAtU", "unlimited": true, "use_buffer_percent": false}}, "regions": ["BbRPZTF6oQAXVG7t", "nsZg5QgXjvyGJPN4", "eXbJE5Vs2GcyomQo"], "session_timeout": 71, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'imBJehyxlNsjUgxB' \
    --namespace "$AB_NAMESPACE" \
    --version 'kF6wFPoJeQediogE' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'hhM2rIizGdKvOPdq' \
    --namespace "$AB_NAMESPACE" \
    --version '5xrgxSmy1DN9LFkY' \
    --body '{"buffer_count": 100, "buffer_percent": 34, "configuration": "DQyj4bj5Ro2ogaKt", "enable_region_overrides": true, "game_version": "EDSJsEK5QpNhlI2i", "max_count": 91, "min_count": 31, "regions": ["5EpGhhvXYck0upMz", "UYnb76tFkEORV3bu", "1bNCtX7W40V6Do5s"], "session_timeout": 0, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'CCFrHHC3DpZxkrQD' \
    --namespace "$AB_NAMESPACE" \
    --region 'XuNFviMarv8mnfHK' \
    --version '8CCmE2lPnsbD3SGE' \
    --body '{"buffer_count": 6, "buffer_percent": 25, "max_count": 23, "min_count": 47, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'UccE536ugBp3HBve' \
    --namespace "$AB_NAMESPACE" \
    --region 'pnDCjgyJlXe36mgW' \
    --version 'jLfFmteue9nzJ6fH' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '24T805tVg8JqU0jZ' \
    --namespace "$AB_NAMESPACE" \
    --region 'pjvsugAOS7u8RiWy' \
    --version 'erCSa8SRgwsAj1ik' \
    --body '{"buffer_count": 56, "buffer_percent": 20, "max_count": 12, "min_count": 80, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '38' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'B1fPqqRRulpqpymD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'kQhtrHWwRVnwVBOq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 84, "mem_limit": 68, "params": "wbhMssAHjapIkY9R"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'f4wP57dBZNR88YbC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'tmKy8M9zVrjfGXZn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 33, "mem_limit": 24, "name": "AQUoY1GjlIIk0iKo", "params": "TTS1j02o7JjTXAQN"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '0qdskdQV0TqI8EFn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 25}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'DOJvrTefglSs6g4i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'Y9u02aCNYIWekp18' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "lOC3mNqF7Bl0Lcgh", "port": 98}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'IIlGcHB3CfR3ncDl' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '17' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '3v3MFFJ1KesKoELC' \
    --version 'pobBEG8X645xpdXp' \
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
    --imageURI 'ai0rYaT5hOPjaf3H' \
    --version '0tYighU0VUfcYHJb' \
    --versionPatch 'BfAKSiPW3VgsZXiR' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version '1DJ7HVWqMkNSawQU' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'WDFJvJBWic7UkBeI' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'XuqDuAXI66bQ71w0' \
    --versionPatch 'deoV9Lx5RDA1l2Xc' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'rciYNEzvSZIPkhSg' \
    --count '82' \
    --offset '89' \
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
    --region 'KtOv7Zy0b65uvuKN' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'uy0ytZQ7M6Nzy1ad' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'nSKOLFKx1dX4LuWJ' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'u3pDMUAeeZ97SBRO' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'PYuG6XqP6oo7G73z' \
    --withServer  \
    --count '6' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'xTgOfnwIdlNa29fD' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Lh741IslKHzGlLKW' \
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
    --version 'UtDQs61OQAoxyyQp' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "RWCiiPDGQhNPEwiJ"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "Cf2XJVrlzqQls1oz", "ip": "hLVA3kE8jKvgatOE", "name": "BM70TdlNBJYOmpu1", "port": 98}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "c6esUp6Sw1I98jeZ", "pod_name": "Q7hfxnhLd3Knakno"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "glU6muswVJnNnN7k"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'Aa7j0riFc5HTHQIo' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "VsGo7dwV9DBqFKHQ", "configuration": "kETJyTlUrwDTnouj", "deployment": "QD4IEiH9Z5qXn3ao", "game_mode": "RtlqOECohViHA5Cz", "matching_allies": [{"matching_parties": [{"party_attributes": {"gFSy8X1A3PrIfapq": {}, "5AAeMe4L3mDWORBV": {}, "XTIIJM9XsYIIZxiX": {}}, "party_id": "NMR9BgaWcFX3SUBh", "party_members": [{"user_id": "yoTsMWPAxUMkawaG"}, {"user_id": "pAyrIwMif3BOdkoc"}, {"user_id": "VTd4BxqGWV6mTJ0s"}]}, {"party_attributes": {"Qs6XNbjvqhnUVLWu": {}, "8olKdxL6ozRmDD0j": {}, "JvlfV5OemPYdYT7D": {}}, "party_id": "ROCjtuzFMbAG9YI8", "party_members": [{"user_id": "9hmguB8FOTjMLo4b"}, {"user_id": "9rIzqYkEpstyVTBc"}, {"user_id": "rM8rG0rH0zcswwVe"}]}, {"party_attributes": {"MK6MbGIVIu8vvwLc": {}, "7KY3uVoJXTIMtpgk": {}, "ieDyF97lGdMiHKxb": {}}, "party_id": "WCYzo8yO2KTK9tmm", "party_members": [{"user_id": "OnYnOpas6ghP1y4Z"}, {"user_id": "i7s7QBlk44Z44B1G"}, {"user_id": "ZgKg4uKxaCgcGLuC"}]}]}, {"matching_parties": [{"party_attributes": {"3brWdTYCfHkIySok": {}, "5DiXZtLW87rGysry": {}, "od3dNQrmsApRA6HX": {}}, "party_id": "3RwrKt2ecozL0TOg", "party_members": [{"user_id": "54vCE48L5oLF6M4l"}, {"user_id": "Na4JUMSHNgqRqCV7"}, {"user_id": "usamANkZlOX9Sfo9"}]}, {"party_attributes": {"5HgXqKhTPkwfLM9u": {}, "SybRzWek2gZvRrvr": {}, "0n9d9lvccKMLhrTr": {}}, "party_id": "cBE2ItBS3KtKZWe8", "party_members": [{"user_id": "aoFzAyBME74HUtip"}, {"user_id": "UWYhWV1qx8CzPML5"}, {"user_id": "2faXUr9Sk4lq2faB"}]}, {"party_attributes": {"cAXXKlhvyH8paOJt": {}, "xqMPpcVfRwNj547f": {}, "H0XrKEDpEY8VnocG": {}}, "party_id": "Ajci0V3tBf2jnHGK", "party_members": [{"user_id": "Xphn50c9tNLDljhZ"}, {"user_id": "2jxLRX3z46OCaGBe"}, {"user_id": "MfPlNos4yBRjrERH"}]}]}, {"matching_parties": [{"party_attributes": {"EonAZR8GmEu0q1p6": {}, "QCyY6vSkVFWdsbYu": {}, "VEGVxYheR3j5mNZ6": {}}, "party_id": "vwv7K8Asvt1j1Rx5", "party_members": [{"user_id": "9hesNWy2NvZ85DDK"}, {"user_id": "DAF8KDsBZOuYQJ03"}, {"user_id": "BAHZ7c53q7akMpcm"}]}, {"party_attributes": {"nnx6RVBrop9v7aZK": {}, "3h65hbN15zfQSfQr": {}, "tfF3TQN0OcNDLr36": {}}, "party_id": "vzohZyjMQAg5mPYh", "party_members": [{"user_id": "rLTyU8OhgfY9JQYG"}, {"user_id": "F4bYXEcENx9xZlAc"}, {"user_id": "hob44lONDDwMvgI0"}]}, {"party_attributes": {"HlyPR7wZNiVsF6xG": {}, "2mXEQdbzIVy8alnc": {}, "V7vWgSHdfo07UctP": {}}, "party_id": "ErqxyMyOK06MqQBE", "party_members": [{"user_id": "rxgjVBycvU4PbmRD"}, {"user_id": "crg0DjQjBECXvea7"}, {"user_id": "H1m2lJFRZ3ZprZ60"}]}]}], "namespace": "zMjhTHeh94TSenE5", "notification_payload": {}, "pod_name": "hCFkIf5weqZ18MH5", "region": "7l2Zsrh90ETtYmGu", "session_id": "kz3MnlrjcHp6B8Vj"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "7rXFgDnDkdZ9bpjb"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '1tdA3QhjCMW64f4X' \
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
    --region 'hIjSoTB2NMKtezap' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE