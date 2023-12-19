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
echo "1..152"

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

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["Ag5mPYhrLTyU8Ohg", "fY9JQYGF4bYXEcEN", "x9xZlAchob44lOND"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DwMvgI0HlyPR7wZN' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'iVsF6xG2mXEQdbzI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'Vy8alncV7vWgSHdf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'o07UctPErqxyMyOK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'ETWjteoc8fgvZDDh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '5' \
    --orderby 'oKqymxLD1Lcvw6T6' \
    --sortby 'mZEiwxxElpMYSWIe' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'zm7z9noowmlTIKVo' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'wi0RY2VN4ZONJREd' \
    --limit '96' \
    --name '2Zsrh90ETtYmGukz' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'MnlrjcHp6B8Vj7rX' \
    --body '{"name": "FgDnDkdZ9bpjb1td"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3QhjCMW64f4XhIj' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'SoTB2NMKtezapPr2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QEPx3zTxBGtEJIYp' \
    --body '{"name": "puUSsKoHw2hyd12u"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'SE7BEv3aevq6iohU' \
    --namespace "$AB_NAMESPACE" \
    --userId '1cg4W1IS3Uv1BpWo' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'JBaqdg2FHcunsS1l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'naO2m9vqjhbeK2qN' \
    --body '{"contentType": "8g6x2PyYDo5R3hLi", "customAttributes": {"D5sf5y1JsxJNGmyt": {}, "0SQDUDoWBZVGLlkU": {}, "etzCAWc9x1aMjgGi": {}}, "fileExtension": "m51T107XIZRZ7tZd", "name": "Is0xf4czdt7zqmSK", "preview": "xOEQlVcx6GqsBq8v", "previewMetadata": {"previewContentType": "dhWVnuYLgpZehK0G", "previewFileExtension": "2nmyuViB9kRTcSQd"}, "subType": "TnNYGeAfYFG3wSkH", "tags": ["KufBdS3ZOokZB4cX", "nAXyuGz6LlxHv8Sw", "yagYvDJ3w3UNgIGj"], "type": "2jZtEYT8sIPSE1XX"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'PzySa0sZoFS6xCOW' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Mpyh9pMsQgb64ELb' \
    --userId 'zDMwyo4nIRysQdbu' \
    --body '{"contentType": "fXjYnSoIFeouC2m3", "customAttributes": {"8kXrDZWlGVE9sJ4N": {}, "pUtKp6M9I6nEwnZh": {}, "sjwJeGwaPSDMZz95": {}}, "fileExtension": "OYKiqaZD63xe5rru", "name": "JVfLGea0ZtlzUcuH", "payload": "AXz0UV31MfuGaXsA", "preview": "uGsZaSHevO0TQNEI", "previewMetadata": {"previewContentType": "3kfabxJWWSI1ECUo", "previewFileExtension": "1NPpeFhUztXDgB7n"}, "subType": "4C97uAPP8PATLpUp", "tags": ["xeJlsBJT6Hh3OMjA", "jq2mK8lbSEEelxnb", "5QxWG2HFnZlA6HKW"], "type": "W4fI1IQcoBQELcNl", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'kqTZrKgXNwvm4e5G' \
    --contentId 'X6H742OixhtAoKiV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm6URT95XhnUcvWB2' \
    --body '{"contentType": "8MpusuhhDJ5slzgi", "customAttributes": {"WZEtyd56LfxnbY97": {}, "jjYgXchCbkXX26uE": {}, "dCfQaMAQuTKfC0I2": {}}, "fileExtension": "kNjCMDtDMrentgn3", "name": "DhqciwIeShF9RKb9", "payload": "vvxuJlhXbWhbwPwT", "preview": "oC6knjVwVnzaqSfJ", "previewMetadata": {"previewContentType": "iQFC2gXoda0kg16y", "previewFileExtension": "USpSOAjHJWwfCjYw"}, "subType": "WkLob9gKLqs2nEZh", "tags": ["pByfHZinxNfgPAwk", "MBsznlBUqnLT4AbG", "ptKaWNvPbpg7yrRv"], "type": "XfZ6rvgvEY3Hht1S", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'QxZkaXZ7vmiEd0JP' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'xVyQpshaDwNqTbbF' \
    --userId 'MXAMfVXe0GZeMgsR' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'smH1EQrYmkPKTPOl' \
    --contentId 'hTtSiZNCxuogFteT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJe4BhSSQkQD6WmO' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 't6D7ufFVTOhvQpfb' \
    --contentId 'Bke8aEdd36xj6wyS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oltDxsbzxrlaKEfk' \
    --body '{"shareCode": "oYjY2o6ouRW9UtNq"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwC3WgumrIz4NhGz' \
    --limit '40' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zpr4U4fwQIiLXgmR' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'asvjO4lj8m3XEwP2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b4gd3xOeii8Jnmss' \
    --body '{"screenshots": [{"description": "ep2xD2NY0kABeGs9", "screenshotId": "yxahld1pO0Gyf5PO"}, {"description": "3COyMvczgEpzZ3Fb", "screenshotId": "txfhcRC7IVYa6iZ5"}, {"description": "uFRYNn3SHiWxF0Yb", "screenshotId": "uU5ar5qTLWUCy0Af"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'gc050XIZRW491e94' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mQjVOOBnIWhunElq' \
    --body '{"screenshots": [{"contentType": "ZUodp3IhtCSHy1ei", "description": "1fIrPvfHnRN06EjR", "fileExtension": "jpeg"}, {"contentType": "Zedgt5cyNe27HLtw", "description": "tVOaxgP6Jbct8puM", "fileExtension": "jpg"}, {"contentType": "TGh5BxjWOozGoDts", "description": "UuYo5p8ED5QZAufw", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'PTBxiFFCrn7djjs6' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '9FTFVGUVhvKhJCme' \
    --userId 'isql14mUHVbMPimN' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'hcZsU3VAdMDcb4ql' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'mU7syGlElXdEAOrV' \
    --limit '92' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'nLocLVVYamQc4wcG' \
    --limit '50' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'PlRpWjmHZAAvKTH8' \
    --limit '79' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'cfs2E41cK8QTwiIA' \
    --body '{"contents": ["vxSvNDlmM5nQFMGz", "s7fzjgyc44mEh9tR", "k8knYSV30lnroQeh"], "name": "MDli6t9unQLYXxm0"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '9wpGAbpEmDY9vLh3' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'u6EDsUmrV6kH4Oot' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwG3UC6XCnnZxF8C' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'mQr17W65br34rBBN' \
    --namespace "$AB_NAMESPACE" \
    --userId '9tU6TDm5GloFSKWM' \
    --body '{"contents": ["1eym5ydC6p25xCWT", "qUOYZENJ1QHZQxPR", "XH7uxBJEECQE1li3"], "name": "Bg7Jxc9pUnZmvhid"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'wCkZwqjYLfTiCO1N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DBvQvRPnAz4VzW0C' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'poBCbyJsF5IjF1c0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W338HS6CBgVRyihY' \
    --limit '82' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z84CVhziXV8HwSmv' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'cvcDKF19yVRafCjO' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --name 'vqDejvqklTSvDwuO' \
    --offset '35' \
    --sortBy 'J8daGTVX3Bb7jlz5' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'IfHgKjI9mwJSrN8j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "kIykR2zbaI6PD7fE", "customAttributes": {"scShnGUGUtV9GJ27": {}, "9GDbLNwjm3FK0nnX": {}, "2poMfZ1hDHtbh4Ht": {}}, "fileExtension": "MlFgvh2Dp2SoiIPp", "name": "1yvfAHS0VgLu11A3", "shareCode": "HTovFi4tPAGfleyC", "subType": "A6jEtcqsnzoVILjk", "tags": ["wW61duF87aUyrdt4", "XSpWBAetsanzqP8o", "xfrtbECD1CYPwaiB"], "type": "AxfYL8Avt70ZUT2f"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'Sk3LL0calqxEewuG' \
    --contentId 'S469k2hG0WKt4sUm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'anYxM0UHZVNYzGMN' \
    --contentId 'IpWoSLkUrfuf4U3W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"eYeA9t2ENKKWrFtH": {}, "Ii1CMgKAOG5iDcCR": {}, "5PbCvDLil8wj9cKM": {}}, "name": "3Ar6MF35hCER4nGm", "shareCode": "WGgTJfHlJl4tHGa4", "subType": "XfZcd9CVnGqMX9Fi", "tags": ["eeEssWEUl07bhwnt", "CVqiYOJf5KwMZQjz", "vjSozv6CTRDl0zp9"], "type": "CzHFwinkBNi4gvqg"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'l6TZ9TGVPmv34h6T' \
    --contentId '7EsufmfxKYB4LM6H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "6QXmpZ9X3fUSR1l9", "fileLocation": "xLPBsmAUrD9L1IiD"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId '6MlcEPhMDFzjHZ3s' \
    --contentId 'IhzOx2CXKlvIomU3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "pIxM9n8D2eLMe3lt", "fileExtension": "9qfx2UDcgVE7L9FK"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'kTjgJaMYvNQOsDa4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "bkcgepqtxjbrztee"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '86' \
    --name 'Pkp6ccIBnWyPw8mj' \
    --offset '12' \
    --sortBy 'D2xnik42miteR5eQ' \
    --subType 'Ae1rzmmgqBPRmd6m' \
    --tags 'O4oI8KDqebm83raN,BJ5y7axEkvI4oxZE,DxGiBnNbn0zaf7Ca' \
    --type 'OSlHXrUSA6sMJzA5' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["mtqISQ83TTbtefXW", "znDe4LQdXfFBii2R", "AMEX5RMjBFVZGYzQ"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["qV8d9mDdUIoiIJFN", "xuNOmUSWw18T1IxV", "WCxdvPL9e4P01vxP"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode '8xj1LyEirURERnEM' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'zpImW6sjAHyCK5tN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'anGBrkzUvck3xTtm' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'OFMebS4AdlNzwog2' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'IhErkNhNcECWwchW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "6zL9SkbLlrNXnGan", "screenshotId": "Mazb8jvRWenURH48"}, {"description": "aJuALEcSqcE15u6D", "screenshotId": "31DjOsrs3CUYATdq"}, {"description": "nQGbqiqOkNeATj7e", "screenshotId": "Gjodd7CcJUrI6MAu"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'gK5kypNrp2nFe9Fm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "N86sK5LOq4ft5jGc", "description": "MICPUYnfG6jl9U4j", "fileExtension": "png"}, {"contentType": "DqLMR919IZPKOKiA", "description": "VQXXOmqFHLbyXmgC", "fileExtension": "png"}, {"contentType": "Uta5I0uGcL1koyHj", "description": "CH5olYLETRpABAmO", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'EGvJ4UMS93yOxNIn' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'DByhnoluO6ti0QP2' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'ssiJ66OzOj84O6tg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'ohjtC7bzjPpucddX' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '5zifF8y959anrNSl' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eywHbHig6IKWVZ77' \
    --userId 'KeRWdECaFGzfZ2hx' \
    --body '{"customAttributes": {"cJ2Fnemn7M23SzUo": {}, "4hNBDh9ZFP1OW0nX": {}, "OErQPS4VsRoYIK69": {}}, "name": "yg9ADCGiXaLs2xjH", "shareCode": "kinOD975nARHCmhN", "subType": "HSXuqIHsxvaUoXDm", "tags": ["wWsukxncuD3QxCXM", "d00YBWCaVVmM45mf", "IZsWhkS476dGGJwJ"], "type": "00UH197MJ6zU7JLM"}' \
    > test.out 2>&1
eval_tap $? 121 'AdminUpdateContentByShareCodeV2' test.out

#- 122 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'QyMWzYQCAaPJgoxG' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'JoJaSzUtY4ZD0Xtb' \
    --userId '0U4pH16NUsVY21NV' \
    > test.out 2>&1
eval_tap $? 122 'AdminDeleteContentByShareCodeV2' test.out

#- 123 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'Is7NRen2Y3Ns0QJQ' \
    --contentId 'eaWytPfds1BYx0Ea' \
    --namespace "$AB_NAMESPACE" \
    --userId 'URydf8ZyyZeHAWGg' \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteUserContentV2' test.out

#- 124 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'JUbUJRMbkcTglbU8' \
    --contentId '6FyOjApNHBVfNOUR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cjY3YYT9oTynmfIu' \
    --body '{"customAttributes": {"BWgJTNFfM8M0IW4o": {}, "e8KDgy0xZfAcNg14": {}, "Ws8TIP1LKiFQoLDv": {}}, "name": "umfqrgSfnx2h61X9", "shareCode": "dN1MGRXBJ6mVV7JS", "subType": "9qjNLwvI8JdiY3RR", "tags": ["iLilmOGF6dLLIeIV", "IjMcdlbdRXTGIrdN", "L5gJPqTAjgqaTHf1"], "type": "ANTJ9Yk997XkGOdC"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateUserContentV2' test.out

#- 125 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId '6ItxDT8p4n4XCFkD' \
    --contentId '1AJLCwszbZxuHSgD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OK8bjoF7bL2635Kb' \
    --body '{"fileExtension": "tZTGJpqgl2IzNXGT", "fileLocation": "uQPIDpor7t1aJLNN"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateUserContentFileLocation' test.out

#- 126 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'z6QIVC9Mfuc8VOsn' \
    --contentId 'mnlVljdWYmELe74p' \
    --namespace "$AB_NAMESPACE" \
    --userId '38vumnxAnYBTxaTI' \
    --body '{"contentType": "z0jcgDI8Pkz96vd8", "fileExtension": "0msqIm5bufnBqrpL"}' \
    > test.out 2>&1
eval_tap $? 126 'AdminGenerateUserContentUploadURLV2' test.out

#- 127 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqhwVhjnnjKMEmtb' \
    --limit '18' \
    --offset '6' \
    --sortBy 'WsAQHbMrKYi0Zxs5' \
    > test.out 2>&1
eval_tap $? 127 'AdminGetContentByUserIDV2' test.out

#- 128 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'SWCqZXHLLa31oQf7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BULnZDhutDM6Bqgu' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateContentHideStatusV2' test.out

#- 129 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'fV4f15NohXu6opxQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GRt6PqlkL0diRhLC' \
    --limit '39' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 129 'AdminGetUserGroupContentsV2' test.out

#- 130 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'ih2EQfY3XCv4hdOa' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --name 'FdZhNMd1onFjGRbx' \
    --offset '40' \
    --sortBy 'BRmMhAbUWmFhdYLW' \
    > test.out 2>&1
eval_tap $? 130 'PublicGetContentByChannelIDV2' test.out

#- 131 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '53' \
    --name 'GIDhNC66szbCCf73' \
    --offset '71' \
    --sortBy 'bYkBLyO6A0Fqfhna' \
    --subType 'B3YxKNdOTacCcJfI' \
    --tags 'fXshuLUk5WdpxjZx,5noXPhPUTKbonouc,NmzwOZOK56sDkci5' \
    --type 'rZ8iMlOuksQJCiRF' \
    > test.out 2>&1
eval_tap $? 131 'PublicListContentV2' test.out

#- 132 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["iZWwJ7NrTb1XTB9Y", "QzUJ9XlYJ8BzP6EU", "mUXGM5anIloyj9lh"]}' \
    > test.out 2>&1
eval_tap $? 132 'PublicBulkGetContentByIDV2' test.out

#- 133 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["bvuQdW2jwKUckc79", "4ryY91lX8DD4MYXl", "rJ81lHvv9rqvEoM8"]}' \
    > test.out 2>&1
eval_tap $? 133 'PublicGetContentBulkByShareCodesV2' test.out

#- 134 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'YmVjAkO3HKsEp6Kl' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByShareCodeV2' test.out

#- 135 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'qwW4djrexcbHdEto' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByIDV2' test.out

#- 136 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'QvpV344RctmTozCi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'PublicAddDownloadCountV2' test.out

#- 137 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId '8HeV6jbalHmqBBfi' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '91' \
    --sortBy 'Iz8tne5dbguBF6Gs' \
    --userId 'vvdl8jHz9x7XZIjU' \
    > test.out 2>&1
eval_tap $? 137 'PublicListContentDownloaderV2' test.out

#- 138 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId '4IK9lOLaZaMphKCq' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '50' \
    --sortBy 'q3EVheJjoEEXBLIx' \
    > test.out 2>&1
eval_tap $? 138 'PublicListContentLikeV2' test.out

#- 139 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'GnNuhoJM3WWPvvCi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateContentLikeStatusV2' test.out

#- 140 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'jISd97KORRhxSWLW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNfHRD3V15QaGGL4' \
    --body '{"contentType": "6LuxJF3sbeqWBdQu", "customAttributes": {"WfgBAKx27MSBqabU": {}, "XOGkkoMUZn1YXj5z": {}, "FZeOCOR9NvBQZSJP": {}}, "fileExtension": "OIKrRBrYVzi9ui3l", "name": "vozTt9TsH7A0TuU2", "subType": "aL4bPkk11sys6Gdk", "tags": ["Dcos5uVJ0BJfZ0jv", "A54CSqZFDsO1skRj", "OU1SMfQVQa6blj9R"], "type": "dd85bdYUumPKVSZC"}' \
    > test.out 2>&1
eval_tap $? 140 'PublicCreateContentV2' test.out

#- 141 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'g3XTc9vQe0dHJfF6' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KIuvnRCa9JktyBdx' \
    --userId 'kZKrEWFw9GYxjiiO' \
    --body '{"customAttributes": {"QAD77ci0vfWVZoRR": {}, "MPi57HyKKz5nyI6u": {}, "lKNKoXa0dgx1JgjC": {}}, "name": "56pda3YhtQxpCYME", "subType": "6x21pdX2QSPAd9sx", "tags": ["oLnWGP1PafIjLX8c", "e0KbNN7Ycl2JfmQp", "lvGjVQ4aebjfgGu4"], "type": "72oWJlfglLM4xjfk"}' \
    > test.out 2>&1
eval_tap $? 141 'PublicUpdateContentByShareCodeV2' test.out

#- 142 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'NL4lU6jaGfsD1cfs' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'wmeFpvtDtetoQVFL' \
    --userId '8LNW11vtpaTxi7k4' \
    > test.out 2>&1
eval_tap $? 142 'PublicDeleteContentByShareCodeV2' test.out

#- 143 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId '89jRCn48bvkCPfKo' \
    --contentId 'fwXOIZZQAJza84lK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmVOaTS6xBbNrSUA' \
    > test.out 2>&1
eval_tap $? 143 'PublicDeleteContentV2' test.out

#- 144 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'W2ak7ISDrBVg6NuD' \
    --contentId 'ZvPb1kuUfNfUDe4g' \
    --namespace "$AB_NAMESPACE" \
    --userId '7q6PHEaqbzHvDDl1' \
    --body '{"customAttributes": {"jiLw3XMGBA6JXDpA": {}, "1tIC45C0oaGouFu4": {}, "hXONgUwJnUpryDeR": {}}, "name": "cpUvlrw2MwC1uuok", "subType": "paIjL0Vxe5n9Lx3Q", "tags": ["cFo9gxOgvDc7xMrR", "Kvw8ISP2WKmCRRXB", "xlalCHtWlKxLpS8f"], "type": "LWoQ5nuJhatQPxR7"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicUpdateContentV2' test.out

#- 145 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'dvBVC5zgOKLTDmHe' \
    --contentId '8c1eJ9sde7Ryt4ud' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iv22M18uux9xBomQ' \
    --body '{"fileExtension": "FPFWy5cwNPI6aFo0", "fileLocation": "MVwDZCIXFNEL3uWV"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentFileLocation' test.out

#- 146 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'Rz3V7YbJM3bNLWHA' \
    --contentId 'bCZixe2cQ6O30lpz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cBQMAEcNcJqrKxnM' \
    --body '{"shareCode": "zSYoc4ZjiMY4H34B"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateContentShareCodeV2' test.out

#- 147 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId '6wVd8ipcKDwQeUWt' \
    --contentId 'jCC2UH6jzMO3AfmO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S5mQNyRPZFPNP56l' \
    --body '{"contentType": "1AT6OLKmZhCZxxPP", "fileExtension": "dPwOtEuWBSO2jJep"}' \
    > test.out 2>&1
eval_tap $? 147 'PublicGenerateContentUploadURLV2' test.out

#- 148 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UnEEgja2mIE2kLTn' \
    --limit '73' \
    --offset '23' \
    --sortBy 'wc5XmkCuL5W4tKt6' \
    > test.out 2>&1
eval_tap $? 148 'PublicGetContentByUserIDV2' test.out

#- 149 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'G3j9LYdG7xVPqBqe' \
    --namespace "$AB_NAMESPACE" \
    --userId '9RDQMBSYAFLqp8PF' \
    --body '{"screenshots": [{"description": "5hCcoukWpnbz4ys7", "screenshotId": "j6lxuU3u2HEG0qfK"}, {"description": "egvFTD1sPykS8YLm", "screenshotId": "wtYgWGcA0h4G1LZ1"}, {"description": "HaX5UBMbsF44VTsL", "screenshotId": "DRzdq22cbnyK3ggF"}]}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateScreenshotsV2' test.out

#- 150 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'Dh2kaZP7pnnVfxPw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c259HF9ejHaILQru' \
    --body '{"screenshots": [{"contentType": "AuYyJLYGqMv824ou", "description": "SgkpK70uJmUL0uzE", "fileExtension": "jfif"}, {"contentType": "gFVGR71rJOBy6lsj", "description": "1AKGBjnHmaAu4YK8", "fileExtension": "jpg"}, {"contentType": "FbnATCzUOIzVcy9k", "description": "3ie64Vnwa0ClGQJu", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 150 'UploadContentScreenshotV2' test.out

#- 151 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'Cj8hgFsqHC9h5JPi' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'MEtgKuiGTYgwWv5X' \
    --userId 'ldL6rOVGcRAn51rV' \
    > test.out 2>&1
eval_tap $? 151 'DeleteContentScreenshotV2' test.out

#- 152 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'AQSxp4qTB54mKA3V' \
    --namespace "$AB_NAMESPACE" \
    --userId '9DKlCeZ7mLYsHooO' \
    --limit '70' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetGroupContentsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE