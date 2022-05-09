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
echo "1..74"

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
    --body '{"maxSlotSize": 62, "maxSlots": 39}' \
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
    --userId 'BxyZcDXB' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'pGlsQuJu' \
    --body '{"maxSlotSize": 42, "maxSlots": 77}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'f0IsJkTr' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'd8IDcV2z' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'XnTKjXY1' \
    --userId 'bPqamiBx' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'x9Cs18EY' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '84ekItqR' \
    --userId 'zHU1oh57' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds '["0KQBVaew"]' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'c72krSha' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '68n3Ynoz' \
    --body '{"achievements": ["p1C2KmIQ"], "attributes": {"TuBdNEUs": "xFb8CJ17"}, "avatarUrl": "M7DJZaMS", "inventories": ["xECbZbyg"], "label": "yoarORoe", "profileName": "NHSb8Rh3", "statistics": ["kgs9qqJb"], "tags": ["nQsoBgiV"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'pP8Cm3yv' \
    --userId 'ASUoxdxx' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'FqmAGTJ8' \
    --userId 'IEdagEtp' \
    --body '{"achievements": ["4w29KOu9"], "attributes": {"c19R6XDq": "WHkkP8np"}, "avatarUrl": "LEKMfjiX", "inventories": ["7jpkVZk3"], "label": "IaQYEmqG", "profileName": "odOEGt9g", "statistics": ["POj0c6i0"], "tags": ["JkvIas73"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ucYnFAJ3' \
    --userId 'DK5T4Eog' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'g0Y39UoY' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lpv5bVAg' \
    --userId 'tsDhUTDU' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'scbQDjbT' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'QuPMz2PT' \
    --userId 'RlkyU89Z' \
    --body '{"name": "POw6zPFJ", "value": "42cwmzBB"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'SMNcoAAO' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'jKNjfcYH' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'm093aYgB' \
    --userId 'U1sqjyK0' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'XH45PaRS' \
    --userId 'OFQBtu23' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'REZ8hRVX' \
    --userId '7LGOvDdY' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'iQS9i7mV' \
    --userId '1C91pjG9' \
    --body '{"customAttribute": "gpxL6ycT", "label": "Qdvln2LA", "tags": ["uSQWEXL6"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LFE1YHo9' \
    --userIds 'm126ZWc8' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.11136021441968946, "statCode": "HtWvbNYq", "userId": "gUqslArF"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6410856766936045, "statCode": "iHUIvaCv", "userId": "8kU9dBBp"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dsJLhsVy' \
    --userIds '["Exrkxoot"]' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "0B7WOfer", "userId": "cZdpMci3"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.9303222928912993, "description": "s7YSfExa", "incrementOnly": true, "maximum": 0.400082786263968, "minimum": 0.2982316246014147, "name": "MbFAlt4h", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "OYiBA5lt", "tags": ["AOXmlG6e"]}' \
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
    > test.out 2>&1
eval_tap $? 35 'ImportStats' test.out

#- 36 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --keyword 'h1dTdoTF' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pBIcuC1d' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QY93OJnJ' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '6Te9vD8l' \
    --body '{"description": "dz7Hu8AD", "name": "79kdWunv", "tags": ["izU0q1pH"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhhERoGg' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'drysMizB' \
    --body '[{"statCode": "GSRdP2l7"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNSZ8Aq0' \
    --body '[{"inc": 0.7676543081601597, "statCode": "PLQXSe07"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZddOGTMl' \
    --body '[{"inc": 0.5513019275367755, "statCode": "Bwj9HJHQ"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KseEdSXR' \
    --body '[{"statCode": "DSvguauw"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '1xT7eMwS' \
    --userId 'l9MLH0Nn' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TJ2ulNzB' \
    --userId 'vwJaQa54' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '7JllvA8R' \
    --userId 'WSpabUt7' \
    --body '{"inc": 0.3747526419829623}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '6QxyWhfq' \
    --userId 'oWfJw2o8' \
    --body '{"additionalData": {"oWUqvPCZ": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2HzT7NXm' \
    --userIds 'WDlXsuNI' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.0487454805996449, "statCode": "JR5lsNOl", "userId": "vkfwaSbn"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.29191831733638607, "statCode": "LCgToxuV", "userId": "TekJgvg6"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "h5HIpH0D", "userId": "viplEk4v"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.9966084446877017, "description": "3LDp4yqD", "incrementOnly": true, "maximum": 0.95058096695822, "minimum": 0.7238665506808695, "name": "DpxlHasi", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "jrkmRMtt", "tags": ["gjDSaIVB"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'mft3Udg7' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9PGmY2H' \
    --body '[{"statCode": "5kX4Msis"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SX28nARx' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WRpv5ou5' \
    --body '[{"inc": 0.36968420675412095, "statCode": "vd28OUfC"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 't8UJC5fl' \
    --body '[{"inc": 0.9876903714035955, "statCode": "yj6HsTtX"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8P3llnaa' \
    --body '[{"statCode": "S9lqyygP"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cfkJIxfQ' \
    --userId 'Zza8kNVb' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DxVMq7HJ' \
    --userId 'k0F89xAc' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '3YVfaENt' \
    --userId 'rl0pTKZT' \
    --body '{"inc": 0.7762947176567949}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zHuBMYQS' \
    --userId 'A2jz1ZOp' \
    --body '{"inc": 0.054739770539565136}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jSyMddB4' \
    --userId '1JuMf7RU' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"yBHRj8Ii": {}}, "additionalKey": "RimRllHT", "statCode": "6Dc40vFF", "updateStrategy": "MIN", "userId": "6gpU7EW3", "value": 0.36458520468327116}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dCpm55gO' \
    --userIds '["eqQIqcJV"]' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmBM1J1I' \
    --body '[{"additionalData": {"buTrrkbm": {}}, "statCode": "uT1whOqm", "updateStrategy": "MIN", "value": 0.21201206347632295}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIWrBPlS' \
    --body '[{"additionalData": {"ay46mv71": {}}, "statCode": "BAZAOjtF"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'J2vmTj7t' \
    --userId 'T7TZHWDd' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CkIsZoAr' \
    --userId 'WwPHcyFA' \
    --body '{"additionalData": {"dAtYciLI": {}}, "updateStrategy": "OVERRIDE", "value": 0.6745395388866413}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"FRr0gwB9": {}}, "additionalKey": "tz3vp99X", "statCode": "VlV8rK3t", "updateStrategy": "MIN", "userId": "6n0smip1", "value": 0.30176534764477403}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3L7cUd9p' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qtv6JfPZ' \
    --body '[{"additionalData": {"wcCVOXcV": {}}, "statCode": "a80TmCwt", "updateStrategy": "MIN", "value": 0.8542596114963421}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AH01o6Nd' \
    --userId 'cBIgzrDy' \
    --body '{"additionalData": {"WpFBYGmm": {}}, "updateStrategy": "MIN", "value": 0.01353221648376457}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE