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
    --limit '86' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "s2CYLAPb"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'ltyMV2tX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "yWTlI3kQ"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'FT6l2zOn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '1adLTnO9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "KExdFcFQ", "fileExtension": "sOJ5Dx7Y", "name": "WQCj7prv", "preview": "yjDzpqTU", "previewMetadata": {"previewContentType": "pSJE2gWB", "previewFileExtension": "LGk8uFt4"}, "subType": "4tGDcABN", "tags": ["qC1zIJXf", "bdX7DbfC", "l7w83nB4"], "type": "bBlvP897"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '3Qk1Ahnt' \
    --contentId 'm65Fpcty' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "UuE1kySR", "fileExtension": "5IVtNZ6r", "name": "7cPbx6Ul", "preview": "a8OYQB8X", "previewMetadata": {"previewContentType": "rXpdgvx2", "previewFileExtension": "n7GyBAjt"}, "subType": "MqDFNxYR", "tags": ["LCefmfGk", "ZLEnMQEC", "bRyfjpj4"], "type": "xfT1vA39"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'UF6iVQwr' \
    --namespace "$AB_NAMESPACE" \
    --creator 'NJNTlP33' \
    --isofficial 'w0qDSkQZ' \
    --limit '47' \
    --name 'XPHyqOJ1' \
    --offset '73' \
    --orderby 'T9hrxayt' \
    --sortby 'yyvyX6Br' \
    --subtype 'kslzeGAa' \
    --tags 'DfhAQjND,bXCcXD8a,yLK5H9Lf' \
    --type 'DuEdCOet' \
    --userId 'arbHLp3X' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'RvsI159x' \
    --contentId 'IrxEo3BY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'sP0yOQlg' \
    --isofficial 'wvW8o2d2' \
    --limit '24' \
    --name 'vB0qt0PC' \
    --offset '24' \
    --orderby 'avsK1Y18' \
    --sortby 'BAkucqRY' \
    --subtype 'oaTNvXr9' \
    --tags '39Hq0ygw,zmS1kRWt,XkERNmqA' \
    --type 'tlawkIC5' \
    --userId 'Et0Ay337' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ITnWI62s' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'kD1geRJ0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '1NJt696U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '980FJLcI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "w0KqD7o8", "screenshotId": "saYx6fid"}, {"description": "ecNXJsda", "screenshotId": "v3LkMOFd"}, {"description": "lJ78gkye", "screenshotId": "J2bs0mlL"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'VmpD2nfD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "GgheoR1Q", "description": "J7dKF9uA", "fileExtension": "png"}, {"contentType": "YCgfytJY", "description": "vbtbvV2F", "fileExtension": "bmp"}, {"contentType": "E84agKGV", "description": "PActtCsO", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'eGVxbrIH' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Ni2RQEEB' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["Rv5cEoJH", "Y8GHM9wX", "VzFtfxie"], "name": "ozX5cuf7"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'pCgTxW63' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'HQsSjkoU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["I60wBVes", "BtqdvFkP", "vE6JGKBV"], "name": "DqOUKaZp"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '45FzprPu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 's3yqs8si' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "XaN8Ssiv"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '96JBqG7b' \
    --body '{"tag": "ri7WWrgg"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'OmqYzpB5' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["sVzlZv8L", "pUpAY1IT", "jCg2NNFk"], "type": "NSWkcZE7"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'njKCKxlo' \
    --body '{"subtype": ["5iVJNOXm", "KCGzsZwO", "CEmMLT9b"], "type": "Z0rBEe48"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'mDX837P0' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'DZ2H1BmF' \
    --limit '0' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '8gyMu2MJ' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'HYJNp4uW' \
    --namespace "$AB_NAMESPACE" \
    --userId '1sf9ymAV' \
    --body '{"name": "G1ZjA5yJ"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'eUhet40c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ObdRoTdr' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'cQgKtHvT' \
    --contentId 'c0qGqemz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4mzKmDT' \
    --body '{"contentType": "sdMlMyGe", "fileExtension": "vNRhVvU3", "name": "ecYkO2rd", "preview": "QYNWtUMm", "previewMetadata": {"previewContentType": "4LAWlUyC", "previewFileExtension": "44o3wpZf"}, "subType": "tQUfy6mU", "tags": ["CVDV1KeT", "ddNDwDRZ", "Go79GVrl"], "type": "MocNqCdR"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '9kQW5xqr' \
    --contentId 'UIk6iRx1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VS7MXAJz' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'GeBbTm23' \
    --limit '33' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'XfgLc2w8' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'dbEN1ii1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3J4Cg1U' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJJ8qvdo' \
    --limit '6' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBEnXCcX' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'mhSqQgRQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HkfVrj1r' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '7plSHHTS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FafM3plF' \
    --body '{"contents": ["ewoyoNHK", "s5Bznab5", "has3o1yi"], "name": "R2Wgcjpf"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '2enR6U47' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w57DFXvZ' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'kQOMnOAf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ie6Yo1pF' \
    --limit '0' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'oU9613H1' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'sZUauqZX' \
    --namespace "$AB_NAMESPACE" \
    --creator 'YTSSho1B' \
    --isofficial 'UA7IlPgI' \
    --limit '38' \
    --name 'Mn1SNz40' \
    --offset '0' \
    --orderby '4dWBB7IS' \
    --sortby 'QDGNwZMC' \
    --subtype 'NSsEqpKe' \
    --tags 'KIofYUlX,7csTg7Om,Jf2D2tIF' \
    --type 'wqBOaFCK' \
    --userId 'p2BoACqQ' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '0QIHcC9m' \
    --isofficial 'CYfW5yPE' \
    --limit '69' \
    --name '5IFaXrk5' \
    --offset '44' \
    --orderby 'o2hKTnDy' \
    --sortby 'ifymjOQY' \
    --subtype 'N6k1XukD' \
    --tags '9ygypJVG,QsLdmZDy,yDvyDrur' \
    --type 'cm1FN2Tg' \
    --userId 'dw1rkwzQ' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["egPRz3pG", "72Zu6ic2", "aLR56Csv"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '8' \
    --name 'cqiBaQap' \
    --offset '63' \
    --orderby '3lHDxpKA' \
    --sortby 'Zip076iD' \
    --subtype 'i1GjXmBY' \
    --tags 'eQEpFTxF,i2eErKjm,PhByCbxK' \
    --type 'CArQ5x6q' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'f4R5VbXe' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'Yi1kDBip' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '1DR6eb1a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'E0df2TLW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'amJFltcP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '81' \
    --orderby 'IzVOtcpo' \
    --sortby 'PehTtk1k' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'eB92GJWC' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'srSusGe9' \
    --limit '10' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'JpqsTSsZ' \
    --body '{"name": "bLpYJJiu"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'rAsH5I8y' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '5MKd0oZf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zaNSCjOp' \
    --body '{"name": "97SKKqof"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '3NVYHKKx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gl9NdUlN' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'rEtQOnFW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zxIUCXVY' \
    --body '{"contentType": "YnueOXyK", "fileExtension": "lZZ6XvFC", "name": "wxoZO4wS", "preview": "Lmlet97D", "previewMetadata": {"previewContentType": "Uqg9L7Qq", "previewFileExtension": "CimOWoDc"}, "subType": "bI6i3yr6", "tags": ["60X6ogSO", "Emq4T0Mh", "K9qYOTQD"], "type": "KbJg1Ozc"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'Nt5r1Q18' \
    --contentId 'UK5nHlMS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUAH2cEQ' \
    --body '{"contentType": "RaA5Ll50", "fileExtension": "BrBbMxGu", "name": "3OXQHPqw", "preview": "kmkfcZda", "previewMetadata": {"previewContentType": "2VUxSS2d", "previewFileExtension": "LLzqBtFX"}, "subType": "qhoWY0k3", "tags": ["M7tklj3D", "rsyAQBpQ", "wiDgvkZk"], "type": "E4O4OEQM"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'tmTZHLH5' \
    --contentId 'Sg2nJdbt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NcthQoZQ' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '4dHpWuVU' \
    --limit '71' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'CHpST9W3' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'EY7mQUev' \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4fYJhxp' \
    --body '{"screenshots": [{"description": "6tMWRNLZ", "screenshotId": "f9gaY1jr"}, {"description": "AO1Zxs9S", "screenshotId": "CpKwYLwe"}, {"description": "BSbys5N3", "screenshotId": "ovyfH0Hi"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'COeIebkB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q4sWYTqg' \
    --body '{"screenshots": [{"contentType": "Hzdy6NOg", "description": "JgzkPW2q", "fileExtension": "pjp"}, {"contentType": "Ooo4iMfm", "description": "lFyeIZJf", "fileExtension": "png"}, {"contentType": "4MQbW08i", "description": "YJn36Jcy", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'qSAjMJiF' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '3SxM09vI' \
    --userId '1lTiJojA' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'DGUOTG6x' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9i9E00J' \
    --limit '82' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'bue5PBsH' \
    --limit '2' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '9ILFCwmv' \
    --limit '21' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'zsYpjH4f' \
    --body '{"contents": ["s4cD4V5A", "zjfttzgx", "0SRBEZD8"], "name": "d2i9L5Cs"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'RUyZmoSh' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'nYcB3srP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WvGltKJa' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'ZFhdBevF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fq2Y5kqf' \
    --body '{"contents": ["LhqeaHSx", "F0ZgLL1M", "rxvhcG93"], "name": "mPcA5xVY"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '3GcbScvZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '7nMK2PnW' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'mlt4TBw2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUfO5Vuf' \
    --limit '0' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'hd2ic4SZ' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE