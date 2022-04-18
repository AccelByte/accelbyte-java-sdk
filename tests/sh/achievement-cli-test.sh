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

echo "TAP version 13"
echo "1..15"

#- 1 Login
build/install/cli/bin/cli loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListAchievements
build/install/cli/bin/cli achievement adminListAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
build/install/cli/bin/cli achievement adminCreateNewAchievement \
    --body '{"achievementCode": "FtBxyZcD", "defaultLanguage": "XBpGlsQu", "description": {"Ju8vMf0I": "sJkTrd8I"}, "goalValue": 0.46848625686278056, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "XnTKjXY1", "url": "bPqamiBx"}], "name": {"x9Cs18EY": "84ekItqR"}, "statCode": "zHU1oh57", "tags": ["0KQBVaew"], "unlockedIcons": [{"slug": "c72krSha", "url": "68n3Ynoz"}]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
build/install/cli/bin/cli achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
build/install/cli/bin/cli achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
build/install/cli/bin/cli achievement adminGetAchievement \
    --achievementCode 'p1C2KmIQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
build/install/cli/bin/cli achievement adminUpdateAchievement \
    --body '{"defaultLanguage": "TuBdNEUs", "description": {"xFb8CJ17": "M7DJZaMS"}, "goalValue": 0.3723261689885863, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "Zbygyoar", "url": "ORoeNHSb"}], "name": {"8Rh3kgs9": "qqJbnQso"}, "statCode": "BgiVpP8C", "tags": ["m3yvASUo"], "unlockedIcons": [{"slug": "xdxxFqmA", "url": "GTJ8IEda"}]}' \
    --achievementCode 'gEtp4w29' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
build/install/cli/bin/cli achievement adminDeleteAchievement \
    --achievementCode 'KOu9c19R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
build/install/cli/bin/cli achievement adminUpdateAchievementListOrder \
    --body '{"targetOrder": 98}' \
    --achievementCode 'DqWHkkP8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
build/install/cli/bin/cli achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'npLEKMfj' \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminUnlockAchievement
build/install/cli/bin/cli achievement adminUnlockAchievement \
    --achievementCode 'iX7jpkVZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k3IaQYEm' \
    > test.out 2>&1
eval_tap $? 11 'AdminUnlockAchievement' test.out

#- 12 PublicListAchievements
build/install/cli/bin/cli achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --language 'qGodOEGt' \
    > test.out 2>&1
eval_tap $? 12 'PublicListAchievements' test.out

#- 13 PublicGetAchievement
build/install/cli/bin/cli achievement publicGetAchievement \
    --achievementCode '9gPOj0c6' \
    --namespace "$AB_NAMESPACE" \
    --language 'i0JkvIas' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetAchievement' test.out

#- 14 PublicListUserAchievements
build/install/cli/bin/cli achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '73ucYnFA' \
    > test.out 2>&1
eval_tap $? 14 'PublicListUserAchievements' test.out

#- 15 PublicUnlockAchievement
build/install/cli/bin/cli achievement publicUnlockAchievement \
    --achievementCode 'J3DK5T4E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogg0Y39U' \
    > test.out 2>&1
eval_tap $? 15 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE