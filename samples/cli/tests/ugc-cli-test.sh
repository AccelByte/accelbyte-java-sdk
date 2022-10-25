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
    --limit '76' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "bA9AbmoO"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'qtKkbLv7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "uwkGhP5C"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'Fqnf4c74' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'vN9NGTO4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "bPphsYRP", "fileExtension": "jp7XQHxd", "name": "jKYZ1M7d", "preview": "INiuSaA7", "previewMetadata": {"previewContentType": "1FKJDpDP", "previewFileExtension": "4reZ2g20"}, "subType": "FMMrfYs3", "tags": ["4J0myoQB", "NAhp7qGL", "hkQNkzHN"], "type": "5lODjOF3"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'vIVFHvc3' \
    --contentId 'eDS8iVSa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "Skc9KoZq", "fileExtension": "AJdU1sos", "name": "JJqfV04t", "preview": "kVFLKsoT", "previewMetadata": {"previewContentType": "yeLOZs39", "previewFileExtension": "k1hMVa3r"}, "subType": "wBdACkVM", "tags": ["OuH8VuOO", "u8PLjyK9", "NrGSrnWU"], "type": "ixkMRfdY"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'ayYBxzMg' \
    --namespace "$AB_NAMESPACE" \
    --creator 'PTGqOVqT' \
    --isofficial 'cC0UOd2l' \
    --limit '66' \
    --name 'urf1wY3Q' \
    --offset '50' \
    --orderby 'tHXSWZgw' \
    --sortby '67BQx0dN' \
    --subtype 'gemv6SjW' \
    --tags 'ri820Qcq,FtCQjVff,KyaRScnq' \
    --type 'ztvrvWAc' \
    --userId 'nLvIE892' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'TnnzZeTs' \
    --contentId 'n85b3hst' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'Cmoc9o7K' \
    --isofficial 'T7pLi4fR' \
    --limit '87' \
    --name 'psEcawqt' \
    --offset '63' \
    --orderby 'VapXK4aQ' \
    --sortby 'GrbKajSm' \
    --subtype 'Qbz3nDb0' \
    --tags '91sO4N7h,FHdL4EoY,TQrydVDr' \
    --type 'dSJRPpyE' \
    --userId 'Cy4AU7Kq' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'k6OPwSAa' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '7MH6RdTV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'QYglzvMQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '58zgrCND' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "8swSkIA6", "screenshotId": "iDi0cQcL"}, {"description": "XfbNOFPY", "screenshotId": "BK6mXlZj"}, {"description": "8aRjvf35", "screenshotId": "q0DvglXm"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'jY7NEzEP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "4t66t2Ss", "description": "A4CB2mOs", "fileExtension": "pjp"}, {"contentType": "ZFBt8C2W", "description": "MHN6E8WG", "fileExtension": "jpeg"}, {"contentType": "2YxIyckZ", "description": "QsqKWFoU", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'JC6kqHBb' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'wEtIvKai' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["XLkxaY6b", "MGDyWq9H", "IG446AfQ"], "name": "otr4XB48"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'TbXA9byT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'ioUIwajS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["4BRthfTo", "rwZWGLQG", "3MptFkV9"], "name": "Gk5secZU"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '2eOEipb7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'icpdMwwx' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "ICQKuIZN"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '6MPpFwEu' \
    --body '{"tag": "5hPmak9v"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'afIhRYoi' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["R4bHQxve", "K1yEqiOg", "h7ojeeq6"], "type": "EGHUszKr"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'm7dii5oy' \
    --body '{"subtype": ["n8tPrahC", "CyuCdn5a", "LVzGeiv3"], "type": "jfA7k8z8"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'OLObQ813' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '8hSrOGu3' \
    --limit '90' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'jM6wv3vq' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'ff3YnWJq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xt89v4x2' \
    --body '{"name": "cEWjHfpU"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'iYxpCLpe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfNi2luo' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'EFDkeQeS' \
    --contentId '3ZVeh52O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7TGO5d5' \
    --body '{"contentType": "RmEhXzLt", "fileExtension": "H612peDM", "name": "G3VbbcNi", "preview": "a72i5i3t", "previewMetadata": {"previewContentType": "YRmWJvRB", "previewFileExtension": "uAWrEfYq"}, "subType": "XVn7ijmk", "tags": ["2ke15GNj", "v0ZO5Lj5", "j8Eaoa5p"], "type": "KrD6Q7IF"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'bUXNvIc6' \
    --contentId 'uyR2PirX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v0uz00Qw' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'XksEuJis' \
    --limit '80' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'r6BVKNww' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'mu2ev1u7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uUUZ7bK3' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '48om6JXQ' \
    --limit '61' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '8u0h9Tkj' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'VEwwA527' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w0OWMpHh' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'MtVuWe1i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KBooAcbS' \
    --body '{"contents": ["UCl0BYD8", "e3N3Wbjs", "EHpbwVoF"], "name": "skLhyY3N"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '90vPw8Mt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jFjOxunN' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'TjdvQZFX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vU1ayU2D' \
    --limit '10' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'lbsA4IuK' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'lgKXurXF' \
    --namespace "$AB_NAMESPACE" \
    --creator 'RO5CEzin' \
    --isofficial 'jm3gBPUf' \
    --limit '56' \
    --name 'kLLTSyn7' \
    --offset '31' \
    --orderby 'rj5dwIlU' \
    --sortby 'n2aMyPfq' \
    --subtype 'CHMY7vN2' \
    --tags 'awPd4MY6,1hT0ocCR,KI7Fc1yL' \
    --type 'tvZ1O7hc' \
    --userId '9LupWH4c' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'fF9FOV7m' \
    --isofficial '2rZRrQut' \
    --limit '48' \
    --name 'X2ODWzty' \
    --offset '63' \
    --orderby 'W1U6IARy' \
    --sortby 'L7ojlmKg' \
    --subtype 'U4g3r6cR' \
    --tags 'KGLXO0nb,cVKVcRFZ,j9lsS5vp' \
    --type 'Ov0y3d1s' \
    --userId '3Ysm37Bh' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["nOkYy1aL", "Rp6jQktJ", "zqa13L8D"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '89' \
    --name '0OOwxQ1y' \
    --offset '12' \
    --orderby 'JVnXBkOv' \
    --sortby 'kha9uNzW' \
    --subtype 'QBjKJAsI' \
    --tags 'amlysS0T,9zBNX9hV,TvAqwhT0' \
    --type 'hi10qMdZ' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'vIZvKnWn' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '0yQEDK93' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'nA0NCC9v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '7oJe4WG3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '5dn1IKlf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '49' \
    --orderby 'bXq1Ct6H' \
    --sortby 'zdNLsmKJ' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'YNRnWWfd' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'brd2GuIw' \
    --limit '24' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ajgKckp5' \
    --body '{"name": "sSssXACw"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dph2FyvL' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'MliAGf96' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hYtuMPqx' \
    --body '{"name": "Aq0eYjpN"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'wuOmsDK5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZK3zjHKf' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'FWpNCUm6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVjWUsdq' \
    --body '{"contentType": "L2gDmeF7", "fileExtension": "zDE4DqWE", "name": "JZbqr9l2", "preview": "LnGmRwzn", "previewMetadata": {"previewContentType": "ps5QZq8q", "previewFileExtension": "KgVXZTra"}, "subType": "AvytNFT4", "tags": ["xkxus4td", "5hAZ7Bmr", "UDIjadre"], "type": "bt3MHU8T"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'B4wxot9P' \
    --contentId 'hmmlpFUn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLmmBYHE' \
    --body '{"contentType": "XTMDZEqF", "fileExtension": "TTGxM0TT", "name": "fSiveyjW", "preview": "zQwLk97O", "previewMetadata": {"previewContentType": "Q1fLv4RK", "previewFileExtension": "gl8nLyeN"}, "subType": "t74v6XTo", "tags": ["7L0nVy8s", "T1BycOi6", "RqyN06Ev"], "type": "QliBdUKh"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'r60EgD2v' \
    --contentId 'Z6f1fB4a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nrin8ZIz' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lo4H4Rt8' \
    --limit '12' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '2YosnyTR' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'eCG5PD7t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GXxcFHSd' \
    --body '{"screenshots": [{"description": "HcwDJcX2", "screenshotId": "2QWWUlQr"}, {"description": "axOv1m4w", "screenshotId": "5u6AEsTL"}, {"description": "JXsTxNR4", "screenshotId": "zDL0TdDn"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'OVRIERfj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VlGacDxa' \
    --body '{"screenshots": [{"contentType": "SvZ2wHEU", "description": "ag7f0UGF", "fileExtension": "pjp"}, {"contentType": "0SO2IA4T", "description": "XP9lVHiN", "fileExtension": "jpeg"}, {"contentType": "4sXsR8dE", "description": "mWF0CnhW", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'F9dU62ks' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'a5WDX8a4' \
    --userId 'j8dD2ahF' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'YkdRNaUY' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3AWbuTR' \
    --limit '4' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'dAO0dYUM' \
    --limit '9' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3ImrNKT' \
    --limit '47' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '6VuAIhEm' \
    --body '{"contents": ["NIM5RivD", "WqdUcVbK", "AMHyeIsF"], "name": "pugBJ2IY"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'SxGoO2hV' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'p0PK2zbr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VppuaTOF' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'ORE27zln' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dnbSXnvh' \
    --body '{"contents": ["ugbIDVg2", "uZPPcuBE", "DkVbHHdd"], "name": "LhrJAgV5"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'fAq4LupT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EvAq84R6' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'Z3gv9OCl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MekU9NNX' \
    --limit '1' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '52ZdQh7I' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE