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
    --body '{"artifactPath": "ESSfB7Wu", "image": "tl4d7931", "namespace": "vjDEYJt6", "persistent": false, "version": "ZdGNk5iu"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "LjeFC49k", "dockerPath": "Y37u6OPm", "image": "pI1fUX4s", "imageSize": 71, "namespace": "oY7JRnYF", "persistent": false, "version": "YyKANGna"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "Fp6jdsZA", "dockerPath": "NBXlVVGU", "image": "X6tCUS8U", "imageSize": 46, "namespace": "6s2Wk66A", "patchVersion": "pqRu2mWK", "persistent": false, "version": "rvNmOLcP"}' \
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
    --body '{"claim_timeout": 98, "creation_timeout": 44, "default_version": "TwHf7aOL", "port": 52, "ports": {"5mZD94NL": 30, "LnfymsQ7": 16, "wWxmZWyx": 75}, "protocol": "plC1BqOa", "providers": ["veCjbBSh", "A9X5eVPt", "vuwckwC4"], "session_timeout": 64, "unreachable_timeout": 30}' \
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
    --body '{"claim_timeout": 84, "creation_timeout": 61, "default_version": "NUSv3JDN", "port": 70, "protocol": "1IdKFlkB", "providers": ["dohRhK3W", "4wjZA74c", "YMjgf4cc"], "session_timeout": 36, "unreachable_timeout": 20}' \
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
    --name 'BzxUc2L6' \
    --count '20' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'uZRpPJQP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'n6TUXDVK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 44, "buffer_percent": 37, "configuration": "GvhMeNvJ", "enable_region_overrides": false, "game_version": "2HaTdNdS", "max_count": 43, "min_count": 91, "overrides": {"Gn6Nf5PU": {"buffer_count": 36, "buffer_percent": 46, "configuration": "BgXiDlrC", "enable_region_overrides": true, "game_version": "kOd4nJkT", "max_count": 72, "min_count": 83, "name": "gaPKNmVl", "region_overrides": {"uihKh2FH": {"buffer_count": 37, "buffer_percent": 84, "max_count": 25, "min_count": 71, "name": "zkLegnxG", "unlimited": false, "use_buffer_percent": true}, "7wvhPadr": {"buffer_count": 22, "buffer_percent": 36, "max_count": 31, "min_count": 100, "name": "e0ynT6ci", "unlimited": true, "use_buffer_percent": false}, "YQJBRykW": {"buffer_count": 20, "buffer_percent": 12, "max_count": 86, "min_count": 36, "name": "dpF0TrhB", "unlimited": false, "use_buffer_percent": true}}, "regions": ["hjK4rjMi", "DmyNkbmz", "hoBkXnKz"], "session_timeout": 66, "unlimited": false, "use_buffer_percent": false}, "XYXYzUUm": {"buffer_count": 30, "buffer_percent": 69, "configuration": "ELEIrvIb", "enable_region_overrides": true, "game_version": "w0NodiXF", "max_count": 93, "min_count": 5, "name": "aFdNhUJH", "region_overrides": {"bZhXphpJ": {"buffer_count": 43, "buffer_percent": 66, "max_count": 95, "min_count": 82, "name": "0wrMNSdO", "unlimited": false, "use_buffer_percent": false}, "o5ns3UkV": {"buffer_count": 18, "buffer_percent": 39, "max_count": 84, "min_count": 72, "name": "EarbCEkw", "unlimited": true, "use_buffer_percent": true}, "yGGbsKH0": {"buffer_count": 51, "buffer_percent": 24, "max_count": 12, "min_count": 81, "name": "K5jNZEMr", "unlimited": false, "use_buffer_percent": true}}, "regions": ["TsI9H65j", "bv9tG5Ou", "lH2iaUtY"], "session_timeout": 55, "unlimited": true, "use_buffer_percent": false}, "WzVZJXtL": {"buffer_count": 95, "buffer_percent": 95, "configuration": "4tplZfMS", "enable_region_overrides": true, "game_version": "IJDkmIzH", "max_count": 26, "min_count": 40, "name": "JnhIW36y", "region_overrides": {"woSa4ioI": {"buffer_count": 61, "buffer_percent": 47, "max_count": 30, "min_count": 93, "name": "xzq1iEJH", "unlimited": true, "use_buffer_percent": true}, "cNaV99C8": {"buffer_count": 25, "buffer_percent": 14, "max_count": 71, "min_count": 4, "name": "5wc1TS0w", "unlimited": false, "use_buffer_percent": false}, "JzZtn5Py": {"buffer_count": 53, "buffer_percent": 24, "max_count": 1, "min_count": 50, "name": "QNJ9bAPw", "unlimited": true, "use_buffer_percent": false}}, "regions": ["h6J0Haxg", "PL9IymNF", "io5X0cPT"], "session_timeout": 96, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"NnW8bjoT": {"buffer_count": 14, "buffer_percent": 8, "max_count": 94, "min_count": 8, "name": "ShFO0VUl", "unlimited": true, "use_buffer_percent": false}, "u1fGYHcX": {"buffer_count": 52, "buffer_percent": 95, "max_count": 70, "min_count": 22, "name": "OLKWVClw", "unlimited": false, "use_buffer_percent": true}, "cGIe51cr": {"buffer_count": 92, "buffer_percent": 4, "max_count": 60, "min_count": 3, "name": "0NZonFzI", "unlimited": false, "use_buffer_percent": false}}, "regions": ["UwikGcju", "qudP1vXm", "vfs2K6qr"], "session_timeout": 56, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'HAUEqL0V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'pPfFkV8u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 97, "buffer_percent": 27, "configuration": "ZwUOTzol", "enable_region_overrides": false, "game_version": "75urrUwf", "max_count": 6, "min_count": 95, "regions": ["MCNkirPS", "PlkvkCGw", "M0nz47Kj"], "session_timeout": 82, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '22KH3pW3' \
    --namespace "$AB_NAMESPACE" \
    --region 'mLmEbZYt' \
    --body '{"buffer_count": 75, "buffer_percent": 5, "max_count": 69, "min_count": 63, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'EwUPgbrx' \
    --namespace "$AB_NAMESPACE" \
    --region 'UwnO17pQ' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'H7y25B1J' \
    --namespace "$AB_NAMESPACE" \
    --region 'M3JMdAWK' \
    --body '{"buffer_count": 32, "buffer_percent": 41, "max_count": 33, "min_count": 27, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'D5LfHj8B' \
    --namespace "$AB_NAMESPACE" \
    --version 'RX0mkl3a' \
    --body '{"buffer_count": 56, "buffer_percent": 46, "configuration": "2sG98KuB", "enable_region_overrides": false, "game_version": "UGLoONru", "max_count": 86, "min_count": 83, "region_overrides": {"E9PCyfDl": {"buffer_count": 29, "buffer_percent": 94, "max_count": 43, "min_count": 13, "name": "y9AEp9C7", "unlimited": true, "use_buffer_percent": false}, "EtXPp5IE": {"buffer_count": 88, "buffer_percent": 14, "max_count": 34, "min_count": 78, "name": "xPKiCQWy", "unlimited": true, "use_buffer_percent": true}, "HJhBBc2L": {"buffer_count": 32, "buffer_percent": 82, "max_count": 64, "min_count": 65, "name": "r0Dz4SuA", "unlimited": true, "use_buffer_percent": true}}, "regions": ["ZvY5ZMJx", "yfGQZZX7", "M8YGs9i7"], "session_timeout": 78, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'mixVfK9q' \
    --namespace "$AB_NAMESPACE" \
    --version '3G5Di453' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'iBtvXnl8' \
    --namespace "$AB_NAMESPACE" \
    --version 'UJPQj5S5' \
    --body '{"buffer_count": 60, "buffer_percent": 56, "configuration": "Wke89mk7", "enable_region_overrides": false, "game_version": "qVTDyN1T", "max_count": 96, "min_count": 83, "regions": ["LedNevLD", "xtYNQo0t", "5P6TFsb1"], "session_timeout": 22, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 't2s2j6cz' \
    --namespace "$AB_NAMESPACE" \
    --region '51Dznkst' \
    --version 't8zZOtfJ' \
    --body '{"buffer_count": 18, "buffer_percent": 80, "max_count": 71, "min_count": 15, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'u10zjdUu' \
    --namespace "$AB_NAMESPACE" \
    --region 'IVIglpi9' \
    --version 'gSW6dIbz' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '9ejwvIOE' \
    --namespace "$AB_NAMESPACE" \
    --region 'P4j13RWm' \
    --version 'VmCcNAtE' \
    --body '{"buffer_count": 54, "buffer_percent": 56, "max_count": 0, "min_count": 77, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '61' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'erW0WTOI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'G0NpLWUv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 54, "mem_limit": 8, "params": "RiJozaXU"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'pCMvf5zy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'tNjXLqY1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 29, "mem_limit": 41, "name": "6BstGb9O", "params": "eB79I5L0"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'EMpc7fL6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 29}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'T7xfPODj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'zZsmlvdl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "cbEJk9QN", "port": 92}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'oEzXPQjx' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '59' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'ih1l8snM' \
    --version 'D96ZtapE' \
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
    --imageURI 'Eoyjm5m8' \
    --version '1rhqmKGZ' \
    --versionPatch '9uLQ16sF' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'HaHVaTAM' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'MI4kprcT' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'rw4GEpIp' \
    --versionPatch 'RCEi5lsq' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'ffcXQqci' \
    --count '56' \
    --offset '21' \
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
    --region 'HcIC2IYR' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'L8oesmcw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'SFBdVaJ2' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'fnH4XNom' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'OhONZLf0' \
    --withServer  \
    --count '90' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 51 'ListSession' test.out

#- 52 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '5MOoXOHH' \
    > test.out 2>&1
eval_tap $? 52 'CountSession' test.out

#- 53 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'x0Hogdqg' \
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
    --version '7dzcsuHj' \
    > test.out 2>&1
eval_tap $? 57 'ImageDetailClient' test.out

#- 58 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "NAeIvcI5"}' \
    > test.out 2>&1
eval_tap $? 58 'DeregisterLocalServer' test.out

#- 59 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "j5A0s6yN", "ip": "NCm8QWfl", "name": "GnuDdg8q", "port": 4}' \
    > test.out 2>&1
eval_tap $? 59 'RegisterLocalServer' test.out

#- 60 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "lkCQ35Oe", "pod_name": "mWxli8yC"}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterServer' test.out

#- 61 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "peOB7Wgl"}' \
    > test.out 2>&1
eval_tap $? 61 'ShutdownServer' test.out

#- 62 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'L9iHx4ii' \
    > test.out 2>&1
eval_tap $? 62 'GetServerSession' test.out

#- 63 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "SZoixLOS", "configuration": "sOTFNRwd", "deployment": "wWJT6KZH", "game_mode": "pDes34iK", "matching_allies": [{"matching_parties": [{"party_attributes": {"86xY1CYP": {}, "4RPKIYRY": {}, "98BRtCUp": {}}, "party_id": "hPZUcUuf", "party_members": [{"user_id": "SdVYZGzr"}, {"user_id": "NEHoNFro"}, {"user_id": "lbooUkuF"}]}, {"party_attributes": {"DjxosphU": {}, "vBx6dFN0": {}, "qzu3QKSY": {}}, "party_id": "TZY7PSSc", "party_members": [{"user_id": "8o7eK5pf"}, {"user_id": "v0WVb14n"}, {"user_id": "N5gE1hp3"}]}, {"party_attributes": {"hSREWaTD": {}, "KrGBkYjV": {}, "pXsLrL2q": {}}, "party_id": "a5GSY66r", "party_members": [{"user_id": "MeTSRGE7"}, {"user_id": "pF1K6toZ"}, {"user_id": "TFMYGtUA"}]}]}, {"matching_parties": [{"party_attributes": {"sVsweBQD": {}, "3VocHtVm": {}, "K6Cpu9WN": {}}, "party_id": "ARghGnEx", "party_members": [{"user_id": "j3ojMu6n"}, {"user_id": "DFtvOnug"}, {"user_id": "8xw8ZgtS"}]}, {"party_attributes": {"MhSZe9pq": {}, "RXxStozf": {}, "CyqP8kHy": {}}, "party_id": "YFyuiItx", "party_members": [{"user_id": "EATISqmw"}, {"user_id": "EcT7Dd3R"}, {"user_id": "kbiAHpZM"}]}, {"party_attributes": {"QsXOWfho": {}, "f2ISbwcm": {}, "MxIDMGEb": {}}, "party_id": "Tw6WgsYm", "party_members": [{"user_id": "gHbc1GHZ"}, {"user_id": "WMPYbNRG"}, {"user_id": "NN5p3dAf"}]}]}, {"matching_parties": [{"party_attributes": {"T357XUNM": {}, "f8ohSmry": {}, "x5BB2spF": {}}, "party_id": "ZFBfTrVw", "party_members": [{"user_id": "vZv4bfub"}, {"user_id": "S6ztfDVS"}, {"user_id": "x2pIJjvZ"}]}, {"party_attributes": {"QRC25tPd": {}, "Kk4jTMy7": {}, "YBypY3i0": {}}, "party_id": "qQYuKEiO", "party_members": [{"user_id": "9Pu9Iqlc"}, {"user_id": "UPUmuiUg"}, {"user_id": "UiuhUC6v"}]}, {"party_attributes": {"1wzeOuSj": {}, "vpcw8SBi": {}, "5BvcSawU": {}}, "party_id": "wIYCm35W", "party_members": [{"user_id": "QxlasEAI"}, {"user_id": "V1Qmysnh"}, {"user_id": "PgDI5k2p"}]}]}], "namespace": "kOiPhS4b", "notification_payload": {}, "pod_name": "QuCkJe0B", "region": "z7xi1EPg", "session_id": "zn0k1p6E"}' \
    > test.out 2>&1
eval_tap $? 63 'CreateSession' test.out

#- 64 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "otBbdTDz"}' \
    > test.out 2>&1
eval_tap $? 64 'ClaimServer' test.out

#- 65 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Sf8m1REw' \
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
    --region 'ezUkqVnJ' \
    > test.out 2>&1
eval_tap $? 68 'ListProvidersByRegion' test.out

#- 69 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 69 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE