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
    --body '{"id": "AxcVpFrt", "name": "tufHIRdH"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '9UzVRiXb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "qlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '2ktQG0h5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'JAav5kRa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "62WopBJH", "customAttributes": {"PtcDs8bB": {}, "ZLCXLx8b": {}, "bgorQeFb": {}}, "fileExtension": "Q1g7qbPn", "name": "gUNB1vRo", "preview": "dwpzS6Da", "previewMetadata": {"previewContentType": "Dpv8N7ZQ", "previewFileExtension": "VqGj6oDL"}, "shareCode": "jWjkY1aX", "subType": "lFcDtgOj", "tags": ["chIua5tW", "EIC32ogW", "7olvbTgr"], "type": "hRTcPiSu"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'L0Sly6XM' \
    --contentId '4OI18mAQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "LnzjMf8G", "customAttributes": {"Z2WBZqxY": {}, "G3aREAu2": {}, "D6QVKNCW": {}}, "fileExtension": "P75TB0i7", "name": "pKxR8dl0", "payload": "zRVW4EZG", "preview": "9m0XcgGV", "previewMetadata": {"previewContentType": "bMqSszE8", "previewFileExtension": "GHavj7Ao"}, "subType": "rKsxwkos", "tags": ["AVerXpc1", "C8XfwHuK", "eb9l3rGN"], "type": "9A3sNm84", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'ZSoEAcBd' \
    --namespace "$AB_NAMESPACE" \
    --creator 'W19m4eu6' \
    --isofficial 'd5tA5jUm' \
    --limit '17' \
    --name 'yZ0GhDog' \
    --offset '34' \
    --orderby 'xLzFQN05' \
    --sortby 'MYzYiKWe' \
    --subtype '5dNRljv7' \
    --tags 'IPrDQQRg,at0SevkL,GMS0lyuI' \
    --type '9a2I9u6V' \
    --userId 'pbsx5w8h' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'qUI06UpO' \
    --contentId 'XGSLmCVu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["OPlLlkvR", "8sKgnuRk", "gghGoYup"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'D391C2qt' \
    --isofficial 'PYokahFj' \
    --limit '21' \
    --name 'mLtjQHAf' \
    --offset '93' \
    --orderby 'd67FXGk2' \
    --sortby 's9Q0mPVo' \
    --subtype '3twu0Mes' \
    --tags 'TCf9x4rt,69lna7qx,NeIxPz6M' \
    --type 'bwL6IY69' \
    --userId 'z1UaLqYS' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'YWytLPzi' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ZMdjxcBZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'ufQxGiHP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'llG4cYEz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "fTD1ZBm3", "screenshotId": "MqHcUmLZ"}, {"description": "ZbSqb8Rw", "screenshotId": "Nmn9HrNQ"}, {"description": "y4uZAAiE", "screenshotId": "0mit9RGC"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'CHYzUOcE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "dscKHPEq", "description": "gA8yu7Vk", "fileExtension": "jpeg"}, {"contentType": "Jt4Ymos9", "description": "Jcdos4fY", "fileExtension": "bmp"}, {"contentType": "BMcaYmvC", "description": "kGZ5dAgq", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'UEXlAvxJ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'MdalwSyl' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["2bOItRMv", "qtlB2jJC", "SQT279ZZ"], "name": "PYGu0rdl"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'gdWyOtXi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '3choQrpO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["sDBU5Sep", "jChB3V0v", "52Dlym6p"], "name": "uQ23xoJ8"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'aeCnaLpU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'Kp44YUDj' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "WIPUvmEe"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'jtGeoyIP' \
    --body '{"tag": "a8ZRrvjj"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '7il35MXb' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["9oCMNqq9", "8SjTvhZN", "kSQ70D0H"], "type": "6BXksUC9"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'b6i5lZC9' \
    --body '{"subtype": ["xv32e8c5", "csSovoqs", "ZNBdte9N"], "type": "DUPVJf6c"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '2Z0QZxfg' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'PubTDIHr' \
    --limit '44' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'qAThuwjR' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'HpKKTlmV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9XuoJbR' \
    --body '{"name": "FQSKVPHb"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'n4Xxtu7L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QRENjEEz' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'tx1WsYSi' \
    --contentId 'Zqan0nSB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jroav91G' \
    --body '{"contentType": "XlvPG6bF", "customAttributes": {"YReVHQip": {}, "cCx9Zw5D": {}, "2L7vIYhG": {}}, "fileExtension": "GSyEW4ZJ", "name": "J42d3PBd", "payload": "dN8S48l9", "preview": "lyNApflx", "previewMetadata": {"previewContentType": "qMrj3oZk", "previewFileExtension": "03QXcKMD"}, "subType": "YDDxHSZj", "tags": ["tqXyJ58f", "7Gc26Sai", "GVkydwYW"], "type": "QG26yUZN", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'hsfpFDcS' \
    --contentId 'DG8aMVGL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iBNrDjqo' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'xcwgGLXp' \
    --limit '96' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4pp2ncY' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'AHdNzDme' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IP6rOvDz' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'KOsb392k' \
    --limit '89' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJFfRByj' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'lBiuFM3F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IoVk8T3G' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'pAnkCmBU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qg2SCnqn' \
    --body '{"contents": ["tX9y1aZS", "WMiVi10s", "G6vxkfUc"], "name": "mqRRbceJ"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '5i0EeDxO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBnhhqEl' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'IaDml48w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dNFLTm5T' \
    --limit '39' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQR3biBf' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'su4jmsRE' \
    --namespace "$AB_NAMESPACE" \
    --creator '2w1yEkLg' \
    --isofficial 'h3tIYt4S' \
    --limit '33' \
    --name 'Ll4XlbGL' \
    --offset '70' \
    --orderby 'QOxtjzm8' \
    --sortby 'y2wNhmwo' \
    --subtype 'YZyI4EFZ' \
    --tags 'KBcYrCEA,E7WIsfmx,40NLRc6m' \
    --type '8heKnWhz' \
    --userId 'fe2Nubeo' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'KFeIaFQC' \
    --isofficial 'YoDPICpn' \
    --limit '6' \
    --name 'JjBbEDoN' \
    --offset '12' \
    --orderby 'Jz4mnRBk' \
    --sortby 'MNxvvKgA' \
    --subtype 'T8mJrYq6' \
    --tags 'hRkloqxM,3gpwxcfM,y9XzjjI5' \
    --type 'YbsKoADk' \
    --userId 'zJEN2VHz' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ih3bit0V", "Wn3CO39P", "XDNxtXge"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '52' \
    --name 'FgkXhjDz' \
    --offset '0' \
    --orderby 'yyd4mbqo' \
    --sortby 'OfADMMAX' \
    --subtype 'FaY9eKa6' \
    --tags '99bRVhya,KwwrAP2a,Mlu7WtjC' \
    --type 'toYetOO8' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '47g8OudO' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'fjnCuHZ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'c46IjGa2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '3YvYmmDg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'VYPXIuvU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '89' \
    --orderby 'reSvf969' \
    --sortby '9mCEHThU' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'kETAsSp7' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'gh4TeUTk' \
    --limit '82' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'kAYfJB8A' \
    --body '{"name": "T9t4Tv20"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7Y2QD3oD' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '5fLCr3OO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lXVv8ZGF' \
    --body '{"name": "7uYnGzpi"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'pNDigNJm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a1MbqqZt' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'fNWql4nm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wAft4gqk' \
    --body '{"contentType": "NNlWkD9e", "customAttributes": {"OziYRFOn": {}, "0jJLHC9L": {}, "xhvNXTwG": {}}, "fileExtension": "BCtohLtl", "name": "9Zuhytm5", "preview": "UDrT6QXC", "previewMetadata": {"previewContentType": "s5SPBbRP", "previewFileExtension": "ZTF6oQAX"}, "subType": "VG7tnsZg", "tags": ["5QgXjvyG", "JPN4eXbJ", "E5Vs2Gcy"], "type": "omQoIXim"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'BJehyxlN' \
    --contentId 'sjUgxBkF' \
    --namespace "$AB_NAMESPACE" \
    --userId '6wFPoJeQ' \
    --body '{"contentType": "ediogEhh", "customAttributes": {"M2rIizGd": {}, "KvOPdq5x": {}, "rgxSmy1D": {}}, "fileExtension": "N9LFkYW5", "name": "DQyj4bj5", "payload": "Ro2ogaKt", "preview": "2ujQSa3Z", "previewMetadata": {"previewContentType": "db65UXmy", "previewFileExtension": "0Zp6iIaT"}, "subType": "IKUkmkk9", "tags": ["QM0NBMA9", "ORxpzwLR", "2AK6eXUG"], "type": "PJsw1fiP", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'G9Pclxcf' \
    --contentId 't2ulIJzP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yrVEiOG4' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'UcqsuGKH' \
    --limit '15' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRWLVd3D' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'lhLuIpom' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8sm1Mia' \
    --body '{"screenshots": [{"description": "I1mX2tJo", "screenshotId": "ARtdbBe7"}, {"description": "udsMrok0", "screenshotId": "WvGYYnx4"}, {"description": "V709xbnG", "screenshotId": "ezKsDwG2"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'omOR2nvY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I9TVqJdv' \
    --body '{"screenshots": [{"contentType": "zcWbfUpa", "description": "Xp5JMl5L", "fileExtension": "pjp"}, {"contentType": "CSa8SRgw", "description": "sAj1ik1j", "fileExtension": "bmp"}, {"contentType": "NRsB1fPq", "description": "qRRulpqp", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'wrS0uPdj' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'hdinpng5' \
    --userId 'BLy8wbhM' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ssAHjapI' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjRJOqB5' \
    --limit '64' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '3zFQbJnd' \
    --limit '96' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'DpdONneA' \
    --limit '4' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'zbBdHb2s' \
    --body '{"contents": ["lt71B1Sm", "Zp2JZp50", "CnPb71OR"], "name": "YcmQbTU5"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'JX8ccLjM' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'XJRk0eaK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QDOJvrTe' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'fglSs6g4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iY9u02aC' \
    --body '{"contents": ["NYIWekp1", "8lOC3mNq", "F7Bl0Lcg"], "name": "hVHfPEsp"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'xwhRON0b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1eMbEIj' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'owLqc3ec' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jXJbZDKK' \
    --limit '30' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'xLE1Y3Dy' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE