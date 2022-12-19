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
    --limit '30' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8pnhdwoQ"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'Ux3Y2jV4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "McmcVS1P"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'tx3iJcqX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '9euqUVqw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "1hulxawv", "fileExtension": "frrQoQmY", "name": "TElx3Am6", "preview": "thIjHVeq", "previewMetadata": {"previewContentType": "Ze9aLaUW", "previewFileExtension": "4NvSz1G2"}, "subType": "Mg8fEpLH", "tags": ["xzGmhHgl", "s37jjstg", "BAqYj0xM"], "type": "HCRcyaji"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'IAehYUWc' \
    --contentId '4eA2CbzV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "zDiYqx1J", "fileExtension": "JyeGyYVa", "name": "7kztExus", "preview": "fQSEcQFo", "previewMetadata": {"previewContentType": "dkOSqHbo", "previewFileExtension": "MMjCn2kD"}, "subType": "HqRlGlec", "tags": ["WLPrkUJJ", "gopyuVST", "NG4Kbgyv"], "type": "efNcL8k1"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'e1IFKJCi' \
    --namespace "$AB_NAMESPACE" \
    --creator '6Jd4pQT7' \
    --isofficial 'eSaI1vdi' \
    --limit '68' \
    --name '2jSAHTRh' \
    --offset '80' \
    --orderby '8yE7kQYM' \
    --sortby 'U5m52IcZ' \
    --subtype 'MrSZRkZh' \
    --tags 'mKN2WevW,IIns7SZS,0GsSnoGw' \
    --type 'ORsPqcxT' \
    --userId 'I7dEEEoc' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'H15n1V00' \
    --contentId 'NY0cvAmX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'dKyIczmu' \
    --isofficial 'L6wi87pi' \
    --limit '37' \
    --name 'uJm9poNf' \
    --offset '76' \
    --orderby '1BUIHbBf' \
    --sortby 'SCq6G0i1' \
    --subtype 'M9htrOV5' \
    --tags 'iGYIGopH,Fp9eMwcp,2rHwiNkg' \
    --type 's68fRMHa' \
    --userId '1PU7dobF' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'p7BYXF3y' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'HVyJPCwT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'BwXJW5R1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'jcfCFj3U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "2MRAlBNh", "screenshotId": "zKFk5m8z"}, {"description": "OZkKSUiT", "screenshotId": "DcNm2nJY"}, {"description": "C2UYbd3t", "screenshotId": "vxnnv2Tj"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '2cybcdG2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "DUFovgkj", "description": "N8fcmlp7", "fileExtension": "bmp"}, {"contentType": "LdTaXbuh", "description": "DSZU4CaC", "fileExtension": "jpeg"}, {"contentType": "yySHvsbO", "description": "9UhGp9fR", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'ab4lUOf1' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'ZHgGolg8' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["M1S8HARS", "6bjjyEv9", "5vviSfOp"], "name": "lclHQJaS"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'yXBZOnXG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'RNtZzvHJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["g9qZerCc", "LncErL4e", "mUW4BbiV"], "name": "5xuvFzrr"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'qyUyXSN1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'nv5P6E76' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "kOzd0Fwk"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'OBG3gesf' \
    --body '{"tag": "DwR32F2S"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'liqcBgd8' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["bcoLyPj3", "ahNcI7Se", "kkVHfvBv"], "type": "xshwl6Ns"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'jedNeBDL' \
    --body '{"subtype": ["ehoZZXBm", "uBLz0i69", "W0rXdOmw"], "type": "8HUl5psp"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'fIVWtl43' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'hH1BKC8F' \
    --limit '17' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'lTEgxv10' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'FXUnjAQP' \
    --namespace "$AB_NAMESPACE" \
    --userId '1f3OaL6y' \
    --body '{"name": "ELi7FFiv"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'OPL051fx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CinO24BH' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '1EpQX7n8' \
    --contentId 'puAM7pmF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWXgYyDj' \
    --body '{"contentType": "vHcy5qu2", "fileExtension": "TGdvhr4d", "name": "cB9hY8AD", "preview": "6Dq6zBPJ", "previewMetadata": {"previewContentType": "KB0ti1LS", "previewFileExtension": "zVb0By6P"}, "subType": "ePKmGcZm", "tags": ["TMZlHeAD", "ZKtHocar", "pAvE9WAh"], "type": "d907QhPi"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '8jJlLHbm' \
    --contentId 'RiEGI5Ho' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Skl7Mu1D' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'XLLBNe6o' \
    --limit '6' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '3RnGxXDM' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'ld8aDjSg' \
    --namespace "$AB_NAMESPACE" \
    --userId '6r1hXu2o' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'TuBsDjY8' \
    --limit '54' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'GAJLxlw4' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'NuDorqjV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EyqM0S3U' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'Sl3g7SWF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'biI6x33T' \
    --body '{"contents": ["2JNjdX2l", "VKNlHadD", "kVrJCOP6"], "name": "2P1KnoRV"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'Ry9u7ntO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FY14DHWs' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'g0u9LVLS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ojKgy5eE' \
    --limit '39' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '80wlL4GG' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId '9NOFb0FF' \
    --namespace "$AB_NAMESPACE" \
    --creator 'K797pCbW' \
    --isofficial '65MdonKU' \
    --limit '7' \
    --name 'Qd3ZPkRN' \
    --offset '90' \
    --orderby 'YTY7k4ZU' \
    --sortby 't7yTNhik' \
    --subtype 'H9dchPxQ' \
    --tags 'cA7Jg3Xx,HPHLi20Z,alk5oPOA' \
    --type 'IhufsMg8' \
    --userId 'fa0c1IwN' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '7lJb0Z2r' \
    --isofficial 'FmSF50Zq' \
    --limit '21' \
    --name 'WWf0EEw5' \
    --offset '100' \
    --orderby 'JlFrRqFB' \
    --sortby 'dNPHRrGF' \
    --subtype 'YMz9rQ00' \
    --tags '65giruV3,AtLARyXH,UXE6z7ow' \
    --type '6fB0jqxP' \
    --userId 'pN8yJnGz' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["hkxaTYjZ", "9t8sGEyZ", "TFJkFMPG"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '11' \
    --name 'cSm5rhBf' \
    --offset '27' \
    --orderby 'QiwLQGyX' \
    --sortby '1SH3ZXIE' \
    --subtype 'az1Rp5sL' \
    --tags 'qh7fAZsN,TJbCXsod,S5f5k9DN' \
    --type 'QlY2pH9G' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'PPOSCAeS' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ipiFZ8B1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'YNDaJCL0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'OaInIQ7U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'aCGMdBgt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '68' \
    --orderby 'e0CjFYWY' \
    --sortby 'nZtTxISu' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'P6gOWBBa' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjmQuG6t' \
    --limit '38' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ew73Hq5M' \
    --body '{"name": "xZfiuaHO"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'O6sDmzjt' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'Fk7vg76x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmQvspvD' \
    --body '{"name": "xFBZ5dJZ"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'gs7zYELh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FoX4eFHX' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'A9iTb0kW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lu1I4HNt' \
    --body '{"contentType": "1LORmulC", "fileExtension": "iwMJ1emN", "name": "b8wBQVvN", "preview": "3XwXbEfo", "previewMetadata": {"previewContentType": "4Nfx1VUn", "previewFileExtension": "fpNyj7iw"}, "subType": "7r9xjILT", "tags": ["0YYPiATq", "NZKD76Qe", "NLkVLEgp"], "type": "nWvmy6Gx"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'Qg30FBGg' \
    --contentId 'ZG2Q7lvw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhnJ59na' \
    --body '{"contentType": "hLHe6qPT", "fileExtension": "MH80MNbo", "name": "psAZRiRv", "preview": "ypL8V8Ef", "previewMetadata": {"previewContentType": "XNlwwhJu", "previewFileExtension": "NmOclY12"}, "subType": "qxITqrNh", "tags": ["IQmDOYZp", "q08ozwmk", "yYWoVbay"], "type": "wgWsrKTK"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'BEjlI8cX' \
    --contentId 'zlGdiXDk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'INBoTdou' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUQE9QTQ' \
    --limit '88' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'jKn6aMxl' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'eTEwKXgI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GRbolJPv' \
    --body '{"screenshots": [{"description": "aEKF9jzs", "screenshotId": "SQjkonFu"}, {"description": "JFPwneyf", "screenshotId": "REdao2FW"}, {"description": "XF9naKoI", "screenshotId": "7KRVlP7B"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'uR3GlXjr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wLnTnlPu' \
    --body '{"screenshots": [{"contentType": "FN6Obrem", "description": "X31rIr0Y", "fileExtension": "pjp"}, {"contentType": "HTTldVkR", "description": "mVWTMa2C", "fileExtension": "jfif"}, {"contentType": "YbWDJyzN", "description": "RL35DnSJ", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'isvwJrFe' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'yNlIVHNH' \
    --userId '2OwktFGI' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ExAzeW5v' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'mptB4WM9' \
    --limit '99' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'nccxTuog' \
    --limit '75' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '9OqErbrM' \
    --limit '41' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'xjCAKdvb' \
    --body '{"contents": ["JbE1A8cz", "Nldiy7bz", "Z6u5a6jg"], "name": "Tk4m4yyO"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'HSEpaHLC' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'Go1hyUMK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ovgp4WRp' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'kavczSjo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HIpnZabr' \
    --body '{"contents": ["Z4sXfRPW", "6pzO0CJ2", "B9306QRQ"], "name": "bH6gdMI0"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'UQxVFDzQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '1uwfINAm' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'HsXHPU6u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'izE9J7m6' \
    --limit '51' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'LG8A89vk' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE