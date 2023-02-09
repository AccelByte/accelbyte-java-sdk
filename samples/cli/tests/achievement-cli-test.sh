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
    --limit '32' \
    --offset '97' \
    --sortBy 'createdAt:asc' \
    --tags '16lBl4iJ,z9poS3iE,79WBzLIz' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "xDLXCwJ3", "defaultLanguage": "wptVIsQr", "description": {"DPlGH74A": "6oBlGOPe", "Bx3YCN6n": "lLHSi3xO", "e7kJrYko": "5aiVyIjH"}, "goalValue": 0.838921870263357, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "Vh4ggb3B", "url": "HDp9o9ty"}, {"slug": "l0oG368y", "url": "Pb2F3cS6"}, {"slug": "q6w3xugz", "url": "E7CUsT4i"}], "name": {"zT34yXS4": "LXrxp9KM", "fAbEaudB": "hNLSo7tq", "8AyNx3kd": "q8pXyEGc"}, "statCode": "HIZrorD5", "tags": ["Qs3GXZI1", "3Os1tXrw", "pIIyUVsJ"], "unlockedIcons": [{"slug": "TaJNyN32", "url": "hAymEISH"}, {"slug": "tBNLzZtS", "url": "VwRgmMt0"}, {"slug": "42rQVSL4", "url": "6TfK3mZl"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'wISAmNr1,CnhVixnB,kNlyZwDs' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '7VyrrQ6L' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '0OONV0mZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'HWAtKmF5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "HctEUBii", "description": {"ejjn8CDS": "oqRICJY8", "OxIXFr0B": "4KXWw2nP", "a0YBF4PB": "vKjTd6Bx"}, "goalValue": 0.7797871754128263, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "WPhLwmkg", "url": "qaGxt6vU"}, {"slug": "vpYfNmW0", "url": "5mNDUDMW"}, {"slug": "jJ4tWa4S", "url": "YtsBU5gm"}], "name": {"dMwZ7f1x": "3G3Xdu6B", "rVhKd9Nb": "grYRIFQH", "Um7WKoM5": "0iAqNtgD"}, "statCode": "l8qjCwah", "tags": ["HlObmauS", "xjgqERs6", "NDB9rGlu"], "unlockedIcons": [{"slug": "Uwbf8t4Y", "url": "ocyZjRo2"}, {"slug": "D94Shzv6", "url": "buyzAIV8"}, {"slug": "8Jt5RybQ", "url": "ND24Iunh"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'UHOnwdno' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '6kNHfdpr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 94}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --name 'LrPk5tZa' \
    --offset '27' \
    --sortBy 'qJj3CpTE' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tT6DZVri' \
    --limit '50' \
    --offset '67' \
    --preferUnlocked  \
    --sortBy '0wm3f1AE' \
    --tags '1XIuvKVE,BH7tphVg,YnAsEyrs' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'JG1STh7w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tplFgTBz' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'sOCobewX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XgU1F9rJ' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fw2dceHl' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '63' \
    --sortBy 'updatedAt:asc' \
    --tags '74G4ik2J,tiMFM2pg,cKbeRra3' \
    --language 'bALDuMWb' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'UbwGHJgu' \
    --namespace "$AB_NAMESPACE" \
    --language 'XY3SMHaT' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --name 'ajXKEw5L' \
    --offset '78' \
    --sortBy '8h76qOeI' \
    > test.out 2>&1
eval_tap $? 17 'PublicListTags' test.out

#- 18 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'nHAOc8jM' \
    --limit '32' \
    --offset '48' \
    --preferUnlocked  \
    --sortBy 'NHsv8eiM' \
    --tags 'LOLptFRB,19OxpYEq,2ZBMZu7k' \
    > test.out 2>&1
eval_tap $? 18 'PublicListUserAchievements' test.out

#- 19 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'c6ficIWv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ufop2IQh' \
    > test.out 2>&1
eval_tap $? 19 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE