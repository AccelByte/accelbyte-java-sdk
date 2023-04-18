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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "AxcVpFrttufHIRdH", "name": "9UzVRiXbqlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '2ktQG0h5JAav5kRa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "62WopBJHPtcDs8bB"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'ZLCXLx8bbgorQeFb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "dwpzS6DaDpv8N7ZQ", "customAttributes": {"VqGj6oDLjWjkY1aX": {}, "lFcDtgOjchIua5tW": {}, "EIC32ogW7olvbTgr": {}}, "fileExtension": "hRTcPiSuL0Sly6XM", "name": "4OI18mAQLnzjMf8G", "preview": "Z2WBZqxYG3aREAu2", "previewMetadata": {"previewContentType": "D6QVKNCWP75TB0i7", "previewFileExtension": "pKxR8dl0zRVW4EZG"}, "shareCode": "9m0XcgGVbMqSszE8", "subType": "GHavj7AorKsxwkos", "tags": ["AVerXpc1C8XfwHuK", "eb9l3rGN9A3sNm84", "hddSpHt0P7MIIR7C"], "type": "kyF6C7duuyZ0GhDo"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'gqrhBRd8lDR6qVNP' \
    --contentId 'RZYdFLIAjGGJddVC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vu9vx5KQ7KYnIuMB", "customAttributes": {"vaO35llzQRaT5kPx": {}, "UfofvnnSuB0y5WUl": {}, "rMdI4sNveabntBSx": {}}, "fileExtension": "TeIv53HGCiljvjKo", "name": "yD6SCwGrncqmLtjQ", "payload": "HAf8TgoNm03VLisV", "preview": "6zwPuo3td6TC6I3l", "previewMetadata": {"previewContentType": "MjGSWN2laRlxfcjH", "previewFileExtension": "fYakUCTqGkE7wcWf"}, "subType": "DslpJSqGAXQ0yYoN", "tags": ["RKd3IL5TAQ6iiPlS", "C2uE4o5Vwdo3fePq", "IJA8IHtrkmu0hpDD"], "type": "WVAla2l5BYNtIuS5", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'djsoqwGyzzWi9gwQ' \
    --namespace "$AB_NAMESPACE" \
    --creator 'Yv7t1o7TTr1DmrhZ' \
    --isofficial 'v15T7quIOvBMcaYm' \
    --limit '44' \
    --name 't0zYoMcHyCUEXlAv' \
    --offset '48' \
    --orderby 'oxozr6wfNPX2bOIt' \
    --sortby 'RMvqtlB2jJCSQT27' \
    --subtype '9ZZPYGu0rdlgdWyO' \
    --tags 'tXi3choQrpOsDBU5,SepjChB3V0v52Dly,m6puQ23xoJ8aeCna' \
    --type 'LpUKp44YUDjasWIP' \
    --userId 'UvmEejtGeoyIPa8Z' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Rrvjj7il35MXbN9o' \
    --contentId 'CMNqq98SjTvhZNkS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["X3ateEKDpADz1x3p", "oD3Qgb3boLQQ1MzH", "7Qm8bwbmXgdAPh1E"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'ThG96gAFKK2WDgCc' \
    --isofficial 'xvONZm3EeERmDnye' \
    --limit '65' \
    --name 'lmVr9XuoJbRFQSKV' \
    --offset '85' \
    --orderby 'Tb3g7mSQUhAEtrmj' \
    --sortby 'qU6YE3p4lSck0ZHn' \
    --subtype '5GI39YBHqaTHeKtW' \
    --tags '18iGeUlc9d9sogWa,24CKNS0GqVvUfHQv,sHXNUNe4mhgo5QB6' \
    --type '5lSAiYnNjkfZrQvG' \
    --userId 'gbLdLsFzHkBMr1yr' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OMlNFSrUEirnjX9f' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'DmIbeZxzfTcyiuAT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'us9hsfpFDcSDG8aM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'VGLiBNrDjqoxcwgG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "LXpUL4pp2ncYAHdN", "screenshotId": "zDmeIP6rOvDz9KOs"}, {"description": "b392k6YmJFfRByjl", "screenshotId": "BiuFM3FIoVk8T3Gp"}, {"description": "AnkCmBUqg2SCnqnt", "screenshotId": "X9y1aZSWMiVi10sG"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '6vxkfUcmqRRbceJ5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "i0EeDxOgBnhhqElI", "description": "aDml48wdNFLTm5T5", "fileExtension": "jpg"}, {"contentType": "vQR3biBfsu4jmsRE", "description": "2w1yEkLgh3tIYt4S", "fileExtension": "jpeg"}, {"contentType": "Ll4XlbGL8QOxtjzm", "description": "8y2wNhmwoYZyI4EF", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'KBcYrCEAE7WIsfmx' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '40NLRc6m8heKnWhz' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["z3LNUj7fdgLA84Z8", "YYk6QEgJjBbEDoNf", "3n0hEoRCAcf80zfF"], "name": "yabWAgIUXiI07A68"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'eaqC2J9jyEW6GLbc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '0NaKDUL3sa13lk1d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["QBHO86IlBhnetU4R", "wTqUXlTDBzOuYsaZ", "A2yyd4mbqoOfADMM"], "name": "AXFaY9eKa699bRVh"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'yaKwwrAP2aMlu7Wt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'jCtoYetOO847g8Ou' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "cTtFWbotQyXJRcQW"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'smqPNs92epxk0i8V' \
    --body '{"tag": "xsZNereSvf9699mC"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'EHThUJkETAsSp7gh' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["db4rbkXj0ZwsVC0g", "L97ZVJSPqJiwv1ql", "YB1RSKs6gQxC3Gb7"], "type": "S0o4zGYY7KQI1AeF"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'gPqaOkvo1aolB4lk' \
    --body '{"subtype": ["KB4EYOkQ1jMD3cym", "8xIfkOVW2grREOLx", "0KOww3HICQLfl7MU"], "type": "BG7qtPu64yAtURKL"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Rkb738HGS6rDgMdI' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'IlhS1fSiM9331m7T' \
    --limit '1' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'PsKc50Kv6ecnEevc' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'Ax2K2zkRenmPZnGB' \
    --namespace "$AB_NAMESPACE" \
    --userId 't4P7WnbdSJtjX7Zs' \
    --body '{"name": "hZyZl5x4bRXBHUTr"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'DzZSKscfOcYu3dpC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ROYqUiGKXVFCmpo6' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'sPwVOEDSJsEK5QpN' \
    --contentId 'hlI2iS5EpGhhvXYc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k0upMzUYnb76tFkE' \
    --body '{"contentType": "ORV3bu1bNCtX7W40", "customAttributes": {"V6Do5sYadCCFrHHC": {}, "3DpZxkrQDXuNFviM": {}, "arv8mnfHK8CCmE2l": {}}, "fileExtension": "PnsbD3SGEdlwuUcc", "name": "E536ugBp3HBvepnD", "payload": "CjgyJlXe36mgWjLf", "preview": "Fmteue9nzJ6fH24T", "previewMetadata": {"previewContentType": "805tVg8JqU0jZpjv", "previewFileExtension": "sugAOS7u8RiWyerC"}, "subType": "Sa8SRgwsAj1ik1jg", "tags": ["laDXTvKCWwNTAhd2", "wrS0uPdjhdinpng5", "BLy8wbhMssAHjapI"], "type": "kY9Rf4wP57dBZNR8", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'YbCtmKy8M9zVrjfG' \
    --contentId 'XZnqAQUoY1GjlIIk' \
    --namespace "$AB_NAMESPACE" \
    --userId '0iKoTTS1j02o7JjT' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'XAQN0qdskdQV0TqI' \
    --limit '9' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'aKQDOJvrTefglSs6' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'g4iY9u02aCNYIWek' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p18lOC3mNqF7Bl0L' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'a9EIIlGcHB3CfR3n' \
    --limit '4' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dlwi3v3MFFJ1KesK' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'oELCpobBEG8X645x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pdXpai0rYaT5hOPj' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'af3H0tYighU0VUfc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YHJbBfAKSiPW3Vgs' \
    --body '{"contents": ["ZXiR1DJ7HVWqMkNS", "awQUWDFJvJBWic7U", "kBeIXuqDuAXI66bQ"], "name": "71w0deoV9Lx5RDA1"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'l2XcrciYNEzvSZIP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'khSgORcz5S5BvmgB' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'Lxh4ijFnE3Tam69q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZ7PC6f6QkmZXElW' \
    --limit '77' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'uWJu3pDMUAeeZ97S' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'BROPYuG6XqP6oo7G' \
    --namespace "$AB_NAMESPACE" \
    --creator '73zdxTgOfnwIdlNa' \
    --isofficial '29fDLh741IslKHzG' \
    --limit '24' \
    --name '34sZKHcl5LLLOexL' \
    --offset '51' \
    --orderby 'fZvWtND2tcBFpX8l' \
    --sortby 'NtFEJ7tnkY6Mca5a' \
    --subtype 'fj12K2IzrBvvWm4u' \
    --tags 'dE0OXudXgNne8kJA,Twlc6esUp6Sw1I98,jeZQ7hfxnhLd3Kna' \
    --type 'knoed9DHhLOqQGhC' \
    --userId 'Ur6iTrjyEgarAdNJ' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'OIG36I6tRbRcrEve' \
    --isofficial 'MdAdiPKDUVSC00PY' \
    --limit '9' \
    --name 'oujQD4IEiH9Z5qXn' \
    --offset '8' \
    --orderby 'aoRtlqOECohViHA5' \
    --sortby 'CzgFSy8X1A3PrIfa' \
    --subtype 'pq5AAeMe4L3mDWOR' \
    --tags 'BVXTIIJM9XsYIIZx,iXNMR9BgaWcFX3SU,BhyoTsMWPAxUMkaw' \
    --type 'aGpAyrIwMif3BOdk' \
    --userId 'ocVTd4BxqGWV6mTJ' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["0sQs6XNbjvqhnUVL", "Wu8olKdxL6ozRmDD", "0jJvlfV5OemPYdYT"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '67' \
    --name 'ROCjtuzFMbAG9YI8' \
    --offset '83' \
    --orderby 'hmguB8FOTjMLo4b9' \
    --sortby 'rIzqYkEpstyVTBcr' \
    --subtype 'M8rG0rH0zcswwVeM' \
    --tags 'K6MbGIVIu8vvwLc7,KY3uVoJXTIMtpgki,eDyF97lGdMiHKxbW' \
    --type 'CYzo8yO2KTK9tmmO' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nYnOpas6ghP1y4Zi' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '7s7QBlk44Z44B1GZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'gKg4uKxaCgcGLuC3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'brWdTYCfHkIySok5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'eE9LN9bvhOrHflIO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '35' \
    --orderby 'iLvtEk4mTIpUA9gx' \
    --sortby 'o8SV38nEhoXmM2W7' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '6jHMA2rG3nakopAy' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'welu01nryEJ0NqoT' \
    --limit '30' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'w0qiOiC4j0iktm0Z' \
    --body '{"name": "PLkLOsp0LZ5njN86"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hl8kUXzt6bSc6bWv' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'gpVyW9dD1kOmvrAe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jcq2LgkQuaS7RBx3' \
    --body '{"name": "vim02jBOxrZDyvpc"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'LYOWA8NjxOnaEok4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nOOCzfsflhjbngJO' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'Un18G5MlfDTk8aG4' \
    --namespace "$AB_NAMESPACE" \
    --userId '0NlncceIZSwgAIkg' \
    --body '{"contentType": "zh4pTU0Am4DZhl0b", "customAttributes": {"QxFJ3sWCqQpQ2FbK": {}, "PFMycMSQ4qfAacR0": {}, "LgB5BUXvjcu2s6w3": {}}, "fileExtension": "VifnKqmTSoGH1XEf", "name": "Y6QAYn6WQ5UBEU1Q", "preview": "AOHfZiGhxOdcuDXS", "previewMetadata": {"previewContentType": "xSc3aZPV87pna08g", "previewFileExtension": "xefTYKhuxaEc7M4P"}, "subType": "7UckSC6ePeN8i4Gr", "tags": ["FES9z7xueHpATHcc", "ee9GXhKcjmSEwdrk", "EnnqKzFsLfYalUlf"], "type": "wEQKjU7eHGebSVu0"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'LQ40kepEaC4dfiOM' \
    --contentId 'ZfEhHr39pysFO3Zv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1BZG99LyvfvHEsJ' \
    --body '{"contentType": "KQQewVLMUoAnaRcY", "customAttributes": {"p7FUjfIGaffoflEI": {}, "ByYqeKN0meGelYF5": {}, "wWaDhukU4khGG4vZ": {}}, "fileExtension": "FTYnPkmSu4PWam1j", "name": "xR7SETWjteoc8fgv", "payload": "ZDDhoO05oKqymxLD", "preview": "1Lcvw6T6mZEiwxxE", "previewMetadata": {"previewContentType": "lpMYSWIeVzm7z9no", "previewFileExtension": "owmlTIKVowi0RY2V"}, "subType": "N4ZONJREdUQ3z9F1", "tags": ["BxNNgnke4akncw7w", "u9TmXfJWBPrx9Ns8", "eLzYEvwSWTaLQjct"], "type": "vrK2jhsYpKPlXn77", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'MKtezapPr2QEPx3z' \
    --contentId 'TxBGtEJIYppuUSsK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHw2hyd12uSE7BEv' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '3aevq6iohU1cg4W1' \
    --limit '70' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'S3Uv1BpWoJBaqdg2' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'FHcunsS1lnaO2m9v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjhbeK2qN8g6x2Py' \
    --body '{"screenshots": [{"description": "YDo5R3hLiD5sf5y1", "screenshotId": "JsxJNGmyt0SQDUDo"}, {"description": "WBZVGLlkUetzCAWc", "screenshotId": "9x1aMjgGim51T107"}, {"description": "XIZRZ7tZdIs0xf4c", "screenshotId": "zdt7zqmSKxOEQlVc"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'x6GqsBq8vdhWVnuY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LgpZehK0G2nmyuVi' \
    --body '{"screenshots": [{"contentType": "B9kRTcSQdTnNYGeA", "description": "fYFG3wSkHKufBdS3", "fileExtension": "jfif"}, {"contentType": "OokZB4cXnAXyuGz6", "description": "LlxHv8SwyagYvDJ3", "fileExtension": "jpeg"}, {"contentType": "NnTn3rzH5NvAtcvN", "description": "edgS1fUfKmihDbmu", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'ePWlQMVDXEHeiGTn' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'wyEw6hIWDZrpP7rz' \
    --userId '3ISW510kHr4isTKW' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'jmv67nuHCXWfwnwG' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'E9sJ4NpUtKp6M9I6' \
    --limit '27' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwnZhsjwJeGwaPSD' \
    --limit '80' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zz95OYKiqaZD63xe' \
    --limit '58' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSMzpqIFGLkDs7AC' \
    --body '{"contents": ["C1RgBfoNrHlFi2qJ", "LgmBLE35YhyiDV90", "SeI5yppBHoytVznC"], "name": "gNyx9fbT63ShEh8P"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'bGikLjgjcj34uulU' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '6FYBZsWFbr3RSP0W' \
    --namespace "$AB_NAMESPACE" \
    --userId '9nBhvhf8Q0DtJMcY' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'QdN66bswAgt65X4N' \
    --namespace "$AB_NAMESPACE" \
    --userId '1LQZmB61JMdtwCVU' \
    --body '{"contents": ["rYQue84dwmbwFEnA", "ZaWsQJtRYoagRJK5", "PX9UcOvhPyE11TRT"], "name": "2SKseoe8VLie0LBa"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '36KNzjf005CXNGeh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q2aTjTDfKFDXC7eG' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'L5YhJDWh9YWqc0qg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V6d9yOfIMLds2DbP' \
    --limit '5' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'aoMdtRLTmSvTkQQg' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE