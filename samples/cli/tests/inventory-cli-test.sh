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
echo "1..34"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'EAxcVpFrttufHIRd' \
    --limit '68' \
    --offset '59' \
    --sortBy 'createdAt' \
    --userId 'UzVRiXbqlAw7r6W2' \
    > test.out 2>&1
eval_tap $? 2 'AdminListInventories' test.out

#- 3 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "ktQG0h5JAav5kRa6", "userId": "2WopBJHPtcDs8bBZ"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateInventory' test.out

#- 4 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'LCXLx8bbgorQeFbQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetInventory' test.out

#- 5 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId '1g7qbPngUNB1vRod' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 46}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateInventory' test.out

#- 6 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'ElFHHdgs21Jub74C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "UkNmKJfh5pUkHODp"}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteInventory' test.out

#- 7 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'oMF78NY4YkHs1cnz' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '72' \
    --qtyGte '91' \
    --sortBy 'updatedAt:asc' \
    --sourceItemId 'ogW7olvbTgrhRTcP' \
    --tags 'iSuL0Sly6XM4OI18' \
    > test.out 2>&1
eval_tap $? 7 'AdminListItems' test.out

#- 8 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'mAQLnzjMf8GZ2WBZ' \
    --itemId 'qxYG3aREAu2D6QVK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminGetInventoryItem' test.out

#- 9 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'NCWP75TB0i7pKxR8' \
    --limit '7' \
    --offset '42' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 9 'AdminListInventoryConfigurations' test.out

#- 10 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mKtPDKJDXn7Z4U68", "description": "su8XfqlqNiTvB6Sd", "initialMaxSlots": 55, "maxInstancesPerUser": 30, "maxUpgradeSlots": 6, "name": "rKsxwkosAVerXpc1"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateInventoryConfiguration' test.out

#- 11 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'C8XfwHuKeb9l3rGN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetInventoryConfiguration' test.out

#- 12 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '9A3sNm84hddSpHt0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "P7MIIR7CkyF6C7du", "description": "uyZ0GhDogqrhBRd8", "initialMaxSlots": 23, "maxInstancesPerUser": 59, "maxUpgradeSlots": 79, "name": "R6qVNPRZYdFLIAjG"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateInventoryConfiguration' test.out

#- 13 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'GJddVCvu9vx5KQ7K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteInventoryConfiguration' test.out

#- 14 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '27' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListItemTypes' test.out

#- 15 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "IuMBvaO35llzQRaT"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateItemType' test.out

#- 16 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '5kPxUfofvnnSuB0y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteItemType' test.out

#- 17 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '99' \
    --owner 'mCVuHOPlLlkvR8sK' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 17 'AdminListTags' test.out

#- 18 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "SxTeIv53HGCiljvj", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminCreateTag' test.out

#- 19 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'oyD6SCwGrncqmLtj' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteTag' test.out

#- 20 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'QHAf8TgoNm03VLis' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V6zwPuo3td6TC6I3' \
    --body '[{"customAttributes": {"lMjGSWN2laRlxfcj": {}, "HfYakUCTqGkE7wcW": {}, "fDslpJSqGAXQ0yYo": {}}, "id": "NRKd3IL5TAQ6iiPl", "serverCustomAttributes": {"SC2uE4o5Vwdo3feP": {}, "qIJA8IHtrkmu0hpD": {}, "DWVAla2l5BYNtIuS": {}}, "tags": ["5S5XUdjsoqwGyzzW", "i9gwQYv7t1o7TTr1", "DmrhZv15T7quIOvB"], "type": "McaYmvCkGZ5dAgqx"}, {"customAttributes": {"pBFmaLoxozr6wfNP": {}, "X2bOItRMvqtlB2jJ": {}, "CSQT279ZZPYGu0rd": {}}, "id": "lgdWyOtXi3choQrp", "serverCustomAttributes": {"OsDBU5SepjChB3V0": {}, "v52Dlym6puQ23xoJ": {}, "8aeCnaLpUKp44YUD": {}}, "tags": ["jasWIPUvmEejtGeo", "yIPa8ZRrvjj7il35", "MXbN9oCMNqq98SjT"], "type": "vhZNkSQ70D0H6BXk"}, {"customAttributes": {"sUC9b6i5lZC9xv32": {}, "e8c5csSovoqsZNBd": {}, "te9NDUPVJf6c2Z0Q": {}}, "id": "ZxfgPubTDIHrvqAT", "serverCustomAttributes": {"huwjRHpKKTlmVr9X": {}, "uoJbRFQSKVPHbn4X": {}, "xtu7LQRENjEEztx1": {}}, "tags": ["WsYSiZqan0nSBJro", "av91GXlvPG6bFYRe", "VHQipcCx9Zw5D2L7"], "type": "vIYhGGSyEW4ZJJ42"}]' \
    > test.out 2>&1
eval_tap $? 20 'AdminBulkUpdateMyItems' test.out

#- 21 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'd3PBddN8S48l9lyN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ApflxqMrj3oZk03Q' \
    --body '{"customAttributes": {"XcKMDYDDxHSZjtqX": {}, "yJ58f7Gc26SaiGVk": {}, "ydwYWQG26yUZNmTB": {}}, "qty": 5, "serverCustomAttributes": {"pFDcSDG8aMVGLiBN": {}, "rDjqoxcwgGLXpUL4": {}, "pp2ncYAHdNzDmeIP": {}}, "sourceItemId": "6rOvDz9KOsb392k6", "tags": ["YmJFfRByjlBiuFM3", "FIoVk8T3GpAnkCmB", "Uqg2SCnqntX9y1aZ"], "type": "SWMiVi10sG6vxkfU"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminSaveItemToInventory' test.out

#- 22 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'cmqRRbceJ5i0EeDx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OgBnhhqElIaDml48' \
    --body '{"ids": ["wdNFLTm5T50x9WT0", "GfH2rtOa4EXsXzOX", "QAk4mqrxzTtuLl4X"]}' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkRemoveItems' test.out

#- 23 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'lbGL8QOxtjzm8y2w' \
    --itemId 'NhmwoYZyI4EFZKBc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YrCEAE7WIsfmx40N' \
    --body '{"qty": 77}' \
    > test.out 2>&1
eval_tap $? 23 'AdminConsumeUserItem' test.out

#- 24 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '31A806DJgas4b6z3' \
    --body '{"customAttributes": {"LNUj7fdgLA84Z8YY": {}, "k6QEgJjBbEDoNf3n": {}, "0hEoRCAcf80zfFya": {}}, "inventoryConfigurationCode": "bWAgIUXiI07A68ea", "qty": 33, "serverCustomAttributes": {"wxcfMy9XzjjI5Ybs": {}, "KoADkzJEN2VHzih3": {}, "bit0VWn3CO39PXDN": {}}, "sourceItemId": "xtXgeO3FgkXhjDza", "tags": ["QY3snn2ZkP7cFdP4", "3e5dC9XIBudfZgrb", "HDIDm4hMzF4Txode"], "type": "nSrUTvfqU0bfoMm5"}' \
    > test.out 2>&1
eval_tap $? 24 'AdminSaveItem' test.out

#- 25 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'cTtFWbotQyXJRcQW' \
    --limit '39' \
    --offset '25' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListInventoryConfigurations' test.out

#- 26 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '85' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListItemTypes' test.out

#- 27 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '26' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 27 'PublicListTags' test.out

#- 28 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'Dg7VYPXIuvUYTZBR' \
    --limit '42' \
    --offset '8' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 28 'PublicListInventories' test.out

#- 29 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'Svf9699mCEHThUJk' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '80' \
    --qtyGte '93' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'AsSp7gh4TeUTkOkA' \
    --tags 'YfJB8AT9t4Tv207Y' \
    > test.out 2>&1
eval_tap $? 29 'PublicListItems' test.out

#- 30 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId '2QD3oD5fLCr3OOlX' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"Vv8ZGF7uYnGzpipN": {}, "DigNJma1MbqqZtfN": {}, "Wql4nmwAft4gqkNN": {}}, "id": "lWkD9eOziYRFOn0j", "tags": ["JLHC9LxhvNXTwGBC", "tohLtl9Zuhytm5UD", "rT6QXCs5SPBbRPZT"]}, {"customAttributes": {"F6oQAXVG7tnsZg5Q": {}, "gXjvyGJPN4eXbJE5": {}, "Vs2GcyomQoIXimBJ": {}}, "id": "ehyxlNsjUgxBkF6w", "tags": ["FPoJeQediogEhhM2", "rIizGdKvOPdq5xrg", "xSmy1DN9LFkYW5DQ"]}, {"customAttributes": {"yj4bj5Ro2ogaKt2u": {}, "jQSa3Zdb65UXmy0Z": {}, "p6iIaTIKUkmkk9QM": {}}, "id": "0NBMA9ORxpzwLR2A", "tags": ["K6eXUGPJsw1fiP80", "G9Pclxcft2ulIJzP", "yrVEiOG4UcqsuGKH"]}]' \
    > test.out 2>&1
eval_tap $? 30 'PublicBulkUpdateMyItems' test.out

#- 31 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'hMRWLVd3DlhLuIpo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["mM8sm1MiaI1mX2tJ", "oARtdbBe7udsMrok", "0WvGYYnx4V709xbn"]}' \
    > test.out 2>&1
eval_tap $? 31 'PublicBulkRemoveMyItems' test.out

#- 32 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'GezKsDwG2omOR2nv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"id": "YI9TVqJdvzcWbfUp", "qty": 1}, {"id": "7u8RiWyerCSa8SRg", "qty": 46}, {"id": "jdrrIxsB0NRsB1fP", "qty": 33}], "srcInventoryId": "CWwNTAhd2wrS0uPd"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicMoveMyItems' test.out

#- 33 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'jhdinpng5BLy8wbh' \
    --itemId 'MssAHjapIkY9Rf4w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'PublicGetItem' test.out

#- 34 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'P57dBZNR88YbCtmK' \
    --itemId 'y8M9zVrjfGXZnqAQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 95}' \
    > test.out 2>&1
eval_tap $? 34 'PublicConsumeMyItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE