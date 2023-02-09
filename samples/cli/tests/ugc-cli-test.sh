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
    --limit '23' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "L7WqCetY"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'AdRe5wTP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Ji5BvYv0"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'eFxrMsPl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'WpVV0uNR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "KLJGU7Hu", "customAttributes": {"e6hQNvNl": {}, "gJvGvEiF": {}, "Cfyx1tIH": {}}, "fileExtension": "IUjWQlmb", "name": "Dg6NHQ6g", "preview": "BjqpWuns", "previewMetadata": {"previewContentType": "t0qiSqyI", "previewFileExtension": "G4gxJexL"}, "subType": "RwS11CXE", "tags": ["VeczWECm", "6MXIbqWB", "CYiz47OC"], "type": "PojmrNAd"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'YsKt3w63' \
    --contentId 'exzf8HOv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "KXHTBV6q", "customAttributes": {"6DkRMiRx": {}, "FkYtw28v": {}, "N2bDE6be": {}}, "fileExtension": "wdBIYgYT", "name": "2oC3m3xi", "payload": "dH4oM2UP", "preview": "n76gbPtr", "previewMetadata": {"previewContentType": "m3hHcRMZ", "previewFileExtension": "DBMYm9CO"}, "subType": "wv5tShF5", "tags": ["n4PVLEaE", "ZJQwuVD7", "ODffU679"], "type": "L8VQB5ul", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'iRYEGmCy' \
    --namespace "$AB_NAMESPACE" \
    --creator 'fQhS4vnN' \
    --isofficial 'Aigqh8uv' \
    --limit '1' \
    --name 'f6heG21s' \
    --offset '41' \
    --orderby 'qi7hkrXg' \
    --sortby 'NKdxV0ZA' \
    --subtype 'Fe55Vf7K' \
    --tags '7SkPiisI,109mXA1B,sSb9WwyD' \
    --type '6E98RKOn' \
    --userId 'WvFgPLgG' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'mSBXP71g' \
    --contentId 'sgqSVELx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["6siUQoiY", "JXNf7zkn", "8F2GMhUS"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'jHUFZ6PV' \
    --isofficial 'PNh86b9G' \
    --limit '98' \
    --name 'FLm1VOLz' \
    --offset '39' \
    --orderby 'yjjZYafU' \
    --sortby 'fTLaICJ1' \
    --subtype 'CW8vsPQF' \
    --tags 'OnEzQ7WD,eaiemPAI,LPE0Dzbe' \
    --type 'q4OKFVr8' \
    --userId '0gc7O3T9' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'lNian5hc' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'wvThrwOc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '7UusJFJv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'HrBFgkWN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "RSPhDEK0", "screenshotId": "Xx87VSeB"}, {"description": "i1hTLifj", "screenshotId": "XIwRU7x9"}, {"description": "34kyD0yW", "screenshotId": "eIxgHNDY"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'izILFzxQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "SU3gz4Z2", "description": "uPQoCH8L", "fileExtension": "jfif"}, {"contentType": "CEKUuUSu", "description": "pXClDuFY", "fileExtension": "bmp"}, {"contentType": "MoMFP7Oj", "description": "KUx6uFO6", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'MOaj0o2M' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '6Y37L4Rk' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["z2efz0ZY", "WX55jst9", "IuA6frc2"], "name": "lg5uKhAD"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'qHBt6eL3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '1T2ui5mO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["mS1mRxqT", "V2E1hzoi", "N4EC1Nrc"], "name": "GXg7NFHC"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '04TKLDub' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'OrKIZrk2' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "DscrNia0"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'mb0qOYU1' \
    --body '{"tag": "u2jBT5w5"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'NrJdnA9b' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["Qor87SYf", "b2QsyUGX", "FfKwXawJ"], "type": "DagOGr3w"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Rz8uhluH' \
    --body '{"subtype": ["w9fQeJbX", "w0Wvh4Ur", "awATZyI3"], "type": "YbZferkC"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ONYvBeg1' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Osv9ur41' \
    --limit '31' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'JIGw0qPS' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'jTzJdrzM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2uRj96I' \
    --body '{"name": "3G4vEQh6"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'XNMfmK52' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cj4cUP62' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'yCdmaOdV' \
    --contentId 'TV7Fighp' \
    --namespace "$AB_NAMESPACE" \
    --userId '2L2DJ3RE' \
    --body '{"contentType": "3tnoTBfG", "customAttributes": {"JR6iKX3X": {}, "2TcJhSEr": {}, "JYYXOKeq": {}}, "fileExtension": "tvaVZ4lQ", "name": "51CUhJK8", "payload": "qvsuDXPl", "preview": "Yc9idLWW", "previewMetadata": {"previewContentType": "y4dYUHOy", "previewFileExtension": "3k6k76ZU"}, "subType": "kBMQBZUo", "tags": ["PoKdCdOD", "axCQ2Npg", "Lk5URXtw"], "type": "mpgaFlMN", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '5GKwyfAC' \
    --contentId 'PbjMaPjX' \
    --namespace "$AB_NAMESPACE" \
    --userId '9qKPeCjq' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '0ZaxnUJc' \
    --limit '74' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'IumOFE04' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'Wx64apDB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZARKq6OI' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpBN3G8N' \
    --limit '76' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'pDDgpAb2' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'p1BI87dn' \
    --namespace "$AB_NAMESPACE" \
    --userId '0R6mmV1k' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'btJm4VlV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nPRBRKPj' \
    --body '{"contents": ["b1RnKYdH", "T25MIL6e", "dD1P4xhr"], "name": "ax8mbVKX"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'WpoyHfs2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yCMjl8Lp' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'DbWFLVMl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q0sTgUh3' \
    --limit '22' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'HRtSfj4X' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'dbHnrI3b' \
    --namespace "$AB_NAMESPACE" \
    --creator 'oYEHPZDj' \
    --isofficial 'Lc61FZyn' \
    --limit '73' \
    --name 'KU8GoisD' \
    --offset '15' \
    --orderby 'ppkrgUsO' \
    --sortby '6CZwYXZn' \
    --subtype 'GdANmJQ9' \
    --tags 'UjLAaTHY,QIidZ2oA,WcdrT6mW' \
    --type 'JIhbaymg' \
    --userId '5YGOQ6qA' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'ijQmfDjL' \
    --isofficial 'PZA5m8s3' \
    --limit '100' \
    --name 'xPSDLuDk' \
    --offset '60' \
    --orderby 'MqUJ48wJ' \
    --sortby 'M6oow5dH' \
    --subtype 'zOuiWMoJ' \
    --tags '7rt6ELK3,DVefRrAC,lbcokylI' \
    --type 'FSyV0Nmp' \
    --userId '2pYLFjMn' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["khEkTtuD", "sZFq0ud8", "ipLrbRNr"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '99' \
    --name 'eG32WQ03' \
    --offset '75' \
    --orderby 'IzzBiBeu' \
    --sortby 'CnpkZkHm' \
    --subtype 'sX75XJCT' \
    --tags 'rg7fP1O0,95o2cMUs,P6PYJc1k' \
    --type 'W6GgHayt' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ikWMk8OB' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'f0xemKl7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'lj1CWVSk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'fFOfHMpV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'HrSF7Fwn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '50' \
    --orderby 'PQc80FNw' \
    --sortby 'jT2rhugV' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'nIT3D9yR' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'bulA6E6a' \
    --limit '62' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7b5DL64m' \
    --body '{"name": "bAVPdPaB"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPbc6wLS' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'CVh0MrjV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZtQFy1bL' \
    --body '{"name": "lcbmfXBY"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'QZ7siJ5O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYoldTma' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'uxiMqWZy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hz12iCHt' \
    --body '{"contentType": "R1jFof7D", "customAttributes": {"ux8jwule": {}, "CCptbGNG": {}, "Ch5SoLxR": {}}, "fileExtension": "BEwMTFkm", "name": "EwfvoztP", "preview": "AyaYcqIR", "previewMetadata": {"previewContentType": "K42NPVNP", "previewFileExtension": "SczzIlAK"}, "subType": "1tmIAa5b", "tags": ["yIdEpCXY", "ZvVZPQD4", "TXFcVTP3"], "type": "qyIE1JYc"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'ySjOg2I9' \
    --contentId 'DT6dQTQ5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yij1HBwf' \
    --body '{"contentType": "X31MMxsm", "customAttributes": {"QT0nCtHv": {}, "1AG1z311": {}, "pCOpy3N9": {}}, "fileExtension": "znp39fOP", "name": "JNsRcxFJ", "payload": "UopO6db5", "preview": "UWBtz3B1", "previewMetadata": {"previewContentType": "jIE0BTOG", "previewFileExtension": "RionxtDR"}, "subType": "ch5eqST6", "tags": ["C6MLDYy7", "iCR9tfj9", "sfeEKfBY"], "type": "g4ygwf73", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'JcjPV3aI' \
    --contentId 'xufa3rHG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mlJp3klH' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'neEZ4rHz' \
    --limit '59' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'YFx1Xmmc' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '7qGDtCDz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lOmVdQX5' \
    --body '{"screenshots": [{"description": "4OQnZ2QN", "screenshotId": "0QCe7cKQ"}, {"description": "vZdlU5q6", "screenshotId": "DEKn8Agv"}, {"description": "ftIsTJIw", "screenshotId": "3Br4OX61"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'lvWekOah' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sw4Iin2q' \
    --body '{"screenshots": [{"contentType": "3UapRvCU", "description": "huKXfLv2", "fileExtension": "jpeg"}, {"contentType": "mjIfQlUv", "description": "0UXoWRm3", "fileExtension": "jpg"}, {"contentType": "NZ2IxVeQ", "description": "2YK5vh7f", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'jF2omyEF' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'laXvHtFv' \
    --userId 'eiTGWw28' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAxboAOs' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'UY5i70Ql' \
    --limit '89' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'KPEd4stx' \
    --limit '20' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1IDE1mU' \
    --limit '99' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'VOtCwFH4' \
    --body '{"contents": ["lRVBdraS", "RsC3ReEo", "PQtIuoBm"], "name": "q3t7LS4S"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'osXRne56' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'pihOcpCc' \
    --namespace "$AB_NAMESPACE" \
    --userId '03Jyp5lL' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'TytWgCYx' \
    --namespace "$AB_NAMESPACE" \
    --userId '9jcRZrB7' \
    --body '{"contents": ["XJuEBmhK", "Nt767xLt", "AiSihbPD"], "name": "FsNJJad4"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'GahzWXJ4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKLazan7' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'qjKxVbyR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICE0fo2r' \
    --limit '31' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofrb45pq' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE