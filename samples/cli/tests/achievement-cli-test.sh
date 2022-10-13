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
    --limit '68' \
    --offset '50' \
    --sortBy 'listOrder:asc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "9zitN53J", "defaultLanguage": "RMRVYSyt", "description": {"luoPsj3i": "ggTzJK6T", "3SaGbeP5": "MhHrQA0P", "7ptdJJoC": "bh2X7oJD"}, "goalValue": 0.9126522865837803, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "m1FL2IdX", "url": "XiV2j1qW"}, {"slug": "iRfYcsbb", "url": "xfESWAEp"}, {"slug": "4pS4dUc9", "url": "Et6GRWpf"}], "name": {"bpQHQ5gc": "NMxbPXCp", "x1r2mBId": "Qsajb4Ba", "CGd5oVDO": "hraZu5iT"}, "statCode": "EavJxtMm", "tags": ["1wgLdnxY", "Mmlp0RfQ", "WhooG33n"], "unlockedIcons": [{"slug": "sBJnXA4K", "url": "GRSiYAS2"}, {"slug": "IWz0bFRh", "url": "0ievdc1T"}, {"slug": "ILSphi4I", "url": "YoFKK5t9"}]}' \
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
    --strategy 'b3R4xrkq' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'aPwP7tfK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'l8NXiXpb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "zKEw2tqc", "description": {"CFmJN2Zz": "MRKENfSA", "dgoKLS3L": "Qpl6560u", "3o2wqYgr": "gbzeDhjr"}, "goalValue": 0.5281427983881538, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "vjXQzl13", "url": "1q1Yw9jZ"}, {"slug": "iAsstZ1I", "url": "44n3QmBt"}, {"slug": "5XPp7zvX", "url": "SMCzPtAZ"}], "name": {"7gtvQJGl": "do8iJZR9", "H4pW2S27": "XiejmoAj", "QpAKQQAe": "ibP3PjRA"}, "statCode": "MF7rrAY0", "tags": ["muQfnogm", "16eXgA5S", "dfzh87IN"], "unlockedIcons": [{"slug": "CI5XvoT5", "url": "8MCY9Cci"}, {"slug": "5N6CuqAF", "url": "rLnbU52o"}, {"slug": "fpQJmbZX", "url": "Ok6NDSKl"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'GXvLBWZg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'VWHphL1c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 60}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uzNQEDQF' \
    --limit '70' \
    --offset '78' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'n2vV7tJT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GGVvsW0Z' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'bSRnzXIZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '7dAYyAH2' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '68' \
    --sortBy 'updatedAt' \
    --language 'OtCUY0Bs' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'dAJjPRGJ' \
    --namespace "$AB_NAMESPACE" \
    --language '4Pam33um' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rIC3u8JN' \
    --limit '3' \
    --offset '66' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'o0Ml5lrL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PomX7qX7' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE