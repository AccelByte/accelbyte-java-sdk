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
    --limit '9' \
    --offset '22' \
    --sortBy 'listOrder' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "bA7tMvYW", "defaultLanguage": "DwHxsKY8", "description": {"fAopsVpC": "ebQ7OKDr", "PNVfcO9n": "X56eHZTW", "3sfD31zG": "diws6zPH"}, "goalValue": 0.15840613827390182, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "Ap5h2OBD", "url": "1plPlA7x"}, {"slug": "LCyurFpy", "url": "3zEQ2Czb"}, {"slug": "yxm3vuAD", "url": "oG6EAkAC"}], "name": {"GldfpO76": "k0vfhuZn", "zO0ptAaz": "RPrNXKR7", "qzhhDmfu": "gty8lFOd"}, "statCode": "FF6xzru1", "tags": ["RqfJ6lsP", "4op65nx5", "1Qhf7Ooa"], "unlockedIcons": [{"slug": "Dpg84elY", "url": "Z53ZspfN"}, {"slug": "qeh1KJ9y", "url": "zT1WVSpk"}, {"slug": "RBmhtAhg", "url": "hKr6vLY1"}]}' \
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
    --strategy '4kpqm1YQ' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'tnETYQpq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'yGbx2OOh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "9zcqyiHg", "description": {"rDfOjlhL": "ZHy6So9O", "5mItFYQF": "aJVa7doB", "VEDiSYuD": "Bbgdsk3f"}, "goalValue": 0.5202166228827645, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "Xvd51mg2", "url": "bx7Hd5mr"}, {"slug": "x8zfk4Dl", "url": "18K4K2oQ"}, {"slug": "WyTKFjLH", "url": "dJNQO5Z4"}], "name": {"tbBSYznj": "vbD8YUlx", "6JoepHAx": "CaQUcCCl", "NXutRSlu": "f3EOtvcb"}, "statCode": "kuDW5VBS", "tags": ["ECUNZvHc", "MYZQf4QV", "38caTk51"], "unlockedIcons": [{"slug": "GxetIwQK", "url": "CjkWMbnO"}, {"slug": "kdBPmUCt", "url": "YZ4Jg43q"}, {"slug": "bE12DveK", "url": "T1WwjpUl"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'qMth4Leo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'ZtdROPK0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 5}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vujS1KAI' \
    --limit '48' \
    --offset '59' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '3EIcJMyG' \
    --namespace "$AB_NAMESPACE" \
    --userId '01i89QiY' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'J1E4IYMG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xlD7hKJk' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '23' \
    --sortBy 'listOrder' \
    --language 'XoPB8UAj' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'wSKXLOhj' \
    --namespace "$AB_NAMESPACE" \
    --language 'VgkAWh1k' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'qq6Fhv0U' \
    --limit '19' \
    --offset '46' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'qKlamo34' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtPmbg3D' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE