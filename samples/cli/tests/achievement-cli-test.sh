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
    --limit '75' \
    --offset '64' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "CL7wZopp", "defaultLanguage": "c9Noh698", "description": {"TBbeaZjU": "ZzmIbiRs", "KkV5999m": "PnX3UJ5I", "wrYcI5Fs": "RCO5qxf9"}, "goalValue": 0.2882940888782243, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "3y6EvGRX", "url": "zss25mX2"}, {"slug": "GgK0xY0h", "url": "akZ0VzOm"}, {"slug": "6p7AHD8P", "url": "v2SKZ9VE"}], "name": {"P13UCOyZ": "Hy1if0Tc", "ueb733BT": "sMBwX9Cz", "VyP2Mvyd": "1wVXlQ9O"}, "statCode": "V1A7alYl", "tags": ["1DX78KHV", "9DFDf8Yh", "QqwJaG6z"], "unlockedIcons": [{"slug": "XnbimBA1", "url": "pnqOHQKx"}, {"slug": "ji9FshsA", "url": "VyOXKdnC"}, {"slug": "Av5Uxewv", "url": "upIUU1qy"}]}' \
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
    --strategy 'z1z2CE2v' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'U1TYTD2x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'tqpp9Tnc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "2kPcIbmF", "description": {"w3bJgrB6": "CZXPfWMA", "Gi12J9ke": "XCvrfVbq", "sVt7TCvg": "6ixO5Sm9"}, "goalValue": 0.5089611817524284, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "dkRKkDC4", "url": "bJrvw1fD"}, {"slug": "Nz1LtIN3", "url": "JZI0VPPh"}, {"slug": "oOIsMRmP", "url": "k2DZb3me"}], "name": {"lBIULLWX": "ScUgiBp2", "QSwWek6M": "wAFim3B6", "WtBNfEAf": "JqaTrDL3"}, "statCode": "HwFI32aj", "tags": ["hzfU4Qi9", "KR0flMS5", "Vf2Gx8KJ"], "unlockedIcons": [{"slug": "eVQ7x4Hl", "url": "05yfo4aA"}, {"slug": "25Nc1ZIZ", "url": "wY9WuBeN"}, {"slug": "XoE9kLj6", "url": "LJXapJAh"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'aveQYUR5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'VnTCmOGs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 92}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dgn2CrIG' \
    --limit '9' \
    --offset '84' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'pA2z3OiA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UjFqHxDB' \
    > test.out 2>&1
eval_tap $? 11 'AdminUnlockAchievement' test.out

#- 12 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '0' \
    --sortBy 'createdAt' \
    --language '0NCSEFBf' \
    > test.out 2>&1
eval_tap $? 12 'PublicListAchievements' test.out

#- 13 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'eELtaB4I' \
    --namespace "$AB_NAMESPACE" \
    --language 'ZWh4AE15' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetAchievement' test.out

#- 14 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCSa3cHj' \
    --limit '88' \
    --offset '10' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 14 'PublicListUserAchievements' test.out

#- 15 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'aisJTNTg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BFn9e8ID' \
    > test.out 2>&1
eval_tap $? 15 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE