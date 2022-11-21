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
    --limit '88' \
    --offset '34' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "yV5z42no", "defaultLanguage": "FFQR4N6f", "description": {"9nGPQWv7": "RSKn0jID", "pti1ZqCj": "0STdZzCZ", "PeA2OZd7": "LBxRVr84"}, "goalValue": 0.9601152368191567, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "GyZLqyQ7", "url": "C4WKlMEb"}, {"slug": "RXPQLlLT", "url": "90TYHl91"}, {"slug": "WTB2H8GU", "url": "pFgycFQO"}], "name": {"EhfUPiMA": "JKg3bznW", "sZoGXXEm": "2v2khbPX", "u9ip89tH": "pOPF5xuT"}, "statCode": "pTKrdV20", "tags": ["g10cQY6T", "nssY6Gc1", "acKuUknv"], "unlockedIcons": [{"slug": "mDAmCbm0", "url": "tjMOuxpu"}, {"slug": "EeZ6iL7n", "url": "wMPOrEVy"}, {"slug": "loWgDsFi", "url": "kvak3BbZ"}]}' \
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
    --strategy 'rTQgGbLs' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'IwzdNtKQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'tquESw9P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "blChlmAn", "description": {"mDDh0D6u": "yaIkq2Tn", "kV5I5Zt1": "320tBoS2", "mrX1tqSa": "m1GqpLeT"}, "goalValue": 0.42243872985327535, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "i1gXSIgN", "url": "SAo1g5T0"}, {"slug": "LQklI14r", "url": "4CjXsqsv"}, {"slug": "CxjPjXd9", "url": "HyU1wVuh"}], "name": {"RKZE3Cop": "nVgIDfYV", "KpWhTFn2": "ZMuwHSKe", "CzD1XkYf": "4HPsRO7m"}, "statCode": "aC0X1kBR", "tags": ["8XUintaS", "V6vrZueh", "snsnQ1OJ"], "unlockedIcons": [{"slug": "y6Xlt9J5", "url": "2xg086XZ"}, {"slug": "Upg2Cw6N", "url": "T9CryePS"}, {"slug": "wjXsRptI", "url": "eKrIWn26"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'OtOLcgJ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'E9QB9RmF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 67}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'belqHUmn' \
    --limit '38' \
    --offset '45' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '37CnOBWu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rhct5bZi' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode '0go3MvvM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6jSXz3y' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '3' \
    --sortBy 'updatedAt:asc' \
    --language 'KU7m60pl' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '926oVf20' \
    --namespace "$AB_NAMESPACE" \
    --language 'TnYSj3eY' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QxUdsM0m' \
    --limit '78' \
    --offset '22' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'B3DwQGyx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DV51SL12' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE