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
    --limit '20' \
    --offset '34' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "WBtc0tnZ", "defaultLanguage": "XxKS5VR6", "description": {"sfSXIc1q": "U1tt0OTa", "1jwUcb9e": "DktPUM4Q", "jlKwg8jA": "zBRiNTJt"}, "goalValue": 0.26230410284160643, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "RvKzD0oA", "url": "uhTfuXY1"}, {"slug": "Ada7J4dI", "url": "Q9GVrrLi"}, {"slug": "38EKGMNC", "url": "Ya2BrA1R"}], "name": {"vPX8OgNa": "fQm6LeI9", "WlGkNvht": "WiUnpcCH", "7pLg6WKy": "slDyr5tJ"}, "statCode": "Ofypelsy", "tags": ["EFX9uPZe", "VlzH61dQ", "bZJQnxyj"], "unlockedIcons": [{"slug": "OKydrQkU", "url": "kitS6Bkx"}, {"slug": "Cop5kOre", "url": "zcs9pdWj"}, {"slug": "LPD9NZDq", "url": "7wvhEVy2"}]}' \
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
    --strategy 'le333guN' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'ssxvLgM1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'fCqD5Lhu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "1j4vRGaJ", "description": {"UTBF2Waf": "PqDuaHrn", "31C7fQ7F": "cJ4uvz5l", "DlG9gjvU": "Y7xtqWGJ"}, "goalValue": 0.19188846994049424, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "jW7idHRk", "url": "NXEUFgqm"}, {"slug": "RjLN1joh", "url": "91aPbcw6"}, {"slug": "u863J90E", "url": "Q3GuUV9U"}], "name": {"2dXoWMVE": "kqtO2x4U", "stX4hGXC": "Pb6xwbRo", "3a3nHQLw": "HwciySAs"}, "statCode": "khhMquiS", "tags": ["baggNBa6", "8G2rWE3Q", "eo3EQ6Y6"], "unlockedIcons": [{"slug": "TLQ5Ljkj", "url": "davjrf7F"}, {"slug": "9sQgidLc", "url": "2oWwSGME"}, {"slug": "drwzYTp4", "url": "f9u1E3pR"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'nOq0YKKL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'U7zNDhkG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 3}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'wbv5CfZP' \
    --limit '13' \
    --offset '80' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 's9IzEKYC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xwxEN8J4' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'CsmRSybh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q1YGPCNL' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '59' \
    --sortBy 'updatedAt' \
    --language 'GfG8EoZ6' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'kCJ0mf6A' \
    --namespace "$AB_NAMESPACE" \
    --language 'umUq9msE' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'cqj8DoXW' \
    --limit '24' \
    --offset '25' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'zqd1bprf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vEKtEPWF' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE