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
    --limit '44' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "e33faj8q"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'hjEx9nOc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "PbdxdAjn"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '8XeJY1si' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'p4r0iBCs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "QHrqniB4", "fileExtension": "KJ8GpOGD", "name": "jrXhhnaK", "preview": "vr6T5fkU", "previewMetadata": {"previewContentType": "nXGL3udv", "previewFileExtension": "JQg0dm7d"}, "subType": "2tmahNFI", "tags": ["m9i7JcM9", "f5pRRNrJ", "DyrYox3O"], "type": "LsBBcT2q"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'v0HVxBwX' \
    --contentId 'AOH4tZbX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2oUKA5Aa", "fileExtension": "cNG5JGPz", "name": "YERilLXb", "preview": "2pVq1Zpu", "previewMetadata": {"previewContentType": "ywg3fkKb", "previewFileExtension": "dsZJYAqZ"}, "subType": "sFY2OLeD", "tags": ["Dfvh9JAH", "eMSC6E5t", "9SXhODbj"], "type": "30wRhSbC"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'ZdqNOeI9' \
    --namespace "$AB_NAMESPACE" \
    --creator 'USmM63jN' \
    --isofficial 'bAbpJnaJ' \
    --limit '50' \
    --name 'wxeZ97fe' \
    --offset '91' \
    --orderby '9Bi5Tf8Q' \
    --sortby 'p32Ip08H' \
    --subtype 'yXA4qTF7' \
    --tags 'GNScSDcM,KHMuM7Xg,GfCtDKpE' \
    --type 'i9LNCswl' \
    --userId 'Fjae6aTe' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'oVMDrqyx' \
    --contentId 'WsRZluZI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'BjlKma3K' \
    --isofficial 'QpU6tGEa' \
    --limit '43' \
    --name 'slHzDhZM' \
    --offset '70' \
    --orderby 'OBbDCIGn' \
    --sortby 'l0rNtMTq' \
    --subtype 'b3DQDUqK' \
    --tags 'eAXc2loo,b93dFDLg,GHpFyd1m' \
    --type 'r7aBo8A2' \
    --userId 'GQVYJgly' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'wlFoKmxj' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'DRdlSdHv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'yQ861MoY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'CQmtzVN6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "6XyKWNM7", "screenshotId": "qfvsjo2B"}, {"description": "hHDmKI1m", "screenshotId": "RpI63kcD"}, {"description": "3IrPRJNW", "screenshotId": "8ClCgyuC"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'ToWPCaoD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "ZuSq8ruA", "description": "ImU0YEMC", "fileExtension": "bmp"}, {"contentType": "WsDGkAVY", "description": "B5QpsIJm", "fileExtension": "jfif"}, {"contentType": "KBk9iAWW", "description": "Xc6fhIdb", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'dSE93bQe' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'yjFLpOKv' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["EIY7kyHP", "duFMTBO8", "Y8pwVWtU"], "name": "F2l03Of8"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'A5nu0lGy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'iCZjE0TP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["XXMFnn7w", "S4oEFPo4", "tFDWdZDO"], "name": "16trdQ7P"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '9Dx7A3MG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '1zFqR0B6' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "iFhWmbWe"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'veiTFqjv' \
    --body '{"tag": "3sEuQWCz"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'NpbLn1wZ' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["vFb6XUoU", "MiJipH1Z", "t6XPFr1b"], "type": "wc6SOHG0"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'tMmCG9Ik' \
    --body '{"subtype": ["S3ddQPvO", "jwJbqQQT", "IaInh6KX"], "type": "oaXQIVto"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '2zJxHNmV' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7BvpnYu' \
    --limit '15' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'enKIkSml' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'Ouw9ZxyT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zpu7R9kG' \
    --body '{"name": "LuefbyOs"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'p0WhLKQm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZukMphDx' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '6hs8uXfv' \
    --contentId 'V80H5kd3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHNDFaeW' \
    --body '{"contentType": "VTUmqHvW", "fileExtension": "s4yeqLcX", "name": "sePBaieB", "preview": "9jmvH9wP", "previewMetadata": {"previewContentType": "PD6NZ9yY", "previewFileExtension": "odpPiLq3"}, "subType": "9OU9mqmX", "tags": ["QkiVTdd5", "Re5ulr16", "7IYn01V8"], "type": "ams8JJsN"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'Rh0qkD5p' \
    --contentId 'RRpfUhYj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9pDDeNM' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZW0eT3DG' \
    --limit '1' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'aU2nunHD' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'L1gOj6J8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xj2YLN6R' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'CAX8YSSD' \
    --limit '99' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'fqm5rlTz' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'QT2X5DlR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MoBcxNqG' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'ymHvjRD2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJ3BXgnP' \
    --body '{"contents": ["gE0IX8xp", "6NOO1NW8", "fzv19ICv"], "name": "G2zaCAkV"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'rbUhcfo8' \
    --namespace "$AB_NAMESPACE" \
    --userId '3Tj3fuLb' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'hON9VsaB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vSglo3EF' \
    --limit '25' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'zMBuHXRr' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'M3HrF2aj' \
    --namespace "$AB_NAMESPACE" \
    --creator 'gd61DGSw' \
    --isofficial '3qHTs9sc' \
    --limit '0' \
    --name 'Sqk8uH5d' \
    --offset '66' \
    --orderby 'l0XXyYD0' \
    --sortby 'CcvSF5He' \
    --subtype '11SVzbJY' \
    --tags 'eDbrJh3J,gFe5Ei0v,2MBy2XmG' \
    --type 'GTTFeHGN' \
    --userId 'YXIznMIF' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'pBk7XZaJ' \
    --isofficial 'LfhbHcLf' \
    --limit '86' \
    --name 'GFosNW3x' \
    --offset '96' \
    --orderby 'KRdyEVfZ' \
    --sortby 'UqgGvQlA' \
    --subtype '5rxqSeFN' \
    --tags '0iGbetzY,Riz5rXFe,0qWNb3Cj' \
    --type 'WuLQkfGR' \
    --userId 'NCBBWKng' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["8gUE8ZT9", "0WEyHEyj", "5UmYwPeO"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '94' \
    --name '76zrEhoE' \
    --offset '69' \
    --orderby '9k6u0c7E' \
    --sortby 'dUdNghOg' \
    --subtype 'tvtfhn9F' \
    --tags 'gfTdkKMU,gpkRb1hk,dPI2RyJ4' \
    --type 'wPdpzNeb' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '6jnIUE9V' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'NWLTQSoE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'dheh82aZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'M8X1JqBn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'AMkfJVG8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '62' \
    --orderby 'qulHSZG7' \
    --sortby 'Z6nPAd97' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'V8mrvdxn' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'eRKjdOiF' \
    --limit '94' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'kn3ga7EN' \
    --body '{"name": "StfUkEyk"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'GF9lz6Az' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'm9j4NZFB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ly2y3KAW' \
    --body '{"name": "ina05hZE"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'urOoxrLF' \
    --namespace "$AB_NAMESPACE" \
    --userId '9g4jqATZ' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'YDPGv8J4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pm8yhNPE' \
    --body '{"contentType": "jNaexuQT", "fileExtension": "vRLq70E1", "name": "ywOrJeiS", "preview": "lmtOmWyw", "previewMetadata": {"previewContentType": "egQwqX3j", "previewFileExtension": "lclfxl7D"}, "subType": "uGZaSkvz", "tags": ["HsEHVT2T", "7Hlj8WVW", "g2AredMf"], "type": "ze0Bwt7l"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'JGJDqDUP' \
    --contentId 'BWV2I38i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kOPTb2si' \
    --body '{"contentType": "13ItqV81", "fileExtension": "4kwBesg7", "name": "LBkMWwWN", "preview": "CrAJVOka", "previewMetadata": {"previewContentType": "Mjpx9M8e", "previewFileExtension": "z4JDjySC"}, "subType": "OhDMYzzJ", "tags": ["4MGdcEmq", "4G2tSHXB", "EqFBtv2F"], "type": "8VH31ukY"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'ZTUDCi8p' \
    --contentId 'A7URWks3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZEckM9Rl' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'FYC8fT2j' \
    --limit '98' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '7ZENienx' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '3LGe1b7h' \
    --namespace "$AB_NAMESPACE" \
    --userId '9TB5FPX8' \
    --body '{"screenshots": [{"description": "MUHIiQfN", "screenshotId": "MPDjH0xX"}, {"description": "XyUhBi9s", "screenshotId": "rB6ZvA5l"}, {"description": "ZD8VadEC", "screenshotId": "surTV1B3"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'nTlnGq62' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A7Fb1Wbg' \
    --body '{"screenshots": [{"contentType": "8KppAkBM", "description": "YsAQzzHA", "fileExtension": "png"}, {"contentType": "mQhypIQq", "description": "jLX8nzow", "fileExtension": "bmp"}, {"contentType": "BmZhwfAx", "description": "EsUvCFKt", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'PhdstNJn' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'xqtoGhAM' \
    --userId 'c6mNFHRl' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '9LzPbPEu' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsR8zlo8' \
    --limit '85' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'PzxR3Iz7' \
    --limit '14' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNI2lX9W' \
    --limit '88' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'CXYe8J3Z' \
    --body '{"contents": ["9pdRZL7f", "BrpT38W4", "r1ABpj3S"], "name": "9yfy95En"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '0UlwJchv' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'FkVdqEej' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PmgnIHvo' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'pyXpZh0Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3K6PcJE' \
    --body '{"contents": ["qYeSMdyB", "izD9EwhL", "iiV6OUcw"], "name": "0HdXfiUG"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'MtFt6qpd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SrEQ6aWA' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'CNYSEhPa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O7lfGxjj' \
    --limit '65' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWiHTLTQ' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE