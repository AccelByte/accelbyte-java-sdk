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
    --limit '22' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "YrXm3EIg"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'ebPEe2ZK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Vlh7XOiZ"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'XNrPvVAv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'OJL2RTjs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ycJaDbyh", "fileExtension": "9mBMwJHS", "name": "NxEUqH1q", "preview": "T0VPD4x4", "previewMetadata": {"previewContentType": "aM5Wb8hU", "previewFileExtension": "kLZDzRQo"}, "subType": "DlSeHSqk", "tags": ["7O9567Yt", "rTVjo5nW", "QCvlK56q"], "type": "7LZD9cR4"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'CQ4mObWc' \
    --contentId 'j88AGbMC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "XOVS55n3", "fileExtension": "2dcmAwNh", "name": "s9vzdbw7", "preview": "3zmjUB7s", "previewMetadata": {"previewContentType": "kpuweEmu", "previewFileExtension": "U8MowPvD"}, "subType": "rVu0Bq0m", "tags": ["lhz9dr9f", "tPbIHCam", "4z8adBoz"], "type": "BZmR5fqj"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'ObhlITIm' \
    --namespace "$AB_NAMESPACE" \
    --creator 'YY97z9of' \
    --isofficial 'lC9HVpzK' \
    --limit '26' \
    --name '9MwIoXCT' \
    --offset '73' \
    --orderby '5ZfMEp7Z' \
    --sortby '05Yf4ci5' \
    --subtype '65oOdb42' \
    --tags 'F0KqbbRg,EYAQvo95,WBuOBN6x' \
    --type 'TMo1iVxs' \
    --userId 'Avr2X4k8' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'C9JNLtUy' \
    --contentId 'hIgdWRCg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'XH3NZeSI' \
    --isofficial 'HRVazllU' \
    --limit '94' \
    --name '7I954P0k' \
    --offset '98' \
    --orderby '4lFW3nbN' \
    --sortby 'TkK3cHZu' \
    --subtype 'dw0W0gop' \
    --tags 'itTRPhF2,BbbcbMyq,kTuDBYJL' \
    --type 'P7SuO3b0' \
    --userId 'EztdijdF' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '6igxF4W7' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ahPQNJeu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'dHXChzzu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'lODMr2cB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "ot05AT91", "screenshotId": "q3FzPzS4"}, {"description": "MrkWyd9C", "screenshotId": "mDBscLsR"}, {"description": "2Wkbupll", "screenshotId": "aUVm3UzC"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'EBnkIyM0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "G5iWiwuI", "description": "fDxkXKtm", "fileExtension": "jfif"}, {"contentType": "Ajbj7fwh", "description": "EDJcWkLp", "fileExtension": "jpeg"}, {"contentType": "aczLY8XU", "description": "Ju3sXQjj", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '7wd40kTn' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'h5LkMkY8' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["hxpvqTM6", "F3PHfnlG", "2Kc00uTE"], "name": "vXTyuXml"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'p2L2Edft' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'rVzU6gP9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["CdVzasqZ", "4u8qLjND", "71jhZ8dq"], "name": "YgaauvlH"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '85HVrm49' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'sBMiraWm' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "m6BGdzfp"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'JmYCwBmR' \
    --body '{"tag": "FUXJDE7Q"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'sIUpNoj8' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["cmMhOmWD", "rD6AxDJB", "bmoNPe46"], "type": "Cs53KAZg"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ub1k5Da8' \
    --body '{"subtype": ["0AvqlQcp", "O0xjbqr8", "iIv2iBVW"], "type": "IE7oSnC5"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '66gyPlsQ' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'v0bYNGod' \
    --limit '100' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'vmFDYZy2' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'OEiz53n1' \
    --namespace "$AB_NAMESPACE" \
    --userId '5GSIzLAq' \
    --body '{"name": "xiD6G5tV"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'v0Vp8EiA' \
    --namespace "$AB_NAMESPACE" \
    --userId '8G9C36B4' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'ZUttOhlK' \
    --contentId 'BVIaeoQd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WITjJwZB' \
    --body '{"contentType": "sJ569QnL", "fileExtension": "zhvIZ3Sa", "name": "TH4UtSVt", "preview": "274zhjLy", "previewMetadata": {"previewContentType": "LHeg2M6d", "previewFileExtension": "PQkmgkin"}, "subType": "cJdnL3yf", "tags": ["7vdRcx61", "6uC5mAwp", "G4Uj17VQ"], "type": "XHG1RmxK"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '9GcLIdcZ' \
    --contentId 'HTldXWml' \
    --namespace "$AB_NAMESPACE" \
    --userId 'brYmv05R' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvN2UzwZ' \
    --limit '75' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kel9wGZY' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'nc40kQz3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALb6MCJo' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'GrAmZEjX' \
    --limit '38' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '4Zk2r0JG' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'jBLepCQJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '2Rmcd4Z9' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'uC7Ii6dp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rxGurjFl' \
    --body '{"contents": ["ncPHlRHq", "ScnrucU8", "dbSODHdW"], "name": "ykErYqKC"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'YAeBUr4O' \
    --namespace "$AB_NAMESPACE" \
    --userId '7nH8IpUu' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'xmIoWgIY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eSxQCGf6' \
    --limit '56' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '21SHUvv3' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'aCEMN08j' \
    --namespace "$AB_NAMESPACE" \
    --creator 'YcFMcwKW' \
    --isofficial 'pZzqXEEh' \
    --limit '81' \
    --name 'ft4iK7kG' \
    --offset '53' \
    --orderby '8gICEEfs' \
    --sortby 'Bqr3a260' \
    --subtype 'e45yKgNE' \
    --tags 'z4ESyPuX,MZo83ve1,wxryQpKA' \
    --type 'a0TFHuG2' \
    --userId 'QuHMRDOy' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'UmTmhrxU' \
    --isofficial 'b8SdQwB8' \
    --limit '77' \
    --name 'YkXhZSow' \
    --offset '82' \
    --orderby 'HmhScvGJ' \
    --sortby 'UESgITGn' \
    --subtype 'a0p2aOTc' \
    --tags 'BTvrzUmc,SkbZrN8j,gJvCItsE' \
    --type 'rgK8MxNq' \
    --userId 'alivSVV7' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["zKtOB6iy", "BEmLVtDd", "D2Z5UWOp"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '17' \
    --name 'iMzFTa0G' \
    --offset '71' \
    --orderby 'gl3L0WfB' \
    --sortby 'Q2NNAmZn' \
    --subtype 'luzrhVdy' \
    --tags 'AUUaCvBn,UZyECYqv,DkScY9q1' \
    --type 'kHIEZ6Dh' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'xpvH9DWG' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'vHT6owqB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'JBAMSanR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'RS9HvRH2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'HQkPZXqx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '60' \
    --orderby '7bVApN8f' \
    --sortby 'lCWVXv4X' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'LCPjhlyu' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'tw2KpnUQ' \
    --limit '36' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'DqeLCTBX' \
    --body '{"name": "Y2yHzrIs"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '9CQ0VFZ1' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'gxaEJq8j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'txUwNUkA' \
    --body '{"name": "mjgjuMtH"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'y6ZdhTcI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8KRUR2s' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'WG2PoptN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XdeJmArY' \
    --body '{"contentType": "YR22cnmV", "fileExtension": "8dNgIjvL", "name": "sB5uSTrB", "preview": "q0pcmtMv", "previewMetadata": {"previewContentType": "XX1yFmYy", "previewFileExtension": "D9siv92W"}, "subType": "gteOIxQU", "tags": ["xgZbfUdF", "dt6bvRE9", "RbGFg8QR"], "type": "Q88dMOz0"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '2E0WFUdP' \
    --contentId 's6jdCamB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sb00YRTj' \
    --body '{"contentType": "d3ZRjMmo", "fileExtension": "KXC2WJ5N", "name": "q47K76bD", "preview": "jqELG6Jm", "previewMetadata": {"previewContentType": "41687O85", "previewFileExtension": "edVEIZNv"}, "subType": "3F0qTOIb", "tags": ["14D9ct4e", "HwAkYaHe", "DHphY5w0"], "type": "tGfNKQ0y"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'A500sTJM' \
    --contentId 'KA46vGeL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9HIysVM' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'XazEOhEd' \
    --limit '96' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'C1dFY87m' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'PPXUHbZa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dbf0XWz7' \
    --body '{"screenshots": [{"description": "3rpM8AxE", "screenshotId": "viEhP3g4"}, {"description": "nAZcJ2ON", "screenshotId": "y1MyOOKM"}, {"description": "zw9NsR15", "screenshotId": "axxLPNbO"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'TPyGoXTe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NbU0NA4a' \
    --body '{"screenshots": [{"contentType": "1K6NUC1I", "description": "xYIVRsfa", "fileExtension": "bmp"}, {"contentType": "CqtnFtYF", "description": "BYLJEXZT", "fileExtension": "png"}, {"contentType": "vB64KJ0V", "description": "s66j00JP", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'gen10jnb' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 't6HHRtX3' \
    --userId 'fYxvDsCZ' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVrEaSnB' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '2OHQgoW2' \
    --limit '32' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'nFT70xTo' \
    --limit '65' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'rE05D0HP' \
    --limit '95' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'arrozDFP' \
    --body '{"contents": ["inJA7OzE", "st3Yk7qI", "pOq0xq4G"], "name": "GjAkroCM"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '8ngphfKy' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'Ez8nFaqV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEPBYjxn' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'ggs9unfV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBZXbMfq' \
    --body '{"contents": ["BTaSBb8J", "CEyLcp85", "rW7xy0gZ"], "name": "bfrnPOQ8"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'RWAOnk3P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kgZyZOCy' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'r8yBip48' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XH4wzAtd' \
    --limit '7' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'RxmS58Q7' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE