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
    --limit '76' \
    --offset '17' \
    --sortBy 'listOrder' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "0sS7fvi5", "defaultLanguage": "ZGj5OWeW", "description": {"Y8e5xF1H": "TRmau5w4", "DzF3inyM": "xjaCj1he", "GhbKq7Hc": "v38vaWxb"}, "goalValue": 0.7199252848134996, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "C0LFmcUH", "url": "gRrGJW6l"}, {"slug": "9fvMys8Q", "url": "kw5NIKOQ"}, {"slug": "x19jl94q", "url": "i4LLupOC"}], "name": {"8FwM3r2A": "VtqIJIrh", "9ehOALge": "VGB4AW3p", "YHanPzs6": "R9cQ3kuT"}, "statCode": "EXZCzvYJ", "tags": ["55fjcTWe", "3MzhRe1T", "bPxbNHeP"], "unlockedIcons": [{"slug": "hFkf4wqn", "url": "54v06Vzu"}, {"slug": "BOIG0m6n", "url": "9ECJhyeR"}, {"slug": "e5roHZRW", "url": "LvRmtPkh"}]}' \
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
    --strategy 'VOPa49GE' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'g2Ves2F8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'm25L12n9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "38Nl4bs4", "description": {"XO8aTgTL": "yj5UQQoS", "1bNk9BbH": "j4rKfh6X", "vupa3bdW": "KGAqnHl5"}, "goalValue": 0.5738102178182896, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "cS90LFQN", "url": "OXRqHqFO"}, {"slug": "P14Rff5y", "url": "sJX82oei"}, {"slug": "uacULSMV", "url": "Wah51vLV"}], "name": {"cNxbltCm": "85f0H5jy", "nDen0Suq": "004q5yYx", "nAtrwGfW": "RjkljeI8"}, "statCode": "pTozAc81", "tags": ["QrrqOR3f", "CXnkUL09", "IOait8DB"], "unlockedIcons": [{"slug": "N3DxD2jq", "url": "svCg6lBX"}, {"slug": "SM239iK1", "url": "prVvN9ny"}, {"slug": "tO8j06do", "url": "Kj6PnVw0"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'DhwDbAVm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'Ylj81o7y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 89}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '0hYMCltf' \
    --limit '15' \
    --offset '44' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'q2Akztu2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UIghZBJr' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'bIyT5g11' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tzzh5cu8' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '30' \
    --sortBy 'createdAt:asc' \
    --language '3xV6MxYm' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'aZ3ILzcg' \
    --namespace "$AB_NAMESPACE" \
    --language '0Ru6bIAK' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Do35FyG6' \
    --limit '21' \
    --offset '4' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'gvvOVmZL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VJhjBzT6' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE