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
    --limit '77' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ARj2QAYq"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'an6tUXYU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "FkumXEpp"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'uCpWWdEG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '1hzd0qld' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "CAyhjr3R", "fileExtension": "8DIUtbGo", "name": "0Qz6WF1G", "preview": "yU5xQecH", "previewMetadata": {"previewContentType": "fHII2nuc", "previewFileExtension": "v6rhr978"}, "subType": "GatGmvn2", "tags": ["rsdF5CoP", "E5HcPjMr", "yrvoEFJM"], "type": "RkXBzU4l"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '3Haj81bg' \
    --contentId 'fUB0T3N2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "iF24Py2s", "fileExtension": "Ct4dkzY5", "name": "3ZkKS2ax", "preview": "mrybsHV6", "previewMetadata": {"previewContentType": "IAQgBLe5", "previewFileExtension": "T4BcUWOU"}, "subType": "pws2nOXS", "tags": ["rzCjjcnC", "jT8TuuKt", "cQ6knFLl"], "type": "KSGOHX4f"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'hm3kdJKq' \
    --namespace "$AB_NAMESPACE" \
    --creator 'iR1oTand' \
    --isofficial '4aL5w2wy' \
    --limit '100' \
    --name 'g2zdFzp8' \
    --offset '80' \
    --orderby 'aHxjLrdm' \
    --sortby 'pRtjcUjh' \
    --subtype 'hRmw3M7S' \
    --tags 'FnmLCHhR", "Ohw5N4j2", "9axIGL1v' \
    --type 'DljpXbk6' \
    --userId 'L4u4a37S' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'deinJIZj' \
    --contentId 'mngpnywg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'AyxWHlfl' \
    --isofficial 'kke6PRZH' \
    --limit '13' \
    --name 'dqZHCgue' \
    --offset '72' \
    --orderby 'rCKPQkMp' \
    --sortby 'kuhFSlmG' \
    --subtype 'Cnj3WP5t' \
    --tags 'Tb48j37p", "0TtwSZRV", "hsyXeJX8' \
    --type 'woIzjJmG' \
    --userId 'itLoLZOY' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'LYLV7hWZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetSpecificContent' test.out

#- 15 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'HQgKV7RV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDownloadContentPreview' test.out

#- 16 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'VhSoim1r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "Z6APmBty", "screenshotId": "WNV4Pyhs"}, {"description": "a3llnU9i", "screenshotId": "KO0Awbnf"}, {"description": "jE7i1XtJ", "screenshotId": "2IDX7CEk"}]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateScreenshots' test.out

#- 17 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'eoP5UI4r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "f4QfMTd1", "description": "CYkUXQBX", "fileExtension": "png"}, {"contentType": "1uzVTb5B", "description": "8fp3BkTH", "fileExtension": "jpg"}, {"contentType": "9QVhEaJC", "description": "Xz1P7lel", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUploadContentScreenshot' test.out

#- 18 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'IssHqGXa' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'PVDmBCmx' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteContentScreenshot' test.out

#- 19 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 19 'SingleAdminGetAllGroups' test.out

#- 20 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["hXqFdLn3", "xgo7otuG", "2dK4qi89"], "name": "mqKOZvHb"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateGroup' test.out

#- 21 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'hnjYp5sd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetGroup' test.out

#- 22 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'mQEdenGQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["VSc9E0Hj", "QMfxPKtW", "TGkzCbtz"], "name": "RY8FMMwJ"}' \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminUpdateGroup' test.out

#- 23 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'bL97xdiJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminDeleteGroup' test.out

#- 24 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'memfnE8z' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetGroupContents' test.out

#- 25 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetTag' test.out

#- 26 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "3s5PopBZ"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminCreateTag' test.out

#- 27 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'bAGp4n3S' \
    --body '{"tag": "MaKzg3Wt"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateTag' test.out

#- 28 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Btcz9jfb' \
    > test.out 2>&1
eval_tap $? 28 'AdminDeleteTag' test.out

#- 29 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetType' test.out

#- 30 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["xDxBh0BF", "hUKmIl5s", "4in0GnxL"], "type": "O7hURkXx"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminCreateType' test.out

#- 31 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'SmF7umVn' \
    --body '{"subtype": ["Ebfphkj1", "mx96stga", "PYGRgwdw"], "type": "OXQRSR73"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateType' test.out

#- 32 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '6X2i8JO4' \
    > test.out 2>&1
eval_tap $? 32 'AdminDeleteType' test.out

#- 33 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'CpTAS1AD' \
    --limit '91' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetChannel' test.out

#- 34 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'XAJS2ulV' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAllUserChannels' test.out

#- 35 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'fFot4b3R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQLGo4Zs' \
    --body '{"name": "5glimeXD"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminUpdateChannel' test.out

#- 36 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'cJpYly1M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HsUtahBw' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteChannel' test.out

#- 37 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'Ue3WzEkF' \
    --contentId 'WzuT8d3j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gcLCQhFO' \
    --body '{"contentType": "sjBCffuY", "fileExtension": "SETv7GLk", "name": "a0YFLadC", "preview": "qXgD1Au2", "previewMetadata": {"previewContentType": "MgXAax3b", "previewFileExtension": "idDFESTR"}, "subType": "MnqMquA8", "tags": ["jwZa4zTi", "k0Gh97jK", "ydDxVg68"], "type": "5Ja6psqj"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateContentS3' test.out

#- 38 AdminUpdateContentDirect
eval_tap 0 38 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 39 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'eUfYDWXG' \
    --contentId 'FMyRy9vW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltSxHDqy' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteContent' test.out

#- 40 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'JF5BJ4u9' \
    --limit '95' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetContent' test.out

#- 41 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2ucduZu' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAllUserContents' test.out

#- 42 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'M3iifsHH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xdbiQz6F' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminHideUserContent' test.out

#- 43 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ASF8INbC' \
    --limit '62' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetAllGroups' test.out

#- 44 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'gYo6uWXt' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteAllUserGroup' test.out

#- 45 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'LBnmSkH5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'moblH0Um' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetGroup' test.out

#- 46 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'kawzshLl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZXEK3JMZ' \
    --body '{"contents": ["cZO3RjmM", "YlE8vQk4", "CAif6Frx"], "name": "nK38XAB7"}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateGroup' test.out

#- 47 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'oCnc3PbD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MORBdJPd' \
    > test.out 2>&1
eval_tap $? 47 'AdminDeleteGroup' test.out

#- 48 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'Ddbc1E50' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lCza5UFu' \
    --limit '37' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetGroupContents' test.out

#- 49 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'UrLSwwlF' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteAllUserStates' test.out

#- 50 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'Fii6K3B7' \
    --namespace "$AB_NAMESPACE" \
    --creator '8UIOBhRv' \
    --isofficial 'l2yCCpgy' \
    --limit '4' \
    --name 'vyU5eoMz' \
    --offset '62' \
    --orderby 'PCw3cbgu' \
    --sortby 'xZ9LkIjf' \
    --subtype 'xi5xc7rH' \
    --tags 'NF3gPcT1", "YREPT1aN", "1UNMOk3d' \
    --type '4A8IuLcS' \
    --userId 'rhRfBDlo' \
    > test.out 2>&1
eval_tap $? 50 'SearchChannelSpecificContent' test.out

#- 51 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'wV73RQYP' \
    --isofficial 'lOBKzD0S' \
    --limit '29' \
    --name 'BTAjvKaN' \
    --offset '88' \
    --orderby 'nQNeKwSl' \
    --sortby '2mu3L2E9' \
    --subtype 'IRm5kNXj' \
    --tags 'updFxlgj", "oXkj41kp", "0pvKtBdV' \
    --type '6tA1hSl0' \
    --userId 'mWk1JqXd' \
    > test.out 2>&1
eval_tap $? 51 'PublicSearchContent' test.out

#- 52 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["5ayyXTGD", "pLMvuam6", "M37G6cqC"]}' \
    > test.out 2>&1
eval_tap $? 52 'PublicGetContentBulk' test.out

#- 53 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 53 'GetFollowedContent' test.out

#- 54 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '59' \
    --name 'e4gOfhzR' \
    --offset '94' \
    --orderby 'mv8kQmiT' \
    --sortby 'vijW0bSY' \
    --subtype '32BJxdY2' \
    --tags 'Hnc1YJIR", "m8lkCIHG", "bBRVlZG8' \
    --type 'mPTd2762' \
    > test.out 2>&1
eval_tap $? 54 'GetLikedContent' test.out

#- 55 DownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc downloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DMF0z1WX' \
    > test.out 2>&1
eval_tap $? 55 'DownloadContentByShareCode' test.out

#- 56 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '8Mbq0gLu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByContentID' test.out

#- 57 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'PJRVSaD4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AddDownloadCount' test.out

#- 58 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'J7ifAZap' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateContentLikeStatus' test.out

#- 59 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'zInLLSbR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'PublicDownloadContentPreview' test.out

#- 60 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 60 'GetTag' test.out

#- 61 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 61 'GetType' test.out

#- 62 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '24' \
    --orderby '8SkIr9Ud' \
    --sortby 'vdjZDmWf' \
    > test.out 2>&1
eval_tap $? 62 'PublicSearchCreator' test.out

#- 63 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 63 'GetFollowedUsers' test.out

#- 64 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'LoAPXSnF' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetCreator' test.out

#- 65 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'hgVJzAPj' \
    --limit '72' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 65 'GetChannels' test.out

#- 66 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'BT8juY6m' \
    --body '{"name": "FAWcKV6G"}' \
    > test.out 2>&1
eval_tap $? 66 'CreateChannel' test.out

#- 67 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0HeytPw' \
    > test.out 2>&1
eval_tap $? 67 'DeleteAllUserChannel' test.out

#- 68 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'Dgk2VADa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSGf4Ipf' \
    --body '{"name": "Ns97d0Es"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateChannel' test.out

#- 69 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'EwFmnjIP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wBPgwmBP' \
    > test.out 2>&1
eval_tap $? 69 'DeleteChannel' test.out

#- 70 CreateContentDirect
eval_tap 0 70 'CreateContentDirect # SKIP deprecated' test.out

#- 71 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'W6sTrZH4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XYisgjZS' \
    --body '{"contentType": "hvYh1sGz", "fileExtension": "DH5RDzBs", "name": "wq7UvZbA", "preview": "eQtXvvIA", "previewMetadata": {"previewContentType": "2txAnQE8", "previewFileExtension": "RnVRTU3R"}, "subType": "xXtfrQRW", "tags": ["jylVn7Vk", "pmF6XfT4", "2ukvzy2U"], "type": "pjd7o9zL"}' \
    > test.out 2>&1
eval_tap $? 71 'CreateContentS3' test.out

#- 72 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'QimNN84X' \
    --contentId '2YzpxWEr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKkBDvSa' \
    --body '{"contentType": "W1BjYOpa", "fileExtension": "Q66qdmgs", "name": "WtD8MXf4", "preview": "3I7tvY2x", "previewMetadata": {"previewContentType": "M2orCLTk", "previewFileExtension": "yGGDTEmv"}, "subType": "fA1KrwKO", "tags": ["Y5QKbnFO", "IItRjBMx", "nMm2IWI7"], "type": "xgv6n8cL"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateContentS3' test.out

#- 73 UpdateContentDirect
eval_tap 0 73 'UpdateContentDirect # SKIP deprecated' test.out

#- 74 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'CzgQocqO' \
    --contentId '23KnmIS1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gA3un7sY' \
    > test.out 2>&1
eval_tap $? 74 'DeleteContent' test.out

#- 75 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '7IHHqC9J' \
    --limit '73' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 75 'PublicGetUserContent' test.out

#- 76 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'pCILPpeb' \
    > test.out 2>&1
eval_tap $? 76 'DeleteAllUserContents' test.out

#- 77 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'kHzwMZNc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VpPZFvtY' \
    --body '{"screenshots": [{"description": "QYPH0xFk", "screenshotId": "sP7eiwdI"}, {"description": "gz3rfzEY", "screenshotId": "qHMJon9h"}, {"description": "l6eqQPXa", "screenshotId": "czBNc9dB"}]}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateScreenshots' test.out

#- 78 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '0B6YDRQo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bBEdCftK' \
    --body '{"screenshots": [{"contentType": "wo6YMQFb", "description": "GYgwniHk", "fileExtension": "jfif"}, {"contentType": "HyniDFrN", "description": "aKL3IqUT", "fileExtension": "pjp"}, {"contentType": "loc1cV7r", "description": "6qMXlDIy", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UploadContentScreenshot' test.out

#- 79 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'Ywe0U1wo' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '1URpCGdC' \
    --userId 'qVHhY4Vo' \
    > test.out 2>&1
eval_tap $? 79 'DeleteContentScreenshot' test.out

#- 80 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'QXloVAC2' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateUserFollowStatus' test.out

#- 81 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'yDWCcxtI' \
    --limit '54' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 81 'GetPublicFollowers' test.out

#- 82 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'oN2bm0WE' \
    --limit '77' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowing' test.out

#- 83 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cp9Hi9wW' \
    --limit '71' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 83 'GetGroups' test.out

#- 84 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQoCKQ6s' \
    --body '{"contents": ["oM8n1GgG", "Agzr1uUs", "IBCAmvmh"], "name": "UXeU60rD"}' \
    > test.out 2>&1
eval_tap $? 84 'CreateGroup' test.out

#- 85 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'neEZTnSo' \
    > test.out 2>&1
eval_tap $? 85 'DeleteAllUserGroup' test.out

#- 86 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'A0AML5BM' \
    --namespace "$AB_NAMESPACE" \
    --userId '3mGOtKa6' \
    > test.out 2>&1
eval_tap $? 86 'GetGroup' test.out

#- 87 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '6OeMFtgz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDMvdfb3' \
    --body '{"contents": ["LCzlx0C1", "NanolqAd", "6imFLWup"], "name": "LKaXUhmE"}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateGroup' test.out

#- 88 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'PZ9nOKaf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZqdtsnV' \
    > test.out 2>&1
eval_tap $? 88 'DeleteGroup' test.out

#- 89 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'UxWE4521' \
    --namespace "$AB_NAMESPACE" \
    --userId 'INIbr1Iw' \
    --limit '55' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 89 'GetGroupContent' test.out

#- 90 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jx20R73B' \
    > test.out 2>&1
eval_tap $? 90 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE