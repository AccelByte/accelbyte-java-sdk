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
echo "1..92"

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
    --body '{"name": "AxcVpFrt"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'tufHIRdH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "9UzVRiXb"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'qlAw7r6W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '2ktQG0h5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "JAav5kRa", "customAttributes": {"62WopBJH": {}, "PtcDs8bB": {}, "ZLCXLx8b": {}}, "fileExtension": "bgorQeFb", "name": "Q1g7qbPn", "preview": "gUNB1vRo", "previewMetadata": {"previewContentType": "dwpzS6Da", "previewFileExtension": "Dpv8N7ZQ"}, "subType": "VqGj6oDL", "tags": ["jWjkY1aX", "lFcDtgOj", "chIua5tW"], "type": "EIC32ogW"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '7olvbTgr' \
    --contentId 'hRTcPiSu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "L0Sly6XM", "customAttributes": {"4OI18mAQ": {}, "LnzjMf8G": {}, "Z2WBZqxY": {}}, "fileExtension": "G3aREAu2", "name": "D6QVKNCW", "payload": "P75TB0i7", "preview": "pKxR8dl0", "previewMetadata": {"previewContentType": "zRVW4EZG", "previewFileExtension": "9m0XcgGV"}, "subType": "bMqSszE8", "tags": ["GHavj7Ao", "rKsxwkos", "AVerXpc1"], "type": "C8XfwHuK", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'LEzth6mX' \
    --namespace "$AB_NAMESPACE" \
    --creator 'hzkzWkFe' \
    --isofficial 'ZSoEAcBd' \
    --limit '100' \
    --name '7MIIR7Ck' \
    --offset '50' \
    --orderby '5tA5jUmi' \
    --sortby 'TqpyhPFd' \
    --subtype 'xLzFQN05' \
    --tags 'MYzYiKWe,5dNRljv7,IPrDQQRg' \
    --type 'at0SevkL' \
    --userId 'GMS0lyuI' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '9a2I9u6V' \
    --contentId 'pbsx5w8h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["UI06UpOX", "GSLmCVuH", "OPlLlkvR"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '8sKgnuRk' \
    --isofficial 'gghGoYup' \
    --limit '61' \
    --name 'jvjKoyD6' \
    --offset '92' \
    --orderby 'YokahFjk' \
    --sortby 'QsfCaTmt' \
    --subtype '1d67FXGk' \
    --tags '2s9Q0mPV,o3twu0Me,sTCf9x4r' \
    --type 't69lna7q' \
    --userId 'xNeIxPz6' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'MbwL6IY6' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '9z1UaLqY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'SYWytLPz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'iZMdjxcB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "ZufQxGiH", "screenshotId": "PllG4cYE"}, {"description": "zfTD1ZBm", "screenshotId": "3MqHcUmL"}, {"description": "ZZbSqb8R", "screenshotId": "wNmn9HrN"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'Qy4uZAAi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "E0mit9RG", "description": "CCHYzUOc", "fileExtension": "jpg"}, {"contentType": "zzWi9gwQ", "description": "Yv7t1o7T", "fileExtension": "png"}, {"contentType": "6Jt4Ymos", "description": "9Jcdos4f", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'cTVU6RBt' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '0zYoMcHy' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["UEXlAvxJ", "MdalwSyl", "iWMNW5Ny"], "name": "Lu0M3VHh"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '2EI8JlDb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'PWbQ6Q9l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["NmqRBaAk", "LnvxkT1X", "68cmDc3f"], "name": "xU8MyKrQ"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'pM4hkkK6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'KKXNB3Gv' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "mF51Tkhj"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Ynaq6foW' \
    --body '{"tag": "vXa3bMrX"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'sDr6kILs' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["SyDdmykm", "oPYgc2L4", "jk4Lo0LS"], "type": "P0pf4Ixj"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Ukl535X3' \
    --body '{"subtype": ["ateEKDpA", "Dz1x3poD", "3Qgb3boL"], "type": "QQ1MzH7Q"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'm8bwbmXg' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'dAPh1ETh' \
    --limit '67' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'QZxfgPub' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'TDIHrvqA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThuwjRHp' \
    --body '{"name": "KKTlmVr9"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'XuoJbRFQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKVPHbn4' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'Xxtu7LQR' \
    --contentId 'ENjEEztx' \
    --namespace "$AB_NAMESPACE" \
    --userId '1WsYSiZq' \
    --body '{"contentType": "an0nSBJr", "customAttributes": {"oav91GXl": {}, "vPG6bFYR": {}, "eVHQipcC": {}}, "fileExtension": "x9Zw5D2L", "name": "7vIYhGGS", "payload": "yEW4ZJJ4", "preview": "2d3PBddN", "previewMetadata": {"previewContentType": "8S48l9ly", "previewFileExtension": "NApflxqM"}, "subType": "rj3oZk03", "tags": ["QXcKMDYD", "DxHSZjtq", "XyJ58f7G"], "type": "c26SaiGV", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'ZxzfTcyi' \
    --contentId 'uATus9hs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fpFDcSDG' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '8aMVGLiB' \
    --limit '81' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDjqoxcw' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'gGLXpUL4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pp2ncYAH' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'tfIovmv9' \
    --limit '13' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'sR5cJcHm' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '3SZLxoRD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FuuuySj2' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '9a9LJE8H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oRS1X2PF' \
    --body '{"contents": ["AAMwzHPx", "B1UskYs4", "Yw20DOqO"], "name": "BSC2DKHR"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'uPMMWH8Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b33T5UBJ' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'CjfcnLRf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xeCSz9WE' \
    --limit '18' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '8KlloeH0' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'JT1yduat' \
    --namespace "$AB_NAMESPACE" \
    --creator '2vQR3biB' \
    --isofficial 'fsu4jmsR' \
    --limit '62' \
    --name 'sXzOXQAk' \
    --offset '14' \
    --orderby 'mqrxzTtu' \
    --sortby 'Ll4XlbGL' \
    --subtype '8QOxtjzm' \
    --tags '8y2wNhmw,oYZyI4EF,ZKBcYrCE' \
    --type 'AE7WIsfm' \
    --userId 'x40NLRc6' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'm8heKnWh' \
    --isofficial 'zfe2Nube' \
    --limit '29' \
    --name '7fdgLA84' \
    --offset '29' \
    --orderby 'YYk6QEgJ' \
    --sortby 'jBbEDoNf' \
    --subtype '3n0hEoRC' \
    --tags 'Acf80zfF,yabWAgIU,XiI07A68' \
    --type 'eaqC2J9j' \
    --userId 'yEW6GLbc' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["0NaKDUL3", "sa13lk1d", "QBHO86Il"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '16' \
    --name '3CO39PXD' \
    --offset '81' \
    --orderby 'qUXlTDBz' \
    --sortby 'OuYsaZA2' \
    --subtype 'yyd4mbqo' \
    --tags 'OfADMMAX,FaY9eKa6,99bRVhya' \
    --type 'KwwrAP2a' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Mlu7WtjC' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'toYetOO8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '47g8OudO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'fjnCuHZ3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'QyXJRcQW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '25' \
    --orderby 'Ns92epxk' \
    --sortby '0i8VxsZN' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'reSvf969' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '9mCEHThU' \
    --limit '73' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'kETAsSp7' \
    --body '{"name": "gh4TeUTk"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'OkAYfJB8' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'AT9t4Tv2' \
    --namespace "$AB_NAMESPACE" \
    --userId '07Y2QD3o' \
    --body '{"name": "D5fLCr3O"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'OlXVv8ZG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F7uYnGzp' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'ipNDigNJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ma1MbqqZ' \
    --body '{"contentType": "tfNWql4n", "customAttributes": {"mwAft4gq": {}, "kNNlWkD9": {}, "eOziYRFO": {}}, "fileExtension": "n0jJLHC9", "name": "LxhvNXTw", "preview": "GBCtohLt", "previewMetadata": {"previewContentType": "l9Zuhytm", "previewFileExtension": "5UDrT6QX"}, "subType": "Cs5SPBbR", "tags": ["PZTF6oQA", "XVG7tnsZ", "g5QgXjvy"], "type": "GJPN4eXb"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'JE5Vs2Gc' \
    --contentId 'yomQoIXi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mBJehyxl' \
    --body '{"contentType": "NsjUgxBk", "customAttributes": {"F6wFPoJe": {}, "QediogEh": {}, "hM2rIizG": {}}, "fileExtension": "dKvOPdq5", "name": "xrgxSmy1", "payload": "DN9LFkYW", "preview": "5DQyj4bj", "previewMetadata": {"previewContentType": "5Ro2ogaK", "previewFileExtension": "t2ujQSa3"}, "subType": "Zdb65UXm", "tags": ["y0Zp6iIa", "TIKUkmkk", "9QM0NBMA"], "type": "9ORxpzwL", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'AK6eXUGP' \
    --contentId 'Jsw1fiP8' \
    --namespace "$AB_NAMESPACE" \
    --userId '0G9Pclxc' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'ft2ulIJz' \
    --limit '86' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'yrVEiOG4' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'UcqsuGKH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hMRWLVd3' \
    --body '{"screenshots": [{"description": "DlhLuIpo", "screenshotId": "mM8sm1Mi"}, {"description": "aI1mX2tJ", "screenshotId": "oARtdbBe"}, {"description": "7udsMrok", "screenshotId": "0WvGYYnx"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '4V709xbn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GezKsDwG' \
    --body '{"screenshots": [{"contentType": "2omOR2nv", "description": "YI9TVqJd", "fileExtension": "jpeg"}, {"contentType": "jvsugAOS", "description": "7u8RiWye", "fileExtension": "jpeg"}, {"contentType": "L4bTxBmZ", "description": "jdrrIxsB", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'NRsB1fPq' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'qRRulpqp' \
    --userId 'ymDkQhtr' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'HWwRVnwV' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLy8wbhM' \
    --limit '37' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'sAHjapIk' \
    --limit '20' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rf4wP57d' \
    --limit '57' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNR88YbC' \
    --body '{"contents": ["tmKy8M9z", "VrjfGXZn", "qAQUoY1G"], "name": "jlIIk0iK"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTTS1j02' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'o7JjTXAQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N0qdskdQ' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'V0TqI8EF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nmDbxIxi' \
    --body '{"contents": ["4YKlONk2", "Q5Y4Jvai", "zwiilatu"], "name": "Ujjt9lIM"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'Gql5ElEa' \
    --namespace "$AB_NAMESPACE" \
    --userId '9EIIlGcH' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'B3CfR3nc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dlwi3v3M' \
    --limit '65' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJ1KesKo' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE