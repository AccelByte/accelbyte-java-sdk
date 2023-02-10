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
    --limit '8' \
    --offset '51' \
    --sortBy 'listOrder' \
    --tags 'AQDMBBsU,AjwuyjTv,LLwwNI2G' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "cDA6nud2", "defaultLanguage": "l8B6cBcS", "description": {"thofC4rR": "EE0geyIi", "uqFu3S2Z": "QyA3O28U", "in9JdG1U": "RX2dJfs6"}, "goalValue": 0.25190133918427426, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "9m5rKRrl", "url": "B4Ww3gys"}, {"slug": "LY50N5su", "url": "fAswbe3J"}, {"slug": "thLxCjJq", "url": "BiC2ezcq"}], "name": {"MK5H04z6": "iPlFwz8Y", "521eKIxR": "dPXKv1Fr", "zBA9Kvol": "NB0Y4vGA"}, "statCode": "QE5hvEKT", "tags": ["XWzfK7CQ", "FS8UlE0L", "xl2ddJqV"], "unlockedIcons": [{"slug": "QfwcZyqX", "url": "JZ6Oxbj1"}, {"slug": "UnQUKZDx", "url": "7HS5t4jG"}, {"slug": "J7CiX6i8", "url": "Mbnsx38l"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'A8OTLMJx,zb5JPu4R,dXkEUZAV' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'Q8yZAL3S' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'G8RVgEPG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'skPI2xyK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "ZHwAnpcL", "description": {"v5aLNiX4": "nx3TbWxj", "IcfGQTzA": "QXphaa2U", "04ybtHMN": "dl2Ee9Dq"}, "goalValue": 0.6411995979304087, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "OnYBmi7y", "url": "L7bWCo2j"}, {"slug": "ylCPeVon", "url": "HuJ2h1us"}, {"slug": "AsmSmbYC", "url": "Fy3rPpKZ"}], "name": {"HE1uTS9I": "hbkbqDf2", "C6nfewzM": "JqRWBCpU", "eeDQqdkF": "cZlBpBkx"}, "statCode": "jioCXvKb", "tags": ["VjzAz7yB", "IKJD8NHh", "EmOit5jC"], "unlockedIcons": [{"slug": "SpV7lCwS", "url": "orbjjFBr"}, {"slug": "qjgC2OdD", "url": "WXkV73PV"}, {"slug": "nT8Gayeq", "url": "NleMVs8T"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'OFMZhmUo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'kKQn9gwZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 27}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --name 'g5sdhLiS' \
    --offset '0' \
    --sortBy 'nOIlyjHp' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kijqF7oa' \
    --limit '58' \
    --offset '84' \
    --preferUnlocked  \
    --sortBy 'KB9SV4WJ' \
    --tags 'djXsT2df,b59ALBgl,BgUAu0vj' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '9ZEIBwps' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XDZqnmZU' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'oSWctYcp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sYTDw5b8' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '3KGA226I' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '33' \
    --sortBy 'listOrder' \
    --tags 'obTM1xur,N36ROz1p,gY3CxVkr' \
    --language 'KhxM7Z90' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'fUhmoovf' \
    --namespace "$AB_NAMESPACE" \
    --language 'joEwalB0' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --name 'Q8AKdgzz' \
    --offset '33' \
    --sortBy '6E82RgG9' \
    > test.out 2>&1
eval_tap $? 17 'PublicListTags' test.out

#- 18 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'GlB1T0lK' \
    --limit '10' \
    --offset '89' \
    --preferUnlocked  \
    --sortBy 'Y7xKAxj7' \
    --tags 'bah50fR1,wZv662q3,kah28QAv' \
    > test.out 2>&1
eval_tap $? 18 'PublicListUserAchievements' test.out

#- 19 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'rQSkFeai' \
    --namespace "$AB_NAMESPACE" \
    --userId '447n8tss' \
    > test.out 2>&1
eval_tap $? 19 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE