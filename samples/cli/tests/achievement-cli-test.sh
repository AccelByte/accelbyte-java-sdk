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
echo "1..19"

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
    --offset '5' \
    --sortBy 'listOrder:desc' \
    --tags 'EW6je80Q,0a7ErsXB,Olx7ojdj' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "Pgb20AhC", "defaultLanguage": "FEmnyFn1", "description": {"MIhNg7Qf": "AJ64AP6n", "haRDOqKX": "DwpYobyv", "Ex6zprM3": "bT88CMcA"}, "goalValue": 0.3119455549259893, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "8kBonPOf", "url": "SnZFLbUk"}, {"slug": "ZEeDLd9G", "url": "KqQg3z8i"}, {"slug": "LrxAQSsU", "url": "JT6HONC8"}], "name": {"8jG1jOmk": "CIEgbJmo", "1IDkA0EK": "faYleCNL", "pwJFEGxq": "GwETwgDy"}, "statCode": "tfEqteUv", "tags": ["j8xP6gsN", "CnmYXKMB", "YC1HRvBi"], "unlockedIcons": [{"slug": "LAELg4mn", "url": "zVzvASOy"}, {"slug": "FDZG9Rt1", "url": "bre2Q71W"}, {"slug": "J4EeJf7K", "url": "evcg6kfI"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'ZBhoYYPR,9NOUJemi,Ddigtmqp' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '6KnmzLMa' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'ksNWHgUb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'VzmPXlYB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "YD0Z9ff7", "description": {"gtS84ZP0": "iggM9R9X", "Bl8J9d6n": "maGT8gQE", "Ux1cyxhk": "LsDOOZaz"}, "goalValue": 0.22425619103129402, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "o7GCc4Ys", "url": "6toVpaTM"}, {"slug": "IrUssXNR", "url": "Lyq0ZSou"}, {"slug": "dCvCqNSG", "url": "mzDHo1p4"}], "name": {"QBVTMcl7": "xsHVTS17", "rK2FpSzq": "9AQgwO60", "kk4inNkY": "heesRTy4"}, "statCode": "9i68Qhc5", "tags": ["bkbzKKeT", "DGSDEeSH", "LHtJLAnj"], "unlockedIcons": [{"slug": "yDyA7RTz", "url": "lmCjCuqA"}, {"slug": "fv5CnP4U", "url": "4fbjRxYI"}, {"slug": "yNvZzIgF", "url": "rJQIiZkc"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'g0P6tGQ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'jYzWBjgH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 26}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --name 'AAfIuu6b' \
    --offset '39' \
    --sortBy 's6CZhTAQ' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kuBk5uoC' \
    --limit '25' \
    --offset '85' \
    --preferUnlocked  \
    --sortBy 'WAPe4m8k' \
    --tags 'KZEIVYvL,QdbWWaV2,MnGKkKHD' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'YfYfFvPJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '22FLrT0A' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'R7k97Afj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RxZ7j276' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'olQNwXMn' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '95' \
    --sortBy 'createdAt' \
    --tags 'ctOmhWzb,i1go2YDN,MZuW7kon' \
    --language 'No5dS7C4' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'CxXyhehs' \
    --namespace "$AB_NAMESPACE" \
    --language 'Oy1C9R1j' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --name 'Qp5qMbVa' \
    --offset '26' \
    --sortBy 'HMRT19DE' \
    > test.out 2>&1
eval_tap $? 17 'PublicListTags' test.out

#- 18 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'oruI62xt' \
    --limit '50' \
    --offset '11' \
    --preferUnlocked  \
    --sortBy 'qUFXkfPC' \
    --tags 'liDueZXo,YJIICDIE,JOffwgnf' \
    > test.out 2>&1
eval_tap $? 18 'PublicListUserAchievements' test.out

#- 19 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'y1q5Z9gC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZxFIh1A' \
    > test.out 2>&1
eval_tap $? 19 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE