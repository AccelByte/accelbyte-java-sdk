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
echo "1..75"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespaceSlotConfig
./ng net.accelbyte.sdk.cli.Main social getNamespaceSlotConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetNamespaceSlotConfig' test.out

#- 3 UpdateNamespaceSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateNamespaceSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxSlotSize": 43, "maxSlots": 66}' \
    > test.out 2>&1
eval_tap $? 3 'UpdateNamespaceSlotConfig' test.out

#- 4 DeleteNamespaceSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteNamespaceSlotConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'DeleteNamespaceSlotConfig' test.out

#- 5 GetUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social getUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'lLXAklTM' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZWDN6Qj9' \
    --body '{"maxSlotSize": 53, "maxSlots": 29}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPlMAAVl' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '13ZPfOeS' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'EXHKvjy5' \
    --userId 'S4dyj6AC' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPLMGkd2' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'k6WMGNnT' \
    --userId 'PFipyvw4' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'qY4yFwQI,wFEnPJ9V,Ab5dlcTu' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'uh0yhnyr' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'mSO5xZak' \
    --body '{"achievements": ["DQBlQpjv", "FGXUXIzB", "BViJbjlR"], "attributes": {"RiOAA4Pk": "QyNswFkf", "yOkn5Uun": "EMXx4jTh", "L62RLLFB": "8YkJqYac"}, "avatarUrl": "eT3x1S3u", "inventories": ["uOC7a8xg", "LEQTpSza", "LblHZZcb"], "label": "dNh9o6Bz", "profileName": "AVzvUB7P", "statistics": ["ZpDzDqV5", "W9M2ubOo", "pt0ac5za"], "tags": ["yHGEJRyh", "p01Tod7n", "93grNDg3"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'sOuJ5FaB' \
    --userId '1ISJtFQo' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'LOnbr3aR' \
    --userId 'TioE1Nom' \
    --body '{"achievements": ["YDVBifQc", "czQhdr9D", "XivuFIvA"], "attributes": {"KBvK8bPC": "LSsv9P6k", "jk2zQTV1": "ychKi6CW", "bq2OuxQR": "kZsiv1Wn"}, "avatarUrl": "65jV6iLT", "inventories": ["LHeC2Aao", "lJ0M91EN", "ZncwYLg5"], "label": "V3ottDFn", "profileName": "zA08sXFW", "statistics": ["lJWwZ9VH", "C5XcPQjr", "wzCsuJ7h"], "tags": ["I55xWIgJ", "FUzp9Bsn", "cSNjC7ix"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'qZ2x5awt' \
    --userId 'MqAOtC1C' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'qftFk7C3' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'dLbVbre1' \
    --userId 'gfndnq6B' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'Ytyrganv' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'pnyvMVdk' \
    --userId 'nFGfhkUM' \
    --body '{"name": "9gVa3fyO", "value": "HqDQCmBe"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMEQUEG9' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'URYWxXpG' \
    --label '5ShTHOMs' \
    --tags 'Dn6izmtS,zUEaANCs,ns26aGPu' \
    --checksum '2GMD5R4F' \
    --customAttribute 'HUR7Vaoo' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'gAD4U7Io' \
    --userId 'Lbw2WIaX' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'aGs3Lkvq' \
    --userId 'vU7LdEdB' \
    --label 'SwJnyCbe' \
    --tags 'ReYY9n5K,lYRggAND,w3km9tZK' \
    --checksum 'W3DxaiXZ' \
    --customAttribute '0Sde2Zdx' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'kyzngMSP' \
    --userId 'GN6n1cvS' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId '8jVAOuN0' \
    --userId '5EnMCrUm' \
    --body '{"customAttribute": "Py2a3k6W", "label": "Dbot1ieO", "tags": ["9bLAaMLW", "S9OBXg2Z", "hK6Xnyku"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jOS7QpvV' \
    --userIds 'MXyKtlLM' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6178453332220667, "statCode": "n7WwNzPN", "userId": "eb5wfjqQ"}, {"inc": 0.4290498066189633, "statCode": "HwNY0K2C", "userId": "azu5hynJ"}, {"inc": 0.5069193381613734, "statCode": "Lc8BxLxV", "userId": "tgg5nO6h"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8341691684988914, "statCode": "ZcOjytRZ", "userId": "eJzJg3Gz"}, {"inc": 0.5291075223706412, "statCode": "I4nEAIzv", "userId": "MnpW1Mtx"}, {"inc": 0.40927729249495615, "statCode": "xwSw9uk0", "userId": "Q2r5KtI5"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 's96qc5QU' \
    --userIds 'oAkX1QBp,ToW9VFte,6RinThXC' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "5lltk89t", "userId": "vyZkb5cf"}, {"statCode": "Whq5MBQH", "userId": "Elw37CFs"}, {"statCode": "0p2J5OU4", "userId": "Cp5AgSiy"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.9166461647224178, "description": "M3qyHQQa", "incrementOnly": false, "maximum": 0.48184041341867434, "minimum": 0.44246874973292594, "name": "F0RQepdc", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "mg9tXI10", "tags": ["ppkynNKQ", "eOSoDr12", "on6a2HOm"]}' \
    > test.out 2>&1
eval_tap $? 33 'CreateStat' test.out

#- 34 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'ExportStats' test.out

#- 35 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 35 'ImportStats' test.out

#- 36 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '73' \
    --keyword 'DKoIubMl' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '3PT5lq6I' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p0h2G55M' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'drI5gBBI' \
    --body '{"defaultValue": 0.2840489204467104, "description": "7mQ3w8K1", "name": "K2TsJzWY", "tags": ["Us83smu4", "jEpMaMd6", "CfYTTgYM"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jyA0umSP' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'QXyCPcrZ' \
    --limit '19' \
    --offset '48' \
    --statCodes 'mREtYWPh' \
    --tags 'awA5PTV9' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'k4Z61P6s' \
    --body '[{"statCode": "Mw2YqTde"}, {"statCode": "85jQnuB1"}, {"statCode": "qsVbDBiw"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TlCspKMF' \
    --body '[{"inc": 0.9134418867571875, "statCode": "PgzX3mDC"}, {"inc": 0.8532838776125699, "statCode": "hPNQSDcR"}, {"inc": 0.5808126766006173, "statCode": "4I47kTbK"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWAqcAQ1' \
    --body '[{"inc": 0.2534392466036587, "statCode": "CnlEfILU"}, {"inc": 0.016770880858658632, "statCode": "PZTzMePq"}, {"inc": 0.44187751604853087, "statCode": "0JojvURP"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2IH4PgLf' \
    --body '[{"statCode": "Qbd99SoR"}, {"statCode": "Oj221Qow"}, {"statCode": "UjWN8iHk"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pdGpOmX1' \
    --userId 'HGN5C1Ae' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '7jtpP8C6' \
    --userId 'KUogLhpr' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kaWT4LP5' \
    --userId 'L8HTXgqd' \
    --body '{"inc": 0.7648955268355747}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'g3Zr6vc4' \
    --userId '7NEhd1tk' \
    --additionalKey '9sRAdVOp' \
    --body '{"additionalData": {"LrIVjMLq": {}, "93tYZfAd": {}, "dd2t8rUH": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LxrgN0bj' \
    --userIds 'F7BKeQtU' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9114331597378215, "statCode": "7cn2tHNL", "userId": "9QScV0L1"}, {"inc": 0.34016597095565004, "statCode": "jhHmxxYH", "userId": "O35ysmXw"}, {"inc": 0.19685883067247056, "statCode": "wk8CInkF", "userId": "7Sb7SzCW"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9807375651032266, "statCode": "HtMJuYJJ", "userId": "s5vASkKu"}, {"inc": 0.6515684493149233, "statCode": "JtbqhREU", "userId": "xACpwxqM"}, {"inc": 0.4026785997522262, "statCode": "awxUF98Y", "userId": "c80dkODI"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "pKQNegge", "userId": "K8uF6ZjQ"}, {"statCode": "Y25mnAOf", "userId": "f8yWQ24Q"}, {"statCode": "CPpWLNpJ", "userId": "PrU8lM6b"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.40030330279725146, "description": "hU0DFgcm", "incrementOnly": false, "maximum": 0.8724249865940213, "minimum": 0.6063643223564821, "name": "ztZODB0J", "setAsGlobal": false, "setBy": "SERVER", "statCode": "OtbWKtr3", "tags": ["cH1X582R", "E6FtJ1R2", "DrzT4kGR"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'aQBipHnd' \
    --limit '34' \
    --offset '63' \
    --statCodes 'D1i8asme' \
    --tags 'hSHk6JbJ' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'M2Mg3P4w' \
    --body '[{"statCode": "rnZkdk9N"}, {"statCode": "XzDtzoKV"}, {"statCode": "jQDe2Pb8"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B7gEUfgE' \
    --statCodes 'bskSS2e5,9cwsrr5h,S7E1tT6V' \
    --tags 'aWpOJ6l6,R9y39ICr,ybv1SSLF' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBo9B02I' \
    --body '[{"inc": 0.8519623217460001, "statCode": "r5Df2Jha"}, {"inc": 0.3907801724058496, "statCode": "WH9f1mLb"}, {"inc": 0.8354127738551026, "statCode": "3gDncVRC"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ip8qqq9a' \
    --body '[{"inc": 0.2537400874119685, "statCode": "u9cPmpyZ"}, {"inc": 0.8322594799637143, "statCode": "Dm4f3Vjn"}, {"inc": 0.05809534245521775, "statCode": "ZriHTJxZ"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bj9OeW0c' \
    --body '[{"statCode": "kP6isy7n"}, {"statCode": "0Nn7BRUi"}, {"statCode": "XuLL33pF"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Jv21Fj87' \
    --userId 'cbtecfZi' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LkhPlNTc' \
    --userId 'JYyU0kme' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '7649KKoU' \
    --userId 'cu9w0WpR' \
    --body '{"inc": 0.41265051206840486}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BehHuAmm' \
    --userId 'qydW5PLW' \
    --body '{"inc": 0.007484009222995525}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CtgZJEIJ' \
    --userId 'JASZvIKE' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"wcfPF3R8": {}, "kubLBQs2": {}, "4lC7uq80": {}}, "additionalKey": "jg71MT1e", "statCode": "9kIB0oBt", "updateStrategy": "MIN", "userId": "9O3o0LNs", "value": 0.7537581562587746}, {"additionalData": {"BCKAOvl9": {}, "WVmksaEk": {}, "qhY6thEV": {}}, "additionalKey": "eDGM1n6z", "statCode": "TxX5anap", "updateStrategy": "MAX", "userId": "jDV4UGEl", "value": 0.6337683231714429}, {"additionalData": {"XsVeYjMv": {}, "UzktDCTR": {}, "unA9YGh9": {}}, "additionalKey": "1iUrUv9J", "statCode": "NCOXUCPq", "updateStrategy": "MIN", "userId": "09VVrPcD", "value": 0.17117172915502366}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'pFk1aXYr' \
    --statCode '4KuAgmV9' \
    --userIds 'azfzYyvE,IZ7UXtNs,oCfKe1kK' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sl3BemFo' \
    --additionalKey 'XYN16Nns' \
    --body '[{"additionalData": {"yNW8QRu6": {}, "xSN0G1cw": {}, "LpePPe8k": {}}, "statCode": "HmgoiL5b", "updateStrategy": "MAX", "value": 0.10367847272332709}, {"additionalData": {"Stqkhy5j": {}, "exXyzvrP": {}, "nC5ZfDFw": {}}, "statCode": "GZbIuS7g", "updateStrategy": "INCREMENT", "value": 0.9037783891237422}, {"additionalData": {"F2O58mU4": {}, "To8OtfjD": {}, "JqmERZlj": {}}, "statCode": "7XqyUaSd", "updateStrategy": "MIN", "value": 0.815731798666688}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'QonP9qhp' \
    --additionalKey 'iLRkcFg0' \
    --body '[{"additionalData": {"E338Ia0y": {}, "F7kMIA1h": {}, "coUhTZx8": {}}, "statCode": "g7yylJgn"}, {"additionalData": {"Tg0Bnjgq": {}, "SJRbeVav": {}, "XqcykP3u": {}}, "statCode": "u6wE64iG"}, {"additionalData": {"WrLn4D2u": {}, "NsxFWrcj": {}, "0zp9oFbr": {}}, "statCode": "i6xAybEA"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ffF6HiIL' \
    --userId 'US1xeviQ' \
    --additionalKey 'uPGmQrpe' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '66cpfMJc' \
    --userId 'pDMnEJkw' \
    --additionalKey 'eb7D3EvT' \
    --body '{"additionalData": {"4cfZnEEn": {}, "zdpUZkfJ": {}, "ZTzGoMYs": {}}, "updateStrategy": "MAX", "value": 0.32731668998641106}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"zhbTXbz0": {}, "r3iVifng": {}, "XBXJiJFv": {}}, "additionalKey": "GapMSCch", "statCode": "iPGsdinX", "updateStrategy": "MAX", "userId": "zjMdukC8", "value": 0.12845083780589328}, {"additionalData": {"DheA2EAR": {}, "AR40eyKi": {}, "WYrlgiVf": {}}, "additionalKey": "qvnP1mVv", "statCode": "25x4r2m7", "updateStrategy": "MIN", "userId": "fQ6tRy1G", "value": 0.6902808890587587}, {"additionalData": {"MaLQxmAB": {}, "ENqNWxLl": {}, "2cWCoizw": {}}, "additionalKey": "eWBxNxiG", "statCode": "b6x3pl7Z", "updateStrategy": "MAX", "userId": "o3gr7SZj", "value": 0.9782514856275237}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WxJSR3CW' \
    --additionalKey '8M7dyk05' \
    --statCodes 'U9keU3hy,HqnVDxY6,l3TDEiNS' \
    --tags 'YE1rwRtY,hnoYf0of,Xa61LwF5' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i2ZELsrA' \
    --additionalKey '9r16Zicz' \
    --body '[{"additionalData": {"QfH1DrBq": {}, "ERWl17EJ": {}, "xvEhbeoq": {}}, "statCode": "mtkjmeox", "updateStrategy": "MIN", "value": 0.8313254306663364}, {"additionalData": {"AElrhxXH": {}, "6YdmSE3e": {}, "hGJtBc4W": {}}, "statCode": "s9ssVm2d", "updateStrategy": "INCREMENT", "value": 0.2971832137641679}, {"additionalData": {"O9EngTxy": {}, "KEPAC2nO": {}, "UHWulxI2": {}}, "statCode": "z3R9fUVA", "updateStrategy": "MIN", "value": 0.8965448313955612}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vpE5J50k' \
    --userId '2P21ay6e' \
    --additionalKey 'bETa333e' \
    --body '{"additionalData": {"SBt2ln67": {}, "kq3KyC60": {}, "uplQTaCN": {}}, "updateStrategy": "INCREMENT", "value": 0.15382206345570526}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE