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
echo "1..396"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListFulfillmentScripts
./ng net.accelbyte.sdk.cli.Main platform listFulfillmentScripts \
    > test.out 2>&1
eval_tap $? 2 'ListFulfillmentScripts' test.out

#- 3 TestFulfillmentScriptEval
./ng net.accelbyte.sdk.cli.Main platform testFulfillmentScriptEval \
    --body '{"context": {"item": {"appId": "EAxcVpFrttufHIRd", "appType": "SOFTWARE", "baseAppId": "9UzVRiXbqlAw7r6W", "boothName": "2ktQG0h5JAav5kRa", "boundItemIds": ["62WopBJHPtcDs8bB", "Q1g7qbPngUNB1vRo", "ZLCXLx8bbgorQeFb"], "categoryPath": "dwpzS6DaDpv8N7ZQ", "clazz": "VqGj6oDLjWjkY1aX", "createdAt": "1977-05-08T00:00:00Z", "description": "FcDtgOjchIua5tWE", "displayOrder": 71, "entitlementType": "DURABLE", "ext": {"JSDgY1TXp38zsCTC": {}, "rbCbPOyNQkT7NvyE": {}, "3cwyALczNIicXm7a": {}}, "features": ["T5FvdiRilZ7oFgx4", "c8OumKtPDKJDXn7Z", "gSrjJW2OQNOs1PXh"], "fresh": false, "images": [{"as": "68su8XfqlqNiTvB6", "caption": "SdAdIhUDrwoZ5Mec", "height": 7, "imageUrl": "pc1C8XfwHuKeb9l3", "smallImageUrl": "rGN9A3sNm84hddSp", "width": 69}, {"as": "cBdW19m4eu6d5tA5", "caption": "jUmiTqpyhPFdxLzF", "height": 87, "imageUrl": "d8lDR6qVNPRZYdFL", "smallImageUrl": "IAjGGJddVCvu9vx5", "width": 76}, {"as": "vkLGMS0lyuI9a2I9", "caption": "u6Vpbsx5w8hqUI06", "height": 96, "imageUrl": "SuB0y5WUlrMdI4sN", "smallImageUrl": "veabntBSxTeIv53H", "width": 66}], "itemId": "YupD391C2qtPYoka", "itemIds": ["hFjkQsfCaTmt1d67", "FXGk2s9Q0mPVo3tw", "u0MesTCf9x4rt69l"], "itemQty": {"na7qxNeIxPz6MbwL": 67, "IY69z1UaLqYSYWyt": 77, "XQ0yYoNRKd3IL5TA": 87}, "itemType": "CODE", "language": "6iiPlSC2uE4o5Vwd", "listable": false, "localExt": {"m3MqHcUmLZZbSqb8": {}, "RwNmn9HrNQy4uZAA": {}, "iE0mit9RGCCHYzUO": {}}, "longDescription": "cEdscKHPEqgA8yu7", "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 94, "itemId": "k6Jt4Ymos9Jcdos4", "itemSku": "fYcTVU6RBt0zYoMc", "itemType": "HyCUEXlAvxJMdalw"}, {"count": 92, "itemId": "fNPX2bOItRMvqtlB", "itemSku": "2jJCSQT279ZZPYGu", "itemType": "0rdlgdWyOtXi3cho"}, {"count": 88, "itemId": "1X68cmDc3fxU8MyK", "itemSku": "rQpM4hkkK6KKXNB3", "itemType": "Gv0IqmF51TkhjYna"}], "name": "q6foWvXa3bMrXsDr", "odds": 0.9414672111380048, "type": "PROBABILITY_GROUP", "weight": 29}, {"lootBoxItems": [{"count": 71, "itemId": "yIPa8ZRrvjj7il35", "itemSku": "MXbN9oCMNqq98SjT", "itemType": "vhZNkSQ70D0H6BXk"}, {"count": 39, "itemId": "DpADz1x3poD3Qgb3", "itemSku": "boLQQ1MzH7Qm8bwb", "itemType": "mXgdAPh1EThG96gA"}, {"count": 64, "itemId": "xfgPubTDIHrvqATh", "itemSku": "uwjRHpKKTlmVr9Xu", "itemType": "oJbRFQSKVPHbn4Xx"}], "name": "tu7LQRENjEEztx1W", "odds": 0.29889483687088747, "type": "PROBABILITY_GROUP", "weight": 91}, {"lootBoxItems": [{"count": 91, "itemId": "iZqan0nSBJroav91", "itemSku": "GXlvPG6bFYReVHQi", "itemType": "pcCx9Zw5D2L7vIYh"}, {"count": 68, "itemId": "vUfHQvsHXNUNe4mh", "itemSku": "go5QB65lSAiYnNjk", "itemType": "fZrQvGgbLdLsFzHk"}, {"count": 57, "itemId": "YDDxHSZjtqXyJ58f", "itemSku": "7Gc26SaiGVkydwYW", "itemType": "QG26yUZNmTBcvrbY"}], "name": "CwZtxFHyPLtI8ilb", "odds": 0.3891073196127871, "type": "REWARD", "weight": 5}], "rollFunction": "DEFAULT"}, "maxCount": 95, "maxCountPerUser": 13, "name": "Ij88cekdqCt81P1k", "namespace": "tfIovmv9gsR5cJcH", "optionBoxConfig": {"boxItems": [{"count": 25, "itemId": "sb392k6YmJFfRByj", "itemSku": "lBiuFM3FIoVk8T3G", "itemType": "pAnkCmBUqg2SCnqn"}, {"count": 39, "itemId": "Yw20DOqOBSC2DKHR", "itemSku": "uPMMWH8Yb33T5UBJ", "itemType": "CjfcnLRfxeCSz9WE"}, {"count": 18, "itemId": "aDml48wdNFLTm5T5", "itemSku": "0x9WT0GfH2rtOa4E", "itemType": "XsXzOXQAk4mqrxzT"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 33, "comparison": "is", "name": "UTLDx9gIiDandpGT", "predicateType": "SeasonPassPredicate", "value": "wNhmwoYZyI4EFZKB", "values": ["cYrCEAE7WIsfmx40", "NLRc6m8heKnWhzfe", "2NubeoKFeIaFQCYo"]}, {"anyOf": 60, "comparison": "is", "name": "ICpnduEEQlULdJz4", "predicateType": "EntitlementPredicate", "value": "hEoRCAcf80zfFyab", "values": ["C2J9jyEW6GLbc0Na", "KDUL3sa13lk1dQBH", "WAgIUXiI07A68eaq"]}, {"anyOf": 83, "comparison": "is", "name": "86IlBhnetU4RwTqU", "predicateType": "EntitlementPredicate", "value": "geO3FgkXhjDzaQY3", "values": ["snn2ZkP7cFdP43e5", "dC9XIBudfZgrbHDI", "Dm4hMzF4TxodenSr"]}]}, {"operator": "or", "predicates": [{"anyOf": 94, "comparison": "isLessThan", "name": "O847g8OudOfjnCuH", "predicateType": "EntitlementPredicate", "value": "3c46IjGa23YvYmmD", "values": ["MNFIurjh2imdb4rb", "g7VYPXIuvUYTZBRu", "jIUE1Tq5jyAZvkRC"]}, {"anyOf": 21, "comparison": "is", "name": "Xj0ZwsVC0gL97ZVJ", "predicateType": "SeasonTierPredicate", "value": "Y2QD3oD5fLCr3OOl", "values": ["NWql4nmwAft4gqkN", "XVv8ZGF7uYnGzpip", "NDigNJma1MbqqZtf"]}, {"anyOf": 80, "comparison": "isGreaterThan", "name": "1jMD3cym8xIfkOVW", "predicateType": "SeasonTierPredicate", "value": "grREOLx0KOww3HIC", "values": ["6rDgMdIIlhS1fSiM", "QLfl7MUBG7qtPu64", "yAtURKLRkb738HGS"]}]}, {"operator": "and", "predicates": [{"anyOf": 45, "comparison": "isLessThanOrEqual", "name": "1m7Ta1PsKc50Kv6e", "predicateType": "EntitlementPredicate", "value": "yomQoIXimBJehyxl", "values": ["QediogEhhM2rIizG", "dKvOPdq5xrgxSmy1", "NsjUgxBkF6wFPoJe"]}, {"anyOf": 61, "comparison": "isLessThan", "name": "N9LFkYW5DQyj4bj5", "predicateType": "SeasonTierPredicate", "value": "mpo6sPwVOEDSJsEK", "values": ["5QpNhlI2iS5EpGhh", "vXYck0upMzUYnb76", "tFkEORV3bu1bNCtX"]}, {"anyOf": 74, "comparison": "isGreaterThanOrEqual", "name": "40V6Do5sYadCCFrH", "predicateType": "SeasonTierPredicate", "value": "2ulIJzPyrVEiOG4U", "values": ["I1mX2tJoARtdbBe7", "lhLuIpomM8sm1Mia", "cqsuGKHhMRWLVd3D"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 60, "fixedTrialCycles": 6, "graceDays": 58}, "region": "sMrok0WvGYYnx4V7", "regionData": [{"currencyCode": "09xbnGezKsDwG2om", "currencyNamespace": "OR2nvYI9TVqJdvzc", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1974-02-12T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1994-11-24T00:00:00Z", "discountedPrice": 31, "expireAt": "1992-12-31T00:00:00Z", "price": 41, "purchaseAt": "1979-12-26T00:00:00Z", "trialPrice": 73}, {"currencyCode": "iWyerCSa8SRgwsAj", "currencyNamespace": "1ik1jglaDXTvKCWw", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1976-08-04T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1975-05-20T00:00:00Z", "discountedPrice": 7, "expireAt": "1978-07-18T00:00:00Z", "price": 47, "purchaseAt": "1977-05-24T00:00:00Z", "trialPrice": 60}, {"currencyCode": "S0uPdjhdinpng5BL", "currencyNamespace": "y8wbhMssAHjapIkY", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1999-05-14T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1985-12-09T00:00:00Z", "discountedPrice": 64, "expireAt": "1972-08-17T00:00:00Z", "price": 52, "purchaseAt": "1997-09-15T00:00:00Z", "trialPrice": 81}], "saleConfig": {"currencyCode": "QbJndUDpdONneAcz", "price": 2}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "dHb2slt71B1SmZp2", "stackable": false, "status": "INACTIVE", "tags": ["iKoTTS1j02o7JjTX", "AQN0qdskdQV0TqI8", "EFnmDbxIxi4YKlON"], "targetCurrencyCode": "k2Q5Y4Jvaizwiila", "targetItemId": "tuUjjt9lIMGql5El", "targetNamespace": "Ea9EIIlGcHB3CfR3", "thumbnailUrl": "ncDlwi3v3MFFJ1Ke", "title": "sKoELCpobBEG8X64", "updatedAt": "1999-07-05T00:00:00Z", "useCount": 60}, "namespace": "pdXpai0rYaT5hOPj", "order": {"currency": {"currencyCode": "af3H0tYighU0VUfc", "currencySymbol": "YHJbBfAKSiPW3Vgs", "currencyType": "REAL", "decimals": 54, "namespace": "iR1DJ7HVWqMkNSaw"}, "ext": {"QUWDFJvJBWic7UkB": {}, "eIXuqDuAXI66bQ71": {}, "w0deoV9Lx5RDA1l2": {}}, "free": false}, "source": "GIFT"}, "script": "rciYNEzvSZIPkhSg", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'tOv7Zy0b65uvuKNu' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'y0ytZQ7M6Nzy1adn' \
    --body '{"grantDays": "SKOLFKx1dX4LuWJu"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '3pDMUAeeZ97SBROP' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'YuG6XqP6oo7G73zd' \
    --body '{"grantDays": "xTgOfnwIdlNa29fD"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "Lh741IslKHzGlLKW", "dryRun": true, "fulfillmentUrl": "Hcl5LLLOexL4fZvW", "itemType": "EXTENSION", "purchaseConditionUrl": "CiiPDGQhNPEwiJCf"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '2XJVrlzqQls1ozhL' \
    --itemType 'LOOTBOX' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'IzrBvvWm4udE0OXu' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'dXgNne8kJATwlc6e' \
    --body '{"clazz": "sUp6Sw1I98jeZQ7h", "dryRun": false, "fulfillmentUrl": "aug6CWVG8SWP3glU", "purchaseConditionUrl": "6muswVJnNnN7kAa7"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'j0riFc5HTHQIoVsG' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --name 'tRbRcrEveMdAdiPK' \
    --offset '61' \
    --tag 'yTlUrwDTnoujQD4I' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "EiH9Z5qXn3aoRtlq", "items": [{"extraSubscriptionDays": 84, "itemId": "TH26IUJNvYuGRUvp", "itemName": "ZaHCuESOiIZsMfB4", "quantity": 9}, {"extraSubscriptionDays": 69, "itemId": "4L3mDWORBVXTIIJM", "itemName": "9XsYIIZxiXNMR9Bg", "quantity": 1}, {"extraSubscriptionDays": 99, "itemId": "AvQkqsGnmyo5JJTU", "itemName": "Vmb8GEXFTlEMEsFz", "quantity": 10}], "maxRedeemCountPerCampaignPerUser": 33, "maxRedeemCountPerCode": 46, "maxRedeemCountPerCodePerUser": 56, "maxSaleCount": 14, "name": "OdkocVTd4BxqGWV6", "redeemEnd": "1977-08-15T00:00:00Z", "redeemStart": "1994-11-15T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["AFdO0Khqf6kiTdSG", "v2LFjAKY7CbgsWqF", "WZX7kPBom8F9GLLT"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'CjtuzFMbAG9YI89h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'mguB8FOTjMLo4b9r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "IzqYkEpstyVTBcrM", "items": [{"extraSubscriptionDays": 35, "itemId": "e0k5ZtX6wK7PpUlc", "itemName": "IW32iK7MGt1ixY5r", "quantity": 55}, {"extraSubscriptionDays": 41, "itemId": "1WoVeJIePF8ZrQzP", "itemName": "4zvtdxdbZUpd6FJt", "quantity": 69}, {"extraSubscriptionDays": 73, "itemId": "yO2KTK9tmmOnYnOp", "itemName": "as6ghP1y4Zi7s7QB", "quantity": 23}], "maxRedeemCountPerCampaignPerUser": 12, "maxRedeemCountPerCode": 22, "maxRedeemCountPerCodePerUser": 27, "maxSaleCount": 35, "name": "4Z44B1GZgKg4uKxa", "redeemEnd": "1985-02-20T00:00:00Z", "redeemStart": "1998-01-17T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["LuC3brWdTYCfHkIy", "Sok5DiXZtLW87rGy", "sryod3dNQrmsApRA"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '6HX3RwrKt2ecozL0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TOg54vCE48L5oLF6' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M4lNa4JUMSHNgqRq' \
    --body '{"categoryPath": "CV7usamANkZlOX9S", "localizationDisplayNames": {"fo95HgXqKhTPkwfL": "M9uSybRzWek2gZvR", "rvr0n9d9lvccKMLh": "rTrcBE2ItBS3KtKZ", "We8aoFzAyBME74HU": "tipUWYhWV1qx8CzP"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ML52faXUr9Sk4lq2' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'faBcAXXKlhvyH8pa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OJtxqMPpcVfRwNj5' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '47fH0XrKEDpEY8Vn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ocGAjci0V3tBf2jn' \
    --body '{"localizationDisplayNames": {"HGKXphn50c9tNLDl": "jhZ2jxLRX3z46OCa", "GBeMfPlNos4yBRjr": "ERHEonAZR8GmEu0q", "1p6QCyY6vSkVFWds": "bYuVEGVxYheR3j5m"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'NZ6vwv7K8Asvt1j1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Rx59hesNWy2NvZ85' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'DDKDAF8KDsBZOuYQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J03BAHZ7c53q7akM' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'pcmnnx6RVBrop9v7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aZK3h65hbN15zfQS' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'fQrtfF3TQN0OcNDL' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '35' \
    --code 'epEaC4dfiOMZfEhH' \
    --limit '36' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '9pysFO3Zvc1BZG99' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 77}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'F4bYXEcENx9xZlAc' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '16' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'UoAnaRcYp7FUjfIG' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '1' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'lyPR7wZNiVsF6xG2' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '26' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'eGelYF5wWaDhukU4' \
    --namespace "$AB_NAMESPACE" \
    --code 'khGG4vZFTYnPkmSu' \
    --limit '34' \
    --offset '86' \
    --userId 'xyMyOK06MqQBErxg' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'jVBycvU4PbmRDcrg' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '0DjQjBECXvea7H1m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '2lJFRZ3ZprZ60zMj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EnableCode' test.out

#- 36 GetServicePluginConfig
./ng net.accelbyte.sdk.cli.Main platform getServicePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetServicePluginConfig' test.out

#- 37 UpdateServicePluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateServicePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"grpcServerAddress": "hTHeh94TSenE5hCF"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateServicePluginConfig' test.out

#- 38 DeleteServicePluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteServicePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteServicePluginConfig' test.out

#- 39 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 39 'ListCurrencies' test.out

#- 40 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "0RY2VN4ZONJREdUQ", "currencySymbol": "3z9F1BxNNgnke4ak", "currencyType": "REAL", "decimals": 28, "localizationDescriptions": {"cw7wu9TmXfJWBPrx": "9Ns8eLzYEvwSWTaL", "QjctvrK2jhsYpKPl": "Xn77AtYoFzLAATPY", "8P8P3cfoivvQxeve": "cWw7Rry0KK5rgAGO"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '0dW8rX2MVUGKSZ4G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"cLkt4pK32sJxlZcC": "TpTdRtCHvuk6B6XT", "mSLyn50sigBVZxiK": "dV57GvRyd9UuL02L", "e8HSCslsDd4M1F5q": "RIblS7Nz81GRazPA"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'ANjfBoldFOyqA2cl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'J5gEOaCgM6Yn6Rug' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'bNEIpGBFUjOn5mM7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetCurrencySummary' test.out

#- 45 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetDLCItemConfig' test.out

#- 46 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "k8nbLzvtCIW5ynMK", "rewards": [{"currency": {"currencyCode": "quUicAeIVXtoWAXh", "namespace": "MlW4tLqX7OICf5oD"}, "item": {"itemId": "1e6oI9FmYel0kOw7", "itemSku": "2o8Zkgk0jS6rDWUw", "itemType": "fhKvrf2AaH4yCWrH"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "ppnIZkNnTn3rzH5N", "namespace": "vAtcvNedgS1fUfKm"}, "item": {"itemId": "ihDbmu8ePWlQMVDX", "itemSku": "EHeiGTnwyEw6hIWD", "itemType": "ZrpP7rz3ISW510kH"}, "quantity": 35, "type": "CURRENCY"}, {"currency": {"currencyCode": "isTKWjmv67nuHCXW", "namespace": "fwnwGioVwVzmmBVV"}, "item": {"itemId": "Ffpqx1AeLtzcPJ3j", "itemSku": "tDYBo4FUTH7CGfKS", "itemType": "yxgRR1DiCqSMzpqI"}, "quantity": 65, "type": "CURRENCY"}]}, {"id": "GLkDs7ACC1RgBfoN", "rewards": [{"currency": {"currencyCode": "rHlFi2qJLgmBLE35", "namespace": "YhyiDV90SeI5yppB"}, "item": {"itemId": "HoytVznCgNyx9fbT", "itemSku": "63ShEh8PbGikLjgj", "itemType": "cj34uulU6FYBZsWF"}, "quantity": 3, "type": "ITEM"}, {"currency": {"currencyCode": "T6Hh3OMjAjq2mK8l", "namespace": "bSEEelxnb5QxWG2H"}, "item": {"itemId": "FnZlA6HKWW4fI1IQ", "itemSku": "coBQELcNlZkqTZrK", "itemType": "gXNwvm4e5GX6H742"}, "quantity": 83, "type": "CURRENCY"}, {"currency": {"currencyCode": "ixhtAoKiVm6URT95", "namespace": "XhnUcvWB28Mpusuh"}, "item": {"itemId": "hDJ5slzgiWZEtyd5", "itemSku": "6LfxnbY97jjYgXch", "itemType": "CbkXX26uEdCfQaMA"}, "quantity": 88, "type": "ITEM"}]}, {"id": "uTKfC0I2kNjCMDtD", "rewards": [{"currency": {"currencyCode": "Mrentgn3DhqciwIe", "namespace": "ShF9RKb9vvxuJlhX"}, "item": {"itemId": "bWhbwPwToC6knjVw", "itemSku": "VnzaqSfJiQFC2gXo", "itemType": "da0kg16yUSpSOAjH"}, "quantity": 73, "type": "CURRENCY"}, {"currency": {"currencyCode": "WwfCjYwWkLob9gKL", "namespace": "qs2nEZhpByfHZinx"}, "item": {"itemId": "NfgPAwkMBsznlBUq", "itemSku": "nLT4AbGptKaWNvPb", "itemType": "pg7yrRvXfZ6rvgvE"}, "quantity": 47, "type": "CURRENCY"}, {"currency": {"currencyCode": "AKy4QxZkaXZ7vmiE", "namespace": "d0JPxVyQpshaDwNq"}, "item": {"itemId": "TbbFMXAMfVXe0GZe", "itemSku": "MgsRsmH1EQrYmkPK", "itemType": "TPOlhTtSiZNCxuog"}, "quantity": 64, "type": "ITEM"}]}]}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateDLCItemConfig' test.out

#- 47 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteDLCItemConfig' test.out

#- 48 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetPlatformDLCConfig' test.out

#- 49 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"VL70Iw157g00jr9b": "8MuYmmeKTmBNvGYx", "EQdf3ewoGGoY7xmF": "NAmjDDCvs78mcMdi", "S76YApGJ9ufwLYkq": "IgLuZS6hsQryiEtO"}}, {"platform": "XBOX", "platformDlcIdMap": {"ztZpr4U4fwQIiLXg": "mRasvjO4lj8m3XEw", "P2b4gd3xOeii8Jnm": "ssep2xD2NY0kABeG", "s9yxahld1pO0Gyf5": "PO3COyMvczgEpzZ3"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"btxfhcRC7IVYa6iZ": "5uFRYNn3SHiWxF0Y", "buU5ar5qTLWUCy0A": "fgc050XIZRW491e9", "4mQjVOOBnIWhunEl": "qZUodp3IhtCSHy1e"}}]}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePlatformDLCConfig' test.out

#- 50 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeletePlatformDLCConfig' test.out

#- 51 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName '1fIrPvfHnRN06EjR' \
    --itemId 'wEQlNapJRfk4f9Zc,w1pEHAyNFxcVTKuA,QTGh5BxjWOozGoDt' \
    --limit '39' \
    --offset '21' \
    --userId 'UuYo5p8ED5QZAufw' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'Na8lzfjv9oYMXMjl,VHY1AHwF3vGoav7M,K0PcLnEkcokKwcQ0' \
    --limit '3' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 52 'QueryEntitlements1' test.out

#- 53 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1971-01-20T00:00:00Z", "grantedCode": "DT9OyJ2h23GUS2am", "itemId": "U7syGlElXdEAOrVS", "itemNamespace": "nLocLVVYamQc4wcG", "language": "Oqe_kM", "quantity": 69, "region": "HZAAvKTH8MuqIg0C", "source": "REDEEM_CODE", "startDate": "1998-03-21T00:00:00Z", "storeId": "cK8QTwiIAvxSvNDl"}, {"endDate": "1977-08-28T00:00:00Z", "grantedCode": "M5nQFMGzs7fzjgyc", "itemId": "44mEh9tRk8knYSV3", "itemNamespace": "0lnroQehMDli6t9u", "language": "br-zVYM", "quantity": 67, "region": "wpGAbpEmDY9vLh3u", "source": "PROMOTION", "startDate": "1986-09-26T00:00:00Z", "storeId": "DsUmrV6kH4OotKwG"}, {"endDate": "1999-08-15T00:00:00Z", "grantedCode": "dIjvBbA6bfbYaJCJ", "itemId": "jfk2TUvn95FhO7VW", "itemNamespace": "3mbDVMDu87t0ldWf", "language": "Jd", "quantity": 75, "region": "xCWTqUOYZENJ1QHZ", "source": "REDEEM_CODE", "startDate": "1987-12-10T00:00:00Z", "storeId": "Z0TBujELAUK6mQ5i"}], "userIds": ["Zgbwwm5iGzXtcknr", "TC34jxW4pIDwdqXp", "gidKupvXO6aj4hCm"]}' \
    > test.out 2>&1
eval_tap $? 53 'GrantEntitlements' test.out

#- 54 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["mRmut9H9XyWI8bp8", "fQxRuX91uYmtrHJb", "EGTUj7YjERL1rEQG"]' \
    > test.out 2>&1
eval_tap $? 54 'RevokeEntitlements' test.out

#- 55 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '02zccA8wvLsWUNd6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetEntitlement' test.out

#- 56 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '19' \
    --status 'SUCCESS' \
    --userId 'vqDejvqklTSvDwuO' \
    > test.out 2>&1
eval_tap $? 56 'QueryFulfillmentHistories' test.out

#- 57 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetAppleIAPConfig' test.out

#- 58 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "rP9lzpiX0VuFpZum", "password": "7izxe7NPzjOa8E7w"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateAppleIAPConfig' test.out

#- 59 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteAppleIAPConfig' test.out

#- 60 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetEpicGamesIAPConfig' test.out

#- 61 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "Y76PxLv9HBEUe89A"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateEpicGamesIAPConfig' test.out

#- 62 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteEpicGamesIAPConfig' test.out

#- 63 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'GetGoogleIAPConfig' test.out

#- 64 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "wEw1HO4FnKtx4XLK", "serviceAccountId": "AmlDr19uJ3nq6Ver"}' \
    > test.out 2>&1
eval_tap $? 64 'UpdateGoogleIAPConfig' test.out

#- 65 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'DeleteGoogleIAPConfig' test.out

#- 66 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 66 'UpdateGoogleP12File' test.out

#- 67 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetIAPItemConfig' test.out

#- 68 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "zVCcI8y3Cz0YqCKU", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"MlFgvh2Dp2SoiIPp": "1yvfAHS0VgLu11A3", "HTovFi4tPAGfleyC": "A6jEtcqsnzoVILjk", "wW61duF87aUyrdt4": "XSpWBAetsanzqP8o"}}, {"itemIdentity": "xfrtbECD1CYPwaiB", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"rINPXppPNO3AfmXc": "gwC3IN6tvKgLB9Qm", "JIOq9dP5szG71utj": "sQ4CrRb9gUCeVz7f", "WbZIdhevfZvyV7Ac": "odcZwKjYDdmJOlzw"}}, {"itemIdentity": "m9Su4FnS98QqftSj", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"PbCvDLil8wj9cKM3": "Ar6MF35hCER4nGmW", "GgTJfHlJl4tHGa4X": "fZcd9CVnGqMX9Fie", "eEssWEUl07bhwntC": "VqiYOJf5KwMZQjzv"}}]}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateIAPItemConfig' test.out

#- 69 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteIAPItemConfig' test.out

#- 70 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetPlayStationIAPConfig' test.out

#- 71 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "jSozv6CTRDl0zp9C"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdatePlaystationIAPConfig' test.out

#- 72 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeletePlaystationIAPConfig' test.out

#- 73 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetSteamIAPConfig' test.out

#- 74 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "zHFwinkBNi4gvqgl", "publisherAuthenticationKey": "6TZ9TGVPmv34h6T7"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateSteamIAPConfig' test.out

#- 75 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteSteamIAPConfig' test.out

#- 76 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetTwitchIAPConfig' test.out

#- 77 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "EsufmfxKYB4LM6H6", "clientSecret": "QXmpZ9X3fUSR1l9x", "organizationId": "LPBsmAUrD9L1IiD6"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateTwitchIAPConfig' test.out

#- 78 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteTwitchIAPConfig' test.out

#- 79 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetXblIAPConfig' test.out

#- 80 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "MlcEPhMDFzjHZ3sI"}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateXblIAPConfig' test.out

#- 81 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteXblAPConfig' test.out

#- 82 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'hzOx2CXKlvIomU3p' \
    > test.out 2>&1
eval_tap $? 82 'UpdateXblBPCertFile' test.out

#- 83 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'IxM9n8D2eLMe3lt9' \
    --itemId 'qfx2UDcgVE7L9FK6' \
    --itemType 'BUNDLE' \
    --endTime 'kTjgJaMYvNQOsDa4' \
    --startTime 'bkcgepqtxjbrztee' \
    > test.out 2>&1
eval_tap $? 83 'DownloadInvoiceDetails' test.out

#- 84 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '7QLTGAak7Kaol01D' \
    --itemId 'K97D2xnik42miteR' \
    --itemType 'MEDIA' \
    --endTime 'eQAe1rzmmgqBPRmd' \
    --startTime '6mO4oI8KDqebm83r' \
    > test.out 2>&1
eval_tap $? 84 'GenerateInvoiceSummary' test.out

#- 85 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aNBJ5y7axEkvI4ox' \
    --body '{"categoryPath": "ZEDxGiBnNbn0zaf7", "targetItemId": "CaOSlHXrUSA6sMJz", "targetNamespace": "A5mtqISQ83TTbtef"}' \
    > test.out 2>&1
eval_tap $? 85 'SyncInGameItem' test.out

#- 86 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XWznDe4LQdXfFBii' \
    --body '{"appId": "2RAMEX5RMjBFVZGY", "appType": "SOFTWARE", "baseAppId": "IL2l3hPjNDKv2LWf", "boothName": "Xqjr8fS79En3wYow", "categoryPath": "BdkaZ3y6i38XQjLD", "clazz": "RqkpiFK5BtiQ272U", "displayOrder": 29, "entitlementType": "DURABLE", "ext": {"UBJWodpdwsX1jorc": {}, "yR0x3YiHF8ITGPRQ": {}, "BCgIs1Q2lzxl0yF5": {}}, "features": ["HY48F1dl1q92m3iR", "m77TTh4gUoj8u2WR", "cLiEtzVlnkflfn7p"], "images": [{"as": "lfnBAk0CwiAsR65y", "caption": "Q9ssuHdGmxncCEr0", "height": 74, "imageUrl": "QGbqiqOkNeATj7eG", "smallImageUrl": "jodd7CcJUrI6MAug", "width": 75}, {"as": "Oem2yqPsMFxKybPk", "caption": "buS6x9cLJ1APnNls", "height": 1, "imageUrl": "CPUYnfG6jl9U4jRe", "smallImageUrl": "teIMgzISomCsodJr", "width": 15}, {"as": "XXOmqFHLbyXmgCNi", "caption": "XH8uenbC5CphgMwe", "height": 8, "imageUrl": "5olYLETRpABAmO2E", "smallImageUrl": "GvJ4UMS93yOxNInD", "width": 56}], "itemIds": ["cvQU5kG8bXGFmPAn", "OkDiJq4xQye7HqnV", "K3YVeOWs9mfVQh3j"], "itemQty": {"LBtn9pxpE7BYtzB0": 56, "ywHbHig6IKWVZ77K": 8, "79DpSjb39ukcR6c2": 62}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"nemn7M23SzUo4hNB": {"description": "Dh9ZFP1OW0nXOErQ", "localExt": {"PS4VsRoYIK69yg9A": {}, "DCGiXaLs2xjHkinO": {}, "D975nARHCmhNHSXu": {}}, "longDescription": "qIHsxvaUoXDmwWsu", "title": "kxncuD3QxCXMd00Y"}, "BWCaVVmM45mfIZsW": {"description": "hkS476dGGJwJ00UH", "localExt": {"197MJ6zU7JLMQyMW": {}, "zYQCAaPJgoxGJoJa": {}, "SzUtY4ZD0Xtb0U4p": {}}, "longDescription": "H16NUsVY21NVIs7N", "title": "Ren2Y3Ns0QJQeaWy"}, "tPfds1BYx0EaURyd": {"description": "f8ZyyZeHAWGgJUbU", "localExt": {"JRMbkcTglbU86FyO": {}, "jApNHBVfNOURcjY3": {}, "YYT9oTynmfIuBWgJ": {}}, "longDescription": "TNFfM8M0IW4oe8KD", "title": "gy0xZfAcNg14Ws8T"}}, "lootBoxConfig": {"rewardCount": 70, "rewards": [{"lootBoxItems": [{"count": 28, "itemId": "P1LKiFQoLDvumfqr", "itemSku": "gSfnx2h61X9dN1MG", "itemType": "RXBJ6mVV7JS9qjNL"}, {"count": 46, "itemId": "xlCV4cNbJGQ57lPd", "itemSku": "inpjS2DRfGt9GlyZ", "itemType": "VQ4X67tPZSTpPq3x"}, {"count": 19, "itemId": "TAjgqaTHf1ANTJ9Y", "itemSku": "k997XkGOdC6ItxDT", "itemType": "8p4n4XCFkD1AJLCw"}], "name": "szbZxuHSgDOK8bjo", "odds": 0.5128830709488841, "type": "REWARD", "weight": 3}, {"lootBoxItems": [{"count": 6, "itemId": "L2635KbtZTGJpqgl", "itemSku": "2IzNXGTuQPIDpor7", "itemType": "t1aJLNNz6QIVC9Mf"}, {"count": 41, "itemId": "PpmZDdMiCxmuCCVu", "itemSku": "FjS1GC1d2b92B4vE", "itemType": "gj3HOmhcWm428Xej"}, {"count": 90, "itemId": "z96vd80msqIm5buf", "itemSku": "nBqrpLeqhwVhjnnj", "itemType": "KMEmtbiWsAQHbMrK"}], "name": "Yi0Zxs5SWCqZXHLL", "odds": 0.00074702806615079, "type": "PROBABILITY_GROUP", "weight": 25}, {"lootBoxItems": [{"count": 29, "itemId": "QTQT95pFJUAJsyAf", "itemSku": "eKOufV4f15NohXu6", "itemType": "opxQGRt6PqlkL0di"}, {"count": 88, "itemId": "SwCUsTag4MLAo3m6", "itemSku": "1P2xaNfmn8Onb1a9", "itemType": "gMz0F2UBRmMhAbUW"}, {"count": 25, "itemId": "JBhgGq5GIDhNC66s", "itemSku": "zbCCf73IFbRkPSSI", "itemType": "Tz4TjCrJHXGXku2Y"}], "name": "VuOzhxHmnrrV9ZGW", "odds": 0.2875869556242747, "type": "PROBABILITY_GROUP", "weight": 32}], "rollFunction": "DEFAULT"}, "maxCount": 38, "maxCountPerUser": 20, "name": "xe6A6RpmKDebNkyl", "optionBoxConfig": {"boxItems": [{"count": 3, "itemId": "ucNmzwOZOK56sDkc", "itemSku": "i5rZ8iMlOuksQJCi", "itemType": "RFiZWwJ7NrTb1XTB"}, {"count": 24, "itemId": "YQzUJ9XlYJ8BzP6E", "itemSku": "UmUXGM5anIloyj9l", "itemType": "hbvuQdW2jwKUckc7"}, {"count": 81, "itemId": "4ryY91lX8DD4MYXl", "itemSku": "rJ81lHvv9rqvEoM8", "itemType": "YmVjAkO3HKsEp6Kl"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 46, "fixedTrialCycles": 84, "graceDays": 100}, "regionData": {"K7xAvM7tuL81lsR7": [{"currencyCode": "xxSVp3Gd2TK0HzYv", "currencyNamespace": "iTgYmx82JVBRLPZ6", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1981-04-26T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1987-02-03T00:00:00Z", "expireAt": "1975-01-30T00:00:00Z", "price": 57, "purchaseAt": "1971-02-22T00:00:00Z", "trialPrice": 37}, {"currencyCode": "uBF6Gsvvdl8jHz9x", "currencyNamespace": "7XZIjU4IK9lOLaZa", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1985-02-27T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1989-08-19T00:00:00Z", "expireAt": "1981-05-11T00:00:00Z", "price": 94, "purchaseAt": "1983-05-17T00:00:00Z", "trialPrice": 94}, {"currencyCode": "3EVheJjoEEXBLIxG", "currencyNamespace": "nNuhoJM3WWPvvCiC", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1999-01-23T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1975-09-09T00:00:00Z", "expireAt": "1989-01-27T00:00:00Z", "price": 83, "purchaseAt": "1979-12-22T00:00:00Z", "trialPrice": 88}], "RhxSWLWLNfHRD3V1": [{"currencyCode": "5QaGGL46LuxJF3sb", "currencyNamespace": "eqWBdQuWfgBAKx27", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1988-05-11T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1971-01-18T00:00:00Z", "expireAt": "1980-08-01T00:00:00Z", "price": 55, "purchaseAt": "1991-05-05T00:00:00Z", "trialPrice": 67}, {"currencyCode": "mWJO5vzzXZj08a6K", "currencyNamespace": "1XRVfriSpPFnZBJZ", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1986-12-21T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1985-09-05T00:00:00Z", "expireAt": "1979-03-09T00:00:00Z", "price": 51, "purchaseAt": "1995-02-07T00:00:00Z", "trialPrice": 53}, {"currencyCode": "a2LrnpZxNnLRH36b", "currencyNamespace": "qS2oFY76PU1AziBO", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1980-08-05T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1987-01-30T00:00:00Z", "expireAt": "1972-03-29T00:00:00Z", "price": 94, "purchaseAt": "1985-01-19T00:00:00Z", "trialPrice": 43}], "os5uVJ0BJfZ0jvA5": [{"currencyCode": "4CSqZFDsO1skRjOU", "currencyNamespace": "1SMfQVQa6blj9Rdd", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1991-10-19T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1997-06-10T00:00:00Z", "expireAt": "1991-04-07T00:00:00Z", "price": 26, "purchaseAt": "1992-10-22T00:00:00Z", "trialPrice": 97}, {"currencyCode": "9rWynp1ck1vT90C6", "currencyNamespace": "o86cSRL9cgbUmulh", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1972-07-15T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1976-01-04T00:00:00Z", "expireAt": "1997-09-14T00:00:00Z", "price": 74, "purchaseAt": "1990-05-21T00:00:00Z", "trialPrice": 24}, {"currencyCode": "EWFw9GYxjiiOQAD7", "currencyNamespace": "7ci0vfWVZoRRMPi5", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1994-07-16T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1989-01-06T00:00:00Z", "expireAt": "1989-07-24T00:00:00Z", "price": 0, "purchaseAt": "1985-04-16T00:00:00Z", "trialPrice": 16}]}, "saleConfig": {"currencyCode": "yI6ulKNKoXa0dgx1", "price": 72}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "Li6HweweRmyo91dI", "stackable": false, "status": "INACTIVE", "tags": ["vHuYrGWDK41uMOC0", "oEV6tCdrxw1KOPhu", "7QqXBDXJcrqKmXDw"], "targetCurrencyCode": "mRvSoaGk4ktF5wnJ", "targetNamespace": "Dg9Q3WXiydCOInVo", "thumbnailUrl": "lsr6CHmj763vLwtY", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 86 'CreateItem' test.out

#- 87 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'wmeFpvtDtetoQVFL' \
    --appId '8LNW11vtpaTxi7k4' \
    > test.out 2>&1
eval_tap $? 87 'GetItemByAppId' test.out

#- 88 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate '9jRCn48bvkCPfKof' \
    --baseAppId 'wXOIZZQAJza84lKK' \
    --categoryPath 'mVOaTS6xBbNrSUAW' \
    --features '2ak7ISDrBVg6NuDZ' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --limit '41' \
    --offset '85' \
    --region 'nq3eOMHIKeTyBG5d' \
    --sortBy 'displayOrder:desc,displayOrder:asc,updatedAt:asc' \
    --storeId 'HEaqbzHvDDl1jiLw' \
    --tags '3XMGBA6JXDpA1tIC' \
    --targetNamespace '45C0oaGouFu4hXON' \
    > test.out 2>&1
eval_tap $? 88 'QueryItems' test.out

#- 89 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'gUwJnUpryDeRcpUv,lrw2MwC1uuokpaIj,L0Vxe5n9Lx3QcFo9' \
    > test.out 2>&1
eval_tap $? 89 'ListBasicItemsByFeatures' test.out

#- 90 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'gxOgvDc7xMrRKvw8' \
    --sku 'ISP2WKmCRRXBxlal' \
    > test.out 2>&1
eval_tap $? 90 'GetItemBySku' test.out

#- 91 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'CHtWlKxLpS8fLWoQ' \
    --populateBundle  \
    --region '5nuJhatQPxR7dvBV' \
    --storeId 'C5zgOKLTDmHe8c1e' \
    --sku 'J9sde7Ryt4udIv22' \
    > test.out 2>&1
eval_tap $? 91 'GetLocaleItemBySku' test.out

#- 92 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'M18uux9xBomQFPFW' \
    --sku 'y5cwNPI6aFo0MVwD' \
    > test.out 2>&1
eval_tap $? 92 'GetItemIdBySku' test.out

#- 93 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'ZCIXFNEL3uWVRz3V,7YbJM3bNLWHAbCZi,xe2cQ6O30lpzcBQM' \
    --storeId 'AEcNcJqrKxnMzSYo' \
    > test.out 2>&1
eval_tap $? 93 'GetBulkItemIdBySkus' test.out

#- 94 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'c4ZjiMY4H34B6wVd' \
    --region '8ipcKDwQeUWtjCC2' \
    --storeId 'UH6jzMO3AfmOS5mQ' \
    --itemIds 'NyRPZFPNP56l1AT6' \
    > test.out 2>&1
eval_tap $? 94 'BulkGetLocaleItems' test.out

#- 95 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetAvailablePredicateTypes' test.out

#- 96 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'OLKmZhCZxxPPdPwO' \
    --body '{"itemIds": ["tEuWBSO2jJepUnEE", "gja2mIE2kLTnJwc5", "XmkCuL5W4tKt6G3j"]}' \
    > test.out 2>&1
eval_tap $? 96 'ValidateItemPurchaseCondition' test.out

#- 97 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId '9LYdG7xVPqBqe9RD' \
    --body '{"changes": [{"itemIdentities": ["QMBSYAFLqp8PF5hC", "coukWpnbz4ys7j6l", "xuU3u2HEG0qfKegv"], "itemIdentityType": "ITEM_SKU", "regionData": {"1yAB8Pa3uNGKhaLl": [{"currencyCode": "JzJMSnJIIgsAVmaG", "currencyNamespace": "YxUX1B9oVuzG2CnY", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1985-04-21T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1983-10-25T00:00:00Z", "discountedPrice": 14, "expireAt": "1999-02-20T00:00:00Z", "price": 93, "purchaseAt": "1974-09-14T00:00:00Z", "trialPrice": 40}, {"currencyCode": "Dh2kaZP7pnnVfxPw", "currencyNamespace": "c259HF9ejHaILQru", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1987-09-06T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1988-10-15T00:00:00Z", "discountedPrice": 41, "expireAt": "1990-09-21T00:00:00Z", "price": 42, "purchaseAt": "1979-11-11T00:00:00Z", "trialPrice": 45}, {"currencyCode": "ZLRxYlYqlpq03BGd", "currencyNamespace": "Ik4oEogFVGR71rJO", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1983-08-06T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1981-05-29T00:00:00Z", "discountedPrice": 87, "expireAt": "1975-04-09T00:00:00Z", "price": 55, "purchaseAt": "1988-10-28T00:00:00Z", "trialPrice": 46}], "GBjnHmaAu4YK87DY": [{"currencyCode": "AWWcbcbGWmKgE8CZ", "currencyNamespace": "4AELr5lraa5v5P5C", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1973-03-04T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1999-09-13T00:00:00Z", "discountedPrice": 53, "expireAt": "1980-03-06T00:00:00Z", "price": 34, "purchaseAt": "1982-10-02T00:00:00Z", "trialPrice": 75}, {"currencyCode": "C9h5JPiMEtgKuiGT", "currencyNamespace": "YgwWv5XldL6rOVGc", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1988-04-18T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1978-05-16T00:00:00Z", "discountedPrice": 35, "expireAt": "1993-01-08T00:00:00Z", "price": 55, "purchaseAt": "1984-12-17T00:00:00Z", "trialPrice": 56}, {"currencyCode": "Sxp4qTB54mKA3V9D", "currencyNamespace": "KlCeZ7mLYsHooOIa", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1988-12-07T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1979-01-11T00:00:00Z", "discountedPrice": 16, "expireAt": "1998-04-16T00:00:00Z", "price": 5, "purchaseAt": "1998-10-06T00:00:00Z", "trialPrice": 8}], "OJPS3lJ80YJ41U4o": [{"currencyCode": "oQ980ywmg1pWpWit", "currencyNamespace": "1QC7FKe0fnHUlmU1", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-07-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-06-06T00:00:00Z", "price": 46, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 11}, {"currencyCode": "TX2bamSCvX1nwvSW", "currencyNamespace": "dDwD7WJHzgNZUKsI", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1981-10-28T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1985-12-23T00:00:00Z", "discountedPrice": 46, "expireAt": "1999-08-13T00:00:00Z", "price": 53, "purchaseAt": "1972-11-16T00:00:00Z", "trialPrice": 60}, {"currencyCode": "yTsftKqnsIJctAdx", "currencyNamespace": "yZVKHA9DkaSOWgtg", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1989-07-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1994-03-28T00:00:00Z", "discountedPrice": 24, "expireAt": "1988-09-03T00:00:00Z", "price": 33, "purchaseAt": "1971-10-19T00:00:00Z", "trialPrice": 97}]}}, {"itemIdentities": ["qzoKMRMG541PAiNj", "ULsx4SnKNXLMUaDS", "wwQlnNRZJHBSB4fZ"], "itemIdentityType": "ITEM_SKU", "regionData": {"EFIZs28Ff1kZp1Zk": [{"currencyCode": "tx3N7WNMYIfcDKbL", "currencyNamespace": "u8pnK34oA1keYXJv", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1974-08-08T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1987-08-26T00:00:00Z", "discountedPrice": 94, "expireAt": "1972-03-19T00:00:00Z", "price": 10, "purchaseAt": "1971-04-06T00:00:00Z", "trialPrice": 8}, {"currencyCode": "IlGJg9wdc8bihhWj", "currencyNamespace": "fZpfcFBUsnnDJlmD", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1988-09-08T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1993-03-24T00:00:00Z", "discountedPrice": 70, "expireAt": "1971-10-23T00:00:00Z", "price": 97, "purchaseAt": "1984-03-11T00:00:00Z", "trialPrice": 8}, {"currencyCode": "zCQh2iNTwtnohddM", "currencyNamespace": "zMTQ9P7sYLDWAJOA", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1989-08-03T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1985-10-16T00:00:00Z", "discountedPrice": 6, "expireAt": "1998-02-07T00:00:00Z", "price": 21, "purchaseAt": "1986-05-12T00:00:00Z", "trialPrice": 19}], "JoF2FI3vyyqRzc20": [{"currencyCode": "O7FdsJP1G9tyBTfE", "currencyNamespace": "RXdvgD1Qf7Ot2DkU", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1999-09-23T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1974-02-09T00:00:00Z", "discountedPrice": 47, "expireAt": "1982-04-17T00:00:00Z", "price": 56, "purchaseAt": "1972-12-24T00:00:00Z", "trialPrice": 44}, {"currencyCode": "ejmeZtzT0qj0ltsq", "currencyNamespace": "fiZrthVvyX0OCKDJ", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1999-10-21T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1997-11-11T00:00:00Z", "discountedPrice": 38, "expireAt": "1995-05-27T00:00:00Z", "price": 7, "purchaseAt": "1995-01-21T00:00:00Z", "trialPrice": 8}, {"currencyCode": "wSSgxCu8zru1DhGA", "currencyNamespace": "YOHR5BWa9VzIkaQE", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1998-02-21T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1982-02-03T00:00:00Z", "discountedPrice": 85, "expireAt": "1990-05-25T00:00:00Z", "price": 24, "purchaseAt": "1978-11-20T00:00:00Z", "trialPrice": 55}], "sY3SsTnDQY7kKU2u": [{"currencyCode": "06Q4veujxtyQENvJ", "currencyNamespace": "rBCqeg67d4RWOqO4", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1999-03-03T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1981-10-17T00:00:00Z", "discountedPrice": 81, "expireAt": "1988-12-17T00:00:00Z", "price": 50, "purchaseAt": "1990-09-14T00:00:00Z", "trialPrice": 51}, {"currencyCode": "Am3DQht4JwnPS2ur", "currencyNamespace": "JqerobWMZGVL5KLT", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1971-01-12T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1996-11-19T00:00:00Z", "discountedPrice": 23, "expireAt": "1975-07-04T00:00:00Z", "price": 6, "purchaseAt": "1971-08-19T00:00:00Z", "trialPrice": 49}, {"currencyCode": "aKSLCgOOPXM6XTUh", "currencyNamespace": "2dJ90yqHDNacl4F9", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1986-03-31T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1994-09-12T00:00:00Z", "discountedPrice": 68, "expireAt": "1982-08-15T00:00:00Z", "price": 58, "purchaseAt": "1996-03-11T00:00:00Z", "trialPrice": 69}]}}, {"itemIdentities": ["SEAzT7TOpyiuvvQU", "m29Iacq4XRLaA643", "nTMtXSAyejnny0Ju"], "itemIdentityType": "ITEM_ID", "regionData": {"3b6o5uB2XM6IHy7E": [{"currencyCode": "EvHyLmcvrZZOdwe1", "currencyNamespace": "x8RjU6Bi8JXE52sU", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1985-02-19T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1995-12-26T00:00:00Z", "discountedPrice": 89, "expireAt": "1975-07-10T00:00:00Z", "price": 25, "purchaseAt": "1997-12-14T00:00:00Z", "trialPrice": 88}, {"currencyCode": "N4UQ2fg3V1o2x0hL", "currencyNamespace": "5DuBDqMyIAzWze94", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1973-08-14T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1992-09-10T00:00:00Z", "discountedPrice": 55, "expireAt": "1972-07-25T00:00:00Z", "price": 35, "purchaseAt": "1999-08-06T00:00:00Z", "trialPrice": 73}, {"currencyCode": "XAupATO8uXsqVpdi", "currencyNamespace": "Wo8SjDAM0Riw8wLY", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1978-04-02T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1975-08-27T00:00:00Z", "discountedPrice": 77, "expireAt": "1987-08-27T00:00:00Z", "price": 87, "purchaseAt": "1998-09-04T00:00:00Z", "trialPrice": 100}], "DwBXw5uBYeQZOzAT": [{"currencyCode": "NSV9E9yyNb7yaLXz", "currencyNamespace": "AVYymOuhCkZu4htr", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1991-09-17T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1993-10-04T00:00:00Z", "discountedPrice": 72, "expireAt": "1987-10-11T00:00:00Z", "price": 90, "purchaseAt": "1974-05-01T00:00:00Z", "trialPrice": 65}, {"currencyCode": "vTGXaMsq8ePN1oco", "currencyNamespace": "2jx8Upe8SjMvpqM8", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1981-03-04T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1991-02-23T00:00:00Z", "discountedPrice": 56, "expireAt": "1991-09-06T00:00:00Z", "price": 22, "purchaseAt": "1972-09-28T00:00:00Z", "trialPrice": 17}, {"currencyCode": "47gD5i2Ni6AnWn3N", "currencyNamespace": "dEPhNHSH7eKDfRcn", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1986-06-16T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1971-07-15T00:00:00Z", "discountedPrice": 27, "expireAt": "1986-12-24T00:00:00Z", "price": 74, "purchaseAt": "1995-05-17T00:00:00Z", "trialPrice": 87}], "2qEAuJbpZSrcbc4L": [{"currencyCode": "WfKaY5c1tP5TDuI5", "currencyNamespace": "f6m4KC07CnsZe32h", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1986-09-13T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1985-06-12T00:00:00Z", "discountedPrice": 63, "expireAt": "1984-07-12T00:00:00Z", "price": 1, "purchaseAt": "1991-02-02T00:00:00Z", "trialPrice": 56}, {"currencyCode": "XZOYwbwjMNdxKWlB", "currencyNamespace": "fnRyFS0Ed7gTM5AV", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1980-12-23T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1989-12-13T00:00:00Z", "discountedPrice": 27, "expireAt": "1975-03-20T00:00:00Z", "price": 60, "purchaseAt": "1994-07-08T00:00:00Z", "trialPrice": 5}, {"currencyCode": "N7HDPTUEDPN1Kb4U", "currencyNamespace": "TPWDXTSb55g8LSTs", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1978-02-13T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1992-10-28T00:00:00Z", "discountedPrice": 23, "expireAt": "1977-09-24T00:00:00Z", "price": 23, "purchaseAt": "1999-12-01T00:00:00Z", "trialPrice": 19}]}}]}' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateRegionData' test.out

#- 98 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '11' \
    --offset '85' \
    --sortBy 'obIdnI6Ag7eUYcYJ' \
    --storeId '4QzXCmqr6gmPGaHP' \
    --keyword '5SVPvRLiDi0mNHb6' \
    --language 'Lx8eq8SGNwEQO8dY' \
    > test.out 2>&1
eval_tap $? 98 'SearchItems' test.out

#- 99 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '43' \
    --offset '48' \
    --sortBy 'displayOrder:desc,updatedAt:desc,updatedAt:asc' \
    --storeId 'haBKoUfiHjGmCyPs' \
    > test.out 2>&1
eval_tap $? 99 'QueryUncategorizedItems' test.out

#- 100 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'KCJTv1ic9gvagF2c' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SuztsJ5tj64gV7nm' \
    > test.out 2>&1
eval_tap $? 100 'GetItem' test.out

#- 101 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Dk29mcjSuz9vbNSt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qPtQmQN6eKAGiZFC' \
    --body '{"appId": "ftT0RWECdjWYrnul", "appType": "GAME", "baseAppId": "ofwYLQcDvkaEIIPo", "boothName": "JT83zEGXmVBZLyrH", "categoryPath": "9J7BoysmaORLkP5h", "clazz": "c2Fh04JTsqDTynCe", "displayOrder": 45, "entitlementType": "CONSUMABLE", "ext": {"qJligLlRxOelKykI": {}, "CRxF6HtlER2txs4q": {}, "rNARATn6KXOutlYB": {}}, "features": ["cwWVRK6UKk5ozrXA", "bLhL8KXx25FZfQIo", "dVBqQsBpCJBIXLGY"], "images": [{"as": "4HZHNyq9odanhR1Z", "caption": "rm3thUvV87yfkycL", "height": 91, "imageUrl": "g48TgfNu0rqXUOyT", "smallImageUrl": "oLPIREGIKlJt3EP9", "width": 22}, {"as": "7NXEjrJMki8jvc3P", "caption": "8Gwjg3IOH0SDHgYK", "height": 33, "imageUrl": "oODXMzLSrzoiBnYi", "smallImageUrl": "5UWs3tYlYeMoCimJ", "width": 49}, {"as": "dY2vfJuje5cPnmGj", "caption": "TvYa5Pqx1K7qcAoi", "height": 18, "imageUrl": "Mh9WpifqjNjLOtNQ", "smallImageUrl": "ts2yxf6MLZJ2jZfZ", "width": 3}], "itemIds": ["Ji9DaMrc0WFgKjE9", "45x2CPVYYG9WvoGm", "AmvaVV5YfxnUNcwj"], "itemQty": {"r7gSGhnfuF4WZiQV": 71, "JeRbzTPwD3jxF7vx": 90, "3juXW4JprIb3CJCA": 40}, "itemType": "APP", "listable": true, "localizations": {"4Z5f8nfaKqdZFLbZ": {"description": "EHxsDxeR6d7r1SQw", "localExt": {"80JfMpPrSqYypRUn": {}, "q5o4ETeCUYG9ccTt": {}, "7Wxw8OQ13t3uTw6z": {}}, "longDescription": "QuoZcXQpoTOxe8y1", "title": "jorNsg9ZKYCKoISy"}, "XtHzoWGdYohxMp3u": {"description": "OQIybqWfG9BJ6FVK", "localExt": {"lbYHtbPtaxvagSlp": {}, "GgVTF6VeDAPOGBww": {}, "eyFfXEOEAEtbag82": {}}, "longDescription": "KgBgyCd5vjkfz3eR", "title": "4DtNp129hzBw3xLU"}, "cCEt0DzmkJq1sml5": {"description": "bYt76BNsi4giR943", "localExt": {"4WpKKdzxoufCNlFo": {}, "OcWQQy4bjmQeEweo": {}, "BHTdwAk7ZQnbqY1c": {}}, "longDescription": "QwVEtAr5kKKAo9MM", "title": "2Cqm84jVi9kIpqgr"}}, "lootBoxConfig": {"rewardCount": 53, "rewards": [{"lootBoxItems": [{"count": 85, "itemId": "pUkNOBWydXV0Fi02", "itemSku": "aFr8CDapjwNOl4k8", "itemType": "rVNrm8drv8QD2JOe"}, {"count": 46, "itemId": "Ntz7EFvowPgIGuet", "itemSku": "xFMqXCQMAqQ2ZRGz", "itemType": "NtrThFa9XU8moslu"}, {"count": 17, "itemId": "3WekqfWv04vvn9bk", "itemSku": "5qr8qs2mqtnGAqXU", "itemType": "jNypF6MMqWpdEJsP"}], "name": "oaIbYz8cK5jlpJdr", "odds": 0.06702191803799662, "type": "REWARD_GROUP", "weight": 41}, {"lootBoxItems": [{"count": 57, "itemId": "r6yvWJDdvM7T7PX2", "itemSku": "vamIRZHzsIYOCUoi", "itemType": "CXNjrdQL2jdx1eIb"}, {"count": 1, "itemId": "1kCY5bEokxXxkWZb", "itemSku": "jf7GZxaossQmjo69", "itemType": "wohJFyTNk5FGUPhR"}, {"count": 78, "itemId": "IAjmsonjj0ZR50BQ", "itemSku": "1U6aFD3O2kXQSc58", "itemType": "zgZVl4gIF7v3qbZu"}], "name": "9M3OxqVAT4H1lRZ9", "odds": 0.8275025435532184, "type": "REWARD_GROUP", "weight": 72}, {"lootBoxItems": [{"count": 10, "itemId": "BrHRzEOtIxzPqb6n", "itemSku": "73m0jiaDH86d9rsK", "itemType": "gzCsMulpB8HZUtVV"}, {"count": 0, "itemId": "9Z5BTsEA3EdmW8sa", "itemSku": "abP4xRowfNojzPXI", "itemType": "2v0prR3OEey0MkZw"}, {"count": 92, "itemId": "9FHuv1M3qfch4SqI", "itemSku": "V6LQPHlaeYl4csFq", "itemType": "65cU66yJaj4ovoKW"}], "name": "E4EW0sw8v5peiuxo", "odds": 0.4512281129384098, "type": "REWARD_GROUP", "weight": 30}], "rollFunction": "DEFAULT"}, "maxCount": 86, "maxCountPerUser": 93, "name": "Bp2mWAOYksczxBS0", "optionBoxConfig": {"boxItems": [{"count": 83, "itemId": "9yilUEujk6oqYo1H", "itemSku": "QYTFzwdOMdupwD4O", "itemType": "3uNbcIDcIyvZbOy1"}, {"count": 93, "itemId": "VwcZ2PofaJoSqtrE", "itemSku": "OqxH46fRTSZoDdT0", "itemType": "fefo74eg3Nt2c0r4"}, {"count": 66, "itemId": "PRMDbUXBWTbpAogG", "itemSku": "2wlZkLhuU5FI8Nij", "itemType": "FI0GKwJ3vfXlsAMy"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 95, "fixedTrialCycles": 13, "graceDays": 95}, "regionData": {"YwbaLvqvQ2NbmDIT": [{"currencyCode": "uymTBjn3d2sFzMS3", "currencyNamespace": "QaVjZF7Ax6115Kg9", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1975-12-19T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1989-09-26T00:00:00Z", "expireAt": "1996-09-07T00:00:00Z", "price": 87, "purchaseAt": "1978-07-15T00:00:00Z", "trialPrice": 76}, {"currencyCode": "oIbVi2CLEk277Ivj", "currencyNamespace": "j1A647XQ3koaAfZI", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1994-04-01T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1999-09-10T00:00:00Z", "expireAt": "1988-12-08T00:00:00Z", "price": 1, "purchaseAt": "1977-03-07T00:00:00Z", "trialPrice": 8}, {"currencyCode": "YN27bojDVaZLpx4k", "currencyNamespace": "EWYkO6KrKUMhJrAS", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1974-06-24T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1974-09-08T00:00:00Z", "expireAt": "1977-03-12T00:00:00Z", "price": 100, "purchaseAt": "1987-10-27T00:00:00Z", "trialPrice": 31}], "SSrF35anDGvur19V": [{"currencyCode": "18oIrUKXttgAI2Qd", "currencyNamespace": "WJFLmoPEgd8EMspO", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1988-04-19T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1976-03-14T00:00:00Z", "expireAt": "1973-01-19T00:00:00Z", "price": 43, "purchaseAt": "1974-02-26T00:00:00Z", "trialPrice": 71}, {"currencyCode": "j5vyUMAAmIHYbsxG", "currencyNamespace": "5N066FXb88SbLOa2", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1975-10-20T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1999-09-10T00:00:00Z", "expireAt": "1999-05-27T00:00:00Z", "price": 93, "purchaseAt": "1977-10-12T00:00:00Z", "trialPrice": 9}, {"currencyCode": "XXQJWszvTQEuALzD", "currencyNamespace": "Np1SZ58aDllwzTRH", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1976-11-13T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1991-07-12T00:00:00Z", "expireAt": "1971-03-18T00:00:00Z", "price": 41, "purchaseAt": "1986-09-26T00:00:00Z", "trialPrice": 38}], "JT0mkVPI6zUtf3Qa": [{"currencyCode": "JPGrTNcXXTUIggoH", "currencyNamespace": "89QNmI17UDb19R6H", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1982-06-06T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1971-11-15T00:00:00Z", "expireAt": "1999-03-12T00:00:00Z", "price": 25, "purchaseAt": "1971-09-11T00:00:00Z", "trialPrice": 20}, {"currencyCode": "r50qGdCZIc6EFqBK", "currencyNamespace": "xbS7Q2OgRucL1jwR", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1974-02-13T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1973-08-30T00:00:00Z", "expireAt": "1991-09-01T00:00:00Z", "price": 89, "purchaseAt": "1985-04-11T00:00:00Z", "trialPrice": 11}, {"currencyCode": "Oau6syme06c6SKLc", "currencyNamespace": "2mEC3IXl5XCbkOfH", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1987-03-14T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1978-03-24T00:00:00Z", "expireAt": "1995-01-24T00:00:00Z", "price": 0, "purchaseAt": "1998-07-23T00:00:00Z", "trialPrice": 41}]}, "saleConfig": {"currencyCode": "lypvt6lSLfU7HByG", "price": 69}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "V4GUOnXpapXQGRak", "stackable": false, "status": "ACTIVE", "tags": ["Odyjqf6Q4oiwoJca", "yODR2NVyn4PRqf3e", "RMEb15LBlTVufc5Z"], "targetCurrencyCode": "RbZqBAoKGcVCdMiS", "targetNamespace": "NV4qBrt1kcLmRv6E", "thumbnailUrl": "Jtl5xWnsb8oWq94R", "useCount": 70}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateItem' test.out

#- 102 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'cBOE4qMcH1Kyi8ZF' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'vGcV8DY0XOkDstxZ' \
    > test.out 2>&1
eval_tap $? 102 'DeleteItem' test.out

#- 103 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'cY1HgAnZV4IOglVL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 34, "orderNo": "Yc481dYdvGxJAMDR"}' \
    > test.out 2>&1
eval_tap $? 103 'AcquireItem' test.out

#- 104 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'A1LF7jdWlekFwO94' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'VBCV9qJhWva2FPBu' \
    > test.out 2>&1
eval_tap $? 104 'GetApp' test.out

#- 105 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'jX0geYCpGJM4sqsP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NJMiZXXOFwmGWAvN' \
    --body '{"carousel": [{"alt": "F0Z0GkwxUNYyNwGi", "previewUrl": "KrknH0Y5mrQgLC6D", "thumbnailUrl": "2qsFiQHglUQMZi5W", "type": "image", "url": "JY9aL9ie6vvMbiNU", "videoSource": "youtube"}, {"alt": "1Ehr8OtqpNJ9R8Tu", "previewUrl": "Ny4ejmVA3vMCsGyP", "thumbnailUrl": "d12B8QNUz0hFFNbH", "type": "image", "url": "u9oTc8pVkiyGsj5J", "videoSource": "generic"}, {"alt": "5D0oiFchQnVeq3g2", "previewUrl": "AB2WIRUQmauIY5HX", "thumbnailUrl": "CZ0W4XmWP0HzSdiy", "type": "image", "url": "AldDSUS7Haa6unq1", "videoSource": "vimeo"}], "developer": "mu2QHLyZNuysyM4O", "forumUrl": "fCzdQCXMAWnf87YP", "genres": ["Strategy", "Action", "Strategy"], "localizations": {"hpYZdKZRyR9AX7Jj": {"announcement": "xvNZhM84DiZk6ySr", "slogan": "B9SVFctW7YS0OkL7"}, "8XeEAtALFI3v8yha": {"announcement": "4pd5A7MYcpBD6lKN", "slogan": "b8RxvN2u5J7baOeL"}, "H19fqBwNbNe1ffYR": {"announcement": "tIvQaKyevWYtZjK6", "slogan": "J29v8MpBSpo3AKRm"}}, "platformRequirements": {"nJkzJHAckUyBksYQ": [{"additionals": "fDm0RNFwiz70tRVL", "directXVersion": "MlHi8i9gOVqajUWr", "diskSpace": "gEsWDtaKzn8dZwnn", "graphics": "GeZsZVgbPzPFbrOM", "label": "ZMgWkFN7Tpkx6Gcf", "osVersion": "yOg6ZUrrp9ubg9mn", "processor": "dW2JKmQafUs2bxYz", "ram": "tOEyVbKIf1ZbzgUw", "soundCard": "d8DHoCQykmXHYmkR"}, {"additionals": "lg7gYs6unPYQ9jNQ", "directXVersion": "N1di1ldhOh6HvjnY", "diskSpace": "uV7NfC4A2ODiZhbf", "graphics": "b8QqCyK1XH9D6vl5", "label": "eFdFfgK46GjCWaP8", "osVersion": "huTmnq3FGQn3Ahu5", "processor": "wxq6oJq4mChmQHQh", "ram": "O9IKBXDFQfXFD58s", "soundCard": "G6uDhFYlrzJBYSeM"}, {"additionals": "uJfQecutjS029BiJ", "directXVersion": "WOG1m7MKclr5igjN", "diskSpace": "TVItrH2X78hxJgaV", "graphics": "fw5Vnyq8OzTE89WD", "label": "NoMcOmbfJrCJQIj1", "osVersion": "haAosKglqaCXE9yt", "processor": "pIO8btO3OwNEGSW5", "ram": "TaW4to7QCY2NGGvi", "soundCard": "9kg3rMIzNmhJTNQj"}], "KlwjfJ3TJ2xVpge7": [{"additionals": "0WsLfgbZieRvJI5s", "directXVersion": "T9DH3DfLCv8q4Thm", "diskSpace": "q09bBgPAYxrBE9jl", "graphics": "nTgtgW33wDwD9RKv", "label": "QX4yFQFdrRoM6Foq", "osVersion": "CYw7AlxO6qdFpc71", "processor": "sSck3ggZWJlSlCQM", "ram": "Dji329PfVrvMEPtp", "soundCard": "sSNcpK1QkB2Sy8Ww"}, {"additionals": "79LVeVskqeUB7RSa", "directXVersion": "yqGFguhh3bvadRth", "diskSpace": "dbVApebRA09rW8i8", "graphics": "krFWJhe03coRFok5", "label": "d3AyGrZO8GuoXNSo", "osVersion": "VEBG7VbBPUWipz9C", "processor": "05YabFX4FCK5ucTF", "ram": "sAFzaO3yJpA3KMxB", "soundCard": "lrRytER1qdTelFAa"}, {"additionals": "dM9y66Drf4SSGGt3", "directXVersion": "MiBKohow3kKoaP1K", "diskSpace": "4CDuH1mMIfOCDyVA", "graphics": "HrHncR5dShqiBUI9", "label": "esSsXegSEhrPpK2q", "osVersion": "8kxR4BuEksS2A9VO", "processor": "A8H9VeHv0L2Acm96", "ram": "0EYQEuGJVl8xs1WI", "soundCard": "d9WlalqshF9Rh2o7"}], "GCQGPCxwEdkyuT3M": [{"additionals": "gzReRq0112ISArRO", "directXVersion": "IodcmM6v2AEozWWa", "diskSpace": "YvBLE46bpuJip8Jy", "graphics": "xJ39vrtuWWrqTZbS", "label": "qBSKp8AmgwhYzk33", "osVersion": "J34fiTxK63OHpnUC", "processor": "GBVfpctNFUsUQ6ZX", "ram": "Qcb2o1J5euLAbBge", "soundCard": "jqc0apxqZ209BySn"}, {"additionals": "8aUaGlAyvIslt7N1", "directXVersion": "qcxKs4nlf1MfqUZX", "diskSpace": "kjHvcUOTlxNf09pe", "graphics": "fgFIiJssShBKsQjX", "label": "vfQgQDt6ce8NDMEr", "osVersion": "A82FrR1GSogkewIz", "processor": "TOqKkcjRh3l2gAJO", "ram": "TCbx7J3gNLIlTk3B", "soundCard": "pclrk4hIRn0znIKz"}, {"additionals": "AEAHQpBOgHEP5l94", "directXVersion": "s7CbIJ7eHnVWOboM", "diskSpace": "kyB7FTexsOZ0b2p3", "graphics": "b63KrcwIcXMhGy83", "label": "Xit6boOLGCcg16Dq", "osVersion": "wdQPQ9HkSSV8e1Mg", "processor": "TTLS2FgarY903ING", "ram": "IyEfRBEj7qms9AGQ", "soundCard": "ExPhgr9gGfC0Gjvp"}]}, "platforms": ["Android", "Linux", "Windows"], "players": ["Single", "Coop", "LocalCoop"], "primaryGenre": "Racing", "publisher": "VDlvSc0Mr7ImwCwG", "releaseDate": "1979-11-30T00:00:00Z", "websiteUrl": "oOnq9U5lyW89Xwt3"}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateApp' test.out

#- 106 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'wmRTrDCjhnKvsHez' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WTqgYPixtHk6lWq6' \
    > test.out 2>&1
eval_tap $? 106 'DisableItem' test.out

#- 107 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'tEeUmU96FLEak0mJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetItemDynamicData' test.out

#- 108 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'qjRYldcTpdeCD9XP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ri4bAQL7VE2wL8Y4' \
    > test.out 2>&1
eval_tap $? 108 'EnableItem' test.out

#- 109 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'JFVUdzA8bvXlDhG7' \
    --itemId 'BrorbKIKuOXJPm5z' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'trr09CDA8Ij5bGKS' \
    > test.out 2>&1
eval_tap $? 109 'FeatureItem' test.out

#- 110 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'uopWQbaCvdPSq8Z2' \
    --itemId '7GpvHCDx55JZ5z6g' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ujpFzlPspQD9IRIp' \
    > test.out 2>&1
eval_tap $? 110 'DefeatureItem' test.out

#- 111 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'DDubntPCFxfeoW2N' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'dSWzOXjO1NQUqWHB' \
    --populateBundle  \
    --region 'W78XREZCiTNAxq26' \
    --storeId 'gZrPqCsSDspvgM16' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItem' test.out

#- 112 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'sZ6rjnkH4ExObppC' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6CMYDm5ge659UDEO' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 14, "comparison": "isGreaterThanOrEqual", "name": "EDqSTOfoNewWjwMW", "predicateType": "SeasonPassPredicate", "value": "rPye7fCwi7Il2wIF", "values": ["qn59tEGm9NYeUT5P", "lHm9N6owMHMtJy1O", "0nx8TqSZdZ5C8mFI"]}, {"anyOf": 80, "comparison": "excludes", "name": "nvzEqBNMF9CZvPxT", "predicateType": "SeasonPassPredicate", "value": "v9k4fv3kMiuQ3Dhs", "values": ["oBAhAlJGI2YYb6aj", "DBmTLH9kP9U53z6j", "KLxjt5srPFxBgpFt"]}, {"anyOf": 56, "comparison": "isLessThanOrEqual", "name": "jgq6eY4PBNHKPx62", "predicateType": "SeasonPassPredicate", "value": "YutgXucx85vHA009", "values": ["xgVLGgK8aVSCN6oC", "FAb21jxeWXk80y9u", "ETQ8gIDRdD2wwMXw"]}]}, {"operator": "and", "predicates": [{"anyOf": 22, "comparison": "includes", "name": "PhEJsc7rZpxaPHc9", "predicateType": "SeasonPassPredicate", "value": "DfNfPGYYSTunMgt3", "values": ["WJw9zIWsiP2JQ24m", "C8hEguCqlMHiQN3H", "eDrwEuTyM2qohglz"]}, {"anyOf": 83, "comparison": "includes", "name": "8AEl6A9sh2x2ur2c", "predicateType": "EntitlementPredicate", "value": "dKPCFUIeyYEymNXz", "values": ["NX6TGh4UdEweeBsJ", "BaixUUvmzbajE2gj", "EvBbAvCmlh6Z1oz9"]}, {"anyOf": 30, "comparison": "isGreaterThan", "name": "6a280S5RNB5dVCsB", "predicateType": "SeasonPassPredicate", "value": "tkWaMOH47CAT7cBP", "values": ["0918JaEBQBP766LU", "nBBR84iAO7sBQt6Y", "J2tWwF7RnP1oK3c4"]}]}, {"operator": "and", "predicates": [{"anyOf": 98, "comparison": "includes", "name": "sMY8es36r1FgR70e", "predicateType": "SeasonTierPredicate", "value": "l1qqbalgizL97ycJ", "values": ["f9B22HGgxakPt7IY", "V5YqE2myQzl7X9fH", "r6WvBxmBvNj3ktaD"]}, {"anyOf": 51, "comparison": "excludes", "name": "aj6Vxs3GuA4S1dS7", "predicateType": "SeasonTierPredicate", "value": "mBerp84qjwzWpCF1", "values": ["dFfC8x5aHLsXHlm1", "s4qR8LaQzEb39sZT", "vyamjsEzwtLPxK1o"]}, {"anyOf": 89, "comparison": "isLessThan", "name": "JTTy9JrNz1K5M1qg", "predicateType": "SeasonTierPredicate", "value": "Qh8I9xk3sFl0cbuC", "values": ["75Q4ulonMFjmYqE1", "hlh80BhYe2fJDS6T", "RM69XKkLwioRaKnW"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 112 'UpdateItemPurchaseCondition' test.out

#- 113 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'wJhfogWg2Apm0sUy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "18aWn65Co0vdCk8s"}' \
    > test.out 2>&1
eval_tap $? 113 'ReturnItem' test.out

#- 114 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --name 'pa19GJDK46Eehx7x' \
    --offset '0' \
    --tag 'nA2SrEdN2tmGuX6r' \
    > test.out 2>&1
eval_tap $? 114 'QueryKeyGroups' test.out

#- 115 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "0gBVUUeKKlPKtE6g", "name": "nYxmkmCWbs5qugkl", "status": "INACTIVE", "tags": ["WcZmzCWGI1cIQcPW", "AShIhieSKUf3zKby", "Qk2vQTYX1xsth28N"]}' \
    > test.out 2>&1
eval_tap $? 115 'CreateKeyGroup' test.out

#- 116 GetKeyGroupByBoothName
eval_tap 0 116 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 117 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'ZZgsXycuQNGIDeHl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 117 'GetKeyGroup' test.out

#- 118 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'f6IcX1K9JrK6Or2x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "x7rLwrPoWiywnxuD", "name": "LLuIaSxoloIH1gBC", "status": "ACTIVE", "tags": ["VFrvls0ZwosKhDlL", "fTKxpVOXvGSrdkqd", "dI3ezqu6FB0sL2xt"]}' \
    > test.out 2>&1
eval_tap $? 118 'UpdateKeyGroup' test.out

#- 119 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '6fX9j7rhZCAlDlVK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'GetKeyGroupDynamic' test.out

#- 120 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'BsLZiBRXszE7CL1c' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '2' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 120 'ListKeys' test.out

#- 121 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'JGr4drgkDuWS05m0' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 121 'UploadKeys' test.out

#- 122 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'pGzazM2BUXnzUEWT' \
    --limit '17' \
    --offset '59' \
    --orderNos 'KMJAf6AgbiEDMfCc,kWogE5gcfF8AMGZ2,FBS93Mg6TKwdRMra' \
    --sortBy 'DLrwh3d0ykRGkgqU' \
    --startTime 'NIbJMJ9ABbKVWO2Y' \
    --status 'INIT' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 122 'QueryOrders' test.out

#- 123 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'GetOrderStatistics' test.out

#- 124 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EWhOScvtQ92iD02Y' \
    > test.out 2>&1
eval_tap $? 124 'GetOrder' test.out

#- 125 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MvEUNfoL7JCcMo7G' \
    --body '{"description": "xxXdbYCRexPekTsQ"}' \
    > test.out 2>&1
eval_tap $? 125 'RefundOrder' test.out

#- 126 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetPaymentCallbackConfig' test.out

#- 127 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "IdLCvNhZ6P8aqZ2y", "privateKey": "frC1V7ZpJZPHCMqv"}' \
    > test.out 2>&1
eval_tap $? 127 'UpdatePaymentCallbackConfig' test.out

#- 128 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cYmeDLYEzs2SQUdK' \
    --externalId 'r6vgqkjycqclNlBO' \
    --limit '89' \
    --notificationSource 'STRIPE' \
    --notificationType 'lC8ZkjsxYtgxplHT' \
    --offset '86' \
    --paymentOrderNo 'THcup8GG0VCMTFJ6' \
    --startDate 'svTyo9RHget5hzB5' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 128 'QueryPaymentNotifications' test.out

#- 129 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'RPGV9n769zLJdKMe' \
    --limit '48' \
    --offset '60' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 129 'QueryPaymentOrders' test.out

#- 130 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "gDAtqE3kuybwTQFY", "currencyNamespace": "EJjIYwqfSRy8GgVk", "customParameters": {"77fd1GS5YkyhAiAI": {}, "tnWUmD225fp1egsx": {}, "3ErheNwqd5priclN": {}}, "description": "NqLyrlzrJ4QHbfnA", "extOrderNo": "dtkujxHff7n1yaNC", "extUserId": "cjgFhS0URBhl0L5F", "itemType": "MEDIA", "language": "rp_QkyJ_414", "metadata": {"T5Tn61A1xW6okIqm": "d87ir9op4YfGTno5", "oHzqY3DgykA8zBJX": "0rkOHUkY5aSlqhYo", "SXbn6l5xAzc1nc3e": "Fm950dtVAo7w4e3v"}, "notifyUrl": "5mh6Rum5pbgEt39u", "omitNotification": true, "platform": "pgEtchTe3nt7t9zt", "price": 32, "recurringPaymentOrderNo": "Vt15LKmkQ7YBhsOu", "region": "J0ypkkt2G4eFh2YN", "returnUrl": "sdoxpLTBM9Q8t829", "sandbox": true, "sku": "do1JyveSRiBq23ky", "subscriptionId": "H9jQbHWkcVk0X28G", "targetNamespace": "S54vl7gIKBc7OYTy", "targetUserId": "lFRAJKySnC0cfPl3", "title": "Z2zSBbs4PAV72u8A"}' \
    > test.out 2>&1
eval_tap $? 130 'CreatePaymentOrderByDedicated' test.out

#- 131 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'xE2IQeoxYV4UcYzs' \
    > test.out 2>&1
eval_tap $? 131 'ListExtOrderNoByExtTxId' test.out

#- 132 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wAGpXqQxctuVaqPJ' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrder' test.out

#- 133 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GAHEZmuQrZ8GaQ4O' \
    --body '{"extTxId": "Z2nDodm4TNs8mAj6", "paymentMethod": "IKSYFdJwgZsRPOzw", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 133 'ChargePaymentOrder' test.out

#- 134 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rLQjk4VoYfIksth2' \
    --body '{"description": "4cZBpdDFfvzeU5iq"}' \
    > test.out 2>&1
eval_tap $? 134 'RefundPaymentOrderByDedicated' test.out

#- 135 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hx6zv7EURTNIoG1D' \
    --body '{"amount": 56, "currencyCode": "X1tfW488oYUT4jyC", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 29, "vat": 49}' \
    > test.out 2>&1
eval_tap $? 135 'SimulatePaymentOrderNotification' test.out

#- 136 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bTlGVThz4bm41oIc' \
    > test.out 2>&1
eval_tap $? 136 'GetPaymentOrderChargeStatus' test.out

#- 137 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 137 'GetPlatformWalletConfig' test.out

#- 138 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Steam", "Steam", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 138 'UpdatePlatformWalletConfig' test.out

#- 139 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 139 'ResetPlatformWalletConfig' test.out

#- 140 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetRevocationConfig' test.out

#- 141 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateRevocationConfig' test.out

#- 142 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'DeleteRevocationConfig' test.out

#- 143 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'fF7JkjCVpZKMxkFk' \
    --limit '56' \
    --offset '28' \
    --source 'ORDER' \
    --startTime 'CODZ0mnOpPTVxEgB' \
    --status 'FAIL' \
    --transactionId 'zG8tlkxWKCU1XN4g' \
    --userId 'l7yHvEqpJSrDXVwC' \
    > test.out 2>&1
eval_tap $? 143 'QueryRevocationHistories' test.out

#- 144 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "khOQ161TFjROYJm7", "eventTopic": "5VIuCOCkt2W1DfI8", "maxAwarded": 87, "maxAwardedPerUser": 100, "namespaceExpression": "tgODk9K6DcMnyCPn", "rewardCode": "1FylWdaNV1VaZTkb", "rewardConditions": [{"condition": "buWiiA4UTDgS2SVE", "conditionName": "o5M80LLbku9GYH4i", "eventName": "jqOVM50tCqkZfsSx", "rewardItems": [{"duration": 55, "itemId": "mgXsrVj3Mjml6BpC", "quantity": 84}, {"duration": 82, "itemId": "DWGOLMmCZUeelXYy", "quantity": 81}, {"duration": 97, "itemId": "rXweiCnDldRPRfd6", "quantity": 25}]}, {"condition": "m9EUdiaRjuLsKZoq", "conditionName": "npKwhpZVdw5UMa8y", "eventName": "mxtEFLwELCY2vIdd", "rewardItems": [{"duration": 24, "itemId": "MHDwFVKUC2ecnpUD", "quantity": 33}, {"duration": 95, "itemId": "vLQixPKVSmWa8TGk", "quantity": 30}, {"duration": 66, "itemId": "16XTqHc0cM7ixq8T", "quantity": 19}]}, {"condition": "QONQ2vCbMn0Oia33", "conditionName": "6uiiMTAductvUfVw", "eventName": "LahtRedh1SiZlOpI", "rewardItems": [{"duration": 86, "itemId": "UFum2ZcA8iKcF0bk", "quantity": 10}, {"duration": 59, "itemId": "jcTEFXcTwEtnHxP5", "quantity": 32}, {"duration": 78, "itemId": "VtN4jNVIdruEA39u", "quantity": 58}]}], "userIdExpression": "LznQuHVskfCjUK8G"}' \
    > test.out 2>&1
eval_tap $? 144 'CreateReward' test.out

#- 145 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'eX4Q0B2Cj0oOmBmX' \
    --limit '41' \
    --offset '46' \
    --sortBy 'rewardCode:asc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 145 'QueryRewards' test.out

#- 146 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'ExportRewards' test.out

#- 147 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 147 'ImportRewards' test.out

#- 148 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'rzahXR1sDEDVKDIN' \
    > test.out 2>&1
eval_tap $? 148 'GetReward' test.out

#- 149 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'E3HjCiVR1dQ8kuhb' \
    --body '{"description": "4pUwnGptHUplxzaD", "eventTopic": "a9PDwhu31d8eOdtr", "maxAwarded": 10, "maxAwardedPerUser": 9, "namespaceExpression": "q6ECDD6OGkuLs9gN", "rewardCode": "pNon6DKW9A6AmnQT", "rewardConditions": [{"condition": "NFidImWONTvCPMGL", "conditionName": "dbYEknHPKrZ7TiNB", "eventName": "E0HRsE0GHDOFjrfq", "rewardItems": [{"duration": 73, "itemId": "xH2Up9VthPjFrK7H", "quantity": 18}, {"duration": 16, "itemId": "p0eONFDgUPShG8ww", "quantity": 64}, {"duration": 78, "itemId": "KY9AMpcwJd4SrigI", "quantity": 48}]}, {"condition": "AV95708zaP0wpZgQ", "conditionName": "EvFzox9wHocX3DRW", "eventName": "obEoGr8W97KBedcr", "rewardItems": [{"duration": 62, "itemId": "PM51z7i0wQ9egK2t", "quantity": 63}, {"duration": 73, "itemId": "EG8I2lTviKbOgVuN", "quantity": 4}, {"duration": 28, "itemId": "9YITN98j4P2AGeid", "quantity": 21}]}, {"condition": "RRnIAJfKVjOn6rtI", "conditionName": "LNJVv2DLLUyBt5hD", "eventName": "s45siG30Lv9iGa5m", "rewardItems": [{"duration": 22, "itemId": "YlSU3vYcHZZjFegV", "quantity": 28}, {"duration": 73, "itemId": "On0tk4IATSIefcqN", "quantity": 63}, {"duration": 28, "itemId": "KpYcb1AUsESaBOTH", "quantity": 26}]}], "userIdExpression": "bG04KKnh3jvW0Qp3"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateReward' test.out

#- 150 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'kTyL4CsLwiWUMcpx' \
    > test.out 2>&1
eval_tap $? 150 'DeleteReward' test.out

#- 151 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'n4B6XoTNMuqZTHwo' \
    --body '{"payload": {"1IAJQpb6r8ZeaSHw": {}, "QuiH3Ozu4G6bXxp0": {}, "gYZyF9fJBJkSOrF9": {}}}' \
    > test.out 2>&1
eval_tap $? 151 'CheckEventCondition' test.out

#- 152 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Dg4FcDwBGyBiHewZ' \
    --body '{"conditionName": "kwEeuzBBRSknxyWk", "userId": "ZObuvig8sMuss76e"}' \
    > test.out 2>&1
eval_tap $? 152 'DeleteRewardConditionRecord' test.out

#- 153 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'zTrsDZNYUV48Oh6I' \
    --limit '79' \
    --offset '68' \
    --start 'gY14iWk12Jffk8dw' \
    --storeId 'KNPUOHNZxML3yoBM' \
    --viewId '9qxd6PWz7sVnMxge' \
    > test.out 2>&1
eval_tap $? 153 'QuerySections' test.out

#- 154 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '2inL8fBFP1ABaIKr' \
    --body '{"active": true, "displayOrder": 76, "endDate": "1980-09-05T00:00:00Z", "ext": {"8d3o7cTS9OIIMErn": {}, "NTLXHrsOFsbhRow4": {}, "iaYKy0IjsDgbJ37D": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 61, "itemCount": 93, "rule": "SEQUENCE"}, "items": [{"id": "M0tefVQPWX1NPO5W", "sku": "n7rNG8rGp7Fadvo5"}, {"id": "EzpX0IttsRezyY9G", "sku": "B5sf94ALBmvdncQk"}, {"id": "cZb8cWdVH9bww15z", "sku": "ZsaYrJAe5Kd5QB96"}], "localizations": {"ndlO6iPGC9RhzMC7": {"description": "V8BEphnRXnSpCzyb", "localExt": {"8FkoxQbrPngi87K5": {}, "8pQswqKLutINusOs": {}, "a92F6iwkJIYOLarm": {}}, "longDescription": "pWyvib9CDW21ANrl", "title": "puXD9H1u1CvzWPcZ"}, "wkj1l6bf2F9EXOBj": {"description": "7v8LHYivmD0ekycM", "localExt": {"KlwJTNL2UCWUtaAD": {}, "7ZZx1iefATWcDSqG": {}, "YRMdz07xEJ40epss": {}}, "longDescription": "gJJC3CX0hpB1ZGMM", "title": "o5DSozCuFsrBMtoO"}, "eLfMCYxSeeJOlxa3": {"description": "95rghZwGhdZJkkGh", "localExt": {"YvXYMIyaEMEqOpwe": {}, "tb82b96rsH73hRfD": {}, "gl29GWKpItMt4Gsz": {}}, "longDescription": "RufkDFLYyNBPlMrk", "title": "se9SGcMuV5phhU31"}}, "name": "5LUC6HSMQ32UznXN", "rotationType": "CUSTOM", "startDate": "1973-10-15T00:00:00Z", "viewId": "ve29lqqtcLJW9eTJ"}' \
    > test.out 2>&1
eval_tap $? 154 'CreateSection' test.out

#- 155 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vKNDFrx6LabyDnqX' \
    > test.out 2>&1
eval_tap $? 155 'PurgeExpiredSection' test.out

#- 156 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'jXKPIcxh0x7T6RQG' \
    --storeId 'nnW4ugGX6mKBbgTD' \
    > test.out 2>&1
eval_tap $? 156 'GetSection' test.out

#- 157 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '9xL07ZzzIs3Jke34' \
    --storeId 'ZAUuLP897ooMLnem' \
    --body '{"active": true, "displayOrder": 79, "endDate": "1989-08-10T00:00:00Z", "ext": {"AvgDXNrFEE4Jf4hQ": {}, "psLOcLtZw0efmEVc": {}, "W7mxbS5UOoICxQMi": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 72, "itemCount": 86, "rule": "SEQUENCE"}, "items": [{"id": "5Niy4NNFpRE5pS85", "sku": "yTIRWvLRy58UKWPv"}, {"id": "3F7S0wCVlYQi9cfM", "sku": "CeNnu6OIG1PPLRDE"}, {"id": "XLXZWXvqNCHvNpeM", "sku": "jMzguq6HFIqaqwH9"}], "localizations": {"J6JLb5f3SBMyJUdw": {"description": "EBRrHAWUFqTooGGn", "localExt": {"PEgY0t7QQWl42byO": {}, "wXgKyPhXmcysae8H": {}, "pWH4xiz3fWthJSu2": {}}, "longDescription": "pUIIuPLFAtcWhjAP", "title": "57QbWvSSp71zEPPf"}, "mAQiqRRC2caquMRt": {"description": "QOILcaDqUITBHQR5", "localExt": {"ISNoFR3GUxdMuvmL": {}, "0UBfwzaaeP3Wd0Wr": {}, "b8s3GW0CY0vAfbq8": {}}, "longDescription": "xoCurq4lpHXrbVBh", "title": "60NUA2aKQwnXrmi6"}, "ya8u4sQPvaf1Acwe": {"description": "R7tJW3MLMob1hUnI", "localExt": {"zIpUM8KK1kGFN0NU": {}, "NGKxdlAUDFQuGPzA": {}, "uT7M6OBrNwioKnXP": {}}, "longDescription": "VZaDcXsV1TnsZioD", "title": "iBgprzahPB0FKMa0"}}, "name": "YeyNBQWUHDBnBeeP", "rotationType": "CUSTOM", "startDate": "1996-05-07T00:00:00Z", "viewId": "UV0WpmsQnp1n4YGu"}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateSection' test.out

#- 158 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'mTKOlDOy5vhSkxER' \
    --storeId 'Z2AQ1jvXYBar5RMm' \
    > test.out 2>&1
eval_tap $? 158 'DeleteSection' test.out

#- 159 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'ListStores' test.out

#- 160 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "mGdWl0wpj5tVfKU3", "defaultRegion": "D8WVPh0Z7YiGE2cy", "description": "zTMBY7Xd0OoENg2L", "supportedLanguages": ["w7uepmahXojVZYz2", "zMU9jLzNV3GaG43R", "6nlRPrEAYqRBeSc5"], "supportedRegions": ["uShoj3dGHMeoi5DB", "OsQ0Gax0iX05IT9A", "gsjl5NmnSHhxNmCe"], "title": "4txY0MsPc9EMgf9J"}' \
    > test.out 2>&1
eval_tap $? 160 'CreateStore' test.out

#- 161 ImportStore
eval_tap 0 161 'ImportStore # SKIP deprecated' test.out

#- 162 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'GetPublishedStore' test.out

#- 163 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'DeletePublishedStore' test.out

#- 164 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 164 'GetPublishedStoreBackup' test.out

#- 165 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'RollbackPublishedStore' test.out

#- 166 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CJiEvhL8ZfwCVJW9' \
    > test.out 2>&1
eval_tap $? 166 'GetStore' test.out

#- 167 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yspUOyHC9eKeXzrv' \
    --body '{"defaultLanguage": "zBllwzyC1aTWEmPg", "defaultRegion": "oy4TkpEw4Zeid4mR", "description": "oFNxv10ckMQVjKk3", "supportedLanguages": ["bWJ0ZuYSe3sI0x2h", "c8vaN1Off5gRZZMW", "3huAIzBPWBYKAEFT"], "supportedRegions": ["dlKNh6GTzKjsCqxx", "24QM35bSkFrvGciN", "Hb7OY5YIpOLJW52u"], "title": "z3c8pz63M0g4xXT5"}' \
    > test.out 2>&1
eval_tap $? 167 'UpdateStore' test.out

#- 168 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ts4e0uR47OzUGHeB' \
    > test.out 2>&1
eval_tap $? 168 'DeleteStore' test.out

#- 169 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KtpvyRNgjZkdDppv' \
    --action 'DELETE' \
    --itemSku 'axlPdhwmcH03yoMx' \
    --itemType 'LOOTBOX' \
    --limit '90' \
    --offset '90' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd '9rTh3ureaIbxM3We' \
    --updatedAtStart 'v9pZQjWAN0tny16Z' \
    > test.out 2>&1
eval_tap $? 169 'QueryChanges' test.out

#- 170 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HZtuSJGQCrM7JEMR' \
    > test.out 2>&1
eval_tap $? 170 'PublishAll' test.out

#- 171 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PkdTcAzkIlndN5xe' \
    > test.out 2>&1
eval_tap $? 171 'PublishSelected' test.out

#- 172 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ayr3vUKMuIiz2MiA' \
    > test.out 2>&1
eval_tap $? 172 'SelectAllRecords' test.out

#- 173 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AKcvAXnxnH0QIhoJ' \
    --action 'UPDATE' \
    --itemSku 'zO87cg7TqtMiQgi7' \
    --itemType 'LOOTBOX' \
    --type 'ITEM' \
    --updatedAtEnd 'suYiIPei0pXglJYn' \
    --updatedAtStart 'KkoCAZuolAWnxkIm' \
    > test.out 2>&1
eval_tap $? 173 'GetStatistic' test.out

#- 174 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VbDP0QX31gI7VmnG' \
    > test.out 2>&1
eval_tap $? 174 'UnselectAllRecords' test.out

#- 175 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'IRMvXe6BiphIFe2b' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zr6qQw6fSESkM19O' \
    > test.out 2>&1
eval_tap $? 175 'SelectRecord' test.out

#- 176 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'PMBb12gpmShlmIt2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nfhUaZGqjslu59GT' \
    > test.out 2>&1
eval_tap $? 176 'UnselectRecord' test.out

#- 177 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '2E6AacmZRXZm626P' \
    --targetStoreId 'OXWVj3KP1mX0iYHX' \
    > test.out 2>&1
eval_tap $? 177 'CloneStore' test.out

#- 178 ExportStore
eval_tap 0 178 'ExportStore # SKIP deprecated' test.out

#- 179 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'lyrWowUpUDVLlTtu' \
    --limit '73' \
    --offset '68' \
    --sku 'JsHZVsG6izJZruOJ' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    --userId 'SRFLDSdj8elbtHvD' \
    > test.out 2>&1
eval_tap $? 179 'QuerySubscriptions' test.out

#- 180 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'U91DmHzwiqVPCJ5j' \
    > test.out 2>&1
eval_tap $? 180 'RecurringChargeSubscription' test.out

#- 181 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '18Ou3aY8nceFU5GK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 181 'GetTicketDynamic' test.out

#- 182 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'mcEKp8AQwqgJs6O0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "Qj0ccMkdz6zPz3BV"}' \
    > test.out 2>&1
eval_tap $? 182 'DecreaseTicketSale' test.out

#- 183 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'HAqp4O9XSjap24es' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 183 'GetTicketBoothID' test.out

#- 184 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'yjh6Wc3migf2n6iQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 50, "orderNo": "xJLfAg5cFT0gHAkl"}' \
    > test.out 2>&1
eval_tap $? 184 'IncreaseTicketSale' test.out

#- 185 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tcR3eHFbiAluHv7H' \
    --body '{"achievements": [{"id": "ssd05pHBJX5ln8PZ", "value": 2}, {"id": "rIj9ntYo3dupUHNu", "value": 2}, {"id": "abrVVOKxr9Pa315F", "value": 74}], "steamUserId": "r2WJQqS7Tq4YIyZA"}' \
    > test.out 2>&1
eval_tap $? 185 'UnlockSteamUserAchievement' test.out

#- 186 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'FQ6lZfa2jdNvpWf3' \
    --xboxUserId '2JS1av9VNpVLT0Lv' \
    > test.out 2>&1
eval_tap $? 186 'GetXblUserAchievements' test.out

#- 187 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qcfSdO1nAjY5FvAD' \
    --body '{"achievements": [{"id": "b3GUQgci632w6LUr", "value": 69}, {"id": "JXSh0Z3SWISs1dYr", "value": 73}, {"id": "4GcmVf0fbCU9QdPu", "value": 100}], "serviceConfigId": "NF2hm0TqBQprHn3w", "titleId": "hPKU5abnqw8fFa30", "xboxUserId": "pVbhr1BHh1arZAyu"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateXblUserAchievement' test.out

#- 188 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'LcZoEkPpqKhP2jWn' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeCampaign' test.out

#- 189 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'RTglw0gdWoE4esui' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeEntitlement' test.out

#- 190 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Drquccz4J6fFQezJ' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeFulfillment' test.out

#- 191 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '5E3iYHIknvPcJkjR' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeIntegration' test.out

#- 192 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'evVYfiExpAgoK9YD' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeOrder' test.out

#- 193 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'q1x3dkbJFDEBEOOv' \
    > test.out 2>&1
eval_tap $? 193 'AnonymizePayment' test.out

#- 194 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'J5BKeipIldsgB4hO' \
    > test.out 2>&1
eval_tap $? 194 'AnonymizeRevocation' test.out

#- 195 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'xb88WgKSLIpneDQC' \
    > test.out 2>&1
eval_tap $? 195 'AnonymizeSubscription' test.out

#- 196 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'fwucHRL3o2NstrL6' \
    > test.out 2>&1
eval_tap $? 196 'AnonymizeWallet' test.out

#- 197 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'TsJeRcE7GuwKn63K' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 197 'GetUserDLCByPlatform' test.out

#- 198 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'fjzknv2HZMIL2P2b' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 198 'GetUserDLC' test.out

#- 199 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RTHDntaFiufH2YR6' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'dVB5a2XkS3XQfMuz' \
    --features 'Zh4AhZRe2hgU56xt,yJtnbTDXu7FbleSP,5PcdOuq0m0rvakR8' \
    --itemId 'rcwojLRjhcaJ56nG,lYZ2tod2BGBXjNyR,CtPOr1FU3QZy3gdD' \
    --limit '24' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 199 'QueryUserEntitlements' test.out

#- 200 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 's3kb1htW0UGJpwQZ' \
    --body '[{"endDate": "1976-12-03T00:00:00Z", "grantedCode": "Xuzu3m9u67JjCDwg", "itemId": "186hGWKfO9MnoT3t", "itemNamespace": "99HmcxzjDhTrcBKt", "language": "HOsE", "quantity": 13, "region": "D9tGN0nE7M36mI9u", "source": "REWARD", "startDate": "1986-01-01T00:00:00Z", "storeId": "eZtLQij2JXsqdXfh"}, {"endDate": "1997-10-06T00:00:00Z", "grantedCode": "TTaCeqGv7meuQhJu", "itemId": "q1C6JHkWMSUbqByW", "itemNamespace": "N2BCnRz9w2nur0B9", "language": "wm", "quantity": 41, "region": "A5WnzVZdj8tsyzC4", "source": "ACHIEVEMENT", "startDate": "1973-11-03T00:00:00Z", "storeId": "RyIECEDa1I4lwXqw"}, {"endDate": "1992-02-07T00:00:00Z", "grantedCode": "d20FVHevCjthJUb7", "itemId": "jKuMrFaoLulzp3sZ", "itemNamespace": "xImVK5yh2LcM8LaM", "language": "Wcg_Tqsw_420", "quantity": 71, "region": "T88H6RCW8gJmGzDl", "source": "PROMOTION", "startDate": "1983-08-05T00:00:00Z", "storeId": "tLsR2AGOiPhNt2Id"}]' \
    > test.out 2>&1
eval_tap $? 200 'GrantUserEntitlement' test.out

#- 201 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'H8aYYUT6mma833TD' \
    --activeOnly  \
    --appId 'zk66ix88sAUrXr7M' \
    > test.out 2>&1
eval_tap $? 201 'GetUserAppEntitlementByAppId' test.out

#- 202 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxCvyy7caxz4MQrO' \
    --activeOnly  \
    --limit '60' \
    --offset '34' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 202 'QueryUserEntitlementsByAppType' test.out

#- 203 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lxiEjQBCZx9DJ4V9' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'SJLlrwXmIGamRCAR' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlementByItemId' test.out

#- 204 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'uFLx4rV4CXVMrDYK' \
    --ids 'e2eTf1axo16GqT2v,SLLiMvcu39YZJypW,zpNXgnoKIz8O8Ngl' \
    > test.out 2>&1
eval_tap $? 204 'GetUserActiveEntitlementsByItemIds' test.out

#- 205 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtZTh280vflFMxIh' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'P4QVey9pEz1TV5cU' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementBySku' test.out

#- 206 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tPBsw01i5Mf7WvbN' \
    --appIds 'SeeDNfUESLlwHv3J,gteOLyKp8a1VqxXn,RhDd9TGkO6aIYqft' \
    --itemIds 'w1SrM2nhSEanfUYr,MU6A43UKGpvC1cr5,T1PSXhduTWchzXDv' \
    --skus '3TAtBjP4HSuiYCbG,0UyYUJmNL8p6Abdt,U0CDrlQpKB8qoel2' \
    > test.out 2>&1
eval_tap $? 206 'ExistsAnyUserActiveEntitlement' test.out

#- 207 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QK3aSOYdmMDikc3F' \
    --itemIds 'jm9HoQDemtiQvURY,ZCeF30RT9rBgM8o7,lxXq7TkdM7FVDCBc' \
    > test.out 2>&1
eval_tap $? 207 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 208 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVegrZddP8lLQo6t' \
    --appId 'Hj4z4cAM4LMJfWNZ' \
    > test.out 2>&1
eval_tap $? 208 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 209 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxAgBpeubprKX68j' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'qfbvdU8hlDoC9Fnx' \
    > test.out 2>&1
eval_tap $? 209 'GetUserEntitlementOwnershipByItemId' test.out

#- 210 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'qBlPBYJ7X6uVy7FW' \
    --ids 'TSfMi2CPVGxjcdpd,CqVeePMSqb8y8qJT,UQY40Zrpn0vAD9Ys' \
    > test.out 2>&1
eval_tap $? 210 'GetUserEntitlementOwnershipByItemIds' test.out

#- 211 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'PeDWrAVQZSvgWuCu' \
    --entitlementClazz 'MEDIA' \
    --sku 'ig6YcDA8Z3g62oGY' \
    > test.out 2>&1
eval_tap $? 211 'GetUserEntitlementOwnershipBySku' test.out

#- 212 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'wkrjLI4EHJEEWgki' \
    > test.out 2>&1
eval_tap $? 212 'RevokeAllEntitlements' test.out

#- 213 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '9fbdvUMDZeO4U55w' \
    --entitlementIds 'dCpVpnENiTc9NESV' \
    > test.out 2>&1
eval_tap $? 213 'RevokeUserEntitlements' test.out

#- 214 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '22eRBElD4K2Cy1tJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cPAEkCeV29QsQk10' \
    > test.out 2>&1
eval_tap $? 214 'GetUserEntitlement' test.out

#- 215 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId '0eu5UcxuXXpt0YSP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X04uEIdAwgDobopb' \
    --body '{"endDate": "1972-11-02T00:00:00Z", "nullFieldList": ["JeVCiKs2vLyH9kcS", "Bdk7MwQzn28Le5ne", "ohqhCzroAzWQDve0"], "startDate": "1997-10-27T00:00:00Z", "status": "SOLD", "useCount": 27}' \
    > test.out 2>&1
eval_tap $? 215 'UpdateUserEntitlement' test.out

#- 216 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'N09VIbbsz24fQKDZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X6plErw0Gb0ceCbp' \
    --body '{"options": ["hW4YMhJ0S50bez9Z", "LHW882riiPfRQ3rJ", "0f5lwXvRNDBnmL1K"], "requestId": "Qn77hiP1lzkzjYDw", "useCount": 45}' \
    > test.out 2>&1
eval_tap $? 216 'ConsumeUserEntitlement' test.out

#- 217 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'mLBordrJkD6vy60u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RMT1Xw9K9Yb68a8y' \
    > test.out 2>&1
eval_tap $? 217 'DisableUserEntitlement' test.out

#- 218 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'gYx2TqkhlqMnE9Wj' \
    --namespace "$AB_NAMESPACE" \
    --userId '90EQzOidrWnLrXqI' \
    > test.out 2>&1
eval_tap $? 218 'EnableUserEntitlement' test.out

#- 219 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'mgDf3GaJsdCZND0w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gYOilX1e1825iasu' \
    > test.out 2>&1
eval_tap $? 219 'GetUserEntitlementHistories' test.out

#- 220 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'nESjcgr2drXG5NkK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CySLA8cKCs0dFYRS' \
    > test.out 2>&1
eval_tap $? 220 'RevokeUserEntitlement' test.out

#- 221 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'a2OULZ0iOZJiOAh1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SpLhMF2Pav11FuU8' \
    --body '{"reason": "iXCRz8KgqgwijYxp", "useCount": 67}' \
    > test.out 2>&1
eval_tap $? 221 'RevokeUseCount' test.out

#- 222 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'pYC4txul6VKYlNYY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lHPwKDpJmkeoAkp3' \
    --body '{"requestId": "Z4pgyJYwclb4gd4Q", "useCount": 13}' \
    > test.out 2>&1
eval_tap $? 222 'SellUserEntitlement' test.out

#- 223 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSECsypS42NmYQ8H' \
    --body '{"duration": 23, "endDate": "1972-10-06T00:00:00Z", "itemId": "rwqytieXpIZfr5XD", "itemSku": "q9dGLHjtgE2bTXJx", "language": "CCFqPNDqWrpkWnno", "order": {"currency": {"currencyCode": "va15WVuE5cYVP9tQ", "currencySymbol": "Sa27BnPyq3I1BLtG", "currencyType": "VIRTUAL", "decimals": 76, "namespace": "ZDRNkk4DJUofJXK8"}, "ext": {"RGS0zCYRVmbfzwUm": {}, "sy0stUmKdXiiTObN": {}, "dqkWa13g3pgHx6uP": {}}, "free": false}, "orderNo": "uQuI7gdDTDb3WdnO", "origin": "Nintendo", "quantity": 62, "region": "zTrRzCCafADJfWBs", "source": "IAP", "startDate": "1973-10-18T00:00:00Z", "storeId": "3MLwJZquMQSPp5XD"}' \
    > test.out 2>&1
eval_tap $? 223 'FulfillItem' test.out

#- 224 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '4S1ilfgff7Et4uY8' \
    --body '{"code": "nlBwGNHgfgwZwVMv", "language": "eHh-829", "region": "pJsUiDawAjgHFQk0"}' \
    > test.out 2>&1
eval_tap $? 224 'RedeemCode' test.out

#- 225 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzWRNFNiUn2yXMSC' \
    --body '{"origin": "Epic", "rewards": [{"currency": {"currencyCode": "5E8tAajVSvLRj306", "namespace": "RDuaSixXEdloYZBk"}, "item": {"itemId": "atNLc42eq0O6VsXt", "itemSku": "OlQwj5xPvm7c5nPR", "itemType": "0Y1sffUaZ64dFpiv"}, "quantity": 42, "type": "CURRENCY"}, {"currency": {"currencyCode": "qJHrs4e3RnWR30Md", "namespace": "BZezfwc3H0qSbMq4"}, "item": {"itemId": "GLj8aGsH0qE5p601", "itemSku": "ak59yFSfdZIv8oYW", "itemType": "PUS4Zu0SbTt6M2Xi"}, "quantity": 52, "type": "CURRENCY"}, {"currency": {"currencyCode": "ikCh6q0yq2WAHtL7", "namespace": "IWE3MFqvfDG5jvMO"}, "item": {"itemId": "aXrDlEX42U0syrGN", "itemSku": "hBmgT2q0kIbrJ2S5", "itemType": "Pf1Lvg8kYEVylINJ"}, "quantity": 32, "type": "ITEM"}], "source": "PROMOTION"}' \
    > test.out 2>&1
eval_tap $? 225 'FulfillRewards' test.out

#- 226 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'vo25aEtdjls5oads' \
    --endTime 'eJg7y4Q9CU3fjSRa' \
    --limit '61' \
    --offset '92' \
    --productId '4HDmdvhMXxiKR29L' \
    --startTime 'KIhNU43K8bihdw3p' \
    --status 'FULFILLED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 226 'QueryUserIAPOrders' test.out

#- 227 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2MkxQTAYGfE6hXZ' \
    > test.out 2>&1
eval_tap $? 227 'QueryAllUserIAPOrders' test.out

#- 228 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '7XLoWCGf0dZEeXBd' \
    --endTime '6mGG6SHcZbX2wNnT' \
    --limit '55' \
    --offset '98' \
    --startTime '9zosmDnXoncy7NZQ' \
    --status 'PENDING' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 228 'QueryUserIAPConsumeHistory' test.out

#- 229 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'DsUq38bYvaWLoKzH' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "NGZD", "productId": "0zsKhR60HZwUwk48", "region": "XK7MXHbEwAvvpEeH", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 229 'MockFulfillIAPItem' test.out

#- 230 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'vxc4xAPZ86WNnQOh' \
    --itemId 'usPn4466u8agb5HP' \
    --limit '39' \
    --offset '14' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 230 'QueryUserOrders' test.out

#- 231 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GAwpYq1UqZydOB0M' \
    --body '{"currencyCode": "ThZW6LwcAg57BYBV", "currencyNamespace": "Cbi0ifdPyKf3SwHe", "discountedPrice": 21, "ext": {"QSCJaOHzpb623Eci": {}, "YoYOPVg6DLEZ6Dxp": {}, "wBm2N8PdQ5mQaGXE": {}}, "itemId": "bnmWR0H3EkrHqaLN", "language": "dfKszYZzOg113h6f", "options": {"skipPriceValidation": false}, "platform": "Epic", "price": 84, "quantity": 69, "region": "m1sqdIWU6ERylESg", "returnUrl": "f5dXMrPoYSohfrLy", "sandbox": true, "sectionId": "LQw7Y2VdSxgXez7V"}' \
    > test.out 2>&1
eval_tap $? 231 'AdminCreateUserOrder' test.out

#- 232 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vS0C9JLVQQPa7PPx' \
    --itemId '4Zi6WaC8wk7HMbJh' \
    > test.out 2>&1
eval_tap $? 232 'CountOfPurchasedItem' test.out

#- 233 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NwZgf5nlMDORYuXn' \
    --userId 'PNJgayPFcyUnKXA3' \
    > test.out 2>&1
eval_tap $? 233 'GetUserOrder' test.out

#- 234 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mcyMmX6WF8jtNAVO' \
    --userId 'YqSH533YlJ93CCGB' \
    --body '{"status": "CHARGED", "statusReason": "v4fP4VPzhcH4UJrr"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateUserOrderStatus' test.out

#- 235 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CKvrOAi7lMgkVWJY' \
    --userId 'zSCIDxWUxgOzeRNH' \
    > test.out 2>&1
eval_tap $? 235 'FulfillUserOrder' test.out

#- 236 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IqK5PT404mFw4HJv' \
    --userId '5T2kIQOecfLsYKTm' \
    > test.out 2>&1
eval_tap $? 236 'GetUserOrderGrant' test.out

#- 237 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UnKlrOsJmEwjGYN8' \
    --userId 'VNPXNsmwTV8imJHN' \
    > test.out 2>&1
eval_tap $? 237 'GetUserOrderHistories' test.out

#- 238 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'I0l6jJVzF1Oi2sQu' \
    --userId 'WUBBHZonSmzF831v' \
    --body '{"additionalData": {"cardSummary": "lCiZAZHCWMXxVh8H"}, "authorisedTime": "1994-05-16T00:00:00Z", "chargebackReversedTime": "1985-10-28T00:00:00Z", "chargebackTime": "1971-05-21T00:00:00Z", "chargedTime": "1982-12-01T00:00:00Z", "createdTime": "1982-04-03T00:00:00Z", "currency": {"currencyCode": "npPn8N5xMRgU7cPq", "currencySymbol": "NZrLCRRUysya4J3r", "currencyType": "VIRTUAL", "decimals": 93, "namespace": "n32atB0QPQPEp5Ut"}, "customParameters": {"wUWGt6tooHP5kAww": {}, "01zalTddhAQ1pwqn": {}, "ybvUIfuulmeegRwP": {}}, "extOrderNo": "Pbn7lttd21cS6IVE", "extTxId": "4fzwG3BHaRcZ8NK4", "extUserId": "gkLmvEOaRcqTgF0x", "issuedAt": "1980-09-03T00:00:00Z", "metadata": {"QAXoDoFkmA3fgzcw": "dgJMjIyGfiNBQy41", "M1gzGCbaxw33rNbE": "4bbDU4FMTbQaANJO", "ODGerDCWcl3VSJEN": "QopeHD6iKBGm5Cj7"}, "namespace": "RqnJUmfDmofxvN8p", "nonceStr": "RGoUtmbWZbEjPyq3", "paymentMethod": "5BWDoc3qNcQFFyHv", "paymentMethodFee": 0, "paymentOrderNo": "41NPqjRUMKSQjFdj", "paymentProvider": "STRIPE", "paymentProviderFee": 37, "paymentStationUrl": "TaZFsWzbqwTZQIN5", "price": 18, "refundedTime": "1991-08-19T00:00:00Z", "salesTax": 83, "sandbox": false, "sku": "G5cG6XxENbWqlX7i", "status": "AUTHORISED", "statusReason": "cZQaCeNLYxMID9pq", "subscriptionId": "Z5rryiMMt6fQtLhz", "subtotalPrice": 49, "targetNamespace": "5RK100yH89i8ZDPX", "targetUserId": "RL8cbTAntB1STaab", "tax": 87, "totalPrice": 95, "totalTax": 45, "txEndTime": "1973-07-30T00:00:00Z", "type": "ibXg7RCe5BtKcwj6", "userId": "PqqOgCimr3ZQNBBk", "vat": 36}' \
    > test.out 2>&1
eval_tap $? 238 'ProcessUserOrderNotification' test.out

#- 239 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'btOtcQS4Cmgw1wRU' \
    --userId 'nIVYxY6OhdkrYiCi' \
    > test.out 2>&1
eval_tap $? 239 'DownloadUserOrderReceipt' test.out

#- 240 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'noVOzo4Plv1IlTpE' \
    --body '{"currencyCode": "hjTFYdzsUNvQAn2L", "currencyNamespace": "uMjLqwmVz3zKsfjz", "customParameters": {"1mFkyxoUzfMFoXCO": {}, "guSq2A4R3wDdSkNf": {}, "HJtA3QiX9Zvtydba": {}}, "description": "Vb0scd97A0GP6djn", "extOrderNo": "2Ps3IVT5hUZ3cnDq", "extUserId": "0ddZG0EpfGAqHKcS", "itemType": "LOOTBOX", "language": "whC_QyLL-yj", "metadata": {"ALMresGFfsH4aXCD": "hshvEF8rHd250nyi", "hcUVGHQczI5ZoTRU": "kjGoRkPs2SO9XrgX", "NIaU11cBXLwTfopq": "eZtHJnRgaGfLMFbv"}, "notifyUrl": "yI5PZGzVLcmZKKKY", "omitNotification": true, "platform": "cMnM6QtjzQjDlUMC", "price": 68, "recurringPaymentOrderNo": "1QYvww4XDokltgq2", "region": "vXtUnY6UhDJ4pe0s", "returnUrl": "0Cuhl3dU9b4seYCy", "sandbox": false, "sku": "f4tjPGpu27yxb1of", "subscriptionId": "79zVTWIfgdNphqe9", "title": "fS1m77MAg4KoZQPL"}' \
    > test.out 2>&1
eval_tap $? 240 'CreateUserPaymentOrder' test.out

#- 241 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hDSJx9jzxaRKph4k' \
    --userId 'iIFgS4fLqlrKGiS3' \
    --body '{"description": "XxjkyNfj3XgTRTjI"}' \
    > test.out 2>&1
eval_tap $? 241 'RefundUserPaymentOrder' test.out

#- 242 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '9oNBzgQ4CRwg0sKV' \
    --body '{"code": "eSpMny0GrvKI5EVB", "orderNo": "9ZFzLNsjdCFtKY0K"}' \
    > test.out 2>&1
eval_tap $? 242 'ApplyUserRedemption' test.out

#- 243 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'sxR0rCFkyiQZfMnT' \
    --body '{"meta": {"bKdwNhiIP7dpJ8B8": {}, "VwFQnVco2oCn1KvJ": {}, "mbjapW9UlEqtzDd7": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "gxdxB5kvtM8ah9bP", "namespace": "sksceGUEX8ERZcKS"}, "entitlement": {"entitlementId": "YLo6y7yJMowQ6LpH"}, "item": {"itemIdentity": "CvCYTgX9JQwErzjt", "itemIdentityType": "ITEM_SKU", "origin": "Playstation"}, "quantity": 84, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "TY4v9NNfQSYLFKSl", "namespace": "3FNFFJnt3rIwZdW0"}, "entitlement": {"entitlementId": "2Su6aCnL816aH6gO"}, "item": {"itemIdentity": "BUIMeL0GL3aefSDM", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 68, "type": "ITEM"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "xILI42BJMPkZmay4", "namespace": "Csye3iJLtjsu6ZJR"}, "entitlement": {"entitlementId": "CoDq3geuHFFaZzPI"}, "item": {"itemIdentity": "jETqcKN1gaQ4Bn0c", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 40, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "lKHF0ebxhJ1176Ce"}' \
    > test.out 2>&1
eval_tap $? 243 'DoRevocation' test.out

#- 244 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'D4dWCp4wqlQJcZro' \
    --chargeStatus 'CHARGED' \
    --itemId 'QiefBnPluOIjZyvl' \
    --limit '67' \
    --offset '86' \
    --sku 'DQGv6pNNowEuVVZM' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserSubscriptions' test.out

#- 245 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '4mnYvvlt1es7A4PF' \
    --excludeSystem  \
    --limit '7' \
    --offset '94' \
    --subscriptionId 'uN4gx0UC6eWKCFGS' \
    > test.out 2>&1
eval_tap $? 245 'GetUserSubscriptionActivities' test.out

#- 246 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '97Si6XyLVPrkUxyZ' \
    --body '{"grantDays": 37, "itemId": "OH5Nn4nMT8QOyTuU", "language": "SD9ImtaPAocOQcpB", "reason": "WSNrCjSNEAdojkCM", "region": "mYyTGO07foRZ6Fuj", "source": "pIWo0qJtqp4Q6XgI"}' \
    > test.out 2>&1
eval_tap $? 246 'PlatformSubscribeSubscription' test.out

#- 247 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLgMHcP1eE6sjWQl' \
    --itemId 'lYsONpp6QGW56CNi' \
    > test.out 2>&1
eval_tap $? 247 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 248 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'szHE69D1MMoaf6Kl' \
    --userId 'gRtwaM2IoyY1wpId' \
    > test.out 2>&1
eval_tap $? 248 'GetUserSubscription' test.out

#- 249 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jcAtTj1IMuuhxxlu' \
    --userId 'lfmya73hX0a8Ri85' \
    > test.out 2>&1
eval_tap $? 249 'DeleteUserSubscription' test.out

#- 250 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PA9wNpmrK5Y5heA2' \
    --userId 'ewWnFcqHxXP3kRht' \
    --force  \
    --body '{"immediate": true, "reason": "Y3c4SryWB4yRaDxv"}' \
    > test.out 2>&1
eval_tap $? 250 'CancelSubscription' test.out

#- 251 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xwaLM8HkVOW8PnLk' \
    --userId 'gqkqYZWPZTgKagTz' \
    --body '{"grantDays": 6, "reason": "ilcKA84d9pMsl7zr"}' \
    > test.out 2>&1
eval_tap $? 251 'GrantDaysToSubscription' test.out

#- 252 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NJvDiP2hNNEI8QrQ' \
    --userId '6H1ro5CtU8UjgyCU' \
    --excludeFree  \
    --limit '31' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 252 'GetUserSubscriptionBillingHistories' test.out

#- 253 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BCK4FeVGrl5NpUG9' \
    --userId 'zblWEiHaUjyTHb0s' \
    --body '{"additionalData": {"cardSummary": "Slstb3slUe94NxhX"}, "authorisedTime": "1980-01-24T00:00:00Z", "chargebackReversedTime": "1990-05-10T00:00:00Z", "chargebackTime": "1996-05-09T00:00:00Z", "chargedTime": "1975-06-18T00:00:00Z", "createdTime": "1994-10-11T00:00:00Z", "currency": {"currencyCode": "MBMzaOrxuKvtUVtq", "currencySymbol": "bDWnJ2i9TRmJOqIl", "currencyType": "REAL", "decimals": 82, "namespace": "hO5vpk9DOSgbsdGV"}, "customParameters": {"PLD9A5NmuZDUV3yH": {}, "urgOfba1XeoHYTNo": {}, "Rol84UlkxtP5Vok9": {}}, "extOrderNo": "sNK1ORg3tChsS3fF", "extTxId": "paS1uq1mH3oYfPK2", "extUserId": "QiAUhIfi17YrkWHN", "issuedAt": "1983-03-09T00:00:00Z", "metadata": {"BfgBLuglkd9LIosh": "GnFSuHmrqej8PRpp", "YY1vlV0M2g6oreqy": "BzWzCgMMWZuD6tmI", "R28xVxbtpSKOfiIP": "3S6pypZqISn3msry"}, "namespace": "kQFtW8QGKFZLrIfq", "nonceStr": "rZuu7IwKcT7sAsv2", "paymentMethod": "TKCbYMVkXEHmsHwI", "paymentMethodFee": 67, "paymentOrderNo": "gcJ0DcEt23pci6xE", "paymentProvider": "PAYPAL", "paymentProviderFee": 8, "paymentStationUrl": "jer6aGJx5OFp3jKE", "price": 47, "refundedTime": "1994-01-04T00:00:00Z", "salesTax": 94, "sandbox": false, "sku": "GdwTPX4ig3NVFFkP", "status": "CHARGEBACK_REVERSED", "statusReason": "O3F4vsohRWDyGYIV", "subscriptionId": "FDbTvRYfpJ4wM9WZ", "subtotalPrice": 11, "targetNamespace": "yRfiCWrm3s1Ah3TI", "targetUserId": "I70MIcBMJ04508jK", "tax": 9, "totalPrice": 77, "totalTax": 7, "txEndTime": "1990-07-08T00:00:00Z", "type": "oPZrkjRm5Ki0orhX", "userId": "rISEaPZHLQkTHvnd", "vat": 87}' \
    > test.out 2>&1
eval_tap $? 253 'ProcessUserSubscriptionNotification' test.out

#- 254 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'UQV5QEvKElLfbB7g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwAR1xFrnyirw3iJ' \
    --body '{"count": 40, "orderNo": "Vso5TJCSugdo4XTm"}' \
    > test.out 2>&1
eval_tap $? 254 'AcquireUserTicket' test.out

#- 255 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '8t1YTWqItjNWXm9s' \
    > test.out 2>&1
eval_tap $? 255 'QueryUserCurrencyWallets' test.out

#- 256 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'raeMA78YSRS2fPy5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fpbbbMIu9lu18jIM' \
    --body '{"allowOverdraft": true, "amount": 8, "balanceOrigin": "GooglePlay", "reason": "M77XmemN8LO03mnF"}' \
    > test.out 2>&1
eval_tap $? 256 'DebitUserWalletByCurrencyCode' test.out

#- 257 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Sq9jJTVFoFjxZjh5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qUR1Pq4a4uaMfd0S' \
    --limit '88' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 257 'ListUserCurrencyTransactions' test.out

#- 258 CheckWallet
eval_tap 0 258 'CheckWallet # SKIP deprecated' test.out

#- 259 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'AfYIyzHL8jxakuVu' \
    --namespace "$AB_NAMESPACE" \
    --userId '5r5B08VZxI4TU3ap' \
    --body '{"amount": 26, "expireAt": "1979-01-17T00:00:00Z", "origin": "System", "reason": "oJ4gI4EQKO8xC4D0", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 259 'CreditUserWallet' test.out

#- 260 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'mBEuhnaxZVf6MD9r' \
    --namespace "$AB_NAMESPACE" \
    --userId '1y5Ihr531Kajxq7l' \
    --body '{"amount": 52, "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 260 'PayWithUserWallet' test.out

#- 261 GetUserWallet
eval_tap 0 261 'GetUserWallet # SKIP deprecated' test.out

#- 262 DebitUserWallet
eval_tap 0 262 'DebitUserWallet # SKIP deprecated' test.out

#- 263 DisableUserWallet
eval_tap 0 263 'DisableUserWallet # SKIP deprecated' test.out

#- 264 EnableUserWallet
eval_tap 0 264 'EnableUserWallet # SKIP deprecated' test.out

#- 265 ListUserWalletTransactions
eval_tap 0 265 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 266 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uVRVEvhKIbrq1xsG' \
    > test.out 2>&1
eval_tap $? 266 'ListViews' test.out

#- 267 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pdobYun8hcO55hVj' \
    --body '{"displayOrder": 10, "localizations": {"mA4ehxNIIlcrZzga": {"description": "meT2mLkkAMjHyI0e", "localExt": {"2Axj0nZHjmoKHJng": {}, "wMe1AnQVj6QQjZtk": {}, "NJCnDSrsSey2BqOx": {}}, "longDescription": "gwCymCDYsuff3b7G", "title": "5FDX4mu0qPHb9Ll2"}, "EFEb8GnsthmQ2Y6Z": {"description": "GOiqrg3lpqN5bOfn", "localExt": {"qJ5bzDRzbhMxfEDE": {}, "4TrtIHyyMq79EdB9": {}, "MxaF8QHGM2IuQYBO": {}}, "longDescription": "8m0HgTth479W8rXq", "title": "wGVIRWgTNHCka3Wb"}, "5kH1BrLWUetP7nmE": {"description": "SQDV3BD1nnEzoUlU", "localExt": {"WqP4ElzL44KEm3uH": {}, "BMCP5ckjphURs4ks": {}, "gsKJ2R6Jacwwu8W1": {}}, "longDescription": "zvrKMRPvwA9k6yJz", "title": "03NETdywPqYerrpO"}}, "name": "m4M2pM4fIfcHBWZM"}' \
    > test.out 2>&1
eval_tap $? 267 'CreateView' test.out

#- 268 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '50aHbPXRns3qwYL6' \
    --storeId 'LwGlZGF7XQPLAcIL' \
    > test.out 2>&1
eval_tap $? 268 'GetView' test.out

#- 269 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '7FvAMWqhyyNZH1Cd' \
    --storeId 'ucB5y5iMdeBG7REG' \
    --body '{"displayOrder": 15, "localizations": {"meKEabfVXBJPIZqZ": {"description": "C5d6JuFdcfiNf0DO", "localExt": {"HKwxDF5GJhCjVHiC": {}, "n2hTefT8gPFJ4Wnd": {}, "MpQhcLK0WTZbtmQk": {}}, "longDescription": "wC8azx3IRWme3C6p", "title": "2r4D3NQdjrjkX3AM"}, "gK3JgZufzssA284m": {"description": "G7uAojLYBsx8oqMz", "localExt": {"bE0ljQaBtb47V691": {}, "j0FZp2vjOXptxzx6": {}, "kkaZYpl52sQR9Znp": {}}, "longDescription": "5d1eSwrG2GBBEWrD", "title": "bQ1ZzhDuLHq9LTBs"}, "tguOdN0O7l3GbKPH": {"description": "dDTQDEEE2mTsn1Nw", "localExt": {"J71szsNmnqZSWdEy": {}, "OVYrTdDq7IqbTVv8": {}, "BLsqQW8HSrEm5Y7j": {}}, "longDescription": "I232SjktijiNzTUe", "title": "8KdizXmrmK0sCUsq"}}, "name": "xKocHomtjoU1kUqR"}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateView' test.out

#- 270 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'edwIu1TSRr6r8mzf' \
    --storeId 'MedpcKhvHPlvYanG' \
    > test.out 2>&1
eval_tap $? 270 'DeleteView' test.out

#- 271 QueryWallets
eval_tap 0 271 'QueryWallets # SKIP deprecated' test.out

#- 272 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 33, "expireAt": "1981-09-07T00:00:00Z", "origin": "IOS", "reason": "hopdqGrqRZ124P7P", "source": "ACHIEVEMENT"}, "currencyCode": "vRQb7c0vmjWq9fQq", "userIds": ["zulLGfQMqSLQDlRF", "ikslpyL9BYLVVznF", "YMVfiAMa6Pco7Mfv"]}, {"creditRequest": {"amount": 9, "expireAt": "1974-10-20T00:00:00Z", "origin": "Xbox", "reason": "PCbs8jWmTteJhwNb", "source": "PROMOTION"}, "currencyCode": "0ilGQFwHUtZugblT", "userIds": ["lcWEyNgvs5LEZrQX", "3aIDKn9qJXncm5ig", "pAewbmnWk0E7YaPb"]}, {"creditRequest": {"amount": 52, "expireAt": "1977-12-30T00:00:00Z", "origin": "Playstation", "reason": "QRWRs9EGnRPgYlJE", "source": "GIFT"}, "currencyCode": "RnLcLbp7OmcrDJ7u", "userIds": ["Heb0CaPFDjrSotKn", "1rrRPcnG89rnNW1Y", "jfn8lY4DnYRxY8Zh"]}]' \
    > test.out 2>&1
eval_tap $? 272 'BulkCredit' test.out

#- 273 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "pJWALpToj9rgr5Rf", "request": {"allowOverdraft": false, "amount": 68, "balanceOrigin": "Xbox", "reason": "wunQwpC2eCFUAHZa"}, "userIds": ["aSRmHU5iR3hXIbzW", "PKOkzftOgDQAWhul", "YSvsWiNJtqXltZF6"]}, {"currencyCode": "brDf7q4cAnpmLiEu", "request": {"allowOverdraft": true, "amount": 59, "balanceOrigin": "Nintendo", "reason": "NtX2lnqi7cHTSdGo"}, "userIds": ["sEYogFWiH9z4E8zm", "aZ5cg0REtUWY4fVI", "LZbC3UJruU4uIXBZ"]}, {"currencyCode": "dqwCWF5wmbOubTxA", "request": {"allowOverdraft": true, "amount": 26, "balanceOrigin": "GooglePlay", "reason": "dXVvaPQzzKdFg7N7"}, "userIds": ["pHt7MdKu9Xwn5GHJ", "EIs3GC9VTK7tkJWF", "piT8VcrXLZnuMNpK"]}]' \
    > test.out 2>&1
eval_tap $? 273 'BulkDebit' test.out

#- 274 GetWallet
eval_tap 0 274 'GetWallet # SKIP deprecated' test.out

#- 275 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'DGatrYOMO91CYEjX' \
    --end '867n9PT9fR7mMuBX' \
    --start 'PDKCriRKzTZ7TXAV' \
    > test.out 2>&1
eval_tap $? 275 'SyncOrders' test.out

#- 276 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["RnUVbxEJcKHE764E", "whQfxFKIOGT1WKSm", "LoA0ILaESC1GJXso"], "apiKey": "Bwqh0TQXa2j7v3zQ", "authoriseAsCapture": false, "blockedPaymentMethods": ["XIlrMl2RAukCL26i", "hdMy9YCLNJEkvq6S", "USt8xd8EgE15XNuw"], "clientKey": "6Y7sToQNkuZzJ1XB", "dropInSettings": "xw01iBBQukgQ94Zv", "liveEndpointUrlPrefix": "PCWcMX0ov3U2sKjI", "merchantAccount": "eyFS97dYD7LkcTKY", "notificationHmacKey": "pCfl6HPy5cJfAV5i", "notificationPassword": "Ofzwt3bpxRNt6lKo", "notificationUsername": "MjCPtEKeBWTm78Fn", "returnUrl": "8TvZVTe4L2lXrVPX", "settings": "6r5ZTcnVVOKMApTc"}' \
    > test.out 2>&1
eval_tap $? 276 'TestAdyenConfig' test.out

#- 277 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "WsFRUlWBp4gBs9Uu", "privateKey": "fgsVbG6TUe3jbuQ7", "publicKey": "HMPO4ozK705ykRqS", "returnUrl": "PYZgPm4JLsXVtBOE"}' \
    > test.out 2>&1
eval_tap $? 277 'TestAliPayConfig' test.out

#- 278 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "etHsxAJ8Ny1LRkPU", "secretKey": "9hrl5nkpEdBe8bYW"}' \
    > test.out 2>&1
eval_tap $? 278 'TestCheckoutConfig' test.out

#- 279 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'dok4UnUEOyP0cPZf' \
    > test.out 2>&1
eval_tap $? 279 'DebugMatchedPaymentMerchantConfig' test.out

#- 280 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "5OvolfI0mqZctohL", "clientSecret": "heRaQkfMLFW9B7jH", "returnUrl": "Zro4hhwnANAGp8zG", "webHookId": "qNGrcQyoA1TWPcy8"}' \
    > test.out 2>&1
eval_tap $? 280 'TestPayPalConfig' test.out

#- 281 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["3iXfYXNdMkdg9TMw", "xNcQ6CkVi8fqVPRq", "NbF5yLnYSa8xFLvc"], "publishableKey": "YexMMMiDFh5RbW02", "secretKey": "1cHN3QbzVuJZH3k5", "webhookSecret": "4cExxWKtdGTW4FIL"}' \
    > test.out 2>&1
eval_tap $? 281 'TestStripeConfig' test.out

#- 282 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "otv5ycTa0i6ifYP1", "key": "zfgjsy3VRjX4qA4g", "mchid": "9OGoWw1qnCAvdnAc", "returnUrl": "okJ0rzqX2KJcYHgi"}' \
    > test.out 2>&1
eval_tap $? 282 'TestWxPayConfig' test.out

#- 283 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "FDxclBXap6j73doC", "flowCompletionUrl": "WxhubMXbxNvT6wAf", "merchantId": 12, "projectId": 88, "projectSecretKey": "v4uzKAwiI4wTxNIe"}' \
    > test.out 2>&1
eval_tap $? 283 'TestXsollaConfig' test.out

#- 284 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'fCmtrxWu293551nQ' \
    > test.out 2>&1
eval_tap $? 284 'GetPaymentMerchantConfig' test.out

#- 285 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'BNKcqCkUXRj8gQHE' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["e4CO370OsbzRKKPd", "6mjzLxllUrFYn7cS", "uO7NxKHUHg0c4X7f"], "apiKey": "HdITmN9opaF0kh3p", "authoriseAsCapture": true, "blockedPaymentMethods": ["8fNAM5YdHivK2Q0W", "wolQy037hJMOEv5W", "0v25yAObZIbrA8XA"], "clientKey": "KKWMDebehSjpt0wr", "dropInSettings": "fWPXaI1Jb75o2MFO", "liveEndpointUrlPrefix": "a6xgPt69QROGDeJC", "merchantAccount": "yHvUsnLvXCSgQHvs", "notificationHmacKey": "25eiQO3oWdgXdm1I", "notificationPassword": "xL1OtleUBqBO0Ze0", "notificationUsername": "49k9W6ZLVJzRpUsI", "returnUrl": "TfVruDukun42zPZv", "settings": "Od4yZyMKyED3qDO5"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdateAdyenConfig' test.out

#- 286 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'HXp5oVkhESbHQ7hv' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 286 'TestAdyenConfigById' test.out

#- 287 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Tlzf7XwQtVIYU87N' \
    --sandbox  \
    --validate  \
    --body '{"appId": "gjDMcJxfMfYFlt3J", "privateKey": "vDgMiyBGygWFTAY3", "publicKey": "Th5mOwPCPKVPlOGf", "returnUrl": "FBlu2ZP0IkiYXGk6"}' \
    > test.out 2>&1
eval_tap $? 287 'UpdateAliPayConfig' test.out

#- 288 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'BoBmSLi0R7zDFMoN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 288 'TestAliPayConfigById' test.out

#- 289 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'TQmlS8lMlY8Ujprh' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "CxhzW6ZM7LkTVrtV", "secretKey": "JZVhxCVdjPutJ8dk"}' \
    > test.out 2>&1
eval_tap $? 289 'UpdateCheckoutConfig' test.out

#- 290 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'AVOJ5imghdfVhjnj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 290 'TestCheckoutConfigById' test.out

#- 291 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'd66A1SQmWGSQLAVP' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "AJ7zX5lB80k2smdk", "clientSecret": "BS2MaIP7PjngEFgg", "returnUrl": "q91cpgvoDBgYfLBd", "webHookId": "GNAZEvbvxqa0K7VU"}' \
    > test.out 2>&1
eval_tap $? 291 'UpdatePayPalConfig' test.out

#- 292 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'bjUnzirnEsxSE4vB' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 292 'TestPayPalConfigById' test.out

#- 293 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'zG7VK8sWEshmZf5f' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["EdvjbyJPQ1qdRcJj", "sme1OukIfIZVH8q8", "svV5hMOSfpyJkJlm"], "publishableKey": "JmTkFvB7wkY6nuUE", "secretKey": "GJ3k0HGtpK43uORG", "webhookSecret": "REOOwTuY8dhNCDWW"}' \
    > test.out 2>&1
eval_tap $? 293 'UpdateStripeConfig' test.out

#- 294 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'pN3B6tedgFUzBm5v' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 294 'TestStripeConfigById' test.out

#- 295 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'GA3itKaF9z3WWuv3' \
    --validate  \
    --body '{"appId": "j8T9g1f6P3D3rVcC", "key": "2g6t42jE1Wad232Y", "mchid": "V7A2zHFGbN8AQaCa", "returnUrl": "w9UF7cdSDd99DQZ7"}' \
    > test.out 2>&1
eval_tap $? 295 'UpdateWxPayConfig' test.out

#- 296 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'vnTx8HDXTJWiyw17' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 296 'UpdateWxPayConfigCert' test.out

#- 297 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'ogzmbj4SLYDrZJvD' \
    > test.out 2>&1
eval_tap $? 297 'TestWxPayConfigById' test.out

#- 298 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'LGvn6qtroZcp16HK' \
    --validate  \
    --body '{"apiKey": "XX1ft5nBA9xNIJVu", "flowCompletionUrl": "Mz04evSdE2FMcKd7", "merchantId": 5, "projectId": 27, "projectSecretKey": "94rEmIYuAT5OAcUw"}' \
    > test.out 2>&1
eval_tap $? 298 'UpdateXsollaConfig' test.out

#- 299 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'YHGmG5rNDBF1oU37' \
    > test.out 2>&1
eval_tap $? 299 'TestXsollaConfigById' test.out

#- 300 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'vjfyX5YLaM0wmi0i' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 300 'UpdateXsollaUIConfig' test.out

#- 301 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '56' \
    --namespace "$AB_NAMESPACE" \
    --offset '57' \
    --region 'SFBEgkwHifMHYI58' \
    > test.out 2>&1
eval_tap $? 301 'QueryPaymentProviderConfig' test.out

#- 302 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "HbF7fMX9lDXYxGRJ", "region": "M92eX42WW2WKf5ur", "sandboxTaxJarApiToken": "EOpASBicX3ZwzZ7a", "specials": ["ADYEN", "ALIPAY", "ADYEN"], "taxJarApiToken": "rkmhSOEozGOv8D0i", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 302 'CreatePaymentProviderConfig' test.out

#- 303 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 303 'GetAggregatePaymentProviders' test.out

#- 304 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Arjld0LnREsrrB2p' \
    > test.out 2>&1
eval_tap $? 304 'DebugMatchedPaymentProviderConfig' test.out

#- 305 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 305 'GetSpecialPaymentProviders' test.out

#- 306 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'J7V8BSrucjO3zvSM' \
    --body '{"aggregate": "ADYEN", "namespace": "eVNHU9GcOivIfcCJ", "region": "t4U8VSgXoi9Fw25b", "sandboxTaxJarApiToken": "9qXzlIK2G6AUjBCd", "specials": ["ALIPAY", "WXPAY", "ADYEN"], "taxJarApiToken": "Rp5e5IvFuN1oUsCn", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 306 'UpdatePaymentProviderConfig' test.out

#- 307 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'mGMx5F6EhM3dKvIG' \
    > test.out 2>&1
eval_tap $? 307 'DeletePaymentProviderConfig' test.out

#- 308 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 308 'GetPaymentTaxConfig' test.out

#- 309 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "9MR0hTINvq1VR9SJ", "taxJarApiToken": "UfQEX996Mh1sQ3Dw", "taxJarEnabled": true, "taxJarProductCodesMapping": {"ZO3P2f8TTOVf6jrr": "1OL606QpqCgxt0Ng", "DSj1T6EdeYFmrLT0": "HbvS4kSSt3CyDgf6", "eFAiqSkHi0BR2ElF": "6z6eJKuOW61akRFi"}}' \
    > test.out 2>&1
eval_tap $? 309 'UpdatePaymentTaxConfig' test.out

#- 310 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'zqxCmudSXivAL3n4' \
    --end '78mhb2I2yBJeCJgh' \
    --start 'Trk68FWFzuLBdlrK' \
    > test.out 2>&1
eval_tap $? 310 'SyncPaymentOrders' test.out

#- 311 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'jUbgZQfw6Zys3mN8' \
    --storeId 'fIcC9CkharfqaoMs' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetRootCategories' test.out

#- 312 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Gyv1RuSNdycDssUe' \
    --storeId 'HiVDXzSJ8kbFAyid' \
    > test.out 2>&1
eval_tap $? 312 'DownloadCategories' test.out

#- 313 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'bnXdMSwmkBkKC1h6' \
    --namespace "$AB_NAMESPACE" \
    --language 'h45u0wuh9pY0011j' \
    --storeId 'SmHFTtfM2mGUUpq3' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetCategory' test.out

#- 314 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'ix7Am7W1fwJnV94B' \
    --namespace "$AB_NAMESPACE" \
    --language 'rMSP31wAkVH75Ucm' \
    --storeId 'NXK5RqcIo9lpz9oM' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetChildCategories' test.out

#- 315 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '52vHPlwVV3jlPKDE' \
    --namespace "$AB_NAMESPACE" \
    --language 'YahnlLJaLCvjRKKX' \
    --storeId '1brmkJDfdngbQD3p' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetDescendantCategories' test.out

#- 316 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 316 'PublicListCurrencies' test.out

#- 317 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 317 'GetIAPItemMapping' test.out

#- 318 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '3W94Z8IW2MAL9gYH' \
    --region 'EV3wnTZTvYYf4ZFu' \
    --storeId 'V6L2AldoWWRN5wNY' \
    --appId 'lFiliYmBrqrOc0NI' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetItemByAppId' test.out

#- 319 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId '18RQnj4imu6XFfRc' \
    --categoryPath 'WDXhq1YmGeygr2S4' \
    --features 'Yw8NmPaBeryzX2hO' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'uEVP9bF07gnWDULk' \
    --limit '73' \
    --offset '83' \
    --region 'PQR0UJMr8ouccGH0' \
    --sortBy 'createdAt:asc,displayOrder,updatedAt:asc' \
    --storeId '0QwnlgAVfqz6gQJh' \
    --tags '8sn0bVWRkvmAemh8' \
    > test.out 2>&1
eval_tap $? 319 'PublicQueryItems' test.out

#- 320 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'lioBR7xTXcEIFod3' \
    --region 'lCzvjHzDHOrSJ1vb' \
    --storeId 'B7LRHd96dGLgkfrZ' \
    --sku 'veFMWAFT7l0l1jaO' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetItemBySku' test.out

#- 321 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'AMCzbsoIgmKwwMDQ' \
    --region 'PjUIosq1l6xo0D4J' \
    --storeId 'RbNqO6IuP2PY5hhX' \
    --itemIds '6uNah9JoHPj7jFWx' \
    > test.out 2>&1
eval_tap $? 321 'PublicBulkGetItems' test.out

#- 322 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["Sv1lYylYAiZ8c7Zd", "7EUoezOLw8C1c5bB", "B3XZ7ColKwlsNvtF"]}' \
    > test.out 2>&1
eval_tap $? 322 'PublicValidateItemPurchaseCondition' test.out

#- 323 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'INGAMEITEM' \
    --limit '98' \
    --offset '41' \
    --region '2emK3JecJA4skqCb' \
    --storeId 'PxRkIAFQh9yDdoLE' \
    --keyword '2s7mrVrmTJwtBTzQ' \
    --language 'TrNo1LcWNf7xHpi1' \
    > test.out 2>&1
eval_tap $? 323 'PublicSearchItems' test.out

#- 324 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'JZJjIRtCfqDHSlo5' \
    --namespace "$AB_NAMESPACE" \
    --language '4zSnRN0zGMworzym' \
    --region '1z3ZdetOic9AQOFW' \
    --storeId 'pdItLBhvKJq9tWz9' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetApp' test.out

#- 325 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'yui8a6jOflFJlZEh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 325 'PublicGetItemDynamicData' test.out

#- 326 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'z1QDeh05hj92bwVV' \
    --namespace "$AB_NAMESPACE" \
    --language 'xJ62Q5AOAOyL65cP' \
    --populateBundle  \
    --region 'aOZA8BG8KcVWOX9n' \
    --storeId '3YsjJexnFA9Umz3K' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetItem' test.out

#- 327 GetPaymentCustomization
eval_tap 0 327 'GetPaymentCustomization # SKIP deprecated' test.out

#- 328 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "PICya5Fk5TPaEbX2", "paymentProvider": "CHECKOUT", "returnUrl": "cV8v7MXctihtxMnI", "ui": "r4b7jyfL3zMkklGC", "zipCode": "PISlsnVA6z0uSfNN"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetPaymentUrl' test.out

#- 329 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pJUYzJxnOyvqmswr' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetPaymentMethods' test.out

#- 330 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ToyBIQumxDfAxNqC' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUnpaidPaymentOrder' test.out

#- 331 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'UtizYM97ebZcYqwf' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'PWMkOmrT5HL16jMw' \
    --body '{"token": "ECnmwJv4rpqtzDaz"}' \
    > test.out 2>&1
eval_tap $? 331 'Pay' test.out

#- 332 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0WUJlBCHzJ2v9K8c' \
    > test.out 2>&1
eval_tap $? 332 'PublicCheckPaymentOrderPaidStatus' test.out

#- 333 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'zOlZg30pagfP0FfO' \
    > test.out 2>&1
eval_tap $? 333 'GetPaymentPublicConfig' test.out

#- 334 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'MBOpeQT4zYIbU4i9' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetQRCode' test.out

#- 335 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'mLyX46Alt08rrnG8' \
    --foreinginvoice 'y2ScXkwjpAp82pGc' \
    --invoiceId 'xvXaG9LzHpMS53jl' \
    --payload 'lopwirRo3A8WxnR0' \
    --redirectResult 'YaMsF3f5KLtpTSsP' \
    --resultCode 'MGDZTOwEP5Bhh0NS' \
    --sessionId 'tWIggmhfAzVdNYP7' \
    --status 'Ao1z7FeJM2fWXGk7' \
    --token 'JObSHksRkabpmvRs' \
    --type 'c7ZYvXCT6m6mRZAl' \
    --userId 'LBczJVeil7GbG1IS' \
    --orderNo 'BCkcnpxKUxLjmxhB' \
    --paymentOrderNo 'S6YypRW7fNntaIEt' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'x3m7lEXTmnTbtjK9' \
    > test.out 2>&1
eval_tap $? 335 'PublicNormalizePaymentReturnUrl' test.out

#- 336 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'RsyoqT3adB48Jxp2' \
    --paymentOrderNo 'zaItg9jTNZvpFEUI' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 336 'GetPaymentTaxValue' test.out

#- 337 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'aSaIsMyLKPPIZx0z' \
    > test.out 2>&1
eval_tap $? 337 'GetRewardByCode' test.out

#- 338 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'dNAagipZwiaBrFrX' \
    --limit '39' \
    --offset '53' \
    --sortBy 'rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 338 'QueryRewards1' test.out

#- 339 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jujfHZB1gMI1B8DX' \
    > test.out 2>&1
eval_tap $? 339 'GetReward1' test.out

#- 340 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicListStores' test.out

#- 341 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'b37DffTZ7yQz337L,LNCjIySe36SA5dxA,TLv5PkLvraRzChdj' \
    --itemIds 'DGdlk2A2jHbAPNGI,nvbnf4ewKFFLoGgg,X4gQWyZocvYfr0Rn' \
    --skus 'l02R1IVNnaK6KS71,Xs1BphA9BXpKYgF9,OuigDP0Vjmy7j2Br' \
    > test.out 2>&1
eval_tap $? 341 'PublicExistsAnyMyActiveEntitlement' test.out

#- 342 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'dCAm3slCwaBqHpE5' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 343 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'sjxBGijw0dQtZNon' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 344 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'PaOU5nukycAUlkUS' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 345 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ZKUrsxNRzF3NaUuC,yQyze6zPKu5sE89J,W8UU0RsB6dvrpmIn' \
    --itemIds 'hHYzVVlHGFSwjby6,rMYkVQnZDUAbINRK,QsxUO1YMxAndOj5O' \
    --skus '6IBwXJjgQjgLoJyq,wFVBd1ZjaRXEdWgS,12bSbPgOCWUogize' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetEntitlementOwnershipToken' test.out

#- 346 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "WOPUMrqgEIsMwNbf", "language": "cIr_yY", "region": "bAyGiXa9nUsHCVic"}' \
    > test.out 2>&1
eval_tap $? 346 'SyncTwitchDropsEntitlement' test.out

#- 347 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'uJ7onrUXVlB6xNel' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'PublicGetMyWallet' test.out

#- 348 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '4Bxb9KwFYqdhEVq3' \
    --body '{"epicGamesJwtToken": "hbsApeASfR0ljKxq"}' \
    > test.out 2>&1
eval_tap $? 348 'SyncEpicGameDLC' test.out

#- 349 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcLuhwNDvValv3bk' \
    --body '{"serviceLabel": 30}' \
    > test.out 2>&1
eval_tap $? 349 'PublicSyncPsnDlcInventory' test.out

#- 350 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'JfkFDhSeSGXtZU5S' \
    --body '{"serviceLabels": [42, 70, 63]}' \
    > test.out 2>&1
eval_tap $? 350 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 351 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHZzHs8x5oPSkZFI' \
    --body '{"appId": "V2feXnTRlzAJy9oF", "steamId": "OHB2KEsIdtozVltB"}' \
    > test.out 2>&1
eval_tap $? 351 'SyncSteamDLC' test.out

#- 352 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'hoXE4wgcYT5CdjaJ' \
    --body '{"xstsToken": "uUzFIeqaVr1CE1gu"}' \
    > test.out 2>&1
eval_tap $? 352 'SyncXboxDLC' test.out

#- 353 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '6cYuzC77J4irvZ9t' \
    --appType 'DLC' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'CcO1OHbpQZtwW3Ew' \
    --features 'Lre1bL4dJnkRLJbM,vOGSd7uMrmQ2SaLd,6M7TM3wnJyExuo5z' \
    --itemId '9RAcYgYZb7cAakJp,qN6eubdp49JFwXG0,EvoSHNC97eEyhnL1' \
    --limit '88' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 353 'PublicQueryUserEntitlements' test.out

#- 354 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5AlYRAqCAC2gy1W' \
    --appId 'F9QLNgDxAkwgfB8j' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUserAppEntitlementByAppId' test.out

#- 355 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'IecOx5ugNCDd6jW6' \
    --limit '12' \
    --offset '52' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 355 'PublicQueryUserEntitlementsByAppType' test.out

#- 356 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LvfQWC85MxWxvW0v' \
    --entitlementClazz 'APP' \
    --itemId 'gJB6a7uykADFpinF' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetUserEntitlementByItemId' test.out

#- 357 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'cH2ZMSYijqEuMfuY' \
    --entitlementClazz 'MEDIA' \
    --sku 'ZyHChRPHvdkcKW21' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetUserEntitlementBySku' test.out

#- 358 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'B5EFtD2pYaKTz1gc' \
    --appIds 'E2XCwTkRUIX6IFHN,mB9mYBvtOwxjqyrj,DApeN5eAfRqSgH5x' \
    --itemIds 'IuBTYOdsvNyk52MQ,FkVVEf36S7yPgG48,bk6PwH1tdEAJSqXA' \
    --skus '0Wv0zWGvkc6byp3m,vyYT3GuaZVTxBlw1,IWeXKFT4rfSbbSlD' \
    > test.out 2>&1
eval_tap $? 358 'PublicExistsAnyUserActiveEntitlement' test.out

#- 359 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PGf9Fn32SJNPZkEf' \
    --appId 'kAcJTMS4pVRcCHIG' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 360 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmCMTr9ACnI2sMrE' \
    --entitlementClazz 'APP' \
    --itemId 'QSDWnMQGaYRxFWia' \
    > test.out 2>&1
eval_tap $? 360 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 361 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7yJ2d87XjA0ajvb7' \
    --ids 'JcGUFgp6LkyXpxJe,FxhgTwyO51CUpcdx,L0a9VDhrqWCTXOxQ' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 362 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpyFgZhNpOTE4toH' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '7yr01N33p1Gha8Hw' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 363 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'pagvERZI6Cqhcknh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ecNv2Tw6YKhVrYkM' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUserEntitlement' test.out

#- 364 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'qXkQ7qlaJjSYEseB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YCFGoKpXx60GmEX9' \
    --body '{"options": ["x2BYpyKEBQ7TW7lZ", "vDbwFJJhBRdq8BgA", "I81k4Gr7jVVx5l3y"], "requestId": "rH9HR4reG0HwUXxQ", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 364 'PublicConsumeUserEntitlement' test.out

#- 365 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'BjKmCBXETZwqdzAX' \
    --namespace "$AB_NAMESPACE" \
    --userId '28DikGk8cWiX44az' \
    --body '{"requestId": "SHcwicUVq2XPljTZ", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 365 'PublicSellUserEntitlement' test.out

#- 366 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'tt0PpQY3Pnnic80y' \
    --body '{"code": "EO8dL6Jh10XMUGeD", "language": "IW-sAOD_448", "region": "18vAlmfGg9NO1Z2D"}' \
    > test.out 2>&1
eval_tap $? 366 'PublicRedeemCode' test.out

#- 367 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnAxH3pS3jyCkGKl' \
    --body '{"excludeOldTransactions": true, "language": "cho-RvLB", "productId": "hNtH3yYg4Qnn2uhd", "receiptData": "w7C9Bx1LQOTCbAPL", "region": "C3iqrkyJFOVaewFc", "transactionId": "v9h31YxuZnoSesWp"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicFulfillAppleIAPItem' test.out

#- 368 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUHjGaIcZN28gH4C' \
    --body '{"epicGamesJwtToken": "d9xTdt2K1CzpQWsl"}' \
    > test.out 2>&1
eval_tap $? 368 'SyncEpicGamesInventory' test.out

#- 369 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGnLYUYR0yOvJhUj' \
    --body '{"autoAck": true, "language": "CnUW", "orderId": "UlrhIpnlam2EefVo", "packageName": "pbpPhsana0uXG7GU", "productId": "TV1BwgkLDj4pjVkt", "purchaseTime": 50, "purchaseToken": "18cQ677SotDEtU2x", "region": "BSEQ8rBKc2K6oJXx"}' \
    > test.out 2>&1
eval_tap $? 369 'PublicFulfillGoogleIAPItem' test.out

#- 370 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'VEfnaqX8NuZtRUTK' \
    --body '{"currencyCode": "UvR69PImy6CcwlqJ", "price": 0.913823929679082, "productId": "MO3L8x1H5OgzHypg", "serviceLabel": 37}' \
    > test.out 2>&1
eval_tap $? 370 'PublicReconcilePlayStationStore' test.out

#- 371 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'CJmDXpjyvLSHB1y3' \
    --body '{"currencyCode": "klHuAGnidOyGuS0O", "price": 0.5274091724541536, "productId": "7ohiL2943ClrNhEd", "serviceLabels": [48, 58, 7]}' \
    > test.out 2>&1
eval_tap $? 371 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 372 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'aNp8dUBDinAB6HqI' \
    --body '{"appId": "WIi5Bvb1rcuEtWAF", "currencyCode": "763kci7lT62BOHas", "language": "Uy-Mhwn", "price": 0.7868374339572437, "productId": "ou1U0RVCf3gMWDAo", "region": "dCKqfqzeexHA70Ng", "steamId": "JTxjtzgO7W3taRvJ"}' \
    > test.out 2>&1
eval_tap $? 372 'SyncSteamInventory' test.out

#- 373 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6lKWJwHO65aOFDwp' \
    --body '{"gameId": "qy7XOU3DwglyMGNl", "language": "iT-muAd", "region": "iiIoMZCjGiOZJpUf"}' \
    > test.out 2>&1
eval_tap $? 373 'SyncTwitchDropsEntitlement1' test.out

#- 374 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '9RpcfEQn0O6D8PGQ' \
    --body '{"currencyCode": "uazAypgWhTED5YmP", "price": 0.7260024428028026, "productId": "BUkm2FyvdguCYVqF", "xstsToken": "yIKh1YtTY4AejyQc"}' \
    > test.out 2>&1
eval_tap $? 374 'SyncXboxInventory' test.out

#- 375 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '5Dac7hSLldWx5Dyn' \
    --itemId 'iVESUgrROrP1ip3j' \
    --limit '81' \
    --offset '34' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 375 'PublicQueryUserOrders' test.out

#- 376 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVNG8AqktgvjwNJA' \
    --body '{"currencyCode": "wIpEy2ZNpojZ24I2", "discountedPrice": 27, "ext": {"Ht6zx1i2W3GY7tdh": {}, "8hHlQyMlgfkTsATh": {}, "LyflAqqAP4M78smY": {}}, "itemId": "dyge6DroOywOxI4G", "language": "JsZO", "price": 54, "quantity": 90, "region": "vYfT8XQw2EOq6BFj", "returnUrl": "mN4OqKGLRpNWzKZt", "sectionId": "Znxgywmr4CYNGm7T"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicCreateUserOrder' test.out

#- 377 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'k1mMyeNRsjQuDEgO' \
    --userId '3MEQNL6ijLRvQOgo' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserOrder' test.out

#- 378 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aBooTawHLMxhx9nC' \
    --userId '3o6pXU5MDJLCB6Wb' \
    > test.out 2>&1
eval_tap $? 378 'PublicCancelUserOrder' test.out

#- 379 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XWIRpgjooaBVemsb' \
    --userId 'kaXZQ6nTj9rZpkSn' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserOrderHistories' test.out

#- 380 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tuOeaPAyPeEGBepK' \
    --userId '1Ix4SwjCYjCHniVS' \
    > test.out 2>&1
eval_tap $? 380 'PublicDownloadUserOrderReceipt' test.out

#- 381 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1gYGal5NrBtT0om' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetPaymentAccounts' test.out

#- 382 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '9OlGzpF25qu98Rhk' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'fwDMivWqHHGlnAnE' \
    > test.out 2>&1
eval_tap $? 382 'PublicDeletePaymentAccount' test.out

#- 383 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'u6EKYceTEqYudHlA' \
    --language '4AxeEIfUxJ2xMSNN' \
    --region 'BxCeN3pGn46fGvod' \
    --storeId 't413MRdG8qAPiANv' \
    --viewId '2Ar8yXV6qf6v5Sgc' \
    > test.out 2>&1
eval_tap $? 383 'PublicListActiveSections' test.out

#- 384 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPZPUh2nHQwpWi8H' \
    --chargeStatus 'CHARGED' \
    --itemId '6C0VJ0fK2m6lQ5Ao' \
    --limit '43' \
    --offset '94' \
    --sku '8V98cupW0L5WsiuI' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 384 'PublicQueryUserSubscriptions' test.out

#- 385 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'SPOUfWQwr4PYf48r' \
    --body '{"currencyCode": "66MaToxBiliy2vtR", "itemId": "kpqL6KrVcNz83J57", "language": "Cpp_vqSr", "region": "5bk5IeuAi3zWFGor", "returnUrl": "Cbncoj5RvEtXiKyU", "source": "GdNfMiwgSvsTRmJs"}' \
    > test.out 2>&1
eval_tap $? 385 'PublicSubscribeSubscription' test.out

#- 386 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Om0wVFyHvFhRMCFJ' \
    --itemId 'uA0DEMgykqqjoHTp' \
    > test.out 2>&1
eval_tap $? 386 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 387 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IPMSRAuPI7mSZQ5U' \
    --userId 'Dm1q51PlW2HG8LAi' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetUserSubscription' test.out

#- 388 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Izuo321Ll90IBFsS' \
    --userId 'b3FsV2PnCs9R0D5j' \
    > test.out 2>&1
eval_tap $? 388 'PublicChangeSubscriptionBillingAccount' test.out

#- 389 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZEwxcow6L7c3COEP' \
    --userId '4AZx70uwV4XgvGTM' \
    --body '{"immediate": false, "reason": "G1uenDihceaLdgPZ"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicCancelSubscription' test.out

#- 390 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'I0fKW8LeQxItaK6s' \
    --userId '3Hha69MgxjGJx62m' \
    --excludeFree  \
    --limit '22' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetUserSubscriptionBillingHistories' test.out

#- 391 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'fVlu4bGB1pyk0Ppx' \
    --language 'XZDy5Pmbu7RrD9a5' \
    --storeId 'mdlXTCL467xHbAiD' \
    > test.out 2>&1
eval_tap $? 391 'PublicListViews' test.out

#- 392 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '3Pr3mXZO1PnbSlfV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RlAI8F2f3mEv09kA' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetWallet' test.out

#- 393 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'A5hnQtd4bcivHGIE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'plRpcHDWcIoJ45L0' \
    --limit '93' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 393 'PublicListUserWalletTransactions' test.out

#- 394 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'YamxKDSZTl4UiJSC' \
    --baseAppId 'bG4UmG3TkMTzOcBI' \
    --categoryPath 'ciiKwRs1E7sH2G9M' \
    --features 'J6F7Rr7O15jqeKss' \
    --includeSubCategoryItem  \
    --itemName 'Qpme6eyM48tE7eJR' \
    --itemStatus 'INACTIVE' \
    --itemType 'LOOTBOX' \
    --limit '55' \
    --offset '81' \
    --region 'OIBarB7kcer5SvPL' \
    --sectionExclusive  \
    --sortBy 'name:asc,displayOrder:asc' \
    --storeId 'ZIpKFXgnsxx3c2bU' \
    --tags 'sO7FP8RmOstZAGDg' \
    --targetNamespace 'iVsV2OttwJaMxPDI' \
    > test.out 2>&1
eval_tap $? 394 'QueryItems1' test.out

#- 395 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J5hFQHumFvPKqupH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 395 'ImportStore1' test.out

#- 396 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'j72TlLs964iABOgT' \
    --body '{"itemIds": ["KtnaA7O35Iaytd9C", "sAMTZC37xPXxnfgg", "nZ3EZp6wSAufwYir"]}' \
    > test.out 2>&1
eval_tap $? 396 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE