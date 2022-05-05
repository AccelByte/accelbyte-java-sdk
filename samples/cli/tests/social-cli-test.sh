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
echo "1..70"

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

#- 30 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "dsJLhsVy", "userId": "Exrkxoot"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkResetUserStatItem' test.out

#- 31 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetStats' test.out

#- 32 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.8267966763880049, "description": "7WOfercZ", "incrementOnly": false, "maximum": 0.24471400376684005, "minimum": 0.044827790074906226, "name": "37Ds7YSf", "setAsGlobal": true, "setBy": "SERVER", "statCode": "aI3uzLte", "tags": ["MbFAlt4h"]}' \
    > test.out 2>&1
eval_tap $? 32 'CreateStat' test.out

#- 33 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ExportStats' test.out

#- 34 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'ImportStats' test.out

#- 35 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --keyword 'r7HmOYiB' \
    > test.out 2>&1
eval_tap $? 35 'QueryStats' test.out

#- 36 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'A5ltAOXm' \
    > test.out 2>&1
eval_tap $? 36 'GetStat' test.out

#- 37 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lG6eh1dT' \
    > test.out 2>&1
eval_tap $? 37 'DeleteStat' test.out

#- 38 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'doTFpBIc' \
    --body '{"description": "uC1dQY93", "name": "OJnJ6Te9", "tags": ["vD8ldz7H"]}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateStat' test.out

#- 39 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8AD79kd' \
    > test.out 2>&1
eval_tap $? 39 'GetUserStatItems' test.out

#- 40 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'WunvizU0' \
    --body '[{"statCode": "q1pHyhhE"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkCreateUserStatItems' test.out

#- 41 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RoGgdrys' \
    --body '[{"inc": 0.6054030517210108, "statCode": "zBGSRdP2"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkIncUserStatItem1' test.out

#- 42 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7DNSZ8A' \
    --body '[{"inc": 0.2614624114028117, "statCode": "XiPLQXSe"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItemValue1' test.out

#- 43 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '07ZddOGT' \
    --body '[{"statCode": "MlJjBwj9"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkResetUserStatItem1' test.out

#- 44 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HJHQKseE' \
    --userId 'dSXRDSvg' \
    > test.out 2>&1
eval_tap $? 44 'CreateUserStatItem' test.out

#- 45 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uauw1xT7' \
    --userId 'eMwSl9ML' \
    > test.out 2>&1
eval_tap $? 45 'DeleteUserStatItems' test.out

#- 46 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'H0NnTJ2u' \
    --userId 'lNzBvwJa' \
    --body '{"inc": 0.9842507217807595}' \
    > test.out 2>&1
eval_tap $? 46 'IncUserStatItemValue' test.out

#- 47 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a547Jllv' \
    --userId 'A8RWSpab' \
    --body '{"additionalData": {"Ut7xk6Qx": {}}}' \
    > test.out 2>&1
eval_tap $? 47 'ResetUserStatItemValue' test.out

#- 48 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yWhfqoWf' \
    --userIds 'Jw2o8oWU' \
    > test.out 2>&1
eval_tap $? 48 'BulkFetchStatItems1' test.out

#- 49 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2532721485049817, "statCode": "PCZ2HzT7", "userId": "NXmWDlXs"}]' \
    > test.out 2>&1
eval_tap $? 49 'PublicBulkIncUserStatItem' test.out

#- 50 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.32561673686821235, "statCode": "IdQJR5ls", "userId": "NOlvkfwa"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItemValue' test.out

#- 51 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "SbnsuLCg", "userId": "ToxuVTek"}]' \
    > test.out 2>&1
eval_tap $? 51 'BulkResetUserStatItem2' test.out

#- 52 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5498335965640428, "description": "vg6h5HIp", "incrementOnly": true, "maximum": 0.33338601242906774, "minimum": 0.2426266907543806, "name": "Ek4vj3LD", "setAsGlobal": false, "setBy": "SERVER", "statCode": "qDt8QUZD", "tags": ["pxlHasin"]}' \
    > test.out 2>&1
eval_tap $? 52 'CreateStat1' test.out

#- 53 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'GcjrkmRM' \
    > test.out 2>&1
eval_tap $? 53 'PublicQueryUserStatItems' test.out

#- 54 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ttgjDSaI' \
    --body '[{"statCode": "VBmft3Ud"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkCreateUserStatItems' test.out

#- 55 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g7p9PGmY' \
    --body '[{"inc": 0.8506426627280407, "statCode": "5kX4Msis"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItem1' test.out

#- 56 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SX28nARx' \
    --body '[{"inc": 0.762489301535472, "statCode": "pv5ou5xt"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItemValue2' test.out

#- 57 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vd28OUfC' \
    --body '[{"statCode": "t8UJC5fl"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkResetUserStatItem3' test.out

#- 58 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Nyj6HsTt' \
    --userId 'X8P3llna' \
    > test.out 2>&1
eval_tap $? 58 'PublicCreateUserStatItem' test.out

#- 59 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aS9lqyyg' \
    --userId 'PcfkJIxf' \
    > test.out 2>&1
eval_tap $? 59 'DeleteUserStatItems1' test.out

#- 60 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QZza8kNV' \
    --userId 'bDxVMq7H' \
    --body '{"inc": 0.5498505917979803}' \
    > test.out 2>&1
eval_tap $? 60 'PublicIncUserStatItem' test.out

#- 61 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '0F89xAc3' \
    --userId 'YVfaENtr' \
    --body '{"inc": 0.18555281921920364}' \
    > test.out 2>&1
eval_tap $? 61 'PublicIncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pTKZTXqz' \
    --userId 'HuBMYQSA' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue1' test.out

#- 63 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"2jz1ZOpd": {}}, "additionalKey": "OjSyMddB", "statCode": "41JuMf7R", "updateStrategy": "MIN", "userId": "BHRj8IiR", "value": 0.13380605867217576}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkUpdateUserStatItemV2' test.out

#- 64 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RllHT6Dc' \
    --body '[{"additionalData": {"40vFFA6g": {}}, "statCode": "pU7EW3x1", "updateStrategy": "OVERRIDE", "value": 0.44428418755937293}]' \
    > test.out 2>&1
eval_tap $? 64 'BulkUpdateUserStatItem' test.out

#- 65 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'm55gOeqQ' \
    --body '[{"additionalData": {"IqcJVKmB": {}}, "statCode": "M1J1IbuT"}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkResetUserStatItemValues' test.out

#- 66 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rrkbmuT1' \
    --userId 'whOqmEnD' \
    > test.out 2>&1
eval_tap $? 66 'DeleteUserStatItems2' test.out

#- 67 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XIWrBPlS' \
    --userId 'ay46mv71' \
    --body '{"additionalData": {"BAZAOjtF": {}}, "updateStrategy": "MAX", "value": 0.19538688444595897}' \
    > test.out 2>&1
eval_tap $? 67 'UpdateUserStatItemValue' test.out

#- 68 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"j7tT7TZH": {}}, "additionalKey": "WDdCkIsZ", "statCode": "oArWwPHc", "updateStrategy": "MIN", "userId": "FAdAtYci", "value": 0.591101780521284}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem1' test.out

#- 69 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IgRwFRr0' \
    --body '[{"additionalData": {"gwB9tz3v": {}}, "statCode": "p99XVlV8", "updateStrategy": "MAX", "value": 0.5689362203332181}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItem2' test.out

#- 70 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tE6n0smi' \
    --userId 'p1tw3L7c' \
    --body '{"additionalData": {"Ud9pqtv6": {}}, "updateStrategy": "OVERRIDE", "value": 0.6502290130313825}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE