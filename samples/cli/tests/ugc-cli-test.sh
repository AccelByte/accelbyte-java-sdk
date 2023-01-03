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
echo "1..91"

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
    --limit '84' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "d0Z3tCWy"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'WKnRtydD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "BVWG6Xd9"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'Xd5g0sTy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'kxdkxYrJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "x1764wxu", "fileExtension": "s3y8KDF7", "name": "aaLjdV6F", "preview": "HBQbw0es", "previewMetadata": {"previewContentType": "mqdphq4m", "previewFileExtension": "M0xSSBhq"}, "subType": "PazhpUjQ", "tags": ["d7ldSRYb", "YozKBaLe", "NUwRsKa1"], "type": "vOn0UpUW"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'M2ZzQK6V' \
    --contentId 'pVIKEPNU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "dYe0l9bV", "fileExtension": "8vCISrAx", "name": "4JzuFkGM", "preview": "rh6oBhPZ", "previewMetadata": {"previewContentType": "3nm2jJAx", "previewFileExtension": "oQerIOMA"}, "subType": "tuo7neey", "tags": ["U16eTVm6", "VIsMUSuT", "2t5vGimk"], "type": "3TqGsG2G"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'zoUXqfh6' \
    --namespace "$AB_NAMESPACE" \
    --creator 'I8jpX7Dl' \
    --isofficial 'iFRSi1lI' \
    --limit '34' \
    --name 'jcYPf8cU' \
    --offset '84' \
    --orderby 'tl00Fgnt' \
    --sortby 'TtFR1ETB' \
    --subtype 'm8Np34wj' \
    --tags '4opiTwqm,ZV0eCUGp,Y22zDwrz' \
    --type 'bgTC46RZ' \
    --userId 'UF601hMb' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'e64pn0jf' \
    --contentId 'fxz3ag6y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'Ha0n2TYm' \
    --isofficial 'w1mfrOMr' \
    --limit '67' \
    --name 'GYqR4cFt' \
    --offset '82' \
    --orderby 'ABQ8ahHc' \
    --sortby 'I2YDZDWc' \
    --subtype 'BlDkz1lx' \
    --tags 'TdEXuC2t,DQW81p2N,p9dS2UcH' \
    --type 'hV553euw' \
    --userId 'HcIzyuSM' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KwrLYp6b' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '0uM5ctIy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'L1Xadnxg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'EmE4jqxY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "OdQqAAfI", "screenshotId": "HzOdx1Sj"}, {"description": "azetgZQu", "screenshotId": "wwhOjrAQ"}, {"description": "92aI36Oi", "screenshotId": "rWnmzRW2"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '3szzKCZ5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "zSvUgwAt", "description": "CG0zajQS", "fileExtension": "pjp"}, {"contentType": "rAGlZhtl", "description": "CuQkS1Ym", "fileExtension": "png"}, {"contentType": "8mSE3tiM", "description": "rJtKLW98", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'IowUYQpQ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'suhbwWC7' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["vOBW4SvU", "utULp1UJ", "OhPT5jE1"], "name": "6j5gGCyO"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '3TfedTxB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'dJzKi2u2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["KoxHXVki", "Vuc2PuAD", "XaAwovXt"], "name": "Jf42cM8X"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'zFX46X0b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '7vcahhv7' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "mJYJmPnM"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'xQjtwzno' \
    --body '{"tag": "ByF6VQDr"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'r1IoVVrG' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["krUXS52J", "tkuSfKti", "ff18UDCM"], "type": "JoU2M08V"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ULjQd5rJ' \
    --body '{"subtype": ["HyL50zS1", "IEYfqPVi", "Og29Jtyc"], "type": "KWjiLtCl"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'n2dk5n4G' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'q6Ady71B' \
    --limit '61' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'sVXXnnOb' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'pwuTtSfu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MBwqKTyA' \
    --body '{"name": "oVFw1ehE"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'NwE9I681' \
    --namespace "$AB_NAMESPACE" \
    --userId 'joCECWMR' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'K5PjQfAF' \
    --contentId 'RaUbHovl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w53I2Shz' \
    --body '{"contentType": "ZdjQ1u9d", "fileExtension": "Q4QoPWPM", "name": "GeFH2OjG", "preview": "q5FsBW6R", "previewMetadata": {"previewContentType": "wCtt1wD4", "previewFileExtension": "HAbWgo8D"}, "subType": "194wQSDC", "tags": ["8Fybl7rz", "cT7G9sev", "gUKI7wll"], "type": "f6qhXCxM"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'tJfvdCmn' \
    --contentId '3kg4pmUT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JbTu0fvx' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Imw1Xf72' \
    --limit '42' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '8BmlBWJL' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'sdF4RdX7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDzwKgiY' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'aNTimwD7' \
    --limit '88' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'QItO07tp' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'Hmk4HB6j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ccHlxJpJ' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '3YWP35VO' \
    --namespace "$AB_NAMESPACE" \
    --userId '2b1ACOaH' \
    --body '{"contents": ["DJ417yC0", "gKBo419r", "pSB5gnrC"], "name": "cJKDemCW"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'IxQtHCQZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNHqZDNl' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '1xn5qEbN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yT1yWcGt' \
    --limit '75' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'kaqNwpOD' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'crwbKt1F' \
    --namespace "$AB_NAMESPACE" \
    --creator 'Tsz2f99H' \
    --isofficial 'pbRYOyEs' \
    --limit '74' \
    --name 'XWxxzXet' \
    --offset '84' \
    --orderby '0ighHnsx' \
    --sortby 'VL35b2Nw' \
    --subtype 'TSpfTTQa' \
    --tags 'uxiMbEET,YdzSNiCU,LeN6ne8Z' \
    --type 'tzi6UTav' \
    --userId 'vvAyzOPK' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'wlpDF0GE' \
    --isofficial '8rz02DFo' \
    --limit '69' \
    --name 'd4vDmzS4' \
    --offset '67' \
    --orderby '9y0dy4ts' \
    --sortby '1sQ8Dlyg' \
    --subtype '1ZZiguRU' \
    --tags 'QYOHPup2,EBf7cK99,e9KtS8N6' \
    --type 'VId7xFVV' \
    --userId 'ay1ZPYWZ' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["B0V1XWTh", "Ig1TgXos", "WjYo6WYT"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '4' \
    --name 'Ezxq11iG' \
    --offset '22' \
    --orderby 'RGttxkto' \
    --sortby 'kAhW8tu5' \
    --subtype '6KiQZ41u' \
    --tags 'ilSw83zB,fmds0q6M,LyP2er1U' \
    --type '1WpdG42f' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '3f02m3vj' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '4tVzUCrv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'mLNEmWgo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'ChE4zLYB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'yMCSMSlu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '41' \
    --orderby '93VH86IW' \
    --sortby 'oiGw37k4' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'sgzDFyiE' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pkt7pPse' \
    --limit '30' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ihY7WwaX' \
    --body '{"name": "3a8VRanS"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSAWuTE4' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'bmgJO11k' \
    --namespace "$AB_NAMESPACE" \
    --userId '6wWhwpSx' \
    --body '{"name": "VHpk7cpv"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '6upM5jRv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ypiCJU1K' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'f2QzwID4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxIMbD6O' \
    --body '{"contentType": "Fkt7Qldp", "fileExtension": "KhauQfby", "name": "RFmivaW6", "preview": "5irERoSP", "previewMetadata": {"previewContentType": "OK9qyCfq", "previewFileExtension": "dPsQ2JE0"}, "subType": "EKit0F3Y", "tags": ["YTe653TS", "bI8bfR0Y", "3kLGhO3l"], "type": "vqd8KV8g"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'QFYxPf0b' \
    --contentId 'BGPFFrDi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SXNhziU8' \
    --body '{"contentType": "UZxa6Lr0", "fileExtension": "pZCGC9Zo", "name": "ACwR3AFq", "preview": "uVjXigaP", "previewMetadata": {"previewContentType": "kzGxVrQQ", "previewFileExtension": "uenSfw3K"}, "subType": "ugxj4YuJ", "tags": ["lWcHC2tn", "nbkUuivt", "IcPRovPf"], "type": "Hw47fcEG"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'aNOkrW8j' \
    --contentId 'ylqh4uD1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9jf0HU9' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'esAqGAV8' \
    --limit '16' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEtWvIgD' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'hYrN1iBN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSWYdBSp' \
    --body '{"screenshots": [{"description": "JVQYlX95", "screenshotId": "R3DXg5iI"}, {"description": "MOMJZJT0", "screenshotId": "zfIctuGA"}, {"description": "u4mYFDh1", "screenshotId": "wK7z8hxB"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'IGou7nM3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jyKoRxPO' \
    --body '{"screenshots": [{"contentType": "JU1vOPKM", "description": "MRIKDCMu", "fileExtension": "bmp"}, {"contentType": "Eqix7cYW", "description": "oFyOdBL6", "fileExtension": "png"}, {"contentType": "LJAK83xf", "description": "NuhpRa7J", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'q9WGq9NQ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'BD5KFnLW' \
    --userId 'mNqtf5iK' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'd2VzHkTI' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'WHuQdLh3' \
    --limit '93' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'zsKCaSuN' \
    --limit '72' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'v6RRSL2l' \
    --limit '0' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9Cd7tAt' \
    --body '{"contents": ["AR2ewaFR", "IDvXfs23", "KsGmHkJ1"], "name": "M4lY7cQq"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'GqZ9sSjD' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'amjeNjZs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ecHr855P' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'p5eaMmet' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zM96nh8Y' \
    --body '{"contents": ["PUpd7LLn", "dGhqQjPS", "rqmsrdEN"], "name": "8Gr9Puwr"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '6MJHjoDt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XVytO1qr' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 's5Tfu1t6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IPlwq3JR' \
    --limit '77' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'ntYmX6vP' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE