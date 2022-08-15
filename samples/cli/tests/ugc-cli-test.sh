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
    --limit '27' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "TyNC540Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'ySehg20s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "GA41t4LF"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'FgOdlMkP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '82UEjLV4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "JPMbjGoy", "fileExtension": "ne396Pt9", "name": "OlDMhJnR", "preview": "4dxjqXoD", "previewMetadata": {"previewContentType": "VTmhrcVL", "previewFileExtension": "WAZbgqV5"}, "subType": "DbGvcXpV", "tags": ["tOc7mk7H", "8WpAWf14", "J8TJVSGh"], "type": "C6q0DXod"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'jPPYThne' \
    --contentId 'arBKa24I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "OHJavI1u", "fileExtension": "sdeSaJJD", "name": "AiscmOWi", "preview": "qsvxL5ZW", "previewMetadata": {"previewContentType": "oEU3d8pB", "previewFileExtension": "yaROUl41"}, "subType": "a3uNk8eq", "tags": ["MjzjhxV2", "4BRfSQUr", "lI1b9Wft"], "type": "UCfrv9Cl"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'vYc7mjSS' \
    --namespace "$AB_NAMESPACE" \
    --creator 'PhZrxqJl' \
    --isofficial '6JKrZCly' \
    --limit '53' \
    --name 'byw4OW8f' \
    --offset '70' \
    --orderby 'pxZf1rYO' \
    --sortby 'tqgx6IzQ' \
    --subtype 'TGpa96Lq' \
    --tags 'fwHsp9eq,EiIlOkje,au439Wce' \
    --type 'SnxFBgUI' \
    --userId 'AfHJibZC' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'b586Z2rA' \
    --contentId 'XocnvFjr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 't0Tf4y4a' \
    --isofficial 'T7zQzwwe' \
    --limit '84' \
    --name 'oFuB4ZrS' \
    --offset '61' \
    --orderby '6wk24IyA' \
    --sortby 'sz0sYwUS' \
    --subtype 'CLEv4fdY' \
    --tags 'NskSSwvv,zyc9yS1I,9VYPZe0M' \
    --type 'jFf0X3Am' \
    --userId 'x3HgOIIA' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'V72je4B1' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 't4IqA4Da' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'AsyqDmya' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'imIFnx18' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "Qp7ujLxR", "screenshotId": "5oOFRKFi"}, {"description": "0o8aoAur", "screenshotId": "bGRX7tsH"}, {"description": "2PHlyFBJ", "screenshotId": "QkoVqA47"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'BBM1Q3SI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "0lL9rHUP", "description": "RR2kKwKL", "fileExtension": "jpeg"}, {"contentType": "AXFUuz7L", "description": "ZcVG4gxM", "fileExtension": "bmp"}, {"contentType": "KS8Dpavs", "description": "v3Dx8dZB", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'iNQQPbkc' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Qh10zggC' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["bzXrhVyQ", "aqP4hDh1", "QcehE6zs"], "name": "nYNUz9Zq"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'P81Zne6X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'f3wN9OBe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["CqHEir1l", "ELLJy262", "3Q8iHLcB"], "name": "Wt1cq2L7"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '8QePAEbk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'rGyaeXfk' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "7sbYpcXs"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'vhCbYhRY' \
    --body '{"tag": "fu3sUzKy"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'ujez12vO' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["SgONovbq", "fon6nmaz", "8dbLb5Uw"], "type": "a7JL3FMd"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'mXRU5OKd' \
    --body '{"subtype": ["Ymti5Ts8", "PROoQcYo", "WA5MzoFo"], "type": "4mZPp5Q1"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '80joQEkV' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'RlCGOLD3' \
    --limit '79' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'XprmCuE9' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'WeRNBsT5' \
    --namespace "$AB_NAMESPACE" \
    --userId '7S4XqR31' \
    --body '{"name": "5eJIHju5"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'bY5tv4D4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yY2AzesJ' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'ZlpgErNH' \
    --contentId 'EEVrOWJB' \
    --namespace "$AB_NAMESPACE" \
    --userId '24nrV3OM' \
    --body '{"contentType": "gL74aLcs", "fileExtension": "lcqQM45C", "name": "4qhXiUim", "preview": "Jq3HvxhF", "previewMetadata": {"previewContentType": "ypzVVwuU", "previewFileExtension": "sf0GkywL"}, "subType": "QPiQiLNd", "tags": ["ivl8X87s", "sY6pvXrn", "MvfsNCSA"], "type": "oYWH9n1T"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'qUT0tvua' \
    --contentId 'GdhvKy1j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oLsEcprb' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hu4QbIGF' \
    --limit '51' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnaSwu22' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'F73w1L50' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fsszJz1v' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'WSJXJU8k' \
    --limit '43' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'CeAOhLOb' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'QCi39x78' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fXtPypRU' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'I2iiD5jY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LDdYnZRW' \
    --body '{"contents": ["NlrM2NxJ", "scrTUxyq", "rOhLWVv8"], "name": "jaCRvL6D"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'RnxWCmYS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xUxQVzGB' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'qzbrKFiC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIIB8oKb' \
    --limit '71' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'rwMBsjKn' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId '1n8t6H6L' \
    --namespace "$AB_NAMESPACE" \
    --creator 'RaDHoOAd' \
    --isofficial 'IYbj2KeR' \
    --limit '32' \
    --name 'sfH3lbT2' \
    --offset '48' \
    --orderby 'Kko7KMRk' \
    --sortby 'dxK01Nu6' \
    --subtype 'fE3N2hMS' \
    --tags 'TQaPHivd,oZa3dacl,WrA0OAEK' \
    --type 'U53LynMq' \
    --userId 'fPXKSW6H' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'WsFjK2B7' \
    --isofficial 'dzAE7StR' \
    --limit '27' \
    --name 'LbmFIFqE' \
    --offset '30' \
    --orderby '2usFdogd' \
    --sortby 'E78CLlv3' \
    --subtype 'ZgpKJO0q' \
    --tags '7vA7C02j,OgwTAwqL,To3D6KDG' \
    --type 'qbfCxHyz' \
    --userId 'Vt1DR8k7' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["JXItNsaB", "CP6mFhSa", "QTpY5BZq"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '74' \
    --name '6hLctyBp' \
    --offset '19' \
    --orderby 'XFm7R3eV' \
    --sortby 'nsotbv5g' \
    --subtype 'IUiDyyon' \
    --tags '1iho6msl,Y3AoZvi9,3VAwqEr5' \
    --type 'DeGOhsGM' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'mhESmhjM' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'rsVcFsjo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '6vR9HQ8f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'OQV8HhBs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'tMMlfyUF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '79' \
    --orderby 'AKGzEUIA' \
    --sortby 'QxHJ980j' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbk7JRlb' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'mZnF3wfE' \
    --limit '66' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'DKlBW4qc' \
    --body '{"name": "WpLpZdBU"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'HT4jTwmT' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'KMLRvgH3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'azBKD72l' \
    --body '{"name": "uMePOCBj"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '04RrYpGk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hJt5JH45' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'YHq3J4ep' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rMnQIi8B' \
    --body '{"contentType": "F25JYnD0", "fileExtension": "BaDKpvyA", "name": "KjlrtY6e", "preview": "avsmBhg5", "previewMetadata": {"previewContentType": "YnW8I3GM", "previewFileExtension": "eGu3kdzD"}, "subType": "xvS7bgNq", "tags": ["3DsCocdC", "JWvClJ04", "jBs9RlLh"], "type": "LRH4CIaK"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'ceaAKGGA' \
    --contentId 'ugTcyZVE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q8BhvTAR' \
    --body '{"contentType": "MJw9seNz", "fileExtension": "sNrHYnuN", "name": "0LeQJiV9", "preview": "ulLz1AKl", "previewMetadata": {"previewContentType": "1V2lvcDV", "previewFileExtension": "peQa0eZA"}, "subType": "YRKPazVy", "tags": ["k5CQHFul", "4lnJXegs", "tU44ir2d"], "type": "8Rn0nBaz"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'bDnM0qXZ' \
    --contentId 'vp5yK26e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xHhKJA8Y' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'HrjMCvcs' \
    --limit '52' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZcGYpET' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'fhMB5ljt' \
    --namespace "$AB_NAMESPACE" \
    --userId '9HwyBbxF' \
    --body '{"screenshots": [{"description": "2u782r99", "screenshotId": "AVpDcIX6"}, {"description": "Lh0PGFyf", "screenshotId": "Cs9aKXLO"}, {"description": "EzREjcYO", "screenshotId": "PakZIq3U"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'uUNHwnd1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D7yQ5JvA' \
    --body '{"screenshots": [{"contentType": "F9B4kZXJ", "description": "25HSGYmA", "fileExtension": "jpg"}, {"contentType": "30aQvW7d", "description": "5NwWTfqP", "fileExtension": "bmp"}, {"contentType": "5cUJX8H3", "description": "tx1tIIfC", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '3fNZhAOS' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '1bqvbuAx' \
    --userId 'Idf5DRZM' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlI7iyOc' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'iMHXHZep' \
    --limit '25' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'fHZTpAdY' \
    --limit '6' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'zmW0hbe1' \
    --limit '15' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '5YfjMmQg' \
    --body '{"contents": ["uESAlttZ", "wMoKT9a8", "oDKOiL8p"], "name": "v30FmOog"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'HsEttjUo' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'A8ocS0sr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAU6kJX8' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'p5QFFbF8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ssn0uaOw' \
    --body '{"contents": ["eUA5MUUn", "lvqiRlDv", "ZPG50Xqs"], "name": "q4nyunNg"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'a32Cuosg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UVjsmfVr' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'AABPPvCk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVJBonwq' \
    --limit '6' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'uxD75Cnx' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE