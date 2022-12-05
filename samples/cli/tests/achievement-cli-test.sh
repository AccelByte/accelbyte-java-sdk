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
echo "1..16"

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
    --limit '75' \
    --offset '52' \
    --sortBy 'listOrder:asc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "gcgBGGco", "defaultLanguage": "kgT3uZ3x", "description": {"8YK9HYvB": "jix86jVE", "3anqHLiv": "VK3SoXMV", "AIYZjHnb": "xuAU6eFr"}, "goalValue": 0.768907569833197, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "umQk1pUy", "url": "JnEUBEGf"}, {"slug": "kIj7MLAT", "url": "8keQOAPv"}, {"slug": "0WzU3loQ", "url": "cnWG1qbS"}], "name": {"syvVQgrM": "rjIX7L0r", "ahlnXigR": "yIfWmHzW", "udIZZReH": "ndhvre27"}, "statCode": "iOM3yc5p", "tags": ["1N15uk02", "GGxVxqRP", "Qmbb2sqx"], "unlockedIcons": [{"slug": "CJPXIbha", "url": "GRF735Su"}, {"slug": "Tyi7ThTl", "url": "TeFgrcN9"}, {"slug": "mHGL0aE3", "url": "2bSwvIBD"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'IxfzaMrh' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 's8fTtowX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'b9CYn49f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "ahxe3JCR", "description": {"OqAI2kX2": "Y8ZOEtFi", "0e9vI1z3": "jpt3Opac", "xFQAvqtf": "nVtxvPvI"}, "goalValue": 0.8448324548985086, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "Zo7wJ543", "url": "nKZc7sZL"}, {"slug": "InF0zhqx", "url": "PVVVCNtR"}, {"slug": "OjfdFzOZ", "url": "DoUgl8PB"}], "name": {"fKJR1VMa": "Q0B9k9ja", "QKxBasDh": "ZeMaBVZ5", "1hucKn7r": "yOBBOhdx"}, "statCode": "4ja3PT2L", "tags": ["RweGhSFb", "n8jhKK1T", "MA2EnzwM"], "unlockedIcons": [{"slug": "1pheTOMT", "url": "TpmZ8NEk"}, {"slug": "bUMNqVX3", "url": "5oyH937U"}, {"slug": "3xxOOyDO", "url": "9NIvu58t"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'oX49joFD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '2pi4iNNV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 94}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ab02jUpy' \
    --limit '71' \
    --offset '8' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'RgJDjquS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cSEq4moD' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'k1naeWto' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJHUvjP2' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '79' \
    --sortBy 'listOrder' \
    --language 'YrZxtRfD' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'pii2plAx' \
    --namespace "$AB_NAMESPACE" \
    --language '0tH0eZHV' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipbjt1Ev' \
    --limit '86' \
    --offset '36' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'AUjaiY0p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'huTMopAq' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE