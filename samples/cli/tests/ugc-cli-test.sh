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
    --limit '97' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "R66BV1lo"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '8CkSDVMk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "vofx5aie"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'cDXZEPE1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'o5YN1RnZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "uMbIhbZY", "fileExtension": "gnR4eYAV", "name": "O5gjmD9v", "preview": "6aBgfdoq", "previewMetadata": {"previewContentType": "FZa2ap73", "previewFileExtension": "AQo4VxaK"}, "subType": "JN1diZFg", "tags": ["6cznMc9b", "JSHSFJQo", "UCqYVpfM"], "type": "7cnRvXwp"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'vKiPRxkd' \
    --contentId 'BorbUK77' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ejxxBaSt", "fileExtension": "GiED1jVU", "name": "sLPR2fWg", "preview": "dPMU0s1B", "previewMetadata": {"previewContentType": "jzrlxEAn", "previewFileExtension": "UDUWQlPt"}, "subType": "QjQtxjUu", "tags": ["7w8iSQ5C", "tzxVCzwZ", "KB07GpjL"], "type": "i89FxkbO"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId '6i00rJZQ' \
    --namespace "$AB_NAMESPACE" \
    --creator 'qrx1y6kp' \
    --isofficial '4GFoIIrR' \
    --limit '37' \
    --name 'uYF3JcrF' \
    --offset '45' \
    --orderby 'd4lkqsir' \
    --sortby '1oOw8wwg' \
    --subtype 'swV6acc1' \
    --tags '4NL8RfVp,87ezGRF1,4uKiuFFZ' \
    --type '0Fr2hDvC' \
    --userId 'HJSIJwRn' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'ZLIagV6z' \
    --contentId 'mi8ML6Yk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'rtl7fd4l' \
    --isofficial 'Pq95NMqv' \
    --limit '99' \
    --name 'CtllHhQA' \
    --offset '88' \
    --orderby 'XyJO3Ypv' \
    --sortby 'Q5HVPBeS' \
    --subtype 'VBmRRJD7' \
    --tags 'avLNWJYM,KQQtFs7Z,B9lriHko' \
    --type 'FEoQQFJE' \
    --userId 'j7j3rYZ5' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OZMQFdxO' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'NhoSWCT8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'CI4alFh8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'TDGfBBgA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "sgfQUImT", "screenshotId": "MkMPExkl"}, {"description": "bPhlN3Cf", "screenshotId": "C0ogPgk2"}, {"description": "oib5q3Cd", "screenshotId": "j580acsD"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'WdJ5eElT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "wkXouCf5", "description": "qhbNPJIv", "fileExtension": "jpg"}, {"contentType": "nfwU4to9", "description": "pLUAnyOU", "fileExtension": "jfif"}, {"contentType": "XoFJYh6b", "description": "T1MFE5ib", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'KSLxV8v6' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'QfwAIP6B' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["gC20Vzwn", "UlPLkCZi", "vQuoa1yN"], "name": "w8UqvkIM"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'TtRiFsnh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'TYK4JKSd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["Evitc6fZ", "TXGl3U5i", "V3JNG8G4"], "name": "n4oJN9oM"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'THQQHjKc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'HuJbvcMj' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "k16uSAhQ"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'MJX8PaEh' \
    --body '{"tag": "1WlDaSNm"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'eL4PzORt' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["IAlrFwPS", "f9jz74L1", "0K7JJgQX"], "type": "yJ6LlzOy"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'lGeKXjDz' \
    --body '{"subtype": ["CVrSahiF", "AXM4QpwB", "ILbvvYTQ"], "type": "MBLqOY9i"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'pHeX0JTK' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'zPSPa0Ic' \
    --limit '42' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZRmqIPRl' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'YSgsBx8c' \
    --namespace "$AB_NAMESPACE" \
    --userId '4bgavXdf' \
    --body '{"name": "vveDiXWZ"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'OBRwzpmz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eAGBczDL' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'xrVsXLqT' \
    --contentId 'SA615sdN' \
    --namespace "$AB_NAMESPACE" \
    --userId '9iyi97Eg' \
    --body '{"contentType": "t4kxsSbx", "fileExtension": "odQUqFuk", "name": "hdwhpdLt", "preview": "koKnJK9j", "previewMetadata": {"previewContentType": "WTrM2NvI", "previewFileExtension": "OGjtPzV3"}, "subType": "OtAy5wvy", "tags": ["b77vlTxL", "gwLuC5zr", "8ruAuvJX"], "type": "zYDGl4AV"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'I3hdvfZL' \
    --contentId 'T1UEmWGT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R1TjIJwS' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'dN4QsGW1' \
    --limit '40' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'ui6zVfG6' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'K7mvNRmv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'am7GcLpS' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGeuufNH' \
    --limit '30' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ra2zThwh' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'eQYu86Za' \
    --namespace "$AB_NAMESPACE" \
    --userId '43PV7vYQ' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'zb5HAiFz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQvaoJTm' \
    --body '{"contents": ["mLfoRSAP", "sJ1FNAM7", "27wJPloB"], "name": "kOkRGvll"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'ivmjgn7I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gIXc8DFX' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'VgKZGBcy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fXp5M7gm' \
    --limit '78' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'DtwXxxrD' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'M7RRhr3Y' \
    --namespace "$AB_NAMESPACE" \
    --creator 'hdEAonme' \
    --isofficial 'BnZC6F7q' \
    --limit '68' \
    --name 'Gz9K4Mt5' \
    --offset '17' \
    --orderby 'Cw6yz2NC' \
    --sortby 'dYSJTcme' \
    --subtype 'ADjXhGRu' \
    --tags '85KmXq7o,L93IZKnT,UDhG3wg6' \
    --type 'T023HHBd' \
    --userId 'KIj5oJ2e' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'ZMfSSc2C' \
    --isofficial 'dvruLbdz' \
    --limit '12' \
    --name 'AkN3Oava' \
    --offset '90' \
    --orderby 'eSNbWmuJ' \
    --sortby 'nbKcl05A' \
    --subtype 'Qke612nw' \
    --tags 'tQ8phc8j,u2CK6dhv,cPr8oaVs' \
    --type 'WDjpuvJV' \
    --userId 'latIirte' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["kidhF83E", "w3wBhH6A", "nltUcyAW"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '86' \
    --name 'CS2OKNpn' \
    --offset '86' \
    --orderby 'JITxJIHC' \
    --sortby 'OFiqWQf5' \
    --subtype '457D9jk1' \
    --tags 'zospbtXS,C6xwqzSH,jpWeLL96' \
    --type 't0Ofz18W' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BWrOE83a' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '4mRaUohS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'VUQzIDWC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '3oXyHfah' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '0V2lVMYF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '66' \
    --orderby '2xIsh3jM' \
    --sortby 'HAT2q9tV' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'LBCPrw7r' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCcSUg3m' \
    --limit '49' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'BAUoFnWu' \
    --body '{"name": "GN5mWSAt"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'VxEE00la' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'Z93LJtl5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LO1STKL9' \
    --body '{"name": "rwwCDZ2k"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'nHtS5Rbp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qnUkOLGR' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '4r19uymq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nAwsZ110' \
    --body '{"contentType": "8OXpRdkp", "fileExtension": "fRSwaqYk", "name": "BvOek2U3", "preview": "oQSysn72", "previewMetadata": {"previewContentType": "CJrh3Ilg", "previewFileExtension": "ygTrO8Wi"}, "subType": "jlROOoR6", "tags": ["GGjYmC8M", "tI9GgNHk", "J9DBaMDG"], "type": "vXhHNdNl"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'Fk5lJyup' \
    --contentId 'cJykOAbQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uqPlJlzA' \
    --body '{"contentType": "J823mUsx", "fileExtension": "RvWK4N2K", "name": "WFgtfYfD", "preview": "ea5S8kEB", "previewMetadata": {"previewContentType": "ybXStP17", "previewFileExtension": "oLVt2Dxo"}, "subType": "iFPUYHJL", "tags": ["NCXw2DrX", "XxuviNRg", "xaia6Lkf"], "type": "aRMT8a8E"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'mv8uoTIg' \
    --contentId '2CHgAVxb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ft2nrjEK' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'aOLBC6AW' \
    --limit '78' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'N57iARZK' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'zeyKbjom' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lv6yd4Rk' \
    --body '{"screenshots": [{"description": "oQJ6l2wK", "screenshotId": "6uQf2GCP"}, {"description": "ajbcQQg2", "screenshotId": "xWpHX5ZV"}, {"description": "IYqKNaqi", "screenshotId": "X6E1KP5z"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'vN4G3FmR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jpdMkDpf' \
    --body '{"screenshots": [{"contentType": "UM4F3iUl", "description": "tbW01fxW", "fileExtension": "jpeg"}, {"contentType": "EEutoVLP", "description": "MTBso8je", "fileExtension": "pjp"}, {"contentType": "OxIUeIbk", "description": "vBPhLe3X", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'qwh69SoS' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'lgFTPzaa' \
    --userId 'xwXJ8K6K' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'rhVZJOn6' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'VJrC7woA' \
    --limit '6' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'ECcTjjMV' \
    --limit '37' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJhp7zEK' \
    --limit '81' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'i5wnUJKb' \
    --body '{"contents": ["7JPPA13u", "MAj4H7YF", "WY0haQDT"], "name": "UKBAjv7h"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'sGYdKIx6' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'GPWrTV4n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qTD7aVse' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'ZTYCWtDB' \
    --namespace "$AB_NAMESPACE" \
    --userId '8wBvYEtz' \
    --body '{"contents": ["T7ZXxyy9", "QtO2rOST", "6gf7kn62"], "name": "tgUKwJc8"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'Nvf84wXB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GfvjH1vI' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'LJm2CLDv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ar4aODXe' \
    --limit '10' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9RjvLGr' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE