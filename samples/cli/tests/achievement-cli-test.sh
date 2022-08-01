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
echo "1..15"

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
    --limit '100' \
    --offset '81' \
    --sortBy 'listOrder:desc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "rIfkeiCa", "defaultLanguage": "AttNtU7Y", "description": {"c42k7Bb7": "etiqMqAA", "ATDmfCsv": "4um60vcb", "sQpNTt0T": "SaHjYnfw"}, "goalValue": 0.5840408741782234, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "tGQMnK7N", "url": "1cidzYwx"}, {"slug": "ba3wF6a4", "url": "Aq14IgpA"}, {"slug": "jgOqVrkt", "url": "h9j2XGUE"}], "name": {"Fu5RhNkB": "MLwO6RaC", "MylLG23c": "iWBmS2o8", "9D5QOfB6": "vbapzK2r"}, "statCode": "12Q1DTYH", "tags": ["PqpiMGSv", "s59tFTJQ", "I6TouISf"], "unlockedIcons": [{"slug": "vEvwhAV3", "url": "fWatcqQd"}, {"slug": "JJGbGhsD", "url": "pQQIjyBa"}, {"slug": "arq67aDQ", "url": "fYWe9wuy"}]}' \
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
    --strategy '6SYrTNGX' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'g4nY8qpY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'xj5TUud2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "nRC9LG97", "description": {"1FcSAit9": "n3Fh6VIG", "SWvtuPho": "jfGOgO1u", "Yiqs020d": "bl2nTwWx"}, "goalValue": 0.04664614880857765, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "zV50FEV8", "url": "lL05fq88"}, {"slug": "YWvo2unq", "url": "Q6ytD853"}, {"slug": "T5UPfoph", "url": "wdqHQiwh"}], "name": {"FpYHypN3": "jPhexSBx", "AfZs55dJ": "nWwH9OVg", "s5KJ0YtU": "LlpaROHW"}, "statCode": "viYUZekW", "tags": ["9t87O1IL", "SWJGkZFl", "1uyyfr9o"], "unlockedIcons": [{"slug": "VzoWvLri", "url": "yru4goo0"}, {"slug": "SzAMJrNC", "url": "mXP76cgL"}, {"slug": "5BgHulkV", "url": "FzgpC8h9"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '06IDSmIP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'yUUPRQFq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 0}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vonNHjsx' \
    --limit '11' \
    --offset '68' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'qlblrSzM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mqSut02p' \
    > test.out 2>&1
eval_tap $? 11 'AdminUnlockAchievement' test.out

#- 12 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '57' \
    --sortBy 'listOrder' \
    --language 'sQRkAGhT' \
    > test.out 2>&1
eval_tap $? 12 'PublicListAchievements' test.out

#- 13 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'AMKwiIgY' \
    --namespace "$AB_NAMESPACE" \
    --language '9l31IXzx' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetAchievement' test.out

#- 14 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uVlo95c6' \
    --limit '96' \
    --offset '8' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 14 'PublicListUserAchievements' test.out

#- 15 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'YujywpDk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cqsMJAqt' \
    > test.out 2>&1
eval_tap $? 15 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE