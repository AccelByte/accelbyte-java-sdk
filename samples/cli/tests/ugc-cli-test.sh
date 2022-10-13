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
    --limit '36' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "2f3mDrVr"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'e6PjWes5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "3MoVGY3s"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'X9qZLQi4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'llLJm6xG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "dBx0E88z", "fileExtension": "ZPQzdDca", "name": "HQQoGJCx", "preview": "TrUL3ZYq", "previewMetadata": {"previewContentType": "EGXEbm4i", "previewFileExtension": "GLT7aeEQ"}, "subType": "xovFXpQ2", "tags": ["W642pHYm", "PnfWH608", "f3Fir3OW"], "type": "tXGGDFIY"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'TP9uChDV' \
    --contentId '1YgJ5Oqr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "HqvFSswd", "fileExtension": "jLfUhL9x", "name": "7GJkpoQ7", "preview": "NQO4Txv4", "previewMetadata": {"previewContentType": "bxQsFQrA", "previewFileExtension": "5qrsOjGD"}, "subType": "SD1rsOQh", "tags": ["hmXLpQxu", "sOnvHj28", "aoGNdPvS"], "type": "SJ7M0s3e"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'Hs1GB9VB' \
    --namespace "$AB_NAMESPACE" \
    --creator 'nAVQre10' \
    --isofficial 'tGCEVlHD' \
    --limit '65' \
    --name 'WiA2RnW7' \
    --offset '11' \
    --orderby 'LDYlDS9G' \
    --sortby 'kMUV2ECI' \
    --subtype 'VYOgb9vJ' \
    --tags 'ZIPSuKHf,vJe2F0lo,f3uvDMeo' \
    --type '4mYZPtCA' \
    --userId 'VhQgP4g7' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'BJSm7yaY' \
    --contentId 'ItnUo5D6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '1d5Dxvro' \
    --isofficial 'rmtS11N2' \
    --limit '5' \
    --name 'rRBCcgzQ' \
    --offset '67' \
    --orderby 'Z2bHxnxB' \
    --sortby 'uDUaYUP9' \
    --subtype 'TMA97Ppf' \
    --tags 'PZRMLYcc,0YpoQqT7,5xrsqMx6' \
    --type 'sxBcGPvk' \
    --userId 'kyRqTnxy' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OnS6VO2j' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '4bVJGKgu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'CTV0fCde' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '7C2rdLva' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "WoWGSPHq", "screenshotId": "iZOmCP3d"}, {"description": "EVRfy3H2", "screenshotId": "BNsGXLxc"}, {"description": "QDbso9Oo", "screenshotId": "tG71qqU6"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'L6A07Gtw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "rXU1joIY", "description": "wuI581rW", "fileExtension": "jpeg"}, {"contentType": "boCsxILZ", "description": "Pd6i67It", "fileExtension": "png"}, {"contentType": "RVQxNVss", "description": "9iimQDCA", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'bYPSGNnC' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '6H3IW9Oa' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["7QMMDi0F", "jfHnTfRj", "0DuoEDw2"], "name": "0oMekf47"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'niE893Vo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'qs5eoQ2T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["EU7YFIgQ", "NjIFjWlZ", "37y1X4Ga"], "name": "yNykiGW1"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'yVCL6tq5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ax4u0bYH' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "pYzKhGRC"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'TWfsaPH4' \
    --body '{"tag": "EHt2DF9P"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Ri3hzy9b' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["dY6xetJ0", "KGLMcC3b", "VLLElhKf"], "type": "rCAXyNDB"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '3wq2EUkZ' \
    --body '{"subtype": ["1HitYVsj", "MiWjyd5t", "nA397vhq"], "type": "S693rcms"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'LPC01wiR' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ussEODfw' \
    --limit '0' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'q5MsE3Xh' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'kLYSXNfw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'anBbSDzC' \
    --body '{"name": "H6VcXFZX"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'muzZdtRN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'onEKpWN8' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'MwTU5kY0' \
    --contentId 'n7GYYq8U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2SMSWRO' \
    --body '{"contentType": "Vkh2khjQ", "fileExtension": "odA32UVp", "name": "P1ZTivmU", "preview": "B7I9UtFS", "previewMetadata": {"previewContentType": "9tiIC5ie", "previewFileExtension": "w4HCFmE8"}, "subType": "BnfzNdcF", "tags": ["yX3336jG", "iBOO2wmF", "2OSSXWk7"], "type": "e9rfqQVj"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'r8w4CBzZ' \
    --contentId 'WqZYOC3H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0BdEjzb' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'STJGCmjS' \
    --limit '88' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'nfOUg6f3' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '6AxoRmo5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WpbF9yAH' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'q3R0WxPK' \
    --limit '25' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'y2ugMq4k' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'tJ4EmPm4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BmZWITrX' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'cjH02n44' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vb0MdEEn' \
    --body '{"contents": ["z1bIXglw", "jgbgn2FC", "h2GLRFBk"], "name": "0g5TK6WB"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'CZ1G0FKi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm97y2BBV' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'LgPFEGj4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDS1Iz6b' \
    --limit '6' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'JgbB6oi9' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'x7yvz5jg' \
    --namespace "$AB_NAMESPACE" \
    --creator 'qJtIOy8m' \
    --isofficial 'L1w3I5DT' \
    --limit '78' \
    --name 'aL0PtLSI' \
    --offset '65' \
    --orderby 'nctFr2fe' \
    --sortby 'gauKBYsQ' \
    --subtype 'MyC4M8Me' \
    --tags 'SKl5lYz3,8dcVZ401,dviJEACE' \
    --type 'YdQL3e0J' \
    --userId 'JZf6Vryl' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'C1tKPwH9' \
    --isofficial 'Lutx7h06' \
    --limit '55' \
    --name 'gj9QyJPa' \
    --offset '67' \
    --orderby 'LPKGv6O5' \
    --sortby 'G5D4SvYA' \
    --subtype 'm1n4O8MX' \
    --tags 'L8RqfonM,v73TKEXJ,TeFmuI1Z' \
    --type 'sNWtE9qW' \
    --userId 'KPUAwIgi' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["qEcfnCEh", "Z6TP6kDH", "WBKuu6Fm"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '64' \
    --name 'ItTJjls0' \
    --offset '11' \
    --orderby 'vHTardpR' \
    --sortby 'empA1hxg' \
    --subtype '9PSaTXv4' \
    --tags 'qwjHOqdg,RhpOxRHm,CAGyYNTt' \
    --type 'DMLKh0BU' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1ue4GmG4' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'QsDaKqfX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'eODC7asn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'sYakAMwV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'qgovqP9s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '35' \
    --orderby 'DQ1jyuyT' \
    --sortby '5YAmGlLu' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '0PGBO5RH' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdjAaPRf' \
    --limit '26' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'q4k7SeyX' \
    --body '{"name": "drAIu5DW"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '56ydpDjU' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'eCPgYrLU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lDP2zcZs' \
    --body '{"name": "idCNJ7LG"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'dXwDdyxt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ee8Om4XO' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'TYF8wbmF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'deAFRRTk' \
    --body '{"contentType": "BEPZ0wd3", "fileExtension": "G5PHtSEw", "name": "AFBezkBA", "preview": "D3qwvPij", "previewMetadata": {"previewContentType": "TXlAOTQ8", "previewFileExtension": "bvviVziN"}, "subType": "qsJ7GBCB", "tags": ["BqBkUNtV", "VWDDoUPR", "5EeZypey"], "type": "Xz4RcmUk"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'N1stVHxp' \
    --contentId '31FHkhdH' \
    --namespace "$AB_NAMESPACE" \
    --userId '1WQqDrgo' \
    --body '{"contentType": "hsydVHnK", "fileExtension": "RD6ttZMb", "name": "2R5Aki8h", "preview": "3AyuVeKw", "previewMetadata": {"previewContentType": "ezEQYUCZ", "previewFileExtension": "ixiyzCxh"}, "subType": "zMN4LXYu", "tags": ["7ctY6uGz", "21Cq1lvc", "c0RfJp3v"], "type": "IAyBDCqq"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '38eyuWUm' \
    --contentId 'dmp96bGx' \
    --namespace "$AB_NAMESPACE" \
    --userId 't3VteR2B' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'qB047FLH' \
    --limit '94' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '1yiXaAcS' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'BwK5uEJ6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AF1RZmNy' \
    --body '{"screenshots": [{"description": "xIBJAeq8", "screenshotId": "BN72gMmk"}, {"description": "Q2pTr9yW", "screenshotId": "raFNipO8"}, {"description": "J0wyLVMv", "screenshotId": "MPhywvgy"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '06ACaOCJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wcQ4HXLn' \
    --body '{"screenshots": [{"contentType": "59OWZPkD", "description": "NBwpvnYM", "fileExtension": "png"}, {"contentType": "zy7RBDp2", "description": "bt6wrVeO", "fileExtension": "jpeg"}, {"contentType": "pPH0GZ3e", "description": "l6JviKkK", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'VwW2evZc' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'wFM9SePF' \
    --userId 'OtLQ21wK' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'gOeIwuLE' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'CmTCfKDy' \
    --limit '40' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '71WHwYco' \
    --limit '21' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'F4RLeFuQ' \
    --limit '16' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'bbjFjyia' \
    --body '{"contents": ["EbsA47W4", "lEVli7Y6", "qQYYx6yu"], "name": "cYTdPw8b"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ArtzSJ1j' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '2VM9YQT8' \
    --namespace "$AB_NAMESPACE" \
    --userId '1gmN6rna' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'GLzeroTo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pXrql1Ez' \
    --body '{"contents": ["itMdb2AL", "diBNEwgp", "BZAPO1j2"], "name": "D9ScVEeS"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'SPaUrhXD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cVASnmrw' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'Sn0vWRjc' \
    --namespace "$AB_NAMESPACE" \
    --userId '1h3VNWvJ' \
    --limit '79' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'KUyzB7So' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE