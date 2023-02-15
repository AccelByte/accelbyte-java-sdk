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
echo "1..92"

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
    --limit '37' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tv5jtt0d"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'FXOLHn6o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "4XiggsZa"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'dqN9BIER' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'y71IfrYc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "EglMLxJn", "customAttributes": {"Zqd5Wk30": {}, "1LWkSav8": {}, "6c7K2G1P": {}}, "fileExtension": "42XW4zQs", "name": "MO1HIrPq", "preview": "0Cm2KSC3", "previewMetadata": {"previewContentType": "OsYkc2bs", "previewFileExtension": "veMhQDWk"}, "subType": "opOP0bYy", "tags": ["dYgW2CuF", "e0mseXtu", "Z80bQ5Ua"], "type": "oddTI8vE"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'NjJ9pAHB' \
    --contentId 'p1Z4op6Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "sJNDVMZl", "customAttributes": {"0jK4nHNf": {}, "bhEHwuPy": {}, "5tHH8MbP": {}}, "fileExtension": "wiZ6OGez", "name": "R8q9NC32", "payload": "MXwu6TSp", "preview": "LUvUydKk", "previewMetadata": {"previewContentType": "d3JU4iVr", "previewFileExtension": "yywa3W7G"}, "subType": "sbcnpIX1", "tags": ["s0osHne0", "tHRq8Nsa", "HV2uvJ03"], "type": "Suz9XfzT", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'knJ9VXgn' \
    --namespace "$AB_NAMESPACE" \
    --creator 'ChA79YJ8' \
    --isofficial 'JRBTaawQ' \
    --limit '18' \
    --name '2B5yOZFr' \
    --offset '99' \
    --orderby 'qFJLpm6y' \
    --sortby 'MISXo3qD' \
    --subtype 'MzlCp4Y1' \
    --tags 'h77vaPDp,ZWr48GS6,eEX9m5uI' \
    --type 'djMH7xcW' \
    --userId 'A0RUpZyI' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'djVG1SPX' \
    --contentId 'oMzH3lGj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["YnpJ7DPB", "vsKjqsHM", "WJilzn9N"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '4K3vn26w' \
    --isofficial 'OuuMUFgS' \
    --limit '59' \
    --name 'q4TYFVGW' \
    --offset '41' \
    --orderby 'a5OmHKwF' \
    --sortby 'DaDpopMY' \
    --subtype 'XXVP5DGo' \
    --tags 'vrNUSAgG,om49kbw2,oHHc6uxe' \
    --type 'DeMu2w9S' \
    --userId '7ntd19zq' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'B77sVmBI' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'rTWqSa2b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'amoJRPsS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'yjcl5vHf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "WgvxmAQx", "screenshotId": "z1Bw9cl8"}, {"description": "v9PODICv", "screenshotId": "3jPXaTsM"}, {"description": "A5IYqntw", "screenshotId": "nlSqEHeV"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'Ka1fAx5u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "0gh7qitY", "description": "UAlIKONL", "fileExtension": "jfif"}, {"contentType": "y2CUcmJA", "description": "A0IxWVV8", "fileExtension": "bmp"}, {"contentType": "fPxkr1YU", "description": "kJGmmHRC", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'qLIJvyuG' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'xltW51bT' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["b3JDRVWm", "yXAia81z", "gWgs0vW2"], "name": "hHUHj0hB"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'hijXmSJ5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '8KeiHHm6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["tomFPqxy", "sywVqjXv", "p5X4iQ9h"], "name": "CJdWfoT4"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'qbdTKmoE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'wpvUrGzi' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "VxVpami3"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'mRoJIbml' \
    --body '{"tag": "scbc5KMl"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '9tgAnpUg' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["7gXmnsdo", "lUgdJCh7", "XsLmwhrA"], "type": "TuDpOxlL"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'KwYhkVaR' \
    --body '{"subtype": ["TlZ3gKK4", "ZAAtE5mC", "iMxAhVc7"], "type": "W3kTBxBr"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ZS1rN3gb' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q2J2KgXC' \
    --limit '35' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'MzQry4PD' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'YeQo6Nsj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9kTnrU3' \
    --body '{"name": "3wKPyc9I"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '9JzqMN6W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rYwsuAht' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'NuDdrXf4' \
    --contentId 'gJYHZNSE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPqcNqlT' \
    --body '{"contentType": "7z5AGlQD", "customAttributes": {"fiRNF5zD": {}, "PnFD0yto": {}, "rRCvAP9q": {}}, "fileExtension": "Xr00Eijd", "name": "jONOBuAl", "payload": "yTm4oRlP", "preview": "IWcM58cN", "previewMetadata": {"previewContentType": "WBRSFu7d", "previewFileExtension": "LSmaTLuN"}, "subType": "9TFEyIGz", "tags": ["71KqAFze", "vUjXtI5X", "CtbMxIcp"], "type": "HCgx4KGl", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'VzkgwTIA' \
    --contentId 'KURGdmdP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RPkdVBPE' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'wkdSmPTr' \
    --limit '47' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdAoyOin' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'JNlsUedV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GYoqxhjj' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'PitucHAs' \
    --limit '30' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynmuI3At' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'nOR6EP1S' \
    --namespace "$AB_NAMESPACE" \
    --userId '50ZhmIi0' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'CuTW1kql' \
    --namespace "$AB_NAMESPACE" \
    --userId '0Z7V2ybg' \
    --body '{"contents": ["auK82oTE", "GVQND8B1", "5TvX5zAS"], "name": "fjUvjysB"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'JqBiYsMV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rd9LTXWb' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'urFYZAeV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x60ARakT' \
    --limit '16' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'mA1HUVkY' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'YWdwOCzC' \
    --namespace "$AB_NAMESPACE" \
    --creator 'LoHUeHoF' \
    --isofficial 'jwfHE8x1' \
    --limit '31' \
    --name 'J5IBqAkg' \
    --offset '90' \
    --orderby 'nVwxdBy5' \
    --sortby 'JWAoNVDB' \
    --subtype '2l9JObJQ' \
    --tags 'umRHMZMY,mVCaBF2p,9J8YC6gy' \
    --type '9qmFFQsa' \
    --userId 'yEkIrYAv' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'vF0aTsv0' \
    --isofficial 'BoYpvoW1' \
    --limit '88' \
    --name '2MTBN6vR' \
    --offset '90' \
    --orderby 'QAL9smbA' \
    --sortby 'Yeze1ROw' \
    --subtype '2Z0uYxvW' \
    --tags 'MbNoQtnA,cIg66XRn,Afgz94su' \
    --type 'NMQgZi1H' \
    --userId 'u3r5fGN2' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["toIAFRsD", "nYf0R7Nl", "tps6I9k5"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '34' \
    --name 'eQXVYj2n' \
    --offset '0' \
    --orderby 'NW4BNkrH' \
    --sortby 'Q6XXCNYt' \
    --subtype 'wnlyKLuI' \
    --tags 'jEbkk6Ga,v1KGhdsI,cuvyqMnz' \
    --type 'rAViugs7' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'duRDgL14' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'X5vWzGCL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'Axhdo34Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'KgSrD5bg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '0Abt71gX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '91' \
    --orderby 'T6eFI8oU' \
    --sortby 'Z5QCHBey' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '8SHVBhtR' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDj81dbb' \
    --limit '75' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '2An0O58u' \
    --body '{"name": "gBtz4b61"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'pDP5ufWm' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'VBWh30LN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uxnaI18W' \
    --body '{"name": "I6VDlHGW"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '3bRU5pLM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hk09DwLR' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '47CcE5BR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aWXWdsdm' \
    --body '{"contentType": "hxAOIBmF", "customAttributes": {"tmOtSSCG": {}, "RtUpYxnV": {}, "MuIPiBDq": {}}, "fileExtension": "ZwBJ428I", "name": "u9PXT7Oy", "preview": "A5gmkq3A", "previewMetadata": {"previewContentType": "jlxJj2fM", "previewFileExtension": "oIPGyFXt"}, "subType": "jhyXBPH8", "tags": ["ebTmeNw6", "FpmBNNbL", "XGB6JC5y"], "type": "pdvBViLV"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'po0eZWUt' \
    --contentId 'OpJxGeJB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ITnP9roJ' \
    --body '{"contentType": "wutSLplp", "customAttributes": {"6kyGPMvi": {}, "O9JquJ9r": {}, "K76G4lu1": {}}, "fileExtension": "8zDoeHnI", "name": "bnGlXaAZ", "payload": "KPZJ77DE", "preview": "D5YdVsKz", "previewMetadata": {"previewContentType": "s55Cf813", "previewFileExtension": "yFIjp6g7"}, "subType": "ayBQnoR1", "tags": ["9SQTyLS6", "Fkv505Hw", "Qt215JY5"], "type": "ItEobsOp", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'OR8wMFSV' \
    --contentId 'd0Tp5bGW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtihP4CB' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yuv7sRB1' \
    --limit '41' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '3grVSqRg' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'pD6yJStF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c0JS8hTe' \
    --body '{"screenshots": [{"description": "iC3HPswm", "screenshotId": "won1glHx"}, {"description": "99wFUs5X", "screenshotId": "ATTiBZGr"}, {"description": "I0xJDp7Q", "screenshotId": "so197DQE"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'DakMFnXL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZgxXtwrr' \
    --body '{"screenshots": [{"contentType": "fAf2g7Qm", "description": "bjTSlR7T", "fileExtension": "bmp"}, {"contentType": "wiKS4jFY", "description": "RhkGO3Zb", "fileExtension": "jfif"}, {"contentType": "dpYJa9eq", "description": "jViqM8ZC", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'eRqPwBhQ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'uv8IC20A' \
    --userId 'mP7EckGL' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'snZThGpq' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'EmcBulX9' \
    --limit '81' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSFnG6Pi' \
    --limit '83' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'JetKESIw' \
    --limit '78' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'mBXYNcNr' \
    --body '{"contents": ["WgbjGWS4", "yVk5YLen", "ocDQEUAw"], "name": "RyJlqfSO"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'LdfgXWil' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'K61fzrwe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0lDJgn3' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'd2TvHbue' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fg0hl2tI' \
    --body '{"contents": ["g9DUUnPr", "gVVCbOLT", "h5bsvoJa"], "name": "hbSAQkRv"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'SBCLaahe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CPuYYYr6' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'n2jD6ECJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OQu4d5uA' \
    --limit '41' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '7R2WUX50' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE