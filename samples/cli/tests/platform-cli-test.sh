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
echo "1..397"

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
    --body '{"context": {"item": {"appId": "EAxcVpFrttufHIRd", "appType": "SOFTWARE", "baseAppId": "9UzVRiXbqlAw7r6W", "boothName": "2ktQG0h5JAav5kRa", "boundItemIds": ["ZLCXLx8bbgorQeFb", "Q1g7qbPngUNB1vRo", "62WopBJHPtcDs8bB"], "categoryPath": "dwpzS6DaDpv8N7ZQ", "clazz": "VqGj6oDLjWjkY1aX", "createdAt": "1977-05-08T00:00:00Z", "description": "FcDtgOjchIua5tWE", "displayOrder": 71, "entitlementType": "DURABLE", "ext": {"JSDgY1TXp38zsCTC": {}, "rbCbPOyNQkT7NvyE": {}, "3cwyALczNIicXm7a": {}}, "features": ["c8OumKtPDKJDXn7Z", "gSrjJW2OQNOs1PXh", "T5FvdiRilZ7oFgx4"], "fresh": false, "images": [{"as": "68su8XfqlqNiTvB6", "caption": "SdAdIhUDrwoZ5Mec", "height": 7, "imageUrl": "pc1C8XfwHuKeb9l3", "smallImageUrl": "rGN9A3sNm84hddSp", "width": 69}, {"as": "cBdW19m4eu6d5tA5", "caption": "jUmiTqpyhPFdxLzF", "height": 87, "imageUrl": "d8lDR6qVNPRZYdFL", "smallImageUrl": "IAjGGJddVCvu9vx5", "width": 76}, {"as": "vkLGMS0lyuI9a2I9", "caption": "u6Vpbsx5w8hqUI06", "height": 96, "imageUrl": "SuB0y5WUlrMdI4sN", "smallImageUrl": "veabntBSxTeIv53H", "width": 66}], "itemId": "YupD391C2qtPYoka", "itemIds": ["hFjkQsfCaTmt1d67", "FXGk2s9Q0mPVo3tw", "u0MesTCf9x4rt69l"], "itemQty": {"na7qxNeIxPz6MbwL": 67, "IY69z1UaLqYSYWyt": 77, "XQ0yYoNRKd3IL5TA": 87}, "itemType": "CODE", "language": "6iiPlSC2uE4o5Vwd", "listable": false, "localExt": {"m3MqHcUmLZZbSqb8": {}, "RwNmn9HrNQy4uZAA": {}, "iE0mit9RGCCHYzUO": {}}, "longDescription": "cEdscKHPEqgA8yu7", "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 94, "duration": 22, "endDate": "1994-05-19T00:00:00Z", "itemId": "Jt4Ymos9Jcdos4fY", "itemSku": "cTVU6RBt0zYoMcHy", "itemType": "CUEXlAvxJMdalwSy"}, {"count": 23, "duration": 85, "endDate": "1975-11-14T00:00:00Z", "itemId": "bOItRMvqtlB2jJCS", "itemSku": "QT279ZZPYGu0rdlg", "itemType": "dWyOtXi3choQrpOs"}, {"count": 61, "duration": 25, "endDate": "1985-08-26T00:00:00Z", "itemId": "U5SepjChB3V0v52D", "itemSku": "lym6puQ23xoJ8aeC", "itemType": "naLpUKp44YUDjasW"}], "name": "IPUvmEejtGeoyIPa", "odds": 0.9714507862859705, "type": "REWARD", "weight": 90}, {"lootBoxItems": [{"count": 7, "duration": 37, "endDate": "1977-06-26T00:00:00Z", "itemId": "ykmoPYgc2L4jk4Lo", "itemSku": "0LSP0pf4IxjUkl53", "itemType": "5X3ateEKDpADz1x3"}, {"count": 32, "duration": 30, "endDate": "1985-08-29T00:00:00Z", "itemId": "9xv32e8c5csSovoq", "itemSku": "sZNBdte9NDUPVJf6", "itemType": "c2Z0QZxfgPubTDIH"}, {"count": 36, "duration": 83, "endDate": "1982-11-17T00:00:00Z", "itemId": "qAThuwjRHpKKTlmV", "itemSku": "r9XuoJbRFQSKVPHb", "itemType": "n4Xxtu7LQRENjEEz"}], "name": "tx1WsYSiZqan0nSB", "odds": 0.5728983498865392, "type": "REWARD", "weight": 30}, {"lootBoxItems": [{"count": 0, "duration": 57, "endDate": "1981-10-04T00:00:00Z", "itemId": "91GXlvPG6bFYReVH", "itemSku": "QipcCx9Zw5D2L7vI", "itemType": "YhGGSyEW4ZJJ42d3"}, {"count": 85, "duration": 25, "endDate": "1985-03-04T00:00:00Z", "itemId": "ddN8S48l9lyNApfl", "itemSku": "xqMrj3oZk03QXcKM", "itemType": "DYDDxHSZjtqXyJ58"}, {"count": 10, "duration": 36, "endDate": "1977-09-29T00:00:00Z", "itemId": "jX9fDmIbeZxzfTcy", "itemSku": "iuATus9hsfpFDcSD", "itemType": "G8aMVGLiBNrDjqox"}], "name": "cwgGLXpUL4pp2ncY", "odds": 0.422365902819149, "type": "REWARD_GROUP", "weight": 21}], "rollFunction": "CUSTOM"}, "maxCount": 39, "maxCountPerUser": 82, "name": "fIovmv9gsR5cJcHm", "namespace": "3SZLxoRDFuuuySj2", "optionBoxConfig": {"boxItems": [{"count": 56, "duration": 1, "endDate": "1975-06-17T00:00:00Z", "itemId": "LJE8HoRS1X2PFAAM", "itemSku": "wzHPxB1UskYs4Yw2", "itemType": "0DOqOBSC2DKHRuPM"}, {"count": 80, "duration": 22, "endDate": "1995-02-07T00:00:00Z", "itemId": "H8Yb33T5UBJCjfcn", "itemSku": "LRfxeCSz9WEi8Kll", "itemType": "oeH0JT1yduat2vQR"}, {"count": 3, "duration": 66, "endDate": "1975-02-16T00:00:00Z", "itemId": "Bfsu4jmsRE2w1yEk", "itemSku": "Lgh3tIYt4SqYUTLD", "itemType": "x9gIiDandpGT2t24"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 83, "comparison": "isLessThan", "name": "Mh5eC3IHeHSKLCa3", "predicateType": "SeasonPassPredicate", "value": "AE7WIsfmx40NLRc6", "values": ["oKFeIaFQCYoDPICp", "m8heKnWhzfe2Nube", "nduEEQlULdJz4mnR"]}, {"anyOf": 56, "comparison": "is", "name": "CAcf80zfFyabWAgI", "predicateType": "SeasonTierPredicate", "value": "hRkloqxM3gpwxcfM", "values": ["Wn3CO39PXDNxtXge", "y9XzjjI5YbsKoADk", "zJEN2VHzih3bit0V"]}, {"anyOf": 83, "comparison": "isLessThanOrEqual", "name": "3FgkXhjDzaQY3snn", "predicateType": "EntitlementPredicate", "value": "ZkP7cFdP43e5dC9X", "values": ["MzF4TxodenSrUTvf", "qU0bfoMm5cTtFWbo", "IBudfZgrbHDIDm4h"]}]}, {"operator": "or", "predicates": [{"anyOf": 4, "comparison": "isLessThanOrEqual", "name": "6IjGa23YvYmmDg7V", "predicateType": "SeasonPassPredicate", "value": "PXIuvUYTZBRujIUE", "values": ["urjh2imdb4rbkXj0", "1Tq5jyAZvkRCMNFI", "ZwsVC0gL97ZVJSPq"]}, {"anyOf": 74, "comparison": "isNot", "name": "iwv1qlYB1RSKs6gQ", "predicateType": "SeasonPassPredicate", "value": "ZGF7uYnGzpipNDig", "values": ["D9eOziYRFOn0jJLH", "4nmwAft4gqkNNlWk", "NJma1MbqqZtfNWql"]}, {"anyOf": 58, "comparison": "isNot", "name": "LxhvNXTwGBCtohLt", "predicateType": "EntitlementPredicate", "value": "7MUBG7qtPu64yAtU", "values": ["RKLRkb738HGS6rDg", "MdIIlhS1fSiM9331", "m7Ta1PsKc50Kv6ec"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isNot", "name": "mQoIXimBJehyxlNs", "predicateType": "EntitlementPredicate", "value": "nGBt4P7WnbdSJtjX", "values": ["dpCROYqUiGKXVFCm", "UTrDzZSKscfOcYu3", "7ZshZyZl5x4bRXBH"]}, {"anyOf": 31, "comparison": "isGreaterThan", "name": "ogaKt2ujQSa3Zdb6", "predicateType": "SeasonTierPredicate", "value": "UXmy0Zp6iIaTIKUk", "values": ["1fiP80G9Pclxcft2", "mkk9QM0NBMA9ORxp", "zwLR2AK6eXUGPJsw"]}, {"anyOf": 42, "comparison": "is", "name": "DpZxkrQDXuNFviMa", "predicateType": "SeasonPassPredicate", "value": "uGKHhMRWLVd3DlhL", "values": ["Mrok0WvGYYnx4V70", "X2tJoARtdbBe7uds", "uIpomM8sm1MiaI1m"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 49, "fixedTrialCycles": 9, "graceDays": 2}, "region": "ue9nzJ6fH24T805t", "regionData": [{"currencyCode": "Vg8JqU0jZpjvsugA", "currencyNamespace": "OS7u8RiWyerCSa8S", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1997-06-30T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-01-29T00:00:00Z", "discountedPrice": 55, "expireAt": "1979-03-16T00:00:00Z", "price": 36, "purchaseAt": "1998-10-10T00:00:00Z", "trialPrice": 16}, {"currencyCode": "xsB0NRsB1fPqqRRu", "currencyNamespace": "lpqpymDkQhtrHWwR", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1995-08-07T00:00:00Z", "discountedPrice": 56, "expireAt": "1991-10-31T00:00:00Z", "price": 33, "purchaseAt": "1983-12-03T00:00:00Z", "trialPrice": 68}, {"currencyCode": "wbhMssAHjapIkY9R", "currencyNamespace": "f4wP57dBZNR88YbC", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1977-01-29T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1992-07-15T00:00:00Z", "discountedPrice": 82, "expireAt": "1977-11-12T00:00:00Z", "price": 10, "purchaseAt": "1984-07-26T00:00:00Z", "trialPrice": 4}], "saleConfig": {"currencyCode": "VrjfGXZnqAQUoY1G", "price": 20}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "Zp50CnPb71ORYcmQ", "stackable": false, "status": "INACTIVE", "tags": ["g4iY9u02aCNYIWek", "aKQDOJvrTefglSs6", "U5JX8ccLjMXJRk0e"], "targetCurrencyCode": "p18lOC3mNqF7Bl0L", "targetItemId": "cghVHfPEspxwhRON", "targetNamespace": "0bc1eMbEIjowLqc3", "thumbnailUrl": "ecjXJbZDKKoxLE1Y", "title": "3Dymtj3giPg4x4yi", "updatedAt": "1992-03-11T00:00:00Z", "useCount": 1}, "namespace": "6ues1Hhhkg1yLVbL", "order": {"currency": {"currencyCode": "FzHEP8cM4NTwr0KH", "currencySymbol": "aAsmTej52WKi6tAr", "currencyType": "VIRTUAL", "decimals": 46, "namespace": "URt9plCSVq8PdH6h"}, "ext": {"JPUAc0RVwXgAgntL": {}, "MCuaXBWQi6BqPg4x": {}, "r0lCancUZGCHsZYo": {}}, "free": false}, "source": "DLC"}, "script": "R1KtOv7Zy0b65uvu", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'Nuy0ytZQ7M6Nzy1a' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'dnSKOLFKx1dX4LuW' \
    --body '{"grantDays": "Ju3pDMUAeeZ97SBR"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'OPYuG6XqP6oo7G73' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'zdxTgOfnwIdlNa29' \
    --body '{"grantDays": "fDLh741IslKHzGlL"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "KWUtDQs61OQAoxyy", "dryRun": false, "fulfillmentUrl": "vWtND2tcBFpX8lNt", "itemType": "OPTIONBOX", "purchaseConditionUrl": "Cf2XJVrlzqQls1oz"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'hLVA3kE8jKvgatOE' \
    --itemType 'MEDIA' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'OXudXgNne8kJATwl' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'c6esUp6Sw1I98jeZ' \
    --body '{"clazz": "Q7hfxnhLd3Knakno", "dryRun": false, "fulfillmentUrl": "glU6muswVJnNnN7k", "purchaseConditionUrl": "Aa7j0riFc5HTHQIo"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'VsGo7dwV9DBqFKHQ' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --name 'iPKDUVSC00PYeDca' \
    --offset '12' \
    --tag 'D4IEiH9Z5qXn3aoR' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tlqOECohViHA5Czg", "items": [{"extraSubscriptionDays": 64, "itemId": "UvpZaHCuESOiIZsM", "itemName": "fB4ZH3mtgWgU4pCA", "quantity": 76}, {"extraSubscriptionDays": 71, "itemId": "xeE70CaunQNxot37", "itemName": "1W9G4AvQkqsGnmyo", "quantity": 38}, {"extraSubscriptionDays": 73, "itemId": "MWPAxUMkawaGpAyr", "itemName": "IwMif3BOdkocVTd4", "quantity": 56}], "maxRedeemCountPerCampaignPerUser": 31, "maxRedeemCountPerCode": 48, "maxRedeemCountPerCodePerUser": 77, "maxSaleCount": 34, "name": "m7FhJBNXzAFdO0Kh", "redeemEnd": "1979-06-24T00:00:00Z", "redeemStart": "1973-05-20T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["nUVLWu8olKdxL6oz", "RmDD0jJvlfV5OemP", "YdYT7DROCjtuzFMb"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'IllKlpO2pqiXJF3W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'GRaoQomSJC4DdrKF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "7SUQPLG59e0k5ZtX", "items": [{"extraSubscriptionDays": 37, "itemId": "wK7PpUlcIW32iK7M", "itemName": "Gt1ixY5rA1WoVeJI", "quantity": 10}, {"extraSubscriptionDays": 39, "itemId": "PF8ZrQzP4zvtdxdb", "itemName": "ZUpd6FJtHJ1pyVwy", "quantity": 76}, {"extraSubscriptionDays": 39, "itemId": "QLY6FEO65Rb3z7CY", "itemName": "LM8IlsHqffnrfsGl", "quantity": 11}], "maxRedeemCountPerCampaignPerUser": 85, "maxRedeemCountPerCode": 67, "maxRedeemCountPerCodePerUser": 1, "maxSaleCount": 14, "name": "KBwa3Ddb60ufPpzw", "redeemEnd": "1975-05-26T00:00:00Z", "redeemStart": "1998-12-07T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["mlVf4jvapseE9LN9", "bvhOrHflIOd6X3vi", "LvtEk4mTIpUA9gxo"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '8SV38nEhoXmM2W7l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '6jHMA2rG3nakopAy' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'welu01nryEJ0NqoT' \
    --body '{"categoryPath": "ow0qiOiC4j0iktm0", "localizationDisplayNames": {"ZPLkLOsp0LZ5njN8": "6Hl8kUXzt6bSc6bW", "vgpVyW9dD1kOmvrA": "ejcq2LgkQuaS7RBx", "3vim02jBOxrZDyvp": "cLYOWA8NjxOnaEok"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '4nOOCzfsflhjbngJ' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'OUn18G5MlfDTk8aG' \
    --namespace "$AB_NAMESPACE" \
    --storeId '40NlncceIZSwgAIk' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'gzh4pTU0Am4DZhl0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bQxFJ3sWCqQpQ2Fb' \
    --body '{"localizationDisplayNames": {"KPFMycMSQ4qfAacR": "0LgB5BUXvjcu2s6w", "3VifnKqmTSoGH1XE": "fY6QAYn6WQ5UBEU1", "QAOHfZiGhxOdcuDX": "SxSc3aZPV87pna08"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'gxefTYKhuxaEc7M4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'P7UckSC6ePeN8i4G' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'rFES9z7xueHpATHc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cee9GXhKcjmSEwdr' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'kEnnqKzFsLfYalUl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fwEQKjU7eHGebSVu' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '0LQ40kepEaC4dfiO' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '79' \
    --code 'QAg5mPYhrLTyU8Oh' \
    --limit '14' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'fY9JQYGF4bYXEcEN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 47}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'QQewVLMUoAnaRcYp' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '45' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'FUjfIGaffoflEIBy' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '38' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'qeKN0meGelYF5wWa' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '60' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'alncV7vWgSHdfo07' \
    --namespace "$AB_NAMESPACE" \
    --code 'UctPErqxyMyOK06M' \
    --limit '34' \
    --offset '62' \
    --userId 'QBErxgjVBycvU4Pb' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'mRDcrg0DjQjBECXv' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'ea7H1m2lJFRZ3Zpr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'Z60zMjhTHeh94TSe' \
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
    --body '{"grpcServerAddress": "nE5hCFkIf5weqZ18"}' \
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
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 39 'ListCurrencies' test.out

#- 40 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "7l2Zsrh90ETtYmGu", "currencySymbol": "kz3MnlrjcHp6B8Vj", "currencyType": "VIRTUAL", "decimals": 36, "localizationDescriptions": {"Prx9Ns8eLzYEvwSW": "TaLQjctvrK2jhsYp", "KPlXn77AtYoFzLAA": "TPY8P8P3cfoivvQx", "evecWw7Rry0KK5rg": "AGO0dW8rX2MVUGKS"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'Z4GcLkt4pK32sJxl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"ZcCTpTdRtCHvuk6B": "6XTmSLyn50sigBVZ", "xiKdV57GvRyd9UuL": "02Le8HSCslsDd4M1", "F5qRIblS7Nz81GRa": "zPAANjfBoldFOyqA"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '2clJ5gEOaCgM6Yn6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'RugbNEIpGBFUjOn5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'mM7k8nbLzvtCIW5y' \
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
    --body '{"data": [{"id": "nMKquUicAeIVXtoW", "rewards": [{"currency": {"currencyCode": "AXhMlW4tLqX7OICf", "namespace": "5oD1e6oI9FmYel0k"}, "item": {"itemId": "Ow72o8Zkgk0jS6rD", "itemSku": "WUwfhKvrf2AaH4yC", "itemType": "WrHSppnIZkNnTn3r"}, "quantity": 53, "type": "CURRENCY"}, {"currency": {"currencyCode": "H5NvAtcvNedgS1fU", "namespace": "fKmihDbmu8ePWlQM"}, "item": {"itemId": "VDXEHeiGTnwyEw6h", "itemSku": "IWDZrpP7rz3ISW51", "itemType": "0kHr4isTKWjmv67n"}, "quantity": 42, "type": "CURRENCY"}, {"currency": {"currencyCode": "CXWfwnwGioVwVzmm", "namespace": "BVVFfpqx1AeLtzcP"}, "item": {"itemId": "J3jtDYBo4FUTH7CG", "itemSku": "fKSyxgRR1DiCqSMz", "itemType": "pqIFGLkDs7ACC1Rg"}, "quantity": 57, "type": "ITEM"}]}, {"id": "foNrHlFi2qJLgmBL", "rewards": [{"currency": {"currencyCode": "E35YhyiDV90SeI5y", "namespace": "ppBHoytVznCgNyx9"}, "item": {"itemId": "fbT63ShEh8PbGikL", "itemSku": "jgjcj34uulU6FYBZ", "itemType": "sWFbr3RSP0W9nBhv"}, "quantity": 15, "type": "CURRENCY"}, {"currency": {"currencyCode": "f8Q0DtJMcYQdN66b", "namespace": "swAgt65X4N1LQZmB"}, "item": {"itemId": "61JMdtwCVUrYQue8", "itemSku": "4dwmbwFEnAZaWsQJ", "itemType": "tRYoagRJK5PX9UcO"}, "quantity": 44, "type": "CURRENCY"}, {"currency": {"currencyCode": "T95XhnUcvWB28Mpu", "namespace": "suhhDJ5slzgiWZEt"}, "item": {"itemId": "yd56LfxnbY97jjYg", "itemSku": "XchCbkXX26uEdCfQ", "itemType": "aMAQuTKfC0I2kNjC"}, "quantity": 79, "type": "ITEM"}]}, {"id": "Lds2DbPcaoMdtRLT", "rewards": [{"currency": {"currencyCode": "mSvTkQQgB7exYvmH", "namespace": "Mxr5hPCJJztJBg0t"}, "item": {"itemId": "TJg46IewOXE2AkCh", "itemSku": "3QIZsUf8lGFXcmwT", "itemType": "ERHclOdxIwqejxe1"}, "quantity": 12, "type": "ITEM"}, {"currency": {"currencyCode": "KLqs2nEZhpByfHZi", "namespace": "nxNfgPAwkMBsznlB"}, "item": {"itemId": "UqnLT4AbGptKaWNv", "itemSku": "Pbpg7yrRvXfZ6rvg", "itemType": "vEY3Hht1SwqTsKKK"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "7NHDOQe91Ps3ztUI", "namespace": "V0dS6hIH9c4Vfkyr"}, "item": {"itemId": "wpuXxbaERbfgPmi0", "itemSku": "eHkt1mr9EOIFg0dn", "itemType": "WIYN2NVL70Iw157g"}, "quantity": 21, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"r9b8MuYmmeKTmBNv": "GYxEQdf3ewoGGoY7", "xmFNAmjDDCvs78mc": "MdiS76YApGJ9ufwL", "YkqIgLuZS6hsQryi": "EtOAbpeUNf26UqkC"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"LXgmRasvjO4lj8m3": "XEwP2b4gd3xOeii8", "Jnmssep2xD2NY0kA": "BeGs9yxahld1pO0G", "yf5PO3COyMvczgEp": "zZ3FbtxfhcRC7IVY"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"BsaIecRxIsZvD6rm": "zVr5XT1Nxw0v1dMQ", "9Rrbk6C2cVWf6ttv": "bU1PO6ApCD2VXidT", "7w0Oc15N8WXBPp17": "PAewqSm5x3B4t7WQ"}}]}' \
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
    --entitlementName 'EjRwEQlNapJRfk4f' \
    --itemId '9Zcw1pEHAyNFxcVT,KuAQTGh5BxjWOozG,oDtsUuYo5p8ED5QZ' \
    --limit '54' \
    --offset '5' \
    --userId 'ufwNa8lzfjv9oYMX' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'MjlVHY1AHwF3vGoa,v7MK0PcLnEkcokKw,cQ0baDT9OyJ2h23G' \
    --limit '95' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 52 'QueryEntitlements1' test.out

#- 53 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1979-04-06T00:00:00Z", "grantedCode": "amU7syGlElXdEAOr", "itemId": "VSnLocLVVYamQc4w", "itemNamespace": "cG5nDBLJoJHbiQ5d", "language": "ufj-QFjT", "quantity": 63, "region": "CzkguwuJCW7EEFB6", "source": "REFERRAL_BONUS", "startDate": "1984-03-31T00:00:00Z", "storeId": "ODbi9BzupBsFpYc7"}, {"endDate": "1972-09-23T00:00:00Z", "grantedCode": "44mEh9tRk8knYSV3", "itemId": "0lnroQehMDli6t9u", "itemNamespace": "nQLYXxm09wpGAbpE", "language": "Ke_VS", "quantity": 63, "region": "G0q0Q2Qd2JzRbkF2", "source": "REWARD", "startDate": "1999-08-15T00:00:00Z", "storeId": "dIjvBbA6bfbYaJCJ"}, {"endDate": "1975-02-15T00:00:00Z", "grantedCode": "5br34rBBN9tU6TDm", "itemId": "5GloFSKWM1eym5yd", "itemNamespace": "C6p25xCWTqUOYZEN", "language": "lnsi-hrsz-677", "quantity": 77, "region": "JEECQE1li3Bg7Jxc", "source": "REWARD", "startDate": "1979-07-26T00:00:00Z", "storeId": "UnZmvhidwCkZwqjY"}], "userIds": ["LfTiCO1NDBvQvRPn", "Az4VzW0CpoBCbyJs", "F5IjF1c0W338HS6C"]}' \
    > test.out 2>&1
eval_tap $? 53 'GrantEntitlements' test.out

#- 54 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["BgVRyihYNZ84CVhz", "iXV8HwSmvcvcDKF1", "9yVRafCjOuSYht83"]' \
    > test.out 2>&1
eval_tap $? 54 'RevokeEntitlements' test.out

#- 55 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'AdvBaagTiRJ8daGT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetEntitlement' test.out

#- 56 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '98' \
    --status 'SUCCESS' \
    --userId 'uFpZum7izxe7NPzj' \
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
    --body '{"bundleId": "Oa8E7wY76PxLv9HB", "password": "EUe89AwEw1HO4FnK"}' \
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
    --body '{"sandboxId": "tx4XLKAmlDr19uJ3"}' \
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
    --body '{"applicationName": "nq6VerzVCcI8y3Cz", "serviceAccountId": "0YqCKUh5RD9vNAp4"}' \
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
    --body '{"data": [{"itemIdentity": "jinFpnQ5xF9wwbvM", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"u11A3HTovFi4tPAG": "fleyCA6jEtcqsnzo", "VILjkwW61duF87aU": "yrdt4XSpWBAetsan", "zqP8oxfrtbECD1CY": "PwaiBAxfYL8Avt70"}}, {"itemIdentity": "ZUT2fSk3LL0calqx", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"LB9QmJIOq9dP5szG": "71utjsQ4CrRb9gUC", "eVz7fWbZIdhevfZv": "yV7AcodcZwKjYDdm", "JOlzwm9Su4FnS98Q": "qftSjq7sn8yreciP"}}, {"itemIdentity": "LfkVyyJsbGpO6Jge", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"4nGmWGgTJfHlJl4t": "HGa4XfZcd9CVnGqM", "X9FieeEssWEUl07b": "hwntCVqiYOJf5KwM", "ZQjzvjSozv6CTRDl": "0zp9CzHFwinkBNi4"}}]}' \
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
    --body '{"environment": "gvqgl6TZ9TGVPmv3"}' \
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
    --body '{"appId": "4h6T7EsufmfxKYB4", "publisherAuthenticationKey": "LM6H6QXmpZ9X3fUS"}' \
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
    --body '{"clientId": "R1l9xLPBsmAUrD9L", "clientSecret": "1IiD6MlcEPhMDFzj", "organizationId": "HZ3sIhzOx2CXKlvI"}' \
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
    --body '{"relyingPartyCert": "omU3pIxM9n8D2eLM"}' \
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
    --password 'e3lt9qfx2UDcgVE7' \
    > test.out 2>&1
eval_tap $? 82 'UpdateXblBPCertFile' test.out

#- 83 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'L9FK6e0MrPc4vtxk' \
    --itemId '9hVKlG56HlzGr7Xj' \
    --itemType 'APP' \
    --endTime 'rztee7QLTGAak7Ka' \
    --startTime 'ol01DK97D2xnik42' \
    > test.out 2>&1
eval_tap $? 83 'DownloadInvoiceDetails' test.out

#- 84 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'miteR5eQAe1rzmmg' \
    --itemId 'qBPRmd6mO4oI8KDq' \
    --itemType 'BUNDLE' \
    --endTime 'yEYWNGMy2pgSGSUO' \
    --startTime 'K68eqGJtWf1Ybgg8' \
    > test.out 2>&1
eval_tap $? 84 'GenerateInvoiceSummary' test.out

#- 85 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rdwY9bmrvHmO07KN' \
    --body '{"categoryPath": "qX9LM2IwEsdOGBXB", "targetItemId": "wnzDX8v3xgC1Ge9P", "targetNamespace": "dbTTAJ2Gp1r0sVZ6"}' \
    > test.out 2>&1
eval_tap $? 85 'SyncInGameItem' test.out

#- 86 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LJAOddIL2l3hPjND' \
    --body '{"appId": "Kv2LWfXqjr8fS79E", "appType": "DLC", "baseAppId": "18T1IxVWCxdvPL9e", "boothName": "4P01vxP8xj1LyEir", "categoryPath": "URERnEMzpImW6sjA", "clazz": "HyCK5tNanGBrkzUv", "displayOrder": 5, "entitlementType": "CONSUMABLE", "ext": {"ITGPRQBCgIs1Q2lz": {}, "xl0yF5m77TTh4gUo": {}, "j8u2WRcLiEtzVlnk": {}}, "features": ["flfn7pHY48F1dl1q", "AsR65yQ9ssuHdGmx", "92m3iRlfnBAk0Cwi"], "images": [{"as": "ncCEr0KcgeqzGbru", "caption": "NB72HHMkjzyBB4UF", "height": 75, "imageUrl": "I6MAugK5kypNrp2n", "smallImageUrl": "Fe9FmN86sK5LOq4f", "width": 40}, {"as": "APnNlsa2bRBr27fV", "caption": "MWuAfDqLMR919IZP", "height": 75, "imageUrl": "CsodJrhQW41q2Osp", "smallImageUrl": "CZbt3Uta5I0uGcL1", "width": 21}, {"as": "phgMweexsIAP5vHL", "caption": "jBJ9iqMcBL4BzhDU", "height": 18, "imageUrl": "OxNInDByhnoluO6t", "smallImageUrl": "i0QP2ssiJ66OzOj8", "width": 9}], "itemIds": ["O6tgohjtC7bzjPpu", "cddXJ5zifF8y959a", "nrNSleywHbHig6IK"], "itemQty": {"WVZ77KeRWdECaFGz": 11, "kcR6c2E2r3vk3IfA": 75, "SzUo4hNBDh9ZFP1O": 100}, "itemType": "BUNDLE", "listable": true, "localizations": {"nXOErQPS4VsRoYIK": {"description": "69yg9ADCGiXaLs2x", "localExt": {"jHkinOD975nARHCm": {}, "hNHSXuqIHsxvaUoX": {}, "DmwWsukxncuD3QxC": {}}, "longDescription": "XMd00YBWCaVVmM45", "title": "mfIZsWhkS476dGGJ"}, "wJ00UH197MJ6zU7J": {"description": "LMQyMWzYQCAaPJgo", "localExt": {"xGJoJaSzUtY4ZD0X": {}, "tb0U4pH16NUsVY21": {}, "NVIs7NRen2Y3Ns0Q": {}}, "longDescription": "JQeaWytPfds1BYx0", "title": "EaURydf8ZyyZeHAW"}, "GgJUbUJRMbkcTglb": {"description": "U86FyOjApNHBVfNO", "localExt": {"URcjY3YYT9oTynmf": {}, "IuBWgJTNFfM8M0IW": {}, "4oe8KDgy0xZfAcNg": {}}, "longDescription": "14Ws8TIP1LKiFQoL", "title": "DvumfqrgSfnx2h61"}}, "lootBoxConfig": {"rewardCount": 82, "rewards": [{"lootBoxItems": [{"count": 70, "duration": 7, "endDate": "1980-11-20T00:00:00Z", "itemId": "Q3PuppUxDSK8aOTG", "itemSku": "MudcxlCV4cNbJGQ5", "itemType": "7lPdinpjS2DRfGt9"}, {"count": 66, "duration": 79, "endDate": "1976-01-20T00:00:00Z", "itemId": "yZVQ4X67tPZSTpPq", "itemSku": "3xjrElvvDgw0ag7k", "itemType": "SWE0Hiqm5IuLryiE"}, {"count": 61, "duration": 35, "endDate": "1994-06-25T00:00:00Z", "itemId": "8p4n4XCFkD1AJLCw", "itemSku": "szbZxuHSgDOK8bjo", "itemType": "F7bL2635KbtZTGJp"}], "name": "qgl2IzNXGTuQPIDp", "odds": 0.23145627386110124, "type": "REWARD", "weight": 43}, {"lootBoxItems": [{"count": 39, "duration": 59, "endDate": "1971-04-15T00:00:00Z", "itemId": "JLNNz6QIVC9Mfuc8", "itemSku": "VOsnmnlVljdWYmEL", "itemType": "e74p38vumnxAnYBT"}, {"count": 47, "duration": 69, "endDate": "1971-11-29T00:00:00Z", "itemId": "TIz0jcgDI8Pkz96v", "itemSku": "d80msqIm5bufnBqr", "itemType": "pLeqhwVhjnnjKMEm"}, {"count": 40, "duration": 10, "endDate": "1971-11-03T00:00:00Z", "itemId": "iWsAQHbMrKYi0Zxs", "itemSku": "5SWCqZXHLLa31oQf", "itemType": "7BULnZDhutDM6Bqg"}], "name": "uqD5xxGxBWtnTKUe", "odds": 0.8814334920984954, "type": "REWARD", "weight": 67}, {"lootBoxItems": [{"count": 27, "duration": 88, "endDate": "1980-06-09T00:00:00Z", "itemId": "qPzPkwCBo2SwCUsT", "itemSku": "ag4MLAo3m61P2xaN", "itemType": "fmn8Onb1a9gMz0F2"}, {"count": 95, "duration": 40, "endDate": "1985-08-06T00:00:00Z", "itemId": "RmMhAbUWmFhdYLWz", "itemSku": "Muv3zkUY0n0BAZkw", "itemType": "bYkBLyO6A0Fqfhna"}, {"count": 57, "duration": 69, "endDate": "1999-09-20T00:00:00Z", "itemId": "xKNdOTacCcJfIfXs", "itemSku": "huLUk5WdpxjZx5no", "itemType": "XPhPUTKbonoucNmz"}], "name": "wOZOK56sDkci5rZ8", "odds": 0.1324343054926651, "type": "REWARD_GROUP", "weight": 72}], "rollFunction": "CUSTOM"}, "maxCount": 8, "maxCountPerUser": 83, "name": "lt7rjF5RaJwvkWVc", "optionBoxConfig": {"boxItems": [{"count": 30, "duration": 35, "endDate": "1999-10-30T00:00:00Z", "itemId": "b1XTB9YQzUJ9XlYJ", "itemSku": "8BzP6EUmUXGM5anI", "itemType": "loyj9lhbvuQdW2jw"}, {"count": 75, "duration": 64, "endDate": "1995-01-16T00:00:00Z", "itemId": "JKZFNk2NKy59X8iO", "itemSku": "g2sVBiCoeC5weXJl", "itemType": "7PeiMH8z8dVej8N2"}, {"count": 49, "duration": 32, "endDate": "1982-10-25T00:00:00Z", "itemId": "VTnOK7xAvM7tuL81", "itemSku": "lsR7xxSVp3Gd2TK0", "itemType": "HzYviTgYmx82JVBR"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 91, "fixedTrialCycles": 71, "graceDays": 65}, "regionData": {"z8tne5dbguBF6Gsv": [{"currencyCode": "vdl8jHz9x7XZIjU4", "currencyNamespace": "IK9lOLaZaMphKCqT", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1999-03-15T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1972-10-29T00:00:00Z", "expireAt": "1975-11-25T00:00:00Z", "price": 10, "purchaseAt": "1990-10-14T00:00:00Z", "trialPrice": 13}, {"currencyCode": "joEEXBLIxGnNuhoJ", "currencyNamespace": "M3WWPvvCiCf33ViE", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1979-12-22T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1993-05-03T00:00:00Z", "expireAt": "1974-05-03T00:00:00Z", "price": 47, "purchaseAt": "1987-03-26T00:00:00Z", "trialPrice": 99}, {"currencyCode": "UWNizk5UcPAGv6c1", "currencyNamespace": "ESC6hZYTYZbzf5aA", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1996-05-28T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1974-03-29T00:00:00Z", "expireAt": "1985-02-24T00:00:00Z", "price": 55, "purchaseAt": "1993-10-24T00:00:00Z", "trialPrice": 48}], "ZNUHbIT9szApmWJO": [{"currencyCode": "5vzzXZj08a6K1XRV", "currencyNamespace": "friSpPFnZBJZkDnE", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1995-02-07T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1971-03-10T00:00:00Z", "expireAt": "1999-11-04T00:00:00Z", "price": 42, "purchaseAt": "1980-03-11T00:00:00Z", "trialPrice": 27}, {"currencyCode": "3lvozTt9TsH7A0Tu", "currencyNamespace": "U2aL4bPkk11sys6G", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1976-08-27T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-04-30T00:00:00Z", "expireAt": "1980-01-22T00:00:00Z", "price": 42, "purchaseAt": "1998-09-09T00:00:00Z", "trialPrice": 72}, {"currencyCode": "brTFznTgDIwZIRWf", "currencyNamespace": "6T3by2kYSCdnFKLc", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1972-01-16T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-05-17T00:00:00Z", "expireAt": "1976-03-19T00:00:00Z", "price": 7, "purchaseAt": "1993-01-15T00:00:00Z", "trialPrice": 6}], "EfU61OJYMnW49rWy": [{"currencyCode": "np1ck1vT90C6o86c", "currencyNamespace": "SRL9cgbUmulhe98o", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1989-10-28T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1977-09-07T00:00:00Z", "expireAt": "1992-03-05T00:00:00Z", "price": 64, "purchaseAt": "1972-07-02T00:00:00Z", "trialPrice": 8}, {"currencyCode": "9GYxjiiOQAD77ci0", "currencyNamespace": "vfWVZoRRMPi57HyK", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1985-04-16T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1983-10-12T00:00:00Z", "expireAt": "1989-06-13T00:00:00Z", "price": 51, "purchaseAt": "1977-07-20T00:00:00Z", "trialPrice": 74}, {"currencyCode": "v6gFZXI5nXJ7hLi6", "currencyNamespace": "HweweRmyo91dIn7Q", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1979-08-28T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1996-10-11T00:00:00Z", "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}]}, "saleConfig": {"currencyCode": "PAd9sxoLnWGP1Paf", "price": 70}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "ce0KbNN7Ycl2JfmQ", "stackable": false, "status": "ACTIVE", "tags": ["lvGjVQ4aebjfgGu4", "72oWJlfglLM4xjfk", "NL4lU6jaGfsD1cfs"], "targetCurrencyCode": "wmeFpvtDtetoQVFL", "targetNamespace": "8LNW11vtpaTxi7k4", "thumbnailUrl": "89jRCn48bvkCPfKo", "useCount": 11}' \
    > test.out 2>&1
eval_tap $? 86 'CreateItem' test.out

#- 87 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0Wj1WfzIvc3VlSXr' \
    --appId 'A3XUGud4tVjmxEf4' \
    > test.out 2>&1
eval_tap $? 87 'GetItemByAppId' test.out

#- 88 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'ak7ISDrBVg6NuDZv' \
    --baseAppId 'Pb1kuUfNfUDe4g7q' \
    --categoryPath '6PHEaqbzHvDDl1ji' \
    --features 'Lw3XMGBA6JXDpA1t' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --limit '4' \
    --offset '58' \
    --region '4xYiLjLyZrXr9Bht' \
    --sortBy 'updatedAt,createdAt,name:asc' \
    --storeId 'UwJnUpryDeRcpUvl' \
    --tags 'rw2MwC1uuokpaIjL' \
    --targetNamespace '0Vxe5n9Lx3QcFo9g' \
    > test.out 2>&1
eval_tap $? 88 'QueryItems' test.out

#- 89 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'xOgvDc7xMrRKvw8I,SP2WKmCRRXBxlalC,HtWlKxLpS8fLWoQ5' \
    > test.out 2>&1
eval_tap $? 89 'ListBasicItemsByFeatures' test.out

#- 90 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nuJhatQPxR7dvBVC' \
    --sku '5zgOKLTDmHe8c1eJ' \
    > test.out 2>&1
eval_tap $? 90 'GetItemBySku' test.out

#- 91 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '9sde7Ryt4udIv22M' \
    --populateBundle  \
    --region '18uux9xBomQFPFWy' \
    --storeId '5cwNPI6aFo0MVwDZ' \
    --sku 'CIXFNEL3uWVRz3V7' \
    > test.out 2>&1
eval_tap $? 91 'GetLocaleItemBySku' test.out

#- 92 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'YbJM3bNLWHAbCZix' \
    --sku 'e2cQ6O30lpzcBQMA' \
    > test.out 2>&1
eval_tap $? 92 'GetItemIdBySku' test.out

#- 93 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'EcNcJqrKxnMzSYoc,4ZjiMY4H34B6wVd8,ipcKDwQeUWtjCC2U' \
    --storeId 'H6jzMO3AfmOS5mQN' \
    > test.out 2>&1
eval_tap $? 93 'GetBulkItemIdBySkus' test.out

#- 94 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'yRPZFPNP56l1AT6O' \
    --region 'LKmZhCZxxPPdPwOt' \
    --storeId 'EuWBSO2jJepUnEEg' \
    --itemIds 'ja2mIE2kLTnJwc5X' \
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
    --userId 'mkCuL5W4tKt6G3j9' \
    --body '{"itemIds": ["LYdG7xVPqBqe9RDQ", "MBSYAFLqp8PF5hCc", "oukWpnbz4ys7j6lx"]}' \
    > test.out 2>&1
eval_tap $? 96 'ValidateItemPurchaseCondition' test.out

#- 97 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uU3u2HEG0qfKegvF' \
    --body '{"changes": [{"itemIdentities": ["TD1sPykS8YLmwtYg", "WGcA0h4G1LZ1HaX5", "UBMbsF44VTsLDRzd"], "itemIdentityType": "ITEM_SKU", "regionData": {"YX2YBF2g7TVtzYEH": [{"currencyCode": "Uodh3iUfBthbepUC", "currencyNamespace": "TWiZ1uqh7GAi4FEI", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1999-09-19T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1979-11-11T00:00:00Z", "discountedPrice": 45, "expireAt": "1997-11-02T00:00:00Z", "price": 90, "purchaseAt": "1983-05-01T00:00:00Z", "trialPrice": 41}, {"currencyCode": "lYqlpq03BGdIk4oE", "currencyNamespace": "ogFVGR71rJOBy6ls", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1984-10-03T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1982-09-21T00:00:00Z", "discountedPrice": 55, "expireAt": "1985-01-17T00:00:00Z", "price": 20, "purchaseAt": "1994-04-16T00:00:00Z", "trialPrice": 39}, {"currencyCode": "HmaAu4YK87DYAWWc", "currencyNamespace": "bcbGWmKgE8CZ4AEL", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1982-04-06T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1980-01-05T00:00:00Z", "discountedPrice": 57, "expireAt": "1971-04-08T00:00:00Z", "price": 66, "purchaseAt": "1981-12-16T00:00:00Z", "trialPrice": 73}], "P5Cj8hgFsqHC9h5J": [{"currencyCode": "PiMEtgKuiGTYgwWv", "currencyNamespace": "5XldL6rOVGcRAn51", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1995-01-08T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1984-12-17T00:00:00Z", "discountedPrice": 56, "expireAt": "1993-08-10T00:00:00Z", "price": 48, "purchaseAt": "1978-09-20T00:00:00Z", "trialPrice": 34}, {"currencyCode": "gJbQ3Fj1umx4Itzk", "currencyNamespace": "MJ7cudf4r916GPrh", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1998-10-06T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1992-06-01T00:00:00Z", "discountedPrice": 72, "expireAt": "1995-12-01T00:00:00Z", "price": 70, "purchaseAt": "1993-12-13T00:00:00Z", "trialPrice": 45}, {"currencyCode": "lJ80YJ41U4ooQ980", "currencyNamespace": "ywmg1pWpWit1QC7F", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1983-10-10T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1977-04-21T00:00:00Z", "discountedPrice": 54, "expireAt": "1988-07-02T00:00:00Z", "price": 95, "purchaseAt": "1976-04-01T00:00:00Z", "trialPrice": 93}], "mU1unGKM0tgfeWy4": [{"currencyCode": "7bbwMI4gGmvK9gW5", "currencyNamespace": "96FwBNrFXt3TAuKB", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1984-01-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1986-07-18T00:00:00Z", "discountedPrice": 93, "expireAt": "1998-05-28T00:00:00Z", "price": 0, "purchaseAt": "1974-02-10T00:00:00Z", "trialPrice": 41}, {"currencyCode": "6r3hHwya4NpdOzg3", "currencyNamespace": "hr6ucHf7dbh2iKNU", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1998-09-01T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1971-10-19T00:00:00Z", "discountedPrice": 97, "expireAt": "1979-08-31T00:00:00Z", "price": 52, "purchaseAt": "1982-04-24T00:00:00Z", "trialPrice": 57}, {"currencyCode": "KMRMG541PAiNjULs", "currencyNamespace": "x4SnKNXLMUaDSwwQ", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1991-10-14T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1988-10-17T00:00:00Z", "discountedPrice": 27, "expireAt": "1988-08-08T00:00:00Z", "price": 72, "purchaseAt": "1994-06-02T00:00:00Z", "trialPrice": 57}]}}, {"itemIdentities": ["gqzZv5kVu4S95mj8", "YRvae4f4lhBPbarb", "WEm8bVtZcfVCPdQh"], "itemIdentityType": "ITEM_ID", "regionData": {"YXJvtggDdXjbdjMB": [{"currencyCode": "ahFZZGMTcqnWrIpr", "currencyNamespace": "Ov0BJ9Sgl7H1sdH2", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1971-10-23T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1984-03-11T00:00:00Z", "discountedPrice": 8, "expireAt": "1984-10-08T00:00:00Z", "price": 57, "purchaseAt": "1992-12-15T00:00:00Z", "trialPrice": 15}, {"currencyCode": "5pu9PutLf6IrvZoB", "currencyNamespace": "GQbO4S3rURGWUzPA", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1996-10-13T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1998-02-07T00:00:00Z", "discountedPrice": 21, "expireAt": "1986-05-12T00:00:00Z", "price": 19, "purchaseAt": "1989-02-12T00:00:00Z", "trialPrice": 29}, {"currencyCode": "tRl9rZmtQUvro8TW", "currencyNamespace": "wXWsz9TVmdMKEohK", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1981-06-25T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1974-08-29T00:00:00Z", "discountedPrice": 61, "expireAt": "1998-12-12T00:00:00Z", "price": 94, "purchaseAt": "1973-11-10T00:00:00Z", "trialPrice": 57}], "Ot2DkUt3yexZBRvx": [{"currencyCode": "YnEBhXtAVxCd3meT", "currencyNamespace": "rT7cF9oVCh89wNOk", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1980-01-30T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1972-02-05T00:00:00Z", "discountedPrice": 47, "expireAt": "1976-01-19T00:00:00Z", "price": 91, "purchaseAt": "1990-02-22T00:00:00Z", "trialPrice": 47}, {"currencyCode": "kR3hCGNgaJmuALlM", "currencyNamespace": "Ql9RLrthbfp0Vgwe", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1978-11-20T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1980-02-29T00:00:00Z", "discountedPrice": 71, "expireAt": "1994-05-28T00:00:00Z", "price": 71, "purchaseAt": "1994-05-07T00:00:00Z", "trialPrice": 28}, {"currencyCode": "GcToWgFvdRhG9NwV", "currencyNamespace": "3zDuqVlVTypcYPK8", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1980-12-23T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1991-07-07T00:00:00Z", "discountedPrice": 34, "expireAt": "1996-11-29T00:00:00Z", "price": 22, "purchaseAt": "1998-10-12T00:00:00Z", "trialPrice": 9}], "bitNQLzwRoWnR0Ab": [{"currencyCode": "kCPY70FmvviVIBbc", "currencyNamespace": "ujF8Vk5qb8NhWWwa", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1983-10-29T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1994-01-19T00:00:00Z", "discountedPrice": 77, "expireAt": "1974-08-28T00:00:00Z", "price": 20, "purchaseAt": "1974-06-10T00:00:00Z", "trialPrice": 82}, {"currencyCode": "8l5IPSrwrJl7wYIV", "currencyNamespace": "w13NCo9yXlbQ52FT", "currencyType": "VIRTUAL", "discountAmount": 93, "discountExpireAt": "1985-08-20T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1988-10-29T00:00:00Z", "discountedPrice": 63, "expireAt": "1996-07-29T00:00:00Z", "price": 54, "purchaseAt": "1983-01-11T00:00:00Z", "trialPrice": 93}, {"currencyCode": "lkT8VGgSH8MGZGwi", "currencyNamespace": "Vj7eDTaka9ABfX1I", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1983-08-08T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1983-09-07T00:00:00Z", "discountedPrice": 8, "expireAt": "1991-03-20T00:00:00Z", "price": 42, "purchaseAt": "1977-12-11T00:00:00Z", "trialPrice": 27}]}}, {"itemIdentities": ["hGspRi3bhPQvBBJI", "5JxytpcubN4AUUPF", "PscZsXeJOD4DMtqf"], "itemIdentityType": "ITEM_SKU", "regionData": {"GiGJovgWSRxZ8N4U": [{"currencyCode": "Q2fg3V1o2x0hL5Du", "currencyNamespace": "BDqMyIAzWze94MEd", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1983-05-20T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1989-08-03T00:00:00Z", "discountedPrice": 23, "expireAt": "1981-04-03T00:00:00Z", "price": 32, "purchaseAt": "1989-07-30T00:00:00Z", "trialPrice": 20}, {"currencyCode": "TO8uXsqVpdiWo8Sj", "currencyNamespace": "DAM0Riw8wLYW3n4F", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1987-08-27T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1998-09-04T00:00:00Z", "discountedPrice": 100, "expireAt": "1986-02-18T00:00:00Z", "price": 45, "purchaseAt": "1989-08-09T00:00:00Z", "trialPrice": 32}, {"currencyCode": "Xw5uBYeQZOzATNSV", "currencyNamespace": "9E9yyNb7yaLXzAVY", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1977-08-16T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1976-06-15T00:00:00Z", "discountedPrice": 71, "expireAt": "1974-01-13T00:00:00Z", "price": 58, "purchaseAt": "1981-03-28T00:00:00Z", "trialPrice": 52}], "Zu4htrsf8eIFSovT": [{"currencyCode": "GXaMsq8ePN1oco2j", "currencyNamespace": "x8Upe8SjMvpqM8pu", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1974-08-15T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1996-09-04T00:00:00Z", "discountedPrice": 22, "expireAt": "1972-09-28T00:00:00Z", "price": 17, "purchaseAt": "1985-05-10T00:00:00Z", "trialPrice": 14}, {"currencyCode": "fW6rqGOQny4ij4ys", "currencyNamespace": "YPonb59gQffkNOmu", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1983-04-19T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1993-10-19T00:00:00Z", "discountedPrice": 96, "expireAt": "1979-12-15T00:00:00Z", "price": 36, "purchaseAt": "1979-09-08T00:00:00Z", "trialPrice": 89}, {"currencyCode": "AuJbpZSrcbc4LWfK", "currencyNamespace": "aY5c1tP5TDuI5f6m", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1993-08-19T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1998-06-07T00:00:00Z", "discountedPrice": 58, "expireAt": "1978-01-09T00:00:00Z", "price": 38, "purchaseAt": "1997-04-25T00:00:00Z", "trialPrice": 9}], "3K0COF74tz6aeXZO": [{"currencyCode": "YwbwjMNdxKWlBfnR", "currencyNamespace": "yFS0Ed7gTM5AVrtB", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1975-08-29T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1983-01-20T00:00:00Z", "discountedPrice": 82, "expireAt": "1991-04-16T00:00:00Z", "price": 69, "purchaseAt": "1997-08-25T00:00:00Z", "trialPrice": 1}, {"currencyCode": "PTUEDPN1Kb4UTPWD", "currencyNamespace": "XTSb55g8LSTs7Nf9", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1987-04-01T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1975-05-29T00:00:00Z", "discountedPrice": 11, "expireAt": "1992-04-26T00:00:00Z", "price": 2, "purchaseAt": "1989-10-07T00:00:00Z", "trialPrice": 34}, {"currencyCode": "dnI6Ag7eUYcYJ4Qz", "currencyNamespace": "XCmqr6gmPGaHP5SV", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1993-07-22T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1975-08-31T00:00:00Z", "discountedPrice": 60, "expireAt": "1975-05-29T00:00:00Z", "price": 26, "purchaseAt": "1979-11-20T00:00:00Z", "trialPrice": 56}]}}]}' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateRegionData' test.out

#- 98 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '10' \
    --offset '2' \
    --sortBy 'BovqLwXBuT30EYeR' \
    --storeId 'j17xGhaBKoUfiHjG' \
    --keyword 'mCyPsKCJTv1ic9gv' \
    --language 'agF2cSuztsJ5tj64' \
    > test.out 2>&1
eval_tap $? 98 'SearchItems' test.out

#- 99 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '12' \
    --offset '79' \
    --sortBy 'displayOrder:desc,createdAt,updatedAt:asc' \
    --storeId 't1xk9IyssSA8nP5P' \
    > test.out 2>&1
eval_tap $? 99 'QueryUncategorizedItems' test.out

#- 100 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'Qjpzk2Tb7iYdmNZW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'osrsVBPZ64j0HUON' \
    > test.out 2>&1
eval_tap $? 100 'GetItem' test.out

#- 101 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'scofwYLQcDvkaEII' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PoJT83zEGXmVBZLy' \
    --body '{"appId": "rH9J7BoysmaORLkP", "appType": "DEMO", "baseAppId": "hc2Fh04JTsqDTynC", "boothName": "ewqJligLlRxOelKy", "categoryPath": "kICRxF6HtlER2txs", "clazz": "4qrNARATn6KXOutl", "displayOrder": 74, "entitlementType": "DURABLE", "ext": {"bbQGERMNpqWb51y5": {}, "RUzvMfTkPy0fGvTG": {}, "gfLKsg0b1Bq78cE5": {}}, "features": ["O5pmPnbiPJ9j4vxm", "bH3rVaauufxkPHEl", "ug48TgfNu0rqXUOy"], "images": [{"as": "ToLPIREGIKlJt3EP", "caption": "9kKwkENQ8VOHGwbA", "height": 60, "imageUrl": "P8Gwjg3IOH0SDHgY", "smallImageUrl": "KqxJiFJdrmj5vhzg", "width": 37}, {"as": "i5UWs3tYlYeMoCim", "caption": "JySocRvUWDOrFZKP", "height": 82, "imageUrl": "jTvYa5Pqx1K7qcAo", "smallImageUrl": "ijBPAp6EPb988Nzx", "width": 35}, {"as": "Qts2yxf6MLZJ2jZf", "caption": "ZbpTJezzriCDWXT5", "height": 91, "imageUrl": "45x2CPVYYG9WvoGm", "smallImageUrl": "AmvaVV5YfxnUNcwj", "width": 36}], "itemIds": ["LNDvhB4Eoes9a6Xa", "JeRbzTPwD3jxF7vx", "RUY0ilrNoFT98Sgt"], "itemQty": {"Jd4Z5f8nfaKqdZFL": 2, "THIOFjeXbsSgR43k": 72, "w80JfMpPrSqYypRU": 27}, "itemType": "EXTENSION", "listable": true, "localizations": {"q5lQo2jy29EJigqY": {"description": "hyVhURx1yPeczRpd", "localExt": {"k0HATGylx2JG2KNG": {}, "fhzfCTxxrsRRLee3": {}, "TcJ7DQIi45aCDHN9": {}}, "longDescription": "mVug2zkVf6KgpKOc", "title": "n3tMD9UT67bOwugF"}, "Da6wUQvehKqwCh86": {"description": "XmRkCEcfHDCdl59W", "localExt": {"p9A3tXGve6DdK6uv": {}, "g8f2cIoByk9fxtvs": {}, "geAxo57nKAbZpsbJ": {}}, "longDescription": "4Iu5KJ0ynxGBlacD", "title": "CdFe8ATUqVxcSthr"}, "pnMUBsnUfuQIcSbU": {"description": "t5UGkInFGpuUsdtq", "localExt": {"4dOwNESzCEW9dUVh": {}, "ZjLftC3sCS8CpLCq": {}, "PD9CeDEdCnnL6Kt1": {}}, "longDescription": "Bjj3b8QM8Rr45ULq", "title": "XQgvwD3PsKDJiWxQ"}}, "lootBoxConfig": {"rewardCount": 57, "rewards": [{"lootBoxItems": [{"count": 46, "duration": 82, "endDate": "1971-06-15T00:00:00Z", "itemId": "S7rDBf2S54phbdyG", "itemSku": "Dt47f9GWRlE9hqz6", "itemType": "rjDNo4rhjxUdMM83"}, {"count": 100, "duration": 10, "endDate": "1989-03-23T00:00:00Z", "itemId": "7O8sAQ32wj9uaDzs", "itemSku": "r9xYiWRuuzQJiLc1", "itemType": "eI9w3JEhxPGbEk7s"}, {"count": 12, "duration": 53, "endDate": "1982-01-20T00:00:00Z", "itemId": "7FlounC3vJKBC7Sw", "itemSku": "goViPeIB4Ehy0Y5a", "itemType": "SJVDginxAM77eY9C"}], "name": "14FbfiI2NPvl1kCY", "odds": 0.9237062896755317, "type": "PROBABILITY_GROUP", "weight": 37}, {"lootBoxItems": [{"count": 62, "duration": 74, "endDate": "1978-03-26T00:00:00Z", "itemId": "6DzfbzRYt4OVUyum", "itemSku": "BeIqdQGZC5kM03HH", "itemType": "ijsQRj7N8IAjmson"}, {"count": 19, "duration": 64, "endDate": "1976-12-24T00:00:00Z", "itemId": "0ZR50BQ1U6aFD3O2", "itemSku": "kXQSc58zgZVl4gIF", "itemType": "7v3qbZu9M3OxqVAT"}, {"count": 52, "duration": 70, "endDate": "1981-07-04T00:00:00Z", "itemId": "lRZ9Z1JBrHRzEOtI", "itemSku": "xzPqb6n73m0jiaDH", "itemType": "86d9rsKgzCsMulpB"}], "name": "8HZUtVVaJCiLgKOw", "odds": 0.2892376742351299, "type": "REWARD_GROUP", "weight": 7}, {"lootBoxItems": [{"count": 11, "duration": 26, "endDate": "1995-02-28T00:00:00Z", "itemId": "8saabP4xRowfNojz", "itemSku": "PXI2v0prR3OEey0M", "itemType": "kZwS6TYwNN3UYhic"}, {"count": 92, "duration": 33, "endDate": "1979-10-14T00:00:00Z", "itemId": "GEg5fNzBVrjo3g8C", "itemSku": "fRwtyl1HeT7VEPgG", "itemType": "40QyXzsOzgck078I"}, {"count": 13, "duration": 57, "endDate": "1975-10-20T00:00:00Z", "itemId": "oQBp2mWAOYksczxB", "itemSku": "S0OBCa2vWadLmQtY", "itemType": "KmEMzicbuL2S3RiW"}], "name": "8dLTCBfGUdVEdvdQ", "odds": 0.6055300861497886, "type": "REWARD", "weight": 93}], "rollFunction": "DEFAULT"}, "maxCount": 14, "maxCountPerUser": 4, "name": "fwkuVykH4RpfmjIX", "optionBoxConfig": {"boxItems": [{"count": 65, "duration": 69, "endDate": "1987-02-09T00:00:00Z", "itemId": "PKdbabJIkNnt9P1T", "itemSku": "km08luh4dpPRMDbU", "itemType": "XBWTbpAogG2wlZkL"}, {"count": 14, "duration": 14, "endDate": "1981-08-23T00:00:00Z", "itemId": "FI8NijFI0GKwJ3vf", "itemSku": "XlsAMy2Zp2UAGxHn", "itemType": "mSxvkG9UR5q9neoW"}, {"count": 28, "duration": 72, "endDate": "1999-08-07T00:00:00Z", "itemId": "d2sFzMS3QaVjZF7A", "itemSku": "x6115Kg9U8vrQJXQ", "itemType": "xoIbVi2CLEk277Iv"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 20, "fixedTrialCycles": 72, "graceDays": 54}, "regionData": {"bE1ETzRJZKMavu4U": [{"currencyCode": "l2IaieEbPSE7TGke", "currencyNamespace": "HsYsW9oGBN1pYMBw", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1992-10-17T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1994-08-05T00:00:00Z", "expireAt": "1976-11-14T00:00:00Z", "price": 56, "purchaseAt": "1976-03-03T00:00:00Z", "trialPrice": 96}, {"currencyCode": "61hmWKSSrF35anDG", "currencyNamespace": "vur19V18oIrUKXtt", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1978-10-11T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1999-12-12T00:00:00Z", "expireAt": "1989-01-26T00:00:00Z", "price": 1, "purchaseAt": "1996-10-13T00:00:00Z", "trialPrice": 64}, {"currencyCode": "FLmoPEgd8EMspOs8", "currencyNamespace": "nkic9gj5vyUMAAmI", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1991-05-30T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1983-02-10T00:00:00Z", "expireAt": "1987-12-05T00:00:00Z", "price": 90, "purchaseAt": "1991-12-03T00:00:00Z", "trialPrice": 8}], "FXb88SbLOa21DiSF": [{"currencyCode": "sm0XXQJWszvTQEuA", "currencyNamespace": "LzDNp1SZ58aDllwz", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1974-01-07T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1976-11-13T00:00:00Z", "expireAt": "1991-11-15T00:00:00Z", "price": 49, "purchaseAt": "1971-03-18T00:00:00Z", "trialPrice": 41}, {"currencyCode": "7Esrg7900nml5Bid", "currencyNamespace": "sK9dCEzhVnOv0PQb", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1988-01-04T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1975-12-15T00:00:00Z", "expireAt": "1988-11-21T00:00:00Z", "price": 11, "purchaseAt": "1977-04-25T00:00:00Z", "trialPrice": 72}, {"currencyCode": "eorY7A1otGFyv2SM", "currencyNamespace": "jbEr50qGdCZIc6EF", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1978-10-26T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1982-10-08T00:00:00Z", "expireAt": "1971-07-28T00:00:00Z", "price": 92, "purchaseAt": "1977-01-23T00:00:00Z", "trialPrice": 86}], "8rKrKEPGSAcong6e": [{"currencyCode": "NERUf8kjci1Ctccv", "currencyNamespace": "9Gv4tOcbnuCqf0lm", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1985-02-13T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1988-10-10T00:00:00Z", "expireAt": "1971-07-29T00:00:00Z", "price": 66, "purchaseAt": "1975-05-24T00:00:00Z", "trialPrice": 30}, {"currencyCode": "5kdazlypvt6lSLfU", "currencyNamespace": "7HByGXPMqxj4hBgV", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1997-08-01T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1983-09-21T00:00:00Z", "expireAt": "1997-12-17T00:00:00Z", "price": 77, "purchaseAt": "1971-10-31T00:00:00Z", "trialPrice": 22}, {"currencyCode": "bcOdyjqf6Q4oiwoJ", "currencyNamespace": "caRMEb15LBlTVufc", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1992-06-27T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1988-12-18T00:00:00Z", "expireAt": "1976-11-19T00:00:00Z", "price": 96, "purchaseAt": "1995-05-18T00:00:00Z", "trialPrice": 49}]}, "saleConfig": {"currencyCode": "5F2PWGTTD81xhNP4", "price": 39}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "BUjyXAn3bWQF6QcA", "stackable": false, "status": "INACTIVE", "tags": ["8ZFvGcV8DY0XOkDs", "TGkcBOE4qMcH1Kyi", "pXIrgroixptZhckU"], "targetCurrencyCode": "txZcY1HgAnZV4IOg", "targetNamespace": "lVLqb9lGAJUg21Lt", "thumbnailUrl": "7JwgwMUSuC3Bajy3", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateItem' test.out

#- 102 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'O94VBCV9qJhWva2F' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'PBujX0geYCpGJM4s' \
    > test.out 2>&1
eval_tap $? 102 'DeleteItem' test.out

#- 103 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'qsPNJMiZXXOFwmGW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 55, "orderNo": "FMnPpWgrQD4hEk0O"}' \
    > test.out 2>&1
eval_tap $? 103 'AcquireItem' test.out

#- 104 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'LjYsnignE7KcMF7f' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uDbzRRYMNXWUsp1t' \
    > test.out 2>&1
eval_tap $? 104 'GetApp' test.out

#- 105 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'OibJY9aL9ie6vvMb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iNURrlm88QlKyuoy' \
    --body '{"carousel": [{"alt": "a4JgakZyUV7t73Vn", "previewUrl": "SFbuxd4KYZ0jk0UZ", "thumbnailUrl": "dhtnKu9oTc8pVkiy", "type": "video", "url": "EEsL5D0oiFchQnVe", "videoSource": "vimeo"}, {"alt": "8WIObJBTsvsw76uI", "previewUrl": "SRX0bKVoWtoUW1P7", "thumbnailUrl": "ocuBAldDSUS7Haa6", "type": "video", "url": "OQbumu2QHLyZNuys", "videoSource": "vimeo"}, {"alt": "IDi2piIQFVmzMidw", "previewUrl": "70KSahpYZdKZRyR9", "thumbnailUrl": "AX7JjxvNZhM84DiZ", "type": "image", "url": "fPOieDCow2zXyFFV", "videoSource": "generic"}], "developer": "OkL78XeEAtALFI3v", "forumUrl": "8yha4pd5A7MYcpBD", "genres": ["Casual", "FreeToPlay", "Sports"], "localizations": {"KNb8RxvN2u5J7baO": {"announcement": "eLH19fqBwNbNe1ff", "slogan": "YRtIvQaKyevWYtZj"}, "K6J29v8MpBSpo3AK": {"announcement": "RmnJkzJHAckUyBks", "slogan": "YQfDm0RNFwiz70tR"}, "VLMlHi8i9gOVqajU": {"announcement": "WrgEsWDtaKzn8dZw", "slogan": "nnGeZsZVgbPzPFbr"}}, "platformRequirements": {"OMZMgWkFN7Tpkx6G": [{"additionals": "cfyOg6ZUrrp9ubg9", "directXVersion": "mndW2JKmQafUs2bx", "diskSpace": "YztOEyVbKIf1Zbzg", "graphics": "Uwd8DHoCQykmXHYm", "label": "kRlg7gYs6unPYQ9j", "osVersion": "NQN1di1ldhOh6Hvj", "processor": "nYuV7NfC4A2ODiZh", "ram": "bfb8QqCyK1XH9D6v", "soundCard": "l5eFdFfgK46GjCWa"}, {"additionals": "P8huTmnq3FGQn3Ah", "directXVersion": "u5wxq6oJq4mChmQH", "diskSpace": "QhO9IKBXDFQfXFD5", "graphics": "8sG6uDhFYlrzJBYS", "label": "eMuJfQecutjS029B", "osVersion": "iJWOG1m7MKclr5ig", "processor": "jNTVItrH2X78hxJg", "ram": "aVfw5Vnyq8OzTE89", "soundCard": "WDNoMcOmbfJrCJQI"}, {"additionals": "j1haAosKglqaCXE9", "directXVersion": "ytpIO8btO3OwNEGS", "diskSpace": "W5TaW4to7QCY2NGG", "graphics": "vi9kg3rMIzNmhJTN", "label": "QjKlwjfJ3TJ2xVpg", "osVersion": "e70WsLfgbZieRvJI", "processor": "5sT9DH3DfLCv8q4T", "ram": "hmq09bBgPAYxrBE9", "soundCard": "jlnTgtgW33wDwD9R"}], "KvQX4yFQFdrRoM6F": [{"additionals": "oqCYw7AlxO6qdFpc", "directXVersion": "71sSck3ggZWJlSlC", "diskSpace": "QMDji329PfVrvMEP", "graphics": "tpsSNcpK1QkB2Sy8", "label": "Ww79LVeVskqeUB7R", "osVersion": "SayqGFguhh3bvadR", "processor": "thdbVApebRA09rW8", "ram": "i8krFWJhe03coRFo", "soundCard": "k5d3AyGrZO8GuoXN"}, {"additionals": "SoVEBG7VbBPUWipz", "directXVersion": "9C05YabFX4FCK5uc", "diskSpace": "TFsAFzaO3yJpA3KM", "graphics": "xBlrRytER1qdTelF", "label": "AadM9y66Drf4SSGG", "osVersion": "t3MiBKohow3kKoaP", "processor": "1K4CDuH1mMIfOCDy", "ram": "VAHrHncR5dShqiBU", "soundCard": "I9esSsXegSEhrPpK"}, {"additionals": "2q8kxR4BuEksS2A9", "directXVersion": "VOA8H9VeHv0L2Acm", "diskSpace": "960EYQEuGJVl8xs1", "graphics": "WId9WlalqshF9Rh2", "label": "o7GCQGPCxwEdkyuT", "osVersion": "3MgzReRq0112ISAr", "processor": "ROIodcmM6v2AEozW", "ram": "WaYvBLE46bpuJip8", "soundCard": "JyxJ39vrtuWWrqTZ"}], "bSqBSKp8AmgwhYzk": [{"additionals": "33J34fiTxK63OHpn", "directXVersion": "UCGBVfpctNFUsUQ6", "diskSpace": "ZXQcb2o1J5euLAbB", "graphics": "gejqc0apxqZ209By", "label": "Sn8aUaGlAyvIslt7", "osVersion": "N1qcxKs4nlf1MfqU", "processor": "ZXkjHvcUOTlxNf09", "ram": "pefgFIiJssShBKsQ", "soundCard": "jXvfQgQDt6ce8NDM"}, {"additionals": "ErA82FrR1GSogkew", "directXVersion": "IzTOqKkcjRh3l2gA", "diskSpace": "JOTCbx7J3gNLIlTk", "graphics": "3Bpclrk4hIRn0znI", "label": "KzAEAHQpBOgHEP5l", "osVersion": "94s7CbIJ7eHnVWOb", "processor": "oMkyB7FTexsOZ0b2", "ram": "p3b63KrcwIcXMhGy", "soundCard": "83Xit6boOLGCcg16"}, {"additionals": "DqwdQPQ9HkSSV8e1", "directXVersion": "MgTTLS2FgarY903I", "diskSpace": "NGIyEfRBEj7qms9A", "graphics": "GQExPhgr9gGfC0Gj", "label": "vpgJfuBs1Vpqn47G", "osVersion": "VghTH2wToOnq9U5l", "processor": "yW89Xwt3wmRTrDCj", "ram": "hnKvsHezWTqgYPix", "soundCard": "tHk6lWq6tEeUmU96"}]}, "platforms": ["Windows", "Linux", "Windows"], "players": ["MMO", "Multi", "Coop"], "primaryGenre": "Action", "publisher": "k0mJqjRYldcTpdeC", "releaseDate": "1986-06-27T00:00:00Z", "websiteUrl": "XPRi4bAQL7VE2wL8"}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateApp' test.out

#- 106 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Y4JFVUdzA8bvXlDh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G7BrorbKIKuOXJPm' \
    > test.out 2>&1
eval_tap $? 106 'DisableItem' test.out

#- 107 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '5ztrr09CDA8Ij5bG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetItemDynamicData' test.out

#- 108 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'KSuopWQbaCvdPSq8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Z27GpvHCDx55JZ5z' \
    > test.out 2>&1
eval_tap $? 108 'EnableItem' test.out

#- 109 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '6gujpFzlPspQD9IR' \
    --itemId 'IpDDubntPCFxfeoW' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2NdSWzOXjO1NQUqW' \
    > test.out 2>&1
eval_tap $? 109 'FeatureItem' test.out

#- 110 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'HBW78XREZCiTNAxq' \
    --itemId '26gZrPqCsSDspvgM' \
    --namespace "$AB_NAMESPACE" \
    --storeId '16sZ6rjnkH4ExObp' \
    > test.out 2>&1
eval_tap $? 110 'DefeatureItem' test.out

#- 111 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'pC6CMYDm5ge659UD' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'EOF6gp5UfmjtiVbq' \
    --populateBundle  \
    --region 'JnZcrqrPye7fCwi7' \
    --storeId 'Il2wIFlHm9N6owMH' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItem' test.out

#- 112 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'MtJy1Oqn59tEGm9N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YeUT5P0nx8TqSZdZ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 58, "comparison": "isNot", "name": "mFI9TnvzEqBNMF9C", "predicateType": "SeasonTierPredicate", "value": "vPxT5zbreMc9fBoU", "values": ["3RHNDFjLKFrepy56", "4MqJzDSvELgBe6db", "eW1kmb15QeIQF51c"]}, {"anyOf": 29, "comparison": "excludes", "name": "dhkBzAzPkt1efGJe", "predicateType": "SeasonTierPredicate", "value": "Px62tHxDb06ZFy3u", "values": ["glSp2UxvF2uLXWil", "RD7HD6LCgdFxRGj0", "0RT6LvcnGMJbJIYL"]}, {"anyOf": 37, "comparison": "isLessThan", "name": "sMvy9gkfTMRrXVRc", "predicateType": "SeasonPassPredicate", "value": "pxaPHc9r8eToFmkH", "values": ["MjTU226l07jPlcYa", "47YwDudnGRufOUGf", "J6BPOKFLxIwKssw6"]}]}, {"operator": "or", "predicates": [{"anyOf": 34, "comparison": "isGreaterThan", "name": "7YfBmhjI9Y28qVce", "predicateType": "SeasonTierPredicate", "value": "2ur2ccp7R7OqPqIj", "values": ["S4i0N9ytb3c8pVZ8", "GlU8962e6gtn5pUA", "RJM1T8QwMNOAzXmy"]}, {"anyOf": 69, "comparison": "is", "name": "EV4g9P6a280S5RNB", "predicateType": "EntitlementPredicate", "value": "dVCsB7xL4axSPgPC", "values": ["GK3x76U1EIcklttm", "RVTl0tR00oQgcHdG", "iwLxCFLDixZwVtt3"]}, {"anyOf": 35, "comparison": "isGreaterThanOrEqual", "name": "oK3c4RVfjB0zi3Xr", "predicateType": "SeasonTierPredicate", "value": "UiN24ol1qqbalgiz", "values": ["L97ycJV5YqE2myQz", "l7X9fHr6WvBxmBvN", "j3ktaDf9B22HGgxa"]}]}, {"operator": "and", "predicates": [{"anyOf": 49, "comparison": "excludes", "name": "t7IYzaZUTmvsEzLP", "predicateType": "EntitlementPredicate", "value": "S1dS7H7yIS7b5TSD", "values": ["RIoMg7Dc5APzfzXD", "72WDyhBsCCbnfihn", "ELJFaIaEMW5bhJyL"]}, {"anyOf": 75, "comparison": "isLessThanOrEqual", "name": "lm1RJTTy9JrNz1K5", "predicateType": "SeasonTierPredicate", "value": "KfSHQh8I9xk3sFl0", "values": ["cbuCRM69XKkLwioR", "DS6T75Q4ulonMFjm", "aKnWhlh80BhYe2fJ"]}, {"anyOf": 83, "comparison": "isGreaterThanOrEqual", "name": "SesE5p0DwUj2HKUv", "predicateType": "SeasonTierPredicate", "value": "Uy18aWn65Co0vdCk", "values": ["8so6JSaZAIadKDEZ", "X6r0gBVUUeKKlPKt", "ywonA2SrEdN2tmGu"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 112 'UpdateItemPurchaseCondition' test.out

#- 113 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'E6gnYxmkmCWbs5qu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "gklBUS6uwWrCQt86"}' \
    > test.out 2>&1
eval_tap $? 113 'ReturnItem' test.out

#- 114 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --name 'cPWAShIhieSKUf3z' \
    --offset '74' \
    --tag 'n6eXr6FNbKJ05Ory' \
    > test.out 2>&1
eval_tap $? 114 'QueryKeyGroups' test.out

#- 115 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "a6LSSUlugIAknXcS", "name": "aVYcAYp7qSiDvsfM", "status": "INACTIVE", "tags": ["pWv46sXvpOjrpRo4", "mYrCeQUnYoID2UqO", "0iAXA9dB4ib8HDOJ"]}' \
    > test.out 2>&1
eval_tap $? 115 'CreateKeyGroup' test.out

#- 116 GetKeyGroupByBoothName
eval_tap 0 116 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 117 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '8TNiP8KgEAj3dbRT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 117 'GetKeyGroup' test.out

#- 118 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'I0i6dO3zkbDseh4t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "JdoGcwMBmegqVUaW", "name": "MJBjrV0p9A7tcHrV", "status": "ACTIVE", "tags": ["MbJGr4drgkDuWS05", "m0pGzazM2BUXnzUE", "WTiKMJAf6AgbiEDM"]}' \
    > test.out 2>&1
eval_tap $? 118 'UpdateKeyGroup' test.out

#- 119 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'fCckWogE5gcfF8AM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'GetKeyGroupDynamic' test.out

#- 120 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'GZ2FBS93Mg6TKwdR' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '76' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 120 'ListKeys' test.out

#- 121 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'cUml3KuoMKh7tprn' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 121 'UploadKeys' test.out

#- 122 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'acA34xmIOjFLgKR4' \
    --limit '77' \
    --offset '19' \
    --orderNos 'EDiqkwKbpdk7wlDn,gNiPPjpSAlZwFGpe,a5ObBB49Km4ClIQm' \
    --sortBy 'kIdLCvNhZ6P8aqZ2' \
    --startTime 'yfrC1V7ZpJZPHCMq' \
    --status 'FULFILLED' \
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
    --orderNo 'GQAeh0VTiTP4PSrX' \
    > test.out 2>&1
eval_tap $? 124 'GetOrder' test.out

#- 125 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'US6jYI9lsQFD43Df' \
    --body '{"description": "5qUZOFzpFd6b5Jc5"}' \
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
    --body '{"dryRun": true, "notifyUrl": "PLzynjFZgF3erw7U", "privateKey": "syHq4bBb0n1JhPUS"}' \
    > test.out 2>&1
eval_tap $? 127 'UpdatePaymentCallbackConfig' test.out

#- 128 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '8BRPGV9n769zLJdK' \
    --externalId 'MexeJc7NvgTSgKjC' \
    --limit '48' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'YEJjIYwqfSRy8GgV' \
    --offset '22' \
    --paymentOrderNo 'H2r0EKrk5VlnKsWC' \
    --startDate 'PccAFn5CEPoH6opK' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 128 'QueryPaymentNotifications' test.out

#- 129 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'SO8JyX4IE1z3rDwZ' \
    --limit '78' \
    --offset '68' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 129 'QueryPaymentOrders' test.out

#- 130 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "KsOpyq8agQuz86nc", "currencyNamespace": "6jLF9DIW2ncJJKpq", "customParameters": {"mgvUTr8XAtpOqUQx": {}, "zqJZiWi3KQffT5Tn": {}, "61A1xW6okIqmd87i": {}}, "description": "r9op4YfGTno5oHzq", "extOrderNo": "Y3DgykA8zBJX0rkO", "extUserId": "HUkY5aSlqhYoSXbn", "itemType": "BUNDLE", "language": "zo-aQCR_Eb", "metadata": {"Fm950dtVAo7w4e3v": "5mh6Rum5pbgEt39u", "JQpgEtchTe3nt7t9": "ztprSfW9OutADrNG", "BWSJ1zQKxVmRTawj": "iZPMoZZcyGEHxAKD"}, "notifyUrl": "Qher3usApPdJPn9e", "omitNotification": false, "platform": "kyH9jQbHWkcVk0X2", "price": 62, "recurringPaymentOrderNo": "GS54vl7gIKBc7OYT", "region": "ylFRAJKySnC0cfPl", "returnUrl": "3Z2zSBbs4PAV72u8", "sandbox": true, "sku": "O2zMDSy4kyqyKgrt", "subscriptionId": "EPdXXlt8geCdiXu3", "targetNamespace": "iNvn7vLZ7h6alhJN", "targetUserId": "GZF07lsPP5OfHbXz", "title": "WnVO2U4uyzZo1rj0"}' \
    > test.out 2>&1
eval_tap $? 130 'CreatePaymentOrderByDedicated' test.out

#- 131 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'ZrLQjk4VoYfIksth' \
    > test.out 2>&1
eval_tap $? 131 'ListExtOrderNoByExtTxId' test.out

#- 132 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '24cZBpdDFfvzeU5i' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrder' test.out

#- 133 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qhx6zv7EURTNIoG1' \
    --body '{"extTxId": "DBdoKH6sREmmfwUZ", "paymentMethod": "LZZS7snx0Q2Gd8m7", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 133 'ChargePaymentOrder' test.out

#- 134 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3wiNloJfey3HXL6S' \
    --body '{"description": "jljNPTXA3qbg55Sy"}' \
    > test.out 2>&1
eval_tap $? 134 'RefundPaymentOrderByDedicated' test.out

#- 135 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ienCODZ0mnOpPTVx' \
    --body '{"amount": 63, "currencyCode": "i99ctgFXasxp5h78", "notifyType": "CHARGE", "paymentProvider": "WALLET", "salesTax": 13, "vat": 18}' \
    > test.out 2>&1
eval_tap $? 135 'SimulatePaymentOrderNotification' test.out

#- 136 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'l7yHvEqpJSrDXVwC' \
    > test.out 2>&1
eval_tap $? 136 'GetPaymentOrderChargeStatus' test.out

#- 137 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 137 'GetPlatformWalletConfig' test.out

#- 138 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["IOS", "Nintendo", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 138 'UpdatePlatformWalletConfig' test.out

#- 139 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
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
    --endTime 'borUHeCpqnZ5NW62' \
    --limit '99' \
    --offset '87' \
    --source 'ORDER' \
    --startTime 'n2ZJY3QvRa7CDRTc' \
    --status 'SUCCESS' \
    --transactionId 'FylWdaNV1VaZTkbb' \
    --userId 'uWiiA4UTDgS2SVEo' \
    > test.out 2>&1
eval_tap $? 143 'QueryRevocationHistories' test.out

#- 144 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "5M80LLbku9GYH4ij", "eventTopic": "qOVM50tCqkZfsSxA", "maxAwarded": 3, "maxAwardedPerUser": 12, "namespaceExpression": "DJ7sHCLup8pmEosO", "rewardCode": "XglQwwdeLVpmXqRw", "rewardConditions": [{"condition": "Vjc3W2ANmE3VVsQ1", "conditionName": "fm9EUdiaRjuLsKZo", "eventName": "qnpKwhpZVdw5UMa8", "rewardItems": [{"duration": 50, "endDate": "1979-04-15T00:00:00Z", "itemId": "FEzEt8umj5XhKnw7", "quantity": 78}, {"duration": 48, "endDate": "1988-04-18T00:00:00Z", "itemId": "DwFVKUC2ecnpUDqv", "quantity": 78}, {"duration": 5, "endDate": "1993-05-26T00:00:00Z", "itemId": "ixPKVSmWa8TGko16", "quantity": 68}]}, {"condition": "TqHc0cM7ixq8Tjnx", "conditionName": "p5Cl8ggaEmCcuK2h", "eventName": "HviBEWpbusO6EyVq", "rewardItems": [{"duration": 37, "endDate": "1981-06-11T00:00:00Z", "itemId": "Redh1SiZlOpIQ8GL", "quantity": 19}, {"duration": 56, "endDate": "1972-09-14T00:00:00Z", "itemId": "A8iKcF0bkfjcTEFX", "quantity": 5}, {"duration": 23, "endDate": "1994-09-18T00:00:00Z", "itemId": "wEtnHxP5pVtN4jNV", "quantity": 70}]}, {"condition": "62bCo941ALznQuHV", "conditionName": "skfCjUK8GeX4Q0B2", "eventName": "Cj0oOmBmXu1KiTTi", "rewardItems": [{"duration": 52, "endDate": "1996-12-17T00:00:00Z", "itemId": "yrIvQj2isN7bRwcr", "quantity": 98}, {"duration": 90, "endDate": "1977-01-25T00:00:00Z", "itemId": "5YwgZpjlMMtPWg82", "quantity": 31}, {"duration": 23, "endDate": "1977-07-10T00:00:00Z", "itemId": "7qNkQiKp2oac8QTN", "quantity": 61}]}], "userIdExpression": "dtrfq6ECDD6OGkuL"}' \
    > test.out 2>&1
eval_tap $? 144 'CreateReward' test.out

#- 145 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 's9gNpNon6DKW9A6A' \
    --limit '25' \
    --offset '27' \
    --sortBy 'rewardCode:desc,namespace' \
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
    --rewardId 'nuUZ41mSeS9SnGqh' \
    > test.out 2>&1
eval_tap $? 148 'GetReward' test.out

#- 149 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'JOvykBcDpzD9zh6d' \
    --body '{"description": "tPK4fVHLMvrCsH3R", "eventTopic": "YxH2Up9VthPjFrK7", "maxAwarded": 69, "maxAwardedPerUser": 77, "namespaceExpression": "ip0eONFDgUPShG8w", "rewardCode": "wFKY9AMpcwJd4Sri", "rewardConditions": [{"condition": "gIxAhbFMZfxaznlD", "conditionName": "QbzTiFrQB1yUonir", "eventName": "H4URx3NkKQBYrlUa", "rewardItems": [{"duration": 80, "endDate": "1972-03-09T00:00:00Z", "itemId": "r6PM51z7i0wQ9egK", "quantity": 62}, {"duration": 39, "endDate": "1991-09-07T00:00:00Z", "itemId": "6EG8I2lTviKbOgVu", "quantity": 81}, {"duration": 2, "endDate": "1999-01-11T00:00:00Z", "itemId": "nhkn6QIesNoYqvVs", "quantity": 1}]}, {"condition": "XRRnIAJfKVjOn6rt", "conditionName": "ILNJVv2DLLUyBt5h", "eventName": "Ds45siG30Lv9iGa5", "rewardItems": [{"duration": 26, "endDate": "1973-04-01T00:00:00Z", "itemId": "YlSU3vYcHZZjFegV", "quantity": 28}, {"duration": 73, "endDate": "1992-04-16T00:00:00Z", "itemId": "kwLdmR97u9MVUii4", "quantity": 74}, {"duration": 32, "endDate": "1988-01-20T00:00:00Z", "itemId": "0Dv6b8WtaMVvLbG0", "quantity": 39}]}, {"condition": "KKnh3jvW0Qp3kTyL", "conditionName": "4CsLwiWUMcpxn4B6", "eventName": "XoTNMuqZTHwo1IAJ", "rewardItems": [{"duration": 88, "endDate": "1990-05-08T00:00:00Z", "itemId": "8Lfkut0wnT24wh59", "quantity": 89}, {"duration": 52, "endDate": "1987-06-18T00:00:00Z", "itemId": "SbBMh7jpszuVk6iP", "quantity": 6}, {"duration": 55, "endDate": "1989-10-19T00:00:00Z", "itemId": "2boQqCCyJfThvCJi", "quantity": 10}]}], "userIdExpression": "BiHewZkwEeuzBBRS"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateReward' test.out

#- 150 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'knxyWkZObuvig8sM' \
    > test.out 2>&1
eval_tap $? 150 'DeleteReward' test.out

#- 151 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'uss76ezTrsDZNYUV' \
    --body '{"payload": {"48Oh6I45X7HvUtPY": {}, "ONZdFk75lkjQNHrj": {}, "aboGomguUqeuZh5q": {}}}' \
    > test.out 2>&1
eval_tap $? 151 'CheckEventCondition' test.out

#- 152 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'trRbNnGejdTGvZgN' \
    --body '{"conditionName": "5hshSe5YmZXKEQLk", "userId": "M6o3eGSP4Htmr90T"}' \
    > test.out 2>&1
eval_tap $? 152 'DeleteRewardConditionRecord' test.out

#- 153 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'qGf0OyqJ9ibJMmRg' \
    --limit '29' \
    --offset '50' \
    --start 'xNwp1lGkYoq8HP1T' \
    --storeId 'M0tefVQPWX1NPO5W' \
    --viewId 'n7rNG8rGp7Fadvo5' \
    > test.out 2>&1
eval_tap $? 153 'QuerySections' test.out

#- 154 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EzpX0IttsRezyY9G' \
    --body '{"active": true, "displayOrder": 59, "endDate": "1980-06-01T00:00:00Z", "ext": {"O4ZuoGZSxTzm8oMS": {}, "PIHPtqzIWIzg8pbj": {}, "nt1iBV8DpbjGts4U": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 93, "itemCount": 17, "rule": "SEQUENCE"}, "items": [{"id": "PGC9RhzMC7V8BEph", "sku": "nRXnSpCzyb8FkoxQ"}, {"id": "brPngi87K58pQswq", "sku": "KLutINusOsa92F6i"}, {"id": "wkJIYOLarmpWyvib", "sku": "9CDW21ANrlpuXD9H"}], "localizations": {"1u1CvzWPcZwkj1l6": {"description": "bf2F9EXOBj7v8LHY", "localExt": {"ivmD0ekycMKlwJTN": {}, "L2UCWUtaAD7ZZx1i": {}, "efATWcDSqGYRMdz0": {}}, "longDescription": "7xEJ40epssgJJC3C", "title": "X0hpB1ZGMMo5DSoz"}, "CuFsrBMtoOeLfMCY": {"description": "xSeeJOlxa395rghZ", "localExt": {"wGhdZJkkGhYvXYMI": {}, "yaEMEqOpwetb82b9": {}, "6rsH73hRfDgl29GW": {}}, "longDescription": "KpItMt4GszRufkDF", "title": "LYyNBPlMrkse9SGc"}, "MuV5phhU315LUC6H": {"description": "SMQ32UznXNd6ve29", "localExt": {"lqqtcLJW9eTJvKND": {}, "Frx6LabyDnqXjXKP": {}, "Icxh0x7T6RQGnnW4": {}}, "longDescription": "ugGX6mKBbgTD9xL0", "title": "7ZzzIs3Jke34ZAUu"}}, "name": "LP897ooMLnemwKAv", "rotationType": "CUSTOM", "startDate": "1985-05-26T00:00:00Z", "viewId": "XNrFEE4Jf4hQpsLO"}' \
    > test.out 2>&1
eval_tap $? 154 'CreateSection' test.out

#- 155 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cLtZw0efmEVcW7mx' \
    > test.out 2>&1
eval_tap $? 155 'PurgeExpiredSection' test.out

#- 156 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'bS5UOoICxQMit855' \
    --storeId '5Niy4NNFpRE5pS85' \
    > test.out 2>&1
eval_tap $? 156 'GetSection' test.out

#- 157 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'yTIRWvLRy58UKWPv' \
    --storeId '3F7S0wCVlYQi9cfM' \
    --body '{"active": true, "displayOrder": 8, "endDate": "1985-11-21T00:00:00Z", "ext": {"tzJ33tCwv8H1f451": {}, "FVZ630HNBYZSrz7p": {}, "MjESLLMPKDXLki6O": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 78, "itemCount": 2, "rule": "SEQUENCE"}, "items": [{"id": "5f3SBMyJUdwEBRrH", "sku": "AWUFqTooGGnPEgY0"}, {"id": "t7QQWl42byOwXgKy", "sku": "PhXmcysae8HpWH4x"}, {"id": "iz3fWthJSu2pUIIu", "sku": "PLFAtcWhjAP57QbW"}], "localizations": {"vSSp71zEPPfmAQiq": {"description": "RRC2caquMRtQOILc", "localExt": {"aDqUITBHQR5ISNoF": {}, "R3GUxdMuvmL0UBfw": {}, "zaaeP3Wd0Wrb8s3G": {}}, "longDescription": "W0CY0vAfbq8xoCur", "title": "q4lpHXrbVBh60NUA"}, "2aKQwnXrmi6ya8u4": {"description": "sQPvaf1AcweR7tJW", "localExt": {"3MLMob1hUnIzIpUM": {}, "8KK1kGFN0NUNGKxd": {}, "lAUDFQuGPzAuT7M6": {}}, "longDescription": "OBrNwioKnXPVZaDc", "title": "XsV1TnsZioDiBgpr"}, "zahPB0FKMa0YeyNB": {"description": "QWUHDBnBeePkqg6Z", "localExt": {"t1Lr5BlO8K6LH4dS": {}, "aa8XYHug51ZTogG0": {}, "N7Hvnuq1kJ1kpHcQ": {}}, "longDescription": "tnIc9z70LFQMI0oZ", "title": "uEjY0rNBbbB9txAv"}}, "name": "tRQvqJacXR2Rf4no", "rotationType": "CUSTOM", "startDate": "1986-04-12T00:00:00Z", "viewId": "FaEUkPUBnB0ZEJH3"}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateSection' test.out

#- 158 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ebM71Tg922xiBgHS' \
    --storeId 'ka0Pz7I1WkIa0oZ1' \
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
    --body '{"defaultLanguage": "nXpW1l70pcZgIn4l", "defaultRegion": "PghHyMEHBzArbyW1", "description": "0NkJFQxuMHnfOlX6", "supportedLanguages": ["HYVEiaereFCPJU2w", "EzUYUTmZ8JSMeNmR", "ocp400RZe8Bzx9aG"], "supportedRegions": ["EI22BTCZs97TJI8G", "PrM24F3celFgM62H", "QtgzQhO3nR8j8DlP"], "title": "6OGbn8vmfMYGLt1A"}' \
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
    --storeId 'jKhh3JMX7xSrz1EH' \
    > test.out 2>&1
eval_tap $? 166 'GetStore' test.out

#- 167 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6X2SM3xzsNrJzWBc' \
    --body '{"defaultLanguage": "dFlo7oAsOlfLB1J1", "defaultRegion": "9b5rTfiL2P3r1a8K", "description": "IJH33aKkPuWD59Mg", "supportedLanguages": ["Ty1HA58Jt5NaROjS", "KFEuZo2ElXYSS4ez", "BRSiOyReviDaxlPd"], "supportedRegions": ["hwmcH03yoMxzRR6x", "d9rTh3ureaIbxM3W", "ev9pZQjWAN0tny16"], "title": "ZHZtuSJGQCrM7JEM"}' \
    > test.out 2>&1
eval_tap $? 167 'UpdateStore' test.out

#- 168 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RPkdTcAzkIlndN5x' \
    > test.out 2>&1
eval_tap $? 168 'DeleteStore' test.out

#- 169 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eayr3vUKMuIiz2Mi' \
    --action 'DELETE' \
    --itemSku 'O46OOzz9p57qSpHe' \
    --itemType 'EXTENSION' \
    --limit '90' \
    --offset '52' \
    --selected  \
    --sortBy 'createdAt,updatedAt:desc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'TqtMiQgi7Aj28qCR' \
    --updatedAtStart 'bwwZc4ZS1NMkrnHs' \
    > test.out 2>&1
eval_tap $? 169 'QueryChanges' test.out

#- 170 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '1Iyhwqk140MolIrn' \
    > test.out 2>&1
eval_tap $? 170 'PublishAll' test.out

#- 171 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lkRVbcX435TDYpkk' \
    > test.out 2>&1
eval_tap $? 171 'PublishSelected' test.out

#- 172 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '2Gza6DrSycophHw3' \
    > test.out 2>&1
eval_tap $? 172 'SelectAllRecords' test.out

#- 173 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EoEEClTO9SDKnMln' \
    --action 'UPDATE' \
    --itemSku 'gpmShlmIt2nfhUaZ' \
    --itemType 'OPTIONBOX' \
    --type 'STORE' \
    --updatedAtEnd 'qjslu59GT2E6Aacm' \
    --updatedAtStart 'ZRXZm626POXWVj3K' \
    > test.out 2>&1
eval_tap $? 173 'GetStatistic' test.out

#- 174 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'P1mX0iYHXBU3Uk2t' \
    > test.out 2>&1
eval_tap $? 174 'UnselectAllRecords' test.out

#- 175 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Qm307IORTyHnLYDA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ag1YA4kZURmoGgxV' \
    > test.out 2>&1
eval_tap $? 175 'SelectRecord' test.out

#- 176 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'RMPf8g1rbhfIMStM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nSqrKWYOuITlYS2R' \
    > test.out 2>&1
eval_tap $? 176 'UnselectRecord' test.out

#- 177 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YaD9WNKGhbLhjz1v' \
    --targetStoreId '0RBIO2rkJGmPaK6H' \
    > test.out 2>&1
eval_tap $? 177 'CloneStore' test.out

#- 178 ExportStore
eval_tap 0 178 'ExportStore # SKIP deprecated' test.out

#- 179 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'Mkdz6zPz3BVHAqp4' \
    --limit '83' \
    --offset '12' \
    --sku '9XSjap24esyjh6Wc' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'jH2wFzCpxxJLfAg5' \
    > test.out 2>&1
eval_tap $? 179 'QuerySubscriptions' test.out

#- 180 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cFT0gHAkltcR3eHF' \
    > test.out 2>&1
eval_tap $? 180 'RecurringChargeSubscription' test.out

#- 181 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'biAluHv7Hssd05pH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 181 'GetTicketDynamic' test.out

#- 182 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'BJX5ln8PZbYVD8Ri' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "aTsdD4d3kSbTkHPM"}' \
    > test.out 2>&1
eval_tap $? 182 'DecreaseTicketSale' test.out

#- 183 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'UvOAUXkw36cr2WJQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 183 'GetTicketBoothID' test.out

#- 184 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'qS7Tq4YIyZAFQ6lZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 11, "orderNo": "jAbVwSaoj1ugjr8m"}' \
    > test.out 2>&1
eval_tap $? 184 'IncreaseTicketSale' test.out

#- 185 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pkr3tZ506ERSVy5M' \
    --body '{"achievements": [{"id": "3rrkxu0U9h9gCNVZ", "value": 48}, {"id": "ci632w6LUrHuKBoN", "value": 93}, {"id": "3SWISs1dYrJKmx1B", "value": 92}], "steamUserId": "0fbCU9QdPuWeMEeL"}' \
    > test.out 2>&1
eval_tap $? 185 'UnlockSteamUserAchievement' test.out

#- 186 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '0EJG67g4W1eAmDxP' \
    --xboxUserId '23qstMuikKc6VNU8' \
    > test.out 2>&1
eval_tap $? 186 'GetXblUserAchievements' test.out

#- 187 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '570siWm3V9sirE0J' \
    --body '{"achievements": [{"id": "OQxWeHypqCWMDPRI", "value": 14}, {"id": "cCk8zHR8VyCC0EQw", "value": 63}, {"id": "4J6fFQezJ5E3iYHI", "value": 22}], "serviceConfigId": "u7hZvHfiT9s9pK8H", "titleId": "uUY1QQHQ0NCEddJt", "xboxUserId": "x6GV01vD7lNLxlpv"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateXblUserAchievement' test.out

#- 188 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'qaB9P9GaukfCEIeS' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeCampaign' test.out

#- 189 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLhTfzigzHcRuJgY' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeEntitlement' test.out

#- 190 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'aj4I8Dzyh1N0JEKN' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeFulfillment' test.out

#- 191 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'oMtHvjM7X1fjzknv' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeIntegration' test.out

#- 192 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2HZMIL2P2bh14Lro' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeOrder' test.out

#- 193 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTnAuujPeP9N0vdV' \
    > test.out 2>&1
eval_tap $? 193 'AnonymizePayment' test.out

#- 194 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'B5a2XkS3XQfMuzZh' \
    > test.out 2>&1
eval_tap $? 194 'AnonymizeRevocation' test.out

#- 195 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '4AhZRe2hgU56xtyJ' \
    > test.out 2>&1
eval_tap $? 195 'AnonymizeSubscription' test.out

#- 196 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'tnbTDXu7FbleSP5P' \
    > test.out 2>&1
eval_tap $? 196 'AnonymizeWallet' test.out

#- 197 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'cdOuq0m0rvakR8rc' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 197 'GetUserDLCByPlatform' test.out

#- 198 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'r4gdJDujYnVnFK6g' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 198 'GetUserDLC' test.out

#- 199 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2tod2BGBXjNyRCtP' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '1FU3QZy3gdDms3kb' \
    --features '1htW0UGJpwQZlXuz,u3m9u67JjCDwg186,hGWKfO9MnoT3t99H' \
    --itemId 'mcxzjDhTrcBKtU95,6hOg8oukDVdweG0s,FHxTHa2k60SzCqUg' \
    --limit '33' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 199 'QueryUserEntitlements' test.out

#- 200 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '1gLbcIMevTmC631p' \
    --body '[{"endDate": "1981-05-14T00:00:00Z", "grantedCode": "QhJuq1C6JHkWMSUb", "itemId": "qByWN2BCnRz9w2nu", "itemNamespace": "r0B9jKaunAcylsau", "language": "UtT_mdJr", "quantity": 9, "region": "LXp3o4TDraEEaDNJ", "source": "ACHIEVEMENT", "startDate": "1992-02-07T00:00:00Z", "storeId": "d20FVHevCjthJUb7"}, {"endDate": "1975-07-19T00:00:00Z", "grantedCode": "KuMrFaoLulzp3sZx", "itemId": "ImVK5yh2LcM8LaMW", "itemNamespace": "0ByjsRUrAHNRkIcC", "language": "Xotg-BHSk_971", "quantity": 24, "region": "56AWXoMiowdWSs9D", "source": "ACHIEVEMENT", "startDate": "1995-09-27T00:00:00Z", "storeId": "U1HED9CGo9aUXj3r"}, {"endDate": "1974-03-25T00:00:00Z", "grantedCode": "0UyqxVWlIMY5tTJw", "itemId": "4KV104MtMhKHmSjq", "itemNamespace": "PuQZX5KjdNrEwfWo", "language": "XtUk", "quantity": 14, "region": "rwXmIGamRCARuFLx", "source": "PROMOTION", "startDate": "1984-01-05T00:00:00Z", "storeId": "4CXVMrDYKe2eTf1a"}]' \
    > test.out 2>&1
eval_tap $? 200 'GrantUserEntitlement' test.out

#- 201 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xo16GqT2vSLLiMvc' \
    --activeOnly  \
    --appId 'u39YZJypWzpNXgno' \
    > test.out 2>&1
eval_tap $? 201 'GetUserAppEntitlementByAppId' test.out

#- 202 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'KIz8O8NglJtZTh28' \
    --activeOnly  \
    --limit '45' \
    --offset '10' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 202 'QueryUserEntitlementsByAppType' test.out

#- 203 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lFMxIhlIT8AgyZJ1' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'MMd2bzOrTn2huwPg' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlementByItemId' test.out

#- 204 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'yUzBUWiKoNGtvyk5' \
    --ids 'xEfrJDxKsw5Xl7ZZ,rDZdbuvCFBaVcohe,wKkVuGv9fQXkErF0' \
    > test.out 2>&1
eval_tap $? 204 'GetUserActiveEntitlementsByItemIds' test.out

#- 205 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'drbYrrFQP6rW62Ct' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'C1cr5T1PSXhduTWc' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementBySku' test.out

#- 206 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hzXDv3TAtBjP4HSu' \
    --appIds 'iYCbG0UyYUJmNL8p,6AbdtU0CDrlQpKB8,qoel2QK3aSOYdmMD' \
    --itemIds 'ikc3Fjm9HoQDemti,QvURYZCeF30RT9rB,gM8o7lxXq7TkdM7F' \
    --skus 'VDCBcvVegrZddP8l,LQo6tHj4z4cAM4LM,JfWNZIxAgBpeubpr' \
    > test.out 2>&1
eval_tap $? 206 'ExistsAnyUserActiveEntitlement' test.out

#- 207 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'KX68jTyRd3LrR1x6' \
    --itemIds 'U1v6zSLjm9zmzUW0,vPj90jmLTt5YQGaw,comPoiYoQ1f1AYq3' \
    > test.out 2>&1
eval_tap $? 207 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 208 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '06Pysv4VPaZWolXy' \
    --appId 'pwucUqqqff2iWi4y' \
    > test.out 2>&1
eval_tap $? 208 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 209 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'P3uqNcig6YcDA8Z3' \
    --entitlementClazz 'APP' \
    --itemId '54ZuQHKersDmJLUH' \
    > test.out 2>&1
eval_tap $? 209 'GetUserEntitlementOwnershipByItemId' test.out

#- 210 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKtfXCKOna8DdjtZ' \
    --ids 'hh6ofsUoRh6r0e0J,6vyqPw7YlmV3kES0,Hi88UYgSV40OvY7a' \
    > test.out 2>&1
eval_tap $? 210 'GetUserEntitlementOwnershipByItemIds' test.out

#- 211 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'pPCrN5bEhmuHgKeW' \
    --entitlementClazz 'CODE' \
    --sku 't0YSPX04uEIdAwgD' \
    > test.out 2>&1
eval_tap $? 211 'GetUserEntitlementOwnershipBySku' test.out

#- 212 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'obopbdJeVCiKs2vL' \
    > test.out 2>&1
eval_tap $? 212 'RevokeAllEntitlements' test.out

#- 213 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'yH9kcSBdk7MwQzn2' \
    --entitlementIds '8Le5neohqhCzroAz' \
    > test.out 2>&1
eval_tap $? 213 'RevokeUserEntitlements' test.out

#- 214 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'WQDve0Z2G2N09VIb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bsz24fQKDZX6plEr' \
    > test.out 2>&1
eval_tap $? 214 'GetUserEntitlement' test.out

#- 215 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'w0Gb0ceCbphW4YMh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'J0S50bez9ZLHW882' \
    --body '{"endDate": "1979-03-08T00:00:00Z", "nullFieldList": ["AnlXRYB9BgSZBvke", "hRn83B0nrW1qx3NJ", "TugVWXz8dv7BiEUq"], "startDate": "1977-10-24T00:00:00Z", "status": "REVOKED", "useCount": 22}' \
    > test.out 2>&1
eval_tap $? 215 'UpdateUserEntitlement' test.out

#- 216 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'xs2deMF8UAJIHEZv' \
    --namespace "$AB_NAMESPACE" \
    --userId '5zyUUyNJkvA5xF3z' \
    --body '{"options": ["HtZSd3QzXhkrN4pW", "ryt4XTNwpp0ni1Yf", "IgLZ4YIzElrLZOBL"], "requestId": "HCKmLBaIwlokbAFW", "useCount": 36}' \
    > test.out 2>&1
eval_tap $? 216 'ConsumeUserEntitlement' test.out

#- 217 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'RgBUwBL28BqM8Uzv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KqeoTiNKGRUMrimG' \
    > test.out 2>&1
eval_tap $? 217 'DisableUserEntitlement' test.out

#- 218 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Az6OhmHOpCdr3WzD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm3hJdd6uaO9TiTPn' \
    > test.out 2>&1
eval_tap $? 218 'EnableUserEntitlement' test.out

#- 219 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Ih2iaIBpYC4txul6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VKYlNYYlHPwKDpJm' \
    > test.out 2>&1
eval_tap $? 219 'GetUserEntitlementHistories' test.out

#- 220 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'keoAkp3Z4pgyJYwc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lb4gd4QgQut2hiPu' \
    > test.out 2>&1
eval_tap $? 220 'RevokeUserEntitlement' test.out

#- 221 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'DdOPHcN9drwqytie' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XpIZfr5XDq9dGLHj' \
    --body '{"reason": "tgE2bTXJxCCFqPND", "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 221 'RevokeUseCount' test.out

#- 222 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'leYNHXeOpaRDwYLg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e851PbK2MFKvw5TW' \
    --body '{"requestId": "jAh4gy41LLzQ2IjY", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 222 'SellUserEntitlement' test.out

#- 223 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'PeNr4JmYxH2qs28h' \
    --body '{"duration": 9, "endDate": "1995-12-01T00:00:00Z", "itemId": "mbfzwUmsy0stUmKd", "itemSku": "XiiTObNdqkWa13g3", "language": "pgHx6uPf6jQZcYer", "order": {"currency": {"currencyCode": "H933X7iXEEM2KOus", "currencySymbol": "NEHcI95GGdJvucDb", "currencyType": "VIRTUAL", "decimals": 34, "namespace": "6UdccuM2ykRj3Wny"}, "ext": {"AaUaQBKFedL2uduX": {}, "vZUbQQ13FhD3NExU": {}, "FipJsUiDawAjgHFQ": {}}, "free": false}, "orderNo": "a2UZgeesipbP027o", "origin": "IOS", "quantity": 59, "region": "M5E8tAajVSvLRj30", "source": "PURCHASE", "startDate": "1993-05-06T00:00:00Z", "storeId": "DuaSixXEdloYZBka"}' \
    > test.out 2>&1
eval_tap $? 223 'FulfillItem' test.out

#- 224 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'tNLc42eq0O6VsXtO' \
    --body '{"code": "lQwj5xPvm7c5nPR0", "language": "aTf", "region": "9FSeg6WYgtfuqJHr"}' \
    > test.out 2>&1
eval_tap $? 224 'RedeemCode' test.out

#- 225 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 's4e3RnWR30MdBZez' \
    --body '{"origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "2J4JGQZAtyjTxnlm", "namespace": "SyjEaFH2DRN6HIEq"}, "item": {"itemId": "IFEcS0ynIMOYWpUY", "itemSku": "UQMooiKT57rmbjEn", "itemType": "imeR7EFBz43E9FkO"}, "quantity": 85, "type": "ITEM"}, {"currency": {"currencyCode": "qvfDG5jvMOaXrDlE", "namespace": "X42U0syrGNhBmgT2"}, "item": {"itemId": "q0kIbrJ2S5Pf1Lvg", "itemSku": "8kYEVylINJpxFY8E", "itemType": "6pU8eHjh0aTjIOaQ"}, "quantity": 39, "type": "ITEM"}, {"currency": {"currencyCode": "9CU3fjSRaXD4HDmd", "namespace": "vhMXxiKR29LKIhNU"}, "item": {"itemId": "43K8bihdw3prp0UH", "itemSku": "lWUxkBefhxRtrqbv", "itemType": "56oqwnCLVc2qHZuu"}, "quantity": 8, "type": "CURRENCY"}], "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 225 'FulfillRewards' test.out

#- 226 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'HcZbX2wNnT6A9zos' \
    --endTime 'mDnXoncy7NZQ4PkA' \
    --limit '85' \
    --offset '95' \
    --productId 'XBCfkE1Fb0y94eP7' \
    --startTime 'yh0zsKhR60HZwUwk' \
    --status 'VERIFIED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 226 'QueryUserIAPOrders' test.out

#- 227 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'K7MXHbEwAvvpEeHh' \
    > test.out 2>&1
eval_tap $? 227 'QueryAllUserIAPOrders' test.out

#- 228 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'XiJcJqYSxVKUYMim' \
    --endTime 'VLzAP6aOzsTqEFXU' \
    --limit '14' \
    --offset '56' \
    --startTime 'GAwpYq1UqZydOB0M' \
    --status 'SUCCESS' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 228 'QueryUserIAPConsumeHistory' test.out

#- 229 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'fabC01Thm9f4AWpy' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "lx", "productId": "3OvEujx5yjtQSCJa", "region": "OHzpb623EciYoYOP", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 229 'MockFulfillIAPItem' test.out

#- 230 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BcfXXeV7BXefsSgZ' \
    --itemId 'xSYnVwXqF6K0WA76' \
    --limit '76' \
    --offset '24' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 230 'QueryUserOrders' test.out

#- 231 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2mHHoz6qBQnEDgX4' \
    --body '{"currencyCode": "9n1xTDFcmOm1sqdI", "currencyNamespace": "WU6ERylESgf5dXMr", "discountedPrice": 84, "ext": {"lLoMemsp7o3F2LQw": {}, "7Y2VdSxgXez7VvS0": {}, "C9JLVQQPa7PPx4Zi": {}}, "itemId": "6WaC8wk7HMbJhNwZ", "language": "gf5nlMDORYuXnPNJ", "options": {"skipPriceValidation": false}, "platform": "Epic", "price": 59, "quantity": 49, "region": "BYnkY0LEBSYBdUSi", "returnUrl": "TOrhB8hVs29WOKmZ", "sandbox": true, "sectionId": "lJ93CCGBXv4fP4VP"}' \
    > test.out 2>&1
eval_tap $? 231 'AdminCreateUserOrder' test.out

#- 232 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'zhcH4UJrrCKvrOAi' \
    --itemId '7lMgkVWJYzSCIDxW' \
    > test.out 2>&1
eval_tap $? 232 'CountOfPurchasedItem' test.out

#- 233 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UxgOzeRNHIqK5PT4' \
    --userId '04mFw4HJv5T2kIQO' \
    > test.out 2>&1
eval_tap $? 233 'GetUserOrder' test.out

#- 234 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ecfLsYKTmUnKlrOs' \
    --userId 'JmEwjGYN8VNPXNsm' \
    --body '{"status": "FULFILLED", "statusReason": "SGQyTzhs9Asy4d62"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateUserOrderStatus' test.out

#- 235 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9N4YnolVWA2dWxBs' \
    --userId '056jkPCUuE1pgdHv' \
    > test.out 2>&1
eval_tap $? 235 'FulfillUserOrder' test.out

#- 236 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lQKiR7SDQUDavOlK' \
    --userId 'T5EIHNhJQq94Re5I' \
    > test.out 2>&1
eval_tap $? 236 'GetUserOrderGrant' test.out

#- 237 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M1akNKz9IltQUku3' \
    --userId 'n32atB0QPQPEp5Ut' \
    > test.out 2>&1
eval_tap $? 237 'GetUserOrderHistories' test.out

#- 238 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wUWGt6tooHP5kAww' \
    --userId '01zalTddhAQ1pwqn' \
    --body '{"additionalData": {"cardSummary": "ybvUIfuulmeegRwP"}, "authorisedTime": "1992-12-26T00:00:00Z", "chargebackReversedTime": "1971-05-09T00:00:00Z", "chargebackTime": "1978-08-14T00:00:00Z", "chargedTime": "1977-06-13T00:00:00Z", "createdTime": "1990-06-10T00:00:00Z", "currency": {"currencyCode": "ODN3Boi2sSAO2n4M", "currencySymbol": "ZQt753XQB93rOW0g", "currencyType": "VIRTUAL", "decimals": 0, "namespace": "PoQbYzc1RDVhs2lh"}, "customParameters": {"dzxxgibuqUuyW3cM": {}, "z9YyduMomEHcU15S": {}, "t4v8ry8IyqNVv0KV": {}}, "extOrderNo": "pXJTMx3Y8Um1iqeh", "extTxId": "Obg3OZ9j0HDtbqMF", "extUserId": "lgHKQIRtLfPngD83", "issuedAt": "1979-09-01T00:00:00Z", "metadata": {"oOeqE7fcCAeExeQX": "43LpmdMiZeyIrA4Q", "UKSJgECzvaWUCA7w": "Kru7ry3AQ2sEHvSx", "jWoM1rNJLM0OOVG5": "cG6XxENbWqlX7idz"}, "namespace": "jpKDfwl6XlCF6YxF", "nonceStr": "MD8tJQwZvUVInos5", "paymentMethod": "RK100yH89i8ZDPXR", "paymentMethodFee": 76, "paymentOrderNo": "SsuFM4ahGw7XcF1Q", "paymentProvider": "WALLET", "paymentProviderFee": 9, "paymentStationUrl": "zz606UGXPhoNZlXM", "price": 9, "refundedTime": "1992-02-11T00:00:00Z", "salesTax": 34, "sandbox": true, "sku": "AvS3TfKx6ByTygbt", "status": "REFUNDING", "statusReason": "9czsYr3cFeVw70xd", "subscriptionId": "NTuOdLKK0M2B2hbq", "subtotalPrice": 72, "targetNamespace": "Ozo4Plv1IlTpEhjT", "targetUserId": "FYdzsUNvQAn2LuMj", "tax": 77, "totalPrice": 58, "totalTax": 33, "txEndTime": "1982-05-18T00:00:00Z", "type": "mVz3zKsfjz1mFkyx", "userId": "oUzfMFoXCOguSq2A", "vat": 97}' \
    > test.out 2>&1
eval_tap $? 238 'ProcessUserOrderNotification' test.out

#- 239 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'R3wDdSkNfHJtA3Qi' \
    --userId 'X9ZvtydbaVb0scd9' \
    > test.out 2>&1
eval_tap $? 239 'DownloadUserOrderReceipt' test.out

#- 240 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '7A0GP6djn2Ps3IVT' \
    --body '{"currencyCode": "5hUZ3cnDq0ddZG0E", "currencyNamespace": "pfGAqHKcSxUc2YgR", "customParameters": {"pk2IFGIgIpscUpVA": {}, "ciu2XPPUxzXHUvxh": {}, "vTZcvRKoaM4ozSAg": {}}, "description": "8FTLrByWOJhbocoG", "extOrderNo": "lPzdfxcC3rpWhSpq", "extUserId": "0InxMLpP7n7M3JXj", "itemType": "MEDIA", "language": "Vh_moyg", "metadata": {"bvyI5PZGzVLcmZKK": "KYARape2tsNczam4", "Cdd1QYvww4XDoklt": "gq2vXtUnY6UhDJ4p", "e0s0Cuhl3dU9b4se": "YCyiB4tDCWx3cEX8"}, "notifyUrl": "wTi1v2abpCWytPEi", "omitNotification": true, "platform": "Ze0hL9rPkV5GkSrc", "price": 24, "recurringPaymentOrderNo": "PLhDSJx9jzxaRKph", "region": "4kiIFgS4fLqlrKGi", "returnUrl": "S3XxjkyNfj3XgTRT", "sandbox": false, "sku": "94flh775AQfzNjQ7", "subscriptionId": "IuMSY2epRDJjDyMD", "title": "KQhuTjtQZyIiAmCL"}' \
    > test.out 2>&1
eval_tap $? 240 'CreateUserPaymentOrder' test.out

#- 241 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8bNTTfqLCv9DYBOP' \
    --userId 'roN4UWbQaKFrTv4J' \
    --body '{"description": "WElmOCxqPrq9I3XJ"}' \
    > test.out 2>&1
eval_tap $? 241 'RefundUserPaymentOrder' test.out

#- 242 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'WBxTLcOef8MgIwkr' \
    --body '{"code": "KFEtwESJCe2ksG3n", "orderNo": "ZE13H2fILFzOlAZb"}' \
    > test.out 2>&1
eval_tap $? 242 'ApplyUserRedemption' test.out

#- 243 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'DQAEJLbVWH2XLIg3' \
    --body '{"meta": {"MgmdSvWp3h0xPsVY": {}, "8qNwB2TY4v9NNfQS": {}, "YLFKSl3FNFFJnt3r": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Twitch", "currencyCode": "Rn31D8ubfdXi7Byc", "namespace": "DPckeGJUgU8bD5mG"}, "entitlement": {"entitlementId": "FFmKTTUxG0mpmFxx"}, "item": {"itemIdentity": "DNXGlGJvHf558h1l", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 49, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "tjsu6ZJRCoDq3geu", "namespace": "HFFaZzPIjETqcKN1"}, "entitlement": {"entitlementId": "gaQ4Bn0cPPtKaJlw"}, "item": {"itemIdentity": "31pdDrXQ47WSGyDC", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 47, "type": "ITEM"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "LhO3lGZ7eGOPj2Xo", "namespace": "Fug8BUQUmPHnPumc"}, "entitlement": {"entitlementId": "azKAna0ji757aNDF"}, "item": {"itemIdentity": "eKnQP2j2WsQImTwY", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 17, "type": "ENTITLEMENT"}], "source": "ORDER", "transactionId": "0UC6eWKCFGS97Si6"}' \
    > test.out 2>&1
eval_tap $? 243 'DoRevocation' test.out

#- 244 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'XyLVPrkUxyZ1OH5N' \
    --body '{"gameSessionId": "n4nMT8QOyTuUSD9I", "payload": {"mtaPAocOQcpBWSNr": {}, "CjSNEAdojkCMmYyT": {}, "GO07foRZ6FujpIWo": {}}, "scid": "0qJtqp4Q6XgICLgM", "sessionTemplateName": "HcP1eE6sjWQllYsO"}' \
    > test.out 2>&1
eval_tap $? 244 'RegisterXblSessions' test.out

#- 245 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Npp6QGW56CNiszHE' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '9D1MMoaf6KlgRtwa' \
    --limit '79' \
    --offset '27' \
    --sku 'IoyY1wpIdjcAtTj1' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 245 'QueryUserSubscriptions' test.out

#- 246 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'uuhxxlulfmya73hX' \
    --excludeSystem  \
    --limit '24' \
    --offset '0' \
    --subscriptionId 'U31uXPwYxedGHCIk' \
    > test.out 2>&1
eval_tap $? 246 'GetUserSubscriptionActivities' test.out

#- 247 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'mt4bfJOhNaIT0pv7' \
    --body '{"grantDays": 8, "itemId": "kRhtrBcBofWTGYx2", "language": "ihgioL8VvEzHGTt9", "reason": "emdCLmzJbdkykVAn", "region": "mnRfUilcKA84d9pM", "source": "sl7zrNJvDiP2hNNE"}' \
    > test.out 2>&1
eval_tap $? 247 'PlatformSubscribeSubscription' test.out

#- 248 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8QrQ6H1ro5CtU8U' \
    --itemId 'jgyCUpM1JBcTzf4d' \
    > test.out 2>&1
eval_tap $? 248 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 249 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'z1BojPoQg976409v' \
    --userId 'Fd5z9r4nJWUvLp1w' \
    > test.out 2>&1
eval_tap $? 249 'GetUserSubscription' test.out

#- 250 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xGF747468MXUq3uI' \
    --userId 'ffkIpPmrWVxNZUvk' \
    > test.out 2>&1
eval_tap $? 250 'DeleteUserSubscription' test.out

#- 251 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iU2jXSwsBBRopVl3' \
    --userId '8d4NZGtk6EmWxC75' \
    --force  \
    --body '{"immediate": false, "reason": "88TKhFYkA9aRNDe2"}' \
    > test.out 2>&1
eval_tap $? 251 'CancelSubscription' test.out

#- 252 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IoPMSQKcg0OTT9JA' \
    --userId '0ll1RimBCiQwuyrI' \
    --body '{"grantDays": 21, "reason": "7uSyXP6C0jXS8au2"}' \
    > test.out 2>&1
eval_tap $? 252 'GrantDaysToSubscription' test.out

#- 253 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wcWYyj3JvHqXp4JR' \
    --userId '7xI59Z9tfGVsglnO' \
    --excludeFree  \
    --limit '49' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 253 'GetUserSubscriptionBillingHistories' test.out

#- 254 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OXBfgBLuglkd9LIo' \
    --userId 'shGnFSuHmrqej8PR' \
    --body '{"additionalData": {"cardSummary": "ppYY1vlV0M2g6ore"}, "authorisedTime": "1979-07-19T00:00:00Z", "chargebackReversedTime": "1977-08-17T00:00:00Z", "chargebackTime": "1997-07-28T00:00:00Z", "chargedTime": "1976-02-15T00:00:00Z", "createdTime": "1984-07-19T00:00:00Z", "currency": {"currencyCode": "CgMMWZuD6tmIR28x", "currencySymbol": "VxbtpSKOfiIP3S6p", "currencyType": "VIRTUAL", "decimals": 15, "namespace": "pZqISn3msrykQFtW"}, "customParameters": {"8QGKFZLrIfqrZuu7": {}, "IwKcT7sAsv2TKCbY": {}, "MVkXEHmsHwIGGsus": {}}, "extOrderNo": "S0zZRODEKPdudZsL", "extTxId": "af8aZrXW84dt0TST", "extUserId": "my7XF26K2U7xttUz", "issuedAt": "1978-11-27T00:00:00Z", "metadata": {"WKJjv06PuffHghAQ": "fAsYXVzBenLtaAoY", "yRfiCWrm3s1Ah3TI": "I70MIcBMJ04508jK", "edx0CVRpd7SwZw2U": "kjDzJ4NuMMgI13np"}, "namespace": "lXaUQV5QEvKElLfb", "nonceStr": "B7gwwAR1xFrnyirw", "paymentMethod": "3iJt5iA3JS2xeaJ0", "paymentMethodFee": 72, "paymentOrderNo": "Tm8t1YTWqItjNWXm", "paymentProvider": "STRIPE", "paymentProviderFee": 37, "paymentStationUrl": "1C2TIQzRJY7UfYSr", "price": 7, "refundedTime": "1973-11-19T00:00:00Z", "salesTax": 32, "sandbox": false, "sku": "JVz4U43EcV1FRyee", "status": "CHARGED", "statusReason": "77XmemN8LO03mnFS", "subscriptionId": "q9jJTVFoFjxZjh5q", "subtotalPrice": 96, "targetNamespace": "oexHBMBMMAYokSWF", "targetUserId": "wajRGUyklfLVY6g3", "tax": 86, "totalPrice": 35, "totalTax": 83, "txEndTime": "1985-03-02T00:00:00Z", "type": "08VZxI4TU3apnZXo", "userId": "J4gI4EQKO8xC4D0F", "vat": 38}' \
    > test.out 2>&1
eval_tap $? 254 'ProcessUserSubscriptionNotification' test.out

#- 255 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'BEuhnaxZVf6MD9r1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y5Ihr531Kajxq7lz' \
    --body '{"count": 42, "orderNo": "tdgfLGO3ummpllnV"}' \
    > test.out 2>&1
eval_tap $? 255 'AcquireUserTicket' test.out

#- 256 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '6B62P1Kazg73c6Up' \
    > test.out 2>&1
eval_tap $? 256 'QueryUserCurrencyWallets' test.out

#- 257 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'mA4ehxNIIlcrZzga' \
    --namespace "$AB_NAMESPACE" \
    --userId 'meT2mLkkAMjHyI0e' \
    --body '{"allowOverdraft": false, "amount": 53, "balanceOrigin": "Epic", "reason": "xj0nZHjmoKHJngwM"}' \
    > test.out 2>&1
eval_tap $? 257 'DebitUserWalletByCurrencyCode' test.out

#- 258 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'e1AnQVj6QQjZtkNJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnDSrsSey2BqOxgw' \
    --limit '58' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 258 'ListUserCurrencyTransactions' test.out

#- 259 CheckWallet
eval_tap 0 259 'CheckWallet # SKIP deprecated' test.out

#- 260 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'ymCDYsuff3b7G5FD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4mu0qPHb9Ll2EFE' \
    --body '{"amount": 2, "expireAt": "1990-09-22T00:00:00Z", "origin": "Other", "reason": "nsthmQ2Y6ZGOiqrg", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 260 'CreditUserWallet' test.out

#- 261 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'JL9M53Mg0MzWS9us' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xxnMhjv66DyED4pr' \
    --body '{"amount": 90, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 261 'PayWithUserWallet' test.out

#- 262 GetUserWallet
eval_tap 0 262 'GetUserWallet # SKIP deprecated' test.out

#- 263 DebitUserWallet
eval_tap 0 263 'DebitUserWallet # SKIP deprecated' test.out

#- 264 DisableUserWallet
eval_tap 0 264 'DisableUserWallet # SKIP deprecated' test.out

#- 265 EnableUserWallet
eval_tap 0 265 'EnableUserWallet # SKIP deprecated' test.out

#- 266 ListUserWalletTransactions
eval_tap 0 266 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 267 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ibTATxd7Mzjv1gSj' \
    > test.out 2>&1
eval_tap $? 267 'ListViews' test.out

#- 268 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '8kcNhoqcRZRNAToj' \
    --body '{"displayOrder": 79, "localizations": {"9W8rXqwGVIRWgTNH": {"description": "Cka3Wb5kH1BrLWUe", "localExt": {"tP7nmESQDV3BD1nn": {}, "EzoUlUWqP4ElzL44": {}, "KEm3uHBMCP5ckjph": {}}, "longDescription": "URs4ksgsKJ2R6Jac", "title": "wwu8W1zvrKMRPvwA"}, "9k6yJz03NETdywPq": {"description": "YerrpOm4M2pM4fIf", "localExt": {"cHBWZM50aHbPXRns": {}, "3qwYL6LwGlZGF7XQ": {}, "PLAcIL7FvAMWqhyy": {}}, "longDescription": "NZH1CducB5y5iMde", "title": "BG7REG4meKEabfVX"}, "BJPIZqZC5d6JuFdc": {"description": "fiNf0DOHKwxDF5GJ", "localExt": {"hCjVHiCn2hTefT8g": {}, "PFJ4WndMpQhcLK0W": {}, "TZbtmQkwC8azx3IR": {}}, "longDescription": "Wme3C6p2r4D3NQdj", "title": "rjkX3AMgK3JgZufz"}}, "name": "ssA284mG7uAojLYB"}' \
    > test.out 2>&1
eval_tap $? 268 'CreateView' test.out

#- 269 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'sx8oqMzbE0ljQaBt' \
    --storeId 'b47V691j0FZp2vjO' \
    > test.out 2>&1
eval_tap $? 269 'GetView' test.out

#- 270 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Xptxzx6kkaZYpl52' \
    --storeId 'sQR9Znp5d1eSwrG2' \
    --body '{"displayOrder": 66, "localizations": {"sq5zQ6uZNwKjnX7v": {"description": "DIqpcjmaq5KBCsHl", "localExt": {"wNrfKJrkzwR40tfd": {}, "9GFXChtxB10d4Q8n": {}, "lBthUSu4WNfTvD5U": {}}, "longDescription": "cES1eLMZs9lSQVDp", "title": "16qVIqXCK9dS5JTb"}, "dJEe6mnkYAfw61ky": {"description": "Kk0UXUF2523OTvOm", "localExt": {"fVNJNDaSO3FEkk4I": {}, "t6V8Bu7rIjGrxUMK": {}, "bv60ixUuUhopdqGr": {}}, "longDescription": "qRZ124P7PauXTrpW", "title": "AjwatSvtPbAFn8oW"}, "QcmFkkRX6EqadAEI": {"description": "zxld80Ynss7hc3VU", "localExt": {"xxZIgkTLqMeJPCbs": {}, "8jWmTteJhwNbwHGG": {}, "39YAZJ4HuLfeTfFB": {}}, "longDescription": "TOFFMJ9pq511jZcT", "title": "K8zmMfyshYk3b5cA"}}, "name": "FVo85r1b8Yp2Qnuh"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateView' test.out

#- 271 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'QuIdvZdj6AspWBfR' \
    --storeId 'nLcLbp7OmcrDJ7u1' \
    > test.out 2>&1
eval_tap $? 271 'DeleteView' test.out

#- 272 QueryWallets
eval_tap 0 272 'QueryWallets # SKIP deprecated' test.out

#- 273 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 35, "expireAt": "1992-05-21T00:00:00Z", "origin": "Xbox", "reason": "RPcnG89rnNW1Yjfn", "source": "GIFT"}, "currencyCode": "lY4DnYRxY8ZhHeb0", "userIds": ["CaPFDjrSotKnpJWA", "XvPdzEpDln04F8BQ", "LpToj9rgr5RffM5J"]}, {"creditRequest": {"amount": 19, "expireAt": "1980-07-30T00:00:00Z", "origin": "Nintendo", "reason": "iNJtqXltZF6aSRmH", "source": "SELL_BACK"}, "currencyCode": "fkStOqdXqhDMQ6tB", "userIds": ["L80aXFY7SQkym9Kv", "KMHK5fbqioeoRIpl", "LljC7gcT3M1DArk4"]}, {"creditRequest": {"amount": 95, "expireAt": "1985-10-18T00:00:00Z", "origin": "Twitch", "reason": "ruU4uIXBZsEYogFW", "source": "GIFT"}, "currencyCode": "o6M11LLZWKgWxn9Y", "userIds": ["33ZIUrIkfmdXVvaP", "QzzKdFg7N7piT8Vc", "L16HQdtAneXGgxNg"]}]' \
    > test.out 2>&1
eval_tap $? 273 'BulkCredit' test.out

#- 274 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "rXLZnuMNpKEIs3GC", "request": {"allowOverdraft": true, "amount": 74, "balanceOrigin": "Epic", "reason": "7tkJWFpHt7MdKu9X"}, "userIds": ["1CYEjX867n9PT9fR", "wn5GHJDGatrYOMO9", "7mMuBXPDKCriRKzT"]}, {"currencyCode": "Z7TXAVRnUVbxEJcK", "request": {"allowOverdraft": true, "amount": 68, "balanceOrigin": "Other", "reason": "64EwhQfxFKIOGT1W"}, "userIds": ["XsoBwqh0TQXa2j7v", "3zQJoQLTAlW75icI", "KSmLoA0ILaESC1GJ"]}, {"currencyCode": "KUpXazsFrmaGNoi3", "request": {"allowOverdraft": true, "amount": 85, "balanceOrigin": "Other", "reason": "TgWotLNz0u8ySxA0"}, "userIds": ["K56dsYI5SKV5pDAN", "yrjz4q7e0EJnADXC", "2y0DY1E1SMK9oA4v"]}]' \
    > test.out 2>&1
eval_tap $? 274 'BulkDebit' test.out

#- 275 GetWallet
eval_tap 0 275 'GetWallet # SKIP deprecated' test.out

#- 276 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'yJ184miBhdVJt81f' \
    --end 'mLSyGuu5rbJVIwRM' \
    --start 'twApGbXnR3yC6f2M' \
    > test.out 2>&1
eval_tap $? 276 'SyncOrders' test.out

#- 277 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["HGGedk0KzXRclOXd", "PYZQxBnttu4yW5et", "l4Xk8Hd1lRtoPMvs"], "apiKey": "u9oswEPTvzwwGnpb", "authoriseAsCapture": true, "blockedPaymentMethods": ["UufgsVbG6TUe3jbu", "Q7HMPO4ozK705ykR", "qSPYZgPm4JLsXVtB"], "clientKey": "OEetHsxAJ8Ny1LRk", "dropInSettings": "PU9hrl5nkpEdBe8b", "liveEndpointUrlPrefix": "YWdok4UnUEOyP0cP", "merchantAccount": "Zf5OvolfI0mqZcto", "notificationHmacKey": "hLheRaQkfMLFW9B7", "notificationPassword": "jHZro4hhwnANAGp8", "notificationUsername": "zGqNGrcQyoA1TWPc", "returnUrl": "y83iXfYXNdMkdg9T", "settings": "MwxNcQ6CkVi8fqVP"}' \
    > test.out 2>&1
eval_tap $? 277 'TestAdyenConfig' test.out

#- 278 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "RqNbF5yLnYSa8xFL", "privateKey": "vcYexMMMiDFh5RbW", "publicKey": "021cHN3QbzVuJZH3", "returnUrl": "k54cExxWKtdGTW4F"}' \
    > test.out 2>&1
eval_tap $? 278 'TestAliPayConfig' test.out

#- 279 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "ILotv5ycTa0i6ifY", "secretKey": "P1zfgjsy3VRjX4qA"}' \
    > test.out 2>&1
eval_tap $? 279 'TestCheckoutConfig' test.out

#- 280 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '4g9OGoWw1qnCAvdn' \
    > test.out 2>&1
eval_tap $? 280 'DebugMatchedPaymentMerchantConfig' test.out

#- 281 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "AcokJ0rzqX2KJcYH", "clientSecret": "giFDxclBXap6j73d", "returnUrl": "oCWxhubMXbxNvT6w", "webHookId": "Affv4uzKAwiI4wTx"}' \
    > test.out 2>&1
eval_tap $? 281 'TestPayPalConfig' test.out

#- 282 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["NIefCmtrxWu29355", "1nQBNKcqCkUXRj8g", "QHEe4CO370OsbzRK"], "publishableKey": "KPd6mjzLxllUrFYn", "secretKey": "7cSuO7NxKHUHg0c4", "webhookSecret": "X7fHdITmN9opaF0k"}' \
    > test.out 2>&1
eval_tap $? 282 'TestStripeConfig' test.out

#- 283 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "h3pCRB3infEVxArF", "key": "7TB6A6a71zAJpaPe", "mchid": "udUtKPJUmAvxBxJN", "returnUrl": "PlvvYZw4MWzWFTuN"}' \
    > test.out 2>&1
eval_tap $? 283 'TestWxPayConfig' test.out

#- 284 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Pf5JCSDyYy4e5qoT", "flowCompletionUrl": "ZxSoZbQUnUxS6m68", "merchantId": 100, "projectId": 9, "projectSecretKey": "L3HDL4yx5I0euBsc"}' \
    > test.out 2>&1
eval_tap $? 284 'TestXsollaConfig' test.out

#- 285 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'cHPA2v9XP9enfEX7' \
    > test.out 2>&1
eval_tap $? 285 'GetPaymentMerchantConfig' test.out

#- 286 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'lloLgIYqxFfSNJlH' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["CjxLNnYUlGQsFpy9", "ZVlLIFwLgT78noot", "fUs9559ilm3cauhr"], "apiKey": "w9Yn2z5cnbm7z2Aa", "authoriseAsCapture": false, "blockedPaymentMethods": ["4yBTw3wfNGyWf3Vu", "jS7Bq5bcfPW4pPZB", "9YXltCxyztUnj17t"], "clientKey": "3gHBXvjvziexzOLb", "dropInSettings": "OWbtcJUxM3AWyDkA", "liveEndpointUrlPrefix": "5LmART6kulpM4SRt", "merchantAccount": "UE5P4kxmHtFbjqur", "notificationHmacKey": "Hix0QYycDH5we2Mx", "notificationPassword": "0sYCnYPT4i4mxc14", "notificationUsername": "iRfzJwKuc7EpiQEz", "returnUrl": "z5N5osRYO7wbYh7q", "settings": "02W8tkTURUFmqNc8"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateAdyenConfig' test.out

#- 287 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'xhQqptccNorRls7E' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 287 'TestAdyenConfigById' test.out

#- 288 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'C3nDnhFvDlFd7iyZ' \
    --sandbox  \
    --validate  \
    --body '{"appId": "pvWVJFK6ZuvlzGCI", "privateKey": "I156hIg0g8HIxpzm", "publicKey": "9AcFhH4ZlYY3rEuH", "returnUrl": "MWwQNmCQmGCF963C"}' \
    > test.out 2>&1
eval_tap $? 288 'UpdateAliPayConfig' test.out

#- 289 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'bsOawlRBQJH6fNek' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 289 'TestAliPayConfigById' test.out

#- 290 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'hk077gxaj55huTA6' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "AvmW0567BFqbrPIu", "secretKey": "xKmBXLi6GpnqAeMv"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateCheckoutConfig' test.out

#- 291 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'g3w0FQ1520WM3TxW' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 291 'TestCheckoutConfigById' test.out

#- 292 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'XSdTiKdva2UREoBS' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "FtCLy2CqgCG7JwJC", "clientSecret": "DqkzOdFwLJpIPxzL", "returnUrl": "E1V9U1NgpH7Oc44y", "webHookId": "jRdfqZgv34Gqqjel"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdatePayPalConfig' test.out

#- 293 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'cN0GJmPwUTWMx0Mi' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 293 'TestPayPalConfigById' test.out

#- 294 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'PAjnWIhFrqSn4erX' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["EtU1CaD8AqsMCGBN", "hmUt6fzYRn85brTu", "8F7cuCPh1TGZJmgW"], "publishableKey": "NHWnvOBRCt4onqRo", "secretKey": "2PnMSRarKg4coy3A", "webhookSecret": "FpULIn21Nf2FNgDW"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateStripeConfig' test.out

#- 295 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'NC6yh7kgTHlrxKbs' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 295 'TestStripeConfigById' test.out

#- 296 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'V4XtrI7SFBEgkwHi' \
    --validate  \
    --body '{"appId": "fMHYI581HbF7fMX9", "key": "lDXYxGRJM92eX42W", "mchid": "W2WKf5urEOpASBic", "returnUrl": "X3ZwzZ7aVhrkmhSO"}' \
    > test.out 2>&1
eval_tap $? 296 'UpdateWxPayConfig' test.out

#- 297 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'EozGOv8D0iVxzrec' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 297 'UpdateWxPayConfigCert' test.out

#- 298 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '5kNwJAxm0Rdm9l6n' \
    > test.out 2>&1
eval_tap $? 298 'TestWxPayConfigById' test.out

#- 299 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'IhG5SilDDIsmj4h6' \
    --validate  \
    --body '{"apiKey": "25dIsMKWBxF9RAIr", "flowCompletionUrl": "I81ZR2kNzh60RQNa", "merchantId": 94, "projectId": 62, "projectSecretKey": "zlIK2G6AUjBCdf0R"}' \
    > test.out 2>&1
eval_tap $? 299 'UpdateXsollaConfig' test.out

#- 300 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'p5e5IvFuN1oUsCnB' \
    > test.out 2>&1
eval_tap $? 300 'TestXsollaConfigById' test.out

#- 301 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'mGMx5F6EhM3dKvIG' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 301 'UpdateXsollaUIConfig' test.out

#- 302 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '72' \
    --namespace "$AB_NAMESPACE" \
    --offset '81' \
    --region 'Nvq1VR9SJUfQEX99' \
    > test.out 2>&1
eval_tap $? 302 'QueryPaymentProviderConfig' test.out

#- 303 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "Qecxo4bQZO3P2f8T", "region": "TOVf6jrr1OL606Qp", "sandboxTaxJarApiToken": "qCgxt0NgDSj1T6Ed", "specials": ["ALIPAY", "ALIPAY", "WXPAY"], "taxJarApiToken": "FmrLT0HbvS4kSSt3", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 303 'CreatePaymentProviderConfig' test.out

#- 304 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 304 'GetAggregatePaymentProviders' test.out

#- 305 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'yDgf6eFAiqSkHi0B' \
    > test.out 2>&1
eval_tap $? 305 'DebugMatchedPaymentProviderConfig' test.out

#- 306 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 306 'GetSpecialPaymentProviders' test.out

#- 307 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'R2ElF6z6eJKuOW61' \
    --body '{"aggregate": "ADYEN", "namespace": "YoKD7yqCR03RovQZ", "region": "hwfjkq9iyTbyD3D0", "sandboxTaxJarApiToken": "1tRpuuyIagSSzEL8", "specials": ["ALIPAY", "CHECKOUT", "ALIPAY"], "taxJarApiToken": "rKjUbgZQfw6Zys3m", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 307 'UpdatePaymentProviderConfig' test.out

#- 308 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '2L2wlpKBVURxHefz' \
    > test.out 2>&1
eval_tap $? 308 'DeletePaymentProviderConfig' test.out

#- 309 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 309 'GetPaymentTaxConfig' test.out

#- 310 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "77a9fntCNiHBRUNC", "taxJarApiToken": "PSre5GmZzCQwilS3", "taxJarEnabled": false, "taxJarProductCodesMapping": {"xSjlyvR9PxG9Lji2": "Vc88W8aLjIxVGpdO", "qguxvRwI9ZBTipMR": "lhK9DMMaI4ryVDvN", "aruZxwTfh9gEs6GF": "247cbBLjUr5z03wx"}}' \
    > test.out 2>&1
eval_tap $? 310 'UpdatePaymentTaxConfig' test.out

#- 311 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'B3E9hrE9f9COFrOr' \
    --end '6wJDBwIDsJHNg6Tv' \
    --start 'NGjwI4TbTwBufUor' \
    > test.out 2>&1
eval_tap $? 311 'SyncPaymentOrders' test.out

#- 312 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'JouduhCEJ5XiKDIE' \
    --storeId '9YugcupLxVBcRkfh' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetRootCategories' test.out

#- 313 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'RuqkOTHSia7oFd1f' \
    --storeId 'EmDuyAsQGzwJR5po' \
    > test.out 2>&1
eval_tap $? 313 'DownloadCategories' test.out

#- 314 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'I718RQnj4imu6XFf' \
    --namespace "$AB_NAMESPACE" \
    --language 'RcWDXhq1YmGeygr2' \
    --storeId 'S4Yw8NmPaBeryzX2' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetCategory' test.out

#- 315 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'hOPVVFqVqxjq1iG3' \
    --namespace "$AB_NAMESPACE" \
    --language 'TySOh8SI75oXbyq8' \
    --storeId 'FBbur80QwnlgAVfq' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetChildCategories' test.out

#- 316 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'z6gQJh8sn0bVWRkv' \
    --namespace "$AB_NAMESPACE" \
    --language 'mAemh8lioBR7xTXc' \
    --storeId 'EIFod3lCzvjHzDHO' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetDescendantCategories' test.out

#- 317 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 317 'PublicListCurrencies' test.out

#- 318 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 318 'GetIAPItemMapping' test.out

#- 319 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '1vbB7LRHd96dGLgk' \
    --region 'frZveFMWAFT7l0l1' \
    --storeId 'jaOAMCzbsoIgmKww' \
    --appId 'MDQPjUIosq1l6xo0' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetItemByAppId' test.out

#- 320 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'ZnuzgvAZJRm71EC3' \
    --categoryPath 'ENuvD8OPsp5Z3ez8' \
    --features '4KVB7HeWPnVeFdy5' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'Zd7EUoezOLw8C1c5' \
    --limit '2' \
    --offset '28' \
    --region 'BB3XZ7ColKwlsNvt' \
    --sortBy 'createdAt:desc,updatedAt:desc,name:asc' \
    --storeId 'V2emK3JecJA4skqC' \
    --tags 'bPxRkIAFQh9yDdoL' \
    > test.out 2>&1
eval_tap $? 320 'PublicQueryItems' test.out

#- 321 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'E2s7mrVrmTJwtBTz' \
    --region 'QTrNo1LcWNf7xHpi' \
    --storeId '1JZJjIRtCfqDHSlo' \
    --sku '54zSnRN0zGMworzy' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetItemBySku' test.out

#- 322 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'm1z3ZdetOic9AQOF' \
    --region 'WpdItLBhvKJq9tWz' \
    --storeId '9yui8a6jOflFJlZE' \
    --itemIds 'hz1QDeh05hj92bwV' \
    > test.out 2>&1
eval_tap $? 322 'PublicBulkGetItems' test.out

#- 323 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["VxJ62Q5AOAOyL65c", "PaOZA8BG8KcVWOX9", "n3YsjJexnFA9Umz3"]}' \
    > test.out 2>&1
eval_tap $? 323 'PublicValidateItemPurchaseCondition' test.out

#- 324 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '39' \
    --offset '86' \
    --region 'RTPPzwJmKaLCx3gc' \
    --storeId 'idEALWe6RG5wWznu' \
    --keyword '5AjwR1Z4fU7ICcaQ' \
    --language 'tuuKUw3dUwWHhQW3' \
    > test.out 2>&1
eval_tap $? 324 'PublicSearchItems' test.out

#- 325 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'I1y9tjRLVOXBMa0J' \
    --namespace "$AB_NAMESPACE" \
    --language 'iIe1AY0tUA7EKASk' \
    --region '3USNLhOBlxRBLgoh' \
    --storeId 'p8ByTi2F6AyUX8w7' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetApp' test.out

#- 326 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '7riPlPgJcLbeQf9M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 326 'PublicGetItemDynamicData' test.out

#- 327 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'ICxX7xKyCfgwSPz1' \
    --namespace "$AB_NAMESPACE" \
    --language '4asyOdgn77gN8K1F' \
    --populateBundle  \
    --region 'lNkgbFE8U4meK5gr' \
    --storeId 'mPBsFH71VrhsISYt' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetItem' test.out

#- 328 GetPaymentCustomization
eval_tap 0 328 'GetPaymentCustomization # SKIP deprecated' test.out

#- 329 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "egQbNA2WQrHTkJT1", "paymentProvider": "STRIPE", "returnUrl": "kChD3n0c1ryAkRvd", "ui": "PR8gx2rX5dck8NFK", "zipCode": "PgT6LMehg047axU5"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetPaymentUrl' test.out

#- 330 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ktNywRIvO2Sgz30h' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetPaymentMethods' test.out

#- 331 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ejqdktHIO1VdtMSe' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetUnpaidPaymentOrder' test.out

#- 332 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ws1TrU4FhAfKDcDG' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'bMTba1tUlFGcP6eL' \
    --body '{"token": "7EpWtPifmO0JK4dP"}' \
    > test.out 2>&1
eval_tap $? 332 'Pay' test.out

#- 333 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1aZFiSkmhwVVMGkX' \
    > test.out 2>&1
eval_tap $? 333 'PublicCheckPaymentOrderPaidStatus' test.out

#- 334 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WALLET' \
    --region 'BCkcnpxKUxLjmxhB' \
    > test.out 2>&1
eval_tap $? 334 'GetPaymentPublicConfig' test.out

#- 335 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'S6YypRW7fNntaIEt' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetQRCode' test.out

#- 336 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'DI6MbhxkQdezbmf3' \
    --foreinginvoice '92ersoZ2KbMb5jal' \
    --invoiceId '0ruZmBXlGSp85q6f' \
    --payload 'uGfo5wSDHnyabk49' \
    --redirectResult '3I3pvHKDaWhTN1qy' \
    --resultCode 'xpUzWIZWJTDzWguh' \
    --sessionId 'ujw1EoR58uCVldef' \
    --status 'onHJZAiX4abmqqi9' \
    --token '0KTWwZk0HGeJNaBj' \
    --type 'VdMB5kMzKycYrhr4' \
    --userId 'FnNzdT4pWwIVXp9a' \
    --orderNo 'vUr6IydpXW0MO0eT' \
    --paymentOrderNo '9okl6MlWOl9feWO2' \
    --paymentProvider 'ADYEN' \
    --returnUrl '6KS71Xs1BphA9BXp' \
    > test.out 2>&1
eval_tap $? 336 'PublicNormalizePaymentReturnUrl' test.out

#- 337 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'KYgF9OuigDP0Vjmy' \
    --paymentOrderNo '7j2BrdCAm3slCwaB' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 337 'GetPaymentTaxValue' test.out

#- 338 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'wLi3GOQkLtpuRNeT' \
    > test.out 2>&1
eval_tap $? 338 'GetRewardByCode' test.out

#- 339 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '1CULEMPaOU5nukyc' \
    --limit '54' \
    --offset '54' \
    --sortBy 'namespace:asc,rewardCode:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 339 'QueryRewards1' test.out

#- 340 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'GyZS0I8FevJiT98H' \
    > test.out 2>&1
eval_tap $? 340 'GetReward1' test.out

#- 341 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicListStores' test.out

#- 342 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'UBp56Q4WETxtGMs5,tPKPuK0K4PiMDTR7,LxihuOn57io0d9dG' \
    --itemIds '3yzaNbGeASX83SLi,IbAP2qyUnHnfrEdD,fY4TTxu8goZgsX4R' \
    --skus 'wfM4qnUdcQqZ9F1u,ivPob0YZEuXQACDD,QryNf9VGxbOeJe4n' \
    > test.out 2>&1
eval_tap $? 342 'PublicExistsAnyMyActiveEntitlement' test.out

#- 343 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '9eUlBQZ2UGePWXbA' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 344 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'Sw1t653G3ydYmGzv' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 345 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'onrUXVlB6xNel4Bx' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 346 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'b9KwFYqdhEVq3hbs,ApeASfR0ljKxqZcL,uhwNDvValv3bkoMX' \
    --itemIds 'Nzl1ywEPiunixlEA,HZzHs8x5oPSkZFIV,2feXnTRlzAJy9oFO' \
    --skus 'HB2KEsIdtozVltBh,oXE4wgcYT5CdjaJu,UzFIeqaVr1CE1gu6' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetEntitlementOwnershipToken' test.out

#- 347 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "cYuzC77J4irvZ9tk", "language": "dxC-iMBN-327", "region": "Ew6IIpDc9X5ijmtD"}' \
    > test.out 2>&1
eval_tap $? 347 'SyncTwitchDropsEntitlement' test.out

#- 348 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'Gvd9ESdY0eTkBWA4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'PublicGetMyWallet' test.out

#- 349 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '4Qqsi5yOjvl5sRN2' \
    --body '{"epicGamesJwtToken": "ENn1RLi5iMPnbg7o"}' \
    > test.out 2>&1
eval_tap $? 349 'SyncEpicGameDLC' test.out

#- 350 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1zYpqUsliPyXZGYI' \
    --body '{"serviceLabel": 62}' \
    > test.out 2>&1
eval_tap $? 350 'PublicSyncPsnDlcInventory' test.out

#- 351 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDtWbdkzPP47RcUI' \
    --body '{"serviceLabels": [17, 58, 68]}' \
    > test.out 2>&1
eval_tap $? 351 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 352 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AlYRAqCAC2gy1WF9' \
    --body '{"appId": "QLNgDxAkwgfB8jIe", "steamId": "cOx5ugNCDd6jW6fj"}' \
    > test.out 2>&1
eval_tap $? 352 'SyncSteamDLC' test.out

#- 353 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'tBcO3fWq9qfmBv0X' \
    --body '{"xstsToken": "gJB6a7uykADFpinF"}' \
    > test.out 2>&1
eval_tap $? 353 'SyncXboxDLC' test.out

#- 354 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'cH2ZMSYijqEuMfuY' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'HChRPHvdkcKW21B5' \
    --features 'EFtD2pYaKTz1gcE2,XCwTkRUIX6IFHNmB,9mYBvtOwxjqyrjDA' \
    --itemId 'peN5eAfRqSgH5xIu,BTYOdsvNyk52MQFk,VVEf36S7yPgG48bk' \
    --limit '83' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 354 'PublicQueryUserEntitlements' test.out

#- 355 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lgZrn0I6T0hvcAFT' \
    --appId 'aSWR4VOGIY7hM6uh' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetUserAppEntitlementByAppId' test.out

#- 356 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'onkAe0FdTSSEluBx' \
    --limit '80' \
    --offset '75' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 356 'PublicQueryUserEntitlementsByAppType' test.out

#- 357 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4rfSbbSlDPGf9Fn3' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'bTi2m7eNsYEqKkeu' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetUserEntitlementByItemId' test.out

#- 358 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWDfeFeExlOFjRh8' \
    --entitlementClazz 'CODE' \
    --sku 'nI2sMrEgl7ZR1HCk' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetUserEntitlementBySku' test.out

#- 359 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2Sw78lLGKjDHuXt' \
    --appIds '358gzqRMuMPrIekx,q58fikq83hqJ7HP6,3Se6kVW5fkl60ImL' \
    --itemIds 'Bv6nUU0r1rfX9stp,vJUuyPdzx8BM2wEg,TtLRT5stwQFUEbTP' \
    --skus 'Q8p7VMlxEXnqHwMy,KpwphjUXvM1GqMkZ,44UXgdBqtJaRyDlP' \
    > test.out 2>&1
eval_tap $? 359 'PublicExistsAnyUserActiveEntitlement' test.out

#- 360 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9qIZJ5Krx6KkHagE' \
    --appId 'ugKJxkU8Y58COtTN' \
    > test.out 2>&1
eval_tap $? 360 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 361 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jnNSikJDg6ujKvq0' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'jVVx5l3yrH9HR4re' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 362 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'G0HwUXxQTf5YpDUG' \
    --ids 'YsJBEkYUrLv4qUiT,kFcLBrg2JB0WiCpV,BwvAffJ3btt0PpQY' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 363 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '3Pnnic80yEO8dL6J' \
    --entitlementClazz 'CODE' \
    --sku 'V271bwZ4niLSzQnv' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 364 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '0C00dtNGGzbGYSYo' \
    --namespace "$AB_NAMESPACE" \
    --userId '9fY2EBZAHQXc4Xca' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetUserEntitlement' test.out

#- 365 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'e7VKl0ARzGEArlfE' \
    --namespace "$AB_NAMESPACE" \
    --userId '1NSmtcADoZvd0La7' \
    --body '{"options": ["P4JI4H7uDzkOHTdn", "UtdrRcs3GeOsKPNl", "G7rEXi6LEqJERpbx"], "requestId": "Eq07txnvZZeAf7QB", "useCount": 42}' \
    > test.out 2>&1
eval_tap $? 365 'PublicConsumeUserEntitlement' test.out

#- 366 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'xTdt2K1CzpQWslNG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nLYUYR0yOvJhUjzc' \
    --body '{"requestId": "MtwINUlrhIpnlam2", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 366 'PublicSellUserEntitlement' test.out

#- 367 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '7wZJsg7wSv9lyRyT' \
    --body '{"code": "dYBUljvBzvYNEtfg", "language": "Kgw", "region": "kt18cQ677SotDEtU"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicRedeemCode' test.out

#- 368 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2xBSEQ8rBKc2K6oJ' \
    --body '{"excludeOldTransactions": true, "language": "xmfe", "productId": "hCc9onSNjbQEqFGw", "receiptData": "nDG8kz4kvEv6tNjG", "region": "RhrmRAxRGeIKGlCJ", "transactionId": "mDXpjyvLSHB1y3kl"}' \
    > test.out 2>&1
eval_tap $? 368 'PublicFulfillAppleIAPItem' test.out

#- 369 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuAGnidOyGuS0OG7' \
    --body '{"epicGamesJwtToken": "ohiL2943ClrNhEdx"}' \
    > test.out 2>&1
eval_tap $? 369 'SyncEpicGamesInventory' test.out

#- 370 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'd24ZKfvMf1T5FzYM' \
    --body '{"autoAck": false, "language": "JIAd_BOTS", "orderId": "cuEtWAF763kci7lT", "packageName": "62BOHaso53W3U2Mu", "productId": "9ZGMWou1U0RVCf3g", "purchaseTime": 80, "purchaseToken": "JFX1ZHV9yo9Ur1hf", "region": "hmGEKuVUZdCacRGa"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicFulfillGoogleIAPItem' test.out

#- 371 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'taPrcgTcA71dtqtS' \
    --body '{"currencyCode": "UN4zvBzGh3mhIDNu", "price": 0.6249531478918761, "productId": "BZegHtB9uTCiiIoM", "serviceLabel": 19}' \
    > test.out 2>&1
eval_tap $? 371 'PublicReconcilePlayStationStore' test.out

#- 372 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'CjGiOZJpUf9RpcfE' \
    --body '{"currencyCode": "Qn0O6D8PGQuazAyp", "price": 0.10531476764712933, "productId": "WhTED5YmPTBUkm2F", "serviceLabels": [49, 44, 38]}' \
    > test.out 2>&1
eval_tap $? 372 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 373 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'aCokoGynp6xcqNKJ' \
    --body '{"appId": "nAhrSt96OaARAjHL", "currencyCode": "GV3sNxS8uLBZiVRY", "language": "pZSr", "price": 0.30309309249741334, "productId": "lTEqgVNG8Aqktgvj", "region": "wNJAwIpEy2ZNpojZ", "steamId": "24I2n25smsrmJFHG"}' \
    > test.out 2>&1
eval_tap $? 373 'SyncSteamInventory' test.out

#- 374 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iYnyhbqxLuTZIxgi' \
    --body '{"gameId": "Uaiyy0aWrshpmb1C", "language": "SLN", "region": "WrbNRE0xyYPUZHyL"}' \
    > test.out 2>&1
eval_tap $? 374 'SyncTwitchDropsEntitlement1' test.out

#- 375 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQ52IjGpRJCUJpsc' \
    --body '{"currencyCode": "OTkWETSJ04c5MGIn", "price": 0.660620158232274, "productId": "4yznh2YpZvvmziSS", "xstsToken": "iSpXeWOGayfRkQvo"}' \
    > test.out 2>&1
eval_tap $? 375 'SyncXboxInventory' test.out

#- 376 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'N06SpNOnuSksfm7h' \
    --itemId 'cIFdkdrwAcK2lUda' \
    --limit '79' \
    --offset '16' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 376 'PublicQueryUserOrders' test.out

#- 377 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9FgvfhiLEAkA7n65' \
    --body '{"currencyCode": "16ydoRT1qZBrdTnG", "discountedPrice": 36, "ext": {"VemsbkaXZQ6nTj9r": {}, "ZpkSntuOeaPAyPeE": {}, "GBepK1Ix4SwjCYjC": {}}, "itemId": "HniVSn1gYGal5NrB", "language": "fvy", "price": 76, "quantity": 83, "region": "UOdfEmoIYwSxxAsf", "returnUrl": "wDMivWqHHGlnAnEu", "sectionId": "6EKYceTEqYudHlA4"}' \
    > test.out 2>&1
eval_tap $? 377 'PublicCreateUserOrder' test.out

#- 378 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AxeEIfUxJ2xMSNNB' \
    --userId 'xCeN3pGn46fGvodt' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetUserOrder' test.out

#- 379 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '413MRdG8qAPiANv2' \
    --userId 'Ar8yXV6qf6v5SgcJ' \
    > test.out 2>&1
eval_tap $? 379 'PublicCancelUserOrder' test.out

#- 380 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PZPUh2nHQwpWi8HZ' \
    --userId '6C0VJ0fK2m6lQ5Ao' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetUserOrderHistories' test.out

#- 381 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8TITYiHSR2SEJh1Y' \
    --userId 'DedZdNqkXPWZfT8Z' \
    > test.out 2>&1
eval_tap $? 381 'PublicDownloadUserOrderReceipt' test.out

#- 382 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdKp9q4nXuK0tJAY' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetPaymentAccounts' test.out

#- 383 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'ror2XdtSCG7ZExOo' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'J57t6OcYPQ5bk5Ie' \
    > test.out 2>&1
eval_tap $? 383 'PublicDeletePaymentAccount' test.out

#- 384 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'uAi3zWFGorCbncoj' \
    --language '5RvEtXiKyUGdNfMi' \
    --region 'wgSvsTRmJsOm0wVF' \
    --storeId 'yHvFhRMCFJuA0DEM' \
    --viewId 'gykqqjoHTpIPMSRA' \
    > test.out 2>&1
eval_tap $? 384 'PublicListActiveSections' test.out

#- 385 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPI7mSZQ5UDm1q51' \
    --chargeStatus 'NEVER' \
    --itemId 'lW2HG8LAiIzuo321' \
    --limit '76' \
    --offset '56' \
    --sku 'l90IBFsSb3FsV2Pn' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 385 'PublicQueryUserSubscriptions' test.out

#- 386 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 's9R0D5jZEwxcow6L' \
    --body '{"currencyCode": "7c3COEP4AZx70uwV", "itemId": "4XgvGTMHkXeEwuFJ", "language": "DE_mQDH", "region": "ZI0fKW8LeQxItaK6", "returnUrl": "s3Hha69MgxjGJx62", "source": "mkfVlu4bGB1pyk0P"}' \
    > test.out 2>&1
eval_tap $? 386 'PublicSubscribeSubscription' test.out

#- 387 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pxXZDy5Pmbu7RrD9' \
    --itemId 'a5mdlXTCL467xHbA' \
    > test.out 2>&1
eval_tap $? 387 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 388 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iD3Pr3mXZO1PnbSl' \
    --userId 'fVRlAI8F2f3mEv09' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetUserSubscription' test.out

#- 389 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kAA5hnQtd4bcivHG' \
    --userId 'IEplRpcHDWcIoJ45' \
    > test.out 2>&1
eval_tap $? 389 'PublicChangeSubscriptionBillingAccount' test.out

#- 390 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'L0Ze3YamxKDSZTl4' \
    --userId 'UiJSCbG4UmG3TkMT' \
    --body '{"immediate": true, "reason": "gPuNtOv3jbhGBuW8"}' \
    > test.out 2>&1
eval_tap $? 390 'PublicCancelSubscription' test.out

#- 391 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'KcyPMfDWSEEpKoJl' \
    --userId 'mhMQUCx70QjYbzem' \
    --excludeFree  \
    --limit '84' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetUserSubscriptionBillingHistories' test.out

#- 392 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'eJRsXNeveQXqnFRY' \
    --language 'mEIX40XOUoLOa7oD' \
    --storeId 'z00gxcoaH6u9TVf4' \
    > test.out 2>&1
eval_tap $? 392 'PublicListViews' test.out

#- 393 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'DvEzpoPRiClZ6rlw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X99AHMLHqguYykVW' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetWallet' test.out

#- 394 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'zNwPcvGyieBsRUdu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W5lxSlorWEGN5bPG' \
    --limit '91' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 394 'PublicListUserWalletTransactions' test.out

#- 395 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'SiiItrSrEJMBAIwT' \
    --baseAppId 'LkrMDFQfpQ9o0GJM' \
    --categoryPath 'TfqRRaZozM8xCBoa' \
    --features 'S2FMwfWNCbN5GelV' \
    --includeSubCategoryItem  \
    --itemName 'OU0hHnsCl5k6Jxh5' \
    --itemStatus 'ACTIVE' \
    --itemType 'SUBSCRIPTION' \
    --limit '21' \
    --offset '28' \
    --region 'mQzKg0jWCjpGwh7p' \
    --sectionExclusive  \
    --sortBy 'updatedAt,updatedAt:desc,displayOrder' \
    --storeId 'T1C6KGTpA7JZ6xul' \
    --tags 'lPROSfiW9zcxmgNf' \
    --targetNamespace 'THu3vkZt9FgWckjN' \
    > test.out 2>&1
eval_tap $? 395 'QueryItems1' test.out

#- 396 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pHhM2ZXp4N0ROmUC' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 396 'ImportStore1' test.out

#- 397 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TrS7Gi9Iigk9vamO' \
    --body '{"itemIds": ["7Q2WQwSWqSs05rjI", "Sy4B0X9AJdkT7UYC", "V8agvwOI2LlOQNRN"]}' \
    > test.out 2>&1
eval_tap $? 397 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE