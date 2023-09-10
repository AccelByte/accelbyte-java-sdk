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
echo "1..93"

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

#- 19 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'RByjlBiuFM3FIoVk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "8T3GpAnkCmBUqg2S", "screenshotId": "CnqntX9y1aZSWMiV"}, {"description": "i10sG6vxkfUcmqRR", "screenshotId": "bceJ5i0EeDxOgBnh"}, {"description": "hqElIaDml48wdNFL", "screenshotId": "Tm5T50x9WT0GfH2r"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateScreenshots' test.out

#- 20 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'tOa4EXsXzOXQAk4m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "qrxzTtuLl4XlbGL8", "description": "QOxtjzm8y2wNhmwo", "fileExtension": "bmp"}, {"contentType": "yI4EFZKBcYrCEAE7", "description": "WIsfmx40NLRc6m8h", "fileExtension": "bmp"}, {"contentType": "Jgas4b6z3LNUj7fd", "description": "gLA84Z8YYk6QEgJj", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUploadContentScreenshot' test.out

#- 21 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'EQlULdJz4mnRBkMN' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'xvvKgAT8mJrYq6hR' \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteContentScreenshot' test.out

#- 22 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetAllGroups' test.out

#- 23 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["loqxM3gpwxcfMy9X", "zjjI5YbsKoADkzJE", "N2VHzih3bit0VWn3"], "name": "CO39PXDNxtXgeO3F"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateGroup' test.out

#- 24 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'gkXhjDzaQY3snn2Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetGroup' test.out

#- 25 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'kP7cFdP43e5dC9XI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["BudfZgrbHDIDm4hM", "zF4TxodenSrUTvfq", "U0bfoMm5cTtFWbot"], "name": "QyXJRcQWsmqPNs92"}' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminUpdateGroup' test.out

#- 26 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'epxk0i8VxsZNereS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminDeleteGroup' test.out

#- 27 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'vf9699mCEHThUJkE' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminGetGroupContents' test.out

#- 28 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetTag' test.out

#- 29 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "sSp7gh4TeUTkOkAY"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminCreateTag' test.out

#- 30 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'fJB8AT9t4Tv207Y2' \
    --body '{"tag": "QD3oD5fLCr3OOlXV"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateTag' test.out

#- 31 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'v8ZGF7uYnGzpipND' \
    > test.out 2>&1
eval_tap $? 31 'AdminDeleteTag' test.out

#- 32 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetType' test.out

#- 33 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["gNJma1MbqqZtfNWq", "l4nmwAft4gqkNNlW", "kD9eOziYRFOn0jJL"], "type": "HC9LxhvNXTwGBCto"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminCreateType' test.out

#- 34 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'hLtl9Zuhytm5UDrT' \
    --body '{"subtype": ["6QXCs5SPBbRPZTF6", "oQAXVG7tnsZg5QgX", "jvyGJPN4eXbJE5Vs"], "type": "2GcyomQoIXimBJeh"}' \
    > test.out 2>&1
eval_tap $? 34 'AdminUpdateType' test.out

#- 35 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'yxlNsjUgxBkF6wFP' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteType' test.out

#- 36 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJeQediogEhhM2rI' \
    --limit '17' \
    --name 'bRXBHUTrDzZSKscf' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetChannel' test.out

#- 37 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'y1DN9LFkYW5DQyj4' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteAllUserChannels' test.out

#- 38 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'bj5Ro2ogaKt2ujQS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a3Zdb65UXmy0Zp6i' \
    --body '{"name": "IaTIKUkmkk9QM0NB"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateChannel' test.out

#- 39 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'MA9ORxpzwLR2AK6e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUGPJsw1fiP80G9P' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteChannel' test.out

#- 40 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'clxcft2ulIJzPyrV' \
    --contentId 'EiOG4UcqsuGKHhMR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLVd3DlhLuIpomM8' \
    --body '{"contentType": "sm1MiaI1mX2tJoAR", "customAttributes": {"tdbBe7udsMrok0Wv": {}, "GYYnx4V709xbnGez": {}, "KsDwG2omOR2nvYI9": {}}, "fileExtension": "TVqJdvzcWbfUpaXp", "name": "5JMl5LL4bTxBmZjd", "payload": "rrIxsB0NRsB1fPqq", "preview": "RRulpqpymDkQhtrH", "previewMetadata": {"previewContentType": "WwRVnwVBOqOHi8pW", "previewFileExtension": "Gd1juYhiqjRJOqB5"}, "shareCode": "F93zFQbJndUDpdON", "subType": "neAczbBdHb2slt71", "tags": ["B1SmZp2JZp50CnPb", "71ORYcmQbTU5JX8c", "cLjMXJRk0eaKQDOJ"], "type": "vrTefglSs6g4iY9u", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateContentS3' test.out

#- 41 AdminUpdateContentDirect
eval_tap 0 41 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 42 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '2aCNYIWekp18lOC3' \
    --contentId 'mNqF7Bl0LcghVHfP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EspxwhRON0bc1eMb' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteContent' test.out

#- 43 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'EIjowLqc3ecjXJbZ' \
    --limit '61' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetContent' test.out

#- 44 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKoxLE1Y3Dymtj3g' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteAllUserContents' test.out

#- 45 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'iPg4x4yiPX6ues1H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hhkg1yLVbLFzHEP8' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 45 'AdminHideUserContent' test.out

#- 46 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'KSiPW3VgsZXiR1DJ' \
    --limit '69' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetAllGroups' test.out

#- 47 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'WKi6tArAURt9plCS' \
    > test.out 2>&1
eval_tap $? 47 'AdminDeleteAllUserGroup' test.out

#- 48 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'Vq8PdH6hJPUAc0RV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wXgAgntLMCuaXBWQ' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetGroup' test.out

#- 49 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'i6BqPg4xr0lCancU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZGCHsZYoLfR1KtOv' \
    --body '{"contents": ["7Zy0b65uvuKNuy0y", "tZQ7M6Nzy1adnSKO", "LFKx1dX4LuWJu3pD"], "name": "MUAeeZ97SBROPYuG"}' \
    > test.out 2>&1
eval_tap $? 49 'AdminUpdateGroup' test.out

#- 50 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '6XqP6oo7G73zdxTg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OfnwIdlNa29fDLh7' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteGroup' test.out

#- 51 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '41IslKHzGlLKWUtD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qs61OQAoxyyQpRWC' \
    --limit '17' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetGroupContents' test.out

#- 52 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPDGQhNPEwiJCf2X' \
    > test.out 2>&1
eval_tap $? 52 'AdminDeleteAllUserStates' test.out

#- 53 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'JVrlzqQls1ozhLVA' \
    --namespace "$AB_NAMESPACE" \
    --creator '3kE8jKvgatOEBM70' \
    --isofficial 'TdlNBJYOmpu1VCar' \
    --limit '52' \
    --name 'Up6Sw1I98jeZQ7hf' \
    --offset '49' \
    --orderby 'ug6CWVG8SWP3glU6' \
    --sortby 'muswVJnNnN7kAa7j' \
    --subtype '0riFc5HTHQIoVsGo' \
    --tags '7dwV9DBqFKHQkETJ,yTlUrwDTnoujQD4I,EiH9Z5qXn3aoRtlq' \
    --type 'OECohViHA5CzgFSy' \
    --userId '8X1A3PrIfapq5AAe' \
    > test.out 2>&1
eval_tap $? 53 'SearchChannelSpecificContent' test.out

#- 54 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'Me4L3mDWORBVXTII' \
    --isofficial 'JM9XsYIIZxiXNMR9' \
    --limit '56' \
    --name '9G4AvQkqsGnmyo5J' \
    --offset '72' \
    --orderby 'WPAxUMkawaGpAyrI' \
    --sortby 'wMif3BOdkocVTd4B' \
    --subtype 'xqGWV6mTJ0sQs6XN' \
    --tags 'bjvqhnUVLWu8olKd,xL6ozRmDD0jJvlfV,5OemPYdYT7DROCjt' \
    --type 'uzFMbAG9YI89hmgu' \
    --userId 'B8FOTjMLo4b9rIzq' \
    > test.out 2>&1
eval_tap $? 54 'PublicSearchContent' test.out

#- 55 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["YkEpstyVTBcrM8rG", "0rH0zcswwVeMK6Mb", "GIVIu8vvwLc7KY3u"]}' \
    > test.out 2>&1
eval_tap $? 55 'PublicGetContentBulk' test.out

#- 56 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 56 'GetFollowedContent' test.out

#- 57 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '29' \
    --name 'oVeJIePF8ZrQzP4z' \
    --offset '45' \
    --orderby 'lGdMiHKxbWCYzo8y' \
    --sortby 'O2KTK9tmmOnYnOpa' \
    --subtype 's6ghP1y4Zi7s7QBl' \
    --tags 'k44Z44B1GZgKg4uK,xaCgcGLuC3brWdTY,CfHkIySok5DiXZtL' \
    --type 'W87rGysryod3dNQr' \
    > test.out 2>&1
eval_tap $? 57 'GetLikedContent' test.out

#- 58 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'msApRA6HX3RwrKt2' \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByShareCode' test.out

#- 59 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ecozL0TOg54vCE48' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'PublicDownloadContentByContentID' test.out

#- 60 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'L5oLF6M4lNa4JUMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'AddDownloadCount' test.out

#- 61 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'HNgqRqCV7usamANk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateContentLikeStatus' test.out

#- 62 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'lOX9Sfo95HgXqKhT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'PublicDownloadContentPreview' test.out

#- 63 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 63 'GetTag' test.out

#- 64 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 64 'GetType' test.out

#- 65 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '21' \
    --orderby 'fLM9uSybRzWek2gZ' \
    --sortby 'vRrvr0n9d9lvccKM' \
    > test.out 2>&1
eval_tap $? 65 'PublicSearchCreator' test.out

#- 66 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 66 'GetFollowedUsers' test.out

#- 67 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'hrTrcBE2ItBS3KtK' \
    > test.out 2>&1
eval_tap $? 67 'PublicGetCreator' test.out

#- 68 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZWe8aoFzAyBME74H' \
    --limit '96' \
    --name '2jBOxrZDyvpcLYOW' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 68 'GetChannels' test.out

#- 69 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ML52faXUr9Sk4lq2' \
    --body '{"name": "faBcAXXKlhvyH8pa"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicCreateChannel' test.out

#- 70 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'OJtxqMPpcVfRwNj5' \
    > test.out 2>&1
eval_tap $? 70 'DeleteAllUserChannel' test.out

#- 71 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '47fH0XrKEDpEY8Vn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ocGAjci0V3tBf2jn' \
    --body '{"name": "HGKXphn50c9tNLDl"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateChannel' test.out

#- 72 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'jhZ2jxLRX3z46OCa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBeMfPlNos4yBRjr' \
    > test.out 2>&1
eval_tap $? 72 'DeleteChannel' test.out

#- 73 CreateContentDirect
eval_tap 0 73 'CreateContentDirect # SKIP deprecated' test.out

#- 74 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'ERHEonAZR8GmEu0q' \
    --namespace "$AB_NAMESPACE" \
    --userId '1p6QCyY6vSkVFWds' \
    --body '{"contentType": "bYuVEGVxYheR3j5m", "customAttributes": {"NZ6vwv7K8Asvt1j1": {}, "Rx59hesNWy2NvZ85": {}, "DDKDAF8KDsBZOuYQ": {}}, "fileExtension": "J03BAHZ7c53q7akM", "name": "pcmnnx6RVBrop9v7", "preview": "aZK3h65hbN15zfQS", "previewMetadata": {"previewContentType": "fQrtfF3TQN0OcNDL", "previewFileExtension": "r36vzohZyjMQAg5m"}, "subType": "PYhrLTyU8OhgfY9J", "tags": ["QYGF4bYXEcENx9xZ", "lAchob44lONDDwMv", "gI0HlyPR7wZNiVsF"], "type": "6xG2mXEQdbzIVy8a"}' \
    > test.out 2>&1
eval_tap $? 74 'CreateContentS3' test.out

#- 75 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'lncV7vWgSHdfo07U' \
    --contentId 'ctPErqxyMyOK06Mq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QBErxgjVBycvU4Pb' \
    --body '{"contentType": "mRDcrg0DjQjBECXv", "customAttributes": {"ea7H1m2lJFRZ3Zpr": {}, "Z60zMjhTHeh94TSe": {}, "nE5hCFkIf5weqZ18": {}}, "fileExtension": "MH57l2Zsrh90ETtY", "name": "mGukz3MnlrjcHp6B", "payload": "8Vj7rXFgDnDkdZ9b", "preview": "pjb1tdA3QhjCMW64", "previewMetadata": {"previewContentType": "f4XhIjSoTB2NMKte", "previewFileExtension": "zapPr2QEPx3zTxBG"}, "subType": "tEJIYppuUSsKoHw2", "tags": ["hyd12uSE7BEv3aev", "q6iohU1cg4W1IS3U", "v1BpWoJBaqdg2FHc"], "type": "unsS1lnaO2m9vqjh", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateContentS3' test.out

#- 76 UpdateContentDirect
eval_tap 0 76 'UpdateContentDirect # SKIP deprecated' test.out

#- 77 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'gBVZxiKdV57GvRyd' \
    --contentId '9UuL02Le8HSCslsD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd4M1F5qRIblS7Nz8' \
    > test.out 2>&1
eval_tap $? 77 'DeleteContent' test.out

#- 78 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '1GRazPAANjfBoldF' \
    --limit '83' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetUserContent' test.out

#- 79 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'yqA2clJ5gEOaCgM6' \
    > test.out 2>&1
eval_tap $? 79 'DeleteAllUserContents' test.out

#- 80 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'Yn6RugbNEIpGBFUj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'On5mM7k8nbLzvtCI' \
    --body '{"screenshots": [{"description": "W5ynMKquUicAeIVX", "screenshotId": "toWAXhMlW4tLqX7O"}, {"description": "ICf5oD1e6oI9FmYe", "screenshotId": "l0kOw72o8Zkgk0jS"}, {"description": "6rDWUwfhKvrf2AaH", "screenshotId": "4yCWrHSppnIZkNnT"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateScreenshots' test.out

#- 81 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'n3rzH5NvAtcvNedg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S1fUfKmihDbmu8eP' \
    --body '{"screenshots": [{"contentType": "WlQMVDXEHeiGTnwy", "description": "Ew6hIWDZrpP7rz3I", "fileExtension": "png"}, {"contentType": "QdbufXjYnSoIFeou", "description": "C2m38kXrDZWlGVE9", "fileExtension": "jpeg"}, {"contentType": "wVzmmBVVFfpqx1Ae", "description": "LtzcPJ3jtDYBo4FU", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 81 'UploadContentScreenshot' test.out

#- 82 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'z95OYKiqaZD63xe5' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'rruJVfLGea0ZtlzU' \
    --userId 'cuHAXz0UV31MfuGa' \
    > test.out 2>&1
eval_tap $? 82 'DeleteContentScreenshot' test.out

#- 83 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'XsAuGsZaSHevO0TQ' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateUserFollowStatus' test.out

#- 84 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'eI5yppBHoytVznCg' \
    --limit '81' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowers' test.out

#- 85 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'yx9fbT63ShEh8PbG' \
    --limit '17' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 85 'GetPublicFollowing' test.out

#- 86 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'C97uAPP8PATLpUpx' \
    --limit '8' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 86 'GetGroups' test.out

#- 87 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWFbr3RSP0W9nBhv' \
    --body '{"contents": ["hf8Q0DtJMcYQdN66", "bswAgt65X4N1LQZm", "B61JMdtwCVUrYQue"], "name": "84dwmbwFEnAZaWsQ"}' \
    > test.out 2>&1
eval_tap $? 87 'CreateGroup' test.out

#- 88 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtRYoagRJK5PX9Uc' \
    > test.out 2>&1
eval_tap $? 88 'DeleteAllUserGroup' test.out

#- 89 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'OvhPyE11TRT2SKse' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oe8VLie0LBa36KNz' \
    > test.out 2>&1
eval_tap $? 89 'GetGroup' test.out

#- 90 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'jf005CXNGehQ2aTj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TDfKFDXC7eGL5YhJ' \
    --body '{"contents": ["DWh9YWqc0qgV6d9y", "OfIMLds2DbPcaoMd", "tRLTmSvTkQQgB7ex"], "name": "YvmHMxr5hPCJJztJ"}' \
    > test.out 2>&1
eval_tap $? 90 'UpdateGroup' test.out

#- 91 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'Bg0tTJg46IewOXE2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkCh3QIZsUf8lGFX' \
    > test.out 2>&1
eval_tap $? 91 'DeleteGroup' test.out

#- 92 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'cmwTERHclOdxIwqe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxe18rNdb8Otq6j1' \
    --limit '25' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 92 'GetGroupContent' test.out

#- 93 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'qUav7k05HAQltnSo' \
    > test.out 2>&1
eval_tap $? 93 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE