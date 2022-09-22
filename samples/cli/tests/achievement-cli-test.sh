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
    --limit '82' \
    --offset '58' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "Nna01KNm", "defaultLanguage": "46DXgTDA", "description": {"5OODTwA8": "diQSD14g", "N88ZvYoH": "72xd6zwF", "lAgzCfvr": "0JwdvWvw"}, "goalValue": 0.66858079389465, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "tDJzM8ud", "url": "HUvYogCt"}, {"slug": "Y4XEXJLL", "url": "F0iYlIH6"}, {"slug": "e35DSRT5", "url": "VLHmG6FM"}], "name": {"7IqSBGPi": "HAwyUI2Y", "Rka4ayI4": "7XoaUzcf", "cXbfM92I": "UOK8aV1u"}, "statCode": "tK1vOs97", "tags": ["IZCRAosd", "CjRe6rwm", "gJFxJ4Xc"], "unlockedIcons": [{"slug": "5B1IT1PE", "url": "nll2Kj4m"}, {"slug": "lBuJY33l", "url": "UeFd5kGw"}, {"slug": "ZyAI7MN3", "url": "eM3WOjXb"}]}' \
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
    --strategy 'tLDln5Gb' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'OOhQBsJa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'TjFiFsUR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "EY9CkDFi", "description": {"G5c0as5i": "YdPehMSQ", "SGdQOqou": "9tq5rskw", "mT9ZBDG9": "zjf7gNlx"}, "goalValue": 0.3311159412316601, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "nUiV9i1f", "url": "aeBI77jl"}, {"slug": "pcf2H6NX", "url": "1z0Qgi63"}, {"slug": "EAeZi6Ua", "url": "ypB2X7s8"}], "name": {"yUyYRywl": "oUe4LT44", "7iQSgsDk": "ep6Z9xWE", "hsEEfBUw": "0ohSTCLS"}, "statCode": "9QzKNRa1", "tags": ["9ZjohJAg", "3gK8u9ec", "SIw4po4v"], "unlockedIcons": [{"slug": "l4fxyDRN", "url": "Bvej1E84"}, {"slug": "8EMYggJA", "url": "Fq1njwGb"}, {"slug": "g7aEQVyX", "url": "8dcH4qTw"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '3Rgf0cLm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'yQ3FywSx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 94}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hGyDkxLc' \
    --limit '49' \
    --offset '17' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 10 'AdminListUserAchievements' test.out

#- 11 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'OOeHNmFb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P0tlm2nR' \
    > test.out 2>&1
eval_tap $? 11 'AdminResetAchievement' test.out

#- 12 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'MiTWdtrD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hQDVl4Nv' \
    > test.out 2>&1
eval_tap $? 12 'AdminUnlockAchievement' test.out

#- 13 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '83' \
    --sortBy 'createdAt:asc' \
    --language 'scG0AUje' \
    > test.out 2>&1
eval_tap $? 13 'PublicListAchievements' test.out

#- 14 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '3SN0ZzKZ' \
    --namespace "$AB_NAMESPACE" \
    --language 'CRKV6mTs' \
    > test.out 2>&1
eval_tap $? 14 'PublicGetAchievement' test.out

#- 15 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kh9XAln2' \
    --limit '88' \
    --offset '34' \
    --preferUnlocked  \
    > test.out 2>&1
eval_tap $? 15 'PublicListUserAchievements' test.out

#- 16 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '57QdDTyE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z8iNjSbN' \
    > test.out 2>&1
eval_tap $? 16 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE