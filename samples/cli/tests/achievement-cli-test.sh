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
echo "1..27"

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
    --limit '72' \
    --offset '78' \
    --sortBy 'createdAt:desc' \
    --tags 'worDmlhm,ZMYx7Ja4,lwN4796Q' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "B3bnuHpE", "defaultLanguage": "I9W3rrFr", "description": {"l7z8wrqT": "dJpoi43h", "mNj4KBv7": "Os7JcDDw", "BYhQWoIx": "5ShwWeOW"}, "global": false, "goalValue": 0.8077281520286224, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "pkAa8ouT", "url": "NRheQSjL"}, {"slug": "kKFbyvft", "url": "M6MkoZ4F"}, {"slug": "hJh9LfjW", "url": "X8gf5mii"}], "name": {"hVWlv884": "s92aXitq", "geW4b43N": "jLgWtW0Y", "l7H7KIw5": "mXARJdF8"}, "statCode": "Fu1RaSLS", "tags": ["hfRhNUbh", "crYs535S", "NNaBvjTz"], "unlockedIcons": [{"slug": "gxHgWT0F", "url": "XW89H8Pv"}, {"slug": "TZe7gGDG", "url": "SlR4gCJP"}, {"slug": "VLuVtMsn", "url": "65iYFqTA"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'oCedPWgq,yO0BgdK2,m6NpB7Wj' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'tMRldMqy' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'Fj3lTTSb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'G08Ukgir' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "i7MomAWu", "description": {"RhlRHLFw": "DCAsqGtk", "O4Aax996": "utHuqsJs", "VxMcaPdU": "LDhUT8IR"}, "global": false, "goalValue": 0.03605145368996532, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "ObmQ8Zx1", "url": "wwKNPrzq"}, {"slug": "Qfe8QeqP", "url": "QhQBSe2T"}, {"slug": "3OmTp34P", "url": "DovuCJFm"}], "name": {"ZRD07LDN": "x7fd9IYA", "xsTEOSxg": "G3yyvmeI", "LqjxkaAw": "dKrhJcBc"}, "statCode": "JHK7bpUu", "tags": ["pOxbrbtM", "EqfWRy9y", "uf09eno3"], "unlockedIcons": [{"slug": "PWwEoUbR", "url": "c9keQtJy"}, {"slug": "tVHLGIX2", "url": "Aob1vaSL"}, {"slug": "qDa9V6SS", "url": "i80Fe6OL"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'ungYFwC4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'z07eWs8l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 75}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'SI8Kce1I' \
    --limit '54' \
    --offset '20' \
    --sortBy 'JZxoJ5xs' \
    --status 'YtbncmUi' \
    --tags 'E8fl6Q0I,E7WWzjvM,DGd6YnyT' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'Vf1RomDj' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '65' \
    --sortBy 'qBxB8nGZ' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'IihvProl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --name '04X3gH50' \
    --offset '5' \
    --sortBy 'axxrobu2' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'n5LS8wpc' \
    --limit '75' \
    --offset '75' \
    --preferUnlocked  \
    --sortBy 'S3JlINbL' \
    --tags 'UVBZdKV9,Ty36goNy,TDP2uzpu' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'GnHA0DrX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AoEP7vV7' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'bOLHD0dJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd97Bqne9' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '55PcrZT8' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vbA3Ecrv' \
    --achievementCodes 'z3qMbcNW' \
    --limit '15' \
    --offset '35' \
    --sortBy 'MPCsYnMs' \
    --tags 'pi5kZysh,0JRhlvGC,BN73IlxX' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '51' \
    --offset '96' \
    --sortBy 'listOrder:asc' \
    --tags 'YzUl1uAP,d2jHRIlQ,KT4Mu2fT' \
    --language 'i3PaYSCH' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'CWwLPS4n' \
    --namespace "$AB_NAMESPACE" \
    --language 'uxWZ4t6e' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'EYMI8v8b' \
    --limit '95' \
    --offset '32' \
    --sortBy 'pyGAyXmW' \
    --status 'YNEDF3TK' \
    --tags 'XAo73YU6,ajUX5wK2,wRFIFb8A' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'jQRa9Zy4' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '46' \
    --sortBy 'BBkcczoV' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --name 'QS3x2Xsx' \
    --offset '21' \
    --sortBy 'YjeaqG7O' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '2kWMkpTD' \
    --limit '22' \
    --offset '84' \
    --preferUnlocked  \
    --sortBy 'jUPM2wnP' \
    --tags '9gTlYiLl,wxylpQDb,QDenn5g6' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'USNGldIY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'firRofC8' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'dFAHxmJa' \
    --achievementCodes 'f0uo4512' \
    --limit '8' \
    --offset '52' \
    --sortBy 'Vfzj17Qd' \
    --tags 'gPA5h1Vi,xOAHG5sy,dGZtWHzM' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'zc6QJEUe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iJeSCrX0' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE