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
    --limit '97' \
    --offset '53' \
    --sortBy 'createdAt:desc' \
    --tags 'EfXaIjH7,zfddWG3P,izeDhIqF' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "815V2Yil", "defaultLanguage": "GyGzfTzh", "description": {"Voj1oT9I": "WqZTHIRf", "i0UaG0Cw": "iRtUqQKM", "3rqL6hRe": "q2kR5ysn"}, "goalValue": 0.9025697015022313, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "7oN9bYcF", "url": "MEwDOMgT"}, {"slug": "wVNq80OF", "url": "G5WPGW47"}, {"slug": "xZ3EcIFR", "url": "LOD2wTDA"}], "name": {"NTMHXacg": "BX8vnBrW", "UxOOgbuT": "WIAXyTvF", "3SxKFAoK": "GNES8xNg"}, "statCode": "qOfzQ67N", "tags": ["SFOgJ7XX", "czjHU39K", "8itqNdTS"], "unlockedIcons": [{"slug": "Rx2cKdqX", "url": "VG6h1P1T"}, {"slug": "sNgaPOjE", "url": "wOLfNJMx"}, {"slug": "qU6ymfBS", "url": "qaIH2ntc"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'iWpXAovR,hd5HST6G,Gyl78xe7' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '3KT1qxet' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'eTaSRg7E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'qacp45YI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "uJiyVhy2", "description": {"kFoIarUY": "ZgYbRc68", "syVMjALl": "0PCqWutZ", "fpAYAySF": "ZZxhl53Q"}, "goalValue": 0.36702823970298737, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "koeFt8of", "url": "2IJZni5F"}, {"slug": "qMhZ6DSj", "url": "9hM25DAl"}, {"slug": "sSdbY5l4", "url": "5ZUtqkW2"}], "name": {"3V4WIFvN": "8a1gxe0R", "fyC9EtTD": "tmlo0ec1", "e32DJh5F": "vHsftgPi"}, "statCode": "vLEoLdlB", "tags": ["NrNlZgol", "6ClJPC2T", "BvY5Ta1H"], "unlockedIcons": [{"slug": "HsTePTb8", "url": "5M3qAmlo"}, {"slug": "zWsCxUor", "url": "d6FXXoGk"}, {"slug": "Ki0F7eKC", "url": "rTOrYqdZ"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'EbzBIgJV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'ko9kF0VG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 79}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'hMgQkCb0' \
    --offset '84' \
    --sortBy 'MOFjWw7c' \
    > test.out 2>&1
eval_tap $? 10 'AdminListTags' test.out

#- 11 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvvxPEQX' \
    --limit '63' \
    --offset '51' \
    --preferUnlocked  \
    --sortBy 'XZSMPnaO' \
    --tags 'ajOK3JFt,MuVWyVfx,q9ycnATp' \
    > test.out 2>&1
eval_tap $? 11 'AdminListUserAchievements' test.out

#- 12 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'jFRQSRlA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MQkQFnCe' \
    > test.out 2>&1
eval_tap $? 12 'AdminResetAchievement' test.out

#- 13 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'gTmkOllL' \
    --namespace "$AB_NAMESPACE" \
    --userId '3DKCvtDe' \
    > test.out 2>&1
eval_tap $? 13 'AdminUnlockAchievement' test.out

#- 14 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYmvBFWR' \
    > test.out 2>&1
eval_tap $? 14 'AdminAnonymizeUserAchievement' test.out

#- 15 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '34' \
    --sortBy 'updatedAt' \
    --tags 'LK7SSJe1,71WF9ROe,GEt4XpwN' \
    --language 'bsQX9ZgF' \
    > test.out 2>&1
eval_tap $? 15 'PublicListAchievements' test.out

#- 16 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'oxwESVxj' \
    --namespace "$AB_NAMESPACE" \
    --language 'sLCDWLFp' \
    > test.out 2>&1
eval_tap $? 16 'PublicGetAchievement' test.out

#- 17 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --name 'FCIZcSEE' \
    --offset '91' \
    --sortBy '7kw469DX' \
    > test.out 2>&1
eval_tap $? 17 'PublicListTags' test.out

#- 18 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPc7yb0T' \
    --limit '7' \
    --offset '35' \
    --preferUnlocked  \
    --sortBy '8rFy2uWy' \
    --tags 'OQ6xduoJ,CTciInIu,o7vVVjQK' \
    > test.out 2>&1
eval_tap $? 18 'PublicListUserAchievements' test.out

#- 19 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'swXs6x24' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W6HAr9bo' \
    > test.out 2>&1
eval_tap $? 19 'PublicUnlockAchievement' test.out


rm -f "tmp.dat"

exit $EXIT_CODE