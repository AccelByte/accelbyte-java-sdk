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
echo "1..28"

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
    --sortBy 'jfcnLRfxeCSz9WEi' \
    --status '8KlloeH0JT1yduat' \
    --tags '2vQR3biBfsu4jmsR,E2w1yEkLgh3tIYt4,SqYUTLDx9gIiDand' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'pGT2t24aOMh5eC3I' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '65' \
    --sortBy 'eHSKLCa3xreNDUWe' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'hwH3q31A806DJgas' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "4b6z3LNUj7fdgLA8", "eventData": {"eventName": "4Z8YYk6QEgJjBbED", "properties": {"oNf3n0hEoRCAcf80": {}, "zfFyabWAgIUXiI07": {}, "A68eaqC2J9jyEW6G": {}}}, "eventId": "Lbc0NaKDUL3sa13l", "version": "k1dQBHO86IlBhnet"}, {"dateTime": "U4RwTqUXlTDBzOuY", "eventData": {"eventName": "saZA2yyd4mbqoOfA", "properties": {"DMMAXFaY9eKa699b": {}, "RVhyaKwwrAP2aMlu": {}, "7WtjCtoYetOO847g": {}}}, "eventId": "8OudOfjnCuHZ3c46", "version": "IjGa23YvYmmDg7VY"}, {"dateTime": "PXIuvUYTZBRujIUE", "eventData": {"eventName": "1Tq5jyAZvkRCMNFI", "properties": {"urjh2imdb4rbkXj0": {}, "ZwsVC0gL97ZVJSPq": {}, "Jiwv1qlYB1RSKs6g": {}}}, "eventId": "QxC3Gb7S0o4zGYY7", "version": "KQI1AeFgPqaOkvo1"}], "thirdPartyUserId": "aolB4lkKB4EYOkQ1", "userId": "jMD3cym8xIfkOVW2"}, {"events": [{"dateTime": "grREOLx0KOww3HIC", "eventData": {"eventName": "QLfl7MUBG7qtPu64", "properties": {"yAtURKLRkb738HGS": {}, "6rDgMdIIlhS1fSiM": {}, "9331m7Ta1PsKc50K": {}}}, "eventId": "v6ecnEevcAx2K2zk", "version": "RenmPZnGBt4P7Wnb"}, {"dateTime": "dSJtjX7ZshZyZl5x", "eventData": {"eventName": "4bRXBHUTrDzZSKsc", "properties": {"fOcYu3dpCROYqUiG": {}, "KXVFCmpo6sPwVOED": {}, "SJsEK5QpNhlI2iS5": {}}}, "eventId": "EpGhhvXYck0upMzU", "version": "Ynb76tFkEORV3bu1"}, {"dateTime": "bNCtX7W40V6Do5sY", "eventData": {"eventName": "adCCFrHHC3DpZxkr", "properties": {"QDXuNFviMarv8mnf": {}, "HK8CCmE2lPnsbD3S": {}, "GEdlwuUccE536ugB": {}}}, "eventId": "p3HBvepnDCjgyJlX", "version": "e36mgWjLfFmteue9"}], "thirdPartyUserId": "nzJ6fH24T805tVg8", "userId": "JqU0jZpjvsugAOS7"}, {"events": [{"dateTime": "u8RiWyerCSa8SRgw", "eventData": {"eventName": "sAj1ik1jglaDXTvK", "properties": {"CWwNTAhd2wrS0uPd": {}, "jhdinpng5BLy8wbh": {}, "MssAHjapIkY9Rf4w": {}}}, "eventId": "P57dBZNR88YbCtmK", "version": "y8M9zVrjfGXZnqAQ"}, {"dateTime": "UoY1GjlIIk0iKoTT", "eventData": {"eventName": "S1j02o7JjTXAQN0q", "properties": {"dskdQV0TqI8EFnmD": {}, "bxIxi4YKlONk2Q5Y": {}, "4JvaizwiilatuUjj": {}}}, "eventId": "t9lIMGql5ElEa9EI", "version": "IlGcHB3CfR3ncDlw"}, {"dateTime": "i3v3MFFJ1KesKoEL", "eventData": {"eventName": "CpobBEG8X645xpdX", "properties": {"pai0rYaT5hOPjaf3": {}, "H0tYighU0VUfcYHJ": {}, "bBfAKSiPW3VgsZXi": {}}}, "eventId": "R1DJ7HVWqMkNSawQ", "version": "UWDFJvJBWic7UkBe"}], "thirdPartyUserId": "IXuqDuAXI66bQ71w", "userId": "0deoV9Lx5RDA1l2X"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --name 'lCancUZGCHsZYoLf' \
    --offset '88' \
    --sortBy 'ORcz5S5BvmgBLxh4' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijFnE3Tam69qSZ7P' \
    --limit '58' \
    --offset '8' \
    --preferUnlocked  \
    --sortBy '6f6QkmZXElW9YfRS' \
    --tags 'se6AAz3S4czz0QKF,lAVmVLu4AOec0z8e,Beeoip68J1nsv4W2' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'OJhtafxMSJlHeb34' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZKHcl5LLLOexL4f' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'ZvWtND2tcBFpX8lN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tFEJ7tnkY6Mca5af' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'j12K2IzrBvvWm4ud' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0OXudXgNne8kJAT' \
    --achievementCodes 'wlc6esUp6Sw1I98j' \
    --limit '9' \
    --offset '52' \
    --sortBy 'ZQ7hfxnhLd3Knakn' \
    --tags 'oed9DHhLOqQGhCUr,6iTrjyEgarAdNJOI,G36I6tRbRcrEveMd' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '54' \
    --offset '87' \
    --sortBy 'listOrder' \
    --tags 'kETJyTlUrwDTnouj,QD4IEiH9Z5qXn3ao,RtlqOECohViHA5Cz' \
    --language 'gFSy8X1A3PrIfapq' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '5AAeMe4L3mDWORBV' \
    --namespace "$AB_NAMESPACE" \
    --language 'XTIIJM9XsYIIZxiX' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'NMR9BgaWcFX3SUBh' \
    --limit '50' \
    --offset '50' \
    --sortBy 'oTsMWPAxUMkawaGp' \
    --status 'AyrIwMif3BOdkocV' \
    --tags 'Td4BxqGWV6mTJ0sQ,s6XNbjvqhnUVLWu8,olKdxL6ozRmDD0jJ' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'vlfV5OemPYdYT7DR' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '32' \
    --sortBy 'CjtuzFMbAG9YI89h' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name 'pqiXJF3WGRaoQomS' \
    --offset '72' \
    --sortBy 'zqYkEpstyVTBcrM8' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rG0rH0zcswwVeMK6' \
    --limit '78' \
    --offset '70' \
    --preferUnlocked  \
    --sortBy 'bGIVIu8vvwLc7KY3' \
    --tags 'uVoJXTIMtpgkieDy,F97lGdMiHKxbWCYz,o8yO2KTK9tmmOnYn' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'Opas6ghP1y4Zi7s7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QBlk44Z44B1GZgKg' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '4uKxaCgcGLuC3brW' \
    --achievementCodes 'dTYCfHkIySok5DiX' \
    --limit '78' \
    --offset '39' \
    --sortBy 'N9bvhOrHflIOd6X3' \
    --tags 'viLvtEk4mTIpUA9g,xo8SV38nEhoXmM2W,7l6jHMA2rG3nakop' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'Aywelu01nryEJ0Nq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTow0qiOiC4j0ikt' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE