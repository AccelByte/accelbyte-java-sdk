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
    --limit '60' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "4TIXWjLm"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'rbRLKmWI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "OcmbjQNm"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'tkunZTo5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'FpGibhYB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "qkRd3tsi", "fileExtension": "fTQWjrbf", "name": "i8dm8Ddy", "preview": "i74E1Uo9", "previewMetadata": {"previewContentType": "o4ETjaog", "previewFileExtension": "dElME4KA"}, "subType": "QPsrBLiq", "tags": ["hlYU8XyI", "BUuGsjqH", "UHxhD0fK"], "type": "fSZIyGBz"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'g2aWTuTQ' \
    --contentId 'rfToiZjv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "k0skb2gp", "fileExtension": "yKSaCpo9", "name": "aqpYL4DE", "preview": "MYv027Oc", "previewMetadata": {"previewContentType": "vQWNAZct", "previewFileExtension": "pbTwwoDD"}, "subType": "5qdnp2Yw", "tags": ["neAXI2A9", "InKZUtBJ", "8dekQH62"], "type": "TkNhJJzd"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'RDrjhWYu' \
    --namespace "$AB_NAMESPACE" \
    --creator 'SajaIpIM' \
    --isofficial 'VWwCdsmM' \
    --limit '97' \
    --name 'Zzdc8qe4' \
    --offset '54' \
    --orderby 'lMr4pHHB' \
    --sortby 'B4fBqDjL' \
    --subtype '2fvVMKCA' \
    --tags 'ATW2ELMr,bmzxNhtT,26vwJTKp' \
    --type '7N5s392y' \
    --userId 'nBkMQYWf' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'GNovQUUg' \
    --contentId 'AKcY3H8O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'oLBVNB7B' \
    --isofficial 'h6292KWI' \
    --limit '36' \
    --name 'AYrgKiAa' \
    --offset '62' \
    --orderby 'TKqTZzoo' \
    --sortby 'jkEMy0WV' \
    --subtype 'D4Hr9iFS' \
    --tags '1PpNCVWr,QG251vFD,fyly3JEg' \
    --type '0FBpOAe0' \
    --userId '9wXlflfW' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Zi06H4mP' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'n9muXMHc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'yJLiIeA0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'm7LjMdMo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "rVcqM0yc", "screenshotId": "6SE5NLn2"}, {"description": "FqDCuJq0", "screenshotId": "xFNoXvpW"}, {"description": "3MIYcgY6", "screenshotId": "RlI5BWoB"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'GvjkHZ61' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "4DcsaSiz", "description": "TBCA2AQi", "fileExtension": "jpeg"}, {"contentType": "0Ly9VytE", "description": "uJrxn58i", "fileExtension": "bmp"}, {"contentType": "caW20AAR", "description": "w06eGFAs", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 't19zwThX' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'qoMHx3hE' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["6rOl0DuA", "MbzimWKE", "y00UXKGE"], "name": "izzMDYxI"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'cjO64WMB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'O1yt22OW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["rQuOUCDU", "K0u6K4fp", "PZraAfot"], "name": "nqD9kpvZ"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'qEq8jr3D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'PYhtzdH4' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "JMretJTH"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'A83xR1y4' \
    --body '{"tag": "XToRO67X"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'hp6kv8Cf' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["omN0ptvo", "RJgnEYBj", "G6pNr8VX"], "type": "OGZYNJ8z"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'mpMUUVuO' \
    --body '{"subtype": ["qLHYI4CY", "tfXTMyfc", "gUS3L0BX"], "type": "jfbb41VI"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'eBwzYNqO' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKVJR8A5' \
    --limit '49' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'RJ68gkIC' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId '4NH37kv6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZvAJnl33' \
    --body '{"name": "F4Ej7Pr0"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'e8iOPnSS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i76F62Ju' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '2Nnhf4vF' \
    --contentId 'OyWe0cNg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'leQrICU7' \
    --body '{"contentType": "GdkAGY4c", "fileExtension": "ytoBeEqY", "name": "HSnzLxUP", "preview": "7sWLkxWN", "previewMetadata": {"previewContentType": "ZvUaPq9H", "previewFileExtension": "6QMSlZxQ"}, "subType": "FLUhGFhc", "tags": ["AsgK4TxP", "Lp7Fvz4u", "20HTN9uV"], "type": "63QUghIg"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'GIaHK7xu' \
    --contentId 'Gw5b8i8Z' \
    --namespace "$AB_NAMESPACE" \
    --userId '0VGV5efk' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKlLdRXn' \
    --limit '51' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '9BV49PkI' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'BnTkxDMj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUi8El2s' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'roi6od1C' \
    --limit '1' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'IKDOADu8' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'PvSiIWHk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qZWbMfh6' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'yMK1Zmx8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jaXYnUOf' \
    --body '{"contents": ["bFKEBaIT", "oxmB0btV", "dwpqWI1F"], "name": "scba8dkc"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'Na92F5ww' \
    --namespace "$AB_NAMESPACE" \
    --userId '3JlteuNr' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'ab7hv5oP' \
    --namespace "$AB_NAMESPACE" \
    --userId '2jd9s4QK' \
    --limit '85' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'aP9zgnsC' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'K6JZE5rS' \
    --namespace "$AB_NAMESPACE" \
    --creator 'N8iGU3KG' \
    --isofficial '3h0dA7jq' \
    --limit '90' \
    --name '25NU2Nm3' \
    --offset '51' \
    --orderby 'hJNaSpdo' \
    --sortby 'XZFMjIrg' \
    --subtype 'HokrILDc' \
    --tags 'IMN6j7bo,ODQoTdqc,quSWWi5Q' \
    --type 'EdwCTqAN' \
    --userId 'kRjboZOK' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'dJfvLlOy' \
    --isofficial 'fdrzK6Eh' \
    --limit '69' \
    --name 'jC1dGiah' \
    --offset '28' \
    --orderby 'ERahb28F' \
    --sortby 'RzxsYS1M' \
    --subtype 'uZdWZ3Zi' \
    --tags 'AhWnV0gF,aVxP2mFy,jK1RffIu' \
    --type 'Cjc6Oql8' \
    --userId 'mq8erbGZ' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["SZNAsxDR", "6pibLAIm", "nq3CmpJq"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '56' \
    --name 'u0Op14B1' \
    --offset '47' \
    --orderby '0DWda19V' \
    --sortby 'RPklkGqc' \
    --subtype 'Ci9nRoXD' \
    --tags 'vgR7pzaI,c7i9QR3N,s2L1rwV6' \
    --type '5C2Jc3hL' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'bQwFAPNb' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'XoiC6rxc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'kk83mWA5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '1EbsVCVN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'qbT7eTXU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '86' \
    --orderby 'WHqFEYwH' \
    --sortby 'ExfTTbza' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'LmZi6Owr' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mz22IIOK' \
    --limit '51' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'IqdB7Jar' \
    --body '{"name": "CGTo9VCQ"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJYWNTvt' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'BIllePxN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQMREsFS' \
    --body '{"name": "cXUp8Flh"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'h0jO6JtU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wggvucbz' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'iMXTy1Ix' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qNb09w9C' \
    --body '{"contentType": "anFEOMoR", "fileExtension": "buYXGeV4", "name": "50gt3ZlQ", "preview": "bd0gIq3n", "previewMetadata": {"previewContentType": "WhVayHb8", "previewFileExtension": "AIz0pvm7"}, "subType": "AKsopKYP", "tags": ["S0idLU6T", "ujgjk6hL", "bF0tEhb3"], "type": "2hJc2MAa"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'peVgUFlK' \
    --contentId 'fMwU3Gs7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eCFbpdpV' \
    --body '{"contentType": "z5frlHg7", "fileExtension": "Ta9vSgqI", "name": "ucWr1d3p", "preview": "kq6k28Aw", "previewMetadata": {"previewContentType": "vZqLCsUk", "previewFileExtension": "M2TQwQSA"}, "subType": "oFejuwaw", "tags": ["tP0lgKEY", "B6BsLCB1", "4Zpa4kV9"], "type": "qD6Dt9ak"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'Aq711oW2' \
    --contentId 'KbvAyHQf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gq1xCNiF' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'JiPAk5aE' \
    --limit '50' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'nymgfFoP' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '1L5FOkYv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dYUBmOJC' \
    --body '{"screenshots": [{"description": "eakHVUYF", "screenshotId": "hwccCHOZ"}, {"description": "pQA44EHa", "screenshotId": "yscNSSXh"}, {"description": "lHUufgCS", "screenshotId": "ZIQeBJb0"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'RHGBEubx' \
    --namespace "$AB_NAMESPACE" \
    --userId '1fJQSGkW' \
    --body '{"screenshots": [{"contentType": "95DQhWDa", "description": "H0mmPdb1", "fileExtension": "png"}, {"contentType": "zYFD7HfF", "description": "IHr8pqPp", "fileExtension": "bmp"}, {"contentType": "A9ryAcOr", "description": "akysXQEp", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '9ecaV1jy' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'rnCgVPQR' \
    --userId 'uihBSfIt' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '8JwA8V3Z' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'HbbFsQtv' \
    --limit '50' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'iJO50Nec' \
    --limit '76' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'izj3GhaH' \
    --limit '52' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ShIK62xO' \
    --body '{"contents": ["9OGqMFv6", "th9tZXav", "1eODBVH5"], "name": "lqV5xEkY"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'A0Zu8TNw' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'oamKvhXS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ubz8tpaF' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'td17REwz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yUEsispg' \
    --body '{"contents": ["Hm0hFuUs", "6G9mzklG", "fyYYRrr4"], "name": "NG0ipgT5"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'bthGVDQ0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VW5bLcFk' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'Q7DkOqgY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NENVA2XO' \
    --limit '35' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xsm56NLe' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE