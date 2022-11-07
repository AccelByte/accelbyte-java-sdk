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
    --limit '85' \
    --offset '66' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "8tBQETKV", "defaultLanguage": "3ydvPdED", "description": {"UBvFx9lj": "hCNTZa2u", "nzMTzx8C": "AItXhWyr", "zzfDTYy8": "3lyNW4to"}, "goalValue": 0.8572322590873351, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "e31jBeME", "url": "mYaTUGmH"}, {"slug": "tJegFazU", "url": "ohPICSUA"}, {"slug": "JGbRP7Tb", "url": "iwWmnm56"}], "name": {"KebX3YCI": "RvahT1Gv", "aiqHer5a": "fp75CdHr", "23ANa7mv": "l0vhKRgu"}, "statCode": "aRtv1eJ3", "tags": ["biMXGLoX", "WaIKDuYo", "A5uC1OAN"], "unlockedIcons": [{"slug": "lfUNe0Qx", "url": "VNyd0peG"}, {"slug": "eYNQb5L6", "url": "s1FaHJuX"}, {"slug": "IO4BzQQs", "url": "9rvx12Y0"}]}' \
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
    --strategy 'mgaHIRDY' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'YVygDH8B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'qohJk9xQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "pPbHybmh", "description": {"C7dRaMoW": "oUPa627X", "Wx3e29pi": "iRl10bsV", "2VBpNbZb": "5oBSJmyB"}, "goalValue": 0.624229428168658, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "B07eMxSm", "url": "ZKKT5iZX"}, {"slug": "uQYOGbxN", "url": "0YWYnKS0"}, {"slug": "NLi2Ixkb", "url": "kjGcfcth"}], "name": {"1EwaG3AJ": "ymEXoLU1", "AxABvsGR": "6TZVFfuq", "P8tE5Bxv": "LnNzx3oK"}, "statCode": "67sfwO2K", "tags": ["dIYNjK8B", "oqy9WyC9", "0Yu90qUy"], "unlockedIcons": [{"slug": "yUuRh6e0", "url": "G4xl7qNm"}, {"slug": "1kXJ9lZk", "url": "LBudvShi"}, {"slug": "9xeBLbiv", "url": "HnCFC659"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'IXIGYxsS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '0S6QLPRu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 54}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'h7kdwFZB' \
    --limit '56' \
    --offset '63' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'QqjM8eEK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qdWRu0is' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'CviNads2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKSckIrc' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '38' \
    --sortBy 'createdAt:desc' \
    --language 'dej7WHx3' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'SQmU6lXz' \
    --namespace "$AB_NAMESPACE" \
    --language 'Dmx3AWjK' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'O4xVlaZD' \
    --limit '95' \
    --offset '82' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'Dqe40z2Y' \
    --namespace "$AB_NAMESPACE" \
    --userId '4GnsdzR8' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE