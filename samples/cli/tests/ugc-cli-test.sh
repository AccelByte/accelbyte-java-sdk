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
echo "1..90"

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
    --limit '70' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "J5DujzVj"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'xd6OMYeP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "4Vk3bJAp"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'VbWmr59U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'aro9FeTV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "5opC68nP", "fileExtension": "MIhMVrot", "name": "nJZVhhAR", "preview": "OuOhwkDW", "previewMetadata": {"previewContentType": "WOb7REHJ", "previewFileExtension": "mMLeM17G"}, "subType": "UOLq6QVr", "tags": ["uwZ1jqaf", "3q55xBYt", "k5wbDbX0"], "type": "PIeDvero"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'Ks6jHLgX' \
    --contentId 'Kt3LKLtd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "PSSqyYqI", "fileExtension": "PiYC6YB5", "name": "AHJ354r9", "preview": "2hce4KVd", "previewMetadata": {"previewContentType": "w9DnSoqf", "previewFileExtension": "JGhXxbtf"}, "subType": "xG2oGS8J", "tags": ["4OZfpyrl", "ymLYZvVX", "oAxgVrb5"], "type": "1M0VcVF0"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'o17toN92' \
    --namespace "$AB_NAMESPACE" \
    --creator 'VITnJbwL' \
    --isofficial 'WwACjEdy' \
    --limit '8' \
    --name '0at8bfZ2' \
    --offset '28' \
    --orderby '9Ua81gnm' \
    --sortby '4xdhznei' \
    --subtype 'M0Hyrw72' \
    --tags 'xepVbrty,DrdST9rz,fP1QqeK6' \
    --type 'NgKfRYaB' \
    --userId 'bUCddKkv' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'ZQ2csSA3' \
    --contentId 'yrXrsRSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'obhpsEO5' \
    --isofficial 'i6CyWofk' \
    --limit '56' \
    --name 'Qd30MtzC' \
    --offset '23' \
    --orderby 'Vq18V9L8' \
    --sortby 'yNUfn3D3' \
    --subtype 'wzhRTq14' \
    --tags 'yMaGO22p,tJiXJJwT,1uasB7PI' \
    --type 'sT34DjY2' \
    --userId 'nDgTnEc0' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'gJxbiQ0z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetSpecificContent' test.out

#- 15 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '0mS0OOKc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDownloadContentPreview' test.out

#- 16 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '4U0ZL1ve' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "F9idKjWS", "screenshotId": "1xityesQ"}, {"description": "EKsTurwZ", "screenshotId": "34FpH0cZ"}, {"description": "D6X6vkfD", "screenshotId": "rv5gWX99"}]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateScreenshots' test.out

#- 17 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '7rCoJTty' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "byERpVDT", "description": "QJwGNCB6", "fileExtension": "pjp"}, {"contentType": "etfr9XC0", "description": "EmmNg011", "fileExtension": "jpg"}, {"contentType": "5yZBDqxD", "description": "NPsd32PL", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUploadContentScreenshot' test.out

#- 18 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '3tIX4NX4' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'FMWfs7x1' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteContentScreenshot' test.out

#- 19 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 19 'SingleAdminGetAllGroups' test.out

#- 20 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["lSXwnUZF", "rjaCtlRb", "Wbbvy262"], "name": "hbOyL5fK"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateGroup' test.out

#- 21 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'zY5diyet' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetGroup' test.out

#- 22 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'CUdhdI98' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["zGhfcJCn", "5vEc9DKC", "tY1J8dy5"], "name": "G60NerWR"}' \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminUpdateGroup' test.out

#- 23 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'hVplKxSn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminDeleteGroup' test.out

#- 24 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'HS7fyLBa' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetGroupContents' test.out

#- 25 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetTag' test.out

#- 26 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "ODv88RtI"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminCreateTag' test.out

#- 27 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'gPfI1kSS' \
    --body '{"tag": "tADJW0q6"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateTag' test.out

#- 28 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'BLnpXLTq' \
    > test.out 2>&1
eval_tap $? 28 'AdminDeleteTag' test.out

#- 29 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetType' test.out

#- 30 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["367uHP4X", "aEO6PCVa", "3pCokaN0"], "type": "yjWUqyXR"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminCreateType' test.out

#- 31 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ETEP8KET' \
    --body '{"subtype": ["0GW9tic3", "O8vDAWXH", "K5hR7pEe"], "type": "4VtVNtAU"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateType' test.out

#- 32 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '59dxncwP' \
    > test.out 2>&1
eval_tap $? 32 'AdminDeleteType' test.out

#- 33 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjsUVWep' \
    --limit '29' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetChannel' test.out

#- 34 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'jT1KxbHu' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAllUserChannels' test.out

#- 35 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'w7ThXfiN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vH2CV9Yw' \
    --body '{"name": "bW1YVTUf"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminUpdateChannel' test.out

#- 36 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'YVKGKZgh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YRZMXX1N' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteChannel' test.out

#- 37 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'e1pSsRcv' \
    --contentId 'SU5bTlXR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NlCaC3DR' \
    --body '{"contentType": "UqcG0H1W", "fileExtension": "ztJm2RP0", "name": "IMQsBZQ4", "preview": "d9bNS7JV", "previewMetadata": {"previewContentType": "3ipcgPQZ", "previewFileExtension": "O2HIJ5bB"}, "subType": "iz0sS6hG", "tags": ["8OhzdNZm", "GtjT8YeN", "3KZbx1dp"], "type": "TG24Ifuc"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateContentS3' test.out

#- 38 AdminUpdateContentDirect
eval_tap 0 38 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 39 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'N6WkfmmE' \
    --contentId 'qkRuvDX0' \
    --namespace "$AB_NAMESPACE" \
    --userId '0QL0KafC' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteContent' test.out

#- 40 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qkhacxwh' \
    --limit '79' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetContent' test.out

#- 41 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'nRGBMlxw' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAllUserContents' test.out

#- 42 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'Ube0u3ws' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YH53yyiv' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminHideUserContent' test.out

#- 43 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ssAXkGqu' \
    --limit '24' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetAllGroups' test.out

#- 44 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ETwS4ojd' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteAllUserGroup' test.out

#- 45 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'Zwjn6wu6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v309xxgq' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetGroup' test.out

#- 46 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'q8Mp7q82' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mnRxACiX' \
    --body '{"contents": ["8mo4elEM", "Q2cifRrO", "MFu1kylp"], "name": "rstaIqSs"}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateGroup' test.out

#- 47 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '3uC7fNRy' \
    --namespace "$AB_NAMESPACE" \
    --userId 's499cg4L' \
    > test.out 2>&1
eval_tap $? 47 'AdminDeleteGroup' test.out

#- 48 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'rUIPHY3T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fx9IPa0H' \
    --limit '57' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetGroupContents' test.out

#- 49 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'zkq59THM' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteAllUserStates' test.out

#- 50 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId '9J0qmMcl' \
    --namespace "$AB_NAMESPACE" \
    --creator 'OrFtc3hD' \
    --isofficial 'jrpzQRcd' \
    --limit '77' \
    --name 'KBdi7FhX' \
    --offset '1' \
    --orderby 'pKGeK3Jq' \
    --sortby 'Rnbnqe9V' \
    --subtype 'hXjdowql' \
    --tags 'A2O3Yzr2,aJFuqLCe,GIMW9LF0' \
    --type 'DaS4egvt' \
    --userId '5hZr68AD' \
    > test.out 2>&1
eval_tap $? 50 'SearchChannelSpecificContent' test.out

#- 51 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'FtAN4Vq9' \
    --isofficial 'TwPH9Gdt' \
    --limit '17' \
    --name '2xOAr6uO' \
    --offset '62' \
    --orderby 'dqBJL7hI' \
    --sortby 'dWWjtwGO' \
    --subtype 'jBsVhAIc' \
    --tags 'yOpOvfA8,eI16TVGi,qE9vn1uK' \
    --type '01YIbUNQ' \
    --userId 'E01ENBmF' \
    > test.out 2>&1
eval_tap $? 51 'PublicSearchContent' test.out

#- 52 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["O9llPmqL", "IFssnsaR", "DZVEO7Q7"]}' \
    > test.out 2>&1
eval_tap $? 52 'PublicGetContentBulk' test.out

#- 53 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 53 'GetFollowedContent' test.out

#- 54 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '82' \
    --name 'ePRkCuhg' \
    --offset '66' \
    --orderby 'NL7dBEl6' \
    --sortby '13eIMDCO' \
    --subtype 'hmgZXrDj' \
    --tags 'c6VuiT6F,W3oxMFyw,HyA3z6oQ' \
    --type 'DmWh3g68' \
    > test.out 2>&1
eval_tap $? 54 'GetLikedContent' test.out

#- 55 DownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc downloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'lv2ZhSxa' \
    > test.out 2>&1
eval_tap $? 55 'DownloadContentByShareCode' test.out

#- 56 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '56K9xJW2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByContentID' test.out

#- 57 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'OYqTqMd3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AddDownloadCount' test.out

#- 58 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'GbW2OnjI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateContentLikeStatus' test.out

#- 59 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'pEDKRcfG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'PublicDownloadContentPreview' test.out

#- 60 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 60 'GetTag' test.out

#- 61 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 61 'GetType' test.out

#- 62 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '47' \
    --orderby '8mVP183S' \
    --sortby 'TWSklLKN' \
    > test.out 2>&1
eval_tap $? 62 'PublicSearchCreator' test.out

#- 63 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 63 'GetFollowedUsers' test.out

#- 64 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'QEV4tdLz' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetCreator' test.out

#- 65 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'iQOSWRlF' \
    --limit '91' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 65 'GetChannels' test.out

#- 66 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'TXd35hXD' \
    --body '{"name": "moX0Y4tM"}' \
    > test.out 2>&1
eval_tap $? 66 'CreateChannel' test.out

#- 67 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'HU33lX3G' \
    > test.out 2>&1
eval_tap $? 67 'DeleteAllUserChannel' test.out

#- 68 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'mYCYPRcQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fSmntjWH' \
    --body '{"name": "hW42GaiE"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateChannel' test.out

#- 69 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'iPFyi2Jb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JGzpXFcz' \
    > test.out 2>&1
eval_tap $? 69 'DeleteChannel' test.out

#- 70 CreateContentDirect
eval_tap 0 70 'CreateContentDirect # SKIP deprecated' test.out

#- 71 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'SNDgh4y2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'whcw7vNw' \
    --body '{"contentType": "lMhvHG0W", "fileExtension": "swSZaOo2", "name": "UlzSgxEW", "preview": "3VpPvgVg", "previewMetadata": {"previewContentType": "GR7RpsH0", "previewFileExtension": "D3FlStAR"}, "subType": "BgC612vZ", "tags": ["GBu9Qf5l", "sUNL7qx8", "tLuOeFG9"], "type": "sDEvy7zS"}' \
    > test.out 2>&1
eval_tap $? 71 'CreateContentS3' test.out

#- 72 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'Gf1CwgBC' \
    --contentId 'AqWb9KC3' \
    --namespace "$AB_NAMESPACE" \
    --userId '0PcxiX6t' \
    --body '{"contentType": "ctt8iKBM", "fileExtension": "uiFVMhiU", "name": "kwwLz6Qw", "preview": "bHjQHve6", "previewMetadata": {"previewContentType": "f792o5JW", "previewFileExtension": "P3kVAsyr"}, "subType": "jkPJ0nUD", "tags": ["RIeHuvwk", "hyZ3K8w9", "TIPxy3Ox"], "type": "hLqjg3iA"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateContentS3' test.out

#- 73 UpdateContentDirect
eval_tap 0 73 'UpdateContentDirect # SKIP deprecated' test.out

#- 74 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'ft9DYr6S' \
    --contentId 'LtrkLRJw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hVWnZu6K' \
    > test.out 2>&1
eval_tap $? 74 'DeleteContent' test.out

#- 75 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'cinlIvs7' \
    --limit '97' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 75 'PublicGetUserContent' test.out

#- 76 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'JTPdRcZQ' \
    > test.out 2>&1
eval_tap $? 76 'DeleteAllUserContents' test.out

#- 77 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'csQM0jE3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QDxxmPpn' \
    --body '{"screenshots": [{"description": "f6wwZ4XL", "screenshotId": "C0l3wlhB"}, {"description": "ORVZD6av", "screenshotId": "He8zgs1r"}, {"description": "cSmnnOET", "screenshotId": "1mQ93KWa"}]}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateScreenshots' test.out

#- 78 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'awMkzzIM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BppLK4VQ' \
    --body '{"screenshots": [{"contentType": "hO5bZx0p", "description": "KdtUyYWm", "fileExtension": "jpg"}, {"contentType": "hE2PW1QR", "description": "lzp0iQgu", "fileExtension": "pjp"}, {"contentType": "h3Hv7s9g", "description": "D5aZ09Qq", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UploadContentScreenshot' test.out

#- 79 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'WLUDtKww' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'DlR8bAG2' \
    --userId 'UDZNuUyc' \
    > test.out 2>&1
eval_tap $? 79 'DeleteContentScreenshot' test.out

#- 80 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'tMaItE3D' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateUserFollowStatus' test.out

#- 81 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'RaW79Dau' \
    --limit '19' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 81 'GetPublicFollowers' test.out

#- 82 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'D4rPXpqt' \
    --limit '9' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowing' test.out

#- 83 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'jOPMeVgp' \
    --limit '16' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 83 'GetGroups' test.out

#- 84 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '6go9yhhy' \
    --body '{"contents": ["FRZ8qwAq", "4ahSOnAV", "v7aOXJ4P"], "name": "8wEq73ns"}' \
    > test.out 2>&1
eval_tap $? 84 'CreateGroup' test.out

#- 85 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'UDyPpSw1' \
    > test.out 2>&1
eval_tap $? 85 'DeleteAllUserGroup' test.out

#- 86 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'PyVXGGe6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIGiVuoB' \
    > test.out 2>&1
eval_tap $? 86 'GetGroup' test.out

#- 87 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'mRWA6Cks' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tKYJKcnR' \
    --body '{"contents": ["2v1oCuh0", "zozXHHSi", "D9R64bWd"], "name": "RLoNAkmm"}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateGroup' test.out

#- 88 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'KRe2U7hF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fizI8j7Z' \
    > test.out 2>&1
eval_tap $? 88 'DeleteGroup' test.out

#- 89 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'vytnjCqt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ygYXOShT' \
    --limit '99' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 89 'GetGroupContent' test.out

#- 90 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '5uTqqCB1' \
    > test.out 2>&1
eval_tap $? 90 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE