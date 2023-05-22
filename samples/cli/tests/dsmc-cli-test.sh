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
echo "1..81"

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
    --body '{"artifactPath": "IC32ogW7olvbTgrh", "dockerPath": "RTcPiSuL0Sly6XM4", "image": "OI18mAQLnzjMf8GZ", "imageSize": 0, "namespace": "WBZqxYG3aREAu2D6", "patchVersion": "QVKNCWP75TB0i7pK", "persistent": true, "uploaderFlags": [{"name": "c8OumKtPDKJDXn7Z", "shorthand": "4U68su8XfqlqNiTv", "value": "B6SdAdIhUDrwoZ5M"}, {"name": "ecdKi5r6QEa1ysLE", "shorthand": "zth6mXhzkzWkFeZS", "value": "oEAcBdW19m4eu6d5"}, {"name": "tA5jUmiTqpyhPFdx", "shorthand": "LzFQN05MYzYiKWe5", "value": "dNRljv7IPrDQQRga"}], "version": "t0SevkLGMS0lyuI9"}' \
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
    --body '{"claim_timeout": 0, "creation_timeout": 71, "default_version": "llzQRaT5kPxUfofv", "port": 28, "ports": {"6UpOXGSLmCVuHOPl": 78, "NveabntBSxTeIv53": 68, "oYupD391C2qtPYok": 1}, "protocol": "rncqmLtjQHAf8Tgo", "providers": ["Nm03VLisV6zwPuo3", "td6TC6I3lMjGSWN2", "laRlxfcjHfYakUCT"], "session_timeout": 33, "unreachable_timeout": 67}' \
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
    --body '{"claim_timeout": 70, "creation_timeout": 21, "default_version": "Y69z1UaLqYSYWytL", "port": 85, "protocol": "Q0yYoNRKd3IL5TAQ", "providers": ["6iiPlSC2uE4o5Vwd", "o3fePqIJA8IHtrkm", "u0hpDDWVAla2l5BY"], "session_timeout": 81, "unreachable_timeout": 18}' \
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
    --name 'tIuS5S5XUdjsoqwG' \
    --count '49' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'zzWi9gwQYv7t1o7T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Tr1DmrhZv15T7quI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 5, "buffer_percent": 57, "configuration": "TVU6RBt0zYoMcHyC", "enable_region_overrides": false, "extendable_session": true, "game_version": "BFmaLoxozr6wfNPX", "max_count": 79, "min_count": 3, "overrides": {"NW5NyLu0M3VHh2EI": {"buffer_count": 94, "buffer_percent": 72, "configuration": "279ZZPYGu0rdlgdW", "enable_region_overrides": true, "extendable_session": false, "game_version": "OtXi3choQrpOsDBU", "max_count": 92, "min_count": 11, "name": "epjChB3V0v52Dlym", "region_overrides": {"6puQ23xoJ8aeCnaL": {"buffer_count": 31, "buffer_percent": 22, "max_count": 96, "min_count": 16, "name": "Kp44YUDjasWIPUvm", "unlimited": true, "use_buffer_percent": false}, "sDr6kILsSSyDdmyk": {"buffer_count": 26, "buffer_percent": 29, "max_count": 17, "min_count": 84, "name": "l35MXbN9oCMNqq98", "unlimited": false, "use_buffer_percent": false}, "f4IxjUkl535X3ate": {"buffer_count": 62, "buffer_percent": 22, "max_count": 75, "min_count": 39, "name": "DpADz1x3poD3Qgb3", "unlimited": false, "use_buffer_percent": false}}, "regions": ["c5csSovoqsZNBdte", "9NDUPVJf6c2Z0QZx", "fgPubTDIHrvqAThu"], "session_timeout": 45, "unlimited": true, "use_buffer_percent": false}, "RmDnyeFoF7VSZ6pf": {"buffer_count": 89, "buffer_percent": 44, "configuration": "FQSKVPHbn4Xxtu7L", "enable_region_overrides": true, "extendable_session": true, "game_version": "ENjEEztx1WsYSiZq", "max_count": 1, "min_count": 27, "name": "Hn5GI39YBHqaTHeK", "region_overrides": {"tW18iGeUlc9d9sog": {"buffer_count": 100, "buffer_percent": 0, "max_count": 46, "min_count": 61, "name": "CKNS0GqVvUfHQvsH", "unlimited": false, "use_buffer_percent": false}, "3PBddN8S48l9lyNA": {"buffer_count": 31, "buffer_percent": 81, "max_count": 10, "min_count": 20, "name": "lxqMrj3oZk03QXcK", "unlimited": false, "use_buffer_percent": true}, "BMr1yrOMlNFSrUEi": {"buffer_count": 36, "buffer_percent": 27, "max_count": 68, "min_count": 20, "name": "c26SaiGVkydwYWQG", "unlimited": true, "use_buffer_percent": true}}, "regions": ["yUZNmTBcvrbYCwZt", "xFHyPLtI8ilbyDPU", "Ij88cekdqCt81P1k"], "session_timeout": 39, "unlimited": false, "use_buffer_percent": true}, "Iovmv9gsR5cJcHm3": {"buffer_count": 91, "buffer_percent": 77, "configuration": "2k6YmJFfRByjlBiu", "enable_region_overrides": true, "extendable_session": false, "game_version": "oVk8T3GpAnkCmBUq", "max_count": 12, "min_count": 96, "name": "SCnqntX9y1aZSWMi", "region_overrides": {"Vi10sG6vxkfUcmqR": {"buffer_count": 89, "buffer_percent": 93, "max_count": 4, "min_count": 5, "name": "UBJCjfcnLRfxeCSz", "unlimited": true, "use_buffer_percent": false}, "Ei8KlloeH0JT1ydu": {"buffer_count": 0, "buffer_percent": 39, "max_count": 48, "min_count": 43, "name": "9WT0GfH2rtOa4EXs", "unlimited": true, "use_buffer_percent": true}, "1yEkLgh3tIYt4SqY": {"buffer_count": 95, "buffer_percent": 93, "max_count": 77, "min_count": 22, "name": "Dx9gIiDandpGT2t2", "unlimited": false, "use_buffer_percent": false}}, "regions": ["mwoYZyI4EFZKBcYr", "CEAE7WIsfmx40NLR", "c6m8heKnWhzfe2Nu"], "session_timeout": 3, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"oKFeIaFQCYoDPICp": {"buffer_count": 27, "buffer_percent": 14, "max_count": 6, "min_count": 73, "name": "uEEQlULdJz4mnRBk", "unlimited": true, "use_buffer_percent": false}, "xvvKgAT8mJrYq6hR": {"buffer_count": 21, "buffer_percent": 71, "max_count": 23, "min_count": 30, "name": "7A68eaqC2J9jyEW6", "unlimited": false, "use_buffer_percent": false}, "5YbsKoADkzJEN2VH": {"buffer_count": 51, "buffer_percent": 6, "max_count": 17, "min_count": 87, "name": "h3bit0VWn3CO39PX", "unlimited": true, "use_buffer_percent": true}}, "regions": ["xtXgeO3FgkXhjDza", "QY3snn2ZkP7cFdP4", "3e5dC9XIBudfZgrb"], "session_timeout": 70, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'wrAP2aMlu7WtjCto' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'YetOO847g8OudOfj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 40, "buffer_percent": 59, "configuration": "FWbotQyXJRcQWsmq", "enable_region_overrides": false, "extendable_session": false, "game_version": "s92epxk0i8VxsZNe", "max_count": 35, "min_count": 42, "regions": ["eSvf9699mCEHThUJ", "kETAsSp7gh4TeUTk", "OkAYfJB8AT9t4Tv2"], "session_timeout": 73, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'iwv1qlYB1RSKs6gQ' \
    --namespace "$AB_NAMESPACE" \
    --region 'xC3Gb7S0o4zGYY7K' \
    --body '{"buffer_count": 87, "buffer_percent": 82, "max_count": 70, "min_count": 72, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'a1MbqqZtfNWql4nm' \
    --namespace "$AB_NAMESPACE" \
    --region 'wAft4gqkNNlWkD9e' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'OziYRFOn0jJLHC9L' \
    --namespace "$AB_NAMESPACE" \
    --region 'xhvNXTwGBCtohLtl' \
    --body '{"buffer_count": 79, "buffer_percent": 95, "max_count": 42, "min_count": 56, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment '7qtPu64yAtURKLRk' \
    --namespace "$AB_NAMESPACE" \
    --version 'b738HGS6rDgMdIIl' \
    --body '{"buffer_count": 15, "buffer_percent": 39, "configuration": "S1fSiM9331m7Ta1P", "enable_region_overrides": true, "extendable_session": false, "game_version": "Kc50Kv6ecnEevcAx", "max_count": 25, "min_count": 74, "region_overrides": {"BJehyxlNsjUgxBkF": {"buffer_count": 100, "buffer_percent": 47, "max_count": 27, "min_count": 66, "name": "bdSJtjX7ZshZyZl5", "unlimited": true, "use_buffer_percent": false}, "bRXBHUTrDzZSKscf": {"buffer_count": 82, "buffer_percent": 51, "max_count": 5, "min_count": 61, "name": "u3dpCROYqUiGKXVF", "unlimited": true, "use_buffer_percent": false}, "o2ogaKt2ujQSa3Zd": {"buffer_count": 4, "buffer_percent": 87, "max_count": 32, "min_count": 82, "name": "UXmy0Zp6iIaTIKUk", "unlimited": false, "use_buffer_percent": false}}, "regions": ["kk9QM0NBMA9ORxpz", "wLR2AK6eXUGPJsw1", "fiP80G9Pclxcft2u"], "session_timeout": 23, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'JzPyrVEiOG4Ucqsu' \
    --namespace "$AB_NAMESPACE" \
    --version 'GKHhMRWLVd3DlhLu' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'IpomM8sm1MiaI1mX' \
    --namespace "$AB_NAMESPACE" \
    --version '2tJoARtdbBe7udsM' \
    --body '{"buffer_count": 36, "buffer_percent": 49, "configuration": "ok0WvGYYnx4V709x", "enable_region_overrides": false, "game_version": "ue9nzJ6fH24T805t", "max_count": 98, "min_count": 44, "regions": ["g8JqU0jZpjvsugAO", "S7u8RiWyerCSa8SR", "gwsAj1ik1jglaDXT"], "session_timeout": 45, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'qRRulpqpymDkQhtr' \
    --namespace "$AB_NAMESPACE" \
    --region 'HWwRVnwVBOqOHi8p' \
    --version 'WGd1juYhiqjRJOqB' \
    --body '{"buffer_count": 64, "buffer_percent": 6, "max_count": 57, "min_count": 52, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'YbCtmKy8M9zVrjfG' \
    --namespace "$AB_NAMESPACE" \
    --region 'XZnqAQUoY1GjlIIk' \
    --version '0iKoTTS1j02o7JjT' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'XAQN0qdskdQV0TqI' \
    --namespace "$AB_NAMESPACE" \
    --region '8EFnmDbxIxi4YKlO' \
    --version 'Nk2Q5Y4Jvaizwiil' \
    --body '{"buffer_count": 1, "buffer_percent": 21, "max_count": 39, "min_count": 32, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '22' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'OC3mNqF7Bl0LcghV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'HfPEspxwhRON0bc1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 9, "mem_limit": 17, "params": "MbEIjowLqc3ecjXJ"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'bZDKKoxLE1Y3Dymt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'j3giPg4x4yiPX6ue' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 39, "mem_limit": 39, "name": "Hhhkg1yLVbLFzHEP", "params": "8cM4NTwr0KHaAsmT"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'ej52WKi6tArAURt9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 32}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'FJvJBWic7UkBeIXu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'qDuAXI66bQ71w0de' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "oV9Lx5RDA1l2Xcrc", "port": 17}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'ncUZGCHsZYoLfR1K' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '83' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'S5BvmgBLxh4ijFnE' \
    --version '3Tam69qSZ7PC6f6Q' \
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
    --imageURI 'kmZXElW9YfRSse6A' \
    --version 'Az3S4czz0QKFlAVm' \
    --versionPatch 'VLu4AOec0z8eBeeo' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'ip68J1nsv4W2OJht' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'afxMSJlHeb34sZKH' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'cl5LLLOexL4fZvWt' \
    --versionPatch 'ND2tcBFpX8lNtFEJ' \
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
    --region '7tnkY6Mca5afj12K' \
    --count '53' \
    --offset '71' \
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
    --region '3kE8jKvgatOEBM70' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'TdlNBJYOmpu1VCar' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'zBsV6xnZ5Jrzzjrc' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'aug6CWVG8SWP3glU' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '6muswVJnNnN7kAa7' \
    --withServer  \
    --count '18' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '0riFc5HTHQIoVsGo' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '7dwV9DBqFKHQkETJ' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "yTlUrwDTnoujQD4I", "repository": "EiH9Z5qXn3aoRtlq"}' \
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
    --name 'OECohViHA5CzgFSy' \
    --count '1' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'A3PrIfapq5AAeMe4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 39, "buffer_percent": 26, "configuration": "gWgU4pCAKxeE70Ca", "enable_region_overrides": true, "extendable_session": false, "game_version": "IZxiXNMR9BgaWcFX", "max_count": 34, "min_count": 92, "overrides": {"sGnmyo5JJTUVmb8G": {"buffer_count": 62, "buffer_percent": 46, "configuration": "XFTlEMEsFzYqwgK1", "enable_region_overrides": false, "extendable_session": false, "game_version": "cVTd4BxqGWV6mTJ0", "max_count": 37, "min_count": 54, "name": "Qs6XNbjvqhnUVLWu", "region_overrides": {"8olKdxL6ozRmDD0j": {"buffer_count": 72, "buffer_percent": 43, "max_count": 24, "min_count": 11, "name": "kPBom8F9GLLTG8ph", "unlimited": false, "use_buffer_percent": true}, "3n4iLoIllKlpO2pq": {"buffer_count": 17, "buffer_percent": 57, "max_count": 74, "min_count": 65, "name": "F3WGRaoQomSJC4Dd", "unlimited": true, "use_buffer_percent": false}, "KF7SUQPLG59e0k5Z": {"buffer_count": 39, "buffer_percent": 52, "max_count": 5, "min_count": 37, "name": "wK7PpUlcIW32iK7M", "unlimited": true, "use_buffer_percent": true}}, "regions": ["wLc7KY3uVoJXTIMt", "pgkieDyF97lGdMiH", "KxbWCYzo8yO2KTK9"], "session_timeout": 39, "unlimited": false, "use_buffer_percent": false}, "Y6FEO65Rb3z7CYLM": {"buffer_count": 16, "buffer_percent": 70, "configuration": "7s7QBlk44Z44B1GZ", "enable_region_overrides": false, "extendable_session": true, "game_version": "g4uKxaCgcGLuC3br", "max_count": 99, "min_count": 86, "name": "dTYCfHkIySok5DiX", "region_overrides": {"ZtLW87rGysryod3d": {"buffer_count": 82, "buffer_percent": 86, "max_count": 43, "min_count": 35, "name": "iLvtEk4mTIpUA9gx", "unlimited": false, "use_buffer_percent": false}, "8SV38nEhoXmM2W7l": {"buffer_count": 19, "buffer_percent": 29, "max_count": 70, "min_count": 78, "name": "MA2rG3nakopAywel", "unlimited": true, "use_buffer_percent": true}, "1nryEJ0NqoTow0qi": {"buffer_count": 82, "buffer_percent": 11, "max_count": 17, "min_count": 30, "name": "C4j0iktm0ZPLkLOs", "unlimited": true, "use_buffer_percent": true}}, "regions": ["0LZ5njN86Hl8kUXz", "t6bSc6bWvgpVyW9d", "D1kOmvrAejcq2Lgk"], "session_timeout": 87, "unlimited": false, "use_buffer_percent": true}, "oFzAyBME74HUtipU": {"buffer_count": 100, "buffer_percent": 36, "configuration": "YhWV1qx8CzPML52f", "enable_region_overrides": false, "extendable_session": false, "game_version": "XUr9Sk4lq2faBcAX", "max_count": 3, "min_count": 75, "name": "ngJOUn18G5MlfDTk", "region_overrides": {"8aG40NlncceIZSwg": {"buffer_count": 55, "buffer_percent": 62, "max_count": 70, "min_count": 61, "name": "kgzh4pTU0Am4DZhl", "unlimited": true, "use_buffer_percent": false}, "Bf2jnHGKXphn50c9": {"buffer_count": 40, "buffer_percent": 85, "max_count": 80, "min_count": 64, "name": "LDljhZ2jxLRX3z46", "unlimited": true, "use_buffer_percent": true}, "5BUXvjcu2s6w3Vif": {"buffer_count": 28, "buffer_percent": 35, "max_count": 74, "min_count": 63, "name": "qmTSoGH1XEfY6QAY", "unlimited": false, "use_buffer_percent": true}}, "regions": ["6WQ5UBEU1QAOHfZi", "GhxOdcuDXSxSc3aZ", "PV87pna08gxefTYK"], "session_timeout": 16, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"hesNWy2NvZ85DDKD": {"buffer_count": 54, "buffer_percent": 8, "max_count": 65, "min_count": 82, "name": "8KDsBZOuYQJ03BAH", "unlimited": true, "use_buffer_percent": false}, "Hccee9GXhKcjmSEw": {"buffer_count": 6, "buffer_percent": 56, "max_count": 35, "min_count": 36, "name": "kEnnqKzFsLfYalUl", "unlimited": false, "use_buffer_percent": true}, "zfQSfQrtfF3TQN0O": {"buffer_count": 4, "buffer_percent": 87, "max_count": 81, "min_count": 60, "name": "0kepEaC4dfiOMZfE", "unlimited": false, "use_buffer_percent": false}}, "regions": ["Hr39pysFO3Zvc1BZ", "G99LyvfvHEsJKQQe", "wVLMUoAnaRcYp7FU"], "session_timeout": 20, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'I0HlyPR7wZNiVsF6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '48' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'G2mXEQdbzIVy8aln' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 5, "mem_limit": 96, "params": "V7vWgSHdfo07UctP"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'ErqxyMyOK06MqQBE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'ImageLimitClient' test.out

#- 65 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'rxgjVBycvU4PbmRD' \
    > test.out 2>&1
eval_tap $? 65 'ImageDetailClient' test.out

#- 66 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'crg0DjQjBECXvea7' \
    --count '68' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 66 'ListServerClient' test.out

#- 67 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "1m2lJFRZ3ZprZ60z"}' \
    > test.out 2>&1
eval_tap $? 67 'ServerHeartbeat' test.out

#- 68 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "MjhTHeh94TSenE5h"}' \
    > test.out 2>&1
eval_tap $? 68 'DeregisterLocalServer' test.out

#- 69 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "CFkIf5weqZ18MH57", "ip": "l2Zsrh90ETtYmGuk", "name": "z3MnlrjcHp6B8Vj7", "port": 36}' \
    > test.out 2>&1
eval_tap $? 69 'RegisterLocalServer' test.out

#- 70 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "Prx9Ns8eLzYEvwSW", "pod_name": "TaLQjctvrK2jhsYp"}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterServer' test.out

#- 71 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "PlXn77AtYoFzLAAT"}' \
    > test.out 2>&1
eval_tap $? 71 'ShutdownServer' test.out

#- 72 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'PY8P8P3cfoivvQxe' \
    > test.out 2>&1
eval_tap $? 72 'GetServerSessionTimeout' test.out

#- 73 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'vecWw7Rry0KK5rgA' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSession' test.out

#- 74 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "GO0dW8rX2MVUGKSZ", "configuration": "4GcLkt4pK32sJxlZ", "deployment": "cCTpTdRtCHvuk6B6", "game_mode": "XTmSLyn50sigBVZx", "matching_allies": [{"matching_parties": [{"party_attributes": {"iKdV57GvRyd9UuL0": {}, "2Le8HSCslsDd4M1F": {}, "5qRIblS7Nz81GRaz": {}}, "party_id": "PAANjfBoldFOyqA2", "party_members": [{"user_id": "clJ5gEOaCgM6Yn6R"}, {"user_id": "ugbNEIpGBFUjOn5m"}, {"user_id": "M7k8nbLzvtCIW5yn"}]}, {"party_attributes": {"MKquUicAeIVXtoWA": {}, "XhMlW4tLqX7OICf5": {}, "oD1e6oI9FmYel0kO": {}}, "party_id": "w72o8Zkgk0jS6rDW", "party_members": [{"user_id": "UwfhKvrf2AaH4yCW"}, {"user_id": "rHSppnIZkNnTn3rz"}, {"user_id": "H5NvAtcvNedgS1fU"}]}, {"party_attributes": {"fKmihDbmu8ePWlQM": {}, "VDXEHeiGTnwyEw6h": {}, "IWDZrpP7rz3ISW51": {}}, "party_id": "0kHr4isTKWjmv67n", "party_members": [{"user_id": "uHCXWfwnwGioVwVz"}, {"user_id": "mmBVVFfpqx1AeLtz"}, {"user_id": "cPJ3jtDYBo4FUTH7"}]}]}, {"matching_parties": [{"party_attributes": {"CGfKSyxgRR1DiCqS": {}, "MzpqIFGLkDs7ACC1": {}, "RgBfoNrHlFi2qJLg": {}}, "party_id": "mBLE35YhyiDV90Se", "party_members": [{"user_id": "I5yppBHoytVznCgN"}, {"user_id": "yx9fbT63ShEh8PbG"}, {"user_id": "ikLjgjcj34uulU6F"}]}, {"party_attributes": {"YBZsWFbr3RSP0W9n": {}, "Bhvhf8Q0DtJMcYQd": {}, "N66bswAgt65X4N1L": {}}, "party_id": "QZmB61JMdtwCVUrY", "party_members": [{"user_id": "Que84dwmbwFEnAZa"}, {"user_id": "WsQJtRYoagRJK5PX"}, {"user_id": "9UcOvhPyE11TRT2S"}]}, {"party_attributes": {"Kseoe8VLie0LBa36": {}, "KNzjf005CXNGehQ2": {}, "aTjTDfKFDXC7eGL5": {}}, "party_id": "YhJDWh9YWqc0qgV6", "party_members": [{"user_id": "d9yOfIMLds2DbPca"}, {"user_id": "oMdtRLTmSvTkQQgB"}, {"user_id": "7exYvmHMxr5hPCJJ"}]}]}, {"matching_parties": [{"party_attributes": {"ztJBg0tTJg46IewO": {}, "XE2AkCh3QIZsUf8l": {}, "GFXcmwTERHclOdxI": {}}, "party_id": "wqejxe18rNdb8Otq", "party_members": [{"user_id": "6j1mqUav7k05HAQl"}, {"user_id": "tnSojV4jT65yclX2"}, {"user_id": "FtAz0vJjFIYWOaNd"}]}, {"party_attributes": {"simmkW2miH3xRHAK": {}, "y4QxZkaXZ7vmiEd0": {}, "JPxVyQpshaDwNqTb": {}}, "party_id": "bFMXAMfVXe0GZeMg", "party_members": [{"user_id": "sRsmH1EQrYmkPKTP"}, {"user_id": "OlhTtSiZNCxuogFt"}, {"user_id": "eTHJe4BhSSQkQD6W"}]}, {"party_attributes": {"mOt6D7ufFVTOhvQp": {}, "fbBke8aEdd36xj6w": {}, "ySoltDxsbzxrlaKE": {}}, "party_id": "fkoYjY2o6ouRW9Ut", "party_members": [{"user_id": "NquwC3WgumrIz4Nh"}, {"user_id": "GztZpr4U4fwQIiLX"}, {"user_id": "gmRasvjO4lj8m3XE"}]}]}], "namespace": "wP2b4gd3xOeii8Jn", "notification_payload": {}, "pod_name": "mssep2xD2NY0kABe", "region": "Gs9yxahld1pO0Gyf", "session_id": "5PO3COyMvczgEpzZ"}' \
    > test.out 2>&1
eval_tap $? 74 'CreateSession' test.out

#- 75 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "3FbtxfhcRC7IVYa6"}' \
    > test.out 2>&1
eval_tap $? 75 'ClaimServer' test.out

#- 76 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'iZ5uFRYNn3SHiWxF' \
    > test.out 2>&1
eval_tap $? 76 'GetSession' test.out

#- 77 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '0YbuU5ar5qTLWUCy' \
    > test.out 2>&1
eval_tap $? 77 'CancelSession' test.out

#- 78 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 78 'GetDefaultProvider' test.out

#- 79 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 79 'ListProviders' test.out

#- 80 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region '0Afgc050XIZRW491' \
    > test.out 2>&1
eval_tap $? 80 'ListProvidersByRegion' test.out

#- 81 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 81 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE