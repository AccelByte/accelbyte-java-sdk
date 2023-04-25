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
    --body '{"contentType": "vu9vx5KQ7KYnIuMB", "customAttributes": {"vaO35llzQRaT5kPx": {}, "UfofvnnSuB0y5WUl": {}, "rMdI4sNveabntBSx": {}}, "fileExtension": "TeIv53HGCiljvjKo", "name": "yD6SCwGrncqmLtjQ", "payload": "HAf8TgoNm03VLisV", "preview": "6zwPuo3td6TC6I3l", "previewMetadata": {"previewContentType": "MjGSWN2laRlxfcjH", "previewFileExtension": "fYakUCTqGkE7wcWf"}, "shareCode": "DslpJSqGAXQ0yYoN", "subType": "RKd3IL5TAQ6iiPlS", "tags": ["C2uE4o5Vwdo3fePq", "IJA8IHtrkmu0hpDD", "WVAla2l5BYNtIuS5"], "type": "S5XUdjsoqwGyzzWi", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'PEqgA8yu7Vk6Jt4Y' \
    --namespace "$AB_NAMESPACE" \
    --creator 'mos9Jcdos4fYcTVU' \
    --isofficial '6RBt0zYoMcHyCUEX' \
    --limit '24' \
    --name 'maLoxozr6wfNPX2b' \
    --offset '84' \
    --orderby 'W5NyLu0M3VHh2EI8' \
    --sortby 'JlDbPWbQ6Q9lNmqR' \
    --subtype 'BaAkLnvxkT1X68cm' \
    --tags 'Dc3fxU8MyKrQpM4h,kkK6KKXNB3Gv0Iqm,F51TkhjYnaq6foWv' \
    --type 'Xa3bMrXsDr6kILsS' \
    --userId 'SyDdmykmoPYgc2L4' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'jk4Lo0LSP0pf4Ixj' \
    --contentId 'Ukl535X3ateEKDpA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["z1x3poD3Qgb3boLQ", "Q1MzH7Qm8bwbmXgd", "APh1EThG96gAFKK2"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'WDgCcxvONZm3EeER' \
    --isofficial 'mDnyeFoF7VSZ6pf3' \
    --limit '44' \
    --name 'FQSKVPHbn4Xxtu7L' \
    --offset '88' \
    --orderby 'EtrmjqU6YE3p4lSc' \
    --sortby 'k0ZHn5GI39YBHqaT' \
    --subtype 'HeKtW18iGeUlc9d9' \
    --tags 'sogWa24CKNS0GqVv,UfHQvsHXNUNe4mhg,o5QB65lSAiYnNjkf' \
    --type 'ZrQvGgbLdLsFzHkB' \
    --userId 'Mr1yrOMlNFSrUEir' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'njX9fDmIbeZxzfTc' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserContentByShareCode' test.out

#- 16 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'yiuATus9hsfpFDcS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetSpecificContent' test.out

#- 17 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'DG8aMVGLiBNrDjqo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDownloadContentPreview' test.out

#- 18 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'xcwgGLXpUL4pp2nc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "YAHdNzDmeIP6rOvD", "screenshotId": "z9KOsb392k6YmJFf"}, {"description": "RByjlBiuFM3FIoVk", "screenshotId": "8T3GpAnkCmBUqg2S"}, {"description": "CnqntX9y1aZSWMiV", "screenshotId": "i10sG6vxkfUcmqRR"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateScreenshots' test.out

#- 19 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'bceJ5i0EeDxOgBnh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "hqElIaDml48wdNFL", "description": "Tm5T50x9WT0GfH2r", "fileExtension": "jpeg"}, {"contentType": "4jmsRE2w1yEkLgh3", "description": "tIYt4SqYUTLDx9gI", "fileExtension": "jfif"}, {"contentType": "Oxtjzm8y2wNhmwoY", "description": "ZyI4EFZKBcYrCEAE", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUploadContentScreenshot' test.out

#- 20 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'WIsfmx40NLRc6m8h' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'eKnWhzfe2NubeoKF' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteContentScreenshot' test.out

#- 21 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 21 'SingleAdminGetAllGroups' test.out

#- 22 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["IaFQCYoDPICpnduE", "EQlULdJz4mnRBkMN", "xvvKgAT8mJrYq6hR"], "name": "kloqxM3gpwxcfMy9"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateGroup' test.out

#- 23 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'XzjjI5YbsKoADkzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'SingleAdminGetGroup' test.out

#- 24 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'EN2VHzih3bit0VWn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["3CO39PXDNxtXgeO3", "FgkXhjDzaQY3snn2", "ZkP7cFdP43e5dC9X"], "name": "IBudfZgrbHDIDm4h"}' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminUpdateGroup' test.out

#- 25 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'MzF4TxodenSrUTvf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'SingleAdminDeleteGroup' test.out

#- 26 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'qU0bfoMm5cTtFWbo' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroupContents' test.out

#- 27 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetTag' test.out

#- 28 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "6IjGa23YvYmmDg7V"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminCreateTag' test.out

#- 29 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'YPXIuvUYTZBRujIU' \
    --body '{"tag": "E1Tq5jyAZvkRCMNF"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateTag' test.out

#- 30 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Iurjh2imdb4rbkXj' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTag' test.out

#- 31 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetType' test.out

#- 32 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["wsVC0gL97ZVJSPqJ", "iwv1qlYB1RSKs6gQ", "xC3Gb7S0o4zGYY7K"], "type": "QI1AeFgPqaOkvo1a"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminCreateType' test.out

#- 33 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'olB4lkKB4EYOkQ1j' \
    --body '{"subtype": ["MD3cym8xIfkOVW2g", "rREOLx0KOww3HICQ", "Lfl7MUBG7qtPu64y"], "type": "AtURKLRkb738HGS6"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateType' test.out

#- 34 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'rDgMdIIlhS1fSiM9' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteType' test.out

#- 35 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '331m7Ta1PsKc50Kv' \
    --limit '67' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetChannel' test.out

#- 36 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cyomQoIXimBJehyx' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteAllUserChannels' test.out

#- 37 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'lNsjUgxBkF6wFPoJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQediogEhhM2rIiz' \
    --body '{"name": "GdKvOPdq5xrgxSmy"}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdateChannel' test.out

#- 38 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '1DN9LFkYW5DQyj4b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j5Ro2ogaKt2ujQSa' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteChannel' test.out

#- 39 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '3Zdb65UXmy0Zp6iI' \
    --contentId 'aTIKUkmkk9QM0NBM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9ORxpzwLR2AK6eX' \
    --body '{"contentType": "UGPJsw1fiP80G9Pc", "customAttributes": {"lxcft2ulIJzPyrVE": {}, "iOG4UcqsuGKHhMRW": {}, "LVd3DlhLuIpomM8s": {}}, "fileExtension": "m1MiaI1mX2tJoARt", "name": "dbBe7udsMrok0WvG", "payload": "YYnx4V709xbnGezK", "preview": "sDwG2omOR2nvYI9T", "previewMetadata": {"previewContentType": "VqJdvzcWbfUpaXp5", "previewFileExtension": "JMl5LL4bTxBmZjdr"}, "shareCode": "rIxsB0NRsB1fPqqR", "subType": "RulpqpymDkQhtrHW", "tags": ["wRVnwVBOqOHi8pWG", "d1juYhiqjRJOqB5F", "93zFQbJndUDpdONn"], "type": "eAczbBdHb2slt71B", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateContentS3' test.out

#- 40 AdminUpdateContentDirect
eval_tap 0 40 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 41 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'jlIIk0iKoTTS1j02' \
    --contentId 'o7JjTXAQN0qdskdQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0TqI8EFnmDbxIxi' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteContent' test.out

#- 42 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '4YKlONk2Q5Y4Jvai' \
    --limit '53' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetContent' test.out

#- 43 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiilatuUjjt9lIMG' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteAllUserContents' test.out

#- 44 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'ql5ElEa9EIIlGcHB' \
    --namespace "$AB_NAMESPACE" \
    --userId '3CfR3ncDlwi3v3MF' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 44 'AdminHideUserContent' test.out

#- 45 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'J1KesKoELCpobBEG' \
    --limit '77' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllGroups' test.out

#- 46 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '645xpdXpai0rYaT5' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteAllUserGroup' test.out

#- 47 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'hOPjaf3H0tYighU0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VUfcYHJbBfAKSiPW' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetGroup' test.out

#- 48 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '3VgsZXiR1DJ7HVWq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkNSawQUWDFJvJBW' \
    --body '{"contents": ["ic7UkBeIXuqDuAXI", "66bQ71w0deoV9Lx5", "RDA1l2XcrciYNEzv"], "name": "SZIPkhSgORcz5S5B"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUpdateGroup' test.out

#- 49 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'vmgBLxh4ijFnE3Ta' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm69qSZ7PC6f6QkmZ' \
    > test.out 2>&1
eval_tap $? 49 'AdminDeleteGroup' test.out

#- 50 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'XElW9YfRSse6AAz3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S4czz0QKFlAVmVLu' \
    --limit '85' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetGroupContents' test.out

#- 51 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '6oo7G73zdxTgOfnw' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserStates' test.out

#- 52 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'IdlNa29fDLh741Is' \
    --namespace "$AB_NAMESPACE" \
    --creator 'lKHzGlLKWUtDQs61' \
    --isofficial 'OQAoxyyQpRWCiiPD' \
    --limit '66' \
    --name 'BFpX8lNtFEJ7tnkY' \
    --offset '52' \
    --orderby 'Mca5afj12K2IzrBv' \
    --sortby 'vWm4udE0OXudXgNn' \
    --subtype 'e8kJATwlc6esUp6S' \
    --tags 'w1I98jeZQ7hfxnhL,d3Knaknoed9DHhLO,qQGhCUr6iTrjyEga' \
    --type 'rAdNJOIG36I6tRbR' \
    --userId 'crEveMdAdiPKDUVS' \
    > test.out 2>&1
eval_tap $? 52 'SearchChannelSpecificContent' test.out

#- 53 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'C00PYeDcagginxnF' \
    --isofficial 'Ina3yddcbsPheTH2' \
    --limit '15' \
    --name 'IUJNvYuGRUvpZaHC' \
    --offset '42' \
    --orderby 'PrIfapq5AAeMe4L3' \
    --sortby 'mDWORBVXTIIJM9Xs' \
    --subtype 'YIIZxiXNMR9BgaWc' \
    --tags 'FX3SUBhyoTsMWPAx,UMkawaGpAyrIwMif,3BOdkocVTd4BxqGW' \
    --type 'V6mTJ0sQs6XNbjvq' \
    --userId 'hnUVLWu8olKdxL6o' \
    > test.out 2>&1
eval_tap $? 53 'PublicSearchContent' test.out

#- 54 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["zRmDD0jJvlfV5Oem", "PYdYT7DROCjtuzFM", "bAG9YI89hmguB8FO"]}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGetContentBulk' test.out

#- 55 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 55 'GetFollowedContent' test.out

#- 56 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '20' \
    --name 'GRaoQomSJC4DdrKF' \
    --offset '49' \
    --orderby 'SUQPLG59e0k5ZtX6' \
    --sortby 'wK7PpUlcIW32iK7M' \
    --subtype 'Gt1ixY5rA1WoVeJI' \
    --tags 'ePF8ZrQzP4zvtdxd,bZUpd6FJtHJ1pyVw,yKQLY6FEO65Rb3z7' \
    --type 'CYLM8IlsHqffnrfs' \
    > test.out 2>&1
eval_tap $? 56 'GetLikedContent' test.out

#- 57 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'GlfPaZKBwa3Ddb60' \
    > test.out 2>&1
eval_tap $? 57 'PublicDownloadContentByShareCode' test.out

#- 58 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ufPpzwj1QGIFmlVf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDownloadContentByContentID' test.out

#- 59 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '4jvapseE9LN9bvhO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AddDownloadCount' test.out

#- 60 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'rHflIOd6X3viLvtE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateContentLikeStatus' test.out

#- 61 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'A6HX3RwrKt2ecozL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicDownloadContentPreview' test.out

#- 62 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 62 'GetTag' test.out

#- 63 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 63 'GetType' test.out

#- 64 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '13' \
    --orderby 'oXmM2W7l6jHMA2rG' \
    --sortby '3nakopAywelu01nr' \
    > test.out 2>&1
eval_tap $? 64 'PublicSearchCreator' test.out

#- 65 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 65 'GetFollowedUsers' test.out

#- 66 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJ0NqoTow0qiOiC4' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetCreator' test.out

#- 67 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0iktm0ZPLkLOsp0' \
    --limit '77' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 67 'GetChannels' test.out

#- 68 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z5njN86Hl8kUXzt6' \
    --body '{"name": "bSc6bWvgpVyW9dD1"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateChannel' test.out

#- 69 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'kOmvrAejcq2LgkQu' \
    > test.out 2>&1
eval_tap $? 69 'DeleteAllUserChannel' test.out

#- 70 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'aS7RBx3vim02jBOx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZDyvpcLYOWA8Njx' \
    --body '{"name": "OnaEok4nOOCzfsfl"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateChannel' test.out

#- 71 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'hjbngJOUn18G5Mlf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DTk8aG40NlncceIZ' \
    > test.out 2>&1
eval_tap $? 71 'DeleteChannel' test.out

#- 72 CreateContentDirect
eval_tap 0 72 'CreateContentDirect # SKIP deprecated' test.out

#- 73 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'SwgAIkgzh4pTU0Am' \
    --namespace "$AB_NAMESPACE" \
    --userId '4DZhl0bQxFJ3sWCq' \
    --body '{"contentType": "QpQ2FbKPFMycMSQ4", "customAttributes": {"qfAacR0LgB5BUXvj": {}, "cu2s6w3VifnKqmTS": {}, "oGH1XEfY6QAYn6WQ": {}}, "fileExtension": "5UBEU1QAOHfZiGhx", "name": "OdcuDXSxSc3aZPV8", "preview": "7pna08gxefTYKhux", "previewMetadata": {"previewContentType": "aEc7M4P7UckSC6eP", "previewFileExtension": "eN8i4GrFES9z7xue"}, "subType": "HpATHccee9GXhKcj", "tags": ["mSEwdrkEnnqKzFsL", "fYalUlfwEQKjU7eH", "GebSVu0LQ40kepEa"], "type": "C4dfiOMZfEhHr39p"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateContentS3' test.out

#- 74 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'ysFO3Zvc1BZG99Ly' \
    --contentId 'vfvHEsJKQQewVLMU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oAnaRcYp7FUjfIGa' \
    --body '{"contentType": "ffoflEIByYqeKN0m", "customAttributes": {"eGelYF5wWaDhukU4": {}, "khGG4vZFTYnPkmSu": {}, "4PWam1jxR7SETWjt": {}}, "fileExtension": "eoc8fgvZDDhoO05o", "name": "KqymxLD1Lcvw6T6m", "payload": "ZEiwxxElpMYSWIeV", "preview": "zm7z9noowmlTIKVo", "previewMetadata": {"previewContentType": "wi0RY2VN4ZONJREd", "previewFileExtension": "UQ3z9F1BxNNgnke4"}, "subType": "akncw7wu9TmXfJWB", "tags": ["Prx9Ns8eLzYEvwSW", "TaLQjctvrK2jhsYp", "KPlXn77AtYoFzLAA"], "type": "TPY8P8P3cfoivvQx", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateContentS3' test.out

#- 75 UpdateContentDirect
eval_tap 0 75 'UpdateContentDirect # SKIP deprecated' test.out

#- 76 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'ppuUSsKoHw2hyd12' \
    --contentId 'uSE7BEv3aevq6ioh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U1cg4W1IS3Uv1BpW' \
    > test.out 2>&1
eval_tap $? 76 'DeleteContent' test.out

#- 77 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJBaqdg2FHcunsS1' \
    --limit '24' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetUserContent' test.out

#- 78 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'TmSLyn50sigBVZxi' \
    > test.out 2>&1
eval_tap $? 78 'DeleteAllUserContents' test.out

#- 79 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'KdV57GvRyd9UuL02' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Le8HSCslsDd4M1F5' \
    --body '{"screenshots": [{"description": "qRIblS7Nz81GRazP", "screenshotId": "AANjfBoldFOyqA2c"}, {"description": "lJ5gEOaCgM6Yn6Ru", "screenshotId": "gbNEIpGBFUjOn5mM"}, {"description": "7k8nbLzvtCIW5ynM", "screenshotId": "KquUicAeIVXtoWAX"}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateScreenshots' test.out

#- 80 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'hMlW4tLqX7OICf5o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D1e6oI9FmYel0kOw' \
    --body '{"screenshots": [{"contentType": "72o8Zkgk0jS6rDWU", "description": "wfhKvrf2AaH4yCWr", "fileExtension": "pjp"}, {"contentType": "agYvDJ3w3UNgIGj2", "description": "jZtEYT8sIPSE1XXP", "fileExtension": "jpg"}, {"contentType": "mihDbmu8ePWlQMVD", "description": "XEHeiGTnwyEw6hIW", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 80 'UploadContentScreenshot' test.out

#- 81 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'Mwyo4nIRysQdbufX' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'jYnSoIFeouC2m38k' \
    --userId 'XrDZWlGVE9sJ4NpU' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContentScreenshot' test.out

#- 82 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'tKp6M9I6nEwnZhsj' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserFollowStatus' test.out

#- 83 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '3jtDYBo4FUTH7CGf' \
    --limit '75' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 83 'GetPublicFollowers' test.out

#- 84 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'SyxgRR1DiCqSMzpq' \
    --limit '70' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 84 'GetPublicFollowing' test.out

#- 85 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGLkDs7ACC1RgBfo' \
    --limit '81' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 85 'GetGroups' test.out

#- 86 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'rHlFi2qJLgmBLE35' \
    --body '{"contents": ["YhyiDV90SeI5yppB", "HoytVznCgNyx9fbT", "63ShEh8PbGikLjgj"], "name": "cj34uulU6FYBZsWF"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateGroup' test.out

#- 87 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'br3RSP0W9nBhvhf8' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserGroup' test.out

#- 88 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'Q0DtJMcYQdN66bsw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Agt65X4N1LQZmB61' \
    > test.out 2>&1
eval_tap $? 88 'GetGroup' test.out

#- 89 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'JMdtwCVUrYQue84d' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wmbwFEnAZaWsQJtR' \
    --body '{"contents": ["YoagRJK5PX9UcOvh", "PyE11TRT2SKseoe8", "VLie0LBa36KNzjf0"], "name": "05CXNGehQ2aTjTDf"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateGroup' test.out

#- 90 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'KFDXC7eGL5YhJDWh' \
    --namespace "$AB_NAMESPACE" \
    --userId '9YWqc0qgV6d9yOfI' \
    > test.out 2>&1
eval_tap $? 90 'DeleteGroup' test.out

#- 91 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'MLds2DbPcaoMdtRL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TmSvTkQQgB7exYvm' \
    --limit '69' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 91 'GetGroupContent' test.out

#- 92 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mxr5hPCJJztJBg0t' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE