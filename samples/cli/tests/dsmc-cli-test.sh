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
echo "1..89"

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
    --body '{"artifactPath": "EAxcVpFrttufHIRd", "coreDumpEnabled": true, "image": "9UzVRiXbqlAw7r6W", "imageReplicationsMap": {"2ktQG0h5JAav5kRa": {"failure_code": "62WopBJHPtcDs8bB", "region": "ZLCXLx8bbgorQeFb", "status": "Q1g7qbPngUNB1vRo", "uri": "dwpzS6DaDpv8N7ZQ"}, "VqGj6oDLjWjkY1aX": {"failure_code": "lFcDtgOjchIua5tW", "region": "EIC32ogW7olvbTgr", "status": "hRTcPiSuL0Sly6XM", "uri": "4OI18mAQLnzjMf8G"}, "Z2WBZqxYG3aREAu2": {"failure_code": "D6QVKNCWP75TB0i7", "region": "pKxR8dl0zRVW4EZG", "status": "9m0XcgGVbMqSszE8", "uri": "GHavj7AorKsxwkos"}}, "namespace": "AVerXpc1C8XfwHuK", "patchVersion": "eb9l3rGN9A3sNm84", "persistent": false, "ulimitFileSize": 7, "version": "SoEAcBdW19m4eu6d"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "5tA5jUmiTqpyhPFd", "coreDumpEnabled": true, "dockerPath": "rhBRd8lDR6qVNPRZ", "image": "YdFLIAjGGJddVCvu", "imageSize": 40, "namespace": "vx5KQ7KYnIuMBvaO", "persistent": false, "ulimitFileSize": 23, "version": "u6Vpbsx5w8hqUI06"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "UpOXGSLmCVuHOPlL", "coreDumpEnabled": false, "dockerPath": "veabntBSxTeIv53H", "image": "GCiljvjKoyD6SCwG", "imageSize": 36, "namespace": "hFjkQsfCaTmt1d67", "patchVersion": "FXGk2s9Q0mPVo3tw", "persistent": true, "ulimitFileSize": 6, "uploaderFlag": "0MesTCf9x4rt69ln", "version": "a7qxNeIxPz6MbwL6"}' \
    > test.out 2>&1
eval_tap $? 6 'CreateImagePatch' test.out

#- 7 GetLowestInstanceSpec
./ng net.accelbyte.sdk.cli.Main dsmc getLowestInstanceSpec \
    > test.out 2>&1
eval_tap $? 7 'GetLowestInstanceSpec' test.out

#- 8 GetWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc getWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'GetWorkerConfig' test.out

#- 9 UpdateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": false, "ghost_worker": true, "manual_buffer_override": true, "zombie_worker": true}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": false, "ghost_worker": false, "manual_buffer_override": false, "zombie_worker": true}' \
    > test.out 2>&1
eval_tap $? 10 'CreateWorkerConfig' test.out

#- 11 GetConfig
./ng net.accelbyte.sdk.cli.Main dsmc getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetConfig' test.out

#- 12 CreateConfig
./ng net.accelbyte.sdk.cli.Main dsmc createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 78, "creation_timeout": 38, "default_version": "qYSYWytLPziZMdjx", "port": 6, "ports": {"d3IL5TAQ6iiPlSC2": 42, "EzfTD1ZBm3MqHcUm": 76, "8IHtrkmu0hpDDWVA": 22}, "protocol": "Qy4uZAAiE0mit9RG", "providers": ["CCHYzUOcEdscKHPE", "qgA8yu7Vk6Jt4Ymo", "s9Jcdos4fYcTVU6R"], "session_timeout": 56, "unreachable_timeout": 44}' \
    > test.out 2>&1
eval_tap $? 12 'CreateConfig' test.out

#- 13 DeleteConfig
./ng net.accelbyte.sdk.cli.Main dsmc deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteConfig' test.out

#- 14 UpdateConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 39, "creation_timeout": 58, "default_version": "0zYoMcHyCUEXlAvx", "port": 73, "protocol": "xozr6wfNPX2bOItR", "providers": ["MvqtlB2jJCSQT279", "ZZPYGu0rdlgdWyOt", "Xi3choQrpOsDBU5S"], "session_timeout": 9, "unreachable_timeout": 48}' \
    > test.out 2>&1
eval_tap $? 14 'UpdateConfig' test.out

#- 15 ClearCache
./ng net.accelbyte.sdk.cli.Main dsmc clearCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ClearCache' test.out

#- 16 GetAllDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeployment \
    --namespace "$AB_NAMESPACE" \
    --name 'pjChB3V0v52Dlym6' \
    --count '31' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'uQ23xoJ8aeCnaLpU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Kp44YUDjasWIPUvm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 8, "buffer_percent": 38, "configuration": "jtGeoyIPa8ZRrvjj", "enable_region_overrides": false, "extendable_session": false, "game_version": "PYgc2L4jk4Lo0LSP", "max_count": 92, "min_count": 31, "overrides": {"jTvhZNkSQ70D0H6B": {"buffer_count": 62, "buffer_percent": 22, "configuration": "KDpADz1x3poD3Qgb", "enable_region_overrides": false, "extendable_session": false, "game_version": "8c5csSovoqsZNBdt", "max_count": 9, "min_count": 13, "name": "NDUPVJf6c2Z0QZxf", "region_overrides": {"gPubTDIHrvqAThuw": {"buffer_count": 19, "buffer_percent": 90, "max_count": 89, "min_count": 25, "name": "HpKKTlmVr9XuoJbR", "unlimited": false, "use_buffer_percent": false}, "SKVPHbn4Xxtu7LQR": {"buffer_count": 62, "buffer_percent": 35, "max_count": 81, "min_count": 25, "name": "jEEztx1WsYSiZqan", "unlimited": false, "use_buffer_percent": false}, "5GI39YBHqaTHeKtW": {"buffer_count": 3, "buffer_percent": 64, "max_count": 18, "min_count": 66, "name": "ReVHQipcCx9Zw5D2", "unlimited": true, "use_buffer_percent": true}}, "regions": ["hGGSyEW4ZJJ42d3P", "BddN8S48l9lyNApf", "lxqMrj3oZk03QXcK"], "session_timeout": 79, "unlimited": false, "use_buffer_percent": true}, "BMr1yrOMlNFSrUEi": {"buffer_count": 36, "buffer_percent": 27, "configuration": "Gc26SaiGVkydwYWQ", "enable_region_overrides": false, "extendable_session": true, "game_version": "6yUZNmTBcvrbYCwZ", "max_count": 39, "min_count": 0, "name": "xFHyPLtI8ilbyDPU", "region_overrides": {"Ij88cekdqCt81P1k": {"buffer_count": 39, "buffer_percent": 82, "max_count": 11, "min_count": 52, "name": "Iovmv9gsR5cJcHm3", "unlimited": true, "use_buffer_percent": false}, "oRDFuuuySj29a9LJ": {"buffer_count": 63, "buffer_percent": 65, "max_count": 70, "min_count": 71, "name": "oRS1X2PFAAMwzHPx", "unlimited": true, "use_buffer_percent": false}, "1UskYs4Yw20DOqOB": {"buffer_count": 90, "buffer_percent": 17, "max_count": 59, "min_count": 98, "name": "2DKHRuPMMWH8Yb33", "unlimited": false, "use_buffer_percent": false}}, "regions": ["UBJCjfcnLRfxeCSz", "9WEi8KlloeH0JT1y", "duat2vQR3biBfsu4"], "session_timeout": 20, "unlimited": false, "use_buffer_percent": false}, "4EXsXzOXQAk4mqrx": {"buffer_count": 52, "buffer_percent": 40, "configuration": "TtuLl4XlbGL8QOxt", "enable_region_overrides": false, "extendable_session": false, "game_version": "zm8y2wNhmwoYZyI4", "max_count": 63, "min_count": 68, "name": "FZKBcYrCEAE7WIsf", "region_overrides": {"mx40NLRc6m8heKnW": {"buffer_count": 15, "buffer_percent": 51, "max_count": 4, "min_count": 11, "name": "6z3LNUj7fdgLA84Z", "unlimited": false, "use_buffer_percent": true}, "Yk6QEgJjBbEDoNf3": {"buffer_count": 27, "buffer_percent": 25, "max_count": 15, "min_count": 26, "name": "EoRCAcf80zfFyabW", "unlimited": true, "use_buffer_percent": false}, "q6hRkloqxM3gpwxc": {"buffer_count": 11, "buffer_percent": 79, "max_count": 18, "min_count": 51, "name": "yEW6GLbc0NaKDUL3", "unlimited": true, "use_buffer_percent": false}}, "regions": ["EN2VHzih3bit0VWn", "3CO39PXDNxtXgeO3", "FgkXhjDzaQY3snn2"], "session_timeout": 83, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"P7cFdP43e5dC9XIB": {"buffer_count": 43, "buffer_percent": 3, "max_count": 8, "min_count": 90, "name": "fZgrbHDIDm4hMzF4", "unlimited": true, "use_buffer_percent": true}, "odenSrUTvfqU0bfo": {"buffer_count": 79, "buffer_percent": 6, "max_count": 25, "min_count": 83, "name": "5cTtFWbotQyXJRcQ", "unlimited": true, "use_buffer_percent": false}, "vYmmDg7VYPXIuvUY": {"buffer_count": 93, "buffer_percent": 82, "max_count": 57, "min_count": 9, "name": "RujIUE1Tq5jyAZvk", "unlimited": true, "use_buffer_percent": false}}, "regions": ["MNFIurjh2imdb4rb", "kXj0ZwsVC0gL97ZV", "JSPqJiwv1qlYB1RS"], "session_timeout": 75, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'XVv8ZGF7uYnGzpip' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'NDigNJma1MbqqZtf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 100, "buffer_percent": 34, "configuration": "aolB4lkKB4EYOkQ1", "enable_region_overrides": false, "extendable_session": false, "game_version": "MD3cym8xIfkOVW2g", "max_count": 37, "min_count": 58, "regions": ["REOLx0KOww3HICQL", "fl7MUBG7qtPu64yA", "tURKLRkb738HGS6r"], "session_timeout": 61, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'XVG7tnsZg5QgXjvy' \
    --namespace "$AB_NAMESPACE" \
    --region 'GJPN4eXbJE5Vs2Gc' \
    --body '{"buffer_count": 51, "buffer_percent": 28, "max_count": 30, "min_count": 62, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'QoIXimBJehyxlNsj' \
    --namespace "$AB_NAMESPACE" \
    --region 'UgxBkF6wFPoJeQed' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'iogEhhM2rIizGdKv' \
    --namespace "$AB_NAMESPACE" \
    --region 'OPdq5xrgxSmy1DN9' \
    --body '{"buffer_count": 77, "buffer_percent": 32, "max_count": 65, "min_count": 59, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'DQyj4bj5Ro2ogaKt' \
    --namespace "$AB_NAMESPACE" \
    --version '2ujQSa3Zdb65UXmy' \
    --body '{"buffer_count": 17, "buffer_percent": 91, "configuration": "p6iIaTIKUkmkk9QM", "enable_region_overrides": true, "extendable_session": false, "game_version": "MA9ORxpzwLR2AK6e", "max_count": 59, "min_count": 95, "region_overrides": {"tX7W40V6Do5sYadC": {"buffer_count": 59, "buffer_percent": 49, "max_count": 65, "min_count": 4, "name": "rHHC3DpZxkrQDXuN", "unlimited": true, "use_buffer_percent": false}, "cqsuGKHhMRWLVd3D": {"buffer_count": 22, "buffer_percent": 23, "max_count": 16, "min_count": 85, "name": "LuIpomM8sm1MiaI1", "unlimited": false, "use_buffer_percent": true}, "ugBp3HBvepnDCjgy": {"buffer_count": 74, "buffer_percent": 21, "max_count": 24, "min_count": 100, "name": "e36mgWjLfFmteue9", "unlimited": false, "use_buffer_percent": true}}, "regions": ["zJ6fH24T805tVg8J", "qU0jZpjvsugAOS7u", "8RiWyerCSa8SRgws"], "session_timeout": 55, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'rIxsB0NRsB1fPqqR' \
    --namespace "$AB_NAMESPACE" \
    --version 'RulpqpymDkQhtrHW' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'wRVnwVBOqOHi8pWG' \
    --namespace "$AB_NAMESPACE" \
    --version 'd1juYhiqjRJOqB5F' \
    --body '{"buffer_count": 6, "buffer_percent": 57, "configuration": "zFQbJndUDpdONneA", "enable_region_overrides": false, "game_version": "VrjfGXZnqAQUoY1G", "max_count": 20, "min_count": 23, "regions": ["p2JZp50CnPb71ORY", "cmQbTU5JX8ccLjMX", "JRk0eaKQDOJvrTef"], "session_timeout": 12, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'Ss6g4iY9u02aCNYI' \
    --namespace "$AB_NAMESPACE" \
    --region 'Wekp18lOC3mNqF7B' \
    --version 'l0LcghVHfPEspxwh' \
    --body '{"buffer_count": 89, "buffer_percent": 89, "max_count": 84, "min_count": 80, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'bc1eMbEIjowLqc3e' \
    --namespace "$AB_NAMESPACE" \
    --region 'cjXJbZDKKoxLE1Y3' \
    --version 'Dymtj3giPg4x4yiP' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'X6ues1Hhhkg1yLVb' \
    --namespace "$AB_NAMESPACE" \
    --region 'LFzHEP8cM4NTwr0K' \
    --version 'HaAsmTej52WKi6tA' \
    --body '{"buffer_count": 35, "buffer_percent": 1, "max_count": 55, "min_count": 46, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'plCSVq8PdH6hJPUA' \
    --namespace "$AB_NAMESPACE" \
    --version 'c0RVwXgAgntLMCua' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '30' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'V9Lx5RDA1l2Xcrci' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'YNEzvSZIPkhSgORc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 53, "mem_limit": 83, "params": "5S5BvmgBLxh4ijFn"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'E3Tam69qSZ7PC6f6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'QkmZXElW9YfRSse6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 54, "mem_limit": 60, "name": "Az3S4czz0QKFlAVm", "params": "VLu4AOec0z8eBeeo"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'ip68J1nsv4W2OJht' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 0}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '41IslKHzGlLKWUtD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'Qs61OQAoxyyQpRWC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "iiPDGQhNPEwiJCf2", "port": 40}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'JVrlzqQls1ozhLVA' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '36' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'BvvWm4udE0OXudXg' \
    --version 'Nne8kJATwlc6esUp' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImage' test.out

#- 41 GetImageLimit
./ng net.accelbyte.sdk.cli.Main dsmc getImageLimit \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'GetImageLimit' test.out

#- 42 DeleteImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc deleteImagePatch \
    --namespace "$AB_NAMESPACE" \
    --imageURI '6Sw1I98jeZQ7hfxn' \
    --version 'hLd3Knaknoed9DHh' \
    --versionPatch 'LOqQGhCUr6iTrjyE' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'garAdNJOIG36I6tR' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'bRcrEveMdAdiPKDU' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'VSC00PYeDcagginx' \
    --versionPatch 'nFIna3yddcbsPheT' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 69, "DeploymentName": "CohViHA5CzgFSy8X", "JobCount": 69, "JobPriority": 54, "OverrideVersion": "CuESOiIZsMfB4ZH3", "Region": "mtgWgU4pCAKxeE70"}' \
    > test.out 2>&1
eval_tap $? 46 'AddBuffer' test.out

#- 47 GetRepository
./ng net.accelbyte.sdk.cli.Main dsmc getRepository \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetRepository' test.out

#- 48 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'CaunQNxot371W9G4' \
    --count '54' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 48 'ListServer' test.out

#- 49 CountServer
./ng net.accelbyte.sdk.cli.Main dsmc countServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'CountServer' test.out

#- 50 CountServerDetailed
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailed \
    --namespace "$AB_NAMESPACE" \
    --region 'vQkqsGnmyo5JJTUV' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'mb8GEXFTlEMEsFzY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'qwgK1Np5nodqpLm7' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'FhJBNXzAFdO0Khqf' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '6kiTdSGv2LFjAKY7' \
    --withServer  \
    --count '58' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'bgsWqFWZX7kPBom8' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'F9GLLTG8phc3n4iL' \
    > test.out 2>&1
eval_tap $? 57 'DeleteSession' test.out

#- 58 RunGhostCleanerRequestHandler
./ng net.accelbyte.sdk.cli.Main dsmc runGhostCleanerRequestHandler \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'RunGhostCleanerRequestHandler' test.out

#- 59 RunZombieCleanerRequestHandler
./ng net.accelbyte.sdk.cli.Main dsmc runZombieCleanerRequestHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"JobCount": 29, "Region": "AG9YI89hmguB8FOT", "TimeoutSecond": 20, "ZombieCount": 67}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "MLo4b9rIzqYkEpst", "repository": "yVTBcrM8rG0rH0zc"}' \
    > test.out 2>&1
eval_tap $? 60 'CreateRepository' test.out

#- 61 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'ExportConfigV1' test.out

#- 62 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 62 'ImportConfigV1' test.out

#- 63 GetAllDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeploymentClient \
    --namespace "$AB_NAMESPACE" \
    --name 'swwVeMK6MbGIVIu8' \
    --count '43' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'vwLc7KY3uVoJXTIM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'tpgkieDyF97lGdMi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 32, "buffer_percent": 3, "configuration": "d6FJtHJ1pyVwyKQL", "enable_region_overrides": false, "extendable_session": true, "game_version": "nOpas6ghP1y4Zi7s", "max_count": 69, "min_count": 87, "overrides": {"qffnrfsGlfPaZKBw": {"buffer_count": 1, "buffer_percent": 42, "configuration": "3Ddb60ufPpzwj1QG", "enable_region_overrides": true, "extendable_session": false, "game_version": "fHkIySok5DiXZtLW", "max_count": 45, "min_count": 14, "name": "rGysryod3dNQrmsA", "region_overrides": {"pRA6HX3RwrKt2eco": {"buffer_count": 53, "buffer_percent": 77, "max_count": 28, "min_count": 93, "name": "EhoXmM2W7l6jHMA2", "unlimited": true, "use_buffer_percent": false}, "3nakopAywelu01nr": {"buffer_count": 50, "buffer_percent": 42, "max_count": 62, "min_count": 38, "name": "J0NqoTow0qiOiC4j", "unlimited": false, "use_buffer_percent": false}, "XqKhTPkwfLM9uSyb": {"buffer_count": 89, "buffer_percent": 27, "max_count": 51, "min_count": 20, "name": "Wek2gZvRrvr0n9d9", "unlimited": false, "use_buffer_percent": false}}, "regions": ["vccKMLhrTrcBE2It", "BS3KtKZWe8aoFzAy", "BME74HUtipUWYhWV"], "session_timeout": 32, "unlimited": true, "use_buffer_percent": false}, "x8CzPML52faXUr9S": {"buffer_count": 21, "buffer_percent": 26, "configuration": "4lq2faBcAXXKlhvy", "enable_region_overrides": false, "extendable_session": true, "game_version": "8G5MlfDTk8aG40Nl", "max_count": 27, "min_count": 5, "name": "47fH0XrKEDpEY8Vn", "region_overrides": {"ocGAjci0V3tBf2jn": {"buffer_count": 68, "buffer_percent": 39, "max_count": 67, "min_count": 99, "name": "KXphn50c9tNLDljh", "unlimited": false, "use_buffer_percent": true}, "xLRX3z46OCaGBeMf": {"buffer_count": 85, "buffer_percent": 42, "max_count": 22, "min_count": 80, "name": "s6w3VifnKqmTSoGH", "unlimited": true, "use_buffer_percent": false}, "mEu0q1p6QCyY6vSk": {"buffer_count": 98, "buffer_percent": 55, "max_count": 65, "min_count": 83, "name": "WdsbYuVEGVxYheR3", "unlimited": false, "use_buffer_percent": false}}, "regions": ["5mNZ6vwv7K8Asvt1", "j1Rx59hesNWy2NvZ", "85DDKDAF8KDsBZOu"], "session_timeout": 88, "unlimited": true, "use_buffer_percent": true}, "3BAHZ7c53q7akMpc": {"buffer_count": 26, "buffer_percent": 4, "configuration": "nnx6RVBrop9v7aZK", "enable_region_overrides": false, "extendable_session": false, "game_version": "65hbN15zfQSfQrtf", "max_count": 64, "min_count": 9, "name": "3TQN0OcNDLr36vzo", "region_overrides": {"hZyjMQAg5mPYhrLT": {"buffer_count": 50, "buffer_percent": 65, "max_count": 95, "min_count": 82, "name": "8OhgfY9JQYGF4bYX", "unlimited": true, "use_buffer_percent": true}, "cENx9xZlAchob44l": {"buffer_count": 84, "buffer_percent": 4, "max_count": 82, "min_count": 61, "name": "p7FUjfIGaffoflEI", "unlimited": true, "use_buffer_percent": false}, "yYqeKN0meGelYF5w": {"buffer_count": 100, "buffer_percent": 50, "max_count": 1, "min_count": 60, "name": "alncV7vWgSHdfo07", "unlimited": false, "use_buffer_percent": false}}, "regions": ["tPErqxyMyOK06MqQ", "BErxgjVBycvU4Pbm", "RDcrg0DjQjBECXve"], "session_timeout": 0, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"EiwxxElpMYSWIeVz": {"buffer_count": 25, "buffer_percent": 15, "max_count": 93, "min_count": 51, "name": "Heh94TSenE5hCFkI", "unlimited": false, "use_buffer_percent": true}, "VN4ZONJREdUQ3z9F": {"buffer_count": 56, "buffer_percent": 61, "max_count": 48, "min_count": 93, "name": "NNgnke4akncw7wu9", "unlimited": false, "use_buffer_percent": true}, "XfJWBPrx9Ns8eLzY": {"buffer_count": 62, "buffer_percent": 32, "max_count": 43, "min_count": 18, "name": "wSWTaLQjctvrK2jh", "unlimited": true, "use_buffer_percent": false}}, "regions": ["pKPlXn77AtYoFzLA", "ATPY8P8P3cfoivvQ", "xevecWw7Rry0KK5r"], "session_timeout": 12, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'GO0dW8rX2MVUGKSZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '67' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'cLkt4pK32sJxlZcC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 94, "mem_limit": 0, "params": "pTdRtCHvuk6B6XTm"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'SLyn50sigBVZxiKd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '97' \
    --offset '48' \
    --q '57GvRyd9UuL02Le8' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 70 'ListImagesClient' test.out

#- 71 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'ImageLimitClient' test.out

#- 72 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'CslsDd4M1F5qRIbl' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'S7Nz81GRazPAANjf' \
    --count '56' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'oldFOyqA2clJ5gEO' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "aCgM6Yn6RugbNEIp"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "GBFUjOn5mM7k8nbL"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "zvtCIW5ynMKquUic", "ip": "AeIVXtoWAXhMlW4t", "name": "LqX7OICf5oD1e6oI", "port": 11}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "FmYel0kOw72o8Zkg", "pod_name": "k0jS6rDWUwfhKvrf"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "lxHv8SwyagYvDJ3w"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName '3UNgIGj2jZtEYT8s' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'IPSE1XXPzySa0sZo' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "FS6xCOWMpyh9pMsQ", "configuration": "gb64ELbzDMwyo4nI", "deployment": "RysQdbufXjYnSoIF", "game_mode": "eouC2m38kXrDZWlG", "matching_allies": [{"matching_parties": [{"party_attributes": {"VE9sJ4NpUtKp6M9I": {}, "6nEwnZhsjwJeGwaP": {}, "SDMZz95OYKiqaZD6": {}}, "party_id": "3xe5rruJVfLGea0Z", "party_members": [{"user_id": "tlzUcuHAXz0UV31M"}, {"user_id": "fuGaXsAuGsZaSHev"}, {"user_id": "O0TQNEI3kfabxJWW"}]}, {"party_attributes": {"SI1ECUo1NPpeFhUz": {}, "tXDgB7n4C97uAPP8": {}, "PATLpUpxeJlsBJT6": {}}, "party_id": "Hh3OMjAjq2mK8lbS", "party_members": [{"user_id": "EEelxnb5QxWG2HFn"}, {"user_id": "ZlA6HKWW4fI1IQco"}, {"user_id": "BQELcNlZkqTZrKgX"}]}, {"party_attributes": {"Nwvm4e5GX6H742Oi": {}, "xhtAoKiVm6URT95X": {}, "hnUcvWB28Mpusuhh": {}}, "party_id": "DJ5slzgiWZEtyd56", "party_members": [{"user_id": "LfxnbY97jjYgXchC"}, {"user_id": "bkXX26uEdCfQaMAQ"}, {"user_id": "uTKfC0I2kNjCMDtD"}]}]}, {"matching_parties": [{"party_attributes": {"Mrentgn3DhqciwIe": {}, "ShF9RKb9vvxuJlhX": {}, "bWhbwPwToC6knjVw": {}}, "party_id": "VnzaqSfJiQFC2gXo", "party_members": [{"user_id": "da0kg16yUSpSOAjH"}, {"user_id": "JWwfCjYwWkLob9gK"}, {"user_id": "Lqs2nEZhpByfHZin"}]}, {"party_attributes": {"xNfgPAwkMBsznlBU": {}, "qnLT4AbGptKaWNvP": {}, "bpg7yrRvXfZ6rvgv": {}}, "party_id": "EY3Hht1SwqTsKKKo", "party_members": [{"user_id": "37NHDOQe91Ps3ztU"}, {"user_id": "IV0dS6hIH9c4Vfky"}, {"user_id": "rwpuXxbaERbfgPmi"}]}, {"party_attributes": {"0eHkt1mr9EOIFg0d": {}, "nWIYN2NVL70Iw157": {}, "g00jr9b8MuYmmeKT": {}}, "party_id": "mBNvGYxEQdf3ewoG", "party_members": [{"user_id": "GoY7xmFNAmjDDCvs"}, {"user_id": "78mcMdiS76YApGJ9"}, {"user_id": "ufwLYkqIgLuZS6hs"}]}]}, {"matching_parties": [{"party_attributes": {"QryiEtOAbpeUNf26": {}, "UqkCfgCUYBn2xaOB": {}, "dPF0JmX8qwU1cTuH": {}}, "party_id": "HPB5S3DvPRCzBrVU", "party_members": [{"user_id": "xmDOj3cvRFaTC11W"}, {"user_id": "0TGTCm4fZWuk6pQx"}, {"user_id": "DQpKqxLGeMvr9Tsv"}]}, {"party_attributes": {"cMQ7dBsaIecRxIsZ": {}, "vD6rmzVr5XT1Nxw0": {}, "v1dMQ9Rrbk6C2cVW": {}}, "party_id": "f6ttvbU1PO6ApCD2", "party_members": [{"user_id": "VXidT7w0Oc15N8WX"}, {"user_id": "BPp17PAewqSm5x3B"}, {"user_id": "4t7WQnp8jXZedgt5"}]}, {"party_attributes": {"cyNe27HLtwtVOaxg": {}, "P6Jbct8puMybYGxD": {}, "9IPmmsLmu3kaPj0O": {}}, "party_id": "4zd8Tb7cUNGPTBxi", "party_members": [{"user_id": "FFCrn7djjs69FTFV"}, {"user_id": "GUVhvKhJCmeisql1"}, {"user_id": "4mUHVbMPimNhcZsU"}]}]}], "namespace": "3VAdMDcb4qlkiFAa", "notification_payload": {}, "pod_name": "mqvZI2KwjqPBiWXa", "region": "de41s3rH34mB2yPl", "session_id": "RpWjmHZAAvKTH8Mu"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "qIg0CzkguwuJCW7E", "matching_allies": [{"matching_parties": [{"party_attributes": {"EFB67AODbi9BzupB": {}, "sFpYc77GtRUcCFeY": {}, "5g4XgBsbfzqxBPNe": {}}, "party_id": "8ae1Il4aAtEbu4Ij", "party_members": [{"user_id": "GdqthRxTjQ7gkZEY"}, {"user_id": "8rG0q0Q2Qd2JzRbk"}, {"user_id": "F2I03dIjvBbA6bfb"}]}, {"party_attributes": {"YaJCJjfk2TUvn95F": {}, "hO7VW3mbDVMDu87t": {}, "0ldWf7iSGIiKFtWt": {}}, "party_id": "n4Yr2svKM6pqLGZ0", "party_members": [{"user_id": "TBujELAUK6mQ5iZg"}, {"user_id": "bwwm5iGzXtcknrgi"}, {"user_id": "dKupvXO6aj4hCmTC"}]}, {"party_attributes": {"34jxW4pIDwdqXpmR": {}, "mut9H9XyWI8bp8fQ": {}, "xRuX91uYmtrHJbEG": {}}, "party_id": "TUj7YjERL1rEQG02", "party_members": [{"user_id": "zccA8wvLsWUNd6lP"}, {"user_id": "KvqDejvqklTSvDwu"}, {"user_id": "OrP9lzpiX0VuFpZu"}]}]}, {"matching_parties": [{"party_attributes": {"m7izxe7NPzjOa8E7": {}, "wY76PxLv9HBEUe89": {}, "AwEw1HO4FnKtx4XL": {}}, "party_id": "KAmlDr19uJ3nq6Ve", "party_members": [{"user_id": "rzVCcI8y3Cz0YqCK"}, {"user_id": "Uh5RD9vNAp4jinFp"}, {"user_id": "nQ5xF9wwbvMZyeDe"}]}, {"party_attributes": {"RnVfPUa6xVVBcq3w": {}, "ZpFIYeAg79HcLJXJ": {}, "7mpVI6eTYAjdPlCi": {}}, "party_id": "QQC35cj4KyOVgvnW", "party_members": [{"user_id": "bfRJtsB7cUQZ2QUA"}, {"user_id": "xJrINPXppPNO3Afm"}, {"user_id": "XcgwC3IN6tvKgLB9"}]}, {"party_attributes": {"QmJIOq9dP5szG71u": {}, "tjsQ4CrRb9gUCeVz": {}, "7fWbZIdhevfZvyV7": {}}, "party_id": "AcodcZwKjYDdmJOl", "party_members": [{"user_id": "zwm9Su4FnS98Qqft"}, {"user_id": "Sjq7sn8yreciPLfk"}, {"user_id": "VyyJsbGpO6JgehDJ"}]}]}, {"matching_parties": [{"party_attributes": {"xEN7JlZc8LMq1o2j": {}, "ZWu4yA3r0u4q1bTH": {}, "XIjfJKyFlM0u1uuo": {}}, "party_id": "Vdn9yVoSlKNchPHN", "party_members": [{"user_id": "L4X3LLaGPGdqLE8S"}, {"user_id": "ohhhuiTnJarYYkHB"}, {"user_id": "DdSzBXdxapwhd5IQ"}]}, {"party_attributes": {"YBQuxLvPuWYvE3fs": {}, "Ny9Z9OhxXvCp9y7f": {}, "LD2qfCXnlUnqxT1W": {}}, "party_id": "sRNMZcA92hzC7MNa", "party_members": [{"user_id": "8vVe4MHX6AgMep90"}, {"user_id": "AyyUJyAK5PRMRMwd"}, {"user_id": "vl0hv6g62GxBW2tQ"}]}, {"party_attributes": {"F5tkTjgJaMYvNQOs": {}, "Da4bkcgepqtxjbrz": {}, "tee7QLTGAak7Kaol": {}}, "party_id": "01DK97D2xnik42mi", "party_members": [{"user_id": "teR5eQAe1rzmmgqB"}, {"user_id": "PRmd6mO4oI8KDqeb"}, {"user_id": "m83raNBJ5y7axEkv"}]}]}], "namespace": "I4oxZEDxGiBnNbn0", "notification_payload": {}, "session_id": "zaf7CaOSlHXrUSA6"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'sMJzA5mtqISQ83TT' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'btefXWznDe4LQdXf' \
    > test.out 2>&1
eval_tap $? 85 'CancelSession' test.out

#- 86 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 86 'GetDefaultProvider' test.out

#- 87 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 87 'ListProviders' test.out

#- 88 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region 'FBii2RAMEX5RMjBF' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE