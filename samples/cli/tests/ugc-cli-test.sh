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
echo "1..97"

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
    --ishidden '6RBt0zYoMcHyCUEX' \
    --isofficial 'lAvxJMdalwSyliWM' \
    --limit '81' \
    --name 'OItRMvqtlB2jJCSQ' \
    --offset '94' \
    --orderby 'JlDbPWbQ6Q9lNmqR' \
    --sortby 'BaAkLnvxkT1X68cm' \
    --subtype 'Dc3fxU8MyKrQpM4h' \
    --tags 'kkK6KKXNB3Gv0Iqm,F51TkhjYnaq6foWv,Xa3bMrXsDr6kILsS' \
    --type 'SyDdmykmoPYgc2L4' \
    --userId 'jk4Lo0LSP0pf4Ixj' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Ukl535X3ateEKDpA' \
    --contentId 'Dz1x3poD3Qgb3boL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Q1MzH7Qm8bwbmXgd", "APh1EThG96gAFKK2", "WDgCcxvONZm3EeER"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'mDnyeFoF7VSZ6pf3' \
    --ishidden 'vneSD2Tb3g7mSQUh' \
    --isofficial 'AEtrmjqU6YE3p4lS' \
    --limit '4' \
    --name 'Zqan0nSBJroav91G' \
    --offset '68' \
    --orderby 'lvPG6bFYReVHQipc' \
    --sortby 'Cx9Zw5D2L7vIYhGG' \
    --subtype 'SyEW4ZJJ42d3PBdd' \
    --tags 'N8S48l9lyNApflxq,Mrj3oZk03QXcKMDY,DDxHSZjtqXyJ58f7' \
    --type 'Gc26SaiGVkydwYWQ' \
    --userId 'G26yUZNmTBcvrbYC' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["wZtxFHyPLtI8ilby", "DPUIj88cekdqCt81", "P1ktfIovmv9gsR5c"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'JcHm3SZLxoRDFuuu' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ySj29a9LJE8HoRS1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'X2PFAAMwzHPxB1Us' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'kYs4Yw20DOqOBSC2' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'DKHRuPMMWH8Yb33T' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '5UBJCjfcnLRfxeCS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "z9WEi8KlloeH0JT1", "screenshotId": "yduat2vQR3biBfsu"}, {"description": "4jmsRE2w1yEkLgh3", "screenshotId": "tIYt4SqYUTLDx9gI"}, {"description": "iDandpGT2t24aOMh", "screenshotId": "5eC3IHeHSKLCa3xr"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'eNDUWehwH3q31A80' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "6DJgas4b6z3LNUj7", "description": "fdgLA84Z8YYk6QEg", "fileExtension": "pjp"}, {"contentType": "uEEQlULdJz4mnRBk", "description": "MNxvvKgAT8mJrYq6", "fileExtension": "bmp"}, {"contentType": "XiI07A68eaqC2J9j", "description": "yEW6GLbc0NaKDUL3", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'JEN2VHzih3bit0VW' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'n3CO39PXDNxtXgeO' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId '3FgkXhjDzaQY3snn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["kP7cFdP43e5dC9XI", "BudfZgrbHDIDm4hM", "zF4TxodenSrUTvfq"], "name": "U0bfoMm5cTtFWbot"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'QyXJRcQWsmqPNs92' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'epxk0i8VxsZNereS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["vf9699mCEHThUJkE", "TAsSp7gh4TeUTkOk", "AYfJB8AT9t4Tv207"], "name": "Y2QD3oD5fLCr3OOl"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'XVv8ZGF7uYnGzpip' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'NDigNJma1MbqqZtf' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "aolB4lkKB4EYOkQ1"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'jMD3cym8xIfkOVW2' \
    --body '{"tag": "grREOLx0KOww3HIC"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'QLfl7MUBG7qtPu64' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["QXCs5SPBbRPZTF6o", "QAXVG7tnsZg5QgXj", "vyGJPN4eXbJE5Vs2"], "type": "GcyomQoIXimBJehy"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'xlNsjUgxBkF6wFPo' \
    --body '{"subtype": ["JeQediogEhhM2rIi", "zGdKvOPdq5xrgxSm", "y1DN9LFkYW5DQyj4"], "type": "bj5Ro2ogaKt2ujQS"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'a3Zdb65UXmy0Zp6i' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaTIKUkmkk9QM0NB' \
    --limit '79' \
    --name 'b76tFkEORV3bu1bN' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'UGPJsw1fiP80G9Pc' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'lxcft2ulIJzPyrVE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOG4UcqsuGKHhMRW' \
    --body '{"name": "LVd3DlhLuIpomM8s"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'm1MiaI1mX2tJoARt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dbBe7udsMrok0WvG' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'YYnx4V709xbnGezK' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'sDwG2omOR2nvYI9T' \
    --userId 'VqJdvzcWbfUpaXp5' \
    --body '{"contentType": "JMl5LL4bTxBmZjdr", "customAttributes": {"rIxsB0NRsB1fPqqR": {}, "RulpqpymDkQhtrHW": {}, "wRVnwVBOqOHi8pWG": {}}, "fileExtension": "d1juYhiqjRJOqB5F", "name": "93zFQbJndUDpdONn", "payload": "eAczbBdHb2slt71B", "preview": "1SmZp2JZp50CnPb7", "previewMetadata": {"previewContentType": "1ORYcmQbTU5JX8cc", "previewFileExtension": "LjMXJRk0eaKQDOJv"}, "shareCode": "rTefglSs6g4iY9u0", "subType": "2aCNYIWekp18lOC3", "tags": ["mNqF7Bl0LcghVHfP", "EspxwhRON0bc1eMb", "EIjowLqc3ecjXJbZ"], "type": "DKKoxLE1Y3Dymtj3", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '0rYaT5hOPjaf3H0t' \
    --contentId 'YighU0VUfcYHJbBf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKSiPW3VgsZXiR1D' \
    --body '{"contentType": "J7HVWqMkNSawQUWD", "customAttributes": {"FJvJBWic7UkBeIXu": {}, "qDuAXI66bQ71w0de": {}, "oV9Lx5RDA1l2Xcrc": {}}, "fileExtension": "iYNEzvSZIPkhSgOR", "name": "cz5S5BvmgBLxh4ij", "payload": "FnE3Tam69qSZ7PC6", "preview": "f6QkmZXElW9YfRSs", "previewMetadata": {"previewContentType": "e6AAz3S4czz0QKFl", "previewFileExtension": "AVmVLu4AOec0z8eB"}, "shareCode": "eeoip68J1nsv4W2O", "subType": "JhtafxMSJlHeb34s", "tags": ["ZKHcl5LLLOexL4fZ", "vWtND2tcBFpX8lNt", "FEJ7tnkY6Mca5afj"], "type": "12K2IzrBvvWm4udE", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'OXudXgNne8kJATwl' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'c6esUp6Sw1I98jeZ' \
    --userId 'Q7hfxnhLd3Knakno' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'ed9DHhLOqQGhCUr6' \
    --contentId 'iTrjyEgarAdNJOIG' \
    --namespace "$AB_NAMESPACE" \
    --userId '36I6tRbRcrEveMdA' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'diPKDUVSC00PYeDc' \
    --limit '0' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'gginxnFIna3yddcb' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'sPheTH26IUJNvYuG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RUvpZaHCuESOiIZs' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'fB4ZH3mtgWgU4pCA' \
    --limit '76' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'xeE70CaunQNxot37' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '1W9G4AvQkqsGnmyo' \
    --namespace "$AB_NAMESPACE" \
    --userId '5JJTUVmb8GEXFTlE' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'MEsFzYqwgK1Np5no' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqpLm7FhJBNXzAFd' \
    --body '{"contents": ["O0Khqf6kiTdSGv2L", "FjAKY7CbgsWqFWZX", "7kPBom8F9GLLTG8p"], "name": "hc3n4iLoIllKlpO2"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'pqiXJF3WGRaoQomS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JC4DdrKF7SUQPLG5' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '9e0k5ZtX6wK7PpUl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cIW32iK7MGt1ixY5' \
    --limit '36' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'uVoJXTIMtpgkieDy' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'F97lGdMiHKxbWCYz' \
    --namespace "$AB_NAMESPACE" \
    --creator 'o8yO2KTK9tmmOnYn' \
    --ishidden 'Opas6ghP1y4Zi7s7' \
    --isofficial 'QBlk44Z44B1GZgKg' \
    --limit '1' \
    --name 'uKxaCgcGLuC3brWd' \
    --offset '93' \
    --orderby 'IFmlVf4jvapseE9L' \
    --sortby 'N9bvhOrHflIOd6X3' \
    --subtype 'viLvtEk4mTIpUA9g' \
    --tags 'xo8SV38nEhoXmM2W,7l6jHMA2rG3nakop,Aywelu01nryEJ0Nq' \
    --type 'oTow0qiOiC4j0ikt' \
    --userId 'm0ZPLkLOsp0LZ5nj' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'N86Hl8kUXzt6bSc6' \
    --ishidden 'bWvgpVyW9dD1kOmv' \
    --isofficial 'rAejcq2LgkQuaS7R' \
    --limit '57' \
    --name 'BME74HUtipUWYhWV' \
    --offset '32' \
    --orderby 'qx8CzPML52faXUr9' \
    --sortby 'Sk4lq2faBcAXXKlh' \
    --subtype 'vyH8paOJtxqMPpcV' \
    --tags 'fRwNj547fH0XrKED,pEY8VnocGAjci0V3,tBf2jnHGKXphn50c' \
    --type '9tNLDljhZ2jxLRX3' \
    --userId 'z46OCaGBeMfPlNos' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["4yBRjrERHEonAZR8", "GmEu0q1p6QCyY6vS", "kVFWdsbYuVEGVxYh"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '88' \
    --name 'xSc3aZPV87pna08g' \
    --offset '48' \
    --orderby 't1j1Rx59hesNWy2N' \
    --sortby 'vZ85DDKDAF8KDsBZ' \
    --subtype 'OuYQJ03BAHZ7c53q' \
    --tags '7akMpcmnnx6RVBro,p9v7aZK3h65hbN15,zfQSfQrtfF3TQN0O' \
    --type 'cNDLr36vzohZyjMQ' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Ag5mPYhrLTyU8Ohg' \
    > test.out 2>&1
eval_tap $? 62 'PublicDownloadContentByShareCode' test.out

#- 63 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'fY9JQYGF4bYXEcEN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByContentID' test.out

#- 64 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'x9xZlAchob44lOND' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'AddDownloadCount' test.out

#- 65 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'DwMvgI0HlyPR7wZN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateContentLikeStatus' test.out

#- 66 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'yYqeKN0meGelYF5w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'PublicDownloadContentPreview' test.out

#- 67 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 67 'GetTag' test.out

#- 68 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 68 'GetType' test.out

#- 69 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '16' \
    --orderby 'lncV7vWgSHdfo07U' \
    --sortby 'ctPErqxyMyOK06Mq' \
    > test.out 2>&1
eval_tap $? 69 'PublicSearchCreator' test.out

#- 70 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 70 'GetFollowedUsers' test.out

#- 71 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'BErxgjVBycvU4Pbm' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetCreator' test.out

#- 72 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'RDcrg0DjQjBECXve' \
    --limit '0' \
    --name 'T6mZEiwxxElpMYSW' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 72 'GetChannels' test.out

#- 73 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '0zMjhTHeh94TSenE' \
    --body '{"name": "5hCFkIf5weqZ18MH"}' \
    > test.out 2>&1
eval_tap $? 73 'PublicCreateChannel' test.out

#- 74 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '57l2Zsrh90ETtYmG' \
    > test.out 2>&1
eval_tap $? 74 'DeleteAllUserChannel' test.out

#- 75 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'ukz3MnlrjcHp6B8V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j7rXFgDnDkdZ9bpj' \
    --body '{"name": "b1tdA3QhjCMW64f4"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateChannel' test.out

#- 76 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'XhIjSoTB2NMKteza' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pPr2QEPx3zTxBGtE' \
    > test.out 2>&1
eval_tap $? 76 'DeleteChannel' test.out

#- 77 CreateContentDirect
eval_tap 0 77 'CreateContentDirect # SKIP deprecated' test.out

#- 78 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'JIYppuUSsKoHw2hy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd12uSE7BEv3aevq6' \
    --body '{"contentType": "iohU1cg4W1IS3Uv1", "customAttributes": {"BpWoJBaqdg2FHcun": {}, "sS1lnaO2m9vqjhbe": {}, "K2qN8g6x2PyYDo5R": {}}, "fileExtension": "3hLiD5sf5y1JsxJN", "name": "Gmyt0SQDUDoWBZVG", "preview": "LlkUetzCAWc9x1aM", "previewMetadata": {"previewContentType": "jgGim51T107XIZRZ", "previewFileExtension": "7tZdIs0xf4czdt7z"}, "subType": "qmSKxOEQlVcx6Gqs", "tags": ["Bq8vdhWVnuYLgpZe", "hK0G2nmyuViB9kRT", "cSQdTnNYGeAfYFG3"], "type": "wSkHKufBdS3ZOokZ"}' \
    > test.out 2>&1
eval_tap $? 78 'CreateContentS3' test.out

#- 79 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'B4cXnAXyuGz6LlxH' \
    --contentId 'v8SwyagYvDJ3w3UN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gIGj2jZtEYT8sIPS' \
    --body '{"contentType": "E1XXPzySa0sZoFS6", "customAttributes": {"xCOWMpyh9pMsQgb6": {}, "4ELbzDMwyo4nIRys": {}, "QdbufXjYnSoIFeou": {}}, "fileExtension": "C2m38kXrDZWlGVE9", "name": "sJ4NpUtKp6M9I6nE", "payload": "wnZhsjwJeGwaPSDM", "preview": "Zz95OYKiqaZD63xe", "previewMetadata": {"previewContentType": "5rruJVfLGea0Ztlz", "previewFileExtension": "UcuHAXz0UV31MfuG"}, "subType": "aXsAuGsZaSHevO0T", "tags": ["QNEI3kfabxJWWSI1", "ECUo1NPpeFhUztXD", "gB7n4C97uAPP8PAT"], "type": "LpUpxeJlsBJT6Hh3", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateContentS3' test.out

#- 80 UpdateContentDirect
eval_tap 0 80 'UpdateContentDirect # SKIP deprecated' test.out

#- 81 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'nBhvhf8Q0DtJMcYQ' \
    --contentId 'dN66bswAgt65X4N1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQZmB61JMdtwCVUr' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContent' test.out

#- 82 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'YQue84dwmbwFEnAZ' \
    --limit '1' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 82 'PublicGetUserContent' test.out

#- 83 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'GX6H742OixhtAoKi' \
    > test.out 2>&1
eval_tap $? 83 'DeleteAllUserContents' test.out

#- 84 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'Vm6URT95XhnUcvWB' \
    --namespace "$AB_NAMESPACE" \
    --userId '28MpusuhhDJ5slzg' \
    --body '{"screenshots": [{"description": "iWZEtyd56LfxnbY9", "screenshotId": "7jjYgXchCbkXX26u"}, {"description": "EdCfQaMAQuTKfC0I", "screenshotId": "2kNjCMDtDMrentgn"}, {"description": "3DhqciwIeShF9RKb", "screenshotId": "9vvxuJlhXbWhbwPw"}]}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateScreenshots' test.out

#- 85 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'ToC6knjVwVnzaqSf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JiQFC2gXoda0kg16' \
    --body '{"screenshots": [{"contentType": "yUSpSOAjHJWwfCjY", "description": "wWkLob9gKLqs2nEZ", "fileExtension": "jfif"}, {"contentType": "j1mqUav7k05HAQlt", "description": "nSojV4jT65yclX2F", "fileExtension": "jpeg"}, {"contentType": "ptKaWNvPbpg7yrRv", "description": "XfZ6rvgvEY3Hht1S", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 85 'UploadContentScreenshot' test.out

#- 86 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'QxZkaXZ7vmiEd0JP' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'xVyQpshaDwNqTbbF' \
    --userId 'MXAMfVXe0GZeMgsR' \
    > test.out 2>&1
eval_tap $? 86 'DeleteContentScreenshot' test.out

#- 87 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'smH1EQrYmkPKTPOl' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateUserFollowStatus' test.out

#- 88 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOIFg0dnWIYN2NVL' \
    --limit '73' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 88 'GetPublicFollowers' test.out

#- 89 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iw157g00jr9b8MuY' \
    --limit '25' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 89 'GetPublicFollowing' test.out

#- 90 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ufFVTOhvQpfbBke8' \
    --limit '1' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 90 'GetGroups' test.out

#- 91 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Edd36xj6wySoltDx' \
    --body '{"contents": ["sbzxrlaKEfkoYjY2", "o6ouRW9UtNquwC3W", "gumrIz4NhGztZpr4"], "name": "U4fwQIiLXgmRasvj"}' \
    > test.out 2>&1
eval_tap $? 91 'CreateGroup' test.out

#- 92 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'O4lj8m3XEwP2b4gd' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserGroup' test.out

#- 93 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '3xOeii8Jnmssep2x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D2NY0kABeGs9yxah' \
    > test.out 2>&1
eval_tap $? 93 'GetGroup' test.out

#- 94 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'ld1pO0Gyf5PO3COy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MvczgEpzZ3Fbtxfh' \
    --body '{"contents": ["cRC7IVYa6iZ5uFRY", "Nn3SHiWxF0YbuU5a", "r5qTLWUCy0Afgc05"], "name": "0XIZRW491e94mQjV"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateGroup' test.out

#- 95 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'OOBnIWhunElqZUod' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p3IhtCSHy1ei1fIr' \
    > test.out 2>&1
eval_tap $? 95 'DeleteGroup' test.out

#- 96 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'PvfHnRN06EjRwEQl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NapJRfk4f9Zcw1pE' \
    --limit '68' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 96 'GetGroupContent' test.out

#- 97 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyNFxcVTKuAQTGh5' \
    > test.out 2>&1
eval_tap $? 97 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE