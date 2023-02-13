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
    --limit '13' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EJ1Bilph"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '0BCCnFir' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "RRW8CCnP"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'ChceheCF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'dRriM1IJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "CMOJI6bU", "customAttributes": {"zVrCqhxM": {}, "84Gtr6ab": {}, "XEL0svKk": {}}, "fileExtension": "LtxwWIMM", "name": "2w45WWEb", "preview": "4RdbbW0e", "previewMetadata": {"previewContentType": "EaU00YN6", "previewFileExtension": "vETfQuUS"}, "subType": "nfSuwM5w", "tags": ["fVdTDuw2", "RF2rQcX5", "IsnNUd3L"], "type": "yRu2E2i0"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'PjA082Vw' \
    --contentId '3TrR9wgt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "S3USX0id", "customAttributes": {"Xn0E4Vwo": {}, "lgItYkUK": {}, "8g5lXfti": {}}, "fileExtension": "GTyCrJly", "name": "9VmpPa2c", "payload": "ihUsFFjO", "preview": "WpBRMYOL", "previewMetadata": {"previewContentType": "qKda1wTl", "previewFileExtension": "VZLxF07Z"}, "subType": "jnDZZuFM", "tags": ["yxJjax2L", "bbVwa2SK", "PLvVTyu6"], "type": "dLPGhpN3", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'fikB0cw5' \
    --namespace "$AB_NAMESPACE" \
    --creator '8MIuEq1U' \
    --isofficial 'QU3Ayq1z' \
    --limit '13' \
    --name '9sGYDCKx' \
    --offset '69' \
    --orderby 'P2L9jd2q' \
    --sortby '0Hydjsm1' \
    --subtype 'NGmItgD4' \
    --tags 'f6oh2BM1,Luq4x5lu,AYxo2Eje' \
    --type 'qIbzDJv0' \
    --userId 'UB0Nfe2j' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'f0TIxmf3' \
    --contentId 'qpox8UTq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["O98dGWse", "kJb4jm1S", "SchtV16h"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'GefOIFsl' \
    --isofficial 'afb5eBn3' \
    --limit '100' \
    --name 'wmRc7JOC' \
    --offset '90' \
    --orderby 'XamHNFJl' \
    --sortby 'WX2dvPrA' \
    --subtype '9SjTzqFu' \
    --tags 'rW52nhjk,rpMlDyJg,W779Kfxr' \
    --type 'BuGPQjUJ' \
    --userId 'wA5H9cTv' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hkkjERcP' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'hCywVtsD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'WLkBeVmw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '9HyrelPV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "wxfErDFx", "screenshotId": "vgsReFk1"}, {"description": "Ba5kpBsb", "screenshotId": "VNGxV084"}, {"description": "3EZiG55b", "screenshotId": "GNGPhJmG"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'kqnHs2kv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "wW4NFs3a", "description": "cS69NYLi", "fileExtension": "jfif"}, {"contentType": "0EFQeX4a", "description": "4YmJVvcK", "fileExtension": "png"}, {"contentType": "DsP5KsM4", "description": "qkM1gesw", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'UuQyJ3Vy' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'XtUxc1hg' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["SKVTzZGr", "tD0Q3gNy", "ibBTP5Vj"], "name": "TCGUUFLA"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'xMqGPbDy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'djwUNqtE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["5RhX428n", "fygrYrG7", "SxDnBTNm"], "name": "3nteNKBJ"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'rwZBb5Rw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'qqMrhJuz' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "WEQV0biJ"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'YuQmxg8u' \
    --body '{"tag": "07Qc8jLs"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'sfsUUChu' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["BUhxt26k", "PbDUFQb2", "PnfcPLYy"], "type": "D7UKWOyZ"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'xkREWhFC' \
    --body '{"subtype": ["QopkkCWs", "sADQoqHO", "b9jDJDS9"], "type": "ErQU4HwP"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '0hokmPQP' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '4vGTQHUf' \
    --limit '83' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'puwBbsoY' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'P2VnIGtQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G1YDtQh9' \
    --body '{"name": "6dyVOrRe"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '04OyB7s7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIej7Hfi' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'XyqPHzLH' \
    --contentId 'OIGrhI0x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aDj2LKUL' \
    --body '{"contentType": "qJLEx7qr", "customAttributes": {"hFm3to8l": {}, "d1tTR5kk": {}, "InsQDxdM": {}}, "fileExtension": "2pncFUUV", "name": "T85EjLLG", "payload": "fnoTB3qb", "preview": "JGmJ1wSk", "previewMetadata": {"previewContentType": "oqd4hBu5", "previewFileExtension": "HbMAWM41"}, "subType": "dzDL8P0H", "tags": ["vstrALuL", "KVu8WpP5", "xlCZbljO"], "type": "fxYDrTEM", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'xt2llZTn' \
    --contentId 'V5oCmavU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wb8g7MqX' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'I4VwHhcO' \
    --limit '64' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'cf5U3xe7' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'uBQlFfb5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zPM8SYe7' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'wFEDYkFh' \
    --limit '46' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'CdM6TCyG' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'HdeZtxKZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '9nDlagQH' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'FYpQA1D1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kztvuILq' \
    --body '{"contents": ["3p4X7nnm", "YkEXyGHG", "p49sdiAX"], "name": "UfHMcq2J"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'v4pPZCtI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uiYp3mBi' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'F8MK1JUJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxN7nrYN' \
    --limit '65' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '5aR0HI5p' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'xViMXVSI' \
    --namespace "$AB_NAMESPACE" \
    --creator '9pGUVmhq' \
    --isofficial 'Zjh9N0tX' \
    --limit '38' \
    --name '0hd1mhRH' \
    --offset '73' \
    --orderby 'pXfYZpCs' \
    --sortby '8Ule3QqU' \
    --subtype 'i4reVlLq' \
    --tags 'dpZsJ33e,YVtC5e4k,J2edRDPn' \
    --type 'qy9LnaR0' \
    --userId '74ey48RN' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '2Pgos6Ek' \
    --isofficial 'ry9KXtvc' \
    --limit '81' \
    --name '4M5cpenl' \
    --offset '43' \
    --orderby 'CzXq8ii2' \
    --sortby 'gYXdy5Jd' \
    --subtype 'on4CIeku' \
    --tags 'suVQ0BOz,L66lJfW2,k9qTCJ29' \
    --type 'ErlR8Xuf' \
    --userId 'ghOg6RWT' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["wYq4IddE", "ZdHUvNIl", "zwuXHYW4"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '84' \
    --name '1n8kQzBX' \
    --offset '15' \
    --orderby '0AOTedZq' \
    --sortby 'h0oBY6o8' \
    --subtype 'A3qbUUwz' \
    --tags 'qw7stUz2,kAI8IleX,UBLpJ6av' \
    --type 'QhH19WbN' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'YA3aEPaK' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'alxXmjIF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'zo6BSeMk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'kO9fBAav' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'jIbmDEoL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '82' \
    --orderby 'CWWvHywY' \
    --sortby '1HWr5Ay6' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'E5wuP19O' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdO8482U' \
    --limit '57' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'EvK3Cvc0' \
    --body '{"name": "a2SAqUWi"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '0SFcmBUt' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'NAKSjNiQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z6SpeJ2m' \
    --body '{"name": "IkOpJxBD"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'CzoQ5pvk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GHPKspSk' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'jGowpX6T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AhG2OVaV' \
    --body '{"contentType": "F1RFz8tO", "customAttributes": {"lxyaRqiJ": {}, "256CQuME": {}, "oatX7Bjy": {}}, "fileExtension": "oqaC9L8h", "name": "XaVp1dCa", "preview": "fvkocaeX", "previewMetadata": {"previewContentType": "nVstkNBd", "previewFileExtension": "VYuAw84P"}, "subType": "g0teSOJg", "tags": ["hRvmt5aL", "oM5pjZWZ", "drQ3i6LH"], "type": "Q5rpH5oe"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'cjGHCMjG' \
    --contentId 'NzKFUz0M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nY2w005Z' \
    --body '{"contentType": "fjILvcBn", "customAttributes": {"8TjadolT": {}, "IzcNsyeE": {}, "V1RRmafe": {}}, "fileExtension": "UzHVDI8k", "name": "ubMsbyva", "payload": "tTqKyJhU", "preview": "57ZnfigC", "previewMetadata": {"previewContentType": "I4IkXJtH", "previewFileExtension": "MFGJm9br"}, "subType": "auM2klAJ", "tags": ["Bf27pJOE", "PlKPwBQ8", "I48PBcVi"], "type": "CSGTI161", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'c49uBaPO' \
    --contentId '7ZZPwN2q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AdFCfeqT' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '2qc6b16k' \
    --limit '42' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'mDRryUCO' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'QbcQpvuJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMPsDWuZ' \
    --body '{"screenshots": [{"description": "FCADRIlS", "screenshotId": "kN6U9S7r"}, {"description": "Z5LukCEs", "screenshotId": "HGBLthrV"}, {"description": "Alqd60PL", "screenshotId": "eKfFUFee"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'ue3F1TLL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gz5QPYXJ' \
    --body '{"screenshots": [{"contentType": "UtuI7Yfk", "description": "8uJ3dcIK", "fileExtension": "jpeg"}, {"contentType": "0cH1ZbGT", "description": "tmDHsZo2", "fileExtension": "png"}, {"contentType": "6JRwboVc", "description": "RQNkSLVt", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'd6T0JaBW' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'mxkkAKDW' \
    --userId 'NJpPJN7x' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkPh9JHK' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'j7cxhzTu' \
    --limit '64' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'uQyJ6PG8' \
    --limit '97' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '7ad2Z2W9' \
    --limit '5' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1GbHQWDV' \
    --body '{"contents": ["Tcn79w6t", "rirfPvFe", "UQBcj3bB"], "name": "N50ICcT9"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'MtwZFHBB' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'lHbwcn7I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gLexdIj2' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'tscTpzdG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBX8n1kJ' \
    --body '{"contents": ["nwVM65gx", "GhGPjCay", "DlkAi3eX"], "name": "8s2iKQKV"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'F6T9ZhIX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bxYSKSw6' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '9azYhpMJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mjf5DgLY' \
    --limit '72' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'emXU4wnn' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE