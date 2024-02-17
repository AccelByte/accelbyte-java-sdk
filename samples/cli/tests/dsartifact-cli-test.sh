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
echo "1..16"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListNodesIPAddress
./ng net.accelbyte.sdk.cli.Main dsartifact listNodesIPAddress \
    --limit '62' \
    --next 'twYCA9kPI6LZrkq6' \
    --nodeIP 'Dc09nIW0Oaiw9B0D' \
    --previous '7eHpzSn3ZPUdc0qh' \
    > test.out 2>&1
eval_tap $? 2 'ListNodesIPAddress' test.out

#- 3 DeleteNodeByID
./ng net.accelbyte.sdk.cli.Main dsartifact deleteNodeByID \
    --nodeIP '4n8mzZ0m8SAMTwE6' \
    --podName 'I56IaRDBXxyaNoMR' \
    > test.out 2>&1
eval_tap $? 3 'DeleteNodeByID' test.out

#- 4 ListQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listQueue \
    --limit '87' \
    --next 'hkspInrAip6lyzSx' \
    --previous 'wElFHHdgs21Jub74' \
    --nodeIP 'CUkNmKJfh5pUkHOD' \
    > test.out 2>&1
eval_tap $? 4 'ListQueue' test.out

#- 5 GetActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact getActiveQueue \
    --nodeIP 'poMF78NY4YkHs1cn' \
    > test.out 2>&1
eval_tap $? 5 'GetActiveQueue' test.out

#- 6 SetActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact setActiveQueue \
    --nodeIP 'z1JSDgY1TXp38zsC' \
    --podName 'TCrbCbPOyNQkT7Nv' \
    > test.out 2>&1
eval_tap $? 6 'SetActiveQueue' test.out

#- 7 DeleteActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact deleteActiveQueue \
    --nodeIP 'yE3cwyALczNIicXm' \
    > test.out 2>&1
eval_tap $? 7 'DeleteActiveQueue' test.out

#- 8 ReportFailedUpload
./ng net.accelbyte.sdk.cli.Main dsartifact reportFailedUpload \
    --nodeIP '7agSrjJW2OQNOs1P' \
    --podName 'XhT5FvdiRilZ7oFg' \
    > test.out 2>&1
eval_tap $? 8 'ReportFailedUpload' test.out

#- 9 DeleteQueue
./ng net.accelbyte.sdk.cli.Main dsartifact deleteQueue \
    --namespace "$AB_NAMESPACE" \
    --nodeIP 'x4c8OumKtPDKJDXn' \
    --podName '7Z4U68su8XfqlqNi' \
    > test.out 2>&1
eval_tap $? 9 'DeleteQueue' test.out

#- 10 ListAllActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listAllActiveQueue \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --next 'Havj7AorKsxwkosA' \
    --nodeIP 'VerXpc1C8XfwHuKe' \
    --podName 'b9l3rGN9A3sNm84h' \
    --previous 'ddSpHt0P7MIIR7Ck' \
    > test.out 2>&1
eval_tap $? 10 'ListAllActiveQueue' test.out

#- 11 ListAllQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listAllQueue \
    --namespace "$AB_NAMESPACE" \
    --excludeUploading  \
    --limit '50' \
    --next '5tA5jUmiTqpyhPFd' \
    --nodeIP 'xLzFQN05MYzYiKWe' \
    --order '5dNRljv7IPrDQQRg' \
    --podName 'at0SevkLGMS0lyuI' \
    --previous '9a2I9u6Vpbsx5w8h' \
    > test.out 2>&1
eval_tap $? 11 'ListAllQueue' test.out

#- 12 ListTerminatedServersWithNamespace
./ng net.accelbyte.sdk.cli.Main dsartifact listTerminatedServersWithNamespace \
    --namespace "$AB_NAMESPACE" \
    --deployment 'qUI06UpOXGSLmCVu' \
    --gameMode 'HOPlLlkvR8sKgnuR' \
    --limit '20' \
    --next 'Iv53HGCiljvjKoyD' \
    --partyId '6SCwGrncqmLtjQHA' \
    --podName 'f8TgoNm03VLisV6z' \
    --previous 'wPuo3td6TC6I3lMj' \
    --provider 'GSWN2laRlxfcjHfY' \
    --region 'akUCTqGkE7wcWfDs' \
    --sessionId 'lpJSqGAXQ0yYoNRK' \
    --userId 'd3IL5TAQ6iiPlSC2' \
    > test.out 2>&1
eval_tap $? 12 'ListTerminatedServersWithNamespace' test.out

#- 13 DownloadServerArtifacts
./ng net.accelbyte.sdk.cli.Main dsartifact downloadServerArtifacts \
    --namespace "$AB_NAMESPACE" \
    --podName 'uE4o5Vwdo3fePqIJ' \
    > test.out 2>&1
eval_tap $? 13 'DownloadServerArtifacts' test.out

#- 14 CheckServerArtifact
./ng net.accelbyte.sdk.cli.Main dsartifact checkServerArtifact \
    --namespace "$AB_NAMESPACE" \
    --podName 'A8IHtrkmu0hpDDWV' \
    > test.out 2>&1
eval_tap $? 14 'CheckServerArtifact' test.out

#- 15 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dsartifact listTerminatedServers \
    --deployment 'Ala2l5BYNtIuS5S5' \
    --gameMode 'XUdjsoqwGyzzWi9g' \
    --limit '45' \
    --next 'EqgA8yu7Vk6Jt4Ym' \
    --partyId 'os9Jcdos4fYcTVU6' \
    --podName 'RBt0zYoMcHyCUEXl' \
    --previous 'AvxJMdalwSyliWMN' \
    --provider 'W5NyLu0M3VHh2EI8' \
    --region 'JlDbPWbQ6Q9lNmqR' \
    --sessionId 'BaAkLnvxkT1X68cm' \
    --userId 'Dc3fxU8MyKrQpM4h' \
    > test.out 2>&1
eval_tap $? 15 'ListTerminatedServers' test.out

#- 16 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsartifact publicGetMessages \
    > test.out 2>&1
eval_tap $? 16 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE