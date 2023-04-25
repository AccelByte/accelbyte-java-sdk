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
echo "1..27"

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

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'b6z3LNUj7fdgLA84' \
    --offset '29' \
    --sortBy 'YYk6QEgJjBbEDoNf' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '3n0hEoRCAcf80zfF' \
    --limit '50' \
    --offset '0' \
    --preferUnlocked  \
    --sortBy 'mJrYq6hRkloqxM3g' \
    --tags 'pwxcfMy9XzjjI5Yb,sKoADkzJEN2VHzih,3bit0VWn3CO39PXD' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'NxtXgeO3FgkXhjDz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aQY3snn2ZkP7cFdP' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode '43e5dC9XIBudfZgr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bHDIDm4hMzF4Txod' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'enSrUTvfqU0bfoMm' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '5cTtFWbotQyXJRcQ' \
    --achievementCodes 'WsmqPNs92epxk0i8' \
    --limit '97' \
    --offset '96' \
    --sortBy 'xsZNereSvf9699mC' \
    --tags 'EHThUJkETAsSp7gh,4TeUTkOkAYfJB8AT,9t4Tv207Y2QD3oD5' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '11' \
    --offset '24' \
    --sortBy 'updatedAt:asc' \
    --tags 'B1RSKs6gQxC3Gb7S,0o4zGYY7KQI1AeFg,PqaOkvo1aolB4lkK' \
    --language 'B4EYOkQ1jMD3cym8' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'xIfkOVW2grREOLx0' \
    --namespace "$AB_NAMESPACE" \
    --language 'KOww3HICQLfl7MUB' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'G7qtPu64yAtURKLR' \
    --limit '21' \
    --offset '56' \
    --sortBy 'b738HGS6rDgMdIIl' \
    --status 'hS1fSiM9331m7Ta1' \
    --tags 'PsKc50Kv6ecnEevc,Ax2K2zkRenmPZnGB,t4P7WnbdSJtjX7Zs' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'hZyZl5x4bRXBHUTr' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '33' \
    --sortBy 'zZSKscfOcYu3dpCR' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --name 'W5DQyj4bj5Ro2oga' \
    --offset '75' \
    --sortBy 'wVOEDSJsEK5QpNhl' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'I2iS5EpGhhvXYck0' \
    --limit '41' \
    --offset '32' \
    --preferUnlocked  \
    --sortBy 'QM0NBMA9ORxpzwLR' \
    --tags '2AK6eXUGPJsw1fiP,80G9Pclxcft2ulIJ,zPyrVEiOG4UcqsuG' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'KHhMRWLVd3DlhLuI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pomM8sm1MiaI1mX2' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJoARtdbBe7udsMr' \
    --achievementCodes 'ok0WvGYYnx4V709x' \
    --limit '2' \
    --offset '42' \
    --sortBy 'nGezKsDwG2omOR2n' \
    --tags 'vYI9TVqJdvzcWbfU,paXp5JMl5LL4bTxB,mZjdrrIxsB0NRsB1' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'fPqqRRulpqpymDkQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'htrHWwRVnwVBOqOH' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE