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
    --limit '28' \
    --offset '4' \
    --sortBy 'listOrder:desc' \
    --tags 'QXL44RTZ,vbJfqVMv,w9ZqgXkC' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "XzZFvvM4", "defaultLanguage": "A0bDYSxn", "description": {"UK3eqtKB": "lmho7Nkt", "nWAuzpDz": "kOVnUMCv", "26SBkK3S": "7vdy8Lvy"}, "goalValue": 0.91341797034402, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "FSOPSggG", "url": "8rTPnP76"}, {"slug": "te8p408W", "url": "ff0LDaIY"}, {"slug": "LDshde6l", "url": "g9QRsJKj"}], "name": {"WrUbomYs": "t9pQLhw1", "FnHPTU14": "eKqFt2Gu", "lOqmdTi1": "LzT3Yav0"}, "statCode": "jqYf8Kxa", "tags": ["4I4tfACL", "1ffddt2F", "VK86LeEd"], "unlockedIcons": [{"slug": "jQHrqqTc", "url": "TP1Kk0zu"}, {"slug": "TlHGm6JM", "url": "apv7xeRS"}, {"slug": "omGhQUqS", "url": "7Ovty1Kn"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'jyN9wdZj,BUangaJD,dvdxdQB0' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '1qSkBOPc' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'uDJIMvDy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'TXsZScAK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "a3NsINI0", "description": {"s4xN6TNp": "DwEaXs3Q", "VfJEzrRG": "l7h3PVR9", "Bu9Ts7oD": "KQgSRvc6"}, "goalValue": 0.31754740587162666, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "TltvStnj", "url": "r2WtkrLY"}, {"slug": "EfWv6Bk0", "url": "UlpMEIrD"}, {"slug": "ypnGSDGR", "url": "FDJ4Fyt7"}], "name": {"jZSgwhTU": "M34g5AGq", "QODHY9qC": "GzQtTMlj", "yCpCd97y": "EffNq3GX"}, "statCode": "AMlzuI8S", "tags": ["oEjgCESi", "bsyUk0L4", "EXa93pg6"], "unlockedIcons": [{"slug": "LH5x4ULU", "url": "6unjqxTE"}, {"slug": "bVbN1Xfp", "url": "w2DLFzH3"}, {"slug": "teeRCoxa", "url": "mQxNXo2X"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'u7H65UtS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 't7Vo1JGa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 37}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --name 'Kz9ZJFSB' \
    --offset '23' \
    --sortBy '2IvEKLoT' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYlDD3Gj' \
    --limit '83' \
    --offset '81' \
    --preferUnlocked  \
    --sortBy '62cBwl3j' \
    --tags '8tY2RVUu,ylXMuoSZ,0gt1r3YK' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'eIP9Z9ZQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BQnWk77z' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'M4I0V7sE' \
    --namespace "$AB_NAMESPACE" \
    --userId '9Yuim12f' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KGNUOD3Q' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '35' \
    --sortBy 'createdAt:asc' \
    --tags 'huD0orDy,e8TXWKBs,XYzk6ImV' \
    --language 'BY3JlHBn' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'jnFHDuc2' \
    --namespace "$AB_NAMESPACE" \
    --language 'Xq1OQDdz' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --name 'xX4iiLYL' \
    --offset '23' \
    --sortBy 'ysJg218q' \
    > test.out 2>&1
eval_tap $? 17 'PublicListTags' test.out

#- 18 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'xNkHBxAY' \
    --limit '96' \
    --offset '76' \
    --preferUnlocked  \
    --sortBy 'SOi84TGl' \
    --tags 'b9tbOJ4C,eQuOkuWf,z5vTdbIb' \
    > test.out 2>&1
eval_tap $? 18 'PublicListUserAchievements' test.out

#- 19 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'TaJqG9Sh' \
    --namespace "$AB_NAMESPACE" \
    --userId '0UeAR22A' \
    > test.out 2>&1
eval_tap $? 19 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE