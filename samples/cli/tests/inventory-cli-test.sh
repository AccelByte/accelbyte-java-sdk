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
echo "1..44"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminCreateChainingOperations
eval_tap 0 2 'AdminCreateChainingOperations # SKIP deprecated' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "serviceName": "n8mzZ0m8SAMTwE6I", "targetInventoryCode": "56IaRDBXxyaNoMR6"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'hkspInrAip6lyzSx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["wElFHHdgs21Jub74", "CUkNmKJfh5pUkHOD", "poMF78NY4YkHs1cn"], "serviceName": "z1JSDgY1TXp38zsC", "targetInventoryCode": "TCrbCbPOyNQkT7Nv"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'yE3cwyALczNIicXm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'WBZqxYG3aREAu2D6' \
    --limit '87' \
    --offset '94' \
    --sortBy 'updatedAt:desc' \
    --userId 'NCWP75TB0i7pKxR8' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "dl0zRVW4EZG9m0Xc", "userId": "gGVbMqSszE8GHavj"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '7AorKsxwkosAVerX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'pc1C8XfwHuKeb9l3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 35}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId '6mXhzkzWkFeZSoEA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "cBdW19m4eu6d5tA5"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'jUmiTqpyhPFdxLzF' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '7' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId '8lDR6qVNPRZYdFLI' \
    --tags 'AjGGJddVCvu9vx5K' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'Q7KYnIuMBvaO35ll' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'zQRaT5kPxUfofvnn' \
    --sourceItemId 'SuB0y5WUlrMdI4sN' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'veabntBSxTeIv53H' \
    --limit '66' \
    --offset '58' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iljvjKoyD6SCwGrn", "description": "cqmLtjQHAf8TgoNm", "initialMaxSlots": 67, "maxInstancesPerUser": 20, "maxUpgradeSlots": 98, "name": "2s9Q0mPVo3twu0Me"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'sTCf9x4rt69lna7q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'xNeIxPz6MbwL6IY6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9z1UaLqYSYWytLPz", "description": "iZMdjxcBZufQxGiH", "initialMaxSlots": 86, "maxInstancesPerUser": 17, "maxUpgradeSlots": 24, "name": "PlSC2uE4o5Vwdo3f"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'ePqIJA8IHtrkmu0h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '25' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "n9HrNQy4uZAAiE0m"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'it9RGCCHYzUOcEds' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '17' \
    --owner 'KHPEqgA8yu7Vk6Jt' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Ymos9Jcdos4fYcTV", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName '6RBt0zYoMcHyCUEX' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'lAvxJMdalwSyliWM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NW5NyLu0M3VHh2EI' \
    --dateRangeValidation '8JlDbPWbQ6Q9lNmq' \
    --body '{"options": ["RBaAkLnvxkT1X68c", "mDc3fxU8MyKrQpM4", "hkkK6KKXNB3Gv0Iq"], "qty": 26, "slotId": "CnaLpUKp44YUDjas", "sourceItemId": "WIPUvmEejtGeoyIP"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'a8ZRrvjj7il35MXb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9oCMNqq98SjTvhZ' \
    --body '[{"customAttributes": {"NkSQ70D0H6BXksUC": {}, "9b6i5lZC9xv32e8c": {}, "5csSovoqsZNBdte9": {}}, "serverCustomAttributes": {"NDUPVJf6c2Z0QZxf": {}, "gPubTDIHrvqAThuw": {}, "jRHpKKTlmVr9XuoJ": {}}, "slotId": "bRFQSKVPHbn4Xxtu", "sourceItemId": "7LQRENjEEztx1WsY", "tags": ["SiZqan0nSBJroav9", "1GXlvPG6bFYReVHQ", "ipcCx9Zw5D2L7vIY"], "type": "hGGSyEW4ZJJ42d3P"}, {"customAttributes": {"BddN8S48l9lyNApf": {}, "lxqMrj3oZk03QXcK": {}, "MDYDDxHSZjtqXyJ5": {}}, "serverCustomAttributes": {"8f7Gc26SaiGVkydw": {}, "YWQG26yUZNmTBcvr": {}, "bYCwZtxFHyPLtI8i": {}}, "slotId": "lbyDPUIj88cekdqC", "sourceItemId": "t81P1ktfIovmv9gs", "tags": ["R5cJcHm3SZLxoRDF", "uuuySj29a9LJE8Ho", "RS1X2PFAAMwzHPxB"], "type": "1UskYs4Yw20DOqOB"}, {"customAttributes": {"SC2DKHRuPMMWH8Yb": {}, "33T5UBJCjfcnLRfx": {}, "eCSz9WEi8KlloeH0": {}}, "serverCustomAttributes": {"JT1yduat2vQR3biB": {}, "fsu4jmsRE2w1yEkL": {}, "gh3tIYt4SqYUTLDx": {}}, "slotId": "9gIiDandpGT2t24a", "sourceItemId": "OMh5eC3IHeHSKLCa", "tags": ["3xreNDUWehwH3q31", "A806DJgas4b6z3LN", "Uj7fdgLA84Z8YYk6"], "type": "QEgJjBbEDoNf3n0h"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'EoRCAcf80zfFyabW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AgIUXiI07A68eaqC' \
    --body '{"customAttributes": {"2J9jyEW6GLbc0NaK": {}, "DUL3sa13lk1dQBHO": {}, "86IlBhnetU4RwTqU": {}}, "qty": 24, "serverCustomAttributes": {"geO3FgkXhjDzaQY3": {}, "snn2ZkP7cFdP43e5": {}, "dC9XIBudfZgrbHDI": {}}, "slotId": "Dm4hMzF4TxodenSr", "slotUsed": 96, "source": "OTHER", "sourceItemId": "TvfqU0bfoMm5cTtF", "tags": ["WbotQyXJRcQWsmqP", "Ns92epxk0i8VxsZN", "ereSvf9699mCEHTh"], "type": "UJkETAsSp7gh4TeU"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'TkOkAYfJB8AT9t4T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v207Y2QD3oD5fLCr' \
    --body '[{"slotId": "3OOlXVv8ZGF7uYnG", "sourceItemId": "zpipNDigNJma1Mbq"}, {"slotId": "qZtfNWql4nmwAft4", "sourceItemId": "gqkNNlWkD9eOziYR"}, {"slotId": "FOn0jJLHC9LxhvNX", "sourceItemId": "TwGBCtohLtl9Zuhy"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'tm5UDrT6QXCs5SPB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRPZTF6oQAXVG7tn' \
    --body '[{"customAttributes": {"sZg5QgXjvyGJPN4e": {}, "XbJE5Vs2GcyomQoI": {}, "XimBJehyxlNsjUgx": {}}, "qty": 56, "serverCustomAttributes": {"4P7WnbdSJtjX7Zsh": {}, "ZyZl5x4bRXBHUTrD": {}, "zZSKscfOcYu3dpCR": {}}, "slotId": "OYqUiGKXVFCmpo6s", "slotUsed": 86, "source": "OTHER", "sourceItemId": "t2ujQSa3Zdb65UXm", "tags": ["y0Zp6iIaTIKUkmkk", "9QM0NBMA9ORxpzwL", "R2AK6eXUGPJsw1fi"], "type": "P80G9Pclxcft2ulI"}, {"customAttributes": {"JzPyrVEiOG4Ucqsu": {}, "GKHhMRWLVd3DlhLu": {}, "IpomM8sm1MiaI1mX": {}}, "qty": 40, "serverCustomAttributes": {"ugBp3HBvepnDCjgy": {}, "JlXe36mgWjLfFmte": {}, "ue9nzJ6fH24T805t": {}}, "slotId": "Vg8JqU0jZpjvsugA", "slotUsed": 83, "source": "ECOMMERCE", "sourceItemId": "S7u8RiWyerCSa8SR", "tags": ["gwsAj1ik1jglaDXT", "vKCWwNTAhd2wrS0u", "Pdjhdinpng5BLy8w"], "type": "bhMssAHjapIkY9Rf"}, {"customAttributes": {"4wP57dBZNR88YbCt": {}, "mKy8M9zVrjfGXZnq": {}, "AQUoY1GjlIIk0iKo": {}}, "qty": 93, "serverCustomAttributes": {"nPb71ORYcmQbTU5J": {}, "X8ccLjMXJRk0eaKQ": {}, "DOJvrTefglSs6g4i": {}}, "slotId": "Y9u02aCNYIWekp18", "slotUsed": 22, "source": "ECOMMERCE", "sourceItemId": "OC3mNqF7Bl0LcghV", "tags": ["HfPEspxwhRON0bc1", "eMbEIjowLqc3ecjX", "JbZDKKoxLE1Y3Dym"], "type": "tj3giPg4x4yiPX6u"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'es1Hhhkg1yLVbLFz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HEP8cM4NTwr0KHaA' \
    --body '{"incMaxSlots": 38}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'R1DJ7HVWqMkNSawQ' \
    --body '{"customAttributes": {"UWDFJvJBWic7UkBe": {}, "IXuqDuAXI66bQ71w": {}, "0deoV9Lx5RDA1l2X": {}}, "inventoryConfigurationCode": "crciYNEzvSZIPkhS", "qty": 12, "serverCustomAttributes": {"R1KtOv7Zy0b65uvu": {}, "KNuy0ytZQ7M6Nzy1": {}, "adnSKOLFKx1dX4Lu": {}}, "slotId": "WJu3pDMUAeeZ97SB", "slotUsed": 89, "source": "ECOMMERCE", "sourceItemId": "PYuG6XqP6oo7G73z", "tags": ["dxTgOfnwIdlNa29f", "DLh741IslKHzGlLK", "WUtDQs61OQAoxyyQ"], "type": "pRWCiiPDGQhNPEwi"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JCf2XJVrlzqQls1o' \
    --body '[{"customAttributes": {"zhLVA3kE8jKvgatO": {}, "EBM70TdlNBJYOmpu": {}, "1VCarzBsV6xnZ5Jr": {}}, "inventoryConfigurationCode": "zzjrcaug6CWVG8SW", "qty": 84, "serverCustomAttributes": {"oed9DHhLOqQGhCUr": {}, "6iTrjyEgarAdNJOI": {}, "G36I6tRbRcrEveMd": {}}, "slotId": "AdiPKDUVSC00PYeD", "slotUsed": 4, "source": "ECOMMERCE", "sourceItemId": "agginxnFIna3yddc", "tags": ["bsPheTH26IUJNvYu", "GRUvpZaHCuESOiIZ", "sMfB4ZH3mtgWgU4p"], "type": "CAKxeE70CaunQNxo"}, {"customAttributes": {"t371W9G4AvQkqsGn": {}, "myo5JJTUVmb8GEXF": {}, "TlEMEsFzYqwgK1Np": {}}, "inventoryConfigurationCode": "5nodqpLm7FhJBNXz", "qty": 54, "serverCustomAttributes": {"Qs6XNbjvqhnUVLWu": {}, "8olKdxL6ozRmDD0j": {}, "JvlfV5OemPYdYT7D": {}}, "slotId": "ROCjtuzFMbAG9YI8", "slotUsed": 83, "source": "ECOMMERCE", "sourceItemId": "2pqiXJF3WGRaoQom", "tags": ["SJC4DdrKF7SUQPLG", "59e0k5ZtX6wK7PpU", "lcIW32iK7MGt1ixY"], "type": "5rA1WoVeJIePF8Zr"}, {"customAttributes": {"QzP4zvtdxdbZUpd6": {}, "FJtHJ1pyVwyKQLY6": {}, "FEO65Rb3z7CYLM8I": {}}, "inventoryConfigurationCode": "lsHqffnrfsGlfPaZ", "qty": 75, "serverCustomAttributes": {"Kg4uKxaCgcGLuC3b": {}, "rWdTYCfHkIySok5D": {}, "iXZtLW87rGysryod": {}}, "slotId": "3dNQrmsApRA6HX3R", "slotUsed": 46, "source": "OTHER", "sourceItemId": "rKt2ecozL0TOg54v", "tags": ["CE48L5oLF6M4lNa4", "JUMSHNgqRqCV7usa", "mANkZlOX9Sfo95Hg"], "type": "XqKhTPkwfLM9uSyb"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RzWek2gZvRrvr0n9' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9lvccKMLhrTrcBE' \
    --body '{"entitlementType": "2ItBS3KtKZWe8aoF", "inventoryConfig": {"slotUsed": 52}, "itemId": "7RBx3vim02jBOxrZ", "itemType": "DyvpcLYOWA8NjxOn", "items": [{"bundledQty": 1, "entitlementType": "Ur9Sk4lq2faBcAXX", "inventoryConfig": {"slotUsed": 75}, "itemId": "ngJOUn18G5MlfDTk", "itemType": "8aG40NlncceIZSwg", "sku": "AIkgzh4pTU0Am4DZ", "stackable": false, "useCount": 98}, {"bundledQty": 23, "entitlementType": "3tBf2jnHGKXphn50", "inventoryConfig": {"slotUsed": 5}, "itemId": "bKPFMycMSQ4qfAac", "itemType": "R0LgB5BUXvjcu2s6", "sku": "w3VifnKqmTSoGH1X", "stackable": true, "useCount": 66}, {"bundledQty": 10, "entitlementType": "mEu0q1p6QCyY6vSk", "inventoryConfig": {"slotUsed": 98}, "itemId": "AOHfZiGhxOdcuDXS", "itemType": "xSc3aZPV87pna08g", "sku": "xefTYKhuxaEc7M4P", "stackable": true, "useCount": 96}], "quantity": 5, "sku": "85DDKDAF8KDsBZOu", "stackable": true, "useCount": 73}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '7xueHpATHccee9GX' \
    --limit '15' \
    --offset '4' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '27' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '25' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'SEwdrkEnnqKzFsLf' \
    --limit '0' \
    --offset '15' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'bN15zfQSfQrtfF3T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["QN0OcNDLr36vzohZ", "yjMQAg5mPYhrLTyU", "8OhgfY9JQYGF4bYX"], "qty": 63, "slotId": "EsJKQQewVLMUoAna", "sourceItemId": "RcYp7FUjfIGaffof"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'lEIByYqeKN0meGel' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '65' \
    --sortBy 'updatedAt' \
    --sourceItemId '5wWaDhukU4khGG4v' \
    --tags 'ZFTYnPkmSu4PWam1' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'jxR7SETWjteoc8fg' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"vZDDhoO05oKqymxL": {}, "D1Lcvw6T6mZEiwxx": {}, "ElpMYSWIeVzm7z9n": {}}, "slotId": "oowmlTIKVowi0RY2", "sourceItemId": "VN4ZONJREdUQ3z9F", "tags": ["1BxNNgnke4akncw7", "wu9TmXfJWBPrx9Ns", "8eLzYEvwSWTaLQjc"]}, {"customAttributes": {"tvrK2jhsYpKPlXn7": {}, "7AtYoFzLAATPY8P8": {}, "P3cfoivvQxevecWw": {}}, "slotId": "7Rry0KK5rgAGO0dW", "sourceItemId": "8rX2MVUGKSZ4GcLk", "tags": ["t4pK32sJxlZcCTpT", "dRtCHvuk6B6XTmSL", "yn50sigBVZxiKdV5"]}, {"customAttributes": {"7GvRyd9UuL02Le8H": {}, "SCslsDd4M1F5qRIb": {}, "lS7Nz81GRazPAANj": {}}, "slotId": "fBoldFOyqA2clJ5g", "sourceItemId": "EOaCgM6Yn6RugbNE", "tags": ["IpGBFUjOn5mM7k8n", "bLzvtCIW5ynMKquU", "icAeIVXtoWAXhMlW"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId '4tLqX7OICf5oD1e6' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "oI9FmYel0kOw72o8", "sourceItemId": "Zkgk0jS6rDWUwfhK"}, {"slotId": "vrf2AaH4yCWrHSpp", "sourceItemId": "nIZkNnTn3rzH5NvA"}, {"slotId": "tcvNedgS1fUfKmih", "sourceItemId": "Dbmu8ePWlQMVDXEH"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'eiGTnwyEw6hIWDZr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 31, "slotId": "o4nIRysQdbufXjYn", "sourceItemId": "SoIFeouC2m38kXrD"}, {"qty": 47, "slotId": "WlGVE9sJ4NpUtKp6", "sourceItemId": "M9I6nEwnZhsjwJeG"}, {"qty": 45, "slotId": "YBo4FUTH7CGfKSyx", "sourceItemId": "gRR1DiCqSMzpqIFG"}], "srcInventoryId": "LkDs7ACC1RgBfoNr"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'HlFi2qJLgmBLE35Y' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'hyiDV90SeI5yppBH' \
    --sourceItemId 'oytVznCgNyx9fbT6' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE