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
    --limit '40' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "7nLSkkQl"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '6TTGu5SU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "z650ntSC"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '35GLZLIV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'hkvO0jUe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "1n2IBMbL", "customAttributes": {"oedjWw1E": {}, "vdIRWOpZ": {}, "g5o8l0hA": {}}, "fileExtension": "2JSttB4n", "name": "3uxmYDk3", "preview": "Oi5RGil5", "previewMetadata": {"previewContentType": "rMFGFNbT", "previewFileExtension": "96vBS6TP"}, "subType": "8VjEaXNx", "tags": ["pXXcsykP", "CohtgQE1", "zo6nFa8u"], "type": "HJ9Lm7Fc"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'TSKA5mlI' \
    --contentId '3BwT95JZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vrMCMvth", "customAttributes": {"hVxmvlY0": {}, "EmljiV9g": {}, "LgLburu2": {}}, "fileExtension": "7apCn3ZP", "name": "4RLyMVuo", "payload": "6R8iGw6s", "preview": "HxX0DrkH", "previewMetadata": {"previewContentType": "fFQuuUx9", "previewFileExtension": "p1HmvWm0"}, "subType": "sYRmOnhT", "tags": ["kDAvRA7B", "kKC29Cq9", "CsN8Ph6V"], "type": "FdMx0oFC", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'sLNh9gWr' \
    --namespace "$AB_NAMESPACE" \
    --creator 'VnSs6j0a' \
    --isofficial 'WIkytyry' \
    --limit '59' \
    --name '9CD11Hnn' \
    --offset '72' \
    --orderby 'diQ8dwuq' \
    --sortby 'a4fPovrv' \
    --subtype 'f1g64nh0' \
    --tags 'WJQLovpF,M2SzCShm,3nkEbo9L' \
    --type 'NkmM8hm9' \
    --userId '2lrm4nwM' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '7Rn3vG7o' \
    --contentId 'fXuuFcq7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["3AP6FkrS", "0gRFFZ8N", "YrsezZMr"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '7gSDXJ2E' \
    --isofficial 'oNbc9BEV' \
    --limit '2' \
    --name 'hTqW8MSw' \
    --offset '76' \
    --orderby 'soOYJYyM' \
    --sortby 'NRgF2fkl' \
    --subtype 'hPs9pbp0' \
    --tags 'j7UTDGrx,uKWJ9dQq,OKAaiRxl' \
    --type 'GlT23wbK' \
    --userId 'S38pVf8q' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qw4Wtjbe' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'uFMHB2Ro' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'Y4RTMrb2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'U1AW5NbN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "DB02YBBx", "screenshotId": "8C7gb96C"}, {"description": "w2PSI6TJ", "screenshotId": "aoW78Hxh"}, {"description": "B1oscfDH", "screenshotId": "usMrPJzQ"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '2enIMrg8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "pNko52Na", "description": "pE2Moe3e", "fileExtension": "png"}, {"contentType": "ssO0oXKt", "description": "SS46Mnxd", "fileExtension": "png"}, {"contentType": "asDd7KA7", "description": "dUjrqu3J", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'Us3xZVQ3' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '01eeI7DX' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["h4PzFYJM", "Vya4HukY", "baB3HY5a"], "name": "QHUG4srM"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'Q8IPWFOO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'swzsGnZY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["yq0ODBTk", "TkMQll6K", "dXta4nTJ"], "name": "h30VkPsF"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'cJxyGah8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'TkqwIGVe' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "fE9LdOSY"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'HzR6Wc6w' \
    --body '{"tag": "tDAyQJeX"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'FMqawYnJ' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["shaaZeYu", "Dz7GqBKp", "o0CPpwxO"], "type": "44sxrQGO"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'eevigiRF' \
    --body '{"subtype": ["tM4eyDga", "LB0TJbHP", "uCiZCxjd"], "type": "Sr2LMLni"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'w75wNE9f' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUZl7S5W' \
    --limit '65' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '6BDDWc6E' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'kJBt6y2V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYqvrBgO' \
    --body '{"name": "ZNs2bfO8"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'nfeGRJlU' \
    --namespace "$AB_NAMESPACE" \
    --userId '1B1nGfHF' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '2VULd6c4' \
    --contentId 'EF3QUDU5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm8xf3LRO' \
    --body '{"contentType": "uUZ7Nj8L", "customAttributes": {"R1KaoTLV": {}, "aqxaGoAa": {}, "zTEiudjz": {}}, "fileExtension": "06bThjEw", "name": "yLenQEBU", "payload": "NGsbU5Un", "preview": "yNULzlMk", "previewMetadata": {"previewContentType": "ayUMVfrv", "previewFileExtension": "X87Bp33x"}, "subType": "gkVmkmxl", "tags": ["2709ah4e", "xWEyQgGp", "dK7GAAUq"], "type": "IZTvCBG5", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'Az5Ar0Co' \
    --contentId 'cIaBRfkK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aF3VeGYh' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTQv7DZw' \
    --limit '96' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '80wE32GZ' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'qIE8CYEz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRXSyqCy' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'jYFiSKYe' \
    --limit '66' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'JP9kvIQc' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '4dM7pr3h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Venk077m' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'HliWhxya' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D07TTbde' \
    --body '{"contents": ["ADqkwnx4", "CIRTFO0k", "6oAYlZlE"], "name": "cRFPAaO8"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '7fYOkTqT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tXikcwr8' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'V4NwPxTh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'anwWUmei' \
    --limit '18' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'sdBt2D64' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'dChKUdkO' \
    --namespace "$AB_NAMESPACE" \
    --creator 'OIIkc9hy' \
    --isofficial 'xef8Uwan' \
    --limit '88' \
    --name 'scC63nhY' \
    --offset '15' \
    --orderby 'FNnKQZ0e' \
    --sortby 'e48yOK7G' \
    --subtype 'jIrbBNae' \
    --tags 'XYM6idcd,vbgUxS2G,MfA82txX' \
    --type '4GKINizZ' \
    --userId 'FqEjjiVd' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'WHHFBt6G' \
    --isofficial 'iisNc8Fa' \
    --limit '1' \
    --name 'aTCMwZoV' \
    --offset '10' \
    --orderby '8ua06lFk' \
    --sortby 'Pop6vwym' \
    --subtype 'o0sDpouY' \
    --tags 'xXculRBi,8c2O6QC4,2dpADWSC' \
    --type 'kR3JVnUu' \
    --userId 'Y0sIwLCk' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["mnQpt5vD", "galtpa2g", "hZ5MOdo7"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '47' \
    --name 'S30VEZ5n' \
    --offset '38' \
    --orderby 'LVdpxdCy' \
    --sortby 'iTKJwEFn' \
    --subtype 'RXJ6fNtT' \
    --tags 'LbdVKbAy,W3zBNhLU,lAN40M1P' \
    --type 'VXsXQ0ij' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'p6hE1bIF' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '2MsfpkUh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'P6Oh5hHy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'iw7kuJB1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '84YdZ3Pl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '1' \
    --orderby 'mZTDqi39' \
    --sortby 'R5BhN9ig' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'jIVdMuuG' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'xwtIUW4R' \
    --limit '28' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'GIvh23wb' \
    --body '{"name": "O3BFolQH"}' \
    > test.out 2>&1
eval_tap $? 68 'CreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'R659Zn3d' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'oyVQ1Ebs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'chviddP4' \
    --body '{"name": "37B9OyPG"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'LvCQsuT6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ygt7NfcF' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'yNqR6rDN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UUCfzlSM' \
    --body '{"contentType": "H0VQuJON", "customAttributes": {"QCz6Wbj6": {}, "Ssve23dh": {}, "3Y2GCuwp": {}}, "fileExtension": "54Suu3mN", "name": "4e8CefJI", "preview": "zkveu5OM", "previewMetadata": {"previewContentType": "FcbERufU", "previewFileExtension": "jGv1wr5v"}, "subType": "YOHq6X7E", "tags": ["Cs4g8TzQ", "8xzcXs2x", "sCFm0AUm"], "type": "X7kf7euY"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'dxo017rz' \
    --contentId 'PO8lQTg4' \
    --namespace "$AB_NAMESPACE" \
    --userId '8z1Tl83Q' \
    --body '{"contentType": "wMx846pz", "customAttributes": {"bU19IDbd": {}, "hu390hfK": {}, "VAiiKbI6": {}}, "fileExtension": "dbaSpCvZ", "name": "GPINULaB", "payload": "Sl6Z2MpE", "preview": "uodBze2e", "previewMetadata": {"previewContentType": "yd8IxnW2", "previewFileExtension": "MiCWafJu"}, "subType": "1G5VRC7e", "tags": ["T0fqnK8b", "p6KM9ldM", "SHfcu4iL"], "type": "EGb7dBGg", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '4capR8vR' \
    --contentId 'DOb5xJje' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R3UjzEox' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '4qeHOxBW' \
    --limit '69' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'HHcEkG5B' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '4syiBAit' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pqSEDn7y' \
    --body '{"screenshots": [{"description": "duIs9RKz", "screenshotId": "KlzMcHEz"}, {"description": "AjhGZRv0", "screenshotId": "ha6Ql1h7"}, {"description": "rgVR6arO", "screenshotId": "8LU839mA"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'WBKZijU1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q4TKVYS0' \
    --body '{"screenshots": [{"contentType": "Z73OKYeK", "description": "REBL7pWJ", "fileExtension": "jpeg"}, {"contentType": "1wXaEMs1", "description": "w2wpQAii", "fileExtension": "png"}, {"contentType": "wK0mpkfd", "description": "taH4Y6Vw", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'TUbWnCt4' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Oxc9Kma3' \
    --userId 'egdMTSJw' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'XC3Khw6T' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'yo2RuhsW' \
    --limit '25' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'xFC4e8C4' \
    --limit '66' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'QEPkAe30' \
    --limit '71' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'lnipf3bN' \
    --body '{"contents": ["7TnTrc1E", "bGOhNTN5", "CaARD9yg"], "name": "lGR2mSUz"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3bj9TQ0' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '7VszmjpB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWuO8NAS' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'ht0wsamC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eTftY20C' \
    --body '{"contents": ["pQPP5v8h", "uJD2Ui4m", "of230Tq7"], "name": "xItmvtTk"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'q1zdPINQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '1Lf6Fvf6' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '65BNRhTf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0DtL6MV' \
    --limit '35' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'ln33lFV4' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE