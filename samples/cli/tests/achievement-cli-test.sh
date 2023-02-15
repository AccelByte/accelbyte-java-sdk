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
echo "1..21"

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
    --global  \
    --limit '47' \
    --offset '3' \
    --sortBy 'listOrder' \
    --tags 'P4Iok7yc,JSzpiuBI,Q48xXtsD' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "gCkyvlqn", "defaultLanguage": "LVw4P04R", "description": {"CbvHp6Qj": "36iANOdJ", "lWggiXhO": "RRwOWfku", "TSQyc9Pl": "8HTT8E4f"}, "global": false, "goalValue": 0.7024938934877041, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "aSdmsBeZ", "url": "HDn8CIV0"}, {"slug": "kvMfJKhS", "url": "OjxDkS4F"}, {"slug": "wP2vxBli", "url": "1RiVr6sm"}], "name": {"YFKoeUyi": "CEoUrufX", "Zn2AXZYt": "ErBxod6f", "9J6ZrNBU": "dHNnQ2SJ"}, "statCode": "mIT7OmJ4", "tags": ["0PvT7zzr", "ZsU9QPq0", "yNkaS26s"], "unlockedIcons": [{"slug": "gNgDb7du", "url": "qOEsxnqO"}, {"slug": "t4P7JdHr", "url": "IQKU4s33"}, {"slug": "Nwu4ZhAk", "url": "fVoiU29r"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'pKBNP6qB,QZMymI9J,Vf7nMHiN' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'anSzES3d' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'irN8crCN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'w5yowoKG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "RU10HL1V", "description": {"1zXU3YmR": "NWxTlyIu", "XGpfF9bV": "qrxQG2c3", "O2tgPA03": "VcWJe8vp"}, "goalValue": 0.6538101828366463, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "JS5Zduux", "url": "VJrUiaU9"}, {"slug": "jGlP6QAt", "url": "AmjxDVMb"}, {"slug": "HtswiGdx", "url": "v4dnXH03"}], "name": {"pI6GGy8F": "qL40NLrF", "JUQivl9j": "ofeMHGWY", "SvpcjVKG": "4adARgfq"}, "statCode": "jds87jTR", "tags": ["OqcLPIkA", "PKT09q5c", "7SPoFke9"], "unlockedIcons": [{"slug": "QZkczqlm", "url": "uK4fmave"}, {"slug": "TCCU9SSI", "url": "FXPCgJ97"}, {"slug": "TE53qZ1R", "url": "5imm9ZPp"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'Xxr3Cdxt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'GRQ8r1Tj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 51}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --name 'KSkdG0u8' \
    --offset '5' \
    --sortBy 'V59Lf3Ip' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'GsP8sXNB' \
    --limit '17' \
    --offset '76' \
    --preferUnlocked  \
    --sortBy 'sdVLZI8W' \
    --tags 'l5QxalCH,tRFAdC1P,3GqhHGqd' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'sQEWUsw6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HZwUUbxJ' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'JTgQfX7G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HaS293co' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukOI0I5Y' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '19' \
    --offset '90' \
    --sortBy 'listOrder:desc' \
    --tags 'dlMZcmXg,g3DBVvQS,q4ZsWhWi' \
    --language 'gXCnTpL9' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'EIoMP8OU' \
    --namespace "$AB_NAMESPACE" \
    --language 'IudxQ2YJ' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCode '1m0LF59Y' \
    --limit '91' \
    --offset '97' \
    --sortBy 'Gz8m1VYo' \
    --status 'fQbtS0qa' \
    > test.out 2>&1
eval_tap $? 17 'PublicListGlobalAchievements' test.out

#- 18 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --name 'P8Q5QkTO' \
    --offset '65' \
    --sortBy 'PgAY1wgF' \
    > test.out 2>&1
eval_tap $? 18 'PublicListTags' test.out

#- 19 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'pp9MkgdX' \
    --limit '89' \
    --offset '65' \
    --preferUnlocked  \
    --sortBy 'vN6vguPK' \
    --tags 'yPUoobl7,GZHpQOYW,E979eZrB' \
    > test.out 2>&1
eval_tap $? 19 'PublicListUserAchievements' test.out

#- 20 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'oA1NHxGU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiNhT00L' \
    > test.out 2>&1
eval_tap $? 20 'PublicUnlockAchievement' test.out

#- 21 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'QLoQY6hd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJfBGlci' \
    > test.out 2>&1
eval_tap $? 21 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE