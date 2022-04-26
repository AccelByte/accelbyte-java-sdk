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
echo "1..89"

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
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --body '{"name": "FtBxyZcD"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --body '{"name": "XBpGlsQu"}' \
    --channelId 'Ju8vMf0I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'sJkTrd8I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --body '{"contentType": "DcV2zXnT", "fileExtension": "KjXY1bPq", "name": "amiBxx9C", "preview": "s18EY84e", "subType": "kItqRzHU", "tags": ["1oh570KQ"], "type": "BVaewc72"}' \
    --channelId 'krSha68n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --body '{"contentType": "3Ynozp1C", "fileExtension": "2KmIQTuB", "name": "dNEUsxFb", "preview": "8CJ17M7D", "subType": "JZaMSxEC", "tags": ["bZbygyoa"], "type": "rORoeNHS"}' \
    --channelId 'b8Rh3kgs' \
    --contentId '9qqJbnQs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'oBgiVpP8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Cm3yvASU' \
    --contentId 'oxdxxFqm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'AGTJ8IEd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetSpecificContent' test.out

#- 15 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'agEtp4w2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDownloadContentPreview' test.out

#- 16 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --body '{"screenshots": [{"description": "9KOu9c19", "screenshotId": "R6XDqWHk"}]}' \
    --contentId 'kP8npLEK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateScreenshots' test.out

#- 17 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --body '{"screenshots": [{"contentType": "MfjiX7jp", "description": "kVZk3IaQ", "fileExtension": "jfif"}]}' \
    --contentId 'mqGodOEG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminUploadContentScreenshot' test.out

#- 18 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 't9gPOj0c' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '6i0JkvIa' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteContentScreenshot' test.out

#- 19 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'SingleAdminGetAllGroups' test.out

#- 20 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --body '{"contents": ["s73ucYnF"], "name": "AJ3DK5T4"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateGroup' test.out

#- 21 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'Eogg0Y39' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetGroup' test.out

#- 22 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --body '{"contents": ["UoYlpv5b"], "name": "VAgtsDhU"}' \
    --groupId 'TDUscbQD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminUpdateGroup' test.out

#- 23 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'jbTQuPMz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminDeleteGroup' test.out

#- 24 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '2PTRlkyU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetGroupContents' test.out

#- 25 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminGetTag' test.out

#- 26 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --body '{"tag": "89ZPOw6z"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'AdminCreateTag' test.out

#- 27 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --body '{"tag": "PFJ42cwm"}' \
    --namespace "$AB_NAMESPACE" \
    --tagId 'zBBSMNco' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateTag' test.out

#- 28 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'AAOjKNjf' \
    > test.out 2>&1
eval_tap $? 28 'AdminDeleteTag' test.out

#- 29 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'AdminGetType' test.out

#- 30 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --body '{"subtype": ["cYHm093a"], "type": "YgBU1sqj"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'AdminCreateType' test.out

#- 31 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --body '{"subtype": ["yK0XH45P"], "type": "aRSOFQBt"}' \
    --namespace "$AB_NAMESPACE" \
    --typeId 'u23REZ8h' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateType' test.out

#- 32 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'RVX7LGOv' \
    > test.out 2>&1
eval_tap $? 32 'AdminDeleteType' test.out

#- 33 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdYiQS9i' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetChannel' test.out

#- 34 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '7mV1C91p' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAllUserChannels' test.out

#- 35 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --body '{"name": "jG9gpxL6"}' \
    --channelId 'ycTQdvln' \
    --namespace "$AB_NAMESPACE" \
    --userId '2LAuSQWE' \
    > test.out 2>&1
eval_tap $? 35 'AdminUpdateChannel' test.out

#- 36 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'XL6LFE1Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ho9m126Z' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteChannel' test.out

#- 37 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --body '{"contentType": "Wc8hHtWv", "fileExtension": "bNYqgUqs", "name": "lArFPiHU", "preview": "IvaCv8kU", "subType": "9dBBpdsJ", "tags": ["LhsVyExr"], "type": "kxoot0B7"}' \
    --channelId 'WOfercZd' \
    --contentId 'pMci37Ds' \
    --namespace "$AB_NAMESPACE" \
    --userId '7YSfExaI' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateContentS3' test.out

#- 38 AdminUpdateContentDirect
eval_tap 0 38 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 39 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '3uzLteMb' \
    --contentId 'FAlt4hr7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HmOYiBA5' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteContent' test.out

#- 40 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltAOXmlG' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetContent' test.out

#- 41 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '6eh1dTdo' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAllUserContents' test.out

#- 42 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --body '{"isHidden": true}' \
    --contentId 'pBIcuC1d' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QY93OJnJ' \
    > test.out 2>&1
eval_tap $? 42 'AdminHideUserContent' test.out

#- 43 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '6Te9vD8l' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetAllGroups' test.out

#- 44 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'dz7Hu8AD' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteAllUserGroup' test.out

#- 45 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '79kdWunv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'izU0q1pH' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetGroup' test.out

#- 46 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --body '{"contents": ["yhhERoGg"], "name": "drysMizB"}' \
    --groupId 'GSRdP2l7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNSZ8Aq0' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateGroup' test.out

#- 47 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'XiPLQXSe' \
    --namespace "$AB_NAMESPACE" \
    --userId '07ZddOGT' \
    > test.out 2>&1
eval_tap $? 47 'AdminDeleteGroup' test.out

#- 48 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'MlJjBwj9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJHQKseE' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetGroupContents' test.out

#- 49 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'dSXRDSvg' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteAllUserStates' test.out

#- 50 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'uauw1xT7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'SearchChannelSpecificContent' test.out

#- 51 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'PublicSearchContent' test.out

#- 52 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --body '{"contentIds": ["eMwSl9ML"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'PublicGetContentBulk' test.out

#- 53 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetFollowedContent' test.out

#- 54 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetLikedContent' test.out

#- 55 DownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc downloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'H0NnTJ2u' \
    > test.out 2>&1
eval_tap $? 55 'DownloadContentByShareCode' test.out

#- 56 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'lNzBvwJa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByContentID' test.out

#- 57 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'Qa547Jll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AddDownloadCount' test.out

#- 58 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --body '{"likeStatus": true}' \
    --contentId 'A8RWSpab' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'UpdateContentLikeStatus' test.out

#- 59 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'Ut7xk6Qx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'PublicDownloadContentPreview' test.out

#- 60 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetTag' test.out

#- 61 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetType' test.out

#- 62 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'GetFollowedUsers' test.out

#- 63 GetCreator
./ng net.accelbyte.sdk.cli.Main ugc getCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'yWhfqoWf' \
    > test.out 2>&1
eval_tap $? 63 'GetCreator' test.out

#- 64 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jw2o8oWU' \
    > test.out 2>&1
eval_tap $? 64 'GetChannels' test.out

#- 65 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --body '{"name": "qvPCZ2Hz"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T7NXmWDl' \
    > test.out 2>&1
eval_tap $? 65 'CreateChannel' test.out

#- 66 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'XsuNIdQJ' \
    > test.out 2>&1
eval_tap $? 66 'DeleteAllUserChannel' test.out

#- 67 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --body '{"name": "R5lsNOlv"}' \
    --channelId 'kfwaSbns' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uLCgToxu' \
    > test.out 2>&1
eval_tap $? 67 'UpdateChannel' test.out

#- 68 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'VTekJgvg' \
    --namespace "$AB_NAMESPACE" \
    --userId '6h5HIpH0' \
    > test.out 2>&1
eval_tap $? 68 'DeleteChannel' test.out

#- 69 CreateContentDirect
eval_tap 0 69 'CreateContentDirect # SKIP deprecated' test.out

#- 70 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --body '{"contentType": "DviplEk4", "fileExtension": "vj3LDp4y", "name": "qDt8QUZD", "preview": "pxlHasin", "subType": "GcjrkmRM", "tags": ["ttgjDSaI"], "type": "VBmft3Ud"}' \
    --channelId 'g7p9PGmY' \
    --namespace "$AB_NAMESPACE" \
    --userId '2H5kX4Ms' \
    > test.out 2>&1
eval_tap $? 70 'CreateContentS3' test.out

#- 71 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --body '{"contentType": "isSX28nA", "fileExtension": "RxWRpv5o", "name": "u5xtvd28", "preview": "OUfCt8UJ", "subType": "C5flNyj6", "tags": ["HsTtX8P3"], "type": "llnaaS9l"}' \
    --channelId 'qyygPcfk' \
    --contentId 'JIxfQZza' \
    --namespace "$AB_NAMESPACE" \
    --userId '8kNVbDxV' \
    > test.out 2>&1
eval_tap $? 71 'UpdateContentS3' test.out

#- 72 UpdateContentDirect
eval_tap 0 72 'UpdateContentDirect # SKIP deprecated' test.out

#- 73 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'Mq7HJk0F' \
    --contentId '89xAc3YV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'faENtrl0' \
    > test.out 2>&1
eval_tap $? 73 'DeleteContent' test.out

#- 74 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'pTKZTXqz' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetUserContent' test.out

#- 75 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuBMYQSA' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserContents' test.out

#- 76 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --body '{"screenshots": [{"description": "2jz1ZOpd", "screenshotId": "OjSyMddB"}]}' \
    --contentId '41JuMf7R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UyBHRj8I' \
    > test.out 2>&1
eval_tap $? 76 'UpdateScreenshots' test.out

#- 77 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --body '{"screenshots": [{"contentType": "iRimRllH", "description": "T6Dc40vF", "fileExtension": "jfif"}]}' \
    --contentId 'A6gpU7EW' \
    --namespace "$AB_NAMESPACE" \
    --userId '3x1dCpm5' \
    > test.out 2>&1
eval_tap $? 77 'UploadContentScreenshot' test.out

#- 78 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '5gOeqQIq' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'cJVKmBM1' \
    --userId 'J1IbuTrr' \
    > test.out 2>&1
eval_tap $? 78 'DeleteContentScreenshot' test.out

#- 79 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --body '{"followStatus": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmuT1whO' \
    > test.out 2>&1
eval_tap $? 79 'UpdateUserFollowStatus' test.out

#- 80 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'qmEnDXIW' \
    > test.out 2>&1
eval_tap $? 80 'GetPublicFollowers' test.out

#- 81 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'rBPlSay4' \
    > test.out 2>&1
eval_tap $? 81 'GetPublicFollowing' test.out

#- 82 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '6mv71BAZ' \
    > test.out 2>&1
eval_tap $? 82 'GetGroups' test.out

#- 83 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --body '{"contents": ["AOjtFJ2v"], "name": "mTj7tT7T"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZHWDdCkI' \
    > test.out 2>&1
eval_tap $? 83 'CreateGroup' test.out

#- 84 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZoArWwP' \
    > test.out 2>&1
eval_tap $? 84 'DeleteAllUserGroup' test.out

#- 85 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'HcyFAdAt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YciLIgRw' \
    > test.out 2>&1
eval_tap $? 85 'GetGroup' test.out

#- 86 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --body '{"contents": ["FRr0gwB9"], "name": "tz3vp99X"}' \
    --groupId 'VlV8rK3t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E6n0smip' \
    > test.out 2>&1
eval_tap $? 86 'UpdateGroup' test.out

#- 87 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '1tw3L7cU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9pqtv6J' \
    > test.out 2>&1
eval_tap $? 87 'DeleteGroup' test.out

#- 88 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'fPZwcCVO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XcVa80Tm' \
    > test.out 2>&1
eval_tap $? 88 'GetGroupContent' test.out

#- 89 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'CwtD2lAH' \
    > test.out 2>&1
eval_tap $? 89 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE