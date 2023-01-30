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
    --limit '34' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "NjEcYhCD"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'e3nyycgZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "76UE0j2K"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'URu9X3tG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'FKpXDllS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "zaNAOsKv", "customAttributes": {"F7htRhlL": {}, "P1BXBN3N": {}, "hrdMgYHT": {}}, "fileExtension": "sd1LfG5x", "name": "kKM4xUvQ", "preview": "NkqbYC5u", "previewMetadata": {"previewContentType": "OUblflEN", "previewFileExtension": "FXteWn83"}, "subType": "p0ulnPIK", "tags": ["6wUkb2eO", "J4HfgUeg", "aSmxi7Am"], "type": "V3iRl2XN"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '7uaybOPv' \
    --contentId 'yprTwu2L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "bvub53gU", "customAttributes": {"RpwHIUsm": {}, "SGPOvCY9": {}, "5RGdzhkj": {}}, "fileExtension": "1xQBqhkC", "name": "cK6NCfx6", "payload": "G59SwAHd", "preview": "dO57jA8J", "previewMetadata": {"previewContentType": "MIoMBVf8", "previewFileExtension": "p087LkN9"}, "subType": "Z894zUFX", "tags": ["OFi0HIhl", "9acJvdHW", "XMkiBYLm"], "type": "olgotyVa", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId '3haPU3HC' \
    --namespace "$AB_NAMESPACE" \
    --creator '4rG5fA9t' \
    --isofficial 'qucrzl6t' \
    --limit '8' \
    --name 'iG7iyKru' \
    --offset '69' \
    --orderby 'VLu9oUa4' \
    --sortby 'rWc6TKfU' \
    --subtype 'sYLk3En3' \
    --tags 'DxVKahO0,EgeyvVrn,x7nunFTY' \
    --type 'lzpqaHlO' \
    --userId 'wxuN6FH0' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Xs8T5g8M' \
    --contentId 'kL2RNYSN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["qnfjIXIC", "IbIGpsxh", "91HbkBbh"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '7vRSAHHK' \
    --isofficial '7CetDWQg' \
    --limit '97' \
    --name 'VtaUGpnk' \
    --offset '71' \
    --orderby '2AUQ4WNv' \
    --sortby 'xw1w1EN8' \
    --subtype 'WMsUxAWs' \
    --tags 'Mta5lOZ4,XVioThIA,h5d94QUU' \
    --type 'VwKULLgR' \
    --userId 'sukYwnN8' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'JuoVM14N' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '135yvSTM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'Fqp5R4fX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'mn4FjFzB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "DxNTMStJ", "screenshotId": "ivnTN6sw"}, {"description": "JWcwMVHl", "screenshotId": "Mp59NHRg"}, {"description": "p4P6lcgz", "screenshotId": "DhYAcfdx"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'AzRTPhrG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "XETeo4X3", "description": "BGhz5Ozy", "fileExtension": "jfif"}, {"contentType": "BvFJFfL6", "description": "fOYu25di", "fileExtension": "jpg"}, {"contentType": "7g8uvEOu", "description": "U0lH56Qf", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'PI4BZau1' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '15vkFcp4' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["8Pdn0lbW", "34w7qaeU", "LiyFivGw"], "name": "9GaBF7js"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'e977AjeD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '0J4I6jTr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["Ujtbreoo", "k4YgZVkA", "o3wZrTFL"], "name": "VIxCMtaB"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'B1alFLmn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'MUxBC70p' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "1bwwwkOG"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'b7VU9CXI' \
    --body '{"tag": "0yZt5aOE"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '1S3ZQdaT' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["j1yYv6DF", "0XQ3fch5", "9rlpWP5C"], "type": "fBpLmcQK"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'VPinCmmN' \
    --body '{"subtype": ["t9bQAKJL", "PMePlttL", "84ZNh9sq"], "type": "nfE8KWwI"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'f0PeOPpD' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '5adKjZuO' \
    --limit '84' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'IeC9tkgk' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'DeLaJZoX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bPqMkJ5d' \
    --body '{"name": "1h6jLknn"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'l6BgTwYG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJyrHnxI' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'cr1e2EQV' \
    --contentId 'QJjZCp3j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pvn2JzQ5' \
    --body '{"contentType": "sYLRHLKQ", "customAttributes": {"zSsNjUhF": {}, "yrk3DBfb": {}, "RndSaIP4": {}}, "fileExtension": "RK9UAOJv", "name": "RNgXvplX", "payload": "VtJM52YH", "preview": "Bno71RRX", "previewMetadata": {"previewContentType": "C1aYWNQ3", "previewFileExtension": "reHbNH6y"}, "subType": "HJmGr4YH", "tags": ["apcE5Lb4", "XVlxBS1c", "gwsMezRN"], "type": "8HO7Wyct", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'YWV1K7aH' \
    --contentId 'bEoUwtBP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WhjFqY8k' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'i8ktehbz' \
    --limit '49' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'cFIlFJ3u' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'HMKQuhgR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fR5tiS4v' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'EuQRAab1' \
    --limit '77' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '610xS7pm' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'e6NF1VXa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6pkiBud' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'MYoIA0AX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xf8mbLxA' \
    --body '{"contents": ["9xgytyed", "jsbi74oM", "v2qOl4WF"], "name": "1LA3c9nV"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '6AJquVux' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RkjF3JeA' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'tvQSMkks' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0LCumFH' \
    --limit '75' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'rHopdtX3' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId '9Y26KZ72' \
    --namespace "$AB_NAMESPACE" \
    --creator 'EaBKgyGt' \
    --isofficial 'Syb9ec2d' \
    --limit '64' \
    --name 'dP22VxJA' \
    --offset '90' \
    --orderby 'lhYq4neB' \
    --sortby 'nI26vv3I' \
    --subtype '72TexPiz' \
    --tags 'vQQknPcU,dMGvMLU6,PqwWDFnZ' \
    --type 'WiPi0jJI' \
    --userId 'GeuYsFAF' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '38UNWm6A' \
    --isofficial 'v08ZehYe' \
    --limit '59' \
    --name 'GtPbs0s5' \
    --offset '63' \
    --orderby 'PvZq3rzX' \
    --sortby 'Cw9zZ0ve' \
    --subtype 'GiXDKfz8' \
    --tags 'AnZXKO8B,dKAwfaHj,IhSuPc5W' \
    --type '5ZPdbkjA' \
    --userId 'QiBEs6XY' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["BZXOjo6F", "px6GlyIw", "J5qUm5eN"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '91' \
    --name 'Dv9FYzoc' \
    --offset '57' \
    --orderby 'lyWsnDtm' \
    --sortby '19DM7FKG' \
    --subtype '1mk1qBeD' \
    --tags 'veUA1Njs,9ShC3oIr,P11DGOi9' \
    --type 'iVUWbVfQ' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Xapvxxvp' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ZPaHvUtn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'fUuV0Aqd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'owtVwkKo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'UM1vKsps' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '8' \
    --orderby 'eyz3WavH' \
    --sortby 'd3qygUGI' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'fDQWj0lB' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'NHh0F9NO' \
    --limit '96' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'sXymFeVy' \
    --body '{"name": "ZiJL0nO5"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'CgpsUynv' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'MWhxx6Bk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KWUXrCkK' \
    --body '{"name": "6CRxNxbF"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'kUV287Ta' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HMDOJTWh' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '2A6z5Szq' \
    --namespace "$AB_NAMESPACE" \
    --userId '2CtADIpV' \
    --body '{"contentType": "P14239zg", "customAttributes": {"0aVZxHk7": {}, "9q5SXITI": {}, "5YAAiTqd": {}}, "fileExtension": "clMYvFl5", "name": "j0RUKMTv", "preview": "Nfczjb3H", "previewMetadata": {"previewContentType": "7yopRRMT", "previewFileExtension": "bWspBQGQ"}, "subType": "Zx0rqiDb", "tags": ["UM4C9tP5", "5YhrqmwU", "iyKiJtRe"], "type": "wj2yuZED"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'WWjaJ5Wu' \
    --contentId 'N5nLGkAZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KEatmxKw' \
    --body '{"contentType": "Qs6WnDQj", "customAttributes": {"Nua497d5": {}, "Snu23DvE": {}, "78RyqzFR": {}}, "fileExtension": "zpr7fsFI", "name": "xAJUYTLO", "payload": "gvQ1kOBE", "preview": "iwVwmmG3", "previewMetadata": {"previewContentType": "M33fVD0m", "previewFileExtension": "1pR7Wwea"}, "subType": "UOi6muy3", "tags": ["nkxYXlaE", "wEE9lxhN", "NpPLrpvL"], "type": "4kTItGm5", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'vAW3xAFy' \
    --contentId 'CqSBF2Bl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M9WImRzb' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'PDnfUqA2' \
    --limit '85' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'mwoNNirH' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'iYGh7sKh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F43LD81y' \
    --body '{"screenshots": [{"description": "vvi3Y6hN", "screenshotId": "lCT9JSLW"}, {"description": "gDk7Nyqc", "screenshotId": "rRnns7Mk"}, {"description": "c2kmKEui", "screenshotId": "3FOvkbxq"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '6dArhDAw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfRT34mV' \
    --body '{"screenshots": [{"contentType": "3aJ6aBJ2", "description": "lmKizz0M", "fileExtension": "png"}, {"contentType": "JXQiOtDd", "description": "GBfk3mRE", "fileExtension": "jfif"}, {"contentType": "7sD2iw8P", "description": "sudilhJH", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'V009tKgf' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'wSGam02K' \
    --userId 'KeRDdzTn' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'jOTAZ7Jr' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqUWiPQJ' \
    --limit '50' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJJz2DPU' \
    --limit '39' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'jMtnBz4n' \
    --limit '53' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1TsIRrFZ' \
    --body '{"contents": ["GoBsdP16", "PZYrb9e5", "zUqKUzLO"], "name": "lZeDaD6T"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1oO9iXJ7' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'yA0nVJqT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BVvqgW6n' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'T9yLs5xr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PinjjPUL' \
    --body '{"contents": ["n940BSPn", "NDtAZZha", "8dy9fNKv"], "name": "isVW6Ty7"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'sIsMYLqv' \
    --namespace "$AB_NAMESPACE" \
    --userId '6JZwmXHP' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'bPuRHSzm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUqpMK0q' \
    --limit '70' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '7op52TrN' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE