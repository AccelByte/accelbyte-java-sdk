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
    --body '{"artifactPath": "7D4kq2GR", "image": "g3uRx6T4", "namespace": "25c9aDVC", "persistent": false, "version": "qutJMcJ2"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "6FLhWdp3", "dockerPath": "oWwuw8Ba", "image": "B8oEc68E", "imageSize": 69, "namespace": "68xZPeAD", "persistent": false, "version": "8LtGeou0"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "lqvgwGKg", "dockerPath": "Z3tAfvk1", "image": "Oq77X3GG", "imageSize": 43, "namespace": "KWml6gEx", "patchVersion": "EEGS6ZbC", "persistent": true, "version": "iVSOx2Vn"}' \
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
    --body '{"claim_timeout": 86, "creation_timeout": 99, "default_version": "r3JtqFNp", "port": 43, "ports": {"wVkwlEjp": 86, "GXwwFzM7": 27, "dxjVzqqQ": 57}, "protocol": "TRT2BpSV", "providers": ["QwRVnA40", "t3hDlXLX", "m7aYKfCr"], "session_timeout": 76, "unreachable_timeout": 36}' \
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
    --body '{"claim_timeout": 13, "creation_timeout": 35, "default_version": "FOD3nVTZ", "port": 49, "protocol": "ysW3ioXw", "providers": ["JmRXCiSg", "tCYzlEec", "kJOwwsLY"], "session_timeout": 43, "unreachable_timeout": 67}' \
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
    --name 'eK8cRcoi' \
    --count '23' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 13 'GetAllDeployment' test.out

#- 14 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '4EYjYy3y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetDeployment' test.out

#- 15 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'IEPcah8z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 61, "buffer_percent": 54, "configuration": "wbatf7GD", "enable_region_overrides": false, "game_version": "vYcY6eF7", "max_count": 86, "min_count": 55, "overrides": {"fj71IyKF": {"buffer_count": 50, "buffer_percent": 11, "configuration": "YaJhKGTP", "enable_region_overrides": false, "game_version": "8gZni4xN", "max_count": 86, "min_count": 60, "name": "ds8zLr7y", "region_overrides": {"wigLWn1C": {"buffer_count": 61, "buffer_percent": 30, "max_count": 21, "min_count": 82, "name": "MmAK5ODj", "unlimited": true, "use_buffer_percent": true}, "5XauyXBE": {"buffer_count": 52, "buffer_percent": 73, "max_count": 80, "min_count": 96, "name": "w8dwjdTf", "unlimited": true, "use_buffer_percent": true}, "kPSl4Z6v": {"buffer_count": 95, "buffer_percent": 1, "max_count": 91, "min_count": 75, "name": "6RRmfdPU", "unlimited": false, "use_buffer_percent": true}}, "regions": ["EB8POhvH", "9cYLGHSR", "kDzl1TFO"], "session_timeout": 55, "unlimited": true, "use_buffer_percent": false}, "FHPlLFyy": {"buffer_count": 40, "buffer_percent": 31, "configuration": "oI0dqhid", "enable_region_overrides": true, "game_version": "ik22sNTH", "max_count": 9, "min_count": 26, "name": "hPEpLtvK", "region_overrides": {"DYkDhfzU": {"buffer_count": 83, "buffer_percent": 28, "max_count": 27, "min_count": 75, "name": "XtWmbRJG", "unlimited": true, "use_buffer_percent": false}, "RioVQbYA": {"buffer_count": 19, "buffer_percent": 23, "max_count": 53, "min_count": 25, "name": "Bidvm2k1", "unlimited": false, "use_buffer_percent": true}, "OVFPJVvk": {"buffer_count": 62, "buffer_percent": 88, "max_count": 23, "min_count": 61, "name": "uaLbfMtC", "unlimited": true, "use_buffer_percent": false}}, "regions": ["Fx0VAmrl", "seFHzlCv", "6jOf0RN0"], "session_timeout": 86, "unlimited": false, "use_buffer_percent": true}, "xNEf97YF": {"buffer_count": 76, "buffer_percent": 31, "configuration": "oIOxrQT1", "enable_region_overrides": false, "game_version": "tTLjZOdx", "max_count": 18, "min_count": 24, "name": "CCuFl3t0", "region_overrides": {"J074WmFG": {"buffer_count": 88, "buffer_percent": 63, "max_count": 39, "min_count": 0, "name": "4BBPwNqo", "unlimited": true, "use_buffer_percent": true}, "bXU8D5qp": {"buffer_count": 3, "buffer_percent": 7, "max_count": 55, "min_count": 76, "name": "5HlCqA2v", "unlimited": false, "use_buffer_percent": true}, "TfJgY0tt": {"buffer_count": 76, "buffer_percent": 6, "max_count": 90, "min_count": 88, "name": "IHJ3CPk9", "unlimited": true, "use_buffer_percent": false}}, "regions": ["Yl67Jvij", "hhY3MHnz", "xOeb7nSH"], "session_timeout": 79, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"QPp29llL": {"buffer_count": 10, "buffer_percent": 57, "max_count": 50, "min_count": 26, "name": "ZaxYbcBE", "unlimited": true, "use_buffer_percent": true}, "wObaWgNI": {"buffer_count": 80, "buffer_percent": 95, "max_count": 89, "min_count": 87, "name": "S0lDhvjL", "unlimited": false, "use_buffer_percent": true}, "f0nZOvAA": {"buffer_count": 81, "buffer_percent": 92, "max_count": 27, "min_count": 75, "name": "SkAJM9TI", "unlimited": false, "use_buffer_percent": true}}, "regions": ["fFiwfKuW", "ZuHYnxWg", "dl7kuFH9"], "session_timeout": 32, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 15 'CreateDeployment' test.out

#- 16 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'xyifagQb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteDeployment' test.out

#- 17 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment '5Zzh9VFv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 9, "buffer_percent": 54, "configuration": "IvBFG69D", "enable_region_overrides": true, "game_version": "AcCFV7cQ", "max_count": 28, "min_count": 35, "regions": ["ugMMggep", "3EyIn7wt", "q0GTPBeE"], "session_timeout": 49, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateDeployment' test.out

#- 18 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'BBvYKyOu' \
    --namespace "$AB_NAMESPACE" \
    --region 'fmNM9Tqm' \
    --body '{"buffer_count": 46, "buffer_percent": 59, "max_count": 67, "min_count": 82, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateRootRegionOverride' test.out

#- 19 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'QoxXkzIH' \
    --namespace "$AB_NAMESPACE" \
    --region 'Wz8eHIwM' \
    > test.out 2>&1
eval_tap $? 19 'DeleteRootRegionOverride' test.out

#- 20 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '7zTswEeO' \
    --namespace "$AB_NAMESPACE" \
    --region 'pDdieJy7' \
    --body '{"buffer_count": 61, "buffer_percent": 88, "max_count": 2, "min_count": 80, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateRootRegionOverride' test.out

#- 21 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'hbgFchjx' \
    --namespace "$AB_NAMESPACE" \
    --version 'WRKWgr93' \
    --body '{"buffer_count": 78, "buffer_percent": 97, "configuration": "yyV1RhUT", "enable_region_overrides": false, "game_version": "4VR09XEb", "max_count": 59, "min_count": 60, "region_overrides": {"kuVDSzoR": {"buffer_count": 87, "buffer_percent": 82, "max_count": 96, "min_count": 43, "name": "FJWCXDTW", "unlimited": true, "use_buffer_percent": true}, "Y9f5NE2o": {"buffer_count": 99, "buffer_percent": 9, "max_count": 64, "min_count": 5, "name": "McHRX0n3", "unlimited": false, "use_buffer_percent": true}, "sPT5dhQI": {"buffer_count": 42, "buffer_percent": 84, "max_count": 59, "min_count": 43, "name": "4Nt2l4z7", "unlimited": false, "use_buffer_percent": false}}, "regions": ["AYwdocEA", "CZXfno5L", "9wxq5HDX"], "session_timeout": 33, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateDeploymentOverride' test.out

#- 22 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'RzakVFGL' \
    --namespace "$AB_NAMESPACE" \
    --version 'OI4CDzG1' \
    > test.out 2>&1
eval_tap $? 22 'DeleteDeploymentOverride' test.out

#- 23 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment '40hzgVgr' \
    --namespace "$AB_NAMESPACE" \
    --version '9GSVGOUY' \
    --body '{"buffer_count": 55, "buffer_percent": 12, "configuration": "WLBWaDir", "enable_region_overrides": false, "game_version": "uDTNNcPM", "max_count": 29, "min_count": 46, "regions": ["d7b0VFBz", "5DFT2El9", "i0Dug8ZX"], "session_timeout": 95, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateDeploymentOverride' test.out

#- 24 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'vTUEMIzn' \
    --namespace "$AB_NAMESPACE" \
    --region 'bvaBCTpA' \
    --version 'Ex6tJpth' \
    --body '{"buffer_count": 4, "buffer_percent": 38, "max_count": 85, "min_count": 8, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateOverrideRegionOverride' test.out

#- 25 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'zVYs23Ub' \
    --namespace "$AB_NAMESPACE" \
    --region 'BFgFlBTK' \
    --version 'IGtMtpye' \
    > test.out 2>&1
eval_tap $? 25 'DeleteOverrideRegionOverride' test.out

#- 26 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'Lt5YCqqc' \
    --namespace "$AB_NAMESPACE" \
    --region 'UDG7BZhq' \
    --version 'DKfSOeH9' \
    --body '{"buffer_count": 34, "buffer_percent": 9, "max_count": 39, "min_count": 6, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateOverrideRegionOverride' test.out

#- 27 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '7' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 27 'GetAllPodConfig' test.out

#- 28 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'UtAPF46D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetPodConfig' test.out

#- 29 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'QJ0j82fB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 22, "mem_limit": 49, "params": "PxWZYnna"}' \
    > test.out 2>&1
eval_tap $? 29 'CreatePodConfig' test.out

#- 30 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'XwJyG2d8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeletePodConfig' test.out

#- 31 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'lYeuTf5s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 18, "mem_limit": 46, "name": "GV8quRVN", "params": "z4Cqjjqv"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePodConfig' test.out

#- 32 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'yFrsTvkL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 77}' \
    > test.out 2>&1
eval_tap $? 32 'AddPort' test.out

#- 33 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '0TcUg2by' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeletePort' test.out

#- 34 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'V8GzCNNZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "eNtCoePC", "port": 40}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePort' test.out

#- 35 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'Y2keeWSY' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '53' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 35 'ListImages' test.out

#- 36 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'BTTimMBW' \
    --version 'UMtNBV2J' \
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
    --imageURI 'kEOyINCk' \
    --version '9MHsBMSg' \
    --versionPatch '0HuP7tQW' \
    > test.out 2>&1
eval_tap $? 39 'DeleteImagePatch' test.out

#- 40 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'OfVmYllf' \
    > test.out 2>&1
eval_tap $? 40 'GetImageDetail' test.out

#- 41 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'MAr1oQGd' \
    > test.out 2>&1
eval_tap $? 41 'GetImagePatches' test.out

#- 42 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'NsVC24ed' \
    --versionPatch 'UpWI9msQ' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatchDetail' test.out

#- 43 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'pTBFJAMi' \
    --count '11' \
    --offset '47' \
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
    --region 'hp9rPQJo' \
    > test.out 2>&1
eval_tap $? 45 'CountServerDetailed' test.out

#- 46 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ListLocalServer' test.out

#- 47 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'LchSDdUu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteLocalServer' test.out

#- 48 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'LHeGrw0a' \
    > test.out 2>&1
eval_tap $? 48 'GetServer' test.out

#- 49 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'sgacbkqS' \
    > test.out 2>&1
eval_tap $? 49 'DeleteServer' test.out

#- 50 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'oi2U9xGt' \
    > test.out 2>&1
eval_tap $? 50 'GetServerLogs' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'payMUbyY' \
    --withServer  \
    --count '35' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'sBftoDSq' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'rbsypiSY' \
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
    --version 'M6vme5sQ' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "RSXnHl3l"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "LEBnQTzt", "ip": "FTwiUoGe", "name": "4KIOhaA2", "port": 48}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "Rmv8tqah", "pod_name": "GYiJaof8"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "3AnugVln"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '2OJtQkCk' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "VQejjtks", "configuration": "IA2pKBS8", "deployment": "yGp4VTcA", "game_mode": "XYjvL7Pz", "matching_allies": [{"matching_parties": [{"party_attributes": {"Dlgt5DCn": {}, "EpTZHokm": {}, "o81T2xmC": {}}, "party_id": "8MhmVjjF", "party_members": [{"user_id": "J4JtEIiE"}, {"user_id": "JTPg43aF"}, {"user_id": "lZ0IowCP"}]}, {"party_attributes": {"4lG2pz2k": {}, "jZtZqOeb": {}, "A9T3131G": {}}, "party_id": "YUths3FP", "party_members": [{"user_id": "bmBlCIaP"}, {"user_id": "DKepkwSL"}, {"user_id": "8AX3C6K9"}]}, {"party_attributes": {"PuVW7ZPU": {}, "KW6nCpf1": {}, "9ZvJphwC": {}}, "party_id": "ZZNkVHSA", "party_members": [{"user_id": "Q2CNriZ4"}, {"user_id": "z67NROFw"}, {"user_id": "VN2dgNNw"}]}]}, {"matching_parties": [{"party_attributes": {"bxEAgoDJ": {}, "qzZ3ZUzT": {}, "Dt8F2FEB": {}}, "party_id": "8qJcVxMw", "party_members": [{"user_id": "40D8EQ3f"}, {"user_id": "daBgYV17"}, {"user_id": "EZysmAzX"}]}, {"party_attributes": {"e8t5pJ5y": {}, "vUFW4jod": {}, "SthQfyYm": {}}, "party_id": "IasSotg8", "party_members": [{"user_id": "Rj9aoznk"}, {"user_id": "L7rlkRnl"}, {"user_id": "Y77DH3pJ"}]}, {"party_attributes": {"Y8V7wl2b": {}, "T2RTVhpC": {}, "t2Sy11mc": {}}, "party_id": "nnXA7Dhn", "party_members": [{"user_id": "h7lAjGUf"}, {"user_id": "7S3Ktp2p"}, {"user_id": "q6FsNS4i"}]}]}, {"matching_parties": [{"party_attributes": {"P3ugaAWs": {}, "6GE0H3NB": {}, "LMNtryWX": {}}, "party_id": "I1N3Mr8u", "party_members": [{"user_id": "QrU1qo7S"}, {"user_id": "jeV5NhQ6"}, {"user_id": "mABr4idr"}]}, {"party_attributes": {"E0Ds99be": {}, "JdXciE5A": {}, "L2KP0TN3": {}}, "party_id": "rKe4249j", "party_members": [{"user_id": "kNCdU4rO"}, {"user_id": "UncTLLQV"}, {"user_id": "TFjt23zt"}]}, {"party_attributes": {"sRLPETjt": {}, "jfuKYz5I": {}, "fAbbZQu5": {}}, "party_id": "KKyABPDb", "party_members": [{"user_id": "wJMh6wnG"}, {"user_id": "9ojHblh3"}, {"user_id": "aQwPSI2J"}]}]}], "namespace": "ctq6XIU4", "notification_payload": {}, "pod_name": "LVJ8lRyd", "region": "YrkKSNJx", "session_id": "dVc3VCBK"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "fqW57SaO"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '5gAXJFzt' \
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
    --region 'BtA4O77t' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE