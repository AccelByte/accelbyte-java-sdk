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
    --limit '85' \
    --offset '49' \
    --sortBy 'listOrder:asc' \
    --tags 'rFHL4xAA,l3MwRtMG,bwLsg533' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "V6vVfAx5", "defaultLanguage": "Fy0FK768", "description": {"ZiAPlJNs": "j7uQBs34", "SCEwfRf2": "9XibHsEZ", "lOOTn9Jh": "TUyU3Uah"}, "goalValue": 0.23609973029876663, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "k56C7jiC", "url": "I1meZVpr"}, {"slug": "AWgpczDU", "url": "9Ej1MAyo"}, {"slug": "uUTbkWmL", "url": "VMjPxee4"}], "name": {"vWd46ohx": "5LUu5sof", "LYRb24oH": "BuuaG7gB", "Li4RW7EH": "81RKip35"}, "statCode": "JG0liLM1", "tags": ["pvn8JM8p", "gCHcYNO1", "Vswe2PD2"], "unlockedIcons": [{"slug": "lL2dNP5J", "url": "NMz0MxZE"}, {"slug": "ut3KGWq1", "url": "ap1H7qeB"}, {"slug": "tWcLjt7B", "url": "m3dm7ZFC"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'am20eAoT,9pzlndMx,p3XhVnix' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'KHHZX6yf' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'hXwxjgkK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'llmYvk7N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "6cxoXgwz", "description": {"Kmr46ebq": "gWwnrnvG", "OR820PEF": "3lroNmrc", "Og78XlJ9": "WshmSDzd"}, "goalValue": 0.8517562210969564, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "8qcjykgG", "url": "BHc1h5F2"}, {"slug": "ID0n5AW8", "url": "3I42HmkB"}, {"slug": "kDlON5Cb", "url": "zwoydKKk"}], "name": {"fuckiWwR": "MEX1jWhJ", "RskjJKCV": "N4ldvNxV", "9rquGoTw": "QWdgFKUF"}, "statCode": "6habBUYv", "tags": ["pPRK5dtO", "k08uNQWv", "sUPQ1cDW"], "unlockedIcons": [{"slug": "OZenKiPn", "url": "ZAR6yDIp"}, {"slug": "GlGA7yil", "url": "3MQXXsgx"}, {"slug": "IvOPkrK1", "url": "6oZpER2f"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'rYLpsTbv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'xP832RdP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 0}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --name 'MAL7CRbL' \
    --offset '78' \
    --sortBy 'cEd4cAbK' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMXaIbW5' \
    --limit '68' \
    --offset '26' \
    --preferUnlocked  \
    --tags 'Kjcpp245,I2JyPR3G,0u0jex7C' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'mcrx8Cmh' \
    --namespace "$AB_NAMESPACE" \
    --userId '4cZm373x' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode '6TswUR9l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIj5MExz' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mHQ8kUQo' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '44' \
    --sortBy 'listOrder:asc' \
    --tags 'iiX6s0MK,XY820cCe,X7232AgS' \
    --language 'HPKPcFFZ' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'G3BIvhfI' \
    --namespace "$AB_NAMESPACE" \
    --language '8PeYOCyH' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --name 'k7gTXAg9' \
    --offset '54' \
    --sortBy 'ikV1gP4v' \
    > test.out 2>&1
eval_tap $? 17 'PublicListTags' test.out

#- 18 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ySMq9W82' \
    --limit '57' \
    --offset '22' \
    --preferUnlocked  \
    --tags 'gufXmV8l,w6YECBh3,B0KGXBnf' \
    > test.out 2>&1
eval_tap $? 18 'PublicListUserAchievements' test.out

#- 19 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'c61rqMJA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UGxAox6U' \
    > test.out 2>&1
eval_tap $? 19 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE