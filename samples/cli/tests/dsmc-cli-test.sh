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
    --body '{"artifactPath": "EAxcVpFrttufHIRd", "image": "H9UzVRiXbqlAw7r6", "imageReplicationsMap": {"W2ktQG0h5JAav5kR": {"failure_code": "a62WopBJHPtcDs8b", "region": "BZLCXLx8bbgorQeF", "status": "bQ1g7qbPngUNB1vR", "uri": "odwpzS6DaDpv8N7Z"}, "QVqGj6oDLjWjkY1a": {"failure_code": "XlFcDtgOjchIua5t", "region": "WEIC32ogW7olvbTg", "status": "rhRTcPiSuL0Sly6X", "uri": "M4OI18mAQLnzjMf8"}, "GZ2WBZqxYG3aREAu": {"failure_code": "2D6QVKNCWP75TB0i", "region": "7pKxR8dl0zRVW4EZ", "status": "G9m0XcgGVbMqSszE", "uri": "8GHavj7AorKsxwko"}}, "namespace": "sAVerXpc1C8XfwHu", "patchVersion": "Keb9l3rGN9A3sNm8", "persistent": false, "version": "hddSpHt0P7MIIR7C"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "kyF6C7duuyZ0GhDo", "coreDumpEnabled": false, "dockerPath": "dxLzFQN05MYzYiKW", "image": "e5dNRljv7IPrDQQR", "imageSize": 13, "namespace": "u9vx5KQ7KYnIuMBv", "persistent": false, "version": "9a2I9u6Vpbsx5w8h"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "qUI06UpOXGSLmCVu", "coreDumpEnabled": false, "dockerPath": "OPlLlkvR8sKgnuRk", "image": "gghGoYupD391C2qt", "imageSize": 85, "namespace": "SCwGrncqmLtjQHAf", "patchVersion": "8TgoNm03VLisV6zw", "persistent": false, "uploaderFlag": "uo3td6TC6I3lMjGS", "version": "WN2laRlxfcjHfYak"}' \
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
    --body '{"claim_timeout": 95, "creation_timeout": 3, "default_version": "CTqGkE7wcWfDslpJ", "port": 91, "ports": {"WytLPziZMdjxcBZu": 11, "5TAQ6iiPlSC2uE4o": 61, "Vwdo3fePqIJA8IHt": 35}, "protocol": "qb8RwNmn9HrNQy4u", "providers": ["ZAAiE0mit9RGCCHY", "zUOcEdscKHPEqgA8", "yu7Vk6Jt4Ymos9Jc"], "session_timeout": 7, "unreachable_timeout": 30}' \
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
    --body '{"claim_timeout": 33, "creation_timeout": 38, "default_version": "uIOvBMcaYmvCkGZ5", "port": 6, "protocol": "cHyCUEXlAvxJMdal", "providers": ["wSyliWMNW5NyLu0M", "3VHh2EI8JlDbPWbQ", "6Q9lNmqRBaAkLnvx"], "session_timeout": 22, "unreachable_timeout": 29}' \
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
    --name 'T1X68cmDc3fxU8My' \
    --count '75' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'V0v52Dlym6puQ23x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'oJ8aeCnaLpUKp44Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 11, "buffer_percent": 20, "configuration": "oWvXa3bMrXsDr6kI", "enable_region_overrides": true, "extendable_session": false, "game_version": "SyDdmykmoPYgc2L4", "max_count": 18, "min_count": 22, "overrides": {"oCMNqq98SjTvhZNk": {"buffer_count": 92, "buffer_percent": 23, "configuration": "Q70D0H6BXksUC9b6", "enable_region_overrides": false, "extendable_session": true, "game_version": "5lZC9xv32e8c5csS", "max_count": 30, "min_count": 53, "name": "voqsZNBdte9NDUPV", "region_overrides": {"Jf6c2Z0QZxfgPubT": {"buffer_count": 61, "buffer_percent": 4, "max_count": 71, "min_count": 49, "name": "HrvqAThuwjRHpKKT", "unlimited": false, "use_buffer_percent": false}, "mVr9XuoJbRFQSKVP": {"buffer_count": 68, "buffer_percent": 3, "max_count": 3, "min_count": 27, "name": "g7mSQUhAEtrmjqU6", "unlimited": true, "use_buffer_percent": true}, "1WsYSiZqan0nSBJr": {"buffer_count": 30, "buffer_percent": 0, "max_count": 57, "min_count": 43, "name": "HqaTHeKtW18iGeUl", "unlimited": false, "use_buffer_percent": false}}, "regions": ["d9sogWa24CKNS0Gq", "VvUfHQvsHXNUNe4m", "hgo5QB65lSAiYnNj"], "session_timeout": 22, "unlimited": true, "use_buffer_percent": false}, "qMrj3oZk03QXcKMD": {"buffer_count": 80, "buffer_percent": 60, "configuration": "r1yrOMlNFSrUEirn", "enable_region_overrides": false, "extendable_session": false, "game_version": "X9fDmIbeZxzfTcyi", "max_count": 41, "min_count": 54, "name": "yUZNmTBcvrbYCwZt", "region_overrides": {"xFHyPLtI8ilbyDPU": {"buffer_count": 71, "buffer_percent": 68, "max_count": 18, "min_count": 77, "name": "88cekdqCt81P1ktf", "unlimited": true, "use_buffer_percent": false}, "meIP6rOvDz9KOsb3": {"buffer_count": 77, "buffer_percent": 49, "max_count": 21, "min_count": 29, "name": "6YmJFfRByjlBiuFM", "unlimited": false, "use_buffer_percent": false}, "RS1X2PFAAMwzHPxB": {"buffer_count": 96, "buffer_percent": 91, "max_count": 38, "min_count": 58, "name": "kYs4Yw20DOqOBSC2", "unlimited": true, "use_buffer_percent": true}}, "regions": ["RuPMMWH8Yb33T5UB", "JCjfcnLRfxeCSz9W", "Ei8KlloeH0JT1ydu"], "session_timeout": 0, "unlimited": true, "use_buffer_percent": true}, "vQR3biBfsu4jmsRE": {"buffer_count": 47, "buffer_percent": 53, "configuration": "1yEkLgh3tIYt4SqY", "enable_region_overrides": false, "extendable_session": true, "game_version": "bGL8QOxtjzm8y2wN", "max_count": 15, "min_count": 1, "name": "mwoYZyI4EFZKBcYr", "region_overrides": {"CEAE7WIsfmx40NLR": {"buffer_count": 5, "buffer_percent": 54, "max_count": 24, "min_count": 15, "name": "DJgas4b6z3LNUj7f", "unlimited": false, "use_buffer_percent": false}, "gLA84Z8YYk6QEgJj": {"buffer_count": 56, "buffer_percent": 62, "max_count": 2, "min_count": 88, "name": "EDoNf3n0hEoRCAcf", "unlimited": true, "use_buffer_percent": true}, "gAT8mJrYq6hRkloq": {"buffer_count": 47, "buffer_percent": 79, "max_count": 8, "min_count": 13, "name": "aqC2J9jyEW6GLbc0", "unlimited": true, "use_buffer_percent": false}}, "regions": ["KoADkzJEN2VHzih3", "bit0VWn3CO39PXDN", "xtXgeO3FgkXhjDza"], "session_timeout": 87, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"3snn2ZkP7cFdP43e": {"buffer_count": 7, "buffer_percent": 9, "max_count": 59, "min_count": 74, "name": "9XIBudfZgrbHDIDm", "unlimited": false, "use_buffer_percent": false}, "MzF4TxodenSrUTvf": {"buffer_count": 33, "buffer_percent": 95, "max_count": 13, "min_count": 2, "name": "8OudOfjnCuHZ3c46", "unlimited": false, "use_buffer_percent": false}, "a23YvYmmDg7VYPXI": {"buffer_count": 41, "buffer_percent": 44, "max_count": 97, "min_count": 96, "name": "xsZNereSvf9699mC", "unlimited": true, "use_buffer_percent": true}}, "regions": ["HThUJkETAsSp7gh4", "TeUTkOkAYfJB8AT9", "t4Tv207Y2QD3oD5f"], "session_timeout": 76, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'r3OOlXVv8ZGF7uYn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'GzpipNDigNJma1Mb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 33, "buffer_percent": 34, "configuration": "aOkvo1aolB4lkKB4", "enable_region_overrides": true, "extendable_session": true, "game_version": "YOkQ1jMD3cym8xIf", "max_count": 22, "min_count": 28, "regions": ["OVW2grREOLx0KOww", "3HICQLfl7MUBG7qt", "Pu64yAtURKLRkb73"], "session_timeout": 69, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'QAXVG7tnsZg5QgXj' \
    --namespace "$AB_NAMESPACE" \
    --region 'vyGJPN4eXbJE5Vs2' \
    --body '{"buffer_count": 67, "buffer_percent": 8, "max_count": 4, "min_count": 4, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'omQoIXimBJehyxlN' \
    --namespace "$AB_NAMESPACE" \
    --region 'sjUgxBkF6wFPoJeQ' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'ediogEhhM2rIizGd' \
    --namespace "$AB_NAMESPACE" \
    --region 'KvOPdq5xrgxSmy1D' \
    --body '{"buffer_count": 81, "buffer_percent": 7, "max_count": 77, "min_count": 32, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'ROYqUiGKXVFCmpo6' \
    --namespace "$AB_NAMESPACE" \
    --version 'sPwVOEDSJsEK5QpN' \
    --body '{"buffer_count": 14, "buffer_percent": 24, "configuration": "my0Zp6iIaTIKUkmk", "enable_region_overrides": false, "extendable_session": true, "game_version": "9QM0NBMA9ORxpzwL", "max_count": 90, "min_count": 2, "region_overrides": {"AK6eXUGPJsw1fiP8": {"buffer_count": 37, "buffer_percent": 67, "max_count": 0, "min_count": 86, "name": "dCCFrHHC3DpZxkrQ", "unlimited": true, "use_buffer_percent": true}, "XuNFviMarv8mnfHK": {"buffer_count": 77, "buffer_percent": 59, "max_count": 97, "min_count": 59, "name": "d3DlhLuIpomM8sm1", "unlimited": true, "use_buffer_percent": false}, "UccE536ugBp3HBve": {"buffer_count": 32, "buffer_percent": 28, "max_count": 41, "min_count": 60, "name": "dsMrok0WvGYYnx4V", "unlimited": false, "use_buffer_percent": true}}, "regions": ["xbnGezKsDwG2omOR", "2nvYI9TVqJdvzcWb", "fUpaXp5JMl5LL4bT"], "session_timeout": 47, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'gwsAj1ik1jglaDXT' \
    --namespace "$AB_NAMESPACE" \
    --version 'vKCWwNTAhd2wrS0u' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'Pdjhdinpng5BLy8w' \
    --namespace "$AB_NAMESPACE" \
    --version 'bhMssAHjapIkY9Rf' \
    --body '{"buffer_count": 34, "buffer_percent": 46, "configuration": "B5F93zFQbJndUDpd", "enable_region_overrides": true, "game_version": "NneAczbBdHb2slt7", "max_count": 30, "min_count": 56, "regions": ["Y1GjlIIk0iKoTTS1", "j02o7JjTXAQN0qds", "kdQV0TqI8EFnmDbx"], "session_timeout": 70, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'TefglSs6g4iY9u02' \
    --namespace "$AB_NAMESPACE" \
    --region 'aCNYIWekp18lOC3m' \
    --version 'NqF7Bl0LcghVHfPE' \
    --body '{"buffer_count": 37, "buffer_percent": 68, "max_count": 32, "min_count": 57, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'CfR3ncDlwi3v3MFF' \
    --namespace "$AB_NAMESPACE" \
    --region 'J1KesKoELCpobBEG' \
    --version '8X645xpdXpai0rYa' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'T5hOPjaf3H0tYigh' \
    --namespace "$AB_NAMESPACE" \
    --region 'U0VUfcYHJbBfAKSi' \
    --version 'PW3VgsZXiR1DJ7HV' \
    --body '{"buffer_count": 99, "buffer_percent": 74, "max_count": 33, "min_count": 18, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '81' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'SawQUWDFJvJBWic7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'UkBeIXuqDuAXI66b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 88, "mem_limit": 40, "params": "71w0deoV9Lx5RDA1"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'l2XcrciYNEzvSZIP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'khSgORcz5S5BvmgB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 77, "mem_limit": 42, "name": "xh4ijFnE3Tam69qS", "params": "Z7PC6f6QkmZXElW9"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'YfRSse6AAz3S4czz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 92}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'QKFlAVmVLu4AOec0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'z8eBeeoip68J1nsv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "4W2OJhtafxMSJlHe", "port": 3}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'lLKWUtDQs61OQAox' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '10' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'ZvWtND2tcBFpX8lN' \
    --version 'tFEJ7tnkY6Mca5af' \
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
    --imageURI 'j12K2IzrBvvWm4ud' \
    --version 'E0OXudXgNne8kJAT' \
    --versionPatch 'wlc6esUp6Sw1I98j' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'eZQ7hfxnhLd3Knak' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'noed9DHhLOqQGhCU' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'r6iTrjyEgarAdNJO' \
    --versionPatch 'IG36I6tRbRcrEveM' \
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
    --region 'dAdiPKDUVSC00PYe' \
    --count '60' \
    --offset '42' \
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
    --region 'cagginxnFIna3ydd' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'cbsPheTH26IUJNvY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'uGRUvpZaHCuESOiI' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'ZsMfB4ZH3mtgWgU4' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'pCAKxeE70CaunQNx' \
    --withServer  \
    --count '30' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'NMR9BgaWcFX3SUBh' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'yoTsMWPAxUMkawaG' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "pAyrIwMif3BOdkoc", "repository": "VTd4BxqGWV6mTJ0s"}' \
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
    --name 'Qs6XNbjvqhnUVLWu' \
    --count '30' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'lKdxL6ozRmDD0jJv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 11, "buffer_percent": 22, "configuration": "V5OemPYdYT7DROCj", "enable_region_overrides": true, "extendable_session": true, "game_version": "n4iLoIllKlpO2pqi", "max_count": 74, "min_count": 65, "overrides": {"F3WGRaoQomSJC4Dd": {"buffer_count": 35, "buffer_percent": 31, "configuration": "KF7SUQPLG59e0k5Z", "enable_region_overrides": true, "extendable_session": true, "game_version": "X6wK7PpUlcIW32iK", "max_count": 79, "min_count": 43, "name": "Gt1ixY5rA1WoVeJI", "region_overrides": {"ePF8ZrQzP4zvtdxd": {"buffer_count": 2, "buffer_percent": 68, "max_count": 74, "min_count": 95, "name": "xbWCYzo8yO2KTK9t", "unlimited": false, "use_buffer_percent": false}, "Y6FEO65Rb3z7CYLM": {"buffer_count": 16, "buffer_percent": 70, "max_count": 23, "min_count": 38, "name": "sHqffnrfsGlfPaZK", "unlimited": true, "use_buffer_percent": false}, "wa3Ddb60ufPpzwj1": {"buffer_count": 86, "buffer_percent": 7, "max_count": 66, "min_count": 93, "name": "IFmlVf4jvapseE9L", "unlimited": false, "use_buffer_percent": true}}, "regions": ["7rGysryod3dNQrms", "ApRA6HX3RwrKt2ec", "ozL0TOg54vCE48L5"], "session_timeout": 29, "unlimited": true, "use_buffer_percent": true}, "4lNa4JUMSHNgqRqC": {"buffer_count": 97, "buffer_percent": 35, "configuration": "7usamANkZlOX9Sfo", "enable_region_overrides": false, "extendable_session": false, "game_version": "iktm0ZPLkLOsp0LZ", "max_count": 89, "min_count": 27, "name": "zWek2gZvRrvr0n9d", "region_overrides": {"9lvccKMLhrTrcBE2": {"buffer_count": 70, "buffer_percent": 44, "max_count": 40, "min_count": 36, "name": "BS3KtKZWe8aoFzAy", "unlimited": true, "use_buffer_percent": true}, "ME74HUtipUWYhWV1": {"buffer_count": 34, "buffer_percent": 4, "max_count": 47, "min_count": 77, "name": "8CzPML52faXUr9Sk", "unlimited": false, "use_buffer_percent": true}, "CzfsflhjbngJOUn1": {"buffer_count": 0, "buffer_percent": 67, "max_count": 83, "min_count": 73, "name": "MlfDTk8aG40Nlncc", "unlimited": false, "use_buffer_percent": false}}, "regions": ["IZSwgAIkgzh4pTU0", "Am4DZhl0bQxFJ3sW", "CqQpQ2FbKPFMycMS"], "session_timeout": 88, "unlimited": false, "use_buffer_percent": true}, "xLRX3z46OCaGBeMf": {"buffer_count": 85, "buffer_percent": 42, "configuration": "lNos4yBRjrERHEon", "enable_region_overrides": true, "extendable_session": true, "game_version": "GmEu0q1p6QCyY6vS", "max_count": 21, "min_count": 86, "name": "VFWdsbYuVEGVxYhe", "region_overrides": {"R3j5mNZ6vwv7K8As": {"buffer_count": 45, "buffer_percent": 48, "max_count": 40, "min_count": 10, "name": "1j1Rx59hesNWy2Nv", "unlimited": false, "use_buffer_percent": false}, "5DDKDAF8KDsBZOuY": {"buffer_count": 88, "buffer_percent": 53, "max_count": 73, "min_count": 48, "name": "3BAHZ7c53q7akMpc", "unlimited": false, "use_buffer_percent": false}, "nnx6RVBrop9v7aZK": {"buffer_count": 76, "buffer_percent": 15, "max_count": 11, "min_count": 0, "name": "hbN15zfQSfQrtfF3", "unlimited": true, "use_buffer_percent": false}}, "regions": ["Q40kepEaC4dfiOMZ", "fEhHr39pysFO3Zvc", "1BZG99LyvfvHEsJK"], "session_timeout": 88, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"ZlAchob44lONDDwM": {"buffer_count": 44, "buffer_percent": 20, "max_count": 13, "min_count": 10, "name": "I0HlyPR7wZNiVsF6", "unlimited": true, "use_buffer_percent": false}, "mXEQdbzIVy8alncV": {"buffer_count": 21, "buffer_percent": 44, "max_count": 16, "min_count": 100, "name": "GG4vZFTYnPkmSu4P", "unlimited": true, "use_buffer_percent": false}, "MyOK06MqQBErxgjV": {"buffer_count": 57, "buffer_percent": 10, "max_count": 51, "min_count": 12, "name": "cvU4PbmRDcrg0DjQ", "unlimited": false, "use_buffer_percent": true}}, "regions": ["BECXvea7H1m2lJFR", "Z3ZprZ60zMjhTHeh", "94TSenE5hCFkIf5w"], "session_timeout": 8, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment '7l2Zsrh90ETtYmGu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '20' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'akncw7wu9TmXfJWB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 84, "mem_limit": 36, "params": "FgDnDkdZ9bpjb1td"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'A3QhjCMW64f4XhIj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '92' \
    --offset '24' \
    --q 'oTB2NMKtezapPr2Q' \
    --sortBy 'updatedAt' \
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