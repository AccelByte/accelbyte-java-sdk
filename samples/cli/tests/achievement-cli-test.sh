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
echo "1..30"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '62' \
    --offset '39' \
    --sortBy 'updatedAt' \
    --tags 'wYCA9kPI6LZrkq6D,c09nIW0Oaiw9B0D7,eHpzSn3ZPUdc0qh4' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "n8mzZ0m8SAMTwE6I", "customAttributes": {"56IaRDBXxyaNoMR6": {}, "hkspInrAip6lyzSx": {}, "wElFHHdgs21Jub74": {}}, "defaultLanguage": "CUkNmKJfh5pUkHOD", "description": {"poMF78NY4YkHs1cn": "z1JSDgY1TXp38zsC", "TCrbCbPOyNQkT7Nv": "yE3cwyALczNIicXm", "7agSrjJW2OQNOs1P": "XhT5FvdiRilZ7oFg"}, "global": true, "goalValue": 0.588120824957986, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "R8dl0zRVW4EZG9m0", "url": "XcgGVbMqSszE8GHa"}, {"slug": "vj7AorKsxwkosAVe", "url": "rXpc1C8XfwHuKeb9"}, {"slug": "l3rGN9A3sNm84hdd", "url": "SpHt0P7MIIR7CkyF"}], "name": {"6C7duuyZ0GhDogqr": "hBRd8lDR6qVNPRZY", "dFLIAjGGJddVCvu9": "vx5KQ7KYnIuMBvaO", "35llzQRaT5kPxUfo": "fvnnSuB0y5WUlrMd"}, "statCode": "I4sNveabntBSxTeI", "tags": ["v53HGCiljvjKoyD6", "SCwGrncqmLtjQHAf", "8TgoNm03VLisV6zw"], "unlockedIcons": [{"slug": "Puo3td6TC6I3lMjG", "url": "SWN2laRlxfcjHfYa"}, {"slug": "kUCTqGkE7wcWfDsl", "url": "pJSqGAXQ0yYoNRKd"}, {"slug": "3IL5TAQ6iiPlSC2u", "url": "E4o5Vwdo3fePqIJA"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags '8IHtrkmu0hpDDWVA,la2l5BYNtIuS5S5X,UdjsoqwGyzzWi9gw' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'QYv7t1o7TTr1Dmrh' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'Zv15T7quIOvBMcaY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'mvCkGZ5dAgqxpBFm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"aLoxozr6wfNPX2bO": {}, "ItRMvqtlB2jJCSQT": {}, "279ZZPYGu0rdlgdW": {}}, "defaultLanguage": "yOtXi3choQrpOsDB", "description": {"U5SepjChB3V0v52D": "lym6puQ23xoJ8aeC", "naLpUKp44YUDjasW": "IPUvmEejtGeoyIPa", "8ZRrvjj7il35MXbN": "9oCMNqq98SjTvhZN"}, "global": false, "goalValue": 0.16350015789135897, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "X3ateEKDpADz1x3p", "url": "oD3Qgb3boLQQ1MzH"}, {"slug": "7Qm8bwbmXgdAPh1E", "url": "ThG96gAFKK2WDgCc"}, {"slug": "xvONZm3EeERmDnye", "url": "FoF7VSZ6pf3vneSD"}], "name": {"2Tb3g7mSQUhAEtrm": "jqU6YE3p4lSck0ZH", "n5GI39YBHqaTHeKt": "W18iGeUlc9d9sogW", "a24CKNS0GqVvUfHQ": "vsHXNUNe4mhgo5QB"}, "statCode": "65lSAiYnNjkfZrQv", "tags": ["GgbLdLsFzHkBMr1y", "rOMlNFSrUEirnjX9", "fDmIbeZxzfTcyiuA"], "unlockedIcons": [{"slug": "Tus9hsfpFDcSDG8a", "url": "MVGLiBNrDjqoxcwg"}, {"slug": "GLXpUL4pp2ncYAHd", "url": "NzDmeIP6rOvDz9KO"}, {"slug": "sb392k6YmJFfRByj", "url": "lBiuFM3FIoVk8T3G"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'pAnkCmBUqg2SCnqn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'tX9y1aZSWMiVi10s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 66}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'uPMMWH8Yb33T5UBJ' \
    --limit '59' \
    --offset '16' \
    --sortBy 'achievedAt:asc' \
    --status '0EeDxOgBnhhqElIa' \
    --tags 'Dml48wdNFLTm5T50,x9WT0GfH2rtOa4EX,sXzOXQAk4mqrxzTt' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'uLl4XlbGL8QOxtjz' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '67' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'y2wNhmwoYZyI4EFZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "KBcYrCEAE7WIsfmx", "eventData": {"eventName": "40NLRc6m8heKnWhz", "properties": {"fe2NubeoKFeIaFQC": {}, "YoDPICpnduEEQlUL": {}, "dJz4mnRBkMNxvvKg": {}}}, "eventId": "AT8mJrYq6hRkloqx", "version": "M3gpwxcfMy9XzjjI"}, {"dateTime": "5YbsKoADkzJEN2VH", "eventData": {"eventName": "zih3bit0VWn3CO39", "properties": {"PXDNxtXgeO3FgkXh": {}, "jDzaQY3snn2ZkP7c": {}, "FdP43e5dC9XIBudf": {}}}, "eventId": "ZgrbHDIDm4hMzF4T", "version": "xodenSrUTvfqU0bf"}, {"dateTime": "oMm5cTtFWbotQyXJ", "eventData": {"eventName": "RcQWsmqPNs92epxk", "properties": {"0i8VxsZNereSvf96": {}, "99mCEHThUJkETAsS": {}, "p7gh4TeUTkOkAYfJ": {}}}, "eventId": "B8AT9t4Tv207Y2QD", "version": "3oD5fLCr3OOlXVv8"}], "thirdPartyUserId": "ZGF7uYnGzpipNDig", "userId": "NJma1MbqqZtfNWql"}, {"events": [{"dateTime": "4nmwAft4gqkNNlWk", "eventData": {"eventName": "D9eOziYRFOn0jJLH", "properties": {"C9LxhvNXTwGBCtoh": {}, "Ltl9Zuhytm5UDrT6": {}, "QXCs5SPBbRPZTF6o": {}}}, "eventId": "QAXVG7tnsZg5QgXj", "version": "vyGJPN4eXbJE5Vs2"}, {"dateTime": "GcyomQoIXimBJehy", "eventData": {"eventName": "xlNsjUgxBkF6wFPo", "properties": {"JeQediogEhhM2rIi": {}, "zGdKvOPdq5xrgxSm": {}, "y1DN9LFkYW5DQyj4": {}}}, "eventId": "bj5Ro2ogaKt2ujQS", "version": "a3Zdb65UXmy0Zp6i"}, {"dateTime": "IaTIKUkmkk9QM0NB", "eventData": {"eventName": "MA9ORxpzwLR2AK6e", "properties": {"XUGPJsw1fiP80G9P": {}, "clxcft2ulIJzPyrV": {}, "EiOG4UcqsuGKHhMR": {}}}, "eventId": "WLVd3DlhLuIpomM8", "version": "sm1MiaI1mX2tJoAR"}], "thirdPartyUserId": "tdbBe7udsMrok0Wv", "userId": "GYYnx4V709xbnGez"}, {"events": [{"dateTime": "KsDwG2omOR2nvYI9", "eventData": {"eventName": "TVqJdvzcWbfUpaXp", "properties": {"5JMl5LL4bTxBmZjd": {}, "rrIxsB0NRsB1fPqq": {}, "RRulpqpymDkQhtrH": {}}}, "eventId": "WwRVnwVBOqOHi8pW", "version": "Gd1juYhiqjRJOqB5"}, {"dateTime": "F93zFQbJndUDpdON", "eventData": {"eventName": "neAczbBdHb2slt71", "properties": {"B1SmZp2JZp50CnPb": {}, "71ORYcmQbTU5JX8c": {}, "cLjMXJRk0eaKQDOJ": {}}}, "eventId": "vrTefglSs6g4iY9u", "version": "02aCNYIWekp18lOC"}, {"dateTime": "3mNqF7Bl0LcghVHf", "eventData": {"eventName": "PEspxwhRON0bc1eM", "properties": {"bEIjowLqc3ecjXJb": {}, "ZDKKoxLE1Y3Dymtj": {}, "3giPg4x4yiPX6ues": {}}}, "eventId": "1Hhhkg1yLVbLFzHE", "version": "P8cM4NTwr0KHaAsm"}], "thirdPartyUserId": "Tej52WKi6tArAURt", "userId": "9plCSVq8PdH6hJPU"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --name 'uqDuAXI66bQ71w0d' \
    --offset '8' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BWQi6BqPg4xr0lCa' \
    --limit '27' \
    --offset '5' \
    --preferUnlocked  \
    --sortBy 'createdAt:desc' \
    --tags 'UZGCHsZYoLfR1KtO,v7Zy0b65uvuKNuy0,ytZQ7M6Nzy1adnSK' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'OLFKx1dX4LuWJu3p' \
    --body '{"achievementCodes": ["DMUAeeZ97SBROPYu", "G6XqP6oo7G73zdxT", "gOfnwIdlNa29fDLh"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '741IslKHzGlLKWUt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DQs61OQAoxyyQpRW' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'CiiPDGQhNPEwiJCf' \
    --namespace "$AB_NAMESPACE" \
    --userId '2XJVrlzqQls1ozhL' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'VA3kE8jKvgatOEBM' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '70TdlNBJYOmpu1VC' \
    --achievementCodes 'arzBsV6xnZ5Jrzzj' \
    --limit '35' \
    --offset '16' \
    --sortBy 'contributedValue' \
    --tags 'fxnhLd3Knaknoed9,DHhLOqQGhCUr6iTr,jyEgarAdNJOIG36I' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '29' \
    --offset '40' \
    --sortBy 'listOrder' \
    --tags 'bRcrEveMdAdiPKDU,VSC00PYeDcagginx,nFIna3yddcbsPheT' \
    --language 'H26IUJNvYuGRUvpZ' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'aHCuESOiIZsMfB4Z' \
    --namespace "$AB_NAMESPACE" \
    --language 'H3mtgWgU4pCAKxeE' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '70CaunQNxot371W9' \
    --limit '67' \
    --offset '1' \
    --sortBy 'createdAt' \
    --status 'cFX3SUBhyoTsMWPA' \
    --tags 'xUMkawaGpAyrIwMi,f3BOdkocVTd4BxqG,WV6mTJ0sQs6XNbjv' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'qhnUVLWu8olKdxL6' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '58' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --name 'RmDD0jJvlfV5OemP' \
    --offset '6' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YT7DROCjtuzFMbAG' \
    --limit '23' \
    --offset '75' \
    --preferUnlocked  \
    --sortBy 'createdAt:asc' \
    --tags 'lpO2pqiXJF3WGRao,QomSJC4DdrKF7SUQ,PLG59e0k5ZtX6wK7' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'PpUlcIW32iK7MGt1' \
    --body '{"achievementCodes": ["ixY5rA1WoVeJIePF", "8ZrQzP4zvtdxdbZU", "pd6FJtHJ1pyVwyKQ"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'LY6FEO65Rb3z7CYL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8IlsHqffnrfsGlf' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'PaZKBwa3Ddb60ufP' \
    --achievementCodes 'pzwj1QGIFmlVf4jv' \
    --limit '1' \
    --offset '20' \
    --sortBy 'contributedValue:asc' \
    --tags '5DiXZtLW87rGysry,od3dNQrmsApRA6HX,3RwrKt2ecozL0TOg' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '54vCE48L5oLF6M4l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Na4JUMSHNgqRqCV7' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE