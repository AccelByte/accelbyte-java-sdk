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
    --limit '66' \
    --offset '18' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "KQGn6EnR", "defaultLanguage": "lY9XjAM3", "description": {"bQyRyx5W": "aEQVt74R", "apqqTuPl": "EmWGLR7H", "VYmUdQBA": "rJpIOMMW"}, "goalValue": 0.14044791060762596, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "X2vPkpep", "url": "WcxezvEB"}, {"slug": "VAYl60UL", "url": "huLPVFXT"}, {"slug": "c7E5BJuV", "url": "wcaIoWQi"}], "name": {"qh7MN5sq": "saAgOydj", "m85phoef": "cItgItMh", "5VVr2H88": "hnL9fmyZ"}, "statCode": "PX8wI0kU", "tags": ["bs5KAlvI", "5yAwWv4j", "ZSmXbZBZ"], "unlockedIcons": [{"slug": "YyNBT2b5", "url": "xejoAQgd"}, {"slug": "RNNV9HXy", "url": "q8orNWbO"}, {"slug": "sd9UyLk6", "url": "RzVuFYG5"}]}' \
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
    --strategy 'oIhXIR9e' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'JOuetEtz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'fwksXgub' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "N5LIxZIM", "description": {"PiK4mtmL": "edNFp6F3", "A7a0LSQr": "e89KrKFE", "5Gwq4VhF": "Gwqrc9Cf"}, "goalValue": 0.9540316818506807, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "XIvi9nnL", "url": "R14wYiMu"}, {"slug": "2gv0flGZ", "url": "Q9rgEc4T"}, {"slug": "AzKayhSp", "url": "mi9GLjUK"}], "name": {"5EJzS6CJ": "aMazSQnb", "8O6h1vYw": "JdxoyWbt", "wLaxhtr2": "RHRUze7Q"}, "statCode": "NRrFGg87", "tags": ["ElP7Lr67", "6F1RwXGA", "mPts8hbh"], "unlockedIcons": [{"slug": "qXTPRLFz", "url": "ZKgFb3rC"}, {"slug": "EP0yBgYU", "url": "lNhIk9NW"}, {"slug": "UUu6xkZ0", "url": "9yQeqJb0"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '8Rm89SSq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '9ZnLss9C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 25}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zVahsITT' \
    --limit '34' \
    --offset '15' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'Ht9WA3fS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eEb4Sv76' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'umbummgb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wma0fvFF' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '97' \
    --sortBy 'createdAt:asc' \
    --language 'cdmLu7H3' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'uYJvDBYv' \
    --namespace "$AB_NAMESPACE" \
    --language 'WiPl3zWy' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNjDHp5R' \
    --limit '40' \
    --offset '45' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'MQ6pbp5d' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWhPVVEM' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE