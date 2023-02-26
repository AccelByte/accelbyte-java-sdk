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
    --limit '29' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "pcBZtrNm"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'pkoIBrTD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "JF5tBow1"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'LxIZwYFX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'moyeR7Ux' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "iBYTATS7", "customAttributes": {"YYawzLRm": {}, "VCBZ8Tbo": {}, "TOwLg2PY": {}}, "fileExtension": "JHcoj0tJ", "name": "XPM2uqqn", "preview": "MUuHEfsJ", "previewMetadata": {"previewContentType": "4yibY5jB", "previewFileExtension": "NTWa66Cc"}, "subType": "QA8L9WC2", "tags": ["1bstet2h", "dfxnhmIH", "KJXC0zRx"], "type": "M3d2VhLq"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 't9VPWzTa' \
    --contentId 'eQH3iKek' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "k8RjHkFn", "customAttributes": {"3lkrrMIU": {}, "SnF00yx6": {}, "EEym282y": {}}, "fileExtension": "LD4O1xrr", "name": "Gd8wukbh", "payload": "vCqNzkAg", "preview": "pgYPhqNN", "previewMetadata": {"previewContentType": "T5zkzejQ", "previewFileExtension": "vc5KwdL4"}, "subType": "8PVpOPCO", "tags": ["x9WQ0LBx", "XLGKnZP9", "YnO0nPkN"], "type": "nCySNp6h", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'W92myYSx' \
    --namespace "$AB_NAMESPACE" \
    --creator 'LGwKKr7C' \
    --isofficial 'CHr3DETp' \
    --limit '75' \
    --name 'zOXbobKh' \
    --offset '64' \
    --orderby 't9nuuYvd' \
    --sortby 'q4Lxcrlt' \
    --subtype 'yFs97FNO' \
    --tags 'uP3EOvPB,QSJRIfa4,g4Y3RoMS' \
    --type 'd8Prugum' \
    --userId '6jZ1bZFT' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'TKTcl9L0' \
    --contentId 'vnmLXPMC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["1Le83eBc", "DV0e0B5f", "upR7vtbV"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'JAY8AOWN' \
    --isofficial 'QnI5pJen' \
    --limit '74' \
    --name '54tFS0kp' \
    --offset '26' \
    --orderby 'pWAR0fgT' \
    --sortby 'jftLyMbc' \
    --subtype 'vLQyCCp3' \
    --tags 'aBPeebrZ,zGsD1k4T,EZFUejVn' \
    --type '5Qn6QXBn' \
    --userId 'xt3QKqEl' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '7XEknEnL' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'cLR8PqZX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'krcucv4C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'CFBrrWBA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "vPqkWRoR", "screenshotId": "d3NooBO3"}, {"description": "FqJsyAYL", "screenshotId": "rfDLuu5N"}, {"description": "50d1kT5o", "screenshotId": "iMUwJcRU"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'I2nLaiPK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "9ZnLhIZV", "description": "ZFsfnRFN", "fileExtension": "bmp"}, {"contentType": "t9lR3Bxo", "description": "40yE2OPB", "fileExtension": "jpeg"}, {"contentType": "O1IyHXOg", "description": "b4B0XXQt", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'LV79BSYz' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'LLUdJE7B' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["3giI0vNl", "7l3oOc4R", "UIwZMCIS"], "name": "VUTaNtTI"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'd6Vx9GZ5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'NGfIv3yq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["LJ297M4l", "ND8zgx03", "eHvs5i5H"], "name": "iMLGhUmD"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'P51rMDGR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '1LSykBvE' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "5VuBzQF6"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'y7VmxdXm' \
    --body '{"tag": "MbstPgWi"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '18NDJkUj' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["51cUMlK5", "b25AtVuD", "BbGfSjux"], "type": "zIKJIR8d"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'yh1Z0JL7' \
    --body '{"subtype": ["WNj38zHr", "wOZdq72p", "dX26dahu"], "type": "PzwFWyXq"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'irSXWGcW' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'gRoEXIft' \
    --limit '5' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BBcvqMei' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId '1F5J9J4B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tqJovh0K' \
    --body '{"name": "dnQwdlXD"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'X7cfhMby' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RqSENvfE' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'X8w40MZa' \
    --contentId 'zYTHauwl' \
    --namespace "$AB_NAMESPACE" \
    --userId '4ozYhEra' \
    --body '{"contentType": "XUQ9R8o1", "customAttributes": {"xMtxfXZ4": {}, "CCTdzM8B": {}, "7yz0kzmF": {}}, "fileExtension": "4hhPJBX1", "name": "b2QM7WPo", "payload": "CdYDnNNS", "preview": "wroOoXj8", "previewMetadata": {"previewContentType": "cqhMAOAw", "previewFileExtension": "qO8ih6L7"}, "subType": "FQSPwUwx", "tags": ["WY6o6SlT", "M7IcCdGm", "ddZAbliK"], "type": "yRZD6JRe", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'LnzMwvxW' \
    --contentId 'zpYUck0x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yfYSe4Q7' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'pqvhEfPB' \
    --limit '97' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'mUank1Ns' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'fYmLXuyZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hbPDuNBu' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIkAN4MH' \
    --limit '17' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '0Gvk6FII' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'XpV2m87M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P0rMGtA6' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'YGP12aTG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gH2mB5IN' \
    --body '{"contents": ["zpYtJnS3", "rIw905JW", "baQTjrRf"], "name": "x7D7zClY"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'c0iWiVFz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'POPNOY58' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'LOtkpK4N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gsntqfg1' \
    --limit '100' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'DpHpi7N8' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'QCHnXuiq' \
    --namespace "$AB_NAMESPACE" \
    --creator 'zKQYJmda' \
    --isofficial '1sBiqW56' \
    --limit '92' \
    --name 'YMrSKveG' \
    --offset '95' \
    --orderby '3BhqHhqQ' \
    --sortby '4dHYWIOK' \
    --subtype 'RPsBliTZ' \
    --tags 'dhLqKaG3,9gZ37kGI,kQuB3o0I' \
    --type 'RgiCPJPl' \
    --userId 'lFUdQQYB' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'uWtqUyTj' \
    --isofficial 'BAAAqXDG' \
    --limit '3' \
    --name 'BSnPYUnn' \
    --offset '21' \
    --orderby 'rCMtu3Bc' \
    --sortby '6ML86gR1' \
    --subtype 'P5va9JRL' \
    --tags 'R8h1yaHt,s6RGLaLs,YKiqg9dQ' \
    --type '61HxLreY' \
    --userId 'rCMzgZxa' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["46r9co2T", "u0s32prm", "uWvOnZ6u"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '68' \
    --name 'QifNkiHu' \
    --offset '1' \
    --orderby 'k13ufh8y' \
    --sortby 'fNE1hwXL' \
    --subtype 'vM5eUr1A' \
    --tags 'exLSy5tt,q6cLQmLD,vEufX9Fz' \
    --type 'YjRsXU2c' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UlphuzNj' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '3Az842Fo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'xI9HxxNm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'k4ZbSzkE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'hbHwMx2m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '31' \
    --orderby '5OFcTXW2' \
    --sortby 'b0JVhwfv' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '5CUBCfJU' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'hEgZnVMT' \
    --limit '20' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ISuEucVe' \
    --body '{"name": "QubDubkq"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'GR0errW5' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'Ct1P2r52' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hgaUWCcz' \
    --body '{"name": "oBaWGvf3"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'dZtvCmP2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wfSFTPEA' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'z0NXTKc9' \
    --namespace "$AB_NAMESPACE" \
    --userId '94wHJpnp' \
    --body '{"contentType": "vHKtIenn", "customAttributes": {"ObFLX034": {}, "XWyYTgtH": {}, "beHdRH1B": {}}, "fileExtension": "SN8zuYM3", "name": "DT25VZhH", "preview": "ph8gWtX3", "previewMetadata": {"previewContentType": "sDFGk3EN", "previewFileExtension": "gNrnbYB0"}, "subType": "BaMCugx8", "tags": ["tuu66VpD", "CoaZNTat", "A78Y0wrs"], "type": "USLwmHcy"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '3S8nANUv' \
    --contentId 'fqfqQgWw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qztaxOFA' \
    --body '{"contentType": "PfMXHFrs", "customAttributes": {"Yi31kJ2F": {}, "zfAskSDS": {}, "wUISDOP1": {}}, "fileExtension": "DzUdzSDE", "name": "kw3j0fJk", "payload": "jX7KhyLI", "preview": "QxXOtrwz", "previewMetadata": {"previewContentType": "xi6AJt6y", "previewFileExtension": "u7T8NRja"}, "subType": "IJAQLClA", "tags": ["Ve8OSLsL", "j1DvG3Fa", "NY7BOQ05"], "type": "dGKNQ3AP", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'jQbl8aR1' \
    --contentId 'KK4pkixn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlcKNRpG' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'hX38ZlvA' \
    --limit '17' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'SXixFHC8' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'HpJbgQCA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYdsW7zp' \
    --body '{"screenshots": [{"description": "18DPmrxz", "screenshotId": "v5Dou8xv"}, {"description": "bjKUoZmH", "screenshotId": "hniAYi1y"}, {"description": "GIVgsIaR", "screenshotId": "rF7UAx59"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'HETPbu4W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkrB3P5H' \
    --body '{"screenshots": [{"contentType": "y40KxguA", "description": "IgAHVmRj", "fileExtension": "pjp"}, {"contentType": "M6Ijifml", "description": "pA1kEslL", "fileExtension": "bmp"}, {"contentType": "5wtTUL9S", "description": "uNuKEA41", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'uIAnGyVi' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '0WAxRDKh' \
    --userId 'hwQiBNJS' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'jHHoPMUI' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'DY8HRLSF' \
    --limit '49' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eh2jOuxH' \
    --limit '1' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzEISTy2' \
    --limit '75' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'wzSv7thz' \
    --body '{"contents": ["f7UMUjkk", "OkNZ3tQc", "Nd6di2iY"], "name": "pW75orRm"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'rH8Q0nba' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'cIYKYGv5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kwBDoFAP' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'mic2320o' \
    --namespace "$AB_NAMESPACE" \
    --userId '5pwR1G3L' \
    --body '{"contents": ["9CQjdzxk", "hDjA2Qy4", "82rqg7O3"], "name": "43VX5yYk"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'qrwjhKHy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iRyESoem' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'bitfzJNN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'voeEcvq4' \
    --limit '19' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZmKogH0f' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE