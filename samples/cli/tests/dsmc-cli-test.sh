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
    --body '{"artifactPath": "QF8vFZV3", "image": "HauyBM0M", "namespace": "JfXf9SGf", "persistent": false, "version": "QwChys0w"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "LFXB0TRR", "dockerPath": "y77nudlo", "image": "DMLqV5JO", "imageSize": 36, "namespace": "YHxco7s3", "persistent": false, "version": "3LokaL6E"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "5Qm82j8O", "dockerPath": "ySl6UGYx", "image": "DCkLEBtB", "imageSize": 36, "namespace": "MtnKNuyb", "patchVersion": "NAzNMug9", "persistent": true, "version": "G5Pp9ecj"}' \
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
    --body '{"claim_timeout": 77, "creation_timeout": 89, "default_version": "ujfM9VpT", "port": 3, "ports": {"asxzdmc7": 71, "eS37nhyJ": 48, "FQ1sl8jl": 17}, "protocol": "hWLwkmZa", "providers": ["TRr34TQI", "xIfx9keT", "PsgFU6V2"], "session_timeout": 91, "unreachable_timeout": 87}' \
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
    --body '{"claim_timeout": 98, "creation_timeout": 79, "default_version": "azoQexXU", "port": 46, "protocol": "CHKYxPiW", "providers": ["7aZYg3UH", "6otcALc5", "yXt2C2oA"], "session_timeout": 22, "unreachable_timeout": 54}' \
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
    --name '2o8rEluc' \
    --count '55' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '1ef0wMfK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Fw0WwceN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 38, "buffer_percent": 74, "configuration": "hOMB6Zlu", "enable_region_overrides": false, "game_version": "W6rF1o1a", "max_count": 2, "min_count": 100, "overrides": {"EGRk9JCb": {"buffer_count": 37, "buffer_percent": 4, "configuration": "8yqOJ1Jn", "enable_region_overrides": false, "game_version": "o0RyabFO", "max_count": 3, "min_count": 93, "name": "P4HoqdC6", "region_overrides": {"UdRTEQzR": {"buffer_count": 70, "buffer_percent": 78, "max_count": 70, "min_count": 42, "name": "lp8vUVWy", "unlimited": true, "use_buffer_percent": true}, "pkQuGHLv": {"buffer_count": 70, "buffer_percent": 64, "max_count": 55, "min_count": 8, "name": "2j5kaQgV", "unlimited": false, "use_buffer_percent": true}, "BkcITGSA": {"buffer_count": 78, "buffer_percent": 57, "max_count": 13, "min_count": 4, "name": "i05uiwtf", "unlimited": true, "use_buffer_percent": true}}, "regions": ["Qi7Y93lr", "k3cIHjtR", "lT400lCk"], "session_timeout": 33, "unlimited": false, "use_buffer_percent": true}, "W6tgvl7n": {"buffer_count": 32, "buffer_percent": 62, "configuration": "eJGdfUek", "enable_region_overrides": true, "game_version": "rUDFW7GS", "max_count": 56, "min_count": 57, "name": "pM398zPk", "region_overrides": {"xaYCWOgT": {"buffer_count": 76, "buffer_percent": 87, "max_count": 51, "min_count": 43, "name": "TyXAOqyd", "unlimited": false, "use_buffer_percent": false}, "3BMXvU17": {"buffer_count": 40, "buffer_percent": 9, "max_count": 91, "min_count": 39, "name": "uUaLuCdB", "unlimited": false, "use_buffer_percent": false}, "CQMZHsVp": {"buffer_count": 2, "buffer_percent": 41, "max_count": 25, "min_count": 16, "name": "p0VI2BAF", "unlimited": false, "use_buffer_percent": false}}, "regions": ["JNXuK144", "TqJVwlI7", "VLcWAgcz"], "session_timeout": 97, "unlimited": false, "use_buffer_percent": true}, "Lw25wpzf": {"buffer_count": 42, "buffer_percent": 83, "configuration": "O2Hh8YHm", "enable_region_overrides": false, "game_version": "WmsupJAl", "max_count": 51, "min_count": 93, "name": "jn2n1wbU", "region_overrides": {"85bdM96w": {"buffer_count": 60, "buffer_percent": 30, "max_count": 37, "min_count": 42, "name": "LYfv4DRk", "unlimited": false, "use_buffer_percent": true}, "awPoztU4": {"buffer_count": 71, "buffer_percent": 84, "max_count": 71, "min_count": 54, "name": "mNOfugI0", "unlimited": true, "use_buffer_percent": false}, "O3T8ARYL": {"buffer_count": 10, "buffer_percent": 83, "max_count": 57, "min_count": 58, "name": "hDKOiK7j", "unlimited": true, "use_buffer_percent": true}}, "regions": ["grGJ5QFD", "XKI5qR99", "eBGb7cMD"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"8pZc8JKv": {"buffer_count": 10, "buffer_percent": 58, "max_count": 82, "min_count": 76, "name": "3wEWAg3g", "unlimited": false, "use_buffer_percent": true}, "jUTqzxpi": {"buffer_count": 75, "buffer_percent": 20, "max_count": 97, "min_count": 11, "name": "ppZKyIxd", "unlimited": true, "use_buffer_percent": true}, "iwazwXeq": {"buffer_count": 67, "buffer_percent": 49, "max_count": 32, "min_count": 34, "name": "iX43SBZs", "unlimited": false, "use_buffer_percent": true}}, "regions": ["aMaM88aO", "78MRwAIS", "72jPHbsA"], "session_timeout": 75, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'bztDtmHx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'NOdOzWzo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 64, "buffer_percent": 12, "configuration": "MXW0o8s3", "enable_region_overrides": false, "game_version": "VEXhZG6g", "max_count": 61, "min_count": 41, "regions": ["XFyRRkKZ", "1jzUbW6y", "Gi90nwr4"], "session_timeout": 45, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'kny4Gpro' \
    --namespace "$AB_NAMESPACE" \
    --region 'lUFcCMrB' \
    --body '{"buffer_count": 67, "buffer_percent": 46, "max_count": 30, "min_count": 59, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '4WhYIYVh' \
    --namespace "$AB_NAMESPACE" \
    --region '65ulBXOp' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'XhuIQ59a' \
    --namespace "$AB_NAMESPACE" \
    --region 'TPTvb3bN' \
    --body '{"buffer_count": 86, "buffer_percent": 31, "max_count": 11, "min_count": 28, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'wkQmfiSu' \
    --namespace "$AB_NAMESPACE" \
    --version '3SjMV1ii' \
    --body '{"buffer_count": 0, "buffer_percent": 37, "configuration": "6YAWDmGk", "enable_region_overrides": false, "game_version": "2mBc37JJ", "max_count": 34, "min_count": 38, "region_overrides": {"5o0G555l": {"buffer_count": 52, "buffer_percent": 77, "max_count": 3, "min_count": 94, "name": "p2HGRweF", "unlimited": false, "use_buffer_percent": true}, "hUX1LKt7": {"buffer_count": 89, "buffer_percent": 67, "max_count": 27, "min_count": 5, "name": "csfu31n7", "unlimited": false, "use_buffer_percent": true}, "CWxWd9Ap": {"buffer_count": 17, "buffer_percent": 97, "max_count": 45, "min_count": 76, "name": "p7KtqYcw", "unlimited": true, "use_buffer_percent": false}}, "regions": ["10lBAdT0", "jp8tgglA", "S7PjQXXF"], "session_timeout": 73, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'AylW0Nq8' \
    --namespace "$AB_NAMESPACE" \
    --version 'VQszgRbt' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'tNBqGyze' \
    --namespace "$AB_NAMESPACE" \
    --version 'KKf3mbYC' \
    --body '{"buffer_count": 24, "buffer_percent": 82, "configuration": "UygUl74C", "enable_region_overrides": true, "game_version": "7lDB6Bxl", "max_count": 5, "min_count": 90, "regions": ["jmbUjQbS", "wtyxaw3F", "5oaBgLWn"], "session_timeout": 22, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'ggxLuaaW' \
    --namespace "$AB_NAMESPACE" \
    --region 'duRRQK7S' \
    --version 'IKqKAR5N' \
    --body '{"buffer_count": 75, "buffer_percent": 49, "max_count": 71, "min_count": 66, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'dzk2MJPl' \
    --namespace "$AB_NAMESPACE" \
    --region 'JNIaC9hF' \
    --version '2O2yZpTR' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'knKR8IfZ' \
    --namespace "$AB_NAMESPACE" \
    --region 'uYtFpjVK' \
    --version 'lc7eiM1B' \
    --body '{"buffer_count": 22, "buffer_percent": 59, "max_count": 69, "min_count": 45, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '95' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'xFnjQEg4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'lHOVUKfP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 48, "mem_limit": 41, "params": "tHh2667t"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '45r2lnWK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '35LpOV5Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 1, "mem_limit": 58, "name": "ZOwXCBCf", "params": "Ds2JjkVk"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'wfNKpggX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 21}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'btz1itZH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name '2mSgxCwb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tI3Om73z", "port": 68}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'igCTMRu7' \
    --sortBy 'createdAt' \
    --sortDirection 'desc' \
    --count '19' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'FWGSvg4P' \
    --version 'x4GXFWl7' \
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
    --imageURI 'aFVTlEb3' \
    --version 'iikgu2IB' \
    --versionPatch '7mqHUIXX' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'yvzSz5WI' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'vku7XO1u' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'Jm9YdLdV' \
    --versionPatch 'EKOQUg40' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'Hld3LbqY' \
    --count '23' \
    --offset '70' \
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
    --region 'rlgEtlh0' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'tgS03sKz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'ObFk1Rks' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'RPXXlUPy' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '56DTVMdx' \
    --withServer  \
    --count '31' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'ETDvBbPF' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '0D8gq8fX' \
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
    --version 'Bhiv8gfg' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "7kYmAUJG"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ua97GVXJ", "ip": "0Zo2TpUS", "name": "MFcrwqF2", "port": 45}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ZQPOcLe0", "pod_name": "NZexLN20"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "TPC0CjkZ"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'OB6wc5AS' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "8ei3mT3u", "configuration": "OyBMWoId", "deployment": "RI0FBmRB", "game_mode": "T82zVN0B", "matching_allies": [{"matching_parties": [{"party_attributes": {"c1ACRWgL": {}, "8Xcal4Uo": {}, "fT8Ff3ZZ": {}}, "party_id": "OzJjULUm", "party_members": [{"user_id": "OJm1ou8N"}, {"user_id": "HWozu1eB"}, {"user_id": "ZlF5cLAq"}]}, {"party_attributes": {"CTcea7OL": {}, "3CCC8YcX": {}, "lq8CzHVp": {}}, "party_id": "5R0GMdmW", "party_members": [{"user_id": "oiZb9ZHG"}, {"user_id": "W9eSynPj"}, {"user_id": "WjVnZdcb"}]}, {"party_attributes": {"AyZQPaLa": {}, "dd5sXT58": {}, "5HdD3s4b": {}}, "party_id": "NHMVYfti", "party_members": [{"user_id": "ACQ360TH"}, {"user_id": "4H2TRguv"}, {"user_id": "Sf2wLWLK"}]}]}, {"matching_parties": [{"party_attributes": {"RvUwEQCj": {}, "Mszyzdou": {}, "miBenGiH": {}}, "party_id": "Ag7pZ0hY", "party_members": [{"user_id": "sXp25PNM"}, {"user_id": "VjIF4Po3"}, {"user_id": "ELNiR947"}]}, {"party_attributes": {"oaG1ZKzv": {}, "cIclTw9g": {}, "3J9S6UHK": {}}, "party_id": "5BLsI5eU", "party_members": [{"user_id": "VPZHuBVJ"}, {"user_id": "JcBW1sVe"}, {"user_id": "wQJCcpRR"}]}, {"party_attributes": {"syj57KCe": {}, "CKPUKkAb": {}, "hnnUzEQO": {}}, "party_id": "PtyEyoUL", "party_members": [{"user_id": "ZU4gNvjy"}, {"user_id": "iJIm2csX"}, {"user_id": "kqdf5L0F"}]}]}, {"matching_parties": [{"party_attributes": {"KZG53oqT": {}, "7i7SVerm": {}, "wQ2GBhzd": {}}, "party_id": "7BZbkShg", "party_members": [{"user_id": "pt1Z5q0a"}, {"user_id": "gSKayNCP"}, {"user_id": "ft67OhVD"}]}, {"party_attributes": {"b2Epxs9E": {}, "AVVRxkM5": {}, "4UjNOpdB": {}}, "party_id": "HnLWuGkK", "party_members": [{"user_id": "K5rcldE5"}, {"user_id": "GAnddawL"}, {"user_id": "aQQiFmno"}]}, {"party_attributes": {"y7t5ST0w": {}, "H9PttxH3": {}, "N6Vc09t2": {}}, "party_id": "VaUXbevy", "party_members": [{"user_id": "9b9hcUH0"}, {"user_id": "HeoBzNlq"}, {"user_id": "cv5ysEoV"}]}]}], "namespace": "rKi9Wotg", "notification_payload": {}, "pod_name": "CkCpAG8M", "region": "JIwuWeAM", "session_id": "TYRDbp8v"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "vdgweHcM"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'RpobOVPy' \
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
    --region 'WI6SXNTS' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE