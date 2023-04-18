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
    --limit '62' \
    --offset '39' \
    --sortBy 'updatedAt' \
    --tags 'wYCA9kPI6LZrkq6D,c09nIW0Oaiw9B0D7,eHpzSn3ZPUdc0qh4' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "n8mzZ0m8SAMTwE6I", "defaultLanguage": "56IaRDBXxyaNoMR6", "description": {"hkspInrAip6lyzSx": "wElFHHdgs21Jub74", "CUkNmKJfh5pUkHOD": "poMF78NY4YkHs1cn", "z1JSDgY1TXp38zsC": "TCrbCbPOyNQkT7Nv"}, "global": true, "goalValue": 0.6494097448606809, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "mAQLnzjMf8GZ2WBZ", "url": "qxYG3aREAu2D6QVK"}, {"slug": "NCWP75TB0i7pKxR8", "url": "dl0zRVW4EZG9m0Xc"}, {"slug": "gGVbMqSszE8GHavj", "url": "7AorKsxwkosAVerX"}], "name": {"pc1C8XfwHuKeb9l3": "rGN9A3sNm84hddSp", "Ht0P7MIIR7CkyF6C": "7duuyZ0GhDogqrhB", "Rd8lDR6qVNPRZYdF": "LIAjGGJddVCvu9vx"}, "statCode": "5KQ7KYnIuMBvaO35", "tags": ["llzQRaT5kPxUfofv", "nnSuB0y5WUlrMdI4", "sNveabntBSxTeIv5"], "unlockedIcons": [{"slug": "3HGCiljvjKoyD6SC", "url": "wGrncqmLtjQHAf8T"}, {"slug": "goNm03VLisV6zwPu", "url": "o3td6TC6I3lMjGSW"}, {"slug": "N2laRlxfcjHfYakU", "url": "CTqGkE7wcWfDslpJ"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'SqGAXQ0yYoNRKd3I,L5TAQ6iiPlSC2uE4,o5Vwdo3fePqIJA8I' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'Htrkmu0hpDDWVAla' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '2l5BYNtIuS5S5XUd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'jsoqwGyzzWi9gwQY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "v7t1o7TTr1DmrhZv", "description": {"15T7quIOvBMcaYmv": "CkGZ5dAgqxpBFmaL", "oxozr6wfNPX2bOIt": "RMvqtlB2jJCSQT27", "9ZZPYGu0rdlgdWyO": "tXi3choQrpOsDBU5"}, "global": false, "goalValue": 0.0726650981745568, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "8MyKrQpM4hkkK6KK", "url": "XNB3Gv0IqmF51Tkh"}, {"slug": "jYnaq6foWvXa3bMr", "url": "XsDr6kILsSSyDdmy"}, {"slug": "kmoPYgc2L4jk4Lo0", "url": "LSP0pf4IxjUkl535"}], "name": {"X3ateEKDpADz1x3p": "oD3Qgb3boLQQ1MzH", "7Qm8bwbmXgdAPh1E": "ThG96gAFKK2WDgCc", "xvONZm3EeERmDnye": "FoF7VSZ6pf3vneSD"}, "statCode": "2Tb3g7mSQUhAEtrm", "tags": ["jqU6YE3p4lSck0ZH", "n5GI39YBHqaTHeKt", "W18iGeUlc9d9sogW"], "unlockedIcons": [{"slug": "a24CKNS0GqVvUfHQ", "url": "vsHXNUNe4mhgo5QB"}, {"slug": "65lSAiYnNjkfZrQv", "url": "GgbLdLsFzHkBMr1y"}, {"slug": "rOMlNFSrUEirnjX9", "url": "fDmIbeZxzfTcyiuA"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'Tus9hsfpFDcSDG8a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'MVGLiBNrDjqoxcwg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 68}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'j88cekdqCt81P1kt' \
    --limit '11' \
    --offset '52' \
    --sortBy 'Iovmv9gsR5cJcHm3' \
    --status 'SZLxoRDFuuuySj29' \
    --tags 'a9LJE8HoRS1X2PFA,AMwzHPxB1UskYs4Y,w20DOqOBSC2DKHRu' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'PMMWH8Yb33T5UBJC' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '12' \
    --sortBy 'EeDxOgBnhhqElIaD' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'ml48wdNFLTm5T50x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --name 'WT0GfH2rtOa4EXsX' \
    --offset '53' \
    --sortBy '1yEkLgh3tIYt4SqY' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'UTLDx9gIiDandpGT' \
    --limit '39' \
    --offset '47' \
    --preferUnlocked  \
    --sortBy '24aOMh5eC3IHeHSK' \
    --tags 'LCa3xreNDUWehwH3,q31A806DJgas4b6z,3LNUj7fdgLA84Z8Y' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'Yk6QEgJjBbEDoNf3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n0hEoRCAcf80zfFy' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'abWAgIUXiI07A68e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aqC2J9jyEW6GLbc0' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NaKDUL3sa13lk1dQ' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'BHO86IlBhnetU4Rw' \
    --achievementCodes 'TqUXlTDBzOuYsaZA' \
    --limit '0' \
    --offset '50' \
    --sortBy 'QY3snn2ZkP7cFdP4' \
    --tags '3e5dC9XIBudfZgrb,HDIDm4hMzF4Txode,nSrUTvfqU0bfoMm5' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '5' \
    --offset '20' \
    --sortBy 'createdAt' \
    --tags 'tFWbotQyXJRcQWsm,qPNs92epxk0i8Vxs,ZNereSvf9699mCEH' \
    --language 'ThUJkETAsSp7gh4T' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'eUTkOkAYfJB8AT9t' \
    --namespace "$AB_NAMESPACE" \
    --language '4Tv207Y2QD3oD5fL' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'Cr3OOlXVv8ZGF7uY' \
    --limit '28' \
    --offset '66' \
    --sortBy 'o4zGYY7KQI1AeFgP' \
    --status 'qaOkvo1aolB4lkKB' \
    --tags '4EYOkQ1jMD3cym8x,IfkOVW2grREOLx0K,Oww3HICQLfl7MUBG' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode '7qtPu64yAtURKLRk' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '2' \
    --sortBy '738HGS6rDgMdIIlh' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name 'Zg5QgXjvyGJPN4eX' \
    --offset '2' \
    --sortBy 'Kc50Kv6ecnEevcAx' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '2K2zkRenmPZnGBt4' \
    --limit '86' \
    --offset '65' \
    --preferUnlocked  \
    --sortBy '7WnbdSJtjX7ZshZy' \
    --tags 'Zl5x4bRXBHUTrDzZ,SKscfOcYu3dpCROY,qUiGKXVFCmpo6sPw' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'VOEDSJsEK5QpNhlI' \
    --namespace "$AB_NAMESPACE" \
    --userId '2iS5EpGhhvXYck0u' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'pMzUYnb76tFkEORV' \
    --achievementCodes '3bu1bNCtX7W40V6D' \
    --limit '29' \
    --offset '37' \
    --sortBy 'G9Pclxcft2ulIJzP' \
    --tags 'yrVEiOG4UcqsuGKH,hMRWLVd3DlhLuIpo,mM8sm1MiaI1mX2tJ' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'oARtdbBe7udsMrok' \
    --namespace "$AB_NAMESPACE" \
    --userId '0WvGYYnx4V709xbn' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE