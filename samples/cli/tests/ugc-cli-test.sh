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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "BxyZcDXB"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'pGlsQuJu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8vMf0IsJ"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'kTrd8IDc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'V2zXnTKj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "XY1bPqam", "fileExtension": "iBxx9Cs1", "name": "8EY84ekI", "preview": "tqRzHU1o", "subType": "h570KQBV", "tags": ["aewc72kr"], "type": "Sha68n3Y"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'nozp1C2K' \
    --contentId 'mIQTuBdN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "EUsxFb8C", "fileExtension": "J17M7DJZ", "name": "aMSxECbZ", "preview": "bygyoarO", "subType": "RoeNHSb8", "tags": ["Rh3kgs9q"], "type": "qJbnQsoB"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'giVpP8Cm' \
    --namespace "$AB_NAMESPACE" \
    --creator '3yvASUox' \
    --isofficial 'dxxFqmAG' \
    --limit '91' \
    --name 'J8IEdagE' \
    --offset '38' \
    --orderby 'p4w29KOu' \
    --sortby '9c19R6XD' \
    --subtype 'qWHkkP8n' \
    --tags 'pLEKMfji' \
    --type 'X7jpkVZk' \
    --userId '3IaQYEmq' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'GodOEGt9' \
    --contentId 'gPOj0c6i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'vIas73uc' \
    --isofficial 'YnFAJ3DK' \
    --limit '91' \
    --name '4Eogg0Y3' \
    --offset '93' \
    --orderby 'oYlpv5bV' \
    --sortby 'AgtsDhUT' \
    --subtype 'DUscbQDj' \
    --tags 'bTQuPMz2' \
    --type 'PTRlkyU8' \
    --userId '9ZPOw6zP' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'FJ42cwmz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetSpecificContent' test.out

#- 15 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'BBSMNcoA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDownloadContentPreview' test.out

#- 16 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'AOjKNjfc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "YHm093aY", "screenshotId": "gBU1sqjy"}]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateScreenshots' test.out

#- 17 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'K0XH45Pa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "RSOFQBtu", "description": "23REZ8hR", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUploadContentScreenshot' test.out

#- 18 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'X7LGOvDd' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'YiQS9i7m' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteContentScreenshot' test.out

#- 19 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 19 'SingleAdminGetAllGroups' test.out

#- 20 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["91pjG9gp"], "name": "xL6ycTQd"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateGroup' test.out

#- 21 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'vln2LAuS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetGroup' test.out

#- 22 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'QWEXL6LF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["E1YHo9m1"], "name": "26ZWc8hH"}' \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminUpdateGroup' test.out

#- 23 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'tWvbNYqg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminDeleteGroup' test.out

#- 24 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'UqslArFP' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetGroupContents' test.out

#- 25 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetTag' test.out

#- 26 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "vaCv8kU9"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminCreateTag' test.out

#- 27 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'dBBpdsJL' \
    --body '{"tag": "hsVyExrk"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateTag' test.out

#- 28 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'xoot0B7W' \
    > test.out 2>&1
eval_tap $? 28 'AdminDeleteTag' test.out

#- 29 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetType' test.out

#- 30 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["ercZdpMc"], "type": "i37Ds7YS"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminCreateType' test.out

#- 31 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'fExaI3uz' \
    --body '{"subtype": ["LteMbFAl"], "type": "t4hr7HmO"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateType' test.out

#- 32 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'YiBA5ltA' \
    > test.out 2>&1
eval_tap $? 32 'AdminDeleteType' test.out

#- 33 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXmlG6eh' \
    --limit '7' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetChannel' test.out

#- 34 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'doTFpBIc' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAllUserChannels' test.out

#- 35 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'uC1dQY93' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OJnJ6Te9' \
    --body '{"name": "vD8ldz7H"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminUpdateChannel' test.out

#- 36 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'u8AD79kd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WunvizU0' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteChannel' test.out

#- 37 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'q1pHyhhE' \
    --contentId 'RoGgdrys' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MizBGSRd' \
    --body '{"contentType": "P2l7DNSZ", "fileExtension": "8Aq0XiPL", "name": "QXSe07Zd", "preview": "dOGTMlJj", "subType": "Bwj9HJHQ", "tags": ["KseEdSXR"], "type": "DSvguauw"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateContentS3' test.out

#- 38 AdminUpdateContentDirect
eval_tap 0 38 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 39 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '1xT7eMwS' \
    --contentId 'l9MLH0Nn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJ2ulNzB' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteContent' test.out

#- 40 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'vwJaQa54' \
    --limit '71' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetContent' test.out

#- 41 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'lvA8RWSp' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAllUserContents' test.out

#- 42 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'abUt7xk6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QxyWhfqo' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminHideUserContent' test.out

#- 43 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jw2o8oWU' \
    --limit '32' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetAllGroups' test.out

#- 44 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'PCZ2HzT7' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteAllUserGroup' test.out

#- 45 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'NXmWDlXs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uNIdQJR5' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetGroup' test.out

#- 46 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'lsNOlvkf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'waSbnsuL' \
    --body '{"contents": ["CgToxuVT"], "name": "ekJgvg6h"}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateGroup' test.out

#- 47 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '5HIpH0Dv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iplEk4vj' \
    > test.out 2>&1
eval_tap $? 47 'AdminDeleteGroup' test.out

#- 48 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '3LDp4yqD' \
    --namespace "$AB_NAMESPACE" \
    --userId 't8QUZDpx' \
    --limit '22' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetGroupContents' test.out

#- 49 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'asinGcjr' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteAllUserStates' test.out

#- 50 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'kmRMttgj' \
    --namespace "$AB_NAMESPACE" \
    --creator 'DSaIVBmf' \
    --isofficial 't3Udg7p9' \
    --limit '82' \
    --name 'GmY2H5kX' \
    --offset '77' \
    --orderby 'sisSX28n' \
    --sortby 'ARxWRpv5' \
    --subtype 'ou5xtvd2' \
    --tags '8OUfCt8U' \
    --type 'JC5flNyj' \
    --userId '6HsTtX8P' \
    > test.out 2>&1
eval_tap $? 50 'SearchChannelSpecificContent' test.out

#- 51 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '3llnaaS9' \
    --isofficial 'lqyygPcf' \
    --limit '20' \
    --name 'JIxfQZza' \
    --offset '21' \
    --orderby 'NVbDxVMq' \
    --sortby '7HJk0F89' \
    --subtype 'xAc3YVfa' \
    --tags 'ENtrl0pT' \
    --type 'KZTXqzHu' \
    --userId 'BMYQSA2j' \
    > test.out 2>&1
eval_tap $? 51 'PublicSearchContent' test.out

#- 52 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["z1ZOpdOj"]}' \
    > test.out 2>&1
eval_tap $? 52 'PublicGetContentBulk' test.out

#- 53 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 53 'GetFollowedContent' test.out

#- 54 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '76' \
    --name 'ddB41JuM' \
    --offset '11' \
    --orderby '7RUyBHRj' \
    --sortby '8IiRimRl' \
    --subtype 'lHT6Dc40' \
    --tags 'vFFA6gpU' \
    --type '7EW3x1dC' \
    > test.out 2>&1
eval_tap $? 54 'GetLikedContent' test.out

#- 55 DownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc downloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'pm55gOeq' \
    > test.out 2>&1
eval_tap $? 55 'DownloadContentByShareCode' test.out

#- 56 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'QIqcJVKm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByContentID' test.out

#- 57 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'BM1J1Ibu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AddDownloadCount' test.out

#- 58 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'TrrkbmuT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateContentLikeStatus' test.out

#- 59 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'hOqmEnDX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'PublicDownloadContentPreview' test.out

#- 60 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 60 'GetTag' test.out

#- 61 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 61 'GetType' test.out

#- 62 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 62 'GetFollowedUsers' test.out

#- 63 GetCreator
./ng net.accelbyte.sdk.cli.Main ugc getCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'Say46mv7' \
    > test.out 2>&1
eval_tap $? 63 'GetCreator' test.out

#- 64 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '1BAZAOjt' \
    --limit '63' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 64 'GetChannels' test.out

#- 65 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '2vmTj7tT' \
    --body '{"name": "7TZHWDdC"}' \
    > test.out 2>&1
eval_tap $? 65 'CreateChannel' test.out

#- 66 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIsZoArW' \
    > test.out 2>&1
eval_tap $? 66 'DeleteAllUserChannel' test.out

#- 67 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'wPHcyFAd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AtYciLIg' \
    --body '{"name": "RwFRr0gw"}' \
    > test.out 2>&1
eval_tap $? 67 'UpdateChannel' test.out

#- 68 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'B9tz3vp9' \
    --namespace "$AB_NAMESPACE" \
    --userId '9XVlV8rK' \
    > test.out 2>&1
eval_tap $? 68 'DeleteChannel' test.out

#- 69 CreateContentDirect
eval_tap 0 69 'CreateContentDirect # SKIP deprecated' test.out

#- 70 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '3tE6n0sm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ip1tw3L7' \
    --body '{"contentType": "cUd9pqtv", "fileExtension": "6JfPZwcC", "name": "VOXcVa80", "preview": "TmCwtD2l", "subType": "AH01o6Nd", "tags": ["cBIgzrDy"], "type": "WpFBYGmm"}' \
    > test.out 2>&1
eval_tap $? 70 'CreateContentS3' test.out

#- 71 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'BawMyoKy' \
    --contentId 'NpdAasm8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xwUfzOlQ' \
    --body '{"contentType": "iZY4NbOQ", "fileExtension": "XJ7uOTzN", "name": "Mvuq2tNl", "preview": "4CX4IjiK", "subType": "4DEUJRVK", "tags": ["3l9Eb0R1"], "type": "XRb0RH8v"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateContentS3' test.out

#- 72 UpdateContentDirect
eval_tap 0 72 'UpdateContentDirect # SKIP deprecated' test.out

#- 73 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'S1smeOln' \
    --contentId 'grdTXCza' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBtkZMio' \
    > test.out 2>&1
eval_tap $? 73 'DeleteContent' test.out

#- 74 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '4wcyhloV' \
    --limit '88' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetUserContent' test.out

#- 75 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yp8QtcEm' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserContents' test.out

#- 76 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'CEVc75Uf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eypWjDNh' \
    --body '{"screenshots": [{"description": "zCL5sWS2", "screenshotId": "qwO763iE"}]}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateScreenshots' test.out

#- 77 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'klkzLm88' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpLuYRO3' \
    --body '{"screenshots": [{"contentType": "C55yHpwK", "description": "2JaqenDG", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 77 'UploadContentScreenshot' test.out

#- 78 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '7a2NUplW' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'iLjq06n6' \
    --userId 'a0rW8Efk' \
    > test.out 2>&1
eval_tap $? 78 'DeleteContentScreenshot' test.out

#- 79 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'paXtwYZJ' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateUserFollowStatus' test.out

#- 80 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q4WbwNms' \
    --limit '62' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 80 'GetPublicFollowers' test.out

#- 81 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'tjEurH8e' \
    --limit '22' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 81 'GetPublicFollowing' test.out

#- 82 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'JzNKtRUa' \
    --limit '91' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 82 'GetGroups' test.out

#- 83 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1ETdsmwz' \
    --body '{"contents": ["jkkn9oiQ"], "name": "l05g7cO3"}' \
    > test.out 2>&1
eval_tap $? 83 'CreateGroup' test.out

#- 84 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMb6Ojlo' \
    > test.out 2>&1
eval_tap $? 84 'DeleteAllUserGroup' test.out

#- 85 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '6DMNpP2q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MrTQ1Upj' \
    > test.out 2>&1
eval_tap $? 85 'GetGroup' test.out

#- 86 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'fU6wJhy1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jOVkkUlS' \
    --body '{"contents": ["79527EZ2"], "name": "5Ia8uCeZ"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateGroup' test.out

#- 87 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'FlLtEVpD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AEbA82jy' \
    > test.out 2>&1
eval_tap $? 87 'DeleteGroup' test.out

#- 88 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '74lq0pDE' \
    --namespace "$AB_NAMESPACE" \
    --userId '5xRwh5b4' \
    --limit '9' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 88 'GetGroupContent' test.out

#- 89 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcM7ScSs' \
    > test.out 2>&1
eval_tap $? 89 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE