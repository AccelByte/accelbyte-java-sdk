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
    --limit '71' \
    --offset '92' \
    --sortBy 'listOrder:desc' \
    --tags 'EwYaVCiA,KLc3TwST,tKU7AT9n' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "MTUmIxDC", "defaultLanguage": "UlQJNdvm", "description": {"xKTZQa6i": "4xrB1VaI", "lZjZHWaK": "H50SLMKQ", "HPG0O6XR": "vBDTFSMB"}, "global": false, "goalValue": 0.48604066795632417, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "v2pw2xxj", "url": "pjKEZJXl"}, {"slug": "z2Frycp8", "url": "pluCpK3K"}, {"slug": "tC6Dk65L", "url": "Croy0mUl"}], "name": {"e0bkFCou": "bSMkbqei", "13uwwJvk": "nGH2Q2KZ", "q15TdPMs": "vAZsgy6o"}, "statCode": "ibjMnPw0", "tags": ["amuKjVYs", "gnUNhyuo", "XNAPzTgO"], "unlockedIcons": [{"slug": "ooYtjpIj", "url": "q5FzYuMh"}, {"slug": "A241Jsd7", "url": "P3ir2Kd1"}, {"slug": "UBfSa5P9", "url": "04JS2aLs"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'ftKOQVxf,5zxr6Huq,lxWEHyRo' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '7JkZCYRq' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'BS1bzQbM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'EhCINxaK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "iqy2eiMw", "description": {"VrB13naw": "M5RNzu5z", "TqFtzgXG": "bklfznxW", "4w7VvdcN": "vGU1UfON"}, "goalValue": 0.7729074355965725, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "VeRT8Jed", "url": "T0dJfUlC"}, {"slug": "wyuMcylw", "url": "Udn7RQXL"}, {"slug": "Wbw8NYKY", "url": "jOXkSTkd"}], "name": {"OjLYzTSv": "qurC94GI", "p3sexbJA": "plN51s6k", "FSuM5dHk": "vTXRRSd9"}, "statCode": "S4xR2BAY", "tags": ["dz4Vn2i1", "bg85Fveb", "FUqoyK1a"], "unlockedIcons": [{"slug": "9k1nT9cG", "url": "04tAfJNh"}, {"slug": "mxksczFU", "url": "rI7J6X2V"}, {"slug": "4DEgtTs6", "url": "pCAuLrBk"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'St1ys4UE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'qSNqH9jq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 95}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --name 'kL5gEjjN' \
    --offset '95' \
    --sortBy 'o9Tk8qVA' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'nJCzXdOY' \
    --limit '32' \
    --offset '41' \
    --preferUnlocked  \
    --sortBy 'Dwl6Tarc' \
    --tags 'ebGQIcVn,TVpITiF0,LxBgAE6g' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'EzcBKWFl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N3fTslZU' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'SZ4RFUMM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e288PURI' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '3Sjpiffw' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '13' \
    --offset '42' \
    --sortBy 'createdAt:desc' \
    --tags 'Q8YrgLfK,sR36oaFJ,PfzotY0w' \
    --language 'qcZl6UFB' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'aZMXTxzM' \
    --namespace "$AB_NAMESPACE" \
    --language 'N1WZap0x' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCode 'ffpAmWdT' \
    --limit '94' \
    --offset '16' \
    --sortBy 'KeznBY1w' \
    --status '0uTBEpge' \
    > test.out 2>&1
eval_tap $? 17 'PublicListGlobalAchievements' test.out

#- 18 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --name 'aYXRbRhO' \
    --offset '69' \
    --sortBy 'bbotfr2t' \
    > test.out 2>&1
eval_tap $? 18 'PublicListTags' test.out

#- 19 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OBYy6C0h' \
    --limit '33' \
    --offset '40' \
    --preferUnlocked  \
    --sortBy '0j4en6sJ' \
    --tags 'RI2IEtVs,3sZbkGDY,lBdY7cK3' \
    > test.out 2>&1
eval_tap $? 19 'PublicListUserAchievements' test.out

#- 20 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '8GRFMGUj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYkjAyZe' \
    > test.out 2>&1
eval_tap $? 20 'PublicUnlockAchievement' test.out

#- 21 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'gQNo47ED' \
    --namespace "$AB_NAMESPACE" \
    --userId '9yJbiue2' \
    > test.out 2>&1
eval_tap $? 21 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE