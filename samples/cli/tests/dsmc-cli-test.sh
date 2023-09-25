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
echo "1..82"

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
    --body '{"artifactPath": "EAxcVpFrttufHIRd", "coreDumpEnabled": true, "image": "9UzVRiXbqlAw7r6W", "imageReplicationsMap": {"2ktQG0h5JAav5kRa": {"failure_code": "62WopBJHPtcDs8bB", "region": "ZLCXLx8bbgorQeFb", "status": "Q1g7qbPngUNB1vRo", "uri": "dwpzS6DaDpv8N7ZQ"}, "VqGj6oDLjWjkY1aX": {"failure_code": "lFcDtgOjchIua5tW", "region": "EIC32ogW7olvbTgr", "status": "hRTcPiSuL0Sly6XM", "uri": "4OI18mAQLnzjMf8G"}, "Z2WBZqxYG3aREAu2": {"failure_code": "D6QVKNCWP75TB0i7", "region": "pKxR8dl0zRVW4EZG", "status": "9m0XcgGVbMqSszE8", "uri": "GHavj7AorKsxwkos"}}, "namespace": "AVerXpc1C8XfwHuK", "patchVersion": "eb9l3rGN9A3sNm84", "persistent": false, "version": "ZSoEAcBdW19m4eu6"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "d5tA5jUmiTqpyhPF", "coreDumpEnabled": false, "dockerPath": "qrhBRd8lDR6qVNPR", "image": "ZYdFLIAjGGJddVCv", "imageSize": 41, "namespace": "at0SevkLGMS0lyuI", "persistent": false, "ulimitFileSize": 71, "version": "llzQRaT5kPxUfofv"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "nnSuB0y5WUlrMdI4", "coreDumpEnabled": true, "dockerPath": "LlkvR8sKgnuRkggh", "image": "GoYupD391C2qtPYo", "imageSize": 22, "namespace": "GrncqmLtjQHAf8Tg", "patchVersion": "oNm03VLisV6zwPuo", "persistent": true, "ulimitFileSize": 39, "uploaderFlag": "u0MesTCf9x4rt69l", "version": "na7qxNeIxPz6MbwL"}' \
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
    --body '{"claim_timeout": 67, "creation_timeout": 70, "default_version": "kE7wcWfDslpJSqGA", "port": 85, "ports": {"Q0yYoNRKd3IL5TAQ": 68, "iiPlSC2uE4o5Vwdo": 12, "MqHcUmLZZbSqb8Rw": 81}, "protocol": "pDDWVAla2l5BYNtI", "providers": ["uS5S5XUdjsoqwGyz", "zWi9gwQYv7t1o7TT", "r1DmrhZv15T7quIO"], "session_timeout": 44, "unreachable_timeout": 5}' \
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
    --body '{"claim_timeout": 57, "creation_timeout": 94, "default_version": "McaYmvCkGZ5dAgqx", "port": 31, "protocol": "EXlAvxJMdalwSyli", "providers": ["WMNW5NyLu0M3VHh2", "EI8JlDbPWbQ6Q9lN", "mqRBaAkLnvxkT1X6"], "session_timeout": 38, "unreachable_timeout": 5}' \
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
    --name 'DBU5SepjChB3V0v5' \
    --count '16' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'kkK6KKXNB3Gv0Iqm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'F51TkhjYnaq6foWv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 84, "buffer_percent": 96, "configuration": "bMrXsDr6kILsSSyD", "enable_region_overrides": false, "extendable_session": true, "game_version": "mykmoPYgc2L4jk4L", "max_count": 30, "min_count": 82, "overrides": {"0LSP0pf4IxjUkl53": {"buffer_count": 60, "buffer_percent": 69, "configuration": "ateEKDpADz1x3poD", "enable_region_overrides": true, "extendable_session": true, "game_version": "gb3boLQQ1MzH7Qm8", "max_count": 4, "min_count": 56, "name": "wbmXgdAPh1EThG96", "region_overrides": {"gAFKK2WDgCcxvONZ": {"buffer_count": 25, "buffer_percent": 94, "max_count": 16, "min_count": 63, "name": "uwjRHpKKTlmVr9Xu", "unlimited": false, "use_buffer_percent": true}, "JbRFQSKVPHbn4Xxt": {"buffer_count": 42, "buffer_percent": 96, "max_count": 14, "min_count": 78, "name": "AEtrmjqU6YE3p4lS", "unlimited": false, "use_buffer_percent": false}, "qan0nSBJroav91GX": {"buffer_count": 23, "buffer_percent": 8, "max_count": 44, "min_count": 75, "name": "PG6bFYReVHQipcCx", "unlimited": false, "use_buffer_percent": true}}, "regions": ["24CKNS0GqVvUfHQv", "sHXNUNe4mhgo5QB6", "5lSAiYnNjkfZrQvG"], "session_timeout": 13, "unlimited": false, "use_buffer_percent": false}, "LdLsFzHkBMr1yrOM": {"buffer_count": 23, "buffer_percent": 40, "configuration": "NFSrUEirnjX9fDmI", "enable_region_overrides": false, "extendable_session": false, "game_version": "kydwYWQG26yUZNmT", "max_count": 57, "min_count": 12, "name": "cvrbYCwZtxFHyPLt", "region_overrides": {"I8ilbyDPUIj88cek": {"buffer_count": 6, "buffer_percent": 32, "max_count": 34, "min_count": 31, "name": "Ct81P1ktfIovmv9g", "unlimited": true, "use_buffer_percent": true}, "5cJcHm3SZLxoRDFu": {"buffer_count": 43, "buffer_percent": 11, "max_count": 41, "min_count": 89, "name": "ySj29a9LJE8HoRS1", "unlimited": false, "use_buffer_percent": true}, "AnkCmBUqg2SCnqnt": {"buffer_count": 47, "buffer_percent": 50, "max_count": 60, "min_count": 1, "name": "OqOBSC2DKHRuPMMW", "unlimited": false, "use_buffer_percent": false}}, "regions": ["b33T5UBJCjfcnLRf", "xeCSz9WEi8KlloeH", "0JT1yduat2vQR3bi"], "session_timeout": 56, "unlimited": false, "use_buffer_percent": true}, "rtOa4EXsXzOXQAk4": {"buffer_count": 26, "buffer_percent": 33, "configuration": "tIYt4SqYUTLDx9gI", "enable_region_overrides": false, "extendable_session": true, "game_version": "xtjzm8y2wNhmwoYZ", "max_count": 50, "min_count": 59, "name": "I4EFZKBcYrCEAE7W", "region_overrides": {"Isfmx40NLRc6m8he": {"buffer_count": 74, "buffer_percent": 12, "max_count": 28, "min_count": 1, "name": "Whzfe2NubeoKFeIa", "unlimited": true, "use_buffer_percent": false}, "YYk6QEgJjBbEDoNf": {"buffer_count": 51, "buffer_percent": 27, "max_count": 25, "min_count": 15, "name": "nRBkMNxvvKgAT8mJ", "unlimited": true, "use_buffer_percent": true}, "Yq6hRkloqxM3gpwx": {"buffer_count": 4, "buffer_percent": 74, "max_count": 11, "min_count": 79, "name": "jyEW6GLbc0NaKDUL", "unlimited": true, "use_buffer_percent": true}}, "regions": ["JEN2VHzih3bit0VW", "n3CO39PXDNxtXgeO", "3FgkXhjDzaQY3snn"], "session_timeout": 30, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"P7cFdP43e5dC9XIB": {"buffer_count": 43, "buffer_percent": 3, "max_count": 8, "min_count": 90, "name": "fZgrbHDIDm4hMzF4", "unlimited": true, "use_buffer_percent": true}, "odenSrUTvfqU0bfo": {"buffer_count": 79, "buffer_percent": 6, "max_count": 25, "min_count": 83, "name": "5cTtFWbotQyXJRcQ", "unlimited": true, "use_buffer_percent": false}, "vYmmDg7VYPXIuvUY": {"buffer_count": 93, "buffer_percent": 82, "max_count": 57, "min_count": 9, "name": "RujIUE1Tq5jyAZvk", "unlimited": true, "use_buffer_percent": false}}, "regions": ["MNFIurjh2imdb4rb", "kXj0ZwsVC0gL97ZV", "JSPqJiwv1qlYB1RS"], "session_timeout": 75, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'XVv8ZGF7uYnGzpip' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'NDigNJma1MbqqZtf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 100, "buffer_percent": 34, "configuration": "aolB4lkKB4EYOkQ1", "enable_region_overrides": false, "extendable_session": false, "game_version": "MD3cym8xIfkOVW2g", "max_count": 37, "min_count": 58, "regions": ["REOLx0KOww3HICQL", "fl7MUBG7qtPu64yA", "tURKLRkb738HGS6r"], "session_timeout": 61, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'XVG7tnsZg5QgXjvy' \
    --namespace "$AB_NAMESPACE" \
    --region 'GJPN4eXbJE5Vs2Gc' \
    --body '{"buffer_count": 51, "buffer_percent": 28, "max_count": 30, "min_count": 62, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'QoIXimBJehyxlNsj' \
    --namespace "$AB_NAMESPACE" \
    --region 'UgxBkF6wFPoJeQed' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'iogEhhM2rIizGdKv' \
    --namespace "$AB_NAMESPACE" \
    --region 'OPdq5xrgxSmy1DN9' \
    --body '{"buffer_count": 77, "buffer_percent": 32, "max_count": 65, "min_count": 59, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'DQyj4bj5Ro2ogaKt' \
    --namespace "$AB_NAMESPACE" \
    --version '2ujQSa3Zdb65UXmy' \
    --body '{"buffer_count": 17, "buffer_percent": 91, "configuration": "p6iIaTIKUkmkk9QM", "enable_region_overrides": true, "extendable_session": false, "game_version": "MA9ORxpzwLR2AK6e", "max_count": 59, "min_count": 95, "region_overrides": {"tX7W40V6Do5sYadC": {"buffer_count": 59, "buffer_percent": 49, "max_count": 65, "min_count": 4, "name": "rHHC3DpZxkrQDXuN", "unlimited": true, "use_buffer_percent": false}, "cqsuGKHhMRWLVd3D": {"buffer_count": 22, "buffer_percent": 23, "max_count": 16, "min_count": 85, "name": "LuIpomM8sm1MiaI1", "unlimited": false, "use_buffer_percent": true}, "ugBp3HBvepnDCjgy": {"buffer_count": 74, "buffer_percent": 21, "max_count": 24, "min_count": 100, "name": "e36mgWjLfFmteue9", "unlimited": false, "use_buffer_percent": true}}, "regions": ["zJ6fH24T805tVg8J", "qU0jZpjvsugAOS7u", "8RiWyerCSa8SRgws"], "session_timeout": 55, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'rIxsB0NRsB1fPqqR' \
    --namespace "$AB_NAMESPACE" \
    --version 'RulpqpymDkQhtrHW' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'wRVnwVBOqOHi8pWG' \
    --namespace "$AB_NAMESPACE" \
    --version 'd1juYhiqjRJOqB5F' \
    --body '{"buffer_count": 6, "buffer_percent": 57, "configuration": "zFQbJndUDpdONneA", "enable_region_overrides": false, "game_version": "VrjfGXZnqAQUoY1G", "max_count": 20, "min_count": 23, "regions": ["p2JZp50CnPb71ORY", "cmQbTU5JX8ccLjMX", "JRk0eaKQDOJvrTef"], "session_timeout": 12, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'Ss6g4iY9u02aCNYI' \
    --namespace "$AB_NAMESPACE" \
    --region 'Wekp18lOC3mNqF7B' \
    --version 'l0LcghVHfPEspxwh' \
    --body '{"buffer_count": 89, "buffer_percent": 89, "max_count": 84, "min_count": 80, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'bc1eMbEIjowLqc3e' \
    --namespace "$AB_NAMESPACE" \
    --region 'cjXJbZDKKoxLE1Y3' \
    --version 'Dymtj3giPg4x4yiP' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'X6ues1Hhhkg1yLVb' \
    --namespace "$AB_NAMESPACE" \
    --region 'LFzHEP8cM4NTwr0K' \
    --version 'HaAsmTej52WKi6tA' \
    --body '{"buffer_count": 35, "buffer_percent": 1, "max_count": 55, "min_count": 46, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '32' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'lCSVq8PdH6hJPUAc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '0RVwXgAgntLMCuaX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 56, "mem_limit": 98, "params": "WQi6BqPg4xr0lCan"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'cUZGCHsZYoLfR1Kt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'Ov7Zy0b65uvuKNuy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 62, "mem_limit": 50, "name": "3Tam69qSZ7PC6f6Q", "params": "kmZXElW9YfRSse6A"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'Az3S4czz0QKFlAVm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 97}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '6XqP6oo7G73zdxTg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'OfnwIdlNa29fDLh7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "41IslKHzGlLKWUtD", "port": 87}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'l5LLLOexL4fZvWtN' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '86' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'DGQhNPEwiJCf2XJV' \
    --version 'rlzqQls1ozhLVA3k' \
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
    --imageURI 'E8jKvgatOEBM70Td' \
    --version 'lNBJYOmpu1VCarzB' \
    --versionPatch 'sV6xnZ5Jrzzjrcau' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'g6CWVG8SWP3glU6m' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'uswVJnNnN7kAa7j0' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'riFc5HTHQIoVsGo7' \
    --versionPatch 'dwV9DBqFKHQkETJy' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 GetRepository
./ng net.accelbyte.sdk.cli.Main dsmc getRepository \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetRepository' test.out

#- 45 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'TlUrwDTnoujQD4IE' \
    --count '17' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 45 'ListServer' test.out

#- 46 CountServer
./ng net.accelbyte.sdk.cli.Main dsmc countServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'CountServer' test.out

#- 47 CountServerDetailed
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailed \
    --namespace "$AB_NAMESPACE" \
    --region 'H9Z5qXn3aoRtlqOE' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'CohViHA5CzgFSy8X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '1A3PrIfapq5AAeMe' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName '4L3mDWORBVXTIIJM' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '9XsYIIZxiXNMR9Bg' \
    --withServer  \
    --count '1' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'AvQkqsGnmyo5JJTU' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Vmb8GEXFTlEMEsFz' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "YqwgK1Np5nodqpLm", "repository": "7FhJBNXzAFdO0Khq"}' \
    > test.out 2>&1
eval_tap $? 55 'CreateRepository' test.out

#- 56 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'ExportConfigV1' test.out

#- 57 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 57 'ImportConfigV1' test.out

#- 58 GetAllDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeploymentClient \
    --namespace "$AB_NAMESPACE" \
    --name 'f6kiTdSGv2LFjAKY' \
    --count '30' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'zRmDD0jJvlfV5Oem' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 66, "buffer_percent": 78, "configuration": "T7DROCjtuzFMbAG9", "enable_region_overrides": false, "extendable_session": false, "game_version": "9hmguB8FOTjMLo4b", "max_count": 26, "min_count": 37, "overrides": {"SJC4DdrKF7SUQPLG": {"buffer_count": 35, "buffer_percent": 9, "configuration": "G0rH0zcswwVeMK6M", "enable_region_overrides": false, "extendable_session": false, "game_version": "Iu8vvwLc7KY3uVoJ", "max_count": 9, "min_count": 93, "name": "JIePF8ZrQzP4zvtd", "region_overrides": {"xdbZUpd6FJtHJ1py": {"buffer_count": 97, "buffer_percent": 93, "max_count": 46, "min_count": 76, "name": "yKQLY6FEO65Rb3z7", "unlimited": true, "use_buffer_percent": true}, "LM8IlsHqffnrfsGl": {"buffer_count": 11, "buffer_percent": 85, "max_count": 67, "min_count": 1, "name": "ZgKg4uKxaCgcGLuC", "unlimited": true, "use_buffer_percent": false}, "j1QGIFmlVf4jvaps": {"buffer_count": 9, "buffer_percent": 18, "max_count": 63, "min_count": 78, "name": "tLW87rGysryod3dN", "unlimited": true, "use_buffer_percent": true}}, "regions": ["iLvtEk4mTIpUA9gx", "o8SV38nEhoXmM2W7", "l6jHMA2rG3nakopA"], "session_timeout": 50, "unlimited": true, "use_buffer_percent": false}, "gqRqCV7usamANkZl": {"buffer_count": 84, "buffer_percent": 34, "configuration": "9Sfo95HgXqKhTPkw", "enable_region_overrides": false, "extendable_session": true, "game_version": "9uSybRzWek2gZvRr", "max_count": 43, "min_count": 53, "name": "r0n9d9lvccKMLhrT", "region_overrides": {"rcBE2ItBS3KtKZWe": {"buffer_count": 87, "buffer_percent": 0, "max_count": 42, "min_count": 30, "name": "aS7RBx3vim02jBOx", "unlimited": true, "use_buffer_percent": false}, "DyvpcLYOWA8NjxOn": {"buffer_count": 1, "buffer_percent": 96, "max_count": 63, "min_count": 36, "name": "ok4nOOCzfsflhjbn", "unlimited": false, "use_buffer_percent": false}, "JOUn18G5MlfDTk8a": {"buffer_count": 66, "buffer_percent": 11, "max_count": 90, "min_count": 46, "name": "NlncceIZSwgAIkgz", "unlimited": false, "use_buffer_percent": false}}, "regions": ["nocGAjci0V3tBf2j", "nHGKXphn50c9tNLD", "ljhZ2jxLRX3z46OC"], "session_timeout": 1, "unlimited": true, "use_buffer_percent": true}, "Xvjcu2s6w3VifnKq": {"buffer_count": 25, "buffer_percent": 69, "configuration": "TSoGH1XEfY6QAYn6", "enable_region_overrides": true, "extendable_session": true, "game_version": "UBEU1QAOHfZiGhxO", "max_count": 6, "min_count": 98, "name": "cuDXSxSc3aZPV87p", "region_overrides": {"na08gxefTYKhuxaE": {"buffer_count": 5, "buffer_percent": 81, "max_count": 99, "min_count": 79, "name": "y2NvZ85DDKDAF8KD", "unlimited": true, "use_buffer_percent": true}, "rFES9z7xueHpATHc": {"buffer_count": 5, "buffer_percent": 34, "max_count": 9, "min_count": 8, "name": "akMpcmnnx6RVBrop", "unlimited": false, "use_buffer_percent": true}, "qKzFsLfYalUlfwEQ": {"buffer_count": 74, "buffer_percent": 92, "max_count": 18, "min_count": 10, "name": "U7eHGebSVu0LQ40k", "unlimited": false, "use_buffer_percent": true}}, "regions": ["6vzohZyjMQAg5mPY", "hrLTyU8OhgfY9JQY", "GF4bYXEcENx9xZlA"], "session_timeout": 4, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"oAnaRcYp7FUjfIGa": {"buffer_count": 10, "buffer_percent": 50, "max_count": 12, "min_count": 86, "name": "oflEIByYqeKN0meG", "unlimited": false, "use_buffer_percent": false}, "dbzIVy8alncV7vWg": {"buffer_count": 91, "buffer_percent": 68, "max_count": 43, "min_count": 6, "name": "ZFTYnPkmSu4PWam1", "unlimited": false, "use_buffer_percent": true}, "06MqQBErxgjVBycv": {"buffer_count": 96, "buffer_percent": 60, "max_count": 61, "min_count": 85, "name": "hoO05oKqymxLD1Lc", "unlimited": true, "use_buffer_percent": true}}, "regions": ["w6T6mZEiwxxElpMY", "SWIeVzm7z9noowml", "TIKVowi0RY2VN4ZO"], "session_timeout": 80, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'l2Zsrh90ETtYmGuk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '52' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '3MnlrjcHp6B8Vj7r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 36, "mem_limit": 64, "params": "x9Ns8eLzYEvwSWTa"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'LQjctvrK2jhsYpKP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '24' \
    --offset '29' \
    --q 'Xn77AtYoFzLAATPY' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 64 'ListImagesClient' test.out

#- 65 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'ImageLimitClient' test.out

#- 66 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version '8P3cfoivvQxevecW' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'w7Rry0KK5rgAGO0d' \
    --count '100' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "8rX2MVUGKSZ4GcLk"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "t4pK32sJxlZcCTpT"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "dRtCHvuk6B6XTmSL", "ip": "yn50sigBVZxiKdV5", "name": "7GvRyd9UuL02Le8H", "port": 91}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "y1JsxJNGmyt0SQDU", "pod_name": "DoWBZVGLlkUetzCA"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "c9x1aMjgGim51T10"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName '7XIZRZ7tZdIs0xf4' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'czdt7zqmSKxOEQlV' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "cx6GqsBq8vdhWVnu", "configuration": "YLgpZehK0G2nmyuV", "deployment": "iB9kRTcSQdTnNYGe", "game_mode": "AfYFG3wSkHKufBdS", "matching_allies": [{"matching_parties": [{"party_attributes": {"3ZOokZB4cXnAXyuG": {}, "z6LlxHv8SwyagYvD": {}, "J3w3UNgIGj2jZtEY": {}}, "party_id": "T8sIPSE1XXPzySa0", "party_members": [{"user_id": "sZoFS6xCOWMpyh9p"}, {"user_id": "MsQgb64ELbzDMwyo"}, {"user_id": "4nIRysQdbufXjYnS"}]}, {"party_attributes": {"oIFeouC2m38kXrDZ": {}, "WlGVE9sJ4NpUtKp6": {}, "M9I6nEwnZhsjwJeG": {}}, "party_id": "waPSDMZz95OYKiqa", "party_members": [{"user_id": "ZD63xe5rruJVfLGe"}, {"user_id": "a0ZtlzUcuHAXz0UV"}, {"user_id": "31MfuGaXsAuGsZaS"}]}, {"party_attributes": {"HevO0TQNEI3kfabx": {}, "JWWSI1ECUo1NPpeF": {}, "hUztXDgB7n4C97uA": {}}, "party_id": "PP8PATLpUpxeJlsB", "party_members": [{"user_id": "JT6Hh3OMjAjq2mK8"}, {"user_id": "lbSEEelxnb5QxWG2"}, {"user_id": "HFnZlA6HKWW4fI1I"}]}]}, {"matching_parties": [{"party_attributes": {"QcoBQELcNlZkqTZr": {}, "KgXNwvm4e5GX6H74": {}, "2OixhtAoKiVm6URT": {}}, "party_id": "95XhnUcvWB28Mpus", "party_members": [{"user_id": "uhhDJ5slzgiWZEty"}, {"user_id": "d56LfxnbY97jjYgX"}, {"user_id": "chCbkXX26uEdCfQa"}]}, {"party_attributes": {"MAQuTKfC0I2kNjCM": {}, "DtDMrentgn3Dhqci": {}, "wIeShF9RKb9vvxuJ": {}}, "party_id": "lhXbWhbwPwToC6kn", "party_members": [{"user_id": "jVwVnzaqSfJiQFC2"}, {"user_id": "gXoda0kg16yUSpSO"}, {"user_id": "AjHJWwfCjYwWkLob"}]}, {"party_attributes": {"9gKLqs2nEZhpByfH": {}, "ZinxNfgPAwkMBszn": {}, "lBUqnLT4AbGptKaW": {}}, "party_id": "NvPbpg7yrRvXfZ6r", "party_members": [{"user_id": "vgvEY3Hht1SwqTsK"}, {"user_id": "KKo37NHDOQe91Ps3"}, {"user_id": "ztUIV0dS6hIH9c4V"}]}]}, {"matching_parties": [{"party_attributes": {"fkyrwpuXxbaERbfg": {}, "Pmi0eHkt1mr9EOIF": {}, "g0dnWIYN2NVL70Iw": {}}, "party_id": "157g00jr9b8MuYmm", "party_members": [{"user_id": "eKTmBNvGYxEQdf3e"}, {"user_id": "woGGoY7xmFNAmjDD"}, {"user_id": "Cvs78mcMdiS76YAp"}]}, {"party_attributes": {"GJ9ufwLYkqIgLuZS": {}, "6hsQryiEtOAbpeUN": {}, "f26UqkCfgCUYBn2x": {}}, "party_id": "aOBdPF0JmX8qwU1c", "party_members": [{"user_id": "TuHHPB5S3DvPRCzB"}, {"user_id": "rVUxmDOj3cvRFaTC"}, {"user_id": "11W0TGTCm4fZWuk6"}]}, {"party_attributes": {"pQxDQpKqxLGeMvr9": {}, "TsvcMQ7dBsaIecRx": {}, "IsZvD6rmzVr5XT1N": {}}, "party_id": "xw0v1dMQ9Rrbk6C2", "party_members": [{"user_id": "cVWf6ttvbU1PO6Ap"}, {"user_id": "CD2VXidT7w0Oc15N"}, {"user_id": "8WXBPp17PAewqSm5"}]}]}], "namespace": "x3B4t7WQnp8jXZed", "notification_payload": {}, "pod_name": "gt5cyNe27HLtwtVO", "region": "axgP6Jbct8puMybY", "session_id": "GxD9IPmmsLmu3kaP"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "j0O4zd8Tb7cUNGPT"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'BxiFFCrn7djjs69F' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'TFVGUVhvKhJCmeis' \
    > test.out 2>&1
eval_tap $? 78 'CancelSession' test.out

#- 79 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 79 'GetDefaultProvider' test.out

#- 80 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 80 'ListProviders' test.out

#- 81 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region 'ql14mUHVbMPimNhc' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE