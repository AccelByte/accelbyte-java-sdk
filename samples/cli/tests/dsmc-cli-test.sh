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
echo "1..70"

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
    --body '{"artifactPath": "rGfsqQO8", "image": "g3pB8a2u", "namespace": "0NOwHd72", "persistent": true, "version": "7T0F5U6R"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "4hlrZxgs", "dockerPath": "uZaLNckI", "image": "3KCENUw1", "imageSize": 7, "namespace": "bumWyRvC", "persistent": true, "version": "MfB6riR2"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "Km20koqC", "dockerPath": "xNNWeID5", "image": "csjLjJoz", "imageSize": 93, "namespace": "azIeTbDC", "patchVersion": "jwsXFHiz", "persistent": true, "version": "6MwWIADO"}' \
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
    --body '{"claim_timeout": 49, "creation_timeout": 57, "default_version": "ZMU9gLdQ", "port": 11, "ports": {"nNlyV4Ot": 64, "rmFfMmOe": 63, "QvW3ufK5": 33}, "protocol": "DD7V1vl4", "providers": ["yEnApQx2", "nvUIkmR8", "PpIeaxZR"], "session_timeout": 43, "unreachable_timeout": 84}' \
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
    --body '{"claim_timeout": 92, "creation_timeout": 99, "default_version": "vvUWOiPv", "port": 22, "protocol": "wZCjz5Ep", "providers": ["YwvN0hPL", "WssfOrXY", "KbVcV7yj"], "session_timeout": 4, "unreachable_timeout": 64}' \
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
    --name '1BiSi1HE' \
    --count '66' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '90Nttlxf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment '5MG90Hbr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 98, "buffer_percent": 49, "configuration": "xSgBkURI", "enable_region_overrides": true, "game_version": "Q74c8GrD", "max_count": 58, "min_count": 52, "overrides": {"K5bFTLSU": {"buffer_count": 42, "buffer_percent": 64, "configuration": "tyYkYSwI", "enable_region_overrides": false, "game_version": "7aigSsvt", "max_count": 70, "min_count": 68, "name": "RpixeIog", "region_overrides": {"pMpy54Yv": {"buffer_count": 56, "buffer_percent": 94, "max_count": 2, "min_count": 29, "name": "g6doxtpG", "unlimited": false, "use_buffer_percent": true}, "CzJ0Ml04": {"buffer_count": 29, "buffer_percent": 69, "max_count": 77, "min_count": 8, "name": "emXrFRyn", "unlimited": false, "use_buffer_percent": true}, "SFEOrnNl": {"buffer_count": 53, "buffer_percent": 48, "max_count": 36, "min_count": 33, "name": "At2V6ige", "unlimited": true, "use_buffer_percent": false}}, "regions": ["JXZJ28jA", "JPFj9BNU", "2OsysRmW"], "session_timeout": 34, "unlimited": false, "use_buffer_percent": true}, "nnjPnoWr": {"buffer_count": 21, "buffer_percent": 28, "configuration": "d3KXkRB9", "enable_region_overrides": false, "game_version": "8mXql0Uf", "max_count": 32, "min_count": 88, "name": "7Hwy14Ug", "region_overrides": {"2pPN1qng": {"buffer_count": 2, "buffer_percent": 54, "max_count": 72, "min_count": 14, "name": "tVNB8m7k", "unlimited": false, "use_buffer_percent": true}, "sy6td8uy": {"buffer_count": 67, "buffer_percent": 81, "max_count": 62, "min_count": 73, "name": "dZZ9NEW2", "unlimited": false, "use_buffer_percent": true}, "1gXNFEWN": {"buffer_count": 90, "buffer_percent": 67, "max_count": 95, "min_count": 37, "name": "Zthasf6U", "unlimited": true, "use_buffer_percent": false}}, "regions": ["FnMwT5fa", "x9YNsNmC", "JMdSfLo0"], "session_timeout": 23, "unlimited": true, "use_buffer_percent": false}, "CGE0GyZ2": {"buffer_count": 16, "buffer_percent": 91, "configuration": "JqpXYYZU", "enable_region_overrides": true, "game_version": "ffgiOfDX", "max_count": 5, "min_count": 20, "name": "7Nqv44JV", "region_overrides": {"VLXkPBmv": {"buffer_count": 99, "buffer_percent": 49, "max_count": 80, "min_count": 21, "name": "OlbSIojD", "unlimited": false, "use_buffer_percent": false}, "sikAXfyA": {"buffer_count": 100, "buffer_percent": 39, "max_count": 15, "min_count": 55, "name": "r474aQGe", "unlimited": true, "use_buffer_percent": false}, "Jcrtb4Vf": {"buffer_count": 64, "buffer_percent": 67, "max_count": 26, "min_count": 24, "name": "u5L7M4Qn", "unlimited": true, "use_buffer_percent": false}}, "regions": ["w605FooV", "QloR1s9M", "b7UR3HMP"], "session_timeout": 28, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"nhgGygHD": {"buffer_count": 56, "buffer_percent": 9, "max_count": 57, "min_count": 91, "name": "9WC0nWAR", "unlimited": false, "use_buffer_percent": true}, "POylGy9k": {"buffer_count": 34, "buffer_percent": 89, "max_count": 51, "min_count": 6, "name": "FR3tvuFa", "unlimited": true, "use_buffer_percent": false}, "AWoK4Me5": {"buffer_count": 78, "buffer_percent": 77, "max_count": 91, "min_count": 13, "name": "vkRF2Ozm", "unlimited": true, "use_buffer_percent": false}}, "regions": ["5NN2kb1Q", "M74IHdhH", "MM3e6RMW"], "session_timeout": 51, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'JX8j77td' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'KtsZzZ7Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 23, "buffer_percent": 53, "configuration": "pm0CC1TJ", "enable_region_overrides": true, "game_version": "A7fSI62K", "max_count": 86, "min_count": 60, "regions": ["KIZSAqwU", "yTtJmK1j", "mUqkmGxk"], "session_timeout": 2, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'lCZ2afo8' \
    --namespace "$AB_NAMESPACE" \
    --region 'duP3jFdX' \
    --body '{"buffer_count": 2, "buffer_percent": 45, "max_count": 77, "min_count": 52, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'Wh5iHZ8P' \
    --namespace "$AB_NAMESPACE" \
    --region '34o1voM2' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'coKnUa2N' \
    --namespace "$AB_NAMESPACE" \
    --region 'tO0e6VvQ' \
    --body '{"buffer_count": 96, "buffer_percent": 1, "max_count": 0, "min_count": 93, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 's3qKsvDP' \
    --namespace "$AB_NAMESPACE" \
    --version 'VXhR25qQ' \
    --body '{"buffer_count": 88, "buffer_percent": 21, "configuration": "i3KDyNEC", "enable_region_overrides": false, "game_version": "jDJdaUwM", "max_count": 8, "min_count": 54, "region_overrides": {"hu5HrN5T": {"buffer_count": 30, "buffer_percent": 40, "max_count": 22, "min_count": 4, "name": "R8IGc8mQ", "unlimited": true, "use_buffer_percent": true}, "ob6fML2q": {"buffer_count": 65, "buffer_percent": 88, "max_count": 88, "min_count": 37, "name": "uFfSwpjS", "unlimited": false, "use_buffer_percent": true}, "bq92cw6v": {"buffer_count": 24, "buffer_percent": 11, "max_count": 97, "min_count": 40, "name": "ORZo2ow2", "unlimited": false, "use_buffer_percent": true}}, "regions": ["1EKypNDS", "xKhGDnzW", "Ed4zCjJO"], "session_timeout": 68, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'AjBTmfek' \
    --namespace "$AB_NAMESPACE" \
    --version 'LLPafPwZ' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment '3TmKUSMl' \
    --namespace "$AB_NAMESPACE" \
    --version 'NOrmN6Ln' \
    --body '{"buffer_count": 10, "buffer_percent": 71, "configuration": "ew7bpqAB", "enable_region_overrides": true, "game_version": "ENTb0NBv", "max_count": 6, "min_count": 51, "regions": ["aN7W08qY", "o7fQ8jNr", "1f2DcFDo"], "session_timeout": 96, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'sQ2rB3kc' \
    --namespace "$AB_NAMESPACE" \
    --region '8RmCfMnI' \
    --version 'IzPtY3Ph' \
    --body '{"buffer_count": 54, "buffer_percent": 100, "max_count": 1, "min_count": 27, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'qj2aP4JA' \
    --namespace "$AB_NAMESPACE" \
    --region 'unRd5Z7u' \
    --version '9hZe0qLf' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '4lZ6UFYb' \
    --namespace "$AB_NAMESPACE" \
    --region 'XhQlbMDx' \
    --version 'r8pVRr9S' \
    --body '{"buffer_count": 62, "buffer_percent": 28, "max_count": 23, "min_count": 89, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '9' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'x7tg5WYe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'VY8whjJh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 31, "mem_limit": 56, "params": "KVPpR4VJ"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'zgGFQ6Pc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'QHOozqDK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 96, "mem_limit": 12, "name": "YMifMvYR", "params": "vwmnP53U"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'bpzg3b0r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 82}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'zkgnQo2J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'v4iXhsHG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "f77YLZw4", "port": 70}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '3mjtJcwL' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '85' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'etO5B0lw' \
    --version 'zcpphAvU' \
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
    --imageURI '9tnV6uZw' \
    --version 'rjoTyi15' \
    --versionPatch '55V5ylQM' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'swUsiIBo' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '0PG6fWap' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'EyzDeCzK' \
    --versionPatch 'EaolrOr3' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'ZHTxaC1r' \
    --count '6' \
    --offset '41' \
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
    --region 'TcthON13' \
    > test.out 2>&1
eval_tap $? 46 'CountServerDetailed' test.out

#- 47 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'ListLocalServer' test.out

#- 48 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'RLxpVE36' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteLocalServer' test.out

#- 49 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'zHdDcwU2' \
    > test.out 2>&1
eval_tap $? 49 'GetServer' test.out

#- 50 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'FLo2WIQH' \
    > test.out 2>&1
eval_tap $? 50 'DeleteServer' test.out

#- 51 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dsmc getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'VGewwmgc' \
    > test.out 2>&1
eval_tap $? 51 'GetServerLogs' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'E8UH4fwe' \
    --withServer  \
    --count '79' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Kj12zpjU' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '65ivEA32' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'ExportConfigV1' test.out

#- 56 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 56 'ImportConfigV1' test.out

#- 57 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'ImageLimitClient' test.out

#- 58 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'j59bTA3c' \
    > test.out 2>&1
eval_tap $? 58 'ImageDetailClient' test.out

#- 59 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "yvgUaeKV"}' \
    > test.out 2>&1
eval_tap $? 59 'DeregisterLocalServer' test.out

#- 60 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "snEHMNEg", "ip": "V837k2tZ", "name": "50GZJaPo", "port": 47}' \
    > test.out 2>&1
eval_tap $? 60 'RegisterLocalServer' test.out

#- 61 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "wD0906VY", "pod_name": "MT28Tplt"}' \
    > test.out 2>&1
eval_tap $? 61 'RegisterServer' test.out

#- 62 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "28JxWOUa"}' \
    > test.out 2>&1
eval_tap $? 62 'ShutdownServer' test.out

#- 63 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'oZS2o2la' \
    > test.out 2>&1
eval_tap $? 63 'GetServerSession' test.out

#- 64 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "GhH5SOLU", "configuration": "qtPbz4YK", "deployment": "Jfxr8Suk", "game_mode": "KUxmF6KW", "matching_allies": [{"matching_parties": [{"party_attributes": {"vZ6RJPU4": {}, "jPmDxsYQ": {}, "Fk08l6VU": {}}, "party_id": "J1iTKgho", "party_members": [{"user_id": "pfv5WfnQ"}, {"user_id": "AD9z02P4"}, {"user_id": "ui2tb3Bg"}]}, {"party_attributes": {"sQDnOn6D": {}, "59PRZ9AQ": {}, "dr5ZX1cV": {}}, "party_id": "z9WKHsCh", "party_members": [{"user_id": "2YE3nWUP"}, {"user_id": "SvNtb1O1"}, {"user_id": "lDiwO3u6"}]}, {"party_attributes": {"liaPXqSc": {}, "4xU6jZ4K": {}, "xSYAUPgN": {}}, "party_id": "oZ4XPSGR", "party_members": [{"user_id": "vbHzotIr"}, {"user_id": "iNxtMV9H"}, {"user_id": "9mm5KD9h"}]}]}, {"matching_parties": [{"party_attributes": {"nMxLCILc": {}, "TFSPIBc0": {}, "DwHTfxVV": {}}, "party_id": "t7i8FZdk", "party_members": [{"user_id": "eXNKJ6Lr"}, {"user_id": "hmhSkoby"}, {"user_id": "zXpMenx9"}]}, {"party_attributes": {"9zSRiSDH": {}, "iE3LoqM5": {}, "RQuVv4ns": {}}, "party_id": "GTuKOW6x", "party_members": [{"user_id": "qbIivjnH"}, {"user_id": "hY06bBQV"}, {"user_id": "qVLsZzkJ"}]}, {"party_attributes": {"7fcxAh6Q": {}, "fqTumDC5": {}, "X7rk92Lg": {}}, "party_id": "JAqntNwy", "party_members": [{"user_id": "dLQoSA0A"}, {"user_id": "PjhZrAOg"}, {"user_id": "H8ERk7TI"}]}]}, {"matching_parties": [{"party_attributes": {"2ZRJfnS3": {}, "CDvzRNc4": {}, "1xmJakZ2": {}}, "party_id": "uw65XwDI", "party_members": [{"user_id": "hFLEz22E"}, {"user_id": "jGFYppot"}, {"user_id": "4ncTbEeF"}]}, {"party_attributes": {"h98fQ2oU": {}, "iUmjWVPC": {}, "4R5ypFYI": {}}, "party_id": "QQlMMwoB", "party_members": [{"user_id": "Oz2zzyal"}, {"user_id": "IvqbmUZc"}, {"user_id": "JtdN9LEY"}]}, {"party_attributes": {"tYerQlD9": {}, "6x3raQ6v": {}, "9oiKUfU7": {}}, "party_id": "xcSIWiwl", "party_members": [{"user_id": "nMBfCXU2"}, {"user_id": "rr9lmagS"}, {"user_id": "WfTzDvBe"}]}]}], "namespace": "cAdJ4aDU", "notification_payload": {}, "pod_name": "N1Q6Y1Ow", "region": "DaVAkouh", "session_id": "gk0BLBnH"}' \
    > test.out 2>&1
eval_tap $? 64 'CreateSession' test.out

#- 65 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "eML1c7l9"}' \
    > test.out 2>&1
eval_tap $? 65 'ClaimServer' test.out

#- 66 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'VkHaTw4Y' \
    > test.out 2>&1
eval_tap $? 66 'GetSession' test.out

#- 67 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 67 'GetDefaultProvider' test.out

#- 68 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 68 'ListProviders' test.out

#- 69 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region '3IxUgJw5' \
    > test.out 2>&1
eval_tap $? 69 'ListProvidersByRegion' test.out

#- 70 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 70 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE