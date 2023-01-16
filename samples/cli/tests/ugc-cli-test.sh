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
    --limit '59' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "M4dn0X6p"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'rOGe18Dq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "vff33kr9"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'xVzuQlyB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '8CaUpInH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "dPmronxZ", "customAttributes": {"NMf92dBZ": {}, "VLnh06xm": {}, "bvHLp3ZA": {}}, "fileExtension": "N5vLRS16", "name": "mkqguJiX", "preview": "wPd2sWOT", "previewMetadata": {"previewContentType": "yPQh3U0R", "previewFileExtension": "IVVtWT4w"}, "subType": "ClV0LMpU", "tags": ["pXVgl4yu", "HVtjv38r", "ULH9yhz4"], "type": "RmI4PbpB"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'c3GAsY8f' \
    --contentId 'KMNEex5k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "KbXlwmwu", "customAttributes": {"TO55Gaxs": {}, "qM7cVSaO": {}, "23aghBpF": {}}, "fileExtension": "Wvlldp8B", "name": "NizhfTyT", "preview": "JP7aptsq", "previewMetadata": {"previewContentType": "QO2aBx1Z", "previewFileExtension": "9J1QMOnu"}, "subType": "uwaZfSvj", "tags": ["BUuEqOR2", "VRISnwxz", "6CGF5CI2"], "type": "ERfoOqhR"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'MTu8yfjA' \
    --namespace "$AB_NAMESPACE" \
    --creator 'JSfX2G4m' \
    --isofficial 'kn8TuXzk' \
    --limit '90' \
    --name 'qMeejG9K' \
    --offset '41' \
    --orderby 'fyZL4Br9' \
    --sortby 'lpWkKPhI' \
    --subtype 'Y8TLzVPK' \
    --tags 'MYd4hBzv,v22bTqNs,IQPOSbUK' \
    --type '5PkFzkZp' \
    --userId 'rTRZzu1T' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'kL485Dwn' \
    --contentId 'DkL6PUgz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["JxoXqiby", "dKIyeQAc", "AsqCIWvT"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'r5KkMirC' \
    --isofficial 'he8hSaQi' \
    --limit '40' \
    --name 'mjSLgptn' \
    --offset '53' \
    --orderby 'MawpLtcQ' \
    --sortby 'yfsCsdkU' \
    --subtype 'a9dfLPx8' \
    --tags '2NRsNmYx,DTN4NQK7,NtQ8qWqR' \
    --type 'oqDko8qf' \
    --userId '4A3yiowa' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'QClKyJpb' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ScEJaTth' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'w5bCnpUt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'fw1n0X99' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "ghY9VffY", "screenshotId": "adIY7o4s"}, {"description": "wRIW7VH7", "screenshotId": "j6kESBk3"}, {"description": "xUg8Ca4K", "screenshotId": "VQjJUTEF"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'yHZv7RxO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "gFB5QsSg", "description": "yPK3FEIs", "fileExtension": "jpeg"}, {"contentType": "pHYRhVIc", "description": "uXjU0DZ5", "fileExtension": "bmp"}, {"contentType": "RIql5x4X", "description": "k6aYDlxf", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'Zocx185g' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'YrCsvZMI' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["B9VzMW3O", "HVforzys", "YOspDzCT"], "name": "Y0kc4Xrp"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'IyLcEGKk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'DJtjoec2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["jeTKktBw", "IXhOAHL9", "GkH3oizT"], "name": "DcmN68RX"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'nkJ36I7g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'uTOPEF0v' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "inRfOyay"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'L60I7ydB' \
    --body '{"tag": "mxvtRiZp"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'VNrLbJFt' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["11d7UI0g", "pRY0wx1H", "6i4AvTWA"], "type": "LRfz7ydR"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'WJJzGT6x' \
    --body '{"subtype": ["s8CEEgmT", "9fBm3F1M", "yhEdv9kp"], "type": "GJGAYSud"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'mS6DlNp1' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'f5axo9iA' \
    --limit '16' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'XPpdWHDa' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'yaFJwkZC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNiTiJW3' \
    --body '{"name": "Cew5NyZt"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'FF9r0W9C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PgEOOF1r' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '7toGh5oJ' \
    --contentId 'hP6qSSX2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e5TFjkq5' \
    --body '{"contentType": "2ohdW69H", "customAttributes": {"i3q92JfM": {}, "l0fXeuGH": {}, "AwYGmYu4": {}}, "fileExtension": "bj8tJjHy", "name": "wqMUBYm8", "preview": "IRVbMyGY", "previewMetadata": {"previewContentType": "IcmLE8y5", "previewFileExtension": "rVqiJ8xv"}, "subType": "owPVBcwM", "tags": ["IcAXfzfG", "t491pFok", "ENHLPAiQ"], "type": "DpFm24YC"}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'NOMLtw60' \
    --contentId 'phRwuKB7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xvdXdG2k' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxZgUyj9' \
    --limit '81' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'D75a9Icb' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'O4QmeTAG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FrQ0CyXi' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '0l6kjMV4' \
    --limit '55' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z5fSjaib' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'uVfAi01q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U8VUoHBC' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'WG1ECOo2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RjFh66jB' \
    --body '{"contents": ["4j46rccv", "PW6pi4H2", "bSearFQT"], "name": "A3gamFmx"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '48c4cQmb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M00PprqB' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'Cv6ytyrs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IPvHTwaj' \
    --limit '95' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijv5Iywl' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'dAb18RY9' \
    --namespace "$AB_NAMESPACE" \
    --creator 'cqJmX7WV' \
    --isofficial 'M5r5U33V' \
    --limit '71' \
    --name 'Qism5Ne8' \
    --offset '34' \
    --orderby '9PhVGCnE' \
    --sortby 'k48miq4f' \
    --subtype '0ZaxnBea' \
    --tags 'KAoOyLqa,3j12auCo,39kei2JT' \
    --type 'KABsevKe' \
    --userId 'GkWPdtGr' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'hEs1935m' \
    --isofficial 'qC0VPo89' \
    --limit '100' \
    --name 'k1Tay4m7' \
    --offset '56' \
    --orderby 'G0pRa4ux' \
    --sortby 'pEmPYGbk' \
    --subtype '27bVFU4N' \
    --tags 'eR1ZjGfm,9Jmsokin,IIAcMbdj' \
    --type 'u2Hzp2U9' \
    --userId 'iwCzWhyd' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["X5KkJErq", "p5AaSncn", "pyZPpXJ3"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '27' \
    --name 'FLI2sV2u' \
    --offset '45' \
    --orderby 'rZkeoVZM' \
    --sortby 'fYSfcgs0' \
    --subtype 'fU8uPboX' \
    --tags '4Qle2OcM,hYdPSkpz,8myez6mA' \
    --type 'VNUJPe9A' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KaEft6lG' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'bwKdw4zR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '0YlhWxG4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'qs7WOgVr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'n7tbZiIp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '61' \
    --orderby 'KtfDp2tK' \
    --sortby '2cdzT3Z9' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '74rgWpja' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAKmCTvv' \
    --limit '100' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'chORbhNj' \
    --body '{"name": "4RReXrGH"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'SFwupqJG' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'waCIMVcr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BRbPvjx9' \
    --body '{"name": "XgQJnQdV"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '6qVS6pB7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KcIVSWuF' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'zVBJscHu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1iMHZYg' \
    --body '{"contentType": "QVpGi0Wr", "customAttributes": {"R7AbrC00": {}, "zyDiJPYT": {}, "pFEVMU6D": {}}, "fileExtension": "d12A23OD", "name": "wXoVq6h4", "preview": "xX92qEKF", "previewMetadata": {"previewContentType": "LZfmPTdj", "previewFileExtension": "4320Y7VM"}, "subType": "hxoiT000", "tags": ["K4h14T8y", "P4oYxO9M", "KUAy7H90"], "type": "8kmuTYFc"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'Uhi8pAVQ' \
    --contentId 'QBBs2TST' \
    --namespace "$AB_NAMESPACE" \
    --userId '4VxFFNWl' \
    --body '{"contentType": "Gnwxmjge", "customAttributes": {"LLjwXtvA": {}, "uvDLuOOx": {}, "qpKR7qCj": {}}, "fileExtension": "G9HEvmoH", "name": "WohaIpTk", "preview": "kIlh4wwV", "previewMetadata": {"previewContentType": "z84DXdU4", "previewFileExtension": "0mPLFYbh"}, "subType": "rJXAzJht", "tags": ["OEGwCH8r", "98x4rRyd", "hwebatdq"], "type": "kndhRSWU"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'mGPq7zn5' \
    --contentId 'n1OVDC7u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aesMJr7e' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'sbuH44Vs' \
    --limit '0' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'DC8uvjFo' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'k5m9uz3q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tDwxfq9h' \
    --body '{"screenshots": [{"description": "svndDnHG", "screenshotId": "PWRZ6BFC"}, {"description": "qEYFP6GU", "screenshotId": "2hSpHhuy"}, {"description": "W6OMUbjm", "screenshotId": "aPqtfVUZ"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'I3UIjXQS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zmyZpntq' \
    --body '{"screenshots": [{"contentType": "p57Jz3Ba", "description": "FJqnSEvX", "fileExtension": "png"}, {"contentType": "9Q6erFSI", "description": "ofF3VYXZ", "fileExtension": "jpeg"}, {"contentType": "wslUfPxc", "description": "bllr6UPu", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'dvBK2LnO' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '2LcIZUmg' \
    --userId 'sGuJeSsp' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'o1pD88UP' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'IfNbNhva' \
    --limit '1' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '5XQXZvwj' \
    --limit '15' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'f7WKeYQW' \
    --limit '34' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'rOvZG5yg' \
    --body '{"contents": ["CYpINxOo", "kAGHyq6x", "0Ak00XmO"], "name": "UL77qClx"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'reCZBo56' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '6j6jp6IP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xNg7HLQi' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'LktSFRuZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ARlGbfhg' \
    --body '{"contents": ["tqO1yKud", "BdUjBUvd", "mTNbhOHl"], "name": "1UMx06FL"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'y6LYM2Ky' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YcGDW7Hd' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'KwJ2kwck' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NS2Ti5mN' \
    --limit '34' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '6FuszE5j' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE