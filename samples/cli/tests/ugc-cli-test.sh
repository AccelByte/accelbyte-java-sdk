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
    --limit '100' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "p1rdBHok"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'uJc2p89k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "nEdd9iNk"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'gHYNmDYV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Zv8mJSoG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "uHVsFSyq", "fileExtension": "cudtJHeC", "name": "lYCc6fkN", "preview": "ow0QgM0s", "previewMetadata": {"previewContentType": "iilPKQaR", "previewFileExtension": "wYrB80ii"}, "subType": "f7B3gmgU", "tags": ["YNKs3wE2", "AvWHDyoR", "ymMDJcCg"], "type": "AfNg9sw5"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'mSvUglPf' \
    --contentId 'fdDW3uXT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "RiXQusHT", "fileExtension": "XaOz6Phw", "name": "tmwX34ss", "preview": "RL6JSSk5", "previewMetadata": {"previewContentType": "B0Yv1kS9", "previewFileExtension": "V0CnHlBJ"}, "subType": "7bpVsf4w", "tags": ["Kkqg90yg", "nKTKWKIF", "1NAtUwtf"], "type": "adpiTYXM"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'Odp8OZXC' \
    --namespace "$AB_NAMESPACE" \
    --creator 'UcUjo6bn' \
    --isofficial 'QCx8DrSf' \
    --limit '25' \
    --name 'KgNCzqic' \
    --offset '56' \
    --orderby 'tkKUgpUb' \
    --sortby 'Q4DRNGFk' \
    --subtype 'iraGPeED' \
    --tags 'ioTMsWPk,UcN52qbP,2k7FYgUv' \
    --type '4qmsSawl' \
    --userId 'Sq2Zqfhl' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'st5LAqpa' \
    --contentId 'MVMYZkLD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'lznTjnX0' \
    --isofficial 'F3jTqYlJ' \
    --limit '40' \
    --name 'iZTFL3me' \
    --offset '81' \
    --orderby 'sLPTsYOP' \
    --sortby 'f051h1Wl' \
    --subtype '22aJrJGx' \
    --tags 'Z0aDlarT,wbLxuyl1,q1mYVlhx' \
    --type 'MvRP3jrp' \
    --userId '5ACaB74P' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zNeL5D4i' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ea2pql1e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'hWunVNAL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '8ybm8Ev6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "upZEWcrW", "screenshotId": "QXkGhQue"}, {"description": "FRTlPZAC", "screenshotId": "kU7cfqAA"}, {"description": "QbGMwkb0", "screenshotId": "t0tmLibW"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'WttsHkiu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "CS67qi7B", "description": "Sy689WcB", "fileExtension": "jfif"}, {"contentType": "KNOBXlQN", "description": "2kZkDAi2", "fileExtension": "png"}, {"contentType": "iK97SXVC", "description": "AG4D413d", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'sHKUnbrH' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '32iYcTit' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["tjbM3SXN", "KPMbjfsL", "aCitHOdz"], "name": "VTgVcCce"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '61t2jhkI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'BZD2QzlZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["RyGCMbsC", "8O8Yoph4", "sahJKBos"], "name": "t62q2Ghl"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'eeBgvtcP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ZFbGQLbU' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "u3ma27E5"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'qmlZl6IV' \
    --body '{"tag": "VY5FuRqp"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Jhbxjwzg' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["eu0E9fIa", "99bLN6tZ", "HUX1r4Ei"], "type": "9qz5Hg8I"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'MxC4iM1W' \
    --body '{"subtype": ["nvnOulo7", "eoXqs4vK", "rvCIrifg"], "type": "Htwu3Nxb"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'PE6lTDwx' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '8FO2ygNb' \
    --limit '19' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'R5nkM9u9' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'hNdPvCru' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PjLAeAVC' \
    --body '{"name": "plNS8YR6"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'Q3ypbiQk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LLFC4NbH' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '8HJbRjZI' \
    --contentId 'QYRbZRc3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ooo99yYc' \
    --body '{"contentType": "UAWSYZpj", "fileExtension": "oQUAjr6c", "name": "E2dL2ViR", "preview": "E6HbObBY", "previewMetadata": {"previewContentType": "aqbZSRrb", "previewFileExtension": "pKee1WWw"}, "subType": "8BFwjokv", "tags": ["zhIpXgNh", "OXA3Bz1F", "x4F7w0G1"], "type": "gj0qy40e"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '70ejBzVu' \
    --contentId 'JtkxOsbi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CyPy9uvi' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '8gamZrGe' \
    --limit '28' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'PMtXRy46' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'P20oIGhy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eZ9nVd86' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'rPaJ4uDw' \
    --limit '24' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'JGcasqZP' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'ze5WS8ZW' \
    --namespace "$AB_NAMESPACE" \
    --userId '4tP2Dzph' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'kvGS2V6Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cMxL76IV' \
    --body '{"contents": ["z1nZAZ2Q", "qLTqZaSU", "SQDniJda"], "name": "df1p4c9g"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'm5y9Ypis' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJGMqfD9' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'nG0ttnwF' \
    --namespace "$AB_NAMESPACE" \
    --userId '5byO4g7t' \
    --limit '33' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xe0sFNmg' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'kScikBUO' \
    --namespace "$AB_NAMESPACE" \
    --creator 'dqmV6ytN' \
    --isofficial 'nftMsXyw' \
    --limit '61' \
    --name 'v6LuokHY' \
    --offset '77' \
    --orderby 'McHJEk9M' \
    --sortby '9AoNmtkg' \
    --subtype 'sHyXeQHE' \
    --tags 'P2Ze7R2M,LNQ7zTZJ,4JkJO5qf' \
    --type 'EblSSNTP' \
    --userId 'vOf0snH6' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'ogatgVe9' \
    --isofficial 'XmJP9iQN' \
    --limit '31' \
    --name 'wHqmCWaj' \
    --offset '79' \
    --orderby 'AdhtfBJD' \
    --sortby 'q6TdJ659' \
    --subtype 'sn4FdGGB' \
    --tags 'Y3FJOThh,wfhuCqLS,JxaC2iTi' \
    --type 'BdoTJyWm' \
    --userId 'B5cU0xeJ' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["GAIIADE5", "BjCakBc9", "7zqX7jDQ"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '62' \
    --name 'xdVIIxv0' \
    --offset '58' \
    --orderby 'uHehNlkp' \
    --sortby 'c3tNxvAe' \
    --subtype 'GrVXuiK1' \
    --tags '864uw0YG,sssGmU4r,gxTEp4HX' \
    --type 'n7DB2vjf' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'tgHVAln5' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'K2PR77LM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'J41YrWKE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'cLATMVkB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '9mSYbVlV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '39' \
    --orderby 'GYscGSZ1' \
    --sortby 'omhcR3oQ' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'mjytU9Be' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '8DdyesHh' \
    --limit '31' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlLv7ePF' \
    --body '{"name": "rMoTtPxo"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'PhBtJ9Bj' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'lgBYVQQ1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c14sSIzS' \
    --body '{"name": "wO3VAeDn"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'avWXykb9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SM64TEAu' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'j5hZ7wZ7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lk3Kk85o' \
    --body '{"contentType": "Ioyf1Kwh", "fileExtension": "6TWjgkgP", "name": "eTk0CRb9", "preview": "4nXmVXkY", "previewMetadata": {"previewContentType": "5dEogpFn", "previewFileExtension": "gUUM4Vzw"}, "subType": "p0jUlpgM", "tags": ["ILxNjOTe", "VMAU7sO3", "eD9TVnMd"], "type": "gkyvODkK"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'MEmN0K2y' \
    --contentId 'WOkf1SNr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lBQTrHj2' \
    --body '{"contentType": "yuMZNSzN", "fileExtension": "BgO3qUPr", "name": "tbTtmFTz", "preview": "ditHhCtk", "previewMetadata": {"previewContentType": "wfRbBB0b", "previewFileExtension": "AAKUCK92"}, "subType": "r7bT7eU6", "tags": ["T5MzOWM7", "GjcRxnqp", "KBVIqLIF"], "type": "4qiPnpKt"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'VOVVuSzo' \
    --contentId 'MNfBUkrY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vbJfLoOz' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'YDdXwrXd' \
    --limit '13' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '6ZtPWbAb' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'PNAxjaeF' \
    --namespace "$AB_NAMESPACE" \
    --userId '0aRAd7fR' \
    --body '{"screenshots": [{"description": "Qgx19pRr", "screenshotId": "l3hLsuyT"}, {"description": "YnbBWSkG", "screenshotId": "5fEggeTM"}, {"description": "aDYrlu4N", "screenshotId": "Tr4EQqUA"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'ng484uVR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QZJzpsJZ' \
    --body '{"screenshots": [{"contentType": "uUqkDVoe", "description": "Zkwo0gsc", "fileExtension": "png"}, {"contentType": "umhpNqbF", "description": "HIuij1vt", "fileExtension": "bmp"}, {"contentType": "d8GPKrRb", "description": "YZQNpBAb", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'xaJ39Xfn' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'aOgLL4sS' \
    --userId 'HPW2VDD9' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'KhMcIwYU' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'CNriYX3t' \
    --limit '64' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'opMfqXfo' \
    --limit '42' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '6pU4WS0x' \
    --limit '92' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '3hH1QaFL' \
    --body '{"contents": ["WHiaLRqa", "D9LWfKbm", "aPpeyLnF"], "name": "9idTA3sV"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'JUe8Xo65' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'Y43hTgzW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PhIeRZt2' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'PuqqyMZP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FH0CvNVH' \
    --body '{"contents": ["8huF0gx9", "3dpWkYpu", "tDp9oQ1q"], "name": "Mk8tLipj"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '6eHNZiYY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTJYG6c0' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'cFL6o1u0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPqNWlmi' \
    --limit '0' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'ImeCree2' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE