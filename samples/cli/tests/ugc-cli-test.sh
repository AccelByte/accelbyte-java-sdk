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
    --limit '5' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Iwk24Bki"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'uvtTbuh4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "z0CQOxly"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'TCHvKGXj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'KR7KB0ny' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "NUJFfLik", "fileExtension": "CZKwi860", "name": "28kO0lrh", "preview": "Rg3Ptuap", "previewMetadata": {"previewContentType": "8tnFbDgr", "previewFileExtension": "iUyXTSyQ"}, "subType": "F5CHAa9q", "tags": ["Sx3lms2R", "JarLvvwK", "tpDO2s2X"], "type": "8KclwuNZ"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'cx5wbt39' \
    --contentId '8Epiwy1Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vhoMnJiF", "fileExtension": "EDtfFCW3", "name": "sJGv1EEy", "preview": "SDhtgQRs", "previewMetadata": {"previewContentType": "A3BrgEJu", "previewFileExtension": "FQXJODTp"}, "subType": "sjr0C2iY", "tags": ["F4K5kkv8", "2ZEf4o19", "m35qgt3h"], "type": "iXfaU2uY"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId '1FNisWnD' \
    --namespace "$AB_NAMESPACE" \
    --creator 'bq64Jnw9' \
    --isofficial 'e9SOxifn' \
    --limit '0' \
    --name 'qivNPORp' \
    --offset '60' \
    --orderby 'uuVBLIT8' \
    --sortby 'CSVmeGso' \
    --subtype 'Rw7Ib7rZ' \
    --tags '8HHodwBB,GiSH1e0b,tVsS9cRg' \
    --type '4EuKs0j6' \
    --userId 'HzgR36MN' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'jht6cLg8' \
    --contentId 'cEhlZyVO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'hFJAnTBL' \
    --isofficial 'UaD0R9LE' \
    --limit '85' \
    --name 'alLy1Ud7' \
    --offset '23' \
    --orderby 'LAl6tcFf' \
    --sortby 'WYz3nA7R' \
    --subtype 'n90sdbrJ' \
    --tags 'SkWSyfl2,BhGSyQOb,xTt9UWTi' \
    --type '28BdgcKM' \
    --userId 'XmoUcye4' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'dIsDqtvZ' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '1yZyBTUF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'bC0kuC67' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '14Z5eDw3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "0NHqU7sY", "screenshotId": "tIvGBoyU"}, {"description": "2Ls6gsxP", "screenshotId": "tYWhewRX"}, {"description": "W5GZlec5", "screenshotId": "7zWefLnl"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'T7W0Niqd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Zikq4h6l", "description": "X99U19jr", "fileExtension": "pjp"}, {"contentType": "XA34n45x", "description": "xRD6R5p2", "fileExtension": "jpeg"}, {"contentType": "n9ZKQMW9", "description": "W5exuVLP", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'MHnfOEMP' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'zKW81aid' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["FYDP0e80", "Bfqi0EaW", "RjQb4NIL"], "name": "2JIQFiMc"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '7OLVx3vo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'd9B1l8DE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["roOqCrFn", "xpnsNEgG", "f0NtZM7T"], "name": "UtA5cy1E"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'EXjtNIrX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '8tPn43UP' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "TmnYTOqm"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'BmoKdcQ4' \
    --body '{"tag": "EsfbYBiO"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '57Bq5Nmr' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["iWPmnEfW", "7zAOeden", "3Er2vHUQ"], "type": "f2EWRh4V"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '98YF4PTI' \
    --body '{"subtype": ["YUudI1fo", "v51PMMzW", "mMajwIck"], "type": "Yk3Sn3ta"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Z614qwA6' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'gjuGXlJc' \
    --limit '99' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2UQa2Xa' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'n7yAgGwD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bb5OSK6O' \
    --body '{"name": "fG49dJl9"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'VTGisZrV' \
    --namespace "$AB_NAMESPACE" \
    --userId '7T0GO3i9' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'h3XIgltz' \
    --contentId 'kXjaw4E3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EiAxnzKm' \
    --body '{"contentType": "AAAnRQeR", "fileExtension": "FWL4tWRc", "name": "UBiWAvP4", "preview": "EUIcyFcn", "previewMetadata": {"previewContentType": "dccM3z6G", "previewFileExtension": "MeSETfWe"}, "subType": "RUYRQDIR", "tags": ["YNEfHpBh", "NNzvWgwA", "K6l5Z9wL"], "type": "NcNTr1nb"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'ypp44tCh' \
    --contentId 'qP6cay55' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgELOsvu' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '8Ak2ay9I' \
    --limit '80' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'd4ptLdmJ' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '4jSPxoU8' \
    --namespace "$AB_NAMESPACE" \
    --userId '1jCAnBpa' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'T5nMItqr' \
    --limit '2' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z5TAIOoQ' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'WCO7GKcg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v1LoqXSH' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'O74KKi9U' \
    --namespace "$AB_NAMESPACE" \
    --userId '76G8w30E' \
    --body '{"contents": ["pyL3LW2O", "3nRp5ltz", "PvSlWwjY"], "name": "NmdAQOLA"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'RRapKIuw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U5z04Df6' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'kC1kCnFp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQCPXo2H' \
    --limit '46' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'N68CxGF2' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'QbYx0ZWi' \
    --namespace "$AB_NAMESPACE" \
    --creator 'DHF4sVZ8' \
    --isofficial 'wGYf3LYB' \
    --limit '84' \
    --name 'm7Ua8zx0' \
    --offset '44' \
    --orderby 'lFvDJHww' \
    --sortby 'hev9c80w' \
    --subtype 'SzNk4iUP' \
    --tags 'CcyScXip,HanWA4TX,bx1wjkMW' \
    --type '2gI9Tv39' \
    --userId 'yqo2KTZl' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'c8YfYvcj' \
    --isofficial '5qfsp7wo' \
    --limit '84' \
    --name 'hkmM5MgY' \
    --offset '27' \
    --orderby 'TPGYI4gx' \
    --sortby 'Jx1ECDjw' \
    --subtype 'ZNfM5bN4' \
    --tags 'lfSgj0tU,qIczGyJ3,f0tCPu9t' \
    --type 'Eh2dkEnh' \
    --userId '0m0MMMFJ' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["SZnnVH6Y", "9fT81T25", "0hoqxdQe"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '61' \
    --name '2BItWie3' \
    --offset '54' \
    --orderby 'YzfNXLLx' \
    --sortby 'pc0nE0tu' \
    --subtype '15ui6ruh' \
    --tags 'tuPj1sx9,qlj3R13g,Ei5GYKIt' \
    --type 'ypSjcjIa' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '7BzWvWGU' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'fgjOEVv8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '03AT5Ky9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 't1aMRrWU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'KJkUpOJG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '41' \
    --orderby '0dxoZXKa' \
    --sortby 'QzdvxW09' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'edMImnuG' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'koMM4gqZ' \
    --limit '43' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'lCy6k8hq' \
    --body '{"name": "E4JgBI3V"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'aXbVEdyn' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'Z9zJkRqs' \
    --namespace "$AB_NAMESPACE" \
    --userId 't5rpCXdD' \
    --body '{"name": "jcG7auVw"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '71wSjZIK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CrLsbRtK' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '5x4iC4jK' \
    --namespace "$AB_NAMESPACE" \
    --userId '0ic7Z3KJ' \
    --body '{"contentType": "pPa0prnI", "fileExtension": "ynPO828L", "name": "1VxULhDz", "preview": "qDH0psDE", "previewMetadata": {"previewContentType": "S2BKaCO1", "previewFileExtension": "H8XCcdz4"}, "subType": "6zE2oHgD", "tags": ["DEBQLzGe", "AQD2f1RG", "M0EWdvXP"], "type": "gvHopoN9"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '4hhEzWDA' \
    --contentId 'ZnhbLeVp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e68qlmv1' \
    --body '{"contentType": "fhU6Oq8I", "fileExtension": "cLHOKrkD", "name": "P5jEtJZQ", "preview": "pyGVS0JR", "previewMetadata": {"previewContentType": "8FAbvLMG", "previewFileExtension": "IwLisWSW"}, "subType": "3blAAlgT", "tags": ["PiWd24SQ", "4WD7lpN2", "XKlhCUI7"], "type": "gfwObS0z"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'ZxfX1WXN' \
    --contentId 'iK5sPF8e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tCaf4rTj' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'amQueIDc' \
    --limit '37' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'BnVtToTE' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'y9wWRitt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GS4ji4uS' \
    --body '{"screenshots": [{"description": "QP8j4Wh8", "screenshotId": "KuUzFAAx"}, {"description": "a8NuE42Z", "screenshotId": "wX4529Eb"}, {"description": "Hb4P0kf8", "screenshotId": "KUi7tbkD"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'LX8QBeq7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSYtE0SJ' \
    --body '{"screenshots": [{"contentType": "aYtlElUf", "description": "DfyiOMZ2", "fileExtension": "pjp"}, {"contentType": "cHcWQu1f", "description": "4XCEeUOC", "fileExtension": "jpeg"}, {"contentType": "s849Oz3H", "description": "3rlG6roN", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'mkfEMxJ8' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'E2mYC0sm' \
    --userId 'p6mnLz9x' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'SDgHAjwO' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUoy5vKQ' \
    --limit '61' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'DKC0crHz' \
    --limit '49' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'qyLFXQ8M' \
    --limit '11' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'IM7ZP7e1' \
    --body '{"contents": ["Vrfc3qmp", "v2bIzNqJ", "XGzexNZy"], "name": "2VHUp1PY"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'BMMrgEnh' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'niIejoT8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PyltihV7' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '0NEJlC9H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RqPgNorr' \
    --body '{"contents": ["EooZR660", "cCJucqDa", "qr0uwqEF"], "name": "HA72C3DY"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'TVY3Zhxe' \
    --namespace "$AB_NAMESPACE" \
    --userId '15WnCGOn' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'ZAVwZoC8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zTsmazAL' \
    --limit '91' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'JeFA0Vhc' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE