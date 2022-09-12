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
    --limit '28' \
    --offset '50' \
    --sortBy 'listOrder:asc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "npvekZDa", "defaultLanguage": "lLJdJt33", "description": {"aUlNWehR": "vej3pnmO", "gGSkxsn2": "xAEkM4iU", "OblWp9jt": "sZMVR1ah"}, "goalValue": 0.4321149791892661, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "9PReqcBj", "url": "0wn4D60a"}, {"slug": "nMptUQzV", "url": "LjzKR7tP"}, {"slug": "5vunh2tR", "url": "9UZqGpJU"}], "name": {"tMOIlDuV": "DRRYjDxi", "sOdfooYo": "pFgFjtYn", "ANtOnw0e": "Wp0tL0Cu"}, "statCode": "cQfjMLU0", "tags": ["l3yk5WNZ", "z1G1vsBH", "zBRy32Pt"], "unlockedIcons": [{"slug": "QCyCxDhP", "url": "i4lkPMY8"}, {"slug": "X2Zq4YlU", "url": "hZQem5U9"}, {"slug": "P1v63n8t", "url": "pICbB6rU"}]}' \
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
    --strategy 'IGBMbCqG' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '3DKkqpqg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'vBPrw5aC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "xFq0Odhp", "description": {"W6WimVWJ": "mvkH17L2", "5sO1AkHF": "dmsW2SE8", "Jw8rOShE": "wHCMwSEC"}, "goalValue": 0.14594823340348817, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "MafzwM1b", "url": "wSodr4kr"}, {"slug": "EucUvFq0", "url": "1kknL4gb"}, {"slug": "kLag6DwY", "url": "mDwDvAqy"}], "name": {"roYRGif6": "dnWC4vjT", "7eRQJPif": "EsdWjNN0", "oklFH0vC": "UyVBqcuY"}, "statCode": "MI3mjejr", "tags": ["72oQ65uQ", "6uhiGzaJ", "Kds6HMju"], "unlockedIcons": [{"slug": "NKU2InKy", "url": "ozUxqlfi"}, {"slug": "iNITvIos", "url": "uGUKliER"}, {"slug": "Vey9wjqW", "url": "Er14yyve"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'vGhI3QI1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'S2imTTQH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 17}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '2gBUHpIG' \
    --limit '100' \
    --offset '56' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'pPE6hGNc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8KpToPu' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'xWpRDhj6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'APVzyDpn' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '68' \
    --sortBy 'listOrder:asc' \
    --language 'IMwA4UPu' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'K4p7QBCP' \
    --namespace "$AB_NAMESPACE" \
    --language '9vwNF2VA' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJqYIPyG' \
    --limit '67' \
    --offset '88' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'r60MSW98' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u9UFkQyy' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE