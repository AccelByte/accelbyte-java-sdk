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
    --tags 'wYCA9kPI,6LZrkq6D,c09nIW0O' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "aiw9B0D7", "defaultLanguage": "eHpzSn3Z", "description": {"PUdc0qh4": "n8mzZ0m8", "SAMTwE6I": "56IaRDBX", "xyaNoMR6": "hkspInrA"}, "global": false, "goalValue": 0.7433662805534847, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "1vRodwpz", "url": "S6DaDpv8"}, {"slug": "N7ZQVqGj", "url": "6oDLjWjk"}, {"slug": "Y1aXlFcD", "url": "tgOjchIu"}], "name": {"a5tWEIC3": "2ogW7olv", "bTgrhRTc": "PiSuL0Sl", "y6XM4OI1": "8mAQLnzj"}, "statCode": "Mf8GZ2WB", "tags": ["ZqxYG3aR", "EAu2D6QV", "KNCWP75T"], "unlockedIcons": [{"slug": "B0i7pKxR", "url": "8dl0zRVW"}, {"slug": "4EZG9m0X", "url": "cgGVbMqS"}, {"slug": "szE8GHav", "url": "j7AorKsx"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'wkosAVer,Xpc1C8Xf,wHuKeb9l' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '3rGN9A3s' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'Nm84hddS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'pHt0P7MI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "IR7CkyF6", "description": {"C7duuyZ0": "GhDogqrh", "BRd8lDR6": "qVNPRZYd", "FLIAjGGJ": "ddVCvu9v"}, "global": true, "goalValue": 0.7110037500722197, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "Q7KYnIuM", "url": "BvaO35ll"}, {"slug": "zQRaT5kP", "url": "xUfofvnn"}, {"slug": "SuB0y5WU", "url": "lrMdI4sN"}], "name": {"veabntBS": "xTeIv53H", "GCiljvjK": "oyD6SCwG", "rncqmLtj": "QHAf8Tgo"}, "statCode": "Nm03VLis", "tags": ["V6zwPuo3", "td6TC6I3", "lMjGSWN2"], "unlockedIcons": [{"slug": "laRlxfcj", "url": "HfYakUCT"}, {"slug": "qGkE7wcW", "url": "fDslpJSq"}, {"slug": "GAXQ0yYo", "url": "NRKd3IL5"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'TAQ6iiPl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'SC2uE4o5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 97}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '1ZBm3MqH' \
    --limit '4' \
    --offset '70' \
    --sortBy 'UmLZZbSq' \
    --status 'b8RwNmn9' \
    --tags 'HrNQy4uZ,AAiE0mit,9RGCCHYz' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'UOcEdscK' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '13' \
    --sortBy 'PEqgA8yu' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '7Vk6Jt4Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name 'hZv15T7q' \
    --offset '42' \
    --sortBy '4fYcTVU6' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RBt0zYoM' \
    --limit '4' \
    --offset '54' \
    --preferUnlocked  \
    --sortBy 'HyCUEXlA' \
    --tags 'vxJMdalw,SyliWMNW,5NyLu0M3' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'VHh2EI8J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lDbPWbQ6' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'Q9lNmqRB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aAkLnvxk' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1X68cmD' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'c3fxU8My' \
    --achievementCodes 'KrQpM4hk' \
    --limit '21' \
    --offset '50' \
    --sortBy 'K6KKXNB3' \
    --tags 'Gv0IqmF5,1TkhjYna,q6foWvXa' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '96' \
    --offset '3' \
    --sortBy 'createdAt:desc' \
    --tags 'MrXsDr6k,ILsSSyDd,mykmoPYg' \
    --language 'c2L4jk4L' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'o0LSP0pf' \
    --namespace "$AB_NAMESPACE" \
    --language '4IxjUkl5' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '35X3ateE' \
    --limit '75' \
    --offset '39' \
    --sortBy 'DpADz1x3' \
    --status 'poD3Qgb3' \
    --tags 'boLQQ1Mz,H7Qm8bwb,mXgdAPh1' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'EThG96gA' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '48' \
    --sortBy 'KK2WDgCc' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --name 'HrvqAThu' \
    --offset '45' \
    --sortBy 'ERmDnyeF' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'oF7VSZ6p' \
    --limit '11' \
    --offset '4' \
    --preferUnlocked  \
    --sortBy '3vneSD2T' \
    --tags 'b3g7mSQU,hAEtrmjq,U6YE3p4l' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'Sck0ZHn5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GI39YBHq' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'aTHeKtW1' \
    --achievementCodes '8iGeUlc9' \
    --limit '6' \
    --offset '32' \
    --sortBy '9sogWa24' \
    --tags 'CKNS0GqV,vUfHQvsH,XNUNe4mh' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'go5QB65l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SAiYnNjk' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE