#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..15"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListAchievements
java -jar "${CLI_JAR}" achievement adminListAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
java -jar "${CLI_JAR}" achievement adminCreateNewAchievement \
    --body '{"achievementCode": "FtBxyZcD", "defaultLanguage": "XBpGlsQu", "description": {"Ju8vMf0I": "sJkTrd8I"}, "goalValue": 0.46848625686278056, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "XnTKjXY1", "url": "bPqamiBx"}], "name": {"x9Cs18EY": "84ekItqR"}, "statCode": "zHU1oh57", "tags": ["0KQBVaew"], "unlockedIcons": [{"slug": "c72krSha", "url": "68n3Ynoz"}]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
java -jar "${CLI_JAR}" achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
java -jar "${CLI_JAR}" achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
java -jar "${CLI_JAR}" achievement adminGetAchievement \
    --achievementCode 'p1C2KmIQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
java -jar "${CLI_JAR}" achievement adminUpdateAchievement \
    --body '{"defaultLanguage": "TuBdNEUs", "description": {"xFb8CJ17": "M7DJZaMS"}, "goalValue": 0.3723261689885863, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "Zbygyoar", "url": "ORoeNHSb"}], "name": {"8Rh3kgs9": "qqJbnQso"}, "statCode": "BgiVpP8C", "tags": ["m3yvASUo"], "unlockedIcons": [{"slug": "xdxxFqmA", "url": "GTJ8IEda"}]}' \
    --achievementCode 'gEtp4w29' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
java -jar "${CLI_JAR}" achievement adminDeleteAchievement \
    --achievementCode 'KOu9c19R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
java -jar "${CLI_JAR}" achievement adminUpdateAchievementListOrder \
    --body '{"targetOrder": 98}' \
    --achievementCode 'DqWHkkP8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
java -jar "${CLI_JAR}" achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'npLEKMfj' \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminUnlockAchievement
java -jar "${CLI_JAR}" achievement adminUnlockAchievement \
    --achievementCode 'iX7jpkVZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k3IaQYEm' \
    > test.out 2>&1
eval_tap $? 11 'AdminUnlockAchievement' test.out

#- 12 PublicListAchievements
java -jar "${CLI_JAR}" achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --language 'qGodOEGt' \
    > test.out 2>&1
eval_tap $? 12 'PublicListAchievements' test.out

#- 13 PublicGetAchievement
java -jar "${CLI_JAR}" achievement publicGetAchievement \
    --achievementCode '9gPOj0c6' \
    --namespace "$AB_NAMESPACE" \
    --language 'i0JkvIas' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetAchievement' test.out

#- 14 PublicListUserAchievements
java -jar "${CLI_JAR}" achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '73ucYnFA' \
    > test.out 2>&1
eval_tap $? 14 'PublicListUserAchievements' test.out

#- 15 PublicUnlockAchievement
java -jar "${CLI_JAR}" achievement publicUnlockAchievement \
    --achievementCode 'J3DK5T4E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogg0Y39U' \
    > test.out 2>&1
eval_tap $? 15 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE