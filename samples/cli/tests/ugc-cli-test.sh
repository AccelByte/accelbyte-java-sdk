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
    --limit '4' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "PoeOymmb"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'GCrEgkj1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "cNGyFIRU"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '5cytgWSe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'YJ9SpTr3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "McgMqWzy", "fileExtension": "nt3WATBM", "name": "Y3weMNCY", "preview": "1xGjOSGO", "previewMetadata": {"previewContentType": "ydKhO49U", "previewFileExtension": "nNO9SHbV"}, "subType": "p5SYHLkw", "tags": ["fBDs9Osz", "5NBjR2VN", "IuAKAzoy"], "type": "uD5d5cVi"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'afzzAZYJ' \
    --contentId 'MF7xo2IA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "eJvmCap0", "fileExtension": "dkcq36bQ", "name": "oQe4ITnj", "preview": "LjcOxS2N", "previewMetadata": {"previewContentType": "mDjc7cHo", "previewFileExtension": "3QD6vj4u"}, "subType": "ei50tfIw", "tags": ["6jyV2rDa", "vdfKh6Ur", "6UTJujmL"], "type": "KsZa1MYG"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'Jj4uszEI' \
    --namespace "$AB_NAMESPACE" \
    --creator 'botQNgzL' \
    --isofficial 'GiycMvN0' \
    --limit '61' \
    --name 'pfgms0xD' \
    --offset '9' \
    --orderby 'DdTDkCNt' \
    --sortby 'Beuk0JQu' \
    --subtype 'qNOdq5vI' \
    --tags 'nhln3xUC,37hpNtdJ,apwuaxk6' \
    --type '3rhq6cSe' \
    --userId 'jKyZcG5g' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '9JnAootM' \
    --contentId 'ABcz7ZyI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'bbJvBnQl' \
    --isofficial 'phi7gwVi' \
    --limit '34' \
    --name 'I1X6vfbF' \
    --offset '93' \
    --orderby '4bd4JvbM' \
    --sortby 'C59PybeK' \
    --subtype '6m7nFfAM' \
    --tags '5EykPbUq,oQZ0xPEi,vJtV33xc' \
    --type 'YqYNNMPA' \
    --userId 'entrJtoT' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eH1HGcH7' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'qcf2jPw4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'V3qUPm8m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '2okgMfwJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "BQwjggb5", "screenshotId": "CsgzGKFC"}, {"description": "I3iTFjA4", "screenshotId": "dwaILdmo"}, {"description": "Bm82AO9K", "screenshotId": "RXBcDyzI"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'lQbJf52x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "S0v57DmM", "description": "1UuKAc81", "fileExtension": "bmp"}, {"contentType": "nfqXWlbz", "description": "PijpwQgh", "fileExtension": "pjp"}, {"contentType": "lZLmdqWG", "description": "R3h45TXk", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'wbJ9pe7z' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '4GNJJNoK' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["ZRG4EqLc", "A6l2hLjQ", "qm3FyNaR"], "name": "HS7EE3tW"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'mxjb60pL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'aYcUtsoP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["R5sEFKxq", "kC8guuNJ", "mWKyoqwx"], "name": "1palg4Li"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'e2zHHwxd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'r2cZWlks' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "eOuLUqmS"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'mdQ0aoKR' \
    --body '{"tag": "7l4DHaWR"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'hfGgT34i' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["iNbdvlhi", "4YfIL74x", "KEQXwGoQ"], "type": "ocmaawJN"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'CIbLkVhe' \
    --body '{"subtype": ["L9zNBmr1", "NXCkRIq7", "vRhxBb9Y"], "type": "hG8V0GRC"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'oHUTGOuF' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'MMb7LCID' \
    --limit '18' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'JyXOkq9D' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'BEyKZOHr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kCwS2nL9' \
    --body '{"name": "DJuq3C0u"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '6zhJAlKB' \
    --namespace "$AB_NAMESPACE" \
    --userId '1MonVzFZ' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'Q4MHvfii' \
    --contentId 'cwZVoHzl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zp5mSKCR' \
    --body '{"contentType": "ATXDRz11", "fileExtension": "pJFGdcxB", "name": "VEC5pY3G", "preview": "lm5Y12lI", "previewMetadata": {"previewContentType": "CN7tOf4q", "previewFileExtension": "PHHYuCWK"}, "subType": "79YiJK8P", "tags": ["c84Nkb6Z", "PJMF2uo1", "Ajz4bFCe"], "type": "LEk8OzMV"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'QUKmOjbi' \
    --contentId 'mpzGA4VS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'trOHINJr' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'PdxJhAHO' \
    --limit '58' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '6W2z1VHN' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'xcRusw5X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tw73Aj64' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '1OsnoZ9v' \
    --limit '61' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4y325QH' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'Ct85UFlX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hTuuYh9S' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'halG2ChO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvPBMKZM' \
    --body '{"contents": ["4YJwIfYb", "faGTxrP3", "VSVpX4y8"], "name": "O2CeRqt5"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '8VsL8qzv' \
    --namespace "$AB_NAMESPACE" \
    --userId '65yjYUN0' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'p4P7ksLW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTcQpTPh' \
    --limit '98' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDOjY7B0' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'nuZF7gPA' \
    --namespace "$AB_NAMESPACE" \
    --creator 'AVOVxD6M' \
    --isofficial 'nwt5zSWN' \
    --limit '48' \
    --name 'HRcTPp42' \
    --offset '3' \
    --orderby 'RGjgtugq' \
    --sortby 'E7eiGCPY' \
    --subtype 'iIxJxQnk' \
    --tags 'u7h4PIlX,79tSDuTb,VGZSIVyQ' \
    --type 'p7Fb1NBE' \
    --userId '1392zleD' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '3BnllMCh' \
    --isofficial '38h7mvP6' \
    --limit '10' \
    --name 'NSckqIcW' \
    --offset '58' \
    --orderby 'DLOyU2mp' \
    --sortby 'y6yJxYt2' \
    --subtype 'eHIEWhws' \
    --tags 'i2pNNrYY,mmzKHBKr,PcHeN52Q' \
    --type 'QMad59As' \
    --userId 'v1r40WjL' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["AVJhNOkb", "xI7swUQ4", "6IcqY8hy"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '18' \
    --name 'az82crrS' \
    --offset '83' \
    --orderby 'zEIRgdHZ' \
    --sortby 'w0ZupJyz' \
    --subtype 'Ku74HKk6' \
    --tags 'rjwlSPnx,NeqoLSTZ,gcF3gAFI' \
    --type '7PYL0JRE' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BroP0iCl' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'tkv9RX7M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'rxqodUKC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'MtDXpCkd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '5hSl4Wv1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '4' \
    --orderby 'K7A2nmTO' \
    --sortby 'AXTzFfca' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'YpkrbRqT' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'yvd0hIFH' \
    --limit '52' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'HbSAih9V' \
    --body '{"name": "50pfdzB4"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'UoB1KXWT' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'OcNauGxg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qDoegBKx' \
    --body '{"name": "qOwkkSUS"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'XTdywhsJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BOXz3fFw' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '2UflGnLt' \
    --namespace "$AB_NAMESPACE" \
    --userId '6o1yUb7T' \
    --body '{"contentType": "11scMloZ", "fileExtension": "2eXP6xnN", "name": "BMLOfpZv", "preview": "08C51HiT", "previewMetadata": {"previewContentType": "qxUkrdyT", "previewFileExtension": "SLFnu9Nu"}, "subType": "lFQNoIIW", "tags": ["pGMLJ1Ur", "vHr0jaVK", "sLCHiUKy"], "type": "odMQ4bjn"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'QVbCfn40' \
    --contentId 'rkxLr1nW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GklCd1Ud' \
    --body '{"contentType": "zuKoEKLm", "fileExtension": "lzKXK0Db", "name": "gPRyfsfn", "preview": "vCU5orKv", "previewMetadata": {"previewContentType": "oSVyL7GH", "previewFileExtension": "nViUazZr"}, "subType": "Uvl1vMT1", "tags": ["gwlfXwiO", "RNbjAfwL", "Q2kn3ere"], "type": "C5Qjpq6M"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'j2iAMghJ' \
    --contentId 'ymJNNvlm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vm4J7SSz' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'vdzZ8sbH' \
    --limit '67' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'LOQ4jpjL' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'cODvzGWG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJ3E7tEu' \
    --body '{"screenshots": [{"description": "MsSpdTmk", "screenshotId": "ZUOWD40w"}, {"description": "MqQYiZg6", "screenshotId": "gZAE4tQj"}, {"description": "6x2ARZBt", "screenshotId": "4worSmZM"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'ol3er3Lf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ad7OG7Pf' \
    --body '{"screenshots": [{"contentType": "S4o5ll7v", "description": "Xz9XMcrI", "fileExtension": "png"}, {"contentType": "ZP07tLVd", "description": "R1R37PvH", "fileExtension": "jpeg"}, {"contentType": "yNYo7rzS", "description": "wYZeER8Y", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'OHTey8BI' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'KqgKQFaF' \
    --userId 'kX6WvbqK' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'lcSmorxK' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3E0xt4U' \
    --limit '47' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZwdAt9B' \
    --limit '75' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'RuwkN0xs' \
    --limit '51' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'nFUpn2Zz' \
    --body '{"contents": ["P7FFvR7E", "pYYLUw6j", "e93RHH3m"], "name": "oftVxyH3"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'cj0mwvJ5' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'tluNKmKZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AWp8TKV2' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'g0P4PWPf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G1xVAvJQ' \
    --body '{"contents": ["vFPqntys", "WoapNVuR", "zCLsggWf"], "name": "nRsyhZB9"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'VmbTYSl6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CeXrDREr' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'pSrTQJ16' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YNYOTsTz' \
    --limit '94' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cb3KJBFX' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE