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
echo "1..88"

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

#- 52 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetFollowedContent' test.out

#- 53 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetLikedContent' test.out

#- 54 DownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc downloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eMwSl9ML' \
    > test.out 2>&1
eval_tap $? 54 'DownloadContentByShareCode' test.out

#- 55 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'H0NnTJ2u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'PublicDownloadContentByContentID' test.out

#- 56 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'lNzBvwJa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'AddDownloadCount' test.out

#- 57 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --body '{"likeStatus": false}' \
    --contentId '547JllvA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'UpdateContentLikeStatus' test.out

#- 58 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '8RWSpabU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentPreview' test.out

#- 59 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'GetTag' test.out

#- 60 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetType' test.out

#- 61 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetFollowedUsers' test.out

#- 62 GetCreator
./ng net.accelbyte.sdk.cli.Main ugc getCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 't7xk6Qxy' \
    > test.out 2>&1
eval_tap $? 62 'GetCreator' test.out

#- 63 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'WhfqoWfJ' \
    > test.out 2>&1
eval_tap $? 63 'GetChannels' test.out

#- 64 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --body '{"name": "w2o8oWUq"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPCZ2HzT' \
    > test.out 2>&1
eval_tap $? 64 'CreateChannel' test.out

#- 65 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7NXmWDlX' \
    > test.out 2>&1
eval_tap $? 65 'DeleteAllUserChannel' test.out

#- 66 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --body '{"name": "suNIdQJR"}' \
    --channelId '5lsNOlvk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fwaSbnsu' \
    > test.out 2>&1
eval_tap $? 66 'UpdateChannel' test.out

#- 67 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'LCgToxuV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TekJgvg6' \
    > test.out 2>&1
eval_tap $? 67 'DeleteChannel' test.out

#- 68 CreateContentDirect
eval_tap 0 68 'CreateContentDirect # SKIP deprecated' test.out

#- 69 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --body '{"contentType": "h5HIpH0D", "fileExtension": "viplEk4v", "name": "j3LDp4yq", "preview": "Dt8QUZDp", "subType": "xlHasinG", "tags": ["cjrkmRMt"], "type": "tgjDSaIV"}' \
    --channelId 'Bmft3Udg' \
    --namespace "$AB_NAMESPACE" \
    --userId '7p9PGmY2' \
    > test.out 2>&1
eval_tap $? 69 'CreateContentS3' test.out

#- 70 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --body '{"contentType": "H5kX4Msi", "fileExtension": "sSX28nAR", "name": "xWRpv5ou", "preview": "5xtvd28O", "subType": "UfCt8UJC", "tags": ["5flNyj6H"], "type": "sTtX8P3l"}' \
    --channelId 'lnaaS9lq' \
    --contentId 'yygPcfkJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxfQZza8' \
    > test.out 2>&1
eval_tap $? 70 'UpdateContentS3' test.out

#- 71 UpdateContentDirect
eval_tap 0 71 'UpdateContentDirect # SKIP deprecated' test.out

#- 72 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'kNVbDxVM' \
    --contentId 'q7HJk0F8' \
    --namespace "$AB_NAMESPACE" \
    --userId '9xAc3YVf' \
    > test.out 2>&1
eval_tap $? 72 'DeleteContent' test.out

#- 73 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'aENtrl0p' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetUserContent' test.out

#- 74 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKZTXqzH' \
    > test.out 2>&1
eval_tap $? 74 'DeleteAllUserContents' test.out

#- 75 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --body '{"screenshots": [{"description": "uBMYQSA2", "screenshotId": "jz1ZOpdO"}]}' \
    --contentId 'jSyMddB4' \
    --namespace "$AB_NAMESPACE" \
    --userId '1JuMf7RU' \
    > test.out 2>&1
eval_tap $? 75 'UpdateScreenshots' test.out

#- 76 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --body '{"screenshots": [{"contentType": "yBHRj8Ii", "description": "RimRllHT", "fileExtension": "jfif"}]}' \
    --contentId 'c40vFFA6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gpU7EW3x' \
    > test.out 2>&1
eval_tap $? 76 'UploadContentScreenshot' test.out

#- 77 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '1dCpm55g' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'OeqQIqcJ' \
    --userId 'VKmBM1J1' \
    > test.out 2>&1
eval_tap $? 77 'DeleteContentScreenshot' test.out

#- 78 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --body '{"followStatus": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uTrrkbmu' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserFollowStatus' test.out

#- 79 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1whOqmE' \
    > test.out 2>&1
eval_tap $? 79 'GetPublicFollowers' test.out

#- 80 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'nDXIWrBP' \
    > test.out 2>&1
eval_tap $? 80 'GetPublicFollowing' test.out

#- 81 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSay46mv' \
    > test.out 2>&1
eval_tap $? 81 'GetGroups' test.out

#- 82 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --body '{"contents": ["71BAZAOj"], "name": "tFJ2vmTj"}' \
    --namespace "$AB_NAMESPACE" \
    --userId '7tT7TZHW' \
    > test.out 2>&1
eval_tap $? 82 'CreateGroup' test.out

#- 83 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdCkIsZo' \
    > test.out 2>&1
eval_tap $? 83 'DeleteAllUserGroup' test.out

#- 84 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'ArWwPHcy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FAdAtYci' \
    > test.out 2>&1
eval_tap $? 84 'GetGroup' test.out

#- 85 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --body '{"contents": ["LIgRwFRr"], "name": "0gwB9tz3"}' \
    --groupId 'vp99XVlV' \
    --namespace "$AB_NAMESPACE" \
    --userId '8rK3tE6n' \
    > test.out 2>&1
eval_tap $? 85 'UpdateGroup' test.out

#- 86 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '0smip1tw' \
    --namespace "$AB_NAMESPACE" \
    --userId '3L7cUd9p' \
    > test.out 2>&1
eval_tap $? 86 'DeleteGroup' test.out

#- 87 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'qtv6JfPZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wcCVOXcV' \
    > test.out 2>&1
eval_tap $? 87 'GetGroupContent' test.out

#- 88 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'a80TmCwt' \
    > test.out 2>&1
eval_tap $? 88 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE