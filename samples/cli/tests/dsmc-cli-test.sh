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
    --body '{"artifactPath": "WN5JI9c0", "image": "XcWtDbNQ", "namespace": "eSazp5NT", "persistent": true, "version": "rDSW7Qic"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "65JbsBNX", "dockerPath": "305mNDr9", "image": "dyaevpqj", "imageSize": 2, "namespace": "7WMo9MXg", "persistent": false, "version": "Diqoo39U"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "bF55RKhx", "dockerPath": "WmSPNz6d", "image": "rObbXFX7", "imageSize": 48, "namespace": "Oa7cadA8", "patchVersion": "htlsM38y", "persistent": true, "version": "Eu6a2eiO"}' \
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
    --body '{"claim_timeout": 46, "creation_timeout": 24, "default_version": "V2k83dek", "port": 53, "ports": {"DuLLwKfJ": 29, "PfCo49e0": 88, "f4cweySF": 75}, "protocol": "wDwyLTaV", "providers": ["aqh1L38Z", "RkkrwhWd", "v4hchles"], "session_timeout": 46, "unreachable_timeout": 38}' \
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
    --body '{"claim_timeout": 5, "creation_timeout": 95, "default_version": "CzfGyEBd", "port": 96, "protocol": "FNYMhbk9", "providers": ["JjTDR7fG", "MvZBso15", "yTTyIYcv"], "session_timeout": 81, "unreachable_timeout": 52}' \
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
    --name '21oW51IJ' \
    --count '97' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'IJx2zt68' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'NIa71KOY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 89, "buffer_percent": 89, "configuration": "S2hq61Ix", "enable_region_overrides": false, "game_version": "N4ERL39j", "max_count": 75, "min_count": 20, "overrides": {"yYt7aj7h": {"buffer_count": 2, "buffer_percent": 89, "configuration": "WqRdi6Tl", "enable_region_overrides": true, "game_version": "LD11JzVB", "max_count": 53, "min_count": 54, "name": "sY5kgztl", "region_overrides": {"ZsrwDRA8": {"buffer_count": 39, "buffer_percent": 35, "max_count": 32, "min_count": 31, "name": "APIk3SYh", "unlimited": false, "use_buffer_percent": false}, "KieIhJpY": {"buffer_count": 60, "buffer_percent": 94, "max_count": 23, "min_count": 79, "name": "y8wwAC9F", "unlimited": true, "use_buffer_percent": true}, "OpYGBEgS": {"buffer_count": 0, "buffer_percent": 57, "max_count": 55, "min_count": 38, "name": "N0EjOHMW", "unlimited": false, "use_buffer_percent": true}}, "regions": ["dFcMzGY4", "Y1KM4v5u", "QnSjJRRS"], "session_timeout": 82, "unlimited": false, "use_buffer_percent": false}, "3NNzRvyZ": {"buffer_count": 66, "buffer_percent": 24, "configuration": "BJpKVDHy", "enable_region_overrides": true, "game_version": "Hv0Ci3bb", "max_count": 80, "min_count": 77, "name": "uCdZVwI6", "region_overrides": {"4opl6Iiv": {"buffer_count": 6, "buffer_percent": 74, "max_count": 52, "min_count": 33, "name": "ZNLcbtSE", "unlimited": false, "use_buffer_percent": true}, "A2Mqf6wD": {"buffer_count": 91, "buffer_percent": 7, "max_count": 59, "min_count": 32, "name": "Uy2VMkXX", "unlimited": false, "use_buffer_percent": true}, "pBePOgnA": {"buffer_count": 51, "buffer_percent": 7, "max_count": 80, "min_count": 14, "name": "btW92Txd", "unlimited": false, "use_buffer_percent": false}}, "regions": ["xZBc71cX", "5xEYGQYZ", "xPOFFy3v"], "session_timeout": 9, "unlimited": false, "use_buffer_percent": false}, "wfYs6MNA": {"buffer_count": 60, "buffer_percent": 45, "configuration": "wSgOMDeL", "enable_region_overrides": false, "game_version": "JykzM2V5", "max_count": 45, "min_count": 43, "name": "vO3MoWFX", "region_overrides": {"sf2mhf57": {"buffer_count": 79, "buffer_percent": 14, "max_count": 54, "min_count": 70, "name": "NSLGbWUA", "unlimited": false, "use_buffer_percent": false}, "iz7e04Zx": {"buffer_count": 46, "buffer_percent": 77, "max_count": 17, "min_count": 62, "name": "B3Uyg31n", "unlimited": false, "use_buffer_percent": false}, "Ccnq7j96": {"buffer_count": 49, "buffer_percent": 23, "max_count": 29, "min_count": 5, "name": "5tEDUYtC", "unlimited": true, "use_buffer_percent": true}}, "regions": ["vteCGyYH", "ZoCDIgyV", "68KKYumT"], "session_timeout": 19, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"5sLiLgmC": {"buffer_count": 33, "buffer_percent": 91, "max_count": 81, "min_count": 100, "name": "eitZEtzL", "unlimited": false, "use_buffer_percent": true}, "U0fgFu3g": {"buffer_count": 63, "buffer_percent": 29, "max_count": 67, "min_count": 84, "name": "1NYucjNb", "unlimited": false, "use_buffer_percent": false}, "zZZT23Vd": {"buffer_count": 26, "buffer_percent": 14, "max_count": 5, "min_count": 31, "name": "FsnU4Q2B", "unlimited": false, "use_buffer_percent": true}}, "regions": ["6nroI1Xf", "jMYKp9DR", "7Kbky4z3"], "session_timeout": 91, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'lKTASHGH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'ZSD7l5SM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 41, "buffer_percent": 61, "configuration": "0us6WAMI", "enable_region_overrides": true, "game_version": "Zwe4DC0O", "max_count": 2, "min_count": 49, "regions": ["VUVqh0jC", "yglhiPI5", "YNvR1gHU"], "session_timeout": 98, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'oHEB1FZx' \
    --namespace "$AB_NAMESPACE" \
    --region '7vZKY5Ce' \
    --body '{"buffer_count": 47, "buffer_percent": 4, "max_count": 89, "min_count": 51, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '7y9FXv5D' \
    --namespace "$AB_NAMESPACE" \
    --region '7YSOuFWz' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'OgsASvPv' \
    --namespace "$AB_NAMESPACE" \
    --region 'BGYkWrYr' \
    --body '{"buffer_count": 95, "buffer_percent": 33, "max_count": 27, "min_count": 21, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'LFGJ3sd6' \
    --namespace "$AB_NAMESPACE" \
    --version 'Zye8w5yr' \
    --body '{"buffer_count": 54, "buffer_percent": 56, "configuration": "7GskxEqv", "enable_region_overrides": true, "game_version": "hQIdCRPj", "max_count": 20, "min_count": 70, "region_overrides": {"BqabZp9b": {"buffer_count": 64, "buffer_percent": 29, "max_count": 21, "min_count": 70, "name": "Rr4HFYIY", "unlimited": true, "use_buffer_percent": false}, "2ITD3hmp": {"buffer_count": 8, "buffer_percent": 41, "max_count": 49, "min_count": 0, "name": "3s5ZRMRH", "unlimited": false, "use_buffer_percent": true}, "3u3nY7s8": {"buffer_count": 8, "buffer_percent": 60, "max_count": 29, "min_count": 24, "name": "tU95nW3S", "unlimited": true, "use_buffer_percent": true}}, "regions": ["gCuq2X7P", "raVIVcAx", "zIkgf0ku"], "session_timeout": 1, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '3Dx3rKVE' \
    --namespace "$AB_NAMESPACE" \
    --version 'iN6BfZrG' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'XzmaBZO1' \
    --namespace "$AB_NAMESPACE" \
    --version 'EeKKYy1X' \
    --body '{"buffer_count": 2, "buffer_percent": 61, "configuration": "SzZhJJ2n", "enable_region_overrides": true, "game_version": "0K8Sria3", "max_count": 29, "min_count": 1, "regions": ["JttbSyc6", "yVy65FDE", "fEE2JVAC"], "session_timeout": 20, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'ewdVIuGd' \
    --namespace "$AB_NAMESPACE" \
    --region '55oyCTHz' \
    --version '9kPLukYy' \
    --body '{"buffer_count": 45, "buffer_percent": 6, "max_count": 80, "min_count": 59, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'EHCmnNIe' \
    --namespace "$AB_NAMESPACE" \
    --region 'xMZk2NTV' \
    --version 'PvrDLYwp' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'YHFYCUXR' \
    --namespace "$AB_NAMESPACE" \
    --region 'KL92XM1h' \
    --version 'XM3mtO0x' \
    --body '{"buffer_count": 83, "buffer_percent": 23, "max_count": 13, "min_count": 17, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '43' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'yJ0HqpMn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'qTECwodH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 2, "mem_limit": 97, "params": "Fv33C5ei"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'WQjwHiPv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'IlGIrCp2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 14, "mem_limit": 100, "name": "k6OV349s", "params": "m5APNo2z"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'HgRhqupC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 38}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'iso1GcXZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'gkfVXY26' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "v03VYX4A", "port": 95}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'IlF2Rciy' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '35' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'ztuNGfCJ' \
    --version 'mb7yqotc' \
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
    --imageURI 'wpTUHyo8' \
    --version 'LMm8Ys6c' \
    --versionPatch 'bw3wkcSK' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'dQ48NmYA' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'cYbXun8J' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'WNm7FXI6' \
    --versionPatch 'vPFd7KkF' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'nqr5fTIG' \
    --count '53' \
    --offset '66' \
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
    --region 'X9kzR6n2' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'yMEdQgci' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'AwUL1A1e' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'sJcYN5eR' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'OuKnU2ws' \
    --withServer  \
    --count '51' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'EfQWLBy3' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'rGUBCq4E' \
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
    --version 'mJYHPGG4' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "jRz2zNEH"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "vhyDjItu", "ip": "C457YbNl", "name": "XLPKWyxU", "port": 9}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "aOTI4eoE", "pod_name": "tI76FH0J"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "8s0WCJMr"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'aIhwuOVJ' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "5woGZrzP", "configuration": "WR0XRIfh", "deployment": "XCFF619x", "game_mode": "k9LDnAgQ", "matching_allies": [{"matching_parties": [{"party_attributes": {"BxKAjRZW": {}, "N0Ow2qUL": {}, "YUeOB5Zh": {}}, "party_id": "E8RkinTM", "party_members": [{"user_id": "Bmxo6F8H"}, {"user_id": "CQPkb8y3"}, {"user_id": "WsL6scYC"}]}, {"party_attributes": {"7DlELNb9": {}, "5hfRJqIc": {}, "WmMEov6B": {}}, "party_id": "ZYy74Bry", "party_members": [{"user_id": "JJXSooRt"}, {"user_id": "5JH11l48"}, {"user_id": "aMWTktWE"}]}, {"party_attributes": {"1I7gPKXw": {}, "T5XYExVT": {}, "Wgs8VIqL": {}}, "party_id": "ER7qOR7Y", "party_members": [{"user_id": "KOnWES2J"}, {"user_id": "M05RNBR8"}, {"user_id": "fKPyFGCE"}]}]}, {"matching_parties": [{"party_attributes": {"gPbO2t9S": {}, "RcpBzkbO": {}, "s6xNbIaL": {}}, "party_id": "eWFMY6gk", "party_members": [{"user_id": "CtuAd9e3"}, {"user_id": "TWUM8G2C"}, {"user_id": "bCNrwUD6"}]}, {"party_attributes": {"y4B7LIL0": {}, "DwKzAzaG": {}, "OAq2PDiq": {}}, "party_id": "tWSFt8z0", "party_members": [{"user_id": "FCL3MLOo"}, {"user_id": "F2IrrfJz"}, {"user_id": "tH7QttHq"}]}, {"party_attributes": {"xxZQhyGr": {}, "MKzX1rwy": {}, "w17k8clZ": {}}, "party_id": "2MPZhBNv", "party_members": [{"user_id": "VAUFr2jn"}, {"user_id": "ZUjmbrnR"}, {"user_id": "Mg5ZkCix"}]}]}, {"matching_parties": [{"party_attributes": {"yK9evCPv": {}, "CQZLxr3O": {}, "GlfG6v2n": {}}, "party_id": "HU4r8soI", "party_members": [{"user_id": "jD9PfB9D"}, {"user_id": "xsouv53H"}, {"user_id": "mS81dF3y"}]}, {"party_attributes": {"JTn8fu7A": {}, "U3gRqa0R": {}, "6M9E2Ybt": {}}, "party_id": "4b8aYfs0", "party_members": [{"user_id": "8CQfg40O"}, {"user_id": "mOqnhffQ"}, {"user_id": "qZKn7luQ"}]}, {"party_attributes": {"A72xIjcY": {}, "qSrAXtk9": {}, "WR60UAUO": {}}, "party_id": "dlqtupUo", "party_members": [{"user_id": "Cqbn7Tyh"}, {"user_id": "8xiEaBRS"}, {"user_id": "zYBLT471"}]}]}], "namespace": "4U7haODw", "notification_payload": {}, "pod_name": "WKaZWVMC", "region": "t0YKdFcV", "session_id": "LpoGwgNy"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "AYxbO30c"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'CfhYUEUG' \
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
    --region 'ITQEihRU' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE