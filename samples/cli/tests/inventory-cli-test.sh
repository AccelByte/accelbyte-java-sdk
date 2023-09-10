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
    --namespace "$AB_NAMESPACE" \
    --slotId 'qxYG3aREAu2D6QVK' \
    --sourceItemId 'NCWP75TB0i7pKxR8' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetInventoryItem' test.out

#- 9 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'dl0zRVW4EZG9m0Xc' \
    --limit '14' \
    --offset '66' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 9 'AdminListInventoryConfigurations' test.out

#- 10 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VbMqSszE8GHavj7A", "description": "orKsxwkosAVerXpc", "initialMaxSlots": 58, "maxInstancesPerUser": 36, "maxUpgradeSlots": 88, "name": "fwHuKeb9l3rGN9A3"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateInventoryConfiguration' test.out

#- 11 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'sNm84hddSpHt0P7M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetInventoryConfiguration' test.out

#- 12 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'IIR7CkyF6C7duuyZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0GhDogqrhBRd8lDR", "description": "6qVNPRZYdFLIAjGG", "initialMaxSlots": 72, "maxInstancesPerUser": 36, "maxUpgradeSlots": 8, "name": "DQQRgat0SevkLGMS"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateInventoryConfiguration' test.out

#- 13 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId '0lyuI9a2I9u6Vpbs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteInventoryConfiguration' test.out

#- 14 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '21' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListItemTypes' test.out

#- 15 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "w8hqUI06UpOXGSLm"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateItemType' test.out

#- 16 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'CVuHOPlLlkvR8sKg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteItemType' test.out

#- 17 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '47' \
    --owner 'uRkgghGoYupD391C' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 17 'AdminListTags' test.out

#- 18 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "qtPYokahFjkQsfCa", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminCreateTag' test.out

#- 19 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'mt1d67FXGk2s9Q0m' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteTag' test.out

#- 20 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'PVo3twu0MesTCf9x' \
    --namespace "$AB_NAMESPACE" \
    --userId '4rt69lna7qxNeIxP' \
    --body '{"qty": 51, "slotId": "akUCTqGkE7wcWfDs", "sourceItemId": "lpJSqGAXQ0yYoNRK"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminConsumeUserItem' test.out

#- 21 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'd3IL5TAQ6iiPlSC2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uE4o5Vwdo3fePqIJ' \
    --body '[{"customAttributes": {"A8IHtrkmu0hpDDWV": {}, "Ala2l5BYNtIuS5S5": {}, "XUdjsoqwGyzzWi9g": {}}, "serverCustomAttributes": {"wQYv7t1o7TTr1Dmr": {}, "hZv15T7quIOvBMca": {}, "YmvCkGZ5dAgqxpBF": {}}, "slotId": "maLoxozr6wfNPX2b", "sourceItemId": "OItRMvqtlB2jJCSQ", "tags": ["T279ZZPYGu0rdlgd", "WyOtXi3choQrpOsD", "BU5SepjChB3V0v52"], "type": "Dlym6puQ23xoJ8ae"}, {"customAttributes": {"CnaLpUKp44YUDjas": {}, "WIPUvmEejtGeoyIP": {}, "a8ZRrvjj7il35MXb": {}}, "serverCustomAttributes": {"N9oCMNqq98SjTvhZ": {}, "NkSQ70D0H6BXksUC": {}, "9b6i5lZC9xv32e8c": {}}, "slotId": "5csSovoqsZNBdte9", "sourceItemId": "NDUPVJf6c2Z0QZxf", "tags": ["gPubTDIHrvqAThuw", "jRHpKKTlmVr9XuoJ", "bRFQSKVPHbn4Xxtu"], "type": "7LQRENjEEztx1WsY"}, {"customAttributes": {"SiZqan0nSBJroav9": {}, "1GXlvPG6bFYReVHQ": {}, "ipcCx9Zw5D2L7vIY": {}}, "serverCustomAttributes": {"hGGSyEW4ZJJ42d3P": {}, "BddN8S48l9lyNApf": {}, "lxqMrj3oZk03QXcK": {}}, "slotId": "MDYDDxHSZjtqXyJ5", "sourceItemId": "8f7Gc26SaiGVkydw", "tags": ["YWQG26yUZNmTBcvr", "bYCwZtxFHyPLtI8i", "lbyDPUIj88cekdqC"], "type": "t81P1ktfIovmv9gs"}]' \
    > test.out 2>&1
eval_tap $? 21 'AdminBulkUpdateMyItems' test.out

#- 22 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'R5cJcHm3SZLxoRDF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uuuySj29a9LJE8Ho' \
    --body '{"customAttributes": {"RS1X2PFAAMwzHPxB": {}, "1UskYs4Yw20DOqOB": {}, "SC2DKHRuPMMWH8Yb": {}}, "qty": 90, "serverCustomAttributes": {"3T5UBJCjfcnLRfxe": {}, "CSz9WEi8KlloeH0J": {}, "T1yduat2vQR3biBf": {}}, "slotId": "su4jmsRE2w1yEkLg", "slotUsed": 14, "sourceItemId": "mqrxzTtuLl4XlbGL", "tags": ["8QOxtjzm8y2wNhmw", "oYZyI4EFZKBcYrCE", "AE7WIsfmx40NLRc6"], "type": "m8heKnWhzfe2Nube"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminSaveItemToInventory' test.out

#- 23 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'oKFeIaFQCYoDPICp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nduEEQlULdJz4mnR' \
    --body '[{"slotId": "BkMNxvvKgAT8mJrY", "sourceItemId": "q6hRkloqxM3gpwxc"}, {"slotId": "fMy9XzjjI5YbsKoA", "sourceItemId": "DkzJEN2VHzih3bit"}, {"slotId": "0VWn3CO39PXDNxtX", "sourceItemId": "geO3FgkXhjDzaQY3"}]' \
    > test.out 2>&1
eval_tap $? 23 'AdminBulkRemoveItems' test.out

#- 24 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'snn2ZkP7cFdP43e5' \
    --body '{"customAttributes": {"dC9XIBudfZgrbHDI": {}, "Dm4hMzF4TxodenSr": {}, "UTvfqU0bfoMm5cTt": {}}, "inventoryConfigurationCode": "FWbotQyXJRcQWsmq", "qty": 85, "serverCustomAttributes": {"mmDg7VYPXIuvUYTZ": {}, "BRujIUE1Tq5jyAZv": {}, "kRCMNFIurjh2imdb": {}}, "slotId": "4rbkXj0ZwsVC0gL9", "slotUsed": 45, "sourceItemId": "ZVJSPqJiwv1qlYB1", "tags": ["RSKs6gQxC3Gb7S0o", "4zGYY7KQI1AeFgPq", "aOkvo1aolB4lkKB4"], "type": "EYOkQ1jMD3cym8xI"}' \
    > test.out 2>&1
eval_tap $? 24 'AdminSaveItem' test.out

#- 25 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'fkOVW2grREOLx0KO' \
    --limit '45' \
    --offset '45' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListInventoryConfigurations' test.out

#- 26 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '55' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListItemTypes' test.out

#- 27 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '71' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 27 'PublicListTags' test.out

#- 28 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'CQLfl7MUBG7qtPu6' \
    --limit '92' \
    --offset '51' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 28 'PublicListInventories' test.out

#- 29 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'QXCs5SPBbRPZTF6o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 86, "slotId": "DgMdIIlhS1fSiM93", "sourceItemId": "31m7Ta1PsKc50Kv6"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicConsumeMyItem' test.out

#- 30 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'ecnEevcAx2K2zkRe' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '23' \
    --qtyGte '26' \
    --sortBy 'qty:asc' \
    --sourceItemId 'ZnGBt4P7WnbdSJtj' \
    --tags 'X7ZshZyZl5x4bRXB' \
    > test.out 2>&1
eval_tap $? 30 'PublicListItems' test.out

#- 31 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'HUTrDzZSKscfOcYu' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"3dpCROYqUiGKXVFC": {}, "mpo6sPwVOEDSJsEK": {}, "5QpNhlI2iS5EpGhh": {}}, "slotId": "vXYck0upMzUYnb76", "sourceItemId": "tFkEORV3bu1bNCtX", "tags": ["7W40V6Do5sYadCCF", "rHHC3DpZxkrQDXuN", "FviMarv8mnfHK8CC"]}, {"customAttributes": {"mE2lPnsbD3SGEdlw": {}, "uUccE536ugBp3HBv": {}, "epnDCjgyJlXe36mg": {}}, "slotId": "WjLfFmteue9nzJ6f", "sourceItemId": "H24T805tVg8JqU0j", "tags": ["ZpjvsugAOS7u8RiW", "yerCSa8SRgwsAj1i", "k1jglaDXTvKCWwNT"]}, {"customAttributes": {"Ahd2wrS0uPdjhdin": {}, "png5BLy8wbhMssAH": {}, "japIkY9Rf4wP57dB": {}}, "slotId": "ZNR88YbCtmKy8M9z", "sourceItemId": "VrjfGXZnqAQUoY1G", "tags": ["jlIIk0iKoTTS1j02", "o7JjTXAQN0qdskdQ", "V0TqI8EFnmDbxIxi"]}]' \
    > test.out 2>&1
eval_tap $? 31 'PublicBulkUpdateMyItems' test.out

#- 32 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '4YKlONk2Q5Y4Jvai' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "zwiilatuUjjt9lIM", "sourceItemId": "Gql5ElEa9EIIlGcH"}, {"slotId": "B3CfR3ncDlwi3v3M", "sourceItemId": "FFJ1KesKoELCpobB"}, {"slotId": "EG8X645xpdXpai0r", "sourceItemId": "YaT5hOPjaf3H0tYi"}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkRemoveMyItems' test.out

#- 33 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'ghU0VUfcYHJbBfAK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 90, "slotId": "4NTwr0KHaAsmTej5", "sourceItemId": "2WKi6tArAURt9plC"}, {"qty": 91, "slotId": "JBWic7UkBeIXuqDu", "sourceItemId": "AXI66bQ71w0deoV9"}, {"qty": 77, "slotId": "i6BqPg4xr0lCancU", "sourceItemId": "ZGCHsZYoLfR1KtOv"}], "srcInventoryId": "7Zy0b65uvuKNuy0y"}' \
    > test.out 2>&1
eval_tap $? 33 'PublicMoveMyItems' test.out

#- 34 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'tZQ7M6Nzy1adnSKO' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'LFKx1dX4LuWJu3pD' \
    --sourceItemId 'MUAeeZ97SBROPYuG' \
    > test.out 2>&1
eval_tap $? 34 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE