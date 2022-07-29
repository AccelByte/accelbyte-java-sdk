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
    --limit '69' \
    --offset '71' \
    --sortBy 'listOrder' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "IzkENjQ6", "defaultLanguage": "NDT5OPUY", "description": {"QAOd1P8t": "u3pFrJgE", "5dgxr5Ma": "h0kg2y8Q", "YNl6TFQG": "fCyKPmNQ"}, "goalValue": 0.9809909397332417, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "Ef09VMs6", "url": "azIzw2ag"}, {"slug": "iy6GXTUj", "url": "ipmackOL"}, {"slug": "vkbMgxpJ", "url": "jkHqjIM4"}], "name": {"6SpX5ASo": "5dw4G2OT", "aFx29ncy": "GVlakjpW", "dr5zdvB9": "nTRhUXEL"}, "statCode": "EJBf6j4j", "tags": ["RhPphNA0", "EfJDB6I6", "SXrt9EAb"], "unlockedIcons": [{"slug": "HY9IPvnj", "url": "o8TP52sG"}, {"slug": "UZ75xdfV", "url": "PDsc7LGr"}, {"slug": "cviW8IZV", "url": "HkNcRGeb"}]}' \
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
    --strategy 'VFcw9SA0' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'ZJBzoj6g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'Iuwoyb2a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "dWE8w9B6", "description": {"jkG1hs3a": "5IA15YiP", "zyLFa8nE": "5F9mWilD", "JcakiZex": "g5x4MprP"}, "goalValue": 0.5665385412153185, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "nHAVDtjy", "url": "1nE6V0Dp"}, {"slug": "uO8Ed7vd", "url": "UGzggSaY"}, {"slug": "NVSKNk3J", "url": "MQHyplVe"}], "name": {"ER8BuJZr": "ML5UjQtU", "sMbVg2tV": "t9qyAPeB", "DgAyWcq4": "aby1kHzV"}, "statCode": "QcH9ENap", "tags": ["G7r5CJuM", "YRZB7Dnu", "wtTSR1gj"], "unlockedIcons": [{"slug": "mwQ3Mu1r", "url": "6P7fdnYj"}, {"slug": "YzFAmG2i", "url": "VnDBoY9Y"}, {"slug": "LY0L6au3", "url": "cT7dJbAY"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'fFr1jXbj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '74XIAsX4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 55}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'off0uib7' \
    --limit '56' \
    --offset '29' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'Epr5F4m0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TfnL3E1B' \
    > test.out 2>&1
eval_tap $? 11 'AdminUnlockAchievement' test.out

#- 12 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '7' \
    --sortBy 'createdAt' \
    --language 'fHNTTcDa' \
    > test.out 2>&1
eval_tap $? 12 'PublicListAchievements' test.out

#- 13 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'MnZPQPuT' \
    --namespace "$AB_NAMESPACE" \
    --language '1fq0OuNB' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetAchievement' test.out

#- 14 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '6jdVo9Fo' \
    --limit '3' \
    --offset '83' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 14 'PublicListUserAchievements' test.out

#- 15 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '76SdzlR5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nq958qjv' \
    > test.out 2>&1
eval_tap $? 15 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE