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
    --limit '34' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ic4O2qUj"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'RVCtAw2i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "IcAsJ3b2"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'bzGytgsI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '17LAOW63' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "cRU0dVwa", "fileExtension": "EDcula8q", "name": "GHNANMJM", "preview": "xqoFNJ61", "previewMetadata": {"previewContentType": "8ui50bvn", "previewFileExtension": "KlFOjZHx"}, "subType": "J8TbcRN4", "tags": ["WvhY3NdU", "IbKPucIn", "bVCST2v2"], "type": "Uxt8EQCe"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'WXM3CNFe' \
    --contentId '2i81L339' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "AGl4OHoI", "fileExtension": "IcOZlQBP", "name": "BO2zYAG6", "preview": "OYsL6ZGT", "previewMetadata": {"previewContentType": "j2EPW1Nx", "previewFileExtension": "EH7470Xi"}, "subType": "PM3P9XWX", "tags": ["6eXL1E37", "JAumaqWt", "cJhwb1EC"], "type": "Ztz9AhiN"}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'yJQi1exE' \
    --namespace "$AB_NAMESPACE" \
    --creator 'nl9BoDjV' \
    --isofficial 'q3T0E4lP' \
    --limit '77' \
    --name 'Qvmfuy47' \
    --offset '43' \
    --orderby '7tyHYztW' \
    --sortby '9AQijpMp' \
    --subtype 'cb00PuxI' \
    --tags 'TAC8vBsm,aFaOqB5Z,Nh0TmeOV' \
    --type 'LTtryPSU' \
    --userId '1GBgcLIU' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Rwms7D25' \
    --contentId 'MrEVoVfa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'L9PnORIb' \
    --isofficial 'cM4LOMky' \
    --limit '83' \
    --name 'ngZXUsJX' \
    --offset '96' \
    --orderby 'X7OkBYiT' \
    --sortby '9xXkaO3e' \
    --subtype 'zzzP6Fta' \
    --tags '0mTT275v,omFIAfZV,ceAUOqCr' \
    --type '3KYo6v8S' \
    --userId 'mnfK57dH' \
    > test.out 2>&1
eval_tap $? 13 'AdminSearchContent' test.out

#- 14 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'fe2QdvSJ' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserContentByShareCode' test.out

#- 15 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'kc3j2Wfa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetSpecificContent' test.out

#- 16 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'jiKQDtNE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDownloadContentPreview' test.out

#- 17 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'u5MXATXC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "qbhioFSH", "screenshotId": "f4vLWlbI"}, {"description": "8WVTTnCC", "screenshotId": "M81UGmaE"}, {"description": "bRax0PeK", "screenshotId": "gOIDdXOL"}]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateScreenshots' test.out

#- 18 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'sKKf3947' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Mdy2QcWb", "description": "Y1ndOANB", "fileExtension": "pjp"}, {"contentType": "khVFODGp", "description": "SrUB3Nqm", "fileExtension": "jpeg"}, {"contentType": "HCYUsBZG", "description": "aGhjuh4I", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUploadContentScreenshot' test.out

#- 19 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '2ZgBREQk' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'dBkL8zNY' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteContentScreenshot' test.out

#- 20 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 20 'SingleAdminGetAllGroups' test.out

#- 21 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["PhVCFOTz", "LDDJH96v", "cG5EFSrV"], "name": "8Lj524HV"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateGroup' test.out

#- 22 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'AW9PB7xM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'SingleAdminGetGroup' test.out

#- 23 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'u7blvX3E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["IVSkB0Sk", "xM91pe1t", "oVPXhkYE"], "name": "aq7JzNx5"}' \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminUpdateGroup' test.out

#- 24 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'ePwMAVt1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminDeleteGroup' test.out

#- 25 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'mJzYvAoy' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminGetGroupContents' test.out

#- 26 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetTag' test.out

#- 27 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "TtTq5Pxg"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateTag' test.out

#- 28 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'LLVbH8oI' \
    --body '{"tag": "LkfpNKxT"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateTag' test.out

#- 29 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '84pq9mCZ' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteTag' test.out

#- 30 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetType' test.out

#- 31 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["rjUx0pEp", "Qa8na0k9", "2ypFAtYW"], "type": "CmZ9ndNZ"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateType' test.out

#- 32 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '9z3HwcRE' \
    --body '{"subtype": ["gXdboaAv", "B63YhJzr", "iHCtQyFT"], "type": "Io5ZfUsu"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateType' test.out

#- 33 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'GyiXuwz1' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteType' test.out

#- 34 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'oCnUEDvy' \
    --limit '27' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetChannel' test.out

#- 35 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'DF5vPHNa' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteAllUserChannels' test.out

#- 36 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'f0ZgotYx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOx0w0Gn' \
    --body '{"name": "Bi5rrJAf"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateChannel' test.out

#- 37 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'QGZqowID' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofLhrgML' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteChannel' test.out

#- 38 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'bmOwJ1sz' \
    --contentId 'DRzjsJY9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3BS0yNe' \
    --body '{"contentType": "4D32qNXo", "fileExtension": "nYYmQuMY", "name": "aNdJXxNy", "preview": "j1GuhIZy", "previewMetadata": {"previewContentType": "L60bOuXN", "previewFileExtension": "bPIIYra3"}, "subType": "KbORGuV1", "tags": ["mPAfYl8R", "jesT0cX1", "WXt48iiE"], "type": "iS8lXxTT"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminUpdateContentS3' test.out

#- 39 AdminUpdateContentDirect
eval_tap 0 39 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 40 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'EPHalQJA' \
    --contentId 'YiQcctHX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VrjudbSf' \
    > test.out 2>&1
eval_tap $? 40 'AdminDeleteContent' test.out

#- 41 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPq50uwz' \
    --limit '56' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetContent' test.out

#- 42 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'up6ogwRK' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAllUserContents' test.out

#- 43 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '7QBz0qCS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQbBFH3s' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminHideUserContent' test.out

#- 44 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'NfWQIMLj' \
    --limit '47' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetAllGroups' test.out

#- 45 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'xdCX4KLp' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteAllUserGroup' test.out

#- 46 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'kpONfTSo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y6igaIPC' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetGroup' test.out

#- 47 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'hpMpJ4sz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EZ8XnIKN' \
    --body '{"contents": ["IkjR2IjN", "s8VOu1yL", "lSzgjy5W"], "name": "cMZYURVv"}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateGroup' test.out

#- 48 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '7hWcKckh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sPbHoPcE' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteGroup' test.out

#- 49 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'GIh7irIg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'foUNVK43' \
    --limit '66' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetGroupContents' test.out

#- 50 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'll95ax8f' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteAllUserStates' test.out

#- 51 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'enZNZRpD' \
    --namespace "$AB_NAMESPACE" \
    --creator 'QciG5jDV' \
    --isofficial 'asiC0jVz' \
    --limit '67' \
    --name 'zHl7Ckbd' \
    --offset '35' \
    --orderby '5dPwLl5r' \
    --sortby 'fktnCWZz' \
    --subtype 'rJXwUlWk' \
    --tags 'qBznzNwn,jnNk6yLg,C6v3dQ84' \
    --type 'ptl4zeZk' \
    --userId 'O4jKv9xR' \
    > test.out 2>&1
eval_tap $? 51 'SearchChannelSpecificContent' test.out

#- 52 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '0U2S2eo7' \
    --isofficial 'VPBlMK6M' \
    --limit '21' \
    --name '4fvbsTzO' \
    --offset '57' \
    --orderby 'QYwAiVKa' \
    --sortby 'Mr9RzNek' \
    --subtype 'Ej7IFBw0' \
    --tags 'OSn7Tbrf,LVJjUFtU,0NTYWkZe' \
    --type 'zgS8Tomc' \
    --userId 'SFbi1umP' \
    > test.out 2>&1
eval_tap $? 52 'PublicSearchContent' test.out

#- 53 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["iujgBwwe", "1YG3Ljeo", "9Xdsml0g"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetContentBulk' test.out

#- 54 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 54 'GetFollowedContent' test.out

#- 55 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '9' \
    --name '2qqab8YC' \
    --offset '54' \
    --orderby 'UPSPuvcS' \
    --sortby 'VNeA5xkk' \
    --subtype '8bgkC4tf' \
    --tags 'rEZcmkVV,PvWiC9Qt,phMVBlTl' \
    --type 'BSiU6VgX' \
    > test.out 2>&1
eval_tap $? 55 'GetLikedContent' test.out

#- 56 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'SPZsc2Vc' \
    > test.out 2>&1
eval_tap $? 56 'PublicDownloadContentByShareCode' test.out

#- 57 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'aunFcfwZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByContentID' test.out

#- 58 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'BgJRB5md' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AddDownloadCount' test.out

#- 59 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'OVYzxuM4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateContentLikeStatus' test.out

#- 60 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'vPGsCLiY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'PublicDownloadContentPreview' test.out

#- 61 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 61 'GetTag' test.out

#- 62 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 62 'GetType' test.out

#- 63 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '16' \
    --orderby 'PurL2yh7' \
    --sortby 'gGDHttB4' \
    > test.out 2>&1
eval_tap $? 63 'PublicSearchCreator' test.out

#- 64 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 64 'GetFollowedUsers' test.out

#- 65 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'qb0uCCw7' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCreator' test.out

#- 66 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '2FhtW8ef' \
    --limit '84' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 66 'GetChannels' test.out

#- 67 CreateChannel
./ng net.accelbyte.sdk.cli.Main ugc createChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'zsjvt1hI' \
    --body '{"name": "fJI75zmR"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateChannel' test.out

#- 68 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'rOL6TMx1' \
    > test.out 2>&1
eval_tap $? 68 'DeleteAllUserChannel' test.out

#- 69 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'SuVoE6MI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mjmtVGvE' \
    --body '{"name": "sr1EaAbR"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateChannel' test.out

#- 70 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'y3ILpaqR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnrYg1AF' \
    > test.out 2>&1
eval_tap $? 70 'DeleteChannel' test.out

#- 71 CreateContentDirect
eval_tap 0 71 'CreateContentDirect # SKIP deprecated' test.out

#- 72 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'nOqK7bKm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ycf5BieS' \
    --body '{"contentType": "RMCk86uO", "fileExtension": "meXyttes", "name": "5tu6LknJ", "preview": "9PXEEIwg", "previewMetadata": {"previewContentType": "DZaB1iEy", "previewFileExtension": "EVrXb42b"}, "subType": "uRRq4i90", "tags": ["0nUAHXtc", "EQIYR5bF", "dLncoHtl"], "type": "mf7g3RNX"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateContentS3' test.out

#- 73 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'jaRNK3WN' \
    --contentId 'SeT4WbCa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cp6iytBT' \
    --body '{"contentType": "TIXaNZ5j", "fileExtension": "bBOaiIzM", "name": "JQe8A5aL", "preview": "kARakJun", "previewMetadata": {"previewContentType": "mB3vuwr8", "previewFileExtension": "xoJ95kbA"}, "subType": "NNgLeTqo", "tags": ["y4gzcdKZ", "stvtlH62", "qRepBnTq"], "type": "hvIW8H6Q"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateContentS3' test.out

#- 74 UpdateContentDirect
eval_tap 0 74 'UpdateContentDirect # SKIP deprecated' test.out

#- 75 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'lc7Emjky' \
    --contentId 'cr2hYA0r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZXc7WvW8' \
    > test.out 2>&1
eval_tap $? 75 'DeleteContent' test.out

#- 76 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hz7wzig1' \
    --limit '78' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetUserContent' test.out

#- 77 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '6cCHgTmh' \
    > test.out 2>&1
eval_tap $? 77 'DeleteAllUserContents' test.out

#- 78 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'oOhDFMt5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fkE6SctU' \
    --body '{"screenshots": [{"description": "1mDyBLH9", "screenshotId": "R46JUeEU"}, {"description": "VfpUODh2", "screenshotId": "sfrnfnBk"}, {"description": "uHZ2n8ym", "screenshotId": "F7jLmDYA"}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateScreenshots' test.out

#- 79 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '3HsVEBi1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O1NU3h76' \
    --body '{"screenshots": [{"contentType": "tBBEYTzu", "description": "9x5ZOklp", "fileExtension": "jfif"}, {"contentType": "2SFy1SqN", "description": "5lJHXD8G", "fileExtension": "bmp"}, {"contentType": "Mfk7w2ZB", "description": "4KDGboIs", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UploadContentScreenshot' test.out

#- 80 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'ynCRSHea' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'SbVJv52S' \
    --userId 'jV0ZpqMP' \
    > test.out 2>&1
eval_tap $? 80 'DeleteContentScreenshot' test.out

#- 81 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTgizDUs' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateUserFollowStatus' test.out

#- 82 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'a2jKZ2bn' \
    --limit '44' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 82 'GetPublicFollowers' test.out

#- 83 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '9esL3Sct' \
    --limit '68' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowing' test.out

#- 84 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQBTPONL' \
    --limit '56' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 84 'GetGroups' test.out

#- 85 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'MR9zO2nH' \
    --body '{"contents": ["N3wbMdxB", "jOxHCbos", "UkI4J9al"], "name": "CdNNWVdH"}' \
    > test.out 2>&1
eval_tap $? 85 'CreateGroup' test.out

#- 86 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '50JiSgd9' \
    > test.out 2>&1
eval_tap $? 86 'DeleteAllUserGroup' test.out

#- 87 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'cIYkHxXh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JzSWzfeL' \
    > test.out 2>&1
eval_tap $? 87 'GetGroup' test.out

#- 88 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'wVF0Kchn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eaVOWAp4' \
    --body '{"contents": ["Xr0n3QaG", "dknzYXWY", "TYuOAh9i"], "name": "bR9UhPyw"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateGroup' test.out

#- 89 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'Wo6MuOag' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iNdb7yx2' \
    > test.out 2>&1
eval_tap $? 89 'DeleteGroup' test.out

#- 90 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '0BMVLNBK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X416uye0' \
    --limit '71' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 90 'GetGroupContent' test.out

#- 91 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'lQZqmMVZ' \
    > test.out 2>&1
eval_tap $? 91 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE