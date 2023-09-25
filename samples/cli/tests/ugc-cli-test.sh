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
echo "1..95"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 SingleAdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "AxcVpFrttufHIRdH", "name": "9UzVRiXbqlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '2ktQG0h5JAav5kRa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "62WopBJHPtcDs8bB"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'ZLCXLx8bbgorQeFb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "dwpzS6DaDpv8N7ZQ", "customAttributes": {"VqGj6oDLjWjkY1aX": {}, "lFcDtgOjchIua5tW": {}, "EIC32ogW7olvbTgr": {}}, "fileExtension": "hRTcPiSuL0Sly6XM", "name": "4OI18mAQLnzjMf8G", "preview": "Z2WBZqxYG3aREAu2", "previewMetadata": {"previewContentType": "D6QVKNCWP75TB0i7", "previewFileExtension": "pKxR8dl0zRVW4EZG"}, "shareCode": "9m0XcgGVbMqSszE8", "subType": "GHavj7AorKsxwkos", "tags": ["AVerXpc1C8XfwHuK", "eb9l3rGN9A3sNm84", "hddSpHt0P7MIIR7C"], "type": "kyF6C7duuyZ0GhDo"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'gqrhBRd8lDR6qVNP' \
    --contentId 'RZYdFLIAjGGJddVC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vu9vx5KQ7KYnIuMB", "customAttributes": {"vaO35llzQRaT5kPx": {}, "UfofvnnSuB0y5WUl": {}, "rMdI4sNveabntBSx": {}}, "fileExtension": "TeIv53HGCiljvjKo", "name": "yD6SCwGrncqmLtjQ", "payload": "HAf8TgoNm03VLisV", "preview": "6zwPuo3td6TC6I3l", "previewMetadata": {"previewContentType": "MjGSWN2laRlxfcjH", "previewFileExtension": "fYakUCTqGkE7wcWf"}, "shareCode": "DslpJSqGAXQ0yYoN", "subType": "RKd3IL5TAQ6iiPlS", "tags": ["C2uE4o5Vwdo3fePq", "IJA8IHtrkmu0hpDD", "WVAla2l5BYNtIuS5"], "type": "S5XUdjsoqwGyzzWi", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'PEqgA8yu7Vk6Jt4Y' \
    --namespace "$AB_NAMESPACE" \
    --creator 'mos9Jcdos4fYcTVU' \
    --isofficial '6RBt0zYoMcHyCUEX' \
    --limit '24' \
    --name 'maLoxozr6wfNPX2b' \
    --offset '84' \
    --orderby 'W5NyLu0M3VHh2EI8' \
    --sortby 'JlDbPWbQ6Q9lNmqR' \
    --subtype 'BaAkLnvxkT1X68cm' \
    --tags 'Dc3fxU8MyKrQpM4h,kkK6KKXNB3Gv0Iqm,F51TkhjYnaq6foWv' \
    --type 'Xa3bMrXsDr6kILsS' \
    --userId 'SyDdmykmoPYgc2L4' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'jk4Lo0LSP0pf4Ixj' \
    --contentId 'Ukl535X3ateEKDpA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["z1x3poD3Qgb3boLQ", "Q1MzH7Qm8bwbmXgd", "APh1EThG96gAFKK2"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'WDgCcxvONZm3EeER' \
    --isofficial 'mDnyeFoF7VSZ6pf3' \
    --limit '44' \
    --name 'FQSKVPHbn4Xxtu7L' \
    --offset '88' \
    --orderby 'EtrmjqU6YE3p4lSc' \
    --sortby 'k0ZHn5GI39YBHqaT' \
    --subtype 'HeKtW18iGeUlc9d9' \
    --tags 'sogWa24CKNS0GqVv,UfHQvsHXNUNe4mhg,o5QB65lSAiYnNjkf' \
    --type 'ZrQvGgbLdLsFzHkB' \
    --userId 'Mr1yrOMlNFSrUEir' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["njX9fDmIbeZxzfTc", "yiuATus9hsfpFDcS", "DG8aMVGLiBNrDjqo"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'xcwgGLXpUL4pp2nc' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'YAHdNzDmeIP6rOvD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'z9KOsb392k6YmJFf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'RByjlBiuFM3FIoVk' \
    --namespace "$AB_NAMESPACE" \
    --versionId '8T3GpAnkCmBUqg2S' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'CnqntX9y1aZSWMiV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "i10sG6vxkfUcmqRR", "screenshotId": "bceJ5i0EeDxOgBnh"}, {"description": "hqElIaDml48wdNFL", "screenshotId": "Tm5T50x9WT0GfH2r"}, {"description": "tOa4EXsXzOXQAk4m", "screenshotId": "qrxzTtuLl4XlbGL8"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'QOxtjzm8y2wNhmwo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "YZyI4EFZKBcYrCEA", "description": "E7WIsfmx40NLRc6m", "fileExtension": "bmp"}, {"contentType": "DJgas4b6z3LNUj7f", "description": "dgLA84Z8YYk6QEgJ", "fileExtension": "jfif"}, {"contentType": "EEQlULdJz4mnRBkM", "description": "NxvvKgAT8mJrYq6h", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'iI07A68eaqC2J9jy' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'EW6GLbc0NaKDUL3s' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'a13lk1dQBHO86IlB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["CO39PXDNxtXgeO3F", "gkXhjDzaQY3snn2Z", "kP7cFdP43e5dC9XI"], "name": "BudfZgrbHDIDm4hM"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'zF4TxodenSrUTvfq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'U0bfoMm5cTtFWbot' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["QyXJRcQWsmqPNs92", "epxk0i8VxsZNereS", "vf9699mCEHThUJkE"], "name": "TAsSp7gh4TeUTkOk"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'AYfJB8AT9t4Tv207' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'Y2QD3oD5fLCr3OOl' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "8ZGF7uYnGzpipNDi"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'gNJma1MbqqZtfNWq' \
    --body '{"tag": "l4nmwAft4gqkNNlW"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'kD9eOziYRFOn0jJL' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["C9LxhvNXTwGBCtoh", "Ltl9Zuhytm5UDrT6", "QXCs5SPBbRPZTF6o"], "type": "QAXVG7tnsZg5QgXj"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'vyGJPN4eXbJE5Vs2' \
    --body '{"subtype": ["GcyomQoIXimBJehy", "xlNsjUgxBkF6wFPo", "JeQediogEhhM2rIi"], "type": "zGdKvOPdq5xrgxSm"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'y1DN9LFkYW5DQyj4' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'bj5Ro2ogaKt2ujQS' \
    --limit '0' \
    --name 'sEK5QpNhlI2iS5Ep' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'aTIKUkmkk9QM0NBM' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'A9ORxpzwLR2AK6eX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UGPJsw1fiP80G9Pc' \
    --body '{"name": "lxcft2ulIJzPyrVE"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'iOG4UcqsuGKHhMRW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LVd3DlhLuIpomM8s' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'm1MiaI1mX2tJoARt' \
    --contentId 'dbBe7udsMrok0WvG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYnx4V709xbnGezK' \
    --body '{"contentType": "sDwG2omOR2nvYI9T", "customAttributes": {"VqJdvzcWbfUpaXp5": {}, "JMl5LL4bTxBmZjdr": {}, "rIxsB0NRsB1fPqqR": {}}, "fileExtension": "RulpqpymDkQhtrHW", "name": "wRVnwVBOqOHi8pWG", "payload": "d1juYhiqjRJOqB5F", "preview": "93zFQbJndUDpdONn", "previewMetadata": {"previewContentType": "eAczbBdHb2slt71B", "previewFileExtension": "1SmZp2JZp50CnPb7"}, "shareCode": "1ORYcmQbTU5JX8cc", "subType": "LjMXJRk0eaKQDOJv", "tags": ["rTefglSs6g4iY9u0", "2aCNYIWekp18lOC3", "mNqF7Bl0LcghVHfP"], "type": "EspxwhRON0bc1eMb", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3' test.out

#- 43 AdminUpdateContentDirect
eval_tap 0 43 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 44 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '3MFFJ1KesKoELCpo' \
    --contentId 'bBEG8X645xpdXpai' \
    --namespace "$AB_NAMESPACE" \
    --userId '0rYaT5hOPjaf3H0t' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteContent' test.out

#- 45 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'YighU0VUfcYHJbBf' \
    --limit '54' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetContent' test.out

#- 46 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'KSiPW3VgsZXiR1DJ' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserContents' test.out

#- 47 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '7HVWqMkNSawQUWDF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JvJBWic7UkBeIXuq' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 47 'AdminHideUserContent' test.out

#- 48 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVwXgAgntLMCuaXB' \
    --limit '100' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetAllGroups' test.out

#- 49 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lx5RDA1l2XcrciYN' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteAllUserGroup' test.out

#- 50 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'EzvSZIPkhSgORcz5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S5BvmgBLxh4ijFnE' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroup' test.out

#- 51 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '3Tam69qSZ7PC6f6Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kmZXElW9YfRSse6A' \
    --body '{"contents": ["Az3S4czz0QKFlAVm", "VLu4AOec0z8eBeeo", "ip68J1nsv4W2OJht"], "name": "afxMSJlHeb34sZKH"}' \
    > test.out 2>&1
eval_tap $? 51 'AdminUpdateGroup' test.out

#- 52 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'cl5LLLOexL4fZvWt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ND2tcBFpX8lNtFEJ' \
    > test.out 2>&1
eval_tap $? 52 'AdminDeleteGroup' test.out

#- 53 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '7tnkY6Mca5afj12K' \
    --namespace "$AB_NAMESPACE" \
    --userId '2IzrBvvWm4udE0OX' \
    --limit '41' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetGroupContents' test.out

#- 54 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'TdlNBJYOmpu1VCar' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteAllUserStates' test.out

#- 55 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'zBsV6xnZ5Jrzzjrc' \
    --namespace "$AB_NAMESPACE" \
    --creator 'aug6CWVG8SWP3glU' \
    --isofficial '6muswVJnNnN7kAa7' \
    --limit '18' \
    --name 'yEgarAdNJOIG36I6' \
    --offset '40' \
    --orderby '7dwV9DBqFKHQkETJ' \
    --sortby 'yTlUrwDTnoujQD4I' \
    --subtype 'EiH9Z5qXn3aoRtlq' \
    --tags 'OECohViHA5CzgFSy,8X1A3PrIfapq5AAe,Me4L3mDWORBVXTII' \
    --type 'JM9XsYIIZxiXNMR9' \
    --userId 'BgaWcFX3SUBhyoTs' \
    > test.out 2>&1
eval_tap $? 55 'SearchChannelSpecificContent' test.out

#- 56 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'MWPAxUMkawaGpAyr' \
    --isofficial 'IwMif3BOdkocVTd4' \
    --limit '56' \
    --name 'pLm7FhJBNXzAFdO0' \
    --offset '75' \
    --orderby 'bjvqhnUVLWu8olKd' \
    --sortby 'xL6ozRmDD0jJvlfV' \
    --subtype '5OemPYdYT7DROCjt' \
    --tags 'uzFMbAG9YI89hmgu,B8FOTjMLo4b9rIzq,YkEpstyVTBcrM8rG' \
    --type '0rH0zcswwVeMK6Mb' \
    --userId 'GIVIu8vvwLc7KY3u' \
    > test.out 2>&1
eval_tap $? 56 'PublicSearchContent' test.out

#- 57 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["VoJXTIMtpgkieDyF", "97lGdMiHKxbWCYzo", "8yO2KTK9tmmOnYnO"]}' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetContentBulk' test.out

#- 58 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 58 'GetFollowedContent' test.out

#- 59 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '89' \
    --name 's6ghP1y4Zi7s7QBl' \
    --offset '22' \
    --orderby 'nrfsGlfPaZKBwa3D' \
    --sortby 'db60ufPpzwj1QGIF' \
    --subtype 'mlVf4jvapseE9LN9' \
    --tags 'bvhOrHflIOd6X3vi,LvtEk4mTIpUA9gxo,8SV38nEhoXmM2W7l' \
    --type '6jHMA2rG3nakopAy' \
    > test.out 2>&1
eval_tap $? 59 'GetLikedContent' test.out

#- 60 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'welu01nryEJ0NqoT' \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentByShareCode' test.out

#- 61 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ow0qiOiC4j0iktm0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentByContentID' test.out

#- 62 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'ZPLkLOsp0LZ5njN8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AddDownloadCount' test.out

#- 63 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '6Hl8kUXzt6bSc6bW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateContentLikeStatus' test.out

#- 64 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'cKMLhrTrcBE2ItBS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentPreview' test.out

#- 65 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 65 'GetTag' test.out

#- 66 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 66 'GetType' test.out

#- 67 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '74' \
    --orderby '2LgkQuaS7RBx3vim' \
    --sortby '02jBOxrZDyvpcLYO' \
    > test.out 2>&1
eval_tap $? 67 'PublicSearchCreator' test.out

#- 68 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 68 'GetFollowedUsers' test.out

#- 69 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8NjxOnaEok4nOOC' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetCreator' test.out

#- 70 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'zfsflhjbngJOUn18' \
    --limit '67' \
    --name 'OJtxqMPpcVfRwNj5' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 70 'GetChannels' test.out

#- 71 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7fH0XrKEDpEY8Vno' \
    --body '{"name": "cGAjci0V3tBf2jnH"}' \
    > test.out 2>&1
eval_tap $? 71 'PublicCreateChannel' test.out

#- 72 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'GKXphn50c9tNLDlj' \
    > test.out 2>&1
eval_tap $? 72 'DeleteAllUserChannel' test.out

#- 73 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'hZ2jxLRX3z46OCaG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BeMfPlNos4yBRjrE' \
    --body '{"name": "RHEonAZR8GmEu0q1"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateChannel' test.out

#- 74 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'p6QCyY6vSkVFWdsb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YuVEGVxYheR3j5mN' \
    > test.out 2>&1
eval_tap $? 74 'DeleteChannel' test.out

#- 75 CreateContentDirect
eval_tap 0 75 'CreateContentDirect # SKIP deprecated' test.out

#- 76 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'Z6vwv7K8Asvt1j1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x59hesNWy2NvZ85D' \
    --body '{"contentType": "DKDAF8KDsBZOuYQJ", "customAttributes": {"03BAHZ7c53q7akMp": {}, "cmnnx6RVBrop9v7a": {}, "ZK3h65hbN15zfQSf": {}}, "fileExtension": "QrtfF3TQN0OcNDLr", "name": "36vzohZyjMQAg5mP", "preview": "YhrLTyU8OhgfY9JQ", "previewMetadata": {"previewContentType": "YGF4bYXEcENx9xZl", "previewFileExtension": "Achob44lONDDwMvg"}, "subType": "I0HlyPR7wZNiVsF6", "tags": ["xG2mXEQdbzIVy8al", "ncV7vWgSHdfo07Uc", "tPErqxyMyOK06MqQ"], "type": "BErxgjVBycvU4Pbm"}' \
    > test.out 2>&1
eval_tap $? 76 'CreateContentS3' test.out

#- 77 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'RDcrg0DjQjBECXve' \
    --contentId 'a7H1m2lJFRZ3ZprZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '60zMjhTHeh94TSen' \
    --body '{"contentType": "E5hCFkIf5weqZ18M", "customAttributes": {"H57l2Zsrh90ETtYm": {}, "Gukz3MnlrjcHp6B8": {}, "Vj7rXFgDnDkdZ9bp": {}}, "fileExtension": "jb1tdA3QhjCMW64f", "name": "4XhIjSoTB2NMKtez", "payload": "apPr2QEPx3zTxBGt", "preview": "EJIYppuUSsKoHw2h", "previewMetadata": {"previewContentType": "yd12uSE7BEv3aevq", "previewFileExtension": "6iohU1cg4W1IS3Uv"}, "subType": "1BpWoJBaqdg2FHcu", "tags": ["nsS1lnaO2m9vqjhb", "eK2qN8g6x2PyYDo5", "R3hLiD5sf5y1JsxJ"], "type": "NGmyt0SQDUDoWBZV", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateContentS3' test.out

#- 78 UpdateContentDirect
eval_tap 0 78 'UpdateContentDirect # SKIP deprecated' test.out

#- 79 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'azPAANjfBoldFOyq' \
    --contentId 'A2clJ5gEOaCgM6Yn' \
    --namespace "$AB_NAMESPACE" \
    --userId '6RugbNEIpGBFUjOn' \
    > test.out 2>&1
eval_tap $? 79 'DeleteContent' test.out

#- 80 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '5mM7k8nbLzvtCIW5' \
    --limit '50' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetUserContent' test.out

#- 81 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'vdhWVnuYLgpZehK0' \
    > test.out 2>&1
eval_tap $? 81 'DeleteAllUserContents' test.out

#- 82 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'G2nmyuViB9kRTcSQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dTnNYGeAfYFG3wSk' \
    --body '{"screenshots": [{"description": "HKufBdS3ZOokZB4c", "screenshotId": "XnAXyuGz6LlxHv8S"}, {"description": "wyagYvDJ3w3UNgIG", "screenshotId": "j2jZtEYT8sIPSE1X"}, {"description": "XPzySa0sZoFS6xCO", "screenshotId": "WMpyh9pMsQgb64EL"}]}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateScreenshots' test.out

#- 83 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'bzDMwyo4nIRysQdb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ufXjYnSoIFeouC2m' \
    --body '{"screenshots": [{"contentType": "38kXrDZWlGVE9sJ4", "description": "NpUtKp6M9I6nEwnZ", "fileExtension": "jfif"}, {"contentType": "cPJ3jtDYBo4FUTH7", "description": "CGfKSyxgRR1DiCqS", "fileExtension": "pjp"}, {"contentType": "JVfLGea0ZtlzUcuH", "description": "AXz0UV31MfuGaXsA", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 83 'UploadContentScreenshot' test.out

#- 84 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'BLE35YhyiDV90SeI' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '5yppBHoytVznCgNy' \
    --userId 'x9fbT63ShEh8PbGi' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContentScreenshot' test.out

#- 85 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLjgjcj34uulU6FY' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateUserFollowStatus' test.out

#- 86 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'eJlsBJT6Hh3OMjAj' \
    --limit '34' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 86 'GetPublicFollowers' test.out

#- 87 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '2mK8lbSEEelxnb5Q' \
    --limit '48' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 87 'GetPublicFollowing' test.out

#- 88 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'WG2HFnZlA6HKWW4f' \
    --limit '70' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 88 'GetGroups' test.out

#- 89 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'JMdtwCVUrYQue84d' \
    --body '{"contents": ["wmbwFEnAZaWsQJtR", "YoagRJK5PX9UcOvh", "PyE11TRT2SKseoe8"], "name": "VLie0LBa36KNzjf0"}' \
    > test.out 2>&1
eval_tap $? 89 'CreateGroup' test.out

#- 90 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '05CXNGehQ2aTjTDf' \
    > test.out 2>&1
eval_tap $? 90 'DeleteAllUserGroup' test.out

#- 91 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'KFDXC7eGL5YhJDWh' \
    --namespace "$AB_NAMESPACE" \
    --userId '9YWqc0qgV6d9yOfI' \
    > test.out 2>&1
eval_tap $? 91 'GetGroup' test.out

#- 92 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'MLds2DbPcaoMdtRL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TmSvTkQQgB7exYvm' \
    --body '{"contents": ["HMxr5hPCJJztJBg0", "tTJg46IewOXE2AkC", "h3QIZsUf8lGFXcmw"], "name": "TERHclOdxIwqejxe"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdateGroup' test.out

#- 93 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '18rNdb8Otq6j1mqU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'av7k05HAQltnSojV' \
    > test.out 2>&1
eval_tap $? 93 'DeleteGroup' test.out

#- 94 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '4jT65yclX2FtAz0v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjFIYWOaNdsimmkW' \
    --limit '44' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 94 'GetGroupContent' test.out

#- 95 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'gvEY3Hht1SwqTsKK' \
    > test.out 2>&1
eval_tap $? 95 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE