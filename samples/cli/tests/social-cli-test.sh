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
echo "1..78"

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
    --body '{"maxSlotSize": 57, "maxSlots": 76}' \
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
    --userId 'f2u1KCeK' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'PpcCC1KZ' \
    --body '{"maxSlotSize": 22, "maxSlots": 28}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvQgEaov' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwvgYqPr' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'BwPIrrQp' \
    --userId 'cdMPQPpr' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'c93T8T9S' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'HbUzap6x' \
    --userId 'F3R7vtDW' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'Q0UW2KTO,AmIlLw2f,gFd95z02' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiGNUeOR' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'cmrm9SkC' \
    --body '{"achievements": ["hPMk6Esp", "abZ5eoLS", "y5N4yRPr"], "attributes": {"PM8vB16x": "vgGtaypw", "C3j8BwbN": "FfB8UB8s", "Xvu3eqPb": "bnK3uaJW"}, "avatarUrl": "nOxXGkoM", "inventories": ["pfJjFPlr", "BnkB6i16", "JmlRLmJE"], "label": "suDxUzPQ", "profileName": "GnAAGWqO", "statistics": ["dw7FQfnX", "BGxtntA7", "DmIppQWu"], "tags": ["bAaehEfQ", "05zfV9dr", "c2g6fl02"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'aPWCUYeU' \
    --userId '6SPekRoU' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'w295AHgI' \
    --userId 'ho3jJG17' \
    --body '{"achievements": ["P8OQGRdy", "4VR1yadL", "KFtW6vIH"], "attributes": {"TOO7Jpxa": "U3Je5Pca", "PQLGdxNd": "LfGsmkbu", "upWF709o": "bDKsaoaC"}, "avatarUrl": "edZDjRHa", "inventories": ["crkqj8yo", "0pim8niI", "aGohkeg0"], "label": "2JaGuTMm", "profileName": "66oB8B96", "statistics": ["AvoWkGku", "oox6xI7D", "QgQLQn3D"], "tags": ["or8uvidc", "kzknocy2", "EVLH9YRK"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'tYJNOWuP' \
    --userId 'cWWKypVl' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '0fuSl4Dj' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Dt0YTpDQ' \
    --userId 'gNFScl69' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '15nVHoOO' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'vzyB1aWs' \
    --userId 'rMUIHoCd' \
    --body '{"name": "cHUn9vos", "value": "24HRQAOC"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'QVgp7bn5' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'oUFUNZ1P' \
    --label 'qM6EAxG5' \
    --tags 'GYoswrUJ,asTLfo9U,CywHk6ny' \
    --checksum 'FCiRL7g2' \
    --customAttribute 'JcwUNjT8' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'rAi5dSQl' \
    --userId 'jM2KunKQ' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'WUjWQoCO' \
    --userId 'GNj099XN' \
    --label 'djngosqf' \
    --tags 'rG7IfVXY,iiFFKuo4,uun2l7Zt' \
    --checksum 'vEPI6jIY' \
    --customAttribute 'hhh8nvnS' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'NwtzAjOP' \
    --userId '2XEWbihb' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'f1R2tq1M' \
    --userId 'v4XgslrD' \
    --body '{"customAttribute": "nmnyuVf1", "label": "kalOm5sp", "tags": ["vHUOWhdZ", "5gqfUPC3", "VAYETBxS"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '85' \
    --statCodes 'z4yBvaxb' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lX84QRrc' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '8WJqY5pI' \
    --userIds '1LSyQV7a' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16916377184176112, "statCode": "8mYTmUn4", "userId": "qID567Yr"}, {"inc": 0.2859433645855428, "statCode": "0bqRpdZI", "userId": "guwqKLbt"}, {"inc": 0.27404737167421667, "statCode": "iYa6slku", "userId": "gfyMxrjq"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.33237895858536204, "statCode": "bYJWH7YI", "userId": "Lqmw90B5"}, {"inc": 0.3101844339431411, "statCode": "eDkU8BX4", "userId": "IHxclAR5"}, {"inc": 0.8816966733899683, "statCode": "6CutOx1S", "userId": "BxDufko6"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'x5Ajjt0E' \
    --userIds 't2krcSVL,sSDJcuKh,3DSDf9aP' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "G6w4zLYs", "userId": "0p0wkXO5"}, {"statCode": "nEj6m95J", "userId": "EgCAZIfn"}, {"statCode": "HSgailke", "userId": "WXAxVWIu"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '87' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.6445730142286586, "description": "SolxP0Z0", "incrementOnly": true, "maximum": 0.10819429192261987, "minimum": 0.6238084593463127, "name": "lVyEmMmB", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "SAlwouwp", "tags": ["r4C7J1dt", "peCB6mhf", "dlVv0NSN"]}' \
    > test.out 2>&1
eval_tap $? 34 'CreateStat' test.out

#- 35 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'ExportStats' test.out

#- 36 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 36 'ImportStats' test.out

#- 37 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '70' \
    --offset '56' \
    --keyword 'QA26dnyS' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'h33Fwft3' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nwuT4EZU' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'REChaDdm' \
    --body '{"defaultValue": 0.8586290912801134, "description": "Z7bYU5Ac", "name": "KRsuH1OT", "tags": ["0FTCbIIO", "GfooSHcy", "IGfMjIub"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rUR8zz42' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pkjegbyT' \
    --limit '5' \
    --offset '79' \
    --sortBy 'g9KYe8A6' \
    --statCodes 'HmMSs5Wj' \
    --tags 'pVbBRFu2' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1I1xG4p' \
    --body '[{"statCode": "kKxX2spx"}, {"statCode": "1afvogVn"}, {"statCode": "gIVJeTf4"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7CF0l3yB' \
    --body '[{"inc": 0.5143538492456727, "statCode": "XK0jnPoB"}, {"inc": 0.7327897061414601, "statCode": "JtK1eRk3"}, {"inc": 0.8028687129693679, "statCode": "XdpVqlpe"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2g7af9WK' \
    --body '[{"inc": 0.469462598034427, "statCode": "g8C2VGJw"}, {"inc": 0.10933072075849581, "statCode": "qWV21HWD"}, {"inc": 0.8019436356026812, "statCode": "2qo9il0T"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AVi98tnm' \
    --body '[{"statCode": "HrLNzeu4"}, {"statCode": "otOKqE62"}, {"statCode": "RG4Epm6U"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'feaaZzC6' \
    --userId '0KDiOqy6' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GFHV4LPL' \
    --userId 'tla6rpWB' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '7A3fjseZ' \
    --userId 'K4tgdBhh' \
    --body '{"inc": 0.87866370317044}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yoF9t9Yq' \
    --userId '1fxhPUCl' \
    --additionalKey '4zoaeed9' \
    --body '{"additionalData": {"zZvA8lTE": {}, "X63LEPKM": {}, "P4xqDloA": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '98' \
    --statCodes '8QOWRbXS' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UsvmA20f' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vbfVixrG' \
    --userIds 'mtSUWxCL' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7805245336704554, "statCode": "NMjdQX10", "userId": "FMAVUZEX"}, {"inc": 0.47627344051537435, "statCode": "2vt6djIY", "userId": "GM7m6gp2"}, {"inc": 0.38773764714242365, "statCode": "ODc4vFXP", "userId": "kufJKLdK"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16794789107087216, "statCode": "ipf1MAZr", "userId": "HLYj9XwK"}, {"inc": 0.1766640019840401, "statCode": "n3E9ZcZk", "userId": "TiqulVsJ"}, {"inc": 0.5756955838450553, "statCode": "bGsoV5u5", "userId": "onwtzhwT"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "apiopOLa", "userId": "MEc0n4ta"}, {"statCode": "Pj2JX32z", "userId": "bVr3fRNT"}, {"statCode": "QOBM5Hxu", "userId": "Nh2prKFJ"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.34534665189506386, "description": "NdFFGPXk", "incrementOnly": true, "maximum": 0.9218218766230751, "minimum": 0.7770641274744339, "name": "tzkTE60N", "setAsGlobal": false, "setBy": "SERVER", "statCode": "hcyol8oc", "tags": ["ncXerUnR", "iGdxyyLP", "LQ7zFopX"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Id1pEX2g' \
    --limit '46' \
    --offset '73' \
    --sortBy 'qMMZCvkq' \
    --statCodes 'rCKPPPQM' \
    --tags 'NYBolk6f' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'z3Vs1VMI' \
    --body '[{"statCode": "KAVWY6dq"}, {"statCode": "0J1AYopa"}, {"statCode": "cT2IzglF"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J11OXFIB' \
    --statCodes 'BguSKe6g,dj4Elfqp,qO60u3mo' \
    --tags 'a3AfJfp5,YQaRpsVb,onjOzS7w' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1ez9lDeD' \
    --body '[{"inc": 0.48924372245764924, "statCode": "oEMOOJdR"}, {"inc": 0.6474401273450682, "statCode": "mi92g1PX"}, {"inc": 0.43189445856995656, "statCode": "BXsNng5H"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KtzN5d7Y' \
    --body '[{"inc": 0.6297204599723587, "statCode": "6vm22HYu"}, {"inc": 0.7368830340944443, "statCode": "nlOHJQJC"}, {"inc": 0.9428271702809851, "statCode": "oxluQtn1"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBcQlyVi' \
    --body '[{"statCode": "SfAE792q"}, {"statCode": "ZFfYYQr3"}, {"statCode": "aGeBpJ46"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'S0fUdoYq' \
    --userId 'INQSso57' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9Wwofn6y' \
    --userId 'UsvJsHer' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'IfqZ8QxG' \
    --userId 'ePqtunm0' \
    --body '{"inc": 0.6981091245006046}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LVcLsB8v' \
    --userId 'DrPAWyoq' \
    --body '{"inc": 0.5197400259570515}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'opOrm9RR' \
    --userId 'jnLQrxeM' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"T9IYU9ww": {}, "kbFZenwZ": {}, "jMDAxrsQ": {}}, "additionalKey": "dnvoOu50", "statCode": "jEN4DoNe", "updateStrategy": "OVERRIDE", "userId": "M55g6zJA", "value": 0.7668501220801422}, {"additionalData": {"3PB4Msqr": {}, "2FEdBFNA": {}, "WiwtyocC": {}}, "additionalKey": "vQRveFFm", "statCode": "x4SEiADs", "updateStrategy": "OVERRIDE", "userId": "hlYcZVLb", "value": 0.8641454538520131}, {"additionalData": {"0AUT2OCj": {}, "LV9C7Agz": {}, "ybWxNIKY": {}}, "additionalKey": "reFfoyB3", "statCode": "cmCAItBm", "updateStrategy": "MAX", "userId": "ojqrKnW9", "value": 0.2083568681312329}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'qEd06MfV' \
    --statCode 'Ntiu9ngV' \
    --userIds '2vdKoX8M,GiKm4hk1,BJRTSM6Q' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'f64JvdEd' \
    --additionalKey 'ZAhrkItj' \
    --body '[{"additionalData": {"gAMSHPzj": {}, "kqa6n8QM": {}, "Ht0W7bTg": {}}, "statCode": "WkSh9Ntz", "updateStrategy": "MIN", "value": 0.44092247953826214}, {"additionalData": {"SmoGdvB6": {}, "85yUOvpm": {}, "LSd6AptG": {}}, "statCode": "nbyFkj1A", "updateStrategy": "OVERRIDE", "value": 0.7163343138856613}, {"additionalData": {"QBuacPFk": {}, "3C4PvgRa": {}, "osen6xaT": {}}, "statCode": "ci7XR4hI", "updateStrategy": "OVERRIDE", "value": 0.29648024839570364}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '02z38ji2' \
    --additionalKey 'XQbEezp7' \
    --body '[{"additionalData": {"CSLOYrTj": {}, "ke1ldW1Z": {}, "95Fx4kKh": {}}, "statCode": "aYWXJ7wD"}, {"additionalData": {"IiC59eB3": {}, "1u7dayXV": {}, "FUWupxfl": {}}, "statCode": "m1Ys75m0"}, {"additionalData": {"DYrVIeAN": {}, "C4TooS0p": {}, "r3NfT23T": {}}, "statCode": "So2UIXlZ"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QC4THQRK' \
    --userId 'zxHrp3Bt' \
    --additionalKey 'htGknFPO' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SnjwGhZK' \
    --userId 'ntlGK3YX' \
    --additionalKey 'EkVFTG4l' \
    --body '{"additionalData": {"PZRlfklI": {}, "xFBxPfJS": {}, "tRTTuYbG": {}}, "updateStrategy": "OVERRIDE", "value": 0.6861625750503846}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Bxhfd88e": {}, "dFJSVXNs": {}, "NmznMJK7": {}}, "additionalKey": "GHuasGHP", "statCode": "J7zd8CXF", "updateStrategy": "MAX", "userId": "qjEbSHtv", "value": 0.7868483522823453}, {"additionalData": {"aNhCAgNO": {}, "C0CfLChO": {}, "xZLlnxki": {}}, "additionalKey": "gtrgbFJ8", "statCode": "Dor2A6jd", "updateStrategy": "MAX", "userId": "8WDtm89K", "value": 0.056682015050485646}, {"additionalData": {"C6o2NSgB": {}, "oXFqOaKF": {}, "0pdvueeR": {}}, "additionalKey": "uighB1Oa", "statCode": "R0YtYNdQ", "updateStrategy": "MIN", "userId": "VVZkrNwU", "value": 0.08012844986086554}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DruCwYuM' \
    --additionalKey 'kUDyTwYF' \
    --statCodes '4H5HrPv5,Y8stJKBE,3vb3WhJh' \
    --tags 'se2cNVZk,gvFrw4k9,Z0aNYeuQ' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2bDflYR' \
    --additionalKey 'y7xZkdXO' \
    --body '[{"additionalData": {"6MLAe6k1": {}, "cJHx1CnE": {}, "hu1c6MCF": {}}, "statCode": "urnwFwD3", "updateStrategy": "OVERRIDE", "value": 0.4328513871654178}, {"additionalData": {"ZCBX3q7r": {}, "NVtIYTwA": {}, "slMEmqwC": {}}, "statCode": "BKJIkKVm", "updateStrategy": "MAX", "value": 0.3630925875429841}, {"additionalData": {"plCpWo25": {}, "oxsbpFbp": {}, "tNFAjb9g": {}}, "statCode": "o2zKBmac", "updateStrategy": "MAX", "value": 0.4959508726253685}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mEwafziR' \
    --userId 'QcShNlAf' \
    --additionalKey 'nUx6zYdf' \
    --body '{"additionalData": {"OfCajmHT": {}, "JACZVSAj": {}, "uZQk9tw1": {}}, "updateStrategy": "MAX", "value": 0.7360510591121451}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE