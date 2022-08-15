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
    --limit '71' \
    --offset '98' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "VvNXkQjG", "defaultLanguage": "fZo1f67c", "description": {"JdmqM1ta": "LAij7vhq", "yMiMMZGA": "77mGTqlF", "0eGVL0NI": "QJpUIVWB"}, "goalValue": 0.9588958029570642, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "a2OR73hW", "url": "Sib1C4ur"}, {"slug": "B63PdywS", "url": "LESVx2FE"}, {"slug": "PyDDEnrY", "url": "chWSCO5o"}], "name": {"BgkCNf7g": "HQzYruxd", "VBQXNCEO": "OQGaE8Pt", "1OcxKjOR": "8pYXgxd0"}, "statCode": "ZTfpcN4c", "tags": ["HELmytWJ", "cquOtmhS", "b0wax2UI"], "unlockedIcons": [{"slug": "aeN9ei3a", "url": "R7xZ6jDP"}, {"slug": "rFaxZE7z", "url": "lWmVgHa8"}, {"slug": "qwgGRwyW", "url": "MfH3cxP6"}]}' \
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
    --strategy 'nwLLL2LE' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'HTEJYxhL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'Z0GJXQcP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "VeqeGrZi", "description": {"wzplHsBX": "Wcpx06Tl", "r6IJ3Gn0": "FHegZVSb", "4oP6E7YV": "NDu0CfDE"}, "goalValue": 0.012109773986211825, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "vLgj6TiN", "url": "VVa6Me1y"}, {"slug": "5gLCvoUN", "url": "US6hyvCp"}, {"slug": "IBwHMi2J", "url": "Zh7V4Lnj"}], "name": {"Ua7Gxb6D": "xcEdvarQ", "3r5t24zc": "48rfIBOf", "aIDOvfCS": "JDwKAjRW"}, "statCode": "cBO2ZrsB", "tags": ["RxQpoeVA", "hM5EpmIm", "t40Z1X99"], "unlockedIcons": [{"slug": "FnP6uLnG", "url": "zS15Gku9"}, {"slug": "USmGBorn", "url": "1iK0tVxs"}, {"slug": "g5inkSJ1", "url": "H1VYhkq3"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'kZWsx31v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '2I3FUaPd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 8}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'A4zM1hDt' \
    --limit '21' \
    --offset '49' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'chHRlp8E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kay1eiWM' \
    > test.out 2>&1
eval_tap $? 11 'AdminUnlockAchievement' test.out

#- 12 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '37' \
    --sortBy 'listOrder:desc' \
    --language 'H64ZSpfy' \
    > test.out 2>&1
eval_tap $? 12 'PublicListAchievements' test.out

#- 13 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'iCSXjWKf' \
    --namespace "$AB_NAMESPACE" \
    --language '11W1llAO' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetAchievement' test.out

#- 14 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'f8Fn9M9H' \
    --limit '81' \
    --offset '39' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 14 'PublicListUserAchievements' test.out

#- 15 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'HXj1Xydh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oFIfvdLK' \
    > test.out 2>&1
eval_tap $? 15 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE