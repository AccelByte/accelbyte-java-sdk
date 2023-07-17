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
echo "1..410"

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
    --body '{"context": {"item": {"appId": "EAxcVpFrttufHIRd", "appType": "SOFTWARE", "baseAppId": "9UzVRiXbqlAw7r6W", "boothName": "2ktQG0h5JAav5kRa", "boundItemIds": ["ZLCXLx8bbgorQeFb", "62WopBJHPtcDs8bB", "Q1g7qbPngUNB1vRo"], "categoryPath": "dwpzS6DaDpv8N7ZQ", "clazz": "VqGj6oDLjWjkY1aX", "createdAt": "1977-05-08T00:00:00Z", "description": "FcDtgOjchIua5tWE", "displayOrder": 71, "entitlementType": "DURABLE", "ext": {"JSDgY1TXp38zsCTC": {}, "rbCbPOyNQkT7NvyE": {}, "3cwyALczNIicXm7a": {}}, "features": ["T5FvdiRilZ7oFgx4", "gSrjJW2OQNOs1PXh", "c8OumKtPDKJDXn7Z"], "fresh": false, "images": [{"as": "68su8XfqlqNiTvB6", "caption": "SdAdIhUDrwoZ5Mec", "height": 7, "imageUrl": "pc1C8XfwHuKeb9l3", "smallImageUrl": "rGN9A3sNm84hddSp", "width": 69}, {"as": "cBdW19m4eu6d5tA5", "caption": "jUmiTqpyhPFdxLzF", "height": 87, "imageUrl": "d8lDR6qVNPRZYdFL", "smallImageUrl": "IAjGGJddVCvu9vx5", "width": 76}, {"as": "vkLGMS0lyuI9a2I9", "caption": "u6Vpbsx5w8hqUI06", "height": 96, "imageUrl": "SuB0y5WUlrMdI4sN", "smallImageUrl": "veabntBSxTeIv53H", "width": 66}], "itemId": "YupD391C2qtPYoka", "itemIds": ["hFjkQsfCaTmt1d67", "FXGk2s9Q0mPVo3tw", "u0MesTCf9x4rt69l"], "itemQty": {"na7qxNeIxPz6MbwL": 67, "IY69z1UaLqYSYWyt": 77, "XQ0yYoNRKd3IL5TA": 87}, "itemType": "CODE", "language": "6iiPlSC2uE4o5Vwd", "listable": false, "localExt": {"m3MqHcUmLZZbSqb8": {}, "RwNmn9HrNQy4uZAA": {}, "iE0mit9RGCCHYzUO": {}}, "longDescription": "cEdscKHPEqgA8yu7", "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 94, "duration": 22, "endDate": "1994-05-19T00:00:00Z", "itemId": "Jt4Ymos9Jcdos4fY", "itemSku": "cTVU6RBt0zYoMcHy", "itemType": "CUEXlAvxJMdalwSy"}, {"count": 23, "duration": 85, "endDate": "1975-11-14T00:00:00Z", "itemId": "bOItRMvqtlB2jJCS", "itemSku": "QT279ZZPYGu0rdlg", "itemType": "dWyOtXi3choQrpOs"}, {"count": 61, "duration": 25, "endDate": "1985-08-26T00:00:00Z", "itemId": "U5SepjChB3V0v52D", "itemSku": "lym6puQ23xoJ8aeC", "itemType": "naLpUKp44YUDjasW"}], "name": "IPUvmEejtGeoyIPa", "odds": 0.9714507862859705, "type": "REWARD", "weight": 90}, {"lootBoxItems": [{"count": 7, "duration": 37, "endDate": "1977-06-26T00:00:00Z", "itemId": "ykmoPYgc2L4jk4Lo", "itemSku": "0LSP0pf4IxjUkl53", "itemType": "5X3ateEKDpADz1x3"}, {"count": 32, "duration": 30, "endDate": "1985-08-29T00:00:00Z", "itemId": "9xv32e8c5csSovoq", "itemSku": "sZNBdte9NDUPVJf6", "itemType": "c2Z0QZxfgPubTDIH"}, {"count": 36, "duration": 83, "endDate": "1982-11-17T00:00:00Z", "itemId": "qAThuwjRHpKKTlmV", "itemSku": "r9XuoJbRFQSKVPHb", "itemType": "n4Xxtu7LQRENjEEz"}], "name": "tx1WsYSiZqan0nSB", "odds": 0.5728983498865392, "type": "REWARD", "weight": 30}, {"lootBoxItems": [{"count": 0, "duration": 57, "endDate": "1981-10-04T00:00:00Z", "itemId": "91GXlvPG6bFYReVH", "itemSku": "QipcCx9Zw5D2L7vI", "itemType": "YhGGSyEW4ZJJ42d3"}, {"count": 85, "duration": 25, "endDate": "1985-03-04T00:00:00Z", "itemId": "ddN8S48l9lyNApfl", "itemSku": "xqMrj3oZk03QXcKM", "itemType": "DYDDxHSZjtqXyJ58"}, {"count": 10, "duration": 36, "endDate": "1977-09-29T00:00:00Z", "itemId": "jX9fDmIbeZxzfTcy", "itemSku": "iuATus9hsfpFDcSD", "itemType": "G8aMVGLiBNrDjqox"}], "name": "cwgGLXpUL4pp2ncY", "odds": 0.422365902819149, "type": "REWARD_GROUP", "weight": 21}], "rollFunction": "CUSTOM"}, "maxCount": 39, "maxCountPerUser": 82, "name": "fIovmv9gsR5cJcHm", "namespace": "3SZLxoRDFuuuySj2", "optionBoxConfig": {"boxItems": [{"count": 56, "duration": 1, "endDate": "1975-06-17T00:00:00Z", "itemId": "LJE8HoRS1X2PFAAM", "itemSku": "wzHPxB1UskYs4Yw2", "itemType": "0DOqOBSC2DKHRuPM"}, {"count": 80, "duration": 22, "endDate": "1995-02-07T00:00:00Z", "itemId": "H8Yb33T5UBJCjfcn", "itemSku": "LRfxeCSz9WEi8Kll", "itemType": "oeH0JT1yduat2vQR"}, {"count": 3, "duration": 66, "endDate": "1975-02-16T00:00:00Z", "itemId": "Bfsu4jmsRE2w1yEk", "itemSku": "Lgh3tIYt4SqYUTLD", "itemType": "x9gIiDandpGT2t24"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 83, "comparison": "isLessThan", "name": "Mh5eC3IHeHSKLCa3", "predicateType": "SeasonPassPredicate", "value": "AE7WIsfmx40NLRc6", "values": ["oKFeIaFQCYoDPICp", "m8heKnWhzfe2Nube", "nduEEQlULdJz4mnR"]}, {"anyOf": 56, "comparison": "is", "name": "CAcf80zfFyabWAgI", "predicateType": "SeasonTierPredicate", "value": "hRkloqxM3gpwxcfM", "values": ["Wn3CO39PXDNxtXge", "y9XzjjI5YbsKoADk", "zJEN2VHzih3bit0V"]}, {"anyOf": 83, "comparison": "isLessThanOrEqual", "name": "3FgkXhjDzaQY3snn", "predicateType": "EntitlementPredicate", "value": "ZkP7cFdP43e5dC9X", "values": ["qU0bfoMm5cTtFWbo", "IBudfZgrbHDIDm4h", "MzF4TxodenSrUTvf"]}]}, {"operator": "or", "predicates": [{"anyOf": 4, "comparison": "isLessThanOrEqual", "name": "6IjGa23YvYmmDg7V", "predicateType": "SeasonPassPredicate", "value": "PXIuvUYTZBRujIUE", "values": ["urjh2imdb4rbkXj0", "ZwsVC0gL97ZVJSPq", "1Tq5jyAZvkRCMNFI"]}, {"anyOf": 74, "comparison": "isNot", "name": "iwv1qlYB1RSKs6gQ", "predicateType": "SeasonPassPredicate", "value": "ZGF7uYnGzpipNDig", "values": ["D9eOziYRFOn0jJLH", "NJma1MbqqZtfNWql", "4nmwAft4gqkNNlWk"]}, {"anyOf": 58, "comparison": "isNot", "name": "LxhvNXTwGBCtohLt", "predicateType": "EntitlementPredicate", "value": "7MUBG7qtPu64yAtU", "values": ["RKLRkb738HGS6rDg", "MdIIlhS1fSiM9331", "m7Ta1PsKc50Kv6ec"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isNot", "name": "mQoIXimBJehyxlNs", "predicateType": "EntitlementPredicate", "value": "nGBt4P7WnbdSJtjX", "values": ["UTrDzZSKscfOcYu3", "7ZshZyZl5x4bRXBH", "dpCROYqUiGKXVFCm"]}, {"anyOf": 31, "comparison": "isGreaterThan", "name": "ogaKt2ujQSa3Zdb6", "predicateType": "SeasonTierPredicate", "value": "UXmy0Zp6iIaTIKUk", "values": ["1fiP80G9Pclxcft2", "mkk9QM0NBMA9ORxp", "zwLR2AK6eXUGPJsw"]}, {"anyOf": 42, "comparison": "is", "name": "DpZxkrQDXuNFviMa", "predicateType": "SeasonPassPredicate", "value": "uGKHhMRWLVd3DlhL", "values": ["X2tJoARtdbBe7uds", "uIpomM8sm1MiaI1m", "Mrok0WvGYYnx4V70"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 49, "fixedTrialCycles": 9, "graceDays": 2}, "region": "ue9nzJ6fH24T805t", "regionData": [{"currencyCode": "Vg8JqU0jZpjvsugA", "currencyNamespace": "OS7u8RiWyerCSa8S", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1997-06-30T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-01-29T00:00:00Z", "discountedPrice": 55, "expireAt": "1979-03-16T00:00:00Z", "price": 36, "purchaseAt": "1998-10-10T00:00:00Z", "trialPrice": 16}, {"currencyCode": "xsB0NRsB1fPqqRRu", "currencyNamespace": "lpqpymDkQhtrHWwR", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1995-08-07T00:00:00Z", "discountedPrice": 56, "expireAt": "1991-10-31T00:00:00Z", "price": 33, "purchaseAt": "1983-12-03T00:00:00Z", "trialPrice": 68}, {"currencyCode": "wbhMssAHjapIkY9R", "currencyNamespace": "f4wP57dBZNR88YbC", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1977-01-29T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1992-07-15T00:00:00Z", "discountedPrice": 82, "expireAt": "1977-11-12T00:00:00Z", "price": 10, "purchaseAt": "1984-07-26T00:00:00Z", "trialPrice": 4}], "saleConfig": {"currencyCode": "VrjfGXZnqAQUoY1G", "price": 20}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "Zp50CnPb71ORYcmQ", "stackable": false, "status": "INACTIVE", "tags": ["aKQDOJvrTefglSs6", "U5JX8ccLjMXJRk0e", "g4iY9u02aCNYIWek"], "targetCurrencyCode": "p18lOC3mNqF7Bl0L", "targetItemId": "cghVHfPEspxwhRON", "targetNamespace": "0bc1eMbEIjowLqc3", "thumbnailUrl": "ecjXJbZDKKoxLE1Y", "title": "3Dymtj3giPg4x4yi", "updatedAt": "1992-03-11T00:00:00Z", "useCount": 1}, "namespace": "6ues1Hhhkg1yLVbL", "order": {"currency": {"currencyCode": "FzHEP8cM4NTwr0KH", "currencySymbol": "aAsmTej52WKi6tAr", "currencyType": "VIRTUAL", "decimals": 46, "namespace": "URt9plCSVq8PdH6h"}, "ext": {"JPUAc0RVwXgAgntL": {}, "MCuaXBWQi6BqPg4x": {}, "r0lCancUZGCHsZYo": {}}, "free": false}, "source": "DLC"}, "script": "R1KtOv7Zy0b65uvu", "type": "grantDays"}' \
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

#- 19 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetLootBoxPluginConfig' test.out

#- 20 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "6jHMA2rG3nakopAy"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "NgqRqCV7usamANkZ"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateLootBoxPluginConfig' test.out

#- 21 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeleteLootBoxPluginConfig' test.out

#- 22 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 22 'UplodLootBoxPluginConfigCert' test.out

#- 23 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 23 'GetLootBoxGrpcInfo' test.out

#- 24 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetSectionPluginConfig' test.out

#- 25 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "w0qiOiC4j0iktm0Z"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "LkLOsp0LZ5njN86H"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateSectionPluginConfig' test.out

#- 26 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'DeleteSectionPluginConfig' test.out

#- 27 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 27 'UploadSectionPluginConfigCert' test.out

#- 28 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZvRrvr0n9d9lvccK' \
    > test.out 2>&1
eval_tap $? 28 'GetRootCategories' test.out

#- 29 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MLhrTrcBE2ItBS3K' \
    --body '{"categoryPath": "tKZWe8aoFzAyBME7", "localizationDisplayNames": {"4HUtipUWYhWV1qx8": "CzPML52faXUr9Sk4", "lq2faBcAXXKlhvyH": "8paOJtxqMPpcVfRw", "Nj547fH0XrKEDpEY": "8VnocGAjci0V3tBf"}}' \
    > test.out 2>&1
eval_tap $? 29 'CreateCategory' test.out

#- 30 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '2jnHGKXphn50c9tN' \
    > test.out 2>&1
eval_tap $? 30 'ListCategoriesBasic' test.out

#- 31 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'LDljhZ2jxLRX3z46' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OCaGBeMfPlNos4yB' \
    > test.out 2>&1
eval_tap $? 31 'GetCategory' test.out

#- 32 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'RjrERHEonAZR8GmE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u0q1p6QCyY6vSkVF' \
    --body '{"localizationDisplayNames": {"WdsbYuVEGVxYheR3": "j5mNZ6vwv7K8Asvt", "1j1Rx59hesNWy2Nv": "Z85DDKDAF8KDsBZO", "uYQJ03BAHZ7c53q7": "akMpcmnnx6RVBrop"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCategory' test.out

#- 33 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '9v7aZK3h65hbN15z' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fQSfQrtfF3TQN0Oc' \
    > test.out 2>&1
eval_tap $? 33 'DeleteCategory' test.out

#- 34 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'NDLr36vzohZyjMQA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g5mPYhrLTyU8Ohgf' \
    > test.out 2>&1
eval_tap $? 34 'GetChildCategories' test.out

#- 35 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'Y9JQYGF4bYXEcENx' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9xZlAchob44lONDD' \
    > test.out 2>&1
eval_tap $? 35 'GetDescendantCategories' test.out

#- 36 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'wMvgI0HlyPR7wZNi' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '99' \
    --code 'YqeKN0meGelYF5wW' \
    --limit '1' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 36 'QueryCodes' test.out

#- 37 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'alncV7vWgSHdfo07' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 95}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCodes' test.out

#- 38 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'PkmSu4PWam1jxR7S' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '62' \
    > test.out 2>&1
eval_tap $? 38 'Download' test.out

#- 39 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'QBErxgjVBycvU4Pb' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '25' \
    > test.out 2>&1
eval_tap $? 39 'BulkDisableCodes' test.out

#- 40 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'O05oKqymxLD1Lcvw' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '0' \
    > test.out 2>&1
eval_tap $? 40 'BulkEnableCodes' test.out

#- 41 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'T6mZEiwxxElpMYSW' \
    --namespace "$AB_NAMESPACE" \
    --code 'IeVzm7z9noowmlTI' \
    --limit '76' \
    --offset '98' \
    --userId 'hCFkIf5weqZ18MH5' \
    > test.out 2>&1
eval_tap $? 41 'QueryRedeemHistory' test.out

#- 42 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '7l2Zsrh90ETtYmGu' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 42 'GetCode' test.out

#- 43 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'kz3MnlrjcHp6B8Vj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'DisableCode' test.out

#- 44 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '7rXFgDnDkdZ9bpjb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'EnableCode' test.out

#- 45 GetServicePluginConfig
eval_tap 0 45 'GetServicePluginConfig # SKIP deprecated' test.out

#- 46 UpdateServicePluginConfig
eval_tap 0 46 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 47 DeleteServicePluginConfig
eval_tap 0 47 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 48 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 48 'ListCurrencies' test.out

#- 49 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "TaLQjctvrK2jhsYp", "currencySymbol": "KPlXn77AtYoFzLAA", "currencyType": "VIRTUAL", "decimals": 84, "localizationDescriptions": {"P8P3cfoivvQxevec": "Ww7Rry0KK5rgAGO0", "dW8rX2MVUGKSZ4Gc": "Lkt4pK32sJxlZcCT", "pTdRtCHvuk6B6XTm": "SLyn50sigBVZxiKd"}}' \
    > test.out 2>&1
eval_tap $? 49 'CreateCurrency' test.out

#- 50 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'V57GvRyd9UuL02Le' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"8HSCslsDd4M1F5qR": "IblS7Nz81GRazPAA", "NjfBoldFOyqA2clJ": "5gEOaCgM6Yn6Rugb", "NEIpGBFUjOn5mM7k": "8nbLzvtCIW5ynMKq"}}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateCurrency' test.out

#- 51 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'uUicAeIVXtoWAXhM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'DeleteCurrency' test.out

#- 52 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'lW4tLqX7OICf5oD1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetCurrencyConfig' test.out

#- 53 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'e6oI9FmYel0kOw72' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencySummary' test.out

#- 54 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetDLCItemConfig' test.out

#- 55 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "o8Zkgk0jS6rDWUwf", "rewards": [{"currency": {"currencyCode": "hKvrf2AaH4yCWrHS", "namespace": "ppnIZkNnTn3rzH5N"}, "item": {"itemId": "vAtcvNedgS1fUfKm", "itemSku": "ihDbmu8ePWlQMVDX", "itemType": "EHeiGTnwyEw6hIWD"}, "quantity": 46, "type": "ITEM"}, {"currency": {"currencyCode": "yo4nIRysQdbufXjY", "namespace": "nSoIFeouC2m38kXr"}, "item": {"itemId": "DZWlGVE9sJ4NpUtK", "itemSku": "p6M9I6nEwnZhsjwJ", "itemType": "eGwaPSDMZz95OYKi"}, "quantity": 33, "type": "ITEM"}, {"currency": {"currencyCode": "aZD63xe5rruJVfLG", "namespace": "ea0ZtlzUcuHAXz0U"}, "item": {"itemId": "V31MfuGaXsAuGsZa", "itemSku": "SHevO0TQNEI3kfab", "itemType": "xJWWSI1ECUo1NPpe"}, "quantity": 64, "type": "CURRENCY"}]}, {"id": "3ShEh8PbGikLjgjc", "rewards": [{"currency": {"currencyCode": "j34uulU6FYBZsWFb", "namespace": "r3RSP0W9nBhvhf8Q"}, "item": {"itemId": "0DtJMcYQdN66bswA", "itemSku": "gt65X4N1LQZmB61J", "itemType": "MdtwCVUrYQue84dw"}, "quantity": 26, "type": "CURRENCY"}, {"currency": {"currencyCode": "bwFEnAZaWsQJtRYo", "namespace": "agRJK5PX9UcOvhPy"}, "item": {"itemId": "E11TRT2SKseoe8VL", "itemSku": "ie0LBa36KNzjf005", "itemType": "CXNGehQ2aTjTDfKF"}, "quantity": 61, "type": "ITEM"}, {"currency": {"currencyCode": "XC7eGL5YhJDWh9YW", "namespace": "qc0qgV6d9yOfIMLd"}, "item": {"itemId": "s2DbPcaoMdtRLTmS", "itemSku": "vTkQQgB7exYvmHMx", "itemType": "r5hPCJJztJBg0tTJ"}, "quantity": 12, "type": "CURRENCY"}]}, {"id": "6IewOXE2AkCh3QIZ", "rewards": [{"currency": {"currencyCode": "sUf8lGFXcmwTERHc", "namespace": "lOdxIwqejxe18rNd"}, "item": {"itemId": "b8Otq6j1mqUav7k0", "itemSku": "5HAQltnSojV4jT65", "itemType": "yclX2FtAz0vJjFIY"}, "quantity": 99, "type": "CURRENCY"}, {"currency": {"currencyCode": "OaNdsimmkW2miH3x", "namespace": "RHAKy4QxZkaXZ7vm"}, "item": {"itemId": "iEd0JPxVyQpshaDw", "itemSku": "NqTbbFMXAMfVXe0G", "itemType": "ZeMgsRsmH1EQrYmk"}, "quantity": 85, "type": "CURRENCY"}, {"currency": {"currencyCode": "KTPOlhTtSiZNCxuo", "namespace": "gFteTHJe4BhSSQkQ"}, "item": {"itemId": "D6WmOt6D7ufFVTOh", "itemSku": "vQpfbBke8aEdd36x", "itemType": "j6wySoltDxsbzxrl"}, "quantity": 1, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateDLCItemConfig' test.out

#- 56 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'DeleteDLCItemConfig' test.out

#- 57 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetPlatformDLCConfig' test.out

#- 58 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"iS76YApGJ9ufwLYk": "qIgLuZS6hsQryiEt", "OAbpeUNf26UqkCfg": "CUYBn2xaOBdPF0Jm", "X8qwU1cTuHHPB5S3": "DvPRCzBrVUxmDOj3"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"Gs9yxahld1pO0Gyf": "5PO3COyMvczgEpzZ", "3FbtxfhcRC7IVYa6": "iZ5uFRYNn3SHiWxF", "0YbuU5ar5qTLWUCy": "0Afgc050XIZRW491"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"1PO6ApCD2VXidT7w": "0Oc15N8WXBPp17PA", "ewqSm5x3B4t7WQnp": "8jXZedgt5cyNe27H", "LtwtVOaxgP6Jbct8": "puMybYGxD9IPmmsL"}}]}' \
    > test.out 2>&1
eval_tap $? 58 'UpdatePlatformDLCConfig' test.out

#- 59 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeletePlatformDLCConfig' test.out

#- 60 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'u3kaPj0O4zd8Tb7c' \
    --itemId 'UNGPTBxiFFCrn7dj,js69FTFVGUVhvKhJ,Cmeisql14mUHVbMP' \
    --limit '17' \
    --offset '88' \
    --userId 'mNhcZsU3VAdMDcb4' \
    > test.out 2>&1
eval_tap $? 60 'QueryEntitlements' test.out

#- 61 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'qlkiFAamqvZI2Kwj,qPBiWXade41s3rH3,4mB2yPlRpWjmHZAA' \
    --limit '43' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements1' test.out

#- 62 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1989-06-18T00:00:00Z", "grantedCode": "TH8MuqIg0Czkguwu", "itemId": "JCW7EEFB67AODbi9", "itemNamespace": "BzupBsFpYc77GtRU", "language": "Id_GKNz", "quantity": 92, "region": "BsbfzqxBPNe8ae1I", "source": "OTHER", "startDate": "1981-01-06T00:00:00Z", "storeId": "nQLYXxm09wpGAbpE"}, {"endDate": "1977-03-22T00:00:00Z", "grantedCode": "DY9vLh3u6EDsUmrV", "itemId": "6kH4OotKwG3UC6XC", "itemNamespace": "nnZxF8CmQr17W65b", "language": "uwW_cogH-Bh", "quantity": 61, "region": "loFSKWM1eym5ydC6", "source": "OTHER", "startDate": "1988-03-11T00:00:00Z", "storeId": "5xCWTqUOYZENJ1QH"}, {"endDate": "1997-05-12T00:00:00Z", "grantedCode": "QxPRXH7uxBJEECQE", "itemId": "1li3Bg7Jxc9pUnZm", "itemNamespace": "vhidwCkZwqjYLfTi", "language": "dpN-WJrY_eZ", "quantity": 46, "region": "4VzW0CpoBCbyJsF5", "source": "REWARD", "startDate": "1976-01-15T00:00:00Z", "storeId": "F1c0W338HS6CBgVR"}], "userIds": ["afCjOuSYht83AdvB", "HwSmvcvcDKF19yVR", "yihYNZ84CVhziXV8"]}' \
    > test.out 2>&1
eval_tap $? 62 'GrantEntitlements' test.out

#- 63 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["aagTiRJ8daGTVX3B", "b7jlz5IfHgKjI9mw", "JSrN8jkIykR2zbaI"]' \
    > test.out 2>&1
eval_tap $? 63 'RevokeEntitlements' test.out

#- 64 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '6PD7fEscShnGUGUt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetEntitlement' test.out

#- 65 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '47' \
    --status 'SUCCESS' \
    --userId '9GDbLNwjm3FK0nnX' \
    > test.out 2>&1
eval_tap $? 65 'QueryFulfillmentHistories' test.out

#- 66 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'GetAppleIAPConfig' test.out

#- 67 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "2poMfZ1hDHtbh4Ht", "password": "MlFgvh2Dp2SoiIPp"}' \
    > test.out 2>&1
eval_tap $? 67 'UpdateAppleIAPConfig' test.out

#- 68 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'DeleteAppleIAPConfig' test.out

#- 69 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEpicGamesIAPConfig' test.out

#- 70 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "1yvfAHS0VgLu11A3"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateEpicGamesIAPConfig' test.out

#- 71 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteEpicGamesIAPConfig' test.out

#- 72 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'GetGoogleIAPConfig' test.out

#- 73 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "HTovFi4tPAGfleyC", "serviceAccountId": "A6jEtcqsnzoVILjk"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateGoogleIAPConfig' test.out

#- 74 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'DeleteGoogleIAPConfig' test.out

#- 75 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 75 'UpdateGoogleP12File' test.out

#- 76 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetIAPItemConfig' test.out

#- 77 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "wW61duF87aUyrdt4", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"SpWBAetsanzqP8ox": "frtbECD1CYPwaiBA", "xfYL8Avt70ZUT2fS": "k3LL0calqxEewuGS", "469k2hG0WKt4sUma": "nYxM0UHZVNYzGMNI"}}, {"itemIdentity": "pWoSLkUrfuf4U3We", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"eA9t2ENKKWrFtHIi": "1CMgKAOG5iDcCR5P", "bCvDLil8wj9cKM3A": "r6MF35hCER4nGmWG", "gTJfHlJl4tHGa4Xf": "Zcd9CVnGqMX9Fiee"}}, {"itemIdentity": "EssWEUl07bhwntCV", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"yVoSlKNchPHNL4X3": "LLaGPGdqLE8Sohhh", "uiTnJarYYkHBDdSz": "BXdxapwhd5IQYBQu", "xLvPuWYvE3fsNy9Z": "9OhxXvCp9y7fLD2q"}}]}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateIAPItemConfig' test.out

#- 78 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteIAPItemConfig' test.out

#- 79 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetPlayStationIAPConfig' test.out

#- 80 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "fCXnlUnqxT1WsRNM"}' \
    > test.out 2>&1
eval_tap $? 80 'UpdatePlaystationIAPConfig' test.out

#- 81 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeletePlaystationIAPConfig' test.out

#- 82 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetSteamIAPConfig' test.out

#- 83 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "ZcA92hzC7MNa8vVe", "publisherAuthenticationKey": "4MHX6AgMep90AyyU"}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateSteamIAPConfig' test.out

#- 84 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'DeleteSteamIAPConfig' test.out

#- 85 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetTwitchIAPConfig' test.out

#- 86 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "JyAK5PRMRMwdvl0h", "clientSecret": "v6g62GxBW2tQF5tk", "organizationId": "TjgJaMYvNQOsDa4b"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateTwitchIAPConfig' test.out

#- 87 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeleteTwitchIAPConfig' test.out

#- 88 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetXblIAPConfig' test.out

#- 89 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "kcgepqtxjbrztee7"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateXblIAPConfig' test.out

#- 90 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteXblAPConfig' test.out

#- 91 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'QLTGAak7Kaol01DK' \
    > test.out 2>&1
eval_tap $? 91 'UpdateXblBPCertFile' test.out

#- 92 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '97D2xnik42miteR5' \
    --itemId 'eQAe1rzmmgqBPRmd' \
    --itemType 'MEDIA' \
    --endTime 'mO4oI8KDqebm83ra' \
    --startTime 'NBJ5y7axEkvI4oxZ' \
    > test.out 2>&1
eval_tap $? 92 'DownloadInvoiceDetails' test.out

#- 93 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'EDxGiBnNbn0zaf7C' \
    --itemId 'aOSlHXrUSA6sMJzA' \
    --itemType 'INGAMEITEM' \
    --endTime 'mtqISQ83TTbtefXW' \
    --startTime 'znDe4LQdXfFBii2R' \
    > test.out 2>&1
eval_tap $? 93 'GenerateInvoiceSummary' test.out

#- 94 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AMEX5RMjBFVZGYzQ' \
    --body '{"categoryPath": "qV8d9mDdUIoiIJFN", "targetItemId": "xuNOmUSWw18T1IxV", "targetNamespace": "WCxdvPL9e4P01vxP"}' \
    > test.out 2>&1
eval_tap $? 94 'SyncInGameItem' test.out

#- 95 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '8xj1LyEirURERnEM' \
    --body '{"appId": "zpImW6sjAHyCK5tN", "appType": "DEMO", "baseAppId": "yR0x3YiHF8ITGPRQ", "boothName": "BCgIs1Q2lzxl0yF5", "categoryPath": "m77TTh4gUoj8u2WR", "clazz": "cLiEtzVlnkflfn7p", "displayOrder": 68, "entitlementType": "CONSUMABLE", "ext": {"Y48F1dl1q92m3iRl": {}, "fnBAk0CwiAsR65yQ": {}, "9ssuHdGmxncCEr0K": {}}, "features": ["Oem2yqPsMFxKybPk", "cgeqzGbruNB72HHM", "kjzyBB4UFKiaoV0V"], "images": [{"as": "buS6x9cLJ1APnNls", "caption": "a2bRBr27fVMWuAfD", "height": 33, "imageUrl": "teIMgzISomCsodJr", "smallImageUrl": "hQW41q2OspCZbt3U", "width": 40}, {"as": "XH8uenbC5CphgMwe", "caption": "exsIAP5vHLjBJ9iq", "height": 79, "imageUrl": "GvJ4UMS93yOxNInD", "smallImageUrl": "ByhnoluO6ti0QP2s", "width": 38}, {"as": "OkDiJq4xQye7HqnV", "caption": "K3YVeOWs9mfVQh3j", "height": 77, "imageUrl": "zifF8y959anrNSle", "smallImageUrl": "ywHbHig6IKWVZ77K", "width": 8}], "itemIds": ["79DpSjb39ukcR6c2", "E2r3vk3IfAKEbqcN", "XSGCCvNowNmdpcJg"], "itemQty": {"F88ySNq4Mj7mulP4": 40, "9ADCGiXaLs2xjHki": 28, "NhdgQ0JWZjNRSzOT": 34}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"qIHsxvaUoXDmwWsu": {"description": "kxncuD3QxCXMd00Y", "localExt": {"BWCaVVmM45mfIZsW": {}, "hkS476dGGJwJ00UH": {}, "197MJ6zU7JLMQyMW": {}}, "longDescription": "zYQCAaPJgoxGJoJa", "title": "SzUtY4ZD0Xtb0U4p"}, "H16NUsVY21NVIs7N": {"description": "Ren2Y3Ns0QJQeaWy", "localExt": {"tPfds1BYx0EaURyd": {}, "f8ZyyZeHAWGgJUbU": {}, "JRMbkcTglbU86FyO": {}}, "longDescription": "jApNHBVfNOURcjY3", "title": "YYT9oTynmfIuBWgJ"}, "TNFfM8M0IW4oe8KD": {"description": "gy0xZfAcNg14Ws8T", "localExt": {"IP1LKiFQoLDvumfq": {}, "rgSfnx2h61X9dN1M": {}, "GRXBJ6mVV7JS9qjN": {}}, "longDescription": "LwvI8JdiY3RRiLil", "title": "mOGF6dLLIeIVIjMc"}}, "lootBoxConfig": {"rewardCount": 6, "rewards": [{"lootBoxItems": [{"count": 23, "duration": 98, "endDate": "1971-12-23T00:00:00Z", "itemId": "dRXTGIrdNL5gJPqT", "itemSku": "AjgqaTHf1ANTJ9Yk", "itemType": "997XkGOdC6ItxDT8"}, {"count": 31, "duration": 100, "endDate": "1986-04-19T00:00:00Z", "itemId": "jU1G0EVjVZw1ToLu", "itemSku": "PakQN1MpOs1RVFrc", "itemType": "g2CXxepx78fvsyhE"}, {"count": 71, "duration": 56, "endDate": "1984-10-23T00:00:00Z", "itemId": "NXGTuQPIDpor7t1a", "itemSku": "JLNNz6QIVC9Mfuc8", "itemType": "VOsnmnlVljdWYmEL"}], "name": "e74p38vumnxAnYBT", "odds": 0.3726561855157351, "type": "PROBABILITY_GROUP", "weight": 82}, {"lootBoxItems": [{"count": 93, "duration": 26, "endDate": "1988-03-03T00:00:00Z", "itemId": "z0jcgDI8Pkz96vd8", "itemSku": "0msqIm5bufnBqrpL", "itemType": "eqhwVhjnnjKMEmtb"}, {"count": 18, "duration": 6, "endDate": "1996-07-06T00:00:00Z", "itemId": "sAQHbMrKYi0Zxs5S", "itemSku": "WCqZXHLLa31oQf7B", "itemType": "ULnZDhutDM6Bqguq"}, {"count": 61, "duration": 98, "endDate": "1983-02-15T00:00:00Z", "itemId": "xGxBWtnTKUe2znsq", "itemSku": "PzPkwCBo2SwCUsTa", "itemType": "g4MLAo3m61P2xaNf"}], "name": "mn8Onb1a9gMz0F2U", "odds": 0.45007223956154263, "type": "REWARD_GROUP", "weight": 57}, {"lootBoxItems": [{"count": 26, "duration": 85, "endDate": "1990-02-24T00:00:00Z", "itemId": "DmgNEJBhgGq5GIDh", "itemSku": "NC66szbCCf73IFbR", "itemType": "kPSSITz4TjCrJHXG"}, {"count": 74, "duration": 22, "endDate": "1991-06-17T00:00:00Z", "itemId": "dOTacCcJfIfXshuL", "itemSku": "Uk5WdpxjZx5noXPh", "itemType": "PUTKbonoucNmzwOZ"}, {"count": 83, "duration": 50, "endDate": "1989-11-05T00:00:00Z", "itemId": "56sDkci5rZ8iMlOu", "itemSku": "ksQJCiRFiZWwJ7Nr", "itemType": "Tb1XTB9YQzUJ9XlY"}], "name": "J8BzP6EUmUXGM5an", "odds": 0.5551515294270558, "type": "PROBABILITY_GROUP", "weight": 47}], "rollFunction": "CUSTOM"}, "maxCount": 50, "maxCountPerUser": 68, "name": "j9lhbvuQdW2jwKUc", "optionBoxConfig": {"boxItems": [{"count": 21, "duration": 75, "endDate": "1972-09-14T00:00:00Z", "itemId": "94ryY91lX8DD4MYX", "itemSku": "lrJ81lHvv9rqvEoM", "itemType": "8YmVjAkO3HKsEp6K"}, {"count": 23, "duration": 92, "endDate": "1979-04-21T00:00:00Z", "itemId": "wW4djrexcbHdEtoQ", "itemSku": "vpV344RctmTozCi8", "itemType": "HeV6jbalHmqBBfi7"}, {"count": 38, "duration": 91, "endDate": "1988-09-16T00:00:00Z", "itemId": "z8tne5dbguBF6Gsv", "itemSku": "vdl8jHz9x7XZIjU4", "itemType": "IK9lOLaZaMphKCqT"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 63, "fixedTrialCycles": 7, "graceDays": 98}, "regionData": {"KNKgYazujsmSmylT": [{"currencyCode": "1YtxIq73aMb48jIS", "currencyNamespace": "d97KORRhxSWLWLNf", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1999-12-04T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1984-09-24T00:00:00Z", "expireAt": "1981-12-17T00:00:00Z", "price": 0, "purchaseAt": "1972-09-29T00:00:00Z", "trialPrice": 67}, {"currencyCode": "ESC6hZYTYZbzf5aA", "currencyNamespace": "NNNs5kgSZZNUHbIT", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1995-07-29T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1991-05-05T00:00:00Z", "expireAt": "1987-04-07T00:00:00Z", "price": 21, "purchaseAt": "1996-03-25T00:00:00Z", "trialPrice": 72}, {"currencyCode": "oMUZn1YXj5zFZeOC", "currencyNamespace": "OR9NvBQZSJPOIKrR", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1979-03-09T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1995-02-07T00:00:00Z", "expireAt": "1983-12-31T00:00:00Z", "price": 16, "purchaseAt": "1999-11-04T00:00:00Z", "trialPrice": 42}], "rnpZxNnLRH36bqS2": [{"currencyCode": "oFY76PU1AziBOHEA", "currencyNamespace": "j1cT3u6Zc2FbrTFz", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1976-02-22T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1986-08-08T00:00:00Z", "expireAt": "1988-07-02T00:00:00Z", "price": 58, "purchaseAt": "1988-12-21T00:00:00Z", "trialPrice": 33}, {"currencyCode": "Wf6T3by2kYSCdnFK", "currencyNamespace": "Lc0xcTjqjdcEfU61", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1977-04-17T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1996-10-21T00:00:00Z", "expireAt": "1999-05-18T00:00:00Z", "price": 99, "purchaseAt": "1985-07-16T00:00:00Z", "trialPrice": 13}, {"currencyCode": "np1ck1vT90C6o86c", "currencyNamespace": "SRL9cgbUmulhe98o", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1989-10-28T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1977-09-07T00:00:00Z", "expireAt": "1992-03-05T00:00:00Z", "price": 64, "purchaseAt": "1972-07-02T00:00:00Z", "trialPrice": 8}], "9GYxjiiOQAD77ci0": [{"currencyCode": "vfWVZoRRMPi57HyK", "currencyNamespace": "Kz5nyI6ulKNKoXa0", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1978-07-12T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1989-02-19T00:00:00Z", "expireAt": "1974-03-18T00:00:00Z", "price": 77, "purchaseAt": "1985-03-05T00:00:00Z", "trialPrice": 69}, {"currencyCode": "pda3YhtQxpCYME6x", "currencyNamespace": "21pdX2QSPAd9sxoL", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1981-09-21T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1992-01-26T00:00:00Z", "expireAt": "1998-05-16T00:00:00Z", "price": 84, "purchaseAt": "1983-01-02T00:00:00Z", "trialPrice": 45}, {"currencyCode": "fIjLX8ce0KbNN7Yc", "currencyNamespace": "l2JfmQplvGjVQ4ae", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1975-09-22T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1974-07-02T00:00:00Z", "expireAt": "1987-04-22T00:00:00Z", "price": 42, "purchaseAt": "1989-08-28T00:00:00Z", "trialPrice": 13}]}, "saleConfig": {"currencyCode": "2oWJlfglLM4xjfkN", "price": 77}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "U6jaGfsD1cfswmeF", "stackable": true, "status": "INACTIVE", "tags": ["jcY5ZPkv90lyKSTW", "Vs3qFTi1t530Wj1W", "LxSFZ0LpupEi5Dbk"], "targetCurrencyCode": "fzIvc3VlSXrA3XUG", "targetNamespace": "ud4tVjmxEf4XvVhF", "thumbnailUrl": "JTxFHITBg9x4unq3", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 95 'CreateItem' test.out

#- 96 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uUfNfUDe4g7q6PHE' \
    --appId 'aqbzHvDDl1jiLw3X' \
    > test.out 2>&1
eval_tap $? 96 'GetItemByAppId' test.out

#- 97 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'GBA6JXDpA1tIC45C' \
    --baseAppId '0oaGouFu4hXONgUw' \
    --categoryPath 'JnUpryDeRcpUvlrw' \
    --features '2MwC1uuokpaIjL0V' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --limit '65' \
    --offset '9' \
    --region 'a05Xl5TPC5GODS44' \
    --sortBy 'createdAt,name,updatedAt:asc' \
    --storeId 'c7xMrRKvw8ISP2WK' \
    --tags 'mCRRXBxlalCHtWlK' \
    --targetNamespace 'xLpS8fLWoQ5nuJha' \
    > test.out 2>&1
eval_tap $? 97 'QueryItems' test.out

#- 98 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'tQPxR7dvBVC5zgOK,LTDmHe8c1eJ9sde7,Ryt4udIv22M18uux' \
    > test.out 2>&1
eval_tap $? 98 'ListBasicItemsByFeatures' test.out

#- 99 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9xBomQFPFWy5cwNP' \
    --sku 'I6aFo0MVwDZCIXFN' \
    > test.out 2>&1
eval_tap $? 99 'GetItemBySku' test.out

#- 100 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'EL3uWVRz3V7YbJM3' \
    --populateBundle  \
    --region 'bNLWHAbCZixe2cQ6' \
    --storeId 'O30lpzcBQMAEcNcJ' \
    --sku 'qrKxnMzSYoc4ZjiM' \
    > test.out 2>&1
eval_tap $? 100 'GetLocaleItemBySku' test.out

#- 101 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Y4H34B6wVd8ipcKD' \
    --sku 'wQeUWtjCC2UH6jzM' \
    > test.out 2>&1
eval_tap $? 101 'GetItemIdBySku' test.out

#- 102 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'O3AfmOS5mQNyRPZF,PNP56l1AT6OLKmZh,CZxxPPdPwOtEuWBS' \
    --storeId 'O2jJepUnEEgja2mI' \
    > test.out 2>&1
eval_tap $? 102 'GetBulkItemIdBySkus' test.out

#- 103 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'E2kLTnJwc5XmkCuL' \
    --region '5W4tKt6G3j9LYdG7' \
    --storeId 'xVPqBqe9RDQMBSYA' \
    --itemIds 'FLqp8PF5hCcoukWp' \
    > test.out 2>&1
eval_tap $? 103 'BulkGetLocaleItems' test.out

#- 104 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetAvailablePredicateTypes' test.out

#- 105 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'nbz4ys7j6lxuU3u2' \
    --body '{"itemIds": ["HEG0qfKegvFTD1sP", "ykS8YLmwtYgWGcA0", "h4G1LZ1HaX5UBMbs"]}' \
    > test.out 2>&1
eval_tap $? 105 'ValidateItemPurchaseCondition' test.out

#- 106 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F44VTsLDRzdq22cb' \
    --body '{"changes": [{"itemIdentities": ["nyK3ggFDh2kaZP7p", "nnVfxPwc259HF9ej", "HaILQruAuYyJLYGq"], "itemIdentityType": "ITEM_SKU", "regionData": {"ZLRxYlYqlpq03BGd": [{"currencyCode": "Ik4oEogFVGR71rJO", "currencyNamespace": "By6lsj1AKGBjnHma", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1995-08-04T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1989-06-10T00:00:00Z", "discountedPrice": 61, "expireAt": "1987-01-09T00:00:00Z", "price": 55, "purchaseAt": "1977-08-09T00:00:00Z", "trialPrice": 100}, {"currencyCode": "TCzUOIzVcy9k3ie6", "currencyNamespace": "4Vnwa0ClGQJultJe", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1984-05-27T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1979-07-03T00:00:00Z", "discountedPrice": 69, "expireAt": "1989-08-22T00:00:00Z", "price": 0, "purchaseAt": "1972-03-01T00:00:00Z", "trialPrice": 63}, {"currencyCode": "5JPiMEtgKuiGTYgw", "currencyNamespace": "Wv5XldL6rOVGcRAn", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1979-12-28T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1971-08-11T00:00:00Z", "discountedPrice": 52, "expireAt": "1993-08-11T00:00:00Z", "price": 91, "purchaseAt": "1985-07-11T00:00:00Z", "trialPrice": 31}], "ZFgJbQ3Fj1umx4It": [{"currencyCode": "zkMJ7cudf4r916GP", "currencyNamespace": "rhn2etVIQvRkQJAt", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1994-10-01T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1981-04-27T00:00:00Z", "discountedPrice": 49, "expireAt": "1992-07-29T00:00:00Z", "price": 10, "purchaseAt": "1983-02-27T00:00:00Z", "trialPrice": 47}, {"currencyCode": "Gz1ermJYXsYgL7Tf", "currencyNamespace": "yIlAwjTZdRZJJzWZ", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1982-02-15T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1973-07-23T00:00:00Z", "discountedPrice": 2, "expireAt": "1971-04-12T00:00:00Z", "price": 3, "purchaseAt": "1993-01-04T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wMI4gGmvK9gW596F", "currencyNamespace": "wBNrFXt3TAuKBwBc", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1998-05-28T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1974-02-10T00:00:00Z", "discountedPrice": 41, "expireAt": "1989-05-23T00:00:00Z", "price": 33, "purchaseAt": "1999-04-16T00:00:00Z", "trialPrice": 15}], "sIJctAdxyZVKHA9D": [{"currencyCode": "kaSOWgtg8yw8lHEb", "currencyNamespace": "VDwBAqanOlscRIWw", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1983-10-29T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1995-04-14T00:00:00Z", "discountedPrice": 94, "expireAt": "1990-03-27T00:00:00Z", "price": 82, "purchaseAt": "1972-06-15T00:00:00Z", "trialPrice": 77}, {"currencyCode": "bkOFldMCQ98JH4n0", "currencyNamespace": "JtgqzZv5kVu4S95m", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1997-05-03T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1998-06-22T00:00:00Z", "discountedPrice": 0, "expireAt": "1976-02-07T00:00:00Z", "price": 39, "purchaseAt": "1999-07-11T00:00:00Z", "trialPrice": 11}, {"currencyCode": "3N7WNMYIfcDKbLu8", "currencyNamespace": "pnK34oA1keYXJvtg", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1986-01-25T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1996-03-13T00:00:00Z", "discountedPrice": 10, "expireAt": "1971-04-06T00:00:00Z", "price": 8, "purchaseAt": "1989-03-14T00:00:00Z", "trialPrice": 24}]}}, {"itemIdentities": ["MBahFZZGMTcqnWrI", "prOv0BJ9Sgl7H1sd", "H2RIJz1eI7Q5pu9P"], "itemIdentityType": "ITEM_SKU", "regionData": {"tnohddMzMTQ9P7sY": [{"currencyCode": "LDWAJOA75K4BYJ2f", "currencyNamespace": "kqYJoF2FI3vyyqRz", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1998-11-28T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1982-09-15T00:00:00Z", "discountedPrice": 7, "expireAt": "1996-05-29T00:00:00Z", "price": 38, "purchaseAt": "1989-07-28T00:00:00Z", "trialPrice": 84}, {"currencyCode": "9TVmdMKEohKzuMYD", "currencyNamespace": "UTLBeCidXjuGgx8n", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1996-06-21T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1983-03-16T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-02-06T00:00:00Z", "price": 63, "purchaseAt": "1997-08-08T00:00:00Z", "trialPrice": 39}, {"currencyCode": "hXtAVxCd3meTrT7c", "currencyNamespace": "F9oVCh89wNOkKYss", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1982-03-22T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1972-12-31T00:00:00Z", "discountedPrice": 78, "expireAt": "1974-07-10T00:00:00Z", "price": 22, "purchaseAt": "1985-12-22T00:00:00Z", "trialPrice": 41}], "3hCGNgaJmuALlMQl": [{"currencyCode": "9RLrthbfp0VgweLl", "currencyNamespace": "T2sY3SsTnDQY7kKU", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1993-02-28T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1992-11-19T00:00:00Z", "discountedPrice": 43, "expireAt": "1982-02-03T00:00:00Z", "price": 98, "purchaseAt": "1981-03-21T00:00:00Z", "trialPrice": 53}, {"currencyCode": "xtyQENvJrBCqeg67", "currencyNamespace": "d4RWOqO4U0bitNQL", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1982-04-11T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1999-04-21T00:00:00Z", "discountedPrice": 60, "expireAt": "1995-12-12T00:00:00Z", "price": 26, "purchaseAt": "1974-12-23T00:00:00Z", "trialPrice": 40}, {"currencyCode": "0AbkCPY70FmvviVI", "currencyNamespace": "BbcujF8Vk5qb8NhW", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1971-08-19T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1971-07-25T00:00:00Z", "discountedPrice": 75, "expireAt": "1990-01-20T00:00:00Z", "price": 77, "purchaseAt": "1974-08-28T00:00:00Z", "trialPrice": 20}], "gOOPXM6XTUh2dJ90": [{"currencyCode": "yqHDNacl4F9G6Dl5", "currencyNamespace": "TFwBY6HKXAblkT8V", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1981-06-26T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1982-12-17T00:00:00Z", "discountedPrice": 79, "expireAt": "1994-09-25T00:00:00Z", "price": 25, "purchaseAt": "1997-09-18T00:00:00Z", "trialPrice": 46}, {"currencyCode": "Iacq4XRLaA643nTM", "currencyNamespace": "tXSAyejnny0Ju13b", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1992-12-15T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1982-08-12T00:00:00Z", "discountedPrice": 57, "expireAt": "1998-08-09T00:00:00Z", "price": 74, "purchaseAt": "1991-10-08T00:00:00Z", "trialPrice": 71}, {"currencyCode": "JxytpcubN4AUUPFP", "currencyNamespace": "scZsXeJOD4DMtqfI", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1980-10-21T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1978-08-11T00:00:00Z", "discountedPrice": 44, "expireAt": "1985-02-19T00:00:00Z", "price": 34, "purchaseAt": "1995-12-26T00:00:00Z", "trialPrice": 89}]}}, {"itemIdentities": ["imQQoLbe5YOJvxGR", "xUzrTwagH7BMT1IZ", "KTdNFVBQ1crBXAup"], "itemIdentityType": "ITEM_SKU", "regionData": {"kRGB8jqJEd6eqqsB": [{"currencyCode": "VyONV0JRtozI0jpl", "currencyNamespace": "iCFQ6WgJpGPigdc5", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1985-07-27T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-06-23T00:00:00Z", "discountedPrice": 82, "expireAt": "1995-12-25T00:00:00Z", "price": 19, "purchaseAt": "1995-01-02T00:00:00Z", "trialPrice": 62}, {"currencyCode": "c1cQvSxgTNIUzxDg", "currencyNamespace": "BlIbuzm7DzJ20NFR", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1987-06-27T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1993-09-24T00:00:00Z", "discountedPrice": 6, "expireAt": "1971-11-17T00:00:00Z", "price": 32, "purchaseAt": "1980-05-27T00:00:00Z", "trialPrice": 33}, {"currencyCode": "PmbpuptECGd5cdXC", "currencyNamespace": "2Sesc6y68whNBYl9", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1979-02-26T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1986-03-05T00:00:00Z", "discountedPrice": 36, "expireAt": "1999-05-11T00:00:00Z", "price": 81, "purchaseAt": "1987-03-13T00:00:00Z", "trialPrice": 84}], "6AnWn3NdEPhNHSH7": [{"currencyCode": "eKDfRcngEpTnRUQr", "currencyNamespace": "3RLOM1vEx4gqDY6j", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1983-01-06T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1996-12-18T00:00:00Z", "discountedPrice": 47, "expireAt": "1972-02-28T00:00:00Z", "price": 21, "purchaseAt": "1981-11-08T00:00:00Z", "trialPrice": 85}, {"currencyCode": "e5zohg9s9utRQt28", "currencyNamespace": "b6o3K0COF74tz6ae", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1972-04-01T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1981-01-14T00:00:00Z", "discountedPrice": 30, "expireAt": "1982-01-04T00:00:00Z", "price": 20, "purchaseAt": "1989-11-10T00:00:00Z", "trialPrice": 81}, {"currencyCode": "dMqGegcg3eRvBZXN", "currencyNamespace": "3cjIXmFWRJnj8xN7", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1992-06-17T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1983-08-31T00:00:00Z", "discountedPrice": 22, "expireAt": "1992-11-15T00:00:00Z", "price": 42, "purchaseAt": "1998-10-25T00:00:00Z", "trialPrice": 69}], "b4UTPWDXTSb55g8L": [{"currencyCode": "STs7Nf95lGlPrf6o", "currencyNamespace": "bIdnI6Ag7eUYcYJ4", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1996-06-30T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1997-04-08T00:00:00Z", "discountedPrice": 34, "expireAt": "1980-02-14T00:00:00Z", "price": 57, "purchaseAt": "1974-06-21T00:00:00Z", "trialPrice": 25}, {"currencyCode": "BSKLSQ4GvLtz50D3", "currencyNamespace": "rpBfBovqLwXBuT30", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1997-11-24T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1993-01-28T00:00:00Z", "discountedPrice": 19, "expireAt": "1997-06-17T00:00:00Z", "price": 48, "purchaseAt": "1985-09-20T00:00:00Z", "trialPrice": 91}, {"currencyCode": "haBKoUfiHjGmCyPs", "currencyNamespace": "KCJTv1ic9gvagF2c", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1980-07-29T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1989-05-25T00:00:00Z", "discountedPrice": 20, "expireAt": "1989-12-17T00:00:00Z", "price": 40, "purchaseAt": "1981-03-17T00:00:00Z", "trialPrice": 39}]}}]}' \
    > test.out 2>&1
eval_tap $? 106 'BulkUpdateRegionData' test.out

#- 107 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'LOOTBOX' \
    --limit '12' \
    --offset '79' \
    --sortBy 'V7nmDk29mcjSuz9v' \
    --storeId 'bNStqPtQmQN6eKAG' \
    --keyword 'iZFCftT0RWECdjWY' \
    --language 'rnulxcCKAru8pOaA' \
    > test.out 2>&1
eval_tap $? 107 'SearchItems' test.out

#- 108 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '97' \
    --offset '71' \
    --sortBy 'updatedAt:desc,displayOrder,updatedAt:asc' \
    --storeId 'PoJT83zEGXmVBZLy' \
    > test.out 2>&1
eval_tap $? 108 'QueryUncategorizedItems' test.out

#- 109 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'rH9J7BoysmaORLkP' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5hc2Fh04JTsqDTyn' \
    > test.out 2>&1
eval_tap $? 109 'GetItem' test.out

#- 110 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'CewqJligLlRxOelK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ykICRxF6HtlER2tx' \
    --body '{"appId": "s4qrNARATn6KXOut", "appType": "DLC", "baseAppId": "3KbbQGERMNpqWb51", "boothName": "y5RUzvMfTkPy0fGv", "categoryPath": "TGgfLKsg0b1Bq78c", "clazz": "E5O5pmPnbiPJ9j4v", "displayOrder": 48, "entitlementType": "CONSUMABLE", "ext": {"Zrm3thUvV87yfkyc": {}, "LSVdleSaAylsmLYe": {}, "2phYOgT5kDTyPl3d": {}}, "features": ["3P8Gwjg3IOH0SDHg", "YKqxJiFJdrmj5vhz", "KF7NXEjrJMki8jvc"], "images": [{"as": "gsJwex7wq8ZPlXNa", "caption": "UNgdY2vfJuje5cPn", "height": 24, "imageUrl": "PNoN9AWtLK9TFgi9", "smallImageUrl": "j2XMh9WpifqjNjLO", "width": 40}, {"as": "xrDKVpULjjiw3NeV", "caption": "G4DJi9DaMrc0WFgK", "height": 18, "imageUrl": "59SRu0YqUxKDc84O", "smallImageUrl": "MIzvTScdbKBsAyJM", "width": 51}, {"as": "wjr7gSGhnfuF4WZi", "caption": "QVICVpWd3UM08gMX", "height": 14, "imageUrl": "vxRUY0ilrNoFT98S", "smallImageUrl": "gtJd4Z5f8nfaKqdZ", "width": 65}], "itemIds": ["GCTHIOFjeXbsSgR4", "3kIDzxBwqRJTzrHN", "ZWUsq5lQo2jy29EJ"], "itemQty": {"igqYhyVhURx1yPec": 52, "w6zQuoZcXQpoTOxe": 75, "y1jorNsg9ZKYCKoI": 91}, "itemType": "BUNDLE", "listable": true, "localizations": {"3TcJ7DQIi45aCDHN": {"description": "9mVug2zkVf6KgpKO", "localExt": {"cn3tMD9UT67bOwug": {}, "FDa6wUQvehKqwCh8": {}, "6XmRkCEcfHDCdl59": {}}, "longDescription": "Wp9A3tXGve6DdK6u", "title": "vg8f2cIoByk9fxtv"}, "sgeAxo57nKAbZpsb": {"description": "J4Iu5KJ0ynxGBlac", "localExt": {"DCdFe8ATUqVxcSth": {}, "rpnMUBsnUfuQIcSb": {}, "Ut5UGkInFGpuUsdt": {}}, "longDescription": "q4dOwNESzCEW9dUV", "title": "hZjLftC3sCS8CpLC"}, "qPD9CeDEdCnnL6Kt": {"description": "1Bjj3b8QM8Rr45UL", "localExt": {"qXQgvwD3PsKDJiWx": {}, "QBwaS7rDBf2S54ph": {}, "bdyGDt47f9GWRlE9": {}}, "longDescription": "hqz6rjDNo4rhjxUd", "title": "MM83WekqfWv04vvn"}}, "lootBoxConfig": {"rewardCount": 3, "rewards": [{"lootBoxItems": [{"count": 41, "duration": 22, "endDate": "1971-08-29T00:00:00Z", "itemId": "qr8qs2mqtnGAqXUj", "itemSku": "NypF6MMqWpdEJsPo", "itemType": "aIbYz8cK5jlpJdre"}, {"count": 74, "duration": 41, "endDate": "1985-05-18T00:00:00Z", "itemId": "C7SwgoViPeIB4Ehy", "itemSku": "0Y5aSJVDginxAM77", "itemType": "eY9C14FbfiI2NPvl"}, {"count": 22, "duration": 38, "endDate": "1985-08-13T00:00:00Z", "itemId": "Y5bEokxXxkWZbjf7", "itemSku": "GZxaossQmjo69woh", "itemType": "JFyTNk5FGUPhR4LE"}], "name": "Zvz3EjFR7996Ug5m", "odds": 0.915409884906693, "type": "PROBABILITY_GROUP", "weight": 0}, {"lootBoxItems": [{"count": 47, "duration": 64, "endDate": "1986-08-30T00:00:00Z", "itemId": "V5uTcYsoahUrELQ1", "itemSku": "btjJOqQMgZWAU6E9", "itemType": "2nHJzvw7tnYtGfv0"}, {"count": 63, "duration": 90, "endDate": "1989-07-29T00:00:00Z", "itemId": "yjBu4EzwRjD7jmQJ", "itemSku": "eFPghqamSc5y0X48", "itemType": "eT7Mluexk87b9Z5B"}, {"count": 93, "duration": 13, "endDate": "1980-10-30T00:00:00Z", "itemId": "EA3EdmW8saabP4xR", "itemSku": "owfNojzPXI2v0prR", "itemType": "3OEey0MkZwS6TYwN"}], "name": "N3UYhic03qGEg5fN", "odds": 0.4062012597249862, "type": "REWARD", "weight": 0}, {"lootBoxItems": [{"count": 98, "duration": 9, "endDate": "1980-03-20T00:00:00Z", "itemId": "l4csFq65cU66yJaj", "itemSku": "4ovoKWE4EW0sw8v5", "itemType": "peiuxoBJATauyD3X"}, {"count": 58, "duration": 20, "endDate": "1995-05-29T00:00:00Z", "itemId": "MiyEvMf9yilUEujk", "itemSku": "6oqYo1HQYTFzwdOM", "itemType": "dupwD4O3uNbcIDcI"}, {"count": 49, "duration": 7, "endDate": "1982-06-26T00:00:00Z", "itemId": "ZbOy1T4hfwkuVykH", "itemSku": "4RpfmjIXFGZ5PKdb", "itemType": "abJIkNnt9P1Tkm08"}], "name": "luh4dpPRMDbUXBWT", "odds": 0.019352813352928933, "type": "REWARD", "weight": 54}], "rollFunction": "CUSTOM"}, "maxCount": 77, "maxCountPerUser": 12, "name": "zNeJnBurh54CWbYb", "optionBoxConfig": {"boxItems": [{"count": 20, "duration": 85, "endDate": "1987-02-05T00:00:00Z", "itemId": "I0GKwJ3vfXlsAMy2", "itemSku": "Zp2UAGxHnmSxvkG9", "itemType": "UR5q9neoW6JBcGp9"}, {"count": 89, "duration": 79, "endDate": "1983-12-25T00:00:00Z", "itemId": "QaVjZF7Ax6115Kg9", "itemSku": "U8vrQJXQxoIbVi2C", "itemType": "LEk277Ivjj1A647X"}, {"count": 87, "duration": 52, "endDate": "1999-12-24T00:00:00Z", "itemId": "koaAfZIim0sFPm1Y", "itemSku": "N27bojDVaZLpx4kE", "itemType": "WYkO6KrKUMhJrASB"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 64, "fixedTrialCycles": 15, "graceDays": 62}, "regionData": {"mWKSSrF35anDGvur": [{"currencyCode": "19V18oIrUKXttgAI", "currencyNamespace": "2QdWJFLmoPEgd8EM", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1979-11-30T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1980-09-09T00:00:00Z", "expireAt": "1988-04-19T00:00:00Z", "price": 44, "purchaseAt": "1976-03-14T00:00:00Z", "trialPrice": 9}, {"currencyCode": "c9gj5vyUMAAmIHYb", "currencyNamespace": "sxG5N066FXb88SbL", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1999-01-03T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1995-03-05T00:00:00Z", "expireAt": "1989-12-27T00:00:00Z", "price": 64, "purchaseAt": "1999-05-27T00:00:00Z", "trialPrice": 93}, {"currencyCode": "m0XXQJWszvTQEuAL", "currencyNamespace": "zDNp1SZ58aDllwzT", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1974-01-07T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1976-11-13T00:00:00Z", "expireAt": "1991-11-15T00:00:00Z", "price": 49, "purchaseAt": "1971-03-18T00:00:00Z", "trialPrice": 41}], "7Esrg7900nml5Bid": [{"currencyCode": "sK9dCEzhVnOv0PQb", "currencyNamespace": "VIaKiHfoeorY7A1o", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1988-09-15T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1980-06-25T00:00:00Z", "expireAt": "1998-06-02T00:00:00Z", "price": 91, "purchaseAt": "1971-11-15T00:00:00Z", "trialPrice": 19}, {"currencyCode": "m7jK5pxe82pgFiAS", "currencyNamespace": "6piIzmc8rKrKEPGS", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1972-12-27T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1996-04-14T00:00:00Z", "expireAt": "1984-02-22T00:00:00Z", "price": 10, "purchaseAt": "1975-02-08T00:00:00Z", "trialPrice": 60}, {"currencyCode": "NERUf8kjci1Ctccv", "currencyNamespace": "9Gv4tOcbnuCqf0lm", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1985-02-13T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1988-10-10T00:00:00Z", "expireAt": "1971-07-29T00:00:00Z", "price": 66, "purchaseAt": "1975-05-24T00:00:00Z", "trialPrice": 30}], "5kdazlypvt6lSLfU": [{"currencyCode": "7HByGXPMqxj4hBgV", "currencyNamespace": "Y3YAxZLKbcOdyjqf", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1978-03-10T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1988-04-25T00:00:00Z", "expireAt": "1973-10-17T00:00:00Z", "price": 17, "purchaseAt": "1972-01-03T00:00:00Z", "trialPrice": 89}, {"currencyCode": "jNrGNT2VHTKuIT5F", "currencyNamespace": "wwHj0Ur5F2PWGTTD", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1979-03-07T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1991-08-06T00:00:00Z", "expireAt": "1992-04-28T00:00:00Z", "price": 74, "purchaseAt": "1980-09-25T00:00:00Z", "trialPrice": 5}, {"currencyCode": "kYBUjyXAn3bWQF6Q", "currencyNamespace": "cAiJpXIrgroixptZ", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1972-03-26T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1994-09-17T00:00:00Z", "expireAt": "1993-03-26T00:00:00Z", "price": 70, "purchaseAt": "1972-04-12T00:00:00Z", "trialPrice": 57}]}, "saleConfig": {"currencyCode": "NWVIJnhhwFDV1Vit", "price": 0}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "8DY0XOkDstxZcY1H", "stackable": false, "status": "ACTIVE", "tags": ["AnZV4IOglVLqb9lG", "AJUg21Lt7JwgwMUS", "uC3Bajy3BcEMCtQs"], "targetCurrencyCode": "2FcEcvVAyId6Cp85", "targetNamespace": "HVDsZBQgOnXuXsGT", "thumbnailUrl": "hYZrmm0wrFMnPpWg", "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 110 'UpdateItem' test.out

#- 111 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'kwxUNYyNwGiKrknH' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '0Y5mrQgLC6D2qsFi' \
    > test.out 2>&1
eval_tap $? 111 'DeleteItem' test.out

#- 112 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'QHglUQMZi5WjMZfO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 1, "orderNo": "9ie6vvMbiNURrlm8"}' \
    > test.out 2>&1
eval_tap $? 112 'AcquireItem' test.out

#- 113 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '8QlKyuoya4JgakZy' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'UV7t73VnSFbuxd4K' \
    > test.out 2>&1
eval_tap $? 113 'GetApp' test.out

#- 114 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'YZ0jk0UZdhtnKu9o' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tc8pVkiyGsj5JdXz' \
    --body '{"carousel": [{"alt": "RxfNEjUMTs8WIObJ", "previewUrl": "BTsvsw76uISRX0bK", "thumbnailUrl": "VoWtoUW1P7ocuBAl", "type": "image", "url": "VYszm8xY33OQbumu", "videoSource": "youtube"}, {"alt": "QHLyZNuysyM4OfCz", "previewUrl": "dQCXMAWnf87YPNOe", "thumbnailUrl": "9Eevf1fhMg1E2k7Q", "type": "video", "url": "hM84DiZk6ySrB9SV", "videoSource": "youtube"}, {"alt": "2zXyFFVpM87yqEwE", "previewUrl": "acQMTlqN4LKkxJ5v", "thumbnailUrl": "3SBafnKNiMPbFkFG", "type": "video", "url": "N2u5J7baOeLH19fq", "videoSource": "vimeo"}], "developer": "oPYOHiIsxmsLBPBJ", "forumUrl": "uNLnWRrtW870qD88", "genres": ["FreeToPlay", "Action", "Racing"], "localizations": {"duZSe7W20UZcDaiq": {"announcement": "0nEZ7PyhqFJkDClO", "slogan": "sKmfsgJdmzsDPsWh"}, "1k0cQ08NG6dX2TZk": {"announcement": "il67kRngoUa83ECh", "slogan": "1gqPeS193TNNzot3"}, "sVli3GN2XTrFibRA": {"announcement": "hzzEWzWlTY70qdgJ", "slogan": "RvpZrSpWX3KEe2Bj"}}, "platformRequirements": {"V00ReCXFffjJJxlg": [{"additionals": "jzIhpgOoIOD74V21", "directXVersion": "HWDAfvXwdxbyp4HA", "diskSpace": "PbBbNPStVBUpKgOs", "graphics": "sFkz0F36piDYXeHZ", "label": "7FHls3nyvconqbHQ", "osVersion": "qKLQKe3xmj6s0Gqs", "processor": "Wncp5LrqbiKudv9z", "ram": "75SzoCV8ZMi2o1nR", "soundCard": "482D6gNClk9c87ho"}, {"additionals": "saPFC5zBW3ZgVZCj", "directXVersion": "9ObVGT0Scwl4kNmC", "diskSpace": "i15XTJTgCNNH7RtG", "graphics": "5Xmo9Q0Wb07N17fk", "label": "xZSc6VbE0AGcekjM", "osVersion": "NHuPXtz8tXxrmzaf", "processor": "MUguyDoN91uc28Ho", "ram": "SpGt1g0GGbT4Hf2P", "soundCard": "PKOldkbgX9CWJKwX"}, {"additionals": "XSbv5eg9q86IaDFj", "directXVersion": "jx6uZerWbtwTX9gN", "diskSpace": "RByjbE8lOLAfTXKL", "graphics": "zbrddqcKLa7LevxN", "label": "HOSEhQRZIp693lRw", "osVersion": "tc43atCuCFxbfbz4", "processor": "aQERziPL4dHhOqG5", "ram": "KDdUvk0LEi26Ls7m", "soundCard": "jRxNmvvNtjJNQepU"}], "TGhwlY4lPzlsCR5r": [{"additionals": "VsyfcH7WjP7HuGz3", "directXVersion": "b5WAEvdRF9bqMj4r", "diskSpace": "o5B19VE838c7OydV", "graphics": "w0zCqoMZvpIOO97D", "label": "mQ5ZOzx6iCJTu60I", "osVersion": "ifzMhkk5PxsjqbCK", "processor": "pMv2Yky9DYkD2sIl", "ram": "lFtBtXJKG3rqBmIL", "soundCard": "htWm8RQvRUbUDSie"}, {"additionals": "fGEdLucrtO2gCQD0", "directXVersion": "57DrDlgC2nzS9SiG", "diskSpace": "UjVAw4v3q6JRHcn7", "graphics": "KaoCEkRdo6qHYIZW", "label": "nXqQ1oHFJ9Q0vqsL", "osVersion": "9SomqWsGA76yxi0Q", "processor": "zZWfmP2sx0KO5bEJ", "ram": "aPnAFjsodyJQVVBr", "soundCard": "ShGbIIuqK8C403Hg"}, {"additionals": "oXCR6XOMXwKdfqk8", "directXVersion": "T4QHK30EX0FclpDl", "diskSpace": "5HsuracO5MnjnxD1", "graphics": "OXkxShFVQTRekLfj", "label": "my8zosRCRgVwbrQK", "osVersion": "mb01yA7U7dGMjupZ", "processor": "kZQY8CNyT4k3DIbf", "ram": "T22G5NpE130YWSgx", "soundCard": "pKWtdtdtVW9anENm"}], "xb9e7vXZV3ig8Jg5": [{"additionals": "VByeI3ycMcYYBixK", "directXVersion": "JXCISQdwec1m8Bus", "diskSpace": "V9tUh74KVo6Xqjz2", "graphics": "xUKLNWSmYyVvyelI", "label": "J8QgaLMqi836ULa7", "osVersion": "cfZl4VuY6rsZyo6C", "processor": "BRRnoOikIxXKKIR6", "ram": "kPmswm5TCAU1cKAp", "soundCard": "dJDnE73GLmSZns5o"}, {"additionals": "wBhoUg4LsGP6KLPX", "directXVersion": "kvUv2XiXaBzsmaxj", "diskSpace": "TZPlLitytGka7Kv5", "graphics": "TacQKF4OlRGdmXxE", "label": "TLEQrr3KCAV9alq3", "osVersion": "hK1G4kKooSNNUZui", "processor": "ynZ64IwncZPk82GF", "ram": "3eTC0vzZUDj9dzGg", "soundCard": "GVxo9OHgfHumyfuB"}, {"additionals": "NisecYbcOpR45VDl", "directXVersion": "vSc0Mr7ImwCwGqOf", "diskSpace": "0bNs97KvKyj3MqS7", "graphics": "Dcmtfh50eObbrmgj", "label": "hWK0x0ZidAJ1CU1e", "osVersion": "D1La16Bw3JbUnUDh", "processor": "5yGjjv4Mwrv2vanc", "ram": "mR6Z7rb21A2E9pX0", "soundCard": "BWCMqPsRk5htdM5T"}]}, "platforms": ["IOS", "Android", "Linux"], "players": ["MMO", "Coop", "Single"], "primaryGenre": "Sports", "publisher": "rSHrkoqv2mM6soMa", "releaseDate": "1994-08-31T00:00:00Z", "websiteUrl": "vQq2a9YdFNtRVSO0"}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateApp' test.out

#- 115 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'js0hG9xmSnzd7zgU' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xAogcnGkXk17QPkJ' \
    > test.out 2>&1
eval_tap $? 115 'DisableItem' test.out

#- 116 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'HRhmLKQuQVFSKiXl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetItemDynamicData' test.out

#- 117 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '8G2uf6E8EajXLSAS' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8MKMaxQ1QyJCpKed' \
    > test.out 2>&1
eval_tap $? 117 'EnableItem' test.out

#- 118 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'huzI7G9NCKKXu1bq' \
    --itemId 'I2M5PmXfKnQ7BYGj' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CUDMOrbmoRvWnfmG' \
    > test.out 2>&1
eval_tap $? 118 'FeatureItem' test.out

#- 119 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'Fy0eUoOBd90h9EDq' \
    --itemId 'STOfoNewWjwMWDKE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 't6JhbJ0fwTDaq6b5' \
    > test.out 2>&1
eval_tap $? 119 'DefeatureItem' test.out

#- 120 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'RpMwhWPtndriXU9l' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'oOxpmEuwDVc12r0D' \
    --populateBundle  \
    --region 'VUGgGHkapTCafFMd' \
    --storeId 'vYiCBuzUUwyI6Vtd' \
    > test.out 2>&1
eval_tap $? 120 'GetLocaleItem' test.out

#- 121 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '4v9k4fv3kMiuQ3Dh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sKLxjt5srPFxBgpF' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 3, "comparison": "isNot", "name": "15QeIQF51c4MqJzD", "predicateType": "SeasonTierPredicate", "value": "BAhAlJGI2YYb6ajB", "values": ["tHxDb06ZFy3uglSp", "jgq6eY4PBNHKPx62", "2UxvF2uLXWilRD7H"]}, {"anyOf": 61, "comparison": "isLessThanOrEqual", "name": "6LCgdFxRGj00RT6L", "predicateType": "SeasonPassPredicate", "value": "TQ8gIDRdD2wwMXwK", "values": ["Hc9r8eToFmkHJ6BP", "VXGPhEJsc7rZpxaP", "OKFLxIwKssw647Yw"]}, {"anyOf": 61, "comparison": "isLessThan", "name": "3HWJw9zIWsiP2JQ2", "predicateType": "EntitlementPredicate", "value": "l07jPlcYaqYM7YfB", "values": ["48dKPCFUIeyYEymN", "mhjI9Y28qVceS9UX", "XzNX6TGh4UdEweeB"]}]}, {"operator": "or", "predicates": [{"anyOf": 74, "comparison": "isNot", "name": "2e6gtn5pUARJM1T8", "predicateType": "SeasonTierPredicate", "value": "aixUUvmzbajE2gjo", "values": ["oiDnc1NUb51lEgUw", "Q9tkWaMOH47CAT7c", "BP0918JaEBQBP766"]}, {"anyOf": 77, "comparison": "isLessThan", "name": "UnBBR84iAO7sBQt6", "predicateType": "SeasonTierPredicate", "value": "J2tWwF7RnP1oK3c4", "values": ["24ol1qqbalgizL97", "RVfjB0zi3XrYZUiN", "ycJV5YqE2myQzl7X"]}, {"anyOf": 75, "comparison": "includes", "name": "9pmAIc6VSfE9nbE2", "predicateType": "SeasonTierPredicate", "value": "Df9B22HGgxakPt7I", "values": ["CF1vyamjsEzwtLPx", "YzaZUTmvsEzLPnnG", "snfmBerp84qjwzWp"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isGreaterThanOrEqual", "name": "aEMW5bhJyL72WDyh", "predicateType": "SeasonPassPredicate", "value": "FfC8x5aHLsXHlm1R", "values": ["FddYvifGHawNx6yh", "JTTy9JrNz1K5M1qg", "niEHLbEQKc0aUvrK"]}, {"anyOf": 16, "comparison": "isNot", "name": "lh80BhYe2fJDS6T7", "predicateType": "SeasonTierPredicate", "value": "DhjlxUyrs3OSesE5", "values": ["BxMSdOOsn2Nd8Jpa", "p0DwUj2HKUvPYUcQ", "19GJDK46Eehx7xas"]}, {"anyOf": 34, "comparison": "isGreaterThanOrEqual", "name": "9aulsL6NOV5agpS6", "predicateType": "SeasonPassPredicate", "value": "UeKKlPKtE6gnYxmk", "values": ["mCWbs5qugklBUS6u", "wWrCQt86Jrg8tLAJ", "WpcyNkUvqn6eXr6F"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 121 'UpdateItemPurchaseCondition' test.out

#- 122 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'NbKJ05Orya6LSSUl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "ugIAknXcSaVYcAYp"}' \
    > test.out 2>&1
eval_tap $? 122 'ReturnItem' test.out

#- 123 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --name 'K9JrK6Or2xx7rLwr' \
    --offset '86' \
    --tag 'vpOjrpRo4mYrCeQU' \
    > test.out 2>&1
eval_tap $? 123 'QueryKeyGroups' test.out

#- 124 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "nYoID2UqO0iAXA9d", "name": "B4ib8HDOJ8TNiP8K", "status": "ACTIVE", "tags": ["OXvGSrdkqddI3ezq", "u6FB0sL2xt6fX9j7", "rhZCAlDlVKBsLZiB"]}' \
    > test.out 2>&1
eval_tap $? 124 'CreateKeyGroup' test.out

#- 125 GetKeyGroupByBoothName
eval_tap 0 125 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 126 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'RXszE7CL1cQCSoqH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetKeyGroup' test.out

#- 127 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'vH7g63cOx6yrIw37' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "pKOLrF5i3gr3Cc4M", "name": "2O7NrTQO7KLdZDGw", "status": "INACTIVE", "tags": ["E5gcfF8AMGZ2FBS9", "3Mg6TKwdRMraDLrw", "h3d0ykRGkgqUNIbJ"]}' \
    > test.out 2>&1
eval_tap $? 127 'UpdateKeyGroup' test.out

#- 128 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'MJ9ABbKVWO2YEDiq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetKeyGroupDynamic' test.out

#- 129 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'kwKbpdk7wlDngNiP' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '80' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 129 'ListKeys' test.out

#- 130 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'foL7JCcMo7GxxXdb' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 130 'UploadKeys' test.out

#- 131 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'YCRexPekTsQxMTfa' \
    --limit '91' \
    --offset '81' \
    --orderNos 'ot7aohFYy4VxwHIJ,9gzxqAw4vBGQAeh0,VTiTP4PSrXUS6jYI' \
    --sortBy '9lsQFD43Df5qUZOF' \
    --startTime 'zpFd6b5Jc5TETHcu' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 131 'QueryOrders' test.out

#- 132 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'GetOrderStatistics' test.out

#- 133 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jFZgF3erw7UsyHq4' \
    > test.out 2>&1
eval_tap $? 133 'GetOrder' test.out

#- 134 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bBb0n1JhPUS8BRPG' \
    --body '{"description": "V9n769zLJdKMexeJ"}' \
    > test.out 2>&1
eval_tap $? 134 'RefundOrder' test.out

#- 135 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetPaymentCallbackConfig' test.out

#- 136 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "AtqE3kuybwTQFYEJ", "privateKey": "jIYwqfSRy8GgVk77"}' \
    > test.out 2>&1
eval_tap $? 136 'UpdatePaymentCallbackConfig' test.out

#- 137 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'fd1GS5YkyhAiAItn' \
    --externalId 'WUmD225fp1egsx3E' \
    --limit '36' \
    --notificationSource 'ALIPAY' \
    --notificationType '8JyX4IE1z3rDwZ1H' \
    --offset '74' \
    --paymentOrderNo 'rlzrJ4QHbfnAdtku' \
    --startDate 'jxHff7n1yaNCcjgF' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 137 'QueryPaymentNotifications' test.out

#- 138 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'S0URBhl0L5FCbOn4' \
    --limit '73' \
    --offset '100' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 138 'QueryPaymentOrders' test.out

#- 139 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "B2uPQLrt2t6bVpCg", "currencyNamespace": "KvPXSDufmKh783cV", "customParameters": {"54JsVBRB0rY0xfWd": {}, "dACyHSmo4KX9TPO3": {}, "K1k5ZM8btmGsgXNX": {}}, "description": "bpqxh76Af5JSwjw2", "extOrderNo": "fE2g6jXV7oai2oDm", "extUserId": "9FaP0HJ98tE4UyoQ", "itemType": "BUNDLE", "language": "BN-pKaa-419", "metadata": {"9OutADrNGBWSJ1zQ": "KxVmRTawjiZPMoZZ", "cyGEHxAKDQher3us": "ApPdJPn9eIdhIBvT", "TupABJ4RwH3EdKmY": "tbqQHNfIZwrMxf3E"}, "notifyUrl": "nzZVnkLT0Lb85nmp", "omitNotification": false, "platform": "Bbs4PAV72u8AxE2I", "price": 88, "recurringPaymentOrderNo": "Sy4kyqyKgrtEPdXX", "region": "lt8geCdiXu3iNvn7", "returnUrl": "vLZ7h6alhJNGZF07", "sandbox": false, "sku": "dm4TNs8mAj6IKSYF", "subscriptionId": "dJwgZsRPOzwuDSdG", "targetNamespace": "l1A2vaNeDiSqTfmA", "targetUserId": "Vg50kOdJagEmTuax", "title": "lxgywkbdOsyxX1tf"}' \
    > test.out 2>&1
eval_tap $? 139 'CreatePaymentOrderByDedicated' test.out

#- 140 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'W488oYUT4jyCVJ0V' \
    > test.out 2>&1
eval_tap $? 140 'ListExtOrderNoByExtTxId' test.out

#- 141 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8obTlGVThz4bm41o' \
    > test.out 2>&1
eval_tap $? 141 'GetPaymentOrder' test.out

#- 142 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IcV33yjPxibDjfF7' \
    --body '{"extTxId": "JkjCVpZKMxkFkBtX", "paymentMethod": "MU6KRIm5xBoIi99c", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 142 'ChargePaymentOrder' test.out

#- 143 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'G8tlkxWKCU1XN4gl' \
    --body '{"description": "7yHvEqpJSrDXVwCk"}' \
    > test.out 2>&1
eval_tap $? 143 'RefundPaymentOrderByDedicated' test.out

#- 144 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hOQ161TFjROYJm75' \
    --body '{"amount": 98, "currencyCode": "UHeCpqnZ5NW623WW", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 84, "vat": 59}' \
    > test.out 2>&1
eval_tap $? 144 'SimulatePaymentOrderNotification' test.out

#- 145 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JY3QvRa7CDRTcsAH' \
    > test.out 2>&1
eval_tap $? 145 'GetPaymentOrderChargeStatus' test.out

#- 146 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 146 'GetPlatformWalletConfig' test.out

#- 147 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Epic", "Epic", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 147 'UpdatePlatformWalletConfig' test.out

#- 148 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 148 'ResetPlatformWalletConfig' test.out

#- 149 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetRevocationConfig' test.out

#- 150 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateRevocationConfig' test.out

#- 151 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'DeleteRevocationConfig' test.out

#- 152 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'bcv3IwmL7a1K3zIU' \
    --limit '29' \
    --offset '72' \
    --source 'DLC' \
    --startTime 'M80LLbku9GYH4ijq' \
    --status 'SUCCESS' \
    --transactionId 'VM50tCqkZfsSxAbD' \
    --userId 'J7sHCLup8pmEosOX' \
    > test.out 2>&1
eval_tap $? 152 'QueryRevocationHistories' test.out

#- 153 GetLootBoxPluginConfig1
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetLootBoxPluginConfig1' test.out

#- 154 UpdateLootBoxPluginConfig1
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "glQwwdeLVpmXqRwV"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "XweiCnDldRPRfd6m"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateLootBoxPluginConfig1' test.out

#- 155 DeleteLootBoxPluginConfig1
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'DeleteLootBoxPluginConfig1' test.out

#- 156 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 156 'UploadRevocationPluginConfigCert' test.out

#- 157 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "0GTJwEjoZrRtaeWK", "eventTopic": "MC8wsOByQAMAgqFE", "maxAwarded": 53, "maxAwardedPerUser": 62, "namespaceExpression": "Et8umj5XhKnw7MHD", "rewardCode": "wFVKUC2ecnpUDqvL", "rewardConditions": [{"condition": "QixPKVSmWa8TGko1", "conditionName": "6XTqHc0cM7ixq8Tj", "eventName": "nxp5Cl8ggaEmCcuK", "rewardItems": [{"duration": 43, "endDate": "1975-03-11T00:00:00Z", "itemId": "HviBEWpbusO6EyVq", "quantity": 37}, {"duration": 40, "endDate": "1981-12-27T00:00:00Z", "itemId": "pgZpbz77y88rUFum", "quantity": 19}, {"duration": 56, "endDate": "1972-09-14T00:00:00Z", "itemId": "A8iKcF0bkfjcTEFX", "quantity": 5}]}, {"condition": "lGc1636nbfM3J9G4", "conditionName": "0Y62bCo941ALznQu", "eventName": "HVskfCjUK8GeX4Q0", "rewardItems": [{"duration": 56, "endDate": "1989-08-18T00:00:00Z", "itemId": "j4IqWK09l4wkrzah", "quantity": 89}, {"duration": 49, "endDate": "1998-05-20T00:00:00Z", "itemId": "sDEDVKDINE3HjCiV", "quantity": 90}, {"duration": 24, "endDate": "1998-01-20T00:00:00Z", "itemId": "5YwgZpjlMMtPWg82", "quantity": 31}]}, {"condition": "7m7qNkQiKp2oac8Q", "conditionName": "TNEuBbeuQqm9wM7m", "eventName": "gTtUdPVcQijMBhs0", "rewardItems": [{"duration": 21, "endDate": "1986-08-06T00:00:00Z", "itemId": "P6d3nuUZ41mSeS9S", "quantity": 28}, {"duration": 86, "endDate": "1987-11-15T00:00:00Z", "itemId": "qhJOvykBcDpzD9zh", "quantity": 81}, {"duration": 8, "endDate": "1985-06-11T00:00:00Z", "itemId": "E0HRsE0GHDOFjrfq", "quantity": 73}]}], "userIdExpression": "xH2Up9VthPjFrK7H"}' \
    > test.out 2>&1
eval_tap $? 157 'CreateReward' test.out

#- 158 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ip0eONFDgUPShG8w' \
    --limit '46' \
    --offset '27' \
    --sortBy 'rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 158 'QueryRewards' test.out

#- 159 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'ExportRewards' test.out

#- 160 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 160 'ImportRewards' test.out

#- 161 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'sBKGsALPuCOyphUU' \
    > test.out 2>&1
eval_tap $? 161 'GetReward' test.out

#- 162 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'AV95708zaP0wpZgQ' \
    --body '{"description": "EvFzox9wHocX3DRW", "eventTopic": "obEoGr8W97KBedcr", "maxAwarded": 62, "maxAwardedPerUser": 86, "namespaceExpression": "WUT8cAFO5zEw8GEN", "rewardCode": "EJYPKxxOw7xNQ98I", "rewardConditions": [{"condition": "Ebc9YITN98j4P2AG", "conditionName": "eidXRRnIAJfKVjOn", "eventName": "6rtILNJVv2DLLUyB", "rewardItems": [{"duration": 41, "endDate": "1993-12-21T00:00:00Z", "itemId": "hDs45siG30Lv9iGa", "quantity": 26}, {"duration": 9, "endDate": "1976-04-06T00:00:00Z", "itemId": "jnRXVcg6AByNpBo2", "quantity": 73}, {"duration": 84, "endDate": "1997-04-15T00:00:00Z", "itemId": "kwLdmR97u9MVUii4", "quantity": 74}]}, {"condition": "4IZ0Dv6b8WtaMVvL", "conditionName": "bG04KKnh3jvW0Qp3", "eventName": "kTyL4CsLwiWUMcpx", "rewardItems": [{"duration": 27, "endDate": "1998-08-02T00:00:00Z", "itemId": "B6XoTNMuqZTHwo1I", "quantity": 55}, {"duration": 62, "endDate": "1989-10-29T00:00:00Z", "itemId": "Qpb6r8ZeaSHwQuiH", "quantity": 84}, {"duration": 89, "endDate": "1984-09-26T00:00:00Z", "itemId": "u4G6bXxp0gYZyF9f", "quantity": 72}]}, {"condition": "dJ2boQqCCyJfThvC", "conditionName": "JieqRSGN8Mm74HlS", "eventName": "Zzp4aEW4GkHG5OIV", "rewardItems": [{"duration": 42, "endDate": "1980-09-26T00:00:00Z", "itemId": "Muss76ezTrsDZNYU", "quantity": 97}, {"duration": 93, "endDate": "1992-03-03T00:00:00Z", "itemId": "xqa9XM2gY14iWk12", "quantity": 72}, {"duration": 64, "endDate": "1973-03-27T00:00:00Z", "itemId": "fk8dwKNPUOHNZxML", "quantity": 13}]}], "userIdExpression": "yoBM9qxd6PWz7sVn"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateReward' test.out

#- 163 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Mxge2inL8fBFP1AB' \
    > test.out 2>&1
eval_tap $? 163 'DeleteReward' test.out

#- 164 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aIKrEt8d3o7cTS9O' \
    --body '{"payload": {"IIMErnNTLXHrsOFs": {}, "bhRow4iaYKy0IjsD": {}, "gbJ37DN2lDvdh7ok": {}}}' \
    > test.out 2>&1
eval_tap $? 164 'CheckEventCondition' test.out

#- 165 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Hl1wMht2Izq7TCUJ' \
    --body '{"conditionName": "hDsDefAS09VyQB1v", "userId": "R1mx6K17GL1CrO4Z"}' \
    > test.out 2>&1
eval_tap $? 165 'DeleteRewardConditionRecord' test.out

#- 166 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'uoGZSxTzm8oMSPIH' \
    --limit '85' \
    --offset '8' \
    --start 'tqzIWIzg8pbjnt1i' \
    --storeId 'BV8DpbjGts4UZDTf' \
    --viewId 'hAyZKhqilty9NVlg' \
    > test.out 2>&1
eval_tap $? 166 'QuerySections' test.out

#- 167 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xUmnfdOAmu1dX1Nq' \
    --body '{"active": true, "displayOrder": 35, "endDate": "1999-12-07T00:00:00Z", "ext": {"0RUvvYeJZw6QZFN7": {}, "wFCnqpvNesGiVnt9": {}, "p2to7Yja1soDE1K0": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 66, "itemCount": 35, "rule": "SEQUENCE"}, "items": [{"id": "MYwPmPXC2LfL2m5r", "sku": "P2A20t6foPPH94SU"}, {"id": "inY5diUlqgvY7dPP", "sku": "yahppgxJhk4EdTZ0"}, {"id": "00rS92594HLvWFsX", "sku": "HtMP0k9L5dREQbCq"}], "localizations": {"fh0gpABFBER6WNcD": {"description": "OsRzBkf9A6HjCnFR", "localExt": {"dSihcvszzQLZBktk": {}, "0siMup01kyaFwwD7": {}, "wecuQb4GNQHVZMKG": {}}, "longDescription": "Bnzh4suaGIzttTnc", "title": "VBf5g3oeuHiNyLkf"}, "PQPmjUkvSs5YmIej": {"description": "ozmG5HlrIfMAvvpk", "localExt": {"AHRJHZyfrXZmiJX4": {}, "CjKCeIRIr997KKpJ": {}, "XTLbYWpqeXjaf1f5": {}}, "longDescription": "fjNMZjKJ05puX319", "title": "7WrMnJtovSMFw8X4"}, "zxbdfXgunt1oMNZ6": {"description": "8eovHSH3xV3URIRV", "localExt": {"DYBd6hMB0l7sg7If": {}, "MH5Tu1ky1ZYvyeHm": {}, "foFkUDP864shbnQ3": {}}, "longDescription": "bVvuvpsDJXPCWkX4", "title": "Kpi8CJ88aMPGFFAQ"}}, "name": "ZbfbmVTEbiRq5Jui", "rotationType": "CUSTOM", "startDate": "1982-04-12T00:00:00Z", "viewId": "CVlYQi9cfMCeNnu6"}' \
    > test.out 2>&1
eval_tap $? 167 'CreateSection' test.out

#- 168 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OIG1PPLRDEXLXZWX' \
    > test.out 2>&1
eval_tap $? 168 'PurgeExpiredSection' test.out

#- 169 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'vqNCHvNpeMjMzguq' \
    --storeId '6HFIqaqwH9J6JLb5' \
    > test.out 2>&1
eval_tap $? 169 'GetSection' test.out

#- 170 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'f3SBMyJUdwEBRrHA' \
    --storeId 'WUFqTooGGnPEgY0t' \
    --body '{"active": false, "displayOrder": 23, "endDate": "1987-11-08T00:00:00Z", "ext": {"2byOwXgKyPhXmcys": {}, "ae8HpWH4xiz3fWth": {}, "JSu2pUIIuPLFAtcW": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 36, "itemCount": 20, "rule": "SEQUENCE"}, "items": [{"id": "AP57QbWvSSp71zEP", "sku": "PfmAQiqRRC2caquM"}, {"id": "RtQOILcaDqUITBHQ", "sku": "R5ISNoFR3GUxdMuv"}, {"id": "mL0UBfwzaaeP3Wd0", "sku": "Wrb8s3GW0CY0vAfb"}], "localizations": {"q8xoCurq4lpHXrbV": {"description": "Bh60NUA2aKQwnXrm", "localExt": {"i6ya8u4sQPvaf1Ac": {}, "weR7tJW3MLMob1hU": {}, "nIzIpUM8KK1kGFN0": {}}, "longDescription": "NUNGKxdlAUDFQuGP", "title": "zAuT7M6OBrNwioKn"}, "XPVZaDcXsV1TnsZi": {"description": "oDiBgprzahPB0FKM", "localExt": {"a0YeyNBQWUHDBnBe": {}, "ePkqg6Zt1Lr5BlO8": {}, "K6LH4dSaa8XYHug5": {}}, "longDescription": "1ZTogG0N7Hvnuq1k", "title": "J1kpHcQtnIc9z70L"}, "FQMI0oZuEjY0rNBb": {"description": "bB9txAvtRQvqJacX", "localExt": {"R2Rf4noXDFaEUkPU": {}, "BnB0ZEJH3ebM71Tg": {}, "922xiBgHSka0Pz7I": {}}, "longDescription": "1WkIa0oZ1nXpW1l7", "title": "0pcZgIn4lPghHyME"}}, "name": "HBzArbyW10NkJFQx", "rotationType": "FIXED_PERIOD", "startDate": "1977-11-13T00:00:00Z", "viewId": "Ce4txY0MsPc9EMgf"}' \
    > test.out 2>&1
eval_tap $? 170 'UpdateSection' test.out

#- 171 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '9JCJiEvhL8ZfwCVJ' \
    --storeId 'W9yspUOyHC9eKeXz' \
    > test.out 2>&1
eval_tap $? 171 'DeleteSection' test.out

#- 172 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 172 'ListStores' test.out

#- 173 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "rvzBllwzyC1aTWEm", "defaultRegion": "Pgoy4TkpEw4Zeid4", "description": "mRoFNxv10ckMQVjK", "supportedLanguages": ["k3bWJ0ZuYSe3sI0x", "2hc8vaN1Off5gRZZ", "MW3huAIzBPWBYKAE"], "supportedRegions": ["FTdlKNh6GTzKjsCq", "xx24QM35bSkFrvGc", "iNHb7OY5YIpOLJW5"], "title": "2uz3c8pz63M0g4xX"}' \
    > test.out 2>&1
eval_tap $? 173 'CreateStore' test.out

#- 174 ImportStore
eval_tap 0 174 'ImportStore # SKIP deprecated' test.out

#- 175 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 175 'GetPublishedStore' test.out

#- 176 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'DeletePublishedStore' test.out

#- 177 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'GetPublishedStoreBackup' test.out

#- 178 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'RollbackPublishedStore' test.out

#- 179 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'T5Ts4e0uR47OzUGH' \
    > test.out 2>&1
eval_tap $? 179 'GetStore' test.out

#- 180 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eBKtpvyRNgjZkdDp' \
    --body '{"defaultLanguage": "pvEJiUiDGXgh8BKc", "defaultRegion": "LqtRZ93LuR8OEyIC", "description": "vwgwBFehwtdJLdn3", "supportedLanguages": ["R2wo8beVQvgeP9qO", "HaLwYnXxrz7sLmP7", "0LxN0f3JA27Qz5Sj"], "supportedRegions": ["zQfOLYu9O46OOzz9", "p57qSpHerzO87cg7", "TqtMiQgi7Aj28qCR"], "title": "bwwZc4ZS1NMkrnHs"}' \
    > test.out 2>&1
eval_tap $? 180 'UpdateStore' test.out

#- 181 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '1Iyhwqk140MolIrn' \
    > test.out 2>&1
eval_tap $? 181 'DeleteStore' test.out

#- 182 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lkRVbcX435TDYpkk' \
    --action 'UPDATE' \
    --itemSku 'BiphIFe2bzr6qQw6' \
    --itemType 'BUNDLE' \
    --limit '61' \
    --offset '91' \
    --selected  \
    --sortBy 'updatedAt' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'TO9SDKnMlnKW9jiN' \
    --updatedAtStart 'Mu9QVrMeD4bD8gIS' \
    > test.out 2>&1
eval_tap $? 182 'QueryChanges' test.out

#- 183 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E34yIAZQeigiA3wB' \
    > test.out 2>&1
eval_tap $? 183 'PublishAll' test.out

#- 184 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rmBYIlZeheP72AB8' \
    > test.out 2>&1
eval_tap $? 184 'PublishSelected' test.out

#- 185 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EO3YrlyrWowUpUDV' \
    > test.out 2>&1
eval_tap $? 185 'SelectAllRecords' test.out

#- 186 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LlTtuJJsHZVsG6iz' \
    --action 'UPDATE' \
    --itemSku '4kZURmoGgxVRMPf8' \
    --itemType 'BUNDLE' \
    --type 'ITEM' \
    --updatedAtEnd '1rbhfIMStMnSqrKW' \
    --updatedAtStart 'YOuITlYS2RYaD9WN' \
    > test.out 2>&1
eval_tap $? 186 'GetStatistic' test.out

#- 187 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KGhbLhjz1v0RBIO2' \
    > test.out 2>&1
eval_tap $? 187 'UnselectAllRecords' test.out

#- 188 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'rkJGmPaK6HEVIQJd' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3930TGewjRyfo4nW' \
    > test.out 2>&1
eval_tap $? 188 'SelectRecord' test.out

#- 189 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'VZZbKFsKOmgEhjH2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wFzCpxxJLfAg5cFT' \
    > test.out 2>&1
eval_tap $? 189 'UnselectRecord' test.out

#- 190 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '0gHAkltcR3eHFbiA' \
    --targetStoreId 'luHv7Hssd05pHBJX' \
    > test.out 2>&1
eval_tap $? 190 'CloneStore' test.out

#- 191 ExportStore
eval_tap 0 191 'ExportStore # SKIP deprecated' test.out

#- 192 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'ln8PZbYVD8RiaTsd' \
    --limit '60' \
    --offset '32' \
    --sku '4d3kSbTkHPMUvOAU' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId '315FKDjG2ApSV94J' \
    > test.out 2>&1
eval_tap $? 192 'QuerySubscriptions' test.out

#- 193 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'y6yCSXBqJqjAbVwS' \
    > test.out 2>&1
eval_tap $? 193 'RecurringChargeSubscription' test.out

#- 194 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'aoj1ugjr8mPkr3tZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'GetTicketDynamic' test.out

#- 195 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '506ERSVy5M3rrkxu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "0U9h9gCNVZxHGxhZ"}' \
    > test.out 2>&1
eval_tap $? 195 'DecreaseTicketSale' test.out

#- 196 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'qNXJ6JXSh0Z3SWIS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 196 'GetTicketBoothID' test.out

#- 197 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 's1dYrJKmx1BT6iLF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 87, "orderNo": "9QdPuWeMEeL0EJG6"}' \
    > test.out 2>&1
eval_tap $? 197 'IncreaseTicketSale' test.out

#- 198 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '7g4W1eAmDxP23qst' \
    --body '{"achievements": [{"id": "MuikKc6VNU8570si", "value": 99}, {"id": "rZAyuLcZoEkPpqKh", "value": 86}, {"id": "ypqCWMDPRI2cCk8z", "value": 69}], "steamUserId": "esuiDrquccz4J6fF"}' \
    > test.out 2>&1
eval_tap $? 198 'UnlockSteamUserAchievement' test.out

#- 199 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QezJ5E3iYHIknvPc' \
    --xboxUserId 'JkjRevVYfiExpAgo' \
    > test.out 2>&1
eval_tap $? 199 'GetXblUserAchievements' test.out

#- 200 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'K9YDq1x3dkbJFDEB' \
    --body '{"achievements": [{"id": "EOOvJ5BKeipIldsg", "value": 55}, {"id": "9GaukfCEIeSBLhTf", "value": 51}, {"id": "DQCfwucHRL3o2Nst", "value": 36}], "serviceConfigId": "zyh1N0JEKNoMtHvj", "titleId": "M7X1fjzknv2HZMIL", "xboxUserId": "2P2bh14LroFTnAuu"}' \
    > test.out 2>&1
eval_tap $? 200 'UpdateXblUserAchievement' test.out

#- 201 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'jPeP9N0vdVB5a2Xk' \
    > test.out 2>&1
eval_tap $? 201 'AnonymizeCampaign' test.out

#- 202 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'S3XQfMuzZh4AhZRe' \
    > test.out 2>&1
eval_tap $? 202 'AnonymizeEntitlement' test.out

#- 203 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '2hgU56xtyJtnbTDX' \
    > test.out 2>&1
eval_tap $? 203 'AnonymizeFulfillment' test.out

#- 204 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'u7FbleSP5PcdOuq0' \
    > test.out 2>&1
eval_tap $? 204 'AnonymizeIntegration' test.out

#- 205 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'm0rvakR8rcwojLRj' \
    > test.out 2>&1
eval_tap $? 205 'AnonymizeOrder' test.out

#- 206 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'hcaJ56nGlYZ2tod2' \
    > test.out 2>&1
eval_tap $? 206 'AnonymizePayment' test.out

#- 207 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'BGBXjNyRCtPOr1FU' \
    > test.out 2>&1
eval_tap $? 207 'AnonymizeRevocation' test.out

#- 208 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '3QZy3gdDms3kb1ht' \
    > test.out 2>&1
eval_tap $? 208 'AnonymizeSubscription' test.out

#- 209 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'W0UGJpwQZlXuzu3m' \
    > test.out 2>&1
eval_tap $? 209 'AnonymizeWallet' test.out

#- 210 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '9u67JjCDwg186hGW' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 210 'GetUserDLCByPlatform' test.out

#- 211 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'fO9MnoT3t99Hmcxz' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 211 'GetUserDLC' test.out

#- 212 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hDg2kMgkvhoQe9gD' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'ukDVdweG0sFHxTHa' \
    --features '2k60SzCqUgq1gLbc,IMevTmC631p7q794,bu49lINFTtERAXT2' \
    --itemId 'h3hcQ2wV3ZbBTnNQ,nVUhA5WnzVZdj8ts,yzC4QaLXp3o4TDra' \
    --limit '62' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 212 'QueryUserEntitlements' test.out

#- 213 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lwXqwPfq3VzHQjto' \
    --body '[{"endDate": "1976-06-11T00:00:00Z", "grantedCode": "x64w1gyvjacKtGqx", "itemId": "MnoAXRlcq0mYWKQY", "itemNamespace": "lqMmu2pvF6rP03bQ", "language": "oQ", "quantity": 71, "region": "T88H6RCW8gJmGzDl", "source": "PROMOTION", "startDate": "1983-08-05T00:00:00Z", "storeId": "tLsR2AGOiPhNt2Id"}, {"endDate": "1987-12-30T00:00:00Z", "grantedCode": "HED9CGo9aUXj3rh0", "itemId": "UyqxVWlIMY5tTJw4", "itemNamespace": "KV104MtMhKHmSjqP", "language": "MrX_Dd", "quantity": 81, "region": "Zx9DJ4V97SJLlrwX", "source": "OTHER", "startDate": "1991-10-05T00:00:00Z", "storeId": "4YHEYLjTSNDf3zaz"}, {"endDate": "1977-05-09T00:00:00Z", "grantedCode": "MrDYKe2eTf1axo16", "itemId": "GqT2vSLLiMvcu39Y", "itemNamespace": "ZJypWzpNXgnoKIz8", "language": "LpAH", "quantity": 72, "region": "JtZTh280vflFMxIh", "source": "OTHER", "startDate": "1992-10-08T00:00:00Z", "storeId": "4QVey9pEz1TV5cUt"}]' \
    > test.out 2>&1
eval_tap $? 213 'GrantUserEntitlement' test.out

#- 214 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBsw01i5Mf7WvbNS' \
    --activeOnly  \
    --appId 'eeDNfUESLlwHv3Jg' \
    > test.out 2>&1
eval_tap $? 214 'GetUserAppEntitlementByAppId' test.out

#- 215 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'teOLyKp8a1VqxXnR' \
    --activeOnly  \
    --limit '15' \
    --offset '59' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 215 'QueryUserEntitlementsByAppType' test.out

#- 216 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBaVcohewKkVuGv9' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 'rM2nhSEanfUYrMU6' \
    > test.out 2>&1
eval_tap $? 216 'GetUserEntitlementByItemId' test.out

#- 217 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'A43UKGpvC1cr5T1P' \
    --ids 'SXhduTWchzXDv3TA,tBjP4HSuiYCbG0Uy,YUJmNL8p6AbdtU0C' \
    > test.out 2>&1
eval_tap $? 217 'GetUserActiveEntitlementsByItemIds' test.out

#- 218 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'DrlQpKB8qoel2QK3' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'qdKu4ROnONpJ849c' \
    > test.out 2>&1
eval_tap $? 218 'GetUserEntitlementBySku' test.out

#- 219 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hqeiUGQMwNwDlYSl' \
    --appIds 'i3p8YaAdel3hHMSL,AiscGRWzkCl1ZKuP,xjDUGRGcCEPjbUy7' \
    --itemIds 'F82Adu9BYRHrVTeh,rqgvEtEs2LpE0qfb,vdU8hlDoC9FnxqBl' \
    --skus 'PBYJ7X6uVy7FWTSf,Mi2CPVGxjcdpdCqV,eePMSqb8y8qJTUQY' \
    > test.out 2>&1
eval_tap $? 219 'ExistsAnyUserActiveEntitlement' test.out

#- 220 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '40Zrpn0vAD9YsPeD' \
    --itemIds 'WrAVQZSvgWuCuLsU,GrVQAbhS54ZuQHKe,rsDmJLUHAKtfXCKO' \
    > test.out 2>&1
eval_tap $? 220 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 221 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'na8DdjtZhh6ofsUo' \
    --appId 'Rh6r0e0J6vyqPw7Y' \
    > test.out 2>&1
eval_tap $? 221 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 222 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lmV3kES0Hi88UYgS' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'EkCeV29QsQk100eu' \
    > test.out 2>&1
eval_tap $? 222 'GetUserEntitlementOwnershipByItemId' test.out

#- 223 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '5UcxuXXpt0YSPX04' \
    --ids 'uEIdAwgDobopbdJe,VCiKs2vLyH9kcSBd,k7MwQzn28Le5neoh' \
    > test.out 2>&1
eval_tap $? 223 'GetUserEntitlementOwnershipByItemIds' test.out

#- 224 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'qhCzroAzWQDve0Z2' \
    --entitlementClazz 'MEDIA' \
    --sku '5ngNUxDKfZYofPGU' \
    > test.out 2>&1
eval_tap $? 224 'GetUserEntitlementOwnershipBySku' test.out

#- 225 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'bSaA00nKxQjYU6Kl' \
    > test.out 2>&1
eval_tap $? 225 'RevokeAllEntitlements' test.out

#- 226 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'avIiLxU2I1GyJS48' \
    --entitlementIds 'Hxu8Ju4XSAnlXRYB' \
    > test.out 2>&1
eval_tap $? 226 'RevokeUserEntitlements' test.out

#- 227 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '9BgSZBvkehRn83B0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nrW1qx3NJTugVWXz' \
    > test.out 2>&1
eval_tap $? 227 'GetUserEntitlement' test.out

#- 228 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId '8dv7BiEUqnzxs2de' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MF8UAJIHEZv5zyUU' \
    --body '{"endDate": "1983-11-23T00:00:00Z", "nullFieldList": ["ygYx2TqkhlqMnE9W", "j90EQzOidrWnLrXq", "ImgDf3GaJsdCZND0"], "startDate": "1982-07-30T00:00:00Z", "status": "ACTIVE", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 228 'UpdateUserEntitlement' test.out

#- 229 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'YOilX1e1825iasun' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ESjcgr2drXG5NkKC' \
    --body '{"options": ["ySLA8cKCs0dFYRSa", "2OULZ0iOZJiOAh1S", "pLhMF2Pav11FuU8i"], "requestId": "XCRz8KgqgwijYxpG", "useCount": 15}' \
    > test.out 2>&1
eval_tap $? 229 'ConsumeUserEntitlement' test.out

#- 230 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'YC4txul6VKYlNYYl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPwKDpJmkeoAkp3Z' \
    > test.out 2>&1
eval_tap $? 230 'DisableUserEntitlement' test.out

#- 231 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '4pgyJYwclb4gd4Qg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qut2hiPuDdOPHcN9' \
    > test.out 2>&1
eval_tap $? 231 'EnableUserEntitlement' test.out

#- 232 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'drwqytieXpIZfr5X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dq9dGLHjtgE2bTXJ' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementHistories' test.out

#- 233 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'xCCFqPNDqWrpkWnn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ova15WVuE5cYVP9t' \
    > test.out 2>&1
eval_tap $? 233 'RevokeUserEntitlement' test.out

#- 234 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'QSa27BnPyq3I1BLt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GEZDRNkk4DJUofJX' \
    --body '{"reason": "K8RGS0zCYRVmbfzw", "useCount": 95}' \
    > test.out 2>&1
eval_tap $? 234 'RevokeUseCount' test.out

#- 235 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'TKKUBfPNI9f2oLWD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSZexfKVxqdxmh5Q' \
    --body '{"requestId": "WxuQuI7gdDTDb3Wd", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 235 'SellUserEntitlement' test.out

#- 236 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXEEM2KOusNEHcI9' \
    --body '{"duration": 56, "endDate": "1987-06-01T00:00:00Z", "itemId": "GdJvucDbs6UdccuM", "itemSku": "2ykRj3WnyAaUaQBK", "language": "FedL2uduXvZUbQQ1", "order": {"currency": {"currencyCode": "3FhD3NExUFipJsUi", "currencySymbol": "DawAjgHFQk0VzWRN", "currencyType": "VIRTUAL", "decimals": 81, "namespace": "ipbP027okM5E8tAa"}, "ext": {"jVSvLRj306RDuaSi": {}, "xXEdloYZBkatNLc4": {}, "2eq0O6VsXtOlQwj5": {}}, "free": true}, "orderNo": "4hL75QboMHCtzEF9", "origin": "Twitch", "quantity": 1, "region": "Seg6WYgtfuqJHrs4", "source": "DLC", "startDate": "1990-02-20T00:00:00Z", "storeId": "RnWR30MdBZezfwc3"}' \
    > test.out 2>&1
eval_tap $? 236 'FulfillItem' test.out

#- 237 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0qSbMq4GLj8aGsH' \
    --body '{"code": "0qE5p601ak59yFSf", "language": "uk-jOoz-Ou", "region": "iKT57rmbjEnimeR7"}' \
    > test.out 2>&1
eval_tap $? 237 'RedeemCode' test.out

#- 238 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'EFBz43E9FkOPVu2f' \
    --body '{"origin": "System", "rewards": [{"currency": {"currencyCode": "DG5jvMOaXrDlEX42", "namespace": "U0syrGNhBmgT2q0k"}, "item": {"itemId": "IbrJ2S5Pf1Lvg8kY", "itemSku": "EVylINJpxFY8E6pU", "itemType": "8eHjh0aTjIOaQt0s"}, "quantity": 28, "type": "ITEM"}, {"currency": {"currencyCode": "bE0yMvqF7TJ9uB0z", "namespace": "ypjJiu7BIimNuwB3"}, "item": {"itemId": "hBVhuSMHhf5R2Mkx", "itemSku": "QTAYGfE6hXZ7XLoW", "itemType": "CGf0dZEeXBd6mGG6"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "HcZbX2wNnT6A9zos", "namespace": "mDnXoncy7NZQ4PkA"}, "item": {"itemId": "PXBCfkE1Fb0y94eP", "itemSku": "7yh0zsKhR60HZwUw", "itemType": "k48XK7MXHbEwAvvp"}, "quantity": 63, "type": "ITEM"}], "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 238 'FulfillRewards' test.out

#- 239 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hhvxc4xAPZ86WNnQ' \
    --endTime 'OhusPn4466u8agb5' \
    --limit '68' \
    --offset '86' \
    --productId 'UhGAwpYq1UqZydOB' \
    --startTime '0MThZW6LwcAg57BY' \
    --status 'FULFILLED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 239 'QueryUserIAPOrders' test.out

#- 240 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cbi0ifdPyKf3SwHe' \
    > test.out 2>&1
eval_tap $? 240 'QueryAllUserIAPOrders' test.out

#- 241 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWIz4rXlH5jw99Hx' \
    --endTime 'CjXWcaXBcfXXeV7B' \
    --limit '45' \
    --offset '9' \
    --startTime 'Bm2N8PdQ5mQaGXEb' \
    --status 'FAIL' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 241 'QueryUserIAPConsumeHistory' test.out

#- 242 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WA76Kl2mHHoz6qBQ' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "eae_uH", "productId": "DFcmOm1sqdIWU6ER", "region": "ylESgf5dXMrPoYSo", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 242 'MockFulfillIAPItem' test.out

#- 243 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'msp7o3F2LQw7Y2Vd' \
    --itemId 'SxgXez7VvS0C9JLV' \
    --limit '87' \
    --offset '58' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 243 'QueryUserOrders' test.out

#- 244 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ypsceITTkJGGCVF6' \
    --body '{"currencyCode": "LrILDLviUCzmDAaW", "currencyNamespace": "5xz1c7ZuZXUCBYnk", "discountedPrice": 95, "ext": {"0LEBSYBdUSiTOrhB": {}, "8hVs29WOKmZRTtgy": {}, "cLzXz6lUMKi5mweM": {}}, "itemId": "EZo2ZnL1Zg2JfH4f", "language": "73jAevOnES6YJLlb", "options": {"skipPriceValidation": true}, "platform": "Steam", "price": 12, "quantity": 9, "region": "UEEBbqMMKvkOsR1f", "returnUrl": "HUyirMVMOFES2J2O", "sandbox": true, "sectionId": "KTmUnKlrOsJmEwjG"}' \
    > test.out 2>&1
eval_tap $? 244 'AdminCreateUserOrder' test.out

#- 245 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'YN8VNPXNsmwTV8im' \
    --itemId 'JHNI0l6jJVzF1Oi2' \
    > test.out 2>&1
eval_tap $? 245 'CountOfPurchasedItem' test.out

#- 246 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sQuWUBBHZonSmzF8' \
    --userId '31vlCiZAZHCWMXxV' \
    > test.out 2>&1
eval_tap $? 246 'GetUserOrder' test.out

#- 247 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'h8HTrKqVwnpPn8N5' \
    --userId 'xMRgU7cPqNZrLCRR' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "ysya4J3rvTzMTMSw"}' \
    > test.out 2>&1
eval_tap $? 247 'UpdateUserOrderStatus' test.out

#- 248 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rNov2GW9i54JY23A' \
    --userId 'UWFTLq0W1JqwKs1m' \
    > test.out 2>&1
eval_tap $? 248 'FulfillUserOrder' test.out

#- 249 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'O80L7IOHlf6j8PZO' \
    --userId 'zUiQKZqz5NSp0B7L' \
    > test.out 2>&1
eval_tap $? 249 'GetUserOrderGrant' test.out

#- 250 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ODN3Boi2sSAO2n4M' \
    --userId 'ZQt753XQB93rOW0g' \
    > test.out 2>&1
eval_tap $? 250 'GetUserOrderHistories' test.out

#- 251 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uPoQbYzc1RDVhs2l' \
    --userId 'hdzxxgibuqUuyW3c' \
    --body '{"additionalData": {"cardSummary": "Mz9YyduMomEHcU15"}, "authorisedTime": "1993-01-07T00:00:00Z", "chargebackReversedTime": "1980-01-06T00:00:00Z", "chargebackTime": "1983-06-29T00:00:00Z", "chargedTime": "1982-05-22T00:00:00Z", "createdTime": "1999-07-13T00:00:00Z", "currency": {"currencyCode": "rNbE4bbDU4FMTbQa", "currencySymbol": "ANJOODGerDCWcl3V", "currencyType": "REAL", "decimals": 62, "namespace": "0HDtbqMFlgHKQIRt"}, "customParameters": {"LfPngD83roOeqE7f": {}, "cCAeExeQX43LpmdM": {}, "iZeyIrA4QUKSJgEC": {}}, "extOrderNo": "zvaWUCA7wKru7ry3", "extTxId": "AQ2sEHvSxjWoM1rN", "extUserId": "JLM0OOVG5cG6XxEN", "issuedAt": "1971-04-20T00:00:00Z", "metadata": {"WqlX7idzjpKDfwl6": "XlCF6YxFMD8tJQwZ", "vUVInos5RK100yH8": "9i8ZDPXRL8cbTAnt", "B1STaab1UeibXg7R": "Ce5BtKcwj6PqqOgC"}, "namespace": "imr3ZQNBBkrXu9cz", "nonceStr": "sYr3cFeVw70xdNTu", "paymentMethod": "OdLKK0M2B2hbqJin", "paymentMethodFee": 86, "paymentOrderNo": "P69t1KqeGz7qbPnX", "paymentProvider": "XSOLLA", "paymentProviderFee": 95, "paymentStationUrl": "uOzzkoBmMR9C4qPq", "price": 72, "refundedTime": "1999-05-20T00:00:00Z", "salesTax": 53, "sandbox": true, "sku": "Ksfjz1mFkyxoUzfM", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "5VeW9ddxzLPV8wDj", "subscriptionId": "snyPh5yNbYXmlAOi", "subtotalPrice": 50, "targetNamespace": "SC3I1SjkH42LtyZK", "targetUserId": "rTJo0L5sHil4Q0mq", "tax": 1, "totalPrice": 28, "totalTax": 61, "txEndTime": "1987-05-16T00:00:00Z", "type": "atrjbJ5YT7uvqarT", "userId": "vrG1DXZAWlvz3c3X", "vat": 54}' \
    > test.out 2>&1
eval_tap $? 251 'ProcessUserOrderNotification' test.out

#- 252 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pscUpVAciu2XPPUx' \
    --userId 'zXHUvxhvTZcvRKoa' \
    > test.out 2>&1
eval_tap $? 252 'DownloadUserOrderReceipt' test.out

#- 253 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4ozSAg8FTLrByWO' \
    --body '{"currencyCode": "JhbocoGlPzdfxcC3", "currencyNamespace": "rpWhSpq0InxMLpP7", "customParameters": {"n7M3JXjEvsj5WcQ9": {}, "9M1yuXeqV31LX2eh": {}, "cMnM6QtjzQjDlUMC": {}}, "description": "GnxZwak7KHnzGASm", "extOrderNo": "VzePIroz41oQCuXe", "extUserId": "TRyJQrNLTcqLVTN5", "itemType": "SUBSCRIPTION", "language": "Fc-eqdh-765", "metadata": {"8wTi1v2abpCWytPE": "i9Ze0hL9rPkV5GkS", "rcl2O47XVzU7qlNV": "k7qnmBS3XKDhp1Ok", "McErmeH0lX1hj0La": "XgQ94flh775AQfzN"}, "notifyUrl": "jQ7IuMSY2epRDJjD", "omitNotification": true, "platform": "5EVB9ZFzLNsjdCFt", "price": 76, "recurringPaymentOrderNo": "CL8bNTTfqLCv9DYB", "region": "OProN4UWbQaKFrTv", "returnUrl": "4JWElmOCxqPrq9I3", "sandbox": true, "sku": "WBxTLcOef8MgIwkr", "subscriptionId": "KFEtwESJCe2ksG3n", "title": "ZE13H2fILFzOlAZb"}' \
    > test.out 2>&1
eval_tap $? 253 'CreateUserPaymentOrder' test.out

#- 254 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DQAEJLbVWH2XLIg3' \
    --userId 'MgmdSvWp3h0xPsVY' \
    --body '{"description": "8qNwB2TY4v9NNfQS"}' \
    > test.out 2>&1
eval_tap $? 254 'RefundUserPaymentOrder' test.out

#- 255 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'YLFKSl3FNFFJnt3r' \
    --body '{"code": "IwZdW02Su6aCnL81", "orderNo": "6aH6gOBUIMeL0GL3"}' \
    > test.out 2>&1
eval_tap $? 255 'ApplyUserRedemption' test.out

#- 256 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'aefSDME8X2MxILI4' \
    --body '{"meta": {"2BJMPkZmay4Csye3": {}, "iJLtjsu6ZJRCoDq3": {}, "geuHFFaZzPIjETqc": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Xbox", "currencyCode": "RfGe3z2rtjWpJAlK", "namespace": "HF0ebxhJ1176CeD4"}, "entitlement": {"entitlementId": "dWCp4wqlQJcZroNQ"}, "item": {"itemIdentity": "iefBnPluOIjZyvlG", "itemIdentityType": "ITEM_SKU", "origin": "Twitch"}, "quantity": 87, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "PumcazKAna0ji757", "namespace": "aNDFeKnQP2j2WsQI"}, "entitlement": {"entitlementId": "mTwYkiuxzLrbJ0Bk"}, "item": {"itemIdentity": "GzCNgesQlZZHIZH0", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 37, "type": "ITEM"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "kx0adnimPyyzezsH", "namespace": "dFftHHR6xbcVVonw"}, "entitlement": {"entitlementId": "z27DWfGRVhbZTvCP"}, "item": {"itemIdentity": "rrZCTU5WUJizF69P", "itemIdentityType": "ITEM_SKU", "origin": "Nintendo"}, "quantity": 34, "type": "ENTITLEMENT"}], "source": "ORDER", "transactionId": "WUafwbFPX15633pF"}' \
    > test.out 2>&1
eval_tap $? 256 'DoRevocation' test.out

#- 257 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'gA7i9tqvfHmFvUZi' \
    --body '{"gameSessionId": "UW5Y0CYw5OXSGwQk", "payload": {"Juy9oLFcHHcraLXR": {}, "2n9JQvq7NKWIHYsi": {}, "i3fCh7sieJjZPAki": {}}, "scid": "WumllU31uXPwYxed", "sessionTemplateName": "GHCIkmt4bfJOhNaI"}' \
    > test.out 2>&1
eval_tap $? 257 'RegisterXblSessions' test.out

#- 258 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'T0pv7XeqO8gY3c4S' \
    --chargeStatus 'NEVER' \
    --itemId 'WTGYx2ihgioL8VvE' \
    --limit '52' \
    --offset '69' \
    --sku 'HGTt9emdCLmzJbdk' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 258 'QueryUserSubscriptions' test.out

#- 259 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZTgKagTzdcYcko7U' \
    --excludeSystem  \
    --limit '12' \
    --offset '32' \
    --subscriptionId 'H239LhRx2Laa2Rdt' \
    > test.out 2>&1
eval_tap $? 259 'GetUserSubscriptionActivities' test.out

#- 260 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vb6VgA5yFIH3s9Uy' \
    --body '{"grantDays": 9, "itemId": "UjgyCUpM1JBcTzf4", "language": "dz1BojPoQg976409", "reason": "vFd5z9r4nJWUvLp1", "region": "wxGF747468MXUq3u", "source": "IffkIpPmrWVxNZUv"}' \
    > test.out 2>&1
eval_tap $? 260 'PlatformSubscribeSubscription' test.out

#- 261 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kiU2jXSwsBBRopVl' \
    --itemId '38d4NZGtk6EmWxC7' \
    > test.out 2>&1
eval_tap $? 261 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 262 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5M88TKhFYkA9aRND' \
    --userId 'e2IoPMSQKcg0OTT9' \
    > test.out 2>&1
eval_tap $? 262 'GetUserSubscription' test.out

#- 263 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JA0ll1RimBCiQwuy' \
    --userId 'rI87uSyXP6C0jXS8' \
    > test.out 2>&1
eval_tap $? 263 'DeleteUserSubscription' test.out

#- 264 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'au2wcWYyj3JvHqXp' \
    --userId '4JR7xI59Z9tfGVsg' \
    --force  \
    --body '{"immediate": false, "reason": "kWHNxiaNyqBfgw58"}' \
    > test.out 2>&1
eval_tap $? 264 'CancelSubscription' test.out

#- 265 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Hx0XYL0fJOPYpnPq' \
    --userId 'GlPnhBDOWqDU8N3D' \
    --body '{"grantDays": 20, "reason": "oreqyBzWzCgMMWZu"}' \
    > test.out 2>&1
eval_tap $? 265 'GrantDaysToSubscription' test.out

#- 266 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'D6tmIR28xVxbtpSK' \
    --userId 'OfiIP3S6pypZqISn' \
    --excludeFree  \
    --limit '100' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 266 'GetUserSubscriptionBillingHistories' test.out

#- 267 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'we8YK3lZFslECI9Q' \
    --userId 'zuQcsjFehD6uTDYn' \
    --body '{"additionalData": {"cardSummary": "qyNgN7GoeMsezFZs"}, "authorisedTime": "1994-10-02T00:00:00Z", "chargebackReversedTime": "1985-06-30T00:00:00Z", "chargebackTime": "1988-10-04T00:00:00Z", "chargedTime": "1976-09-28T00:00:00Z", "createdTime": "1974-09-29T00:00:00Z", "currency": {"currencyCode": "cJ0DcEt23pci6xEl", "currencySymbol": "jer6aGJx5OFp3jKE", "currencyType": "VIRTUAL", "decimals": 93, "namespace": "4aSGdwTPX4ig3NVF"}, "customParameters": {"FkP7O3F4vsohRWDy": {}, "GYIVFDbTvRYfpJ4w": {}, "M9WZfOOxAzmsbhi5": {}}, "extOrderNo": "QJuc2SNBaOlXfgsg", "extTxId": "Bd7MYLLoPZrkjRm5", "extUserId": "Ki0orhXrISEaPZHL", "issuedAt": "1993-03-21T00:00:00Z", "metadata": {"3nplXaUQV5QEvKEl": "LfbB7gwwAR1xFrny", "irw3iJt5iA3JS2xe": "aJ08JrSHPqdhKHn6", "ZjZMdr1C2TIQzRJY": "7UfYSrdN0JVz4U43"}, "namespace": "EcV1FRyeeqehMNeR", "nonceStr": "YKeMbL0G4v5D6ylZ", "paymentMethod": "guO918X7rLoexHBM", "paymentMethodFee": 56, "paymentOrderNo": "4uaMfd0SQAfYIyzH", "paymentProvider": "CHECKOUT", "paymentProviderFee": 24, "paymentStationUrl": "jxakuVu5r5B08VZx", "price": 72, "refundedTime": "1987-04-09T00:00:00Z", "salesTax": 0, "sandbox": true, "sku": "6qcCJsVOWtu5RPsq", "status": "AUTHORISED", "statusReason": "4D0FsUo3IB2kX5RE", "subscriptionId": "QZsHyXzoIXNf0KbL", "subtotalPrice": 33, "targetNamespace": "HyJttdgfLGO3ummp", "targetUserId": "llnV6B62P1Kazg73", "tax": 5, "totalPrice": 14, "totalTax": 98, "txEndTime": "1994-03-15T00:00:00Z", "type": "pmA4ehxNIIlcrZzg", "userId": "ameT2mLkkAMjHyI0", "vat": 8}' \
    > test.out 2>&1
eval_tap $? 267 'ProcessUserSubscriptionNotification' test.out

#- 268 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'GgbLLN3O7CEYjxqE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lP5lA2FJ0iGLRTXG' \
    --body '{"count": 38, "orderNo": "NJCnDSrsSey2BqOx"}' \
    > test.out 2>&1
eval_tap $? 268 'AcquireUserTicket' test.out

#- 269 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwCymCDYsuff3b7G' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserCurrencyWallets' test.out

#- 270 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode '5FDX4mu0qPHb9Ll2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EFEb8GnsthmQ2Y6Z' \
    --body '{"allowOverdraft": false, "amount": 19, "balanceOrigin": "Twitch", "reason": "qrg3lpqN5bOfnqJ5"}' \
    > test.out 2>&1
eval_tap $? 270 'DebitUserWalletByCurrencyCode' test.out

#- 271 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'bzDRzbhMxfEDE4Tr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tIHyyMq79EdB9Mxa' \
    --limit '64' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 271 'ListUserCurrencyTransactions' test.out

#- 272 CheckWallet
eval_tap 0 272 'CheckWallet # SKIP deprecated' test.out

#- 273 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '8QHGM2IuQYBO8m0H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gTth479W8rXqwGVI' \
    --body '{"amount": 91, "expireAt": "1991-10-25T00:00:00Z", "origin": "GooglePlay", "reason": "DtMqMrAGpdyF6WDH", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 273 'CreditUserWallet' test.out

#- 274 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'WUetP7nmESQDV3BD' \
    --namespace "$AB_NAMESPACE" \
    --userId '1nnEzoUlUWqP4Elz' \
    --body '{"amount": 78, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 274 'PayWithUserWallet' test.out

#- 275 GetUserWallet
eval_tap 0 275 'GetUserWallet # SKIP deprecated' test.out

#- 276 DebitUserWallet
eval_tap 0 276 'DebitUserWallet # SKIP deprecated' test.out

#- 277 DisableUserWallet
eval_tap 0 277 'DisableUserWallet # SKIP deprecated' test.out

#- 278 EnableUserWallet
eval_tap 0 278 'EnableUserWallet # SKIP deprecated' test.out

#- 279 ListUserWalletTransactions
eval_tap 0 279 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 280 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '44KEm3uHBMCP5ckj' \
    > test.out 2>&1
eval_tap $? 280 'ListViews' test.out

#- 281 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'phURs4ksgsKJ2R6J' \
    --body '{"displayOrder": 0, "localizations": {"fqsPGgJZyRwigaMu": {"description": "07Zek8WObpf0FHYf", "localExt": {"ViEj70KYKIfFt4GY": {}, "jUt4F1ZVy2qFfSr3": {}, "psWjOyHLyKe2foqs": {}}, "longDescription": "VIfgBTr8RcxRQR0N", "title": "YdJzf3TMhSaynVs0"}, "5nZC4Os7hqIH2NgA": {"description": "RSG3QQNGNH2K0UuJ", "localExt": {"deGNquQnaXpDQ5rU": {}, "2taDWh9JV5oc5IFQ": {}, "srwHqFqwVA5mozee": {}}, "longDescription": "OjIFQfXV3YW3ug3n", "title": "CXhD7FUz1iOe0pHa"}, "0LmseIRXeoerZAxb": {"description": "DPXU5xJBhIpJ9b0A", "localExt": {"p7CmSiKPjcwAw5Gd": {}, "xpvLfa4b4hTaZBGd": {}, "X66DqPTdurR3MYda": {}}, "longDescription": "0Y0BCO4qPnvxERWj", "title": "Kasq5zQ6uZNwKjnX"}}, "name": "7vDIqpcjmaq5KBCs"}' \
    > test.out 2>&1
eval_tap $? 281 'CreateView' test.out

#- 282 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'HlwNrfKJrkzwR40t' \
    --storeId 'fd9GFXChtxB10d4Q' \
    > test.out 2>&1
eval_tap $? 282 'GetView' test.out

#- 283 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '8nlBthUSu4WNfTvD' \
    --storeId '5UcES1eLMZs9lSQV' \
    --body '{"displayOrder": 60, "localizations": {"SrEm5Y7jI232Sjkt": {"description": "ijiNzTUe8KdizXmr", "localExt": {"mK0sCUsqxKocHomt": {}, "joU1kUqRedwIu1TS": {}, "Rr6r8mzfMedpcKhv": {}}, "longDescription": "HPlvYanGqEkn9OEV", "title": "wLWGT4MXhmzvRQb7"}, "c0vmjWq9fQqzulLG": {"description": "fQMqSLQDlRFYMVfi", "localExt": {"AMa6Pco7Mfvikslp": {}, "yL9BYLVVznF6hMYf": {}, "ksp8VQhYSFeBOp0i": {}}, "longDescription": "lGQFwHUtZugblT3a", "title": "IDKn9qJXncm5igpA"}, "ewbmnWk0E7YaPblc": {"description": "WEyNgvs5LEZrQXzS", "localExt": {"QRWRs9EGnRPgYlJE": {}, "lgJ8kx1WEeDbql13": {}, "FtQMu41rnOzbsFBq": {}}, "longDescription": "g6dziWvdNcwfUBMd", "title": "NuTaiLxFMXRpDP9x"}}, "name": "utntU8xHw4yYJOCV"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateView' test.out

#- 284 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'iHwunQwpC2eCFUAH' \
    --storeId 'ZaYSvsWiNJtqXltZ' \
    > test.out 2>&1
eval_tap $? 284 'DeleteView' test.out

#- 285 QueryWallets
eval_tap 0 285 'QueryWallets # SKIP deprecated' test.out

#- 286 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 66, "expireAt": "1979-02-15T00:00:00Z", "origin": "Epic", "reason": "VfBRIfkStOqdXqhD", "source": "REFUND"}, "currencyCode": "KOkzftOgDQAWhulb", "userIds": ["CNtX2lnqi7cHTSdG", "oLZbC3UJruU4uIXB", "rDf7q4cAnpmLiEu4"]}, {"creditRequest": {"amount": 33, "expireAt": "1980-05-16T00:00:00Z", "origin": "System", "reason": "XJmPJso6M11LLZWK", "source": "DLC"}, "currencyCode": "5cg0REtUWY4fVIdq", "userIds": ["DCowR3MeCNL1oNrF", "wCWF5wmbOubTxAAe", "3SmgudQusJLsPlW7"]}, {"creditRequest": {"amount": 71, "expireAt": "1983-06-01T00:00:00Z", "origin": "Twitch", "reason": "FkN9EbKbTbrDzNgV", "source": "REDEEM_CODE"}, "currencyCode": "dKu9Xwn5GHJDGatr", "userIds": ["PT9fR7mMuBXPDKCr", "iRKzTZ7TXAVRnUVb", "YOMO91CYEjX867n9"]}]' \
    > test.out 2>&1
eval_tap $? 286 'BulkCredit' test.out

#- 287 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "xEJcKHE764EwhQfx", "request": {"allowOverdraft": true, "amount": 76, "balanceOrigin": "Twitch", "reason": "CUEzw4zL1QeR3EYX"}, "userIds": ["2RAukCL26ihdMy9Y", "1n10vDgyoHXIlrMl", "BFpUX9y4tY7o5FFi"]}, {"currencyCode": "CLNJEkvq6SUSt8xd", "request": {"allowOverdraft": true, "amount": 64, "balanceOrigin": "GooglePlay", "reason": "ySxA0yrjz4q7e0EJ"}, "userIds": ["9oA4vK56dsYI5SKV", "nADXC2y0DY1E1SMK", "5pDANyJ184miBhdV"]}, {"currencyCode": "Jt81fmLSyGuu5rbJ", "request": {"allowOverdraft": false, "amount": 71, "balanceOrigin": "Xbox", "reason": "wRMtwApGbXnR3yC6"}, "userIds": ["f2MHGGedk0KzXRcl", "OXdPYZQxBnttu4yW", "5etl4Xk8Hd1lRtoP"]}]' \
    > test.out 2>&1
eval_tap $? 287 'BulkDebit' test.out

#- 288 GetWallet
eval_tap 0 288 'GetWallet # SKIP deprecated' test.out

#- 289 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'Mvsu9oswEPTvzwwG' \
    --end 'npbx8MCIjKzylqW8' \
    --start 'auyseP9wEEyYAnHP' \
    > test.out 2>&1
eval_tap $? 289 'SyncOrders' test.out

#- 290 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["p4XzVL5McglFCrjx", "qqxAYqXG2V3baMkZ", "9JCqBIkUID0EE9In"], "apiKey": "ZNLwwAhW2b5OHKtU", "authoriseAsCapture": true, "blockedPaymentMethods": ["0cPZf5OvolfI0mqZ", "ctohLheRaQkfMLFW", "9B7jHZro4hhwnANA"], "clientKey": "Gp8zGqNGrcQyoA1T", "dropInSettings": "WPcy83iXfYXNdMkd", "liveEndpointUrlPrefix": "g9TMwxNcQ6CkVi8f", "merchantAccount": "qVPRqNbF5yLnYSa8", "notificationHmacKey": "xFLvcYexMMMiDFh5", "notificationPassword": "RbW021cHN3QbzVuJ", "notificationUsername": "ZH3k54cExxWKtdGT", "returnUrl": "W4FILotv5ycTa0i6", "settings": "ifYP1zfgjsy3VRjX"}' \
    > test.out 2>&1
eval_tap $? 290 'TestAdyenConfig' test.out

#- 291 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "4qA4g9OGoWw1qnCA", "privateKey": "vdnAcokJ0rzqX2KJ", "publicKey": "cYHgiFDxclBXap6j", "returnUrl": "73doCWxhubMXbxNv"}' \
    > test.out 2>&1
eval_tap $? 291 'TestAliPayConfig' test.out

#- 292 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "T6wAffv4uzKAwiI4", "secretKey": "wTxNIefCmtrxWu29"}' \
    > test.out 2>&1
eval_tap $? 292 'TestCheckoutConfig' test.out

#- 293 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '3551nQBNKcqCkUXR' \
    > test.out 2>&1
eval_tap $? 293 'DebugMatchedPaymentMerchantConfig' test.out

#- 294 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "j8gQHEe4CO370Osb", "clientSecret": "zRKKPd6mjzLxllUr", "returnUrl": "FYn7cSuO7NxKHUHg", "webHookId": "0c4X7fHdITmN9opa"}' \
    > test.out 2>&1
eval_tap $? 294 'TestPayPalConfig' test.out

#- 295 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["F0kh3pCRB3infEVx", "ArF7TB6A6a71zAJp", "aPeudUtKPJUmAvxB"], "publishableKey": "xJNPlvvYZw4MWzWF", "secretKey": "TuNPf5JCSDyYy4e5", "webhookSecret": "qoTZxSoZbQUnUxS6"}' \
    > test.out 2>&1
eval_tap $? 295 'TestStripeConfig' test.out

#- 296 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "m68WL3HDL4yx5I0e", "key": "uBsccHPA2v9XP9en", "mchid": "fEX7lloLgIYqxFfS", "returnUrl": "NJlHCjxLNnYUlGQs"}' \
    > test.out 2>&1
eval_tap $? 296 'TestWxPayConfig' test.out

#- 297 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Fpy9ZVlLIFwLgT78", "flowCompletionUrl": "nootfUs9559ilm3c", "merchantId": 1, "projectId": 61, "projectSecretKey": "uhrw9Yn2z5cnbm7z"}' \
    > test.out 2>&1
eval_tap $? 297 'TestXsollaConfig' test.out

#- 298 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '2Aa24yBTw3wfNGyW' \
    > test.out 2>&1
eval_tap $? 298 'GetPaymentMerchantConfig' test.out

#- 299 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'f3VujS7Bq5bcfPW4' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["pPZB9YXltCxyztUn", "j17t3gHBXvjvziex", "zOLbOWbtcJUxM3AW"], "apiKey": "yDkA5LmART6kulpM", "authoriseAsCapture": true, "blockedPaymentMethods": ["SRtUE5P4kxmHtFbj", "qurHix0QYycDH5we", "2Mx0sYCnYPT4i4mx"], "clientKey": "c14iRfzJwKuc7Epi", "dropInSettings": "QEzz5N5osRYO7wbY", "liveEndpointUrlPrefix": "h7q02W8tkTURUFmq", "merchantAccount": "Nc8xhQqptccNorRl", "notificationHmacKey": "s7EC3nDnhFvDlFd7", "notificationPassword": "iyZpvWVJFK6Zuvlz", "notificationUsername": "GCII156hIg0g8HIx", "returnUrl": "pzm9AcFhH4ZlYY3r", "settings": "EuHMWwQNmCQmGCF9"}' \
    > test.out 2>&1
eval_tap $? 299 'UpdateAdyenConfig' test.out

#- 300 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '63CbsOawlRBQJH6f' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 300 'TestAdyenConfigById' test.out

#- 301 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Nekhk077gxaj55hu' \
    --sandbox  \
    --validate  \
    --body '{"appId": "TA6AvmW0567BFqbr", "privateKey": "PIuxKmBXLi6GpnqA", "publicKey": "eMvg3w0FQ1520WM3", "returnUrl": "TxWXSdTiKdva2URE"}' \
    > test.out 2>&1
eval_tap $? 301 'UpdateAliPayConfig' test.out

#- 302 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'oBSFtCLy2CqgCG7J' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 302 'TestAliPayConfigById' test.out

#- 303 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'wJCDqkzOdFwLJpIP' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "xzLE1V9U1NgpH7Oc", "secretKey": "44yjRdfqZgv34Gqq"}' \
    > test.out 2>&1
eval_tap $? 303 'UpdateCheckoutConfig' test.out

#- 304 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'jelcN0GJmPwUTWMx' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 304 'TestCheckoutConfigById' test.out

#- 305 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '0MiPAjnWIhFrqSn4' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "erXEtU1CaD8AqsMC", "clientSecret": "GBNhmUt6fzYRn85b", "returnUrl": "rTu8F7cuCPh1TGZJ", "webHookId": "mgWNHWnvOBRCt4on"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdatePayPalConfig' test.out

#- 306 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'qRo2PnMSRarKg4co' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 306 'TestPayPalConfigById' test.out

#- 307 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'y3AFpULIn21Nf2FN' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["gDWNC6yh7kgTHlrx", "KbsV4XtrI7SFBEgk", "wHifMHYI581HbF7f"], "publishableKey": "MX9lDXYxGRJM92eX", "secretKey": "42WW2WKf5urEOpAS", "webhookSecret": "BicX3ZwzZ7aVhrkm"}' \
    > test.out 2>&1
eval_tap $? 307 'UpdateStripeConfig' test.out

#- 308 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'hSOEozGOv8D0iVxz' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 308 'TestStripeConfigById' test.out

#- 309 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'rec5kNwJAxm0Rdm9' \
    --validate  \
    --body '{"appId": "l6nIhG5SilDDIsmj", "key": "4h625dIsMKWBxF9R", "mchid": "AIrI81ZR2kNzh60R", "returnUrl": "QNaTEhMXMepgzY9j"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateWxPayConfig' test.out

#- 310 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'LiAdMiQ7eDMkeBRM' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 310 'UpdateWxPayConfigCert' test.out

#- 311 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'ur18nCxiV9bQMHpP' \
    > test.out 2>&1
eval_tap $? 311 'TestWxPayConfigById' test.out

#- 312 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'bvflI3LkRc1NgZao' \
    --validate  \
    --body '{"apiKey": "YAaCCeRgtstsU3Qe", "flowCompletionUrl": "cxo4bQZO3P2f8TTO", "merchantId": 98, "projectId": 10, "projectSecretKey": "Qm3W1De2McGd10we"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateXsollaConfig' test.out

#- 313 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'fF0CJlH55RLEgeAs' \
    > test.out 2>&1
eval_tap $? 313 'TestXsollaConfigById' test.out

#- 314 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'SpQdcmGHZuRVQ8tz' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 314 'UpdateXsollaUIConfig' test.out

#- 315 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '79' \
    --namespace "$AB_NAMESPACE" \
    --offset '10' \
    --region 'ayP8A3HGNI3BfjkF' \
    > test.out 2>&1
eval_tap $? 315 'QueryPaymentProviderConfig' test.out

#- 316 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "F6z6eJKuOW61akRF", "region": "izqxCmudSXivAL3n", "sandboxTaxJarApiToken": "478mhb2I2yBJeCJg", "specials": ["ALIPAY", "WALLET", "WALLET"], "taxJarApiToken": "rk68FWFzuLBdlrKj", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 316 'CreatePaymentProviderConfig' test.out

#- 317 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 317 'GetAggregatePaymentProviders' test.out

#- 318 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'hQj2KP3LLxl9Hs2L' \
    > test.out 2>&1
eval_tap $? 318 'DebugMatchedPaymentProviderConfig' test.out

#- 319 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 319 'GetSpecialPaymentProviders' test.out

#- 320 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '2wlpKBVURxHefz77' \
    --body '{"aggregate": "ADYEN", "namespace": "1RuSNdycDssUeHiV", "region": "DXzSJ8kbFAyidbnX", "sandboxTaxJarApiToken": "dMSwmkBkKC1h6h45", "specials": ["WALLET", "WALLET", "WALLET"], "taxJarApiToken": "8aLjIxVGpdOqguxv", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 320 'UpdatePaymentProviderConfig' test.out

#- 321 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '9ZBTipMRlhK9DMMa' \
    > test.out 2>&1
eval_tap $? 321 'DeletePaymentProviderConfig' test.out

#- 322 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 322 'GetPaymentTaxConfig' test.out

#- 323 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "I4ryVDvNaruZxwTf", "taxJarApiToken": "h9gEs6GF247cbBLj", "taxJarEnabled": false, "taxJarProductCodesMapping": {"r5z03wxB3E9hrE9f": "9COFrOr6wJDBwIDs", "JHNg6TvNGjwI4TbT": "wBufUorJouduhCEJ", "5XiKDIE9YugcupLx": "VBcRkfhRuqkOTHSi"}}' \
    > test.out 2>&1
eval_tap $? 323 'UpdatePaymentTaxConfig' test.out

#- 324 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'a7oFd1fEmDuyAsQG' \
    --end 'zwJR5poI718RQnj4' \
    --start 'imu6XFfRcWDXhq1Y' \
    > test.out 2>&1
eval_tap $? 324 'SyncPaymentOrders' test.out

#- 325 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'mGeygr2S4Yw8NmPa' \
    --storeId 'BeryzX2hOPVVFqVq' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetRootCategories' test.out

#- 326 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'xjq1iG3TySOh8SI7' \
    --storeId '5oXbyq8FBbur80Qw' \
    > test.out 2>&1
eval_tap $? 326 'DownloadCategories' test.out

#- 327 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'nlgAVfqz6gQJh8sn' \
    --namespace "$AB_NAMESPACE" \
    --language '0bVWRkvmAemh8lio' \
    --storeId 'BR7xTXcEIFod3lCz' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetCategory' test.out

#- 328 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'vjHzDHOrSJ1vbB7L' \
    --namespace "$AB_NAMESPACE" \
    --language 'RHd96dGLgkfrZveF' \
    --storeId 'MWAFT7l0l1jaOAMC' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetChildCategories' test.out

#- 329 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'zbsoIgmKwwMDQPjU' \
    --namespace "$AB_NAMESPACE" \
    --language 'Iosq1l6xo0D4JRbN' \
    --storeId 'qO6IuP2PY5hhX6uN' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetDescendantCategories' test.out

#- 330 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 330 'PublicListCurrencies' test.out

#- 331 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 331 'GetIAPItemMapping' test.out

#- 332 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'Psp5Z3ez84KVB7He' \
    --region 'WPnVeFdy5ezlCU6S' \
    --storeId 'GzkMpTL2wxobjxAb' \
    --appId 'agqEmXn6U2VeV2em' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetItemByAppId' test.out

#- 333 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId '3JecJA4skqCbPxRk' \
    --categoryPath 'IAFQh9yDdoLE2s7m' \
    --features 'rVrmTJwtBTzQTrNo' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --language 'LcWNf7xHpi1JZJjI' \
    --limit '89' \
    --offset '31' \
    --region 'tCfqDHSlo54zSnRN' \
    --sortBy 'updatedAt:desc,updatedAt' \
    --storeId 'v5DAG8dPdkKgQqjy' \
    --tags 'zUZR2rFIAuALNhNC' \
    > test.out 2>&1
eval_tap $? 333 'PublicQueryItems' test.out

#- 334 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'yscsMBRLsWadk2OQ' \
    --region '421q7Nb1vrKthVvU' \
    --storeId '5on065ApCkVN3Qch' \
    --sku 'uQ6pntxB648ss7rB' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetItemBySku' test.out

#- 335 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'nvQHAM8gSdIybKUB' \
    --region 'yHBzfvgtRTPPzwJm' \
    --storeId 'KaLCx3gcidEALWe6' \
    --itemIds 'RG5wWznu5AjwR1Z4' \
    > test.out 2>&1
eval_tap $? 335 'PublicBulkGetItems' test.out

#- 336 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["fU7ICcaQtuuKUw3d", "UwWHhQW3I1y9tjRL", "VOXBMa0JiIe1AY0t"]}' \
    > test.out 2>&1
eval_tap $? 336 'PublicValidateItemPurchaseCondition' test.out

#- 337 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'LOOTBOX' \
    --limit '54' \
    --offset '61' \
    --region '7EKASk3USNLhOBlx' \
    --storeId 'RBLgohp8ByTi2F6A' \
    --keyword 'yUX8w77riPlPgJcL' \
    --language 'beQf9MICxX7xKyCf' \
    > test.out 2>&1
eval_tap $? 337 'PublicSearchItems' test.out

#- 338 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'gwSPz14asyOdgn77' \
    --namespace "$AB_NAMESPACE" \
    --language 'gN8K1FlNkgbFE8U4' \
    --region 'meK5grmPBsFH71Vr' \
    --storeId 'hsISYtegQbNA2WQr' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetApp' test.out

#- 339 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'HTkJT1VkChD3n0c1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicGetItemDynamicData' test.out

#- 340 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'ryAkRvdPR8gx2rX5' \
    --namespace "$AB_NAMESPACE" \
    --language 'dck8NFKPgT6LMehg' \
    --populateBundle  \
    --region '047axU5ktNywRIvO' \
    --storeId '2Sgz30hejqdktHIO' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetItem' test.out

#- 341 GetPaymentCustomization
eval_tap 0 341 'GetPaymentCustomization # SKIP deprecated' test.out

#- 342 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "1VdtMSews1TrU4Fh", "paymentProvider": "WXPAY", "returnUrl": "JM2fWXGk7JObSHks", "ui": "RkabpmvRsc7ZYvXC", "zipCode": "T6m6mRZAlLBczJVe"}' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetPaymentUrl' test.out

#- 343 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'il7GbG1ISBCkcnpx' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetPaymentMethods' test.out

#- 344 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KUxLjmxhBS6YypRW' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUnpaidPaymentOrder' test.out

#- 345 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7fNntaIEtDI6Mbhx' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'TmnTbtjK9RsyoqT3' \
    --body '{"token": "adB48Jxp2zaItg9j"}' \
    > test.out 2>&1
eval_tap $? 345 'Pay' test.out

#- 346 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TNZvpFEUI21aSaIs' \
    > test.out 2>&1
eval_tap $? 346 'PublicCheckPaymentOrderPaidStatus' test.out

#- 347 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'nyabk493I3pvHKDa' \
    > test.out 2>&1
eval_tap $? 347 'GetPaymentPublicConfig' test.out

#- 348 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'WhTN1qyxpUzWIZWJ' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetQRCode' test.out

#- 349 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'TDzWguhujw1EoR58' \
    --foreinginvoice 'uCVldefonHJZAiX4' \
    --invoiceId 'abmqqi90KTWwZk0H' \
    --payload 'GeJNaBjVdMB5kMzK' \
    --redirectResult 'ycYrhr4FnNzdT4pW' \
    --resultCode 'wIVXp9avUr6IydpX' \
    --sessionId 'W0MO0eT9okl6MlWO' \
    --status 'l9feWO2bmOikTBJH' \
    --token 'TEm5PSeyod5L6Ooo' \
    --type 'YoQn9iHEqWO1cVCU' \
    --userId 'IOx90FQdwLi3GOQk' \
    --orderNo 'LtpuRNeT1CULEMPa' \
    --paymentOrderNo 'OU5nukycAUlkUSZK' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'FevJiT98HUBp56Q4' \
    > test.out 2>&1
eval_tap $? 349 'PublicNormalizePaymentReturnUrl' test.out

#- 350 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'WETxtGMs5tPKPuK0' \
    --paymentOrderNo 'K4PiMDTR7LxihuOn' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 350 'GetPaymentTaxValue' test.out

#- 351 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'lHGFSwjby6rMYkVQ' \
    > test.out 2>&1
eval_tap $? 351 'GetRewardByCode' test.out

#- 352 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'nZDUAbINRKQsxUO1' \
    --limit '27' \
    --offset '79' \
    --sortBy 'rewardCode,namespace,namespace:desc' \
    > test.out 2>&1
eval_tap $? 352 'QueryRewards1' test.out

#- 353 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'AndOj5O6IBwXJjgQ' \
    > test.out 2>&1
eval_tap $? 353 'GetReward1' test.out

#- 354 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'PublicListStores' test.out

#- 355 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'jgLoJyqwFVBd1Zja,RXEdWgS12bSbPgOC,WUogizeWOPUMrqgE' \
    --itemIds 'IsMwNbfti0LoTBcN,zyoCSw1t653G3ydY,mGzvx9bSqqyAPha5' \
    --skus 'b6PQTPTytHeeXo7g,OFVLZCBWuVIROZuq,dJBi8pkn98VtLNka' \
    > test.out 2>&1
eval_tap $? 355 'PublicExistsAnyMyActiveEntitlement' test.out

#- 356 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'IQJfkFDhSeSGXtZU' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 357 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'SuIhMSaDRp17dUWH' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 358 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'FIV2feXnTRlzAJy9' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 359 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'oFOHB2KEsIdtozVl,tBhoXE4wgcYT5Cdj,aJuUzFIeqaVr1CE1' \
    --itemIds 'gu6cYuzC77J4irvZ,9tktWLtDdlmVGK6i,olEw6IIpDc9X5ijm' \
    --skus 'tDGvd9ESdY0eTkBW,A44Qqsi5yOjvl5sR,N2ENn1RLi5iMPnbg' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetEntitlementOwnershipToken' test.out

#- 360 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "7o1zYpqUsliPyXZG", "language": "hyfV_tyiB", "region": "C97eEyhnL1QH5AlY"}' \
    > test.out 2>&1
eval_tap $? 360 'SyncTwitchDropsEntitlement' test.out

#- 361 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'RAqCAC2gy1WF9QLN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 361 'PublicGetMyWallet' test.out

#- 362 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'gDxAkwgfB8jIecOx' \
    --body '{"epicGamesJwtToken": "5ugNCDd6jW6fjtBc"}' \
    > test.out 2>&1
eval_tap $? 362 'SyncEpicGameDLC' test.out

#- 363 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3fWq9qfmBv0XgJB' \
    --body '{"serviceLabel": 42}' \
    > test.out 2>&1
eval_tap $? 363 'PublicSyncPsnDlcInventory' test.out

#- 364 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'a7uykADFpinFcH2Z' \
    --body '{"serviceLabels": [80, 88, 91]}' \
    > test.out 2>&1
eval_tap $? 364 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 365 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'YijqEuMfuYFUS079' \
    --body '{"appId": "tOpZYM1XV0Op0dam", "steamId": "ycnTUOoMkOppZNOk"}' \
    > test.out 2>&1
eval_tap $? 365 'SyncSteamDLC' test.out

#- 366 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxc42HKv5wvtPJVs' \
    --body '{"xstsToken": "uzaBciSxwzuIpGBY"}' \
    > test.out 2>&1
eval_tap $? 366 'SyncXboxDLC' test.out

#- 367 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HTHoSVxgQCbpZx5y' \
    --appType 'DEMO' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'svNyk52MQFkVVEf3' \
    --features '6S7yPgG48bk6PwH1,tdEAJSqXA0Wv0zWG,vkc6byp3mvyYT3Gu' \
    --itemId 'aZVTxBlw1IWeXKFT,4rfSbbSlDPGf9Fn3,2SJNPZkEfkAcJTMS' \
    --limit '41' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 367 'PublicQueryUserEntitlements' test.out

#- 368 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWDfeFeExlOFjRh8' \
    --appId 'mLFTJLveQSDWnMQG' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetUserAppEntitlementByAppId' test.out

#- 369 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'aYRxFWia7yJ2d87X' \
    --limit '18' \
    --offset '55' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 369 'PublicQueryUserEntitlementsByAppType' test.out

#- 370 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'gzqRMuMPrIekxq58' \
    --entitlementClazz 'APP' \
    --itemId 'pxJeFxhgTwyO51CU' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetUserEntitlementByItemId' test.out

#- 371 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcdxL0a9VDhrqWCT' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'UU0r1rfX9stpvJUu' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserEntitlementBySku' test.out

#- 372 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'yPdzx8BM2wEgTtLR' \
    --appIds 'T5stwQFUEbTPQ8p7,VMlxEXnqHwMyKpwp,hjUXvM1GqMkZ44UX' \
    --itemIds 'gdBqtJaRyDlP9qIZ,J5Krx6KkHagEugKJ,xkU8Y58COtTNjnNS' \
    --skus 'ikJDg6ujKvq0CIa1,YCK9PlMeQprfgLGk,HX1tdBjKmCBXETZw' \
    > test.out 2>&1
eval_tap $? 372 'PublicExistsAnyUserActiveEntitlement' test.out

#- 373 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qdzAX28DikGk8cWi' \
    --appId 'X44azSHcwicUVq2X' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 374 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PljTZj5R0yZSVQ8S' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'ic80yEO8dL6Jh10X' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 375 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'MUGeDavCKradJmJF' \
    --ids 'UsU418vAlmfGg9NO,1Z2DvnAxH3pS3jyC,kGKltBNE2UbhNtH3' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 376 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'yYg4Qnn2uhdw7C9B' \
    --entitlementClazz 'LOOTBOX' \
    --sku '4H7uDzkOHTdnUtdr' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 377 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'Rcs3GeOsKPNlG7rE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xi6LEqJERpbxEq07' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserEntitlement' test.out

#- 378 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'txnvZZeAf7QBuZK5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GJlBncg8tQnJOKHC' \
    --body '{"options": ["16xjJZ4kiU3N8556", "ll2LQWpdESOBV7wZ", "Jsg7wSv9lyRyTdYB"], "requestId": "UljvBzvYNEtfgBFi", "useCount": 22}' \
    > test.out 2>&1
eval_tap $? 378 'PublicConsumeUserEntitlement' test.out

#- 379 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'tyoNSsEHlzyd0Sar' \
    --namespace "$AB_NAMESPACE" \
    --userId 'khltUxgbN5eElQNE' \
    --body '{"requestId": "SFLD8hCc9onSNjbQ", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 379 'PublicSellUserEntitlement' test.out

#- 380 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'KUvR69PImy6Ccwlq' \
    --body '{"code": "J4MO3L8x1H5OgzHy", "language": "hGL-Nmed-665", "region": "7jagBG9a1TZ87ltC"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicRedeemCode' test.out

#- 381 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'lc3RDXF5055tUlen' \
    --body '{"excludeOldTransactions": false, "language": "dJ_fS", "productId": "dxd24ZKfvMf1T5Fz", "receiptData": "YMf1jaCgZosntPzP", "region": "1vXXB92q150WEIet", "transactionId": "OXMt37MXy7Fp7lUf"}' \
    > test.out 2>&1
eval_tap $? 381 'PublicFulfillAppleIAPItem' test.out

#- 382 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'QqXrqGadwvKlJFX1' \
    --body '{"epicGamesJwtToken": "ZHV9yo9Ur1hfhmGE"}' \
    > test.out 2>&1
eval_tap $? 382 'SyncEpicGamesInventory' test.out

#- 383 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KuVUZdCacRGataPr' \
    --body '{"autoAck": false, "language": "Mv-RT", "orderId": "aOFDwpqy7XOU3Dwg", "packageName": "lyMGNll4O8ELahcN", "productId": "JqRjepck1l0qxRyQ", "purchaseTime": 5, "purchaseToken": "pi7xuAufJakIPXOQ", "region": "znHZTj8oYfWObyNJ"}' \
    > test.out 2>&1
eval_tap $? 383 'PublicFulfillGoogleIAPItem' test.out

#- 384 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVSQsaCokoGynp6x' \
    --body '{"currencyCode": "cqNKJnAhrSt96OaA", "price": 0.7030531618426699, "productId": "AjHLGV3sNxS8uLBZ", "serviceLabel": 17}' \
    > test.out 2>&1
eval_tap $? 384 'PublicReconcilePlayStationStore' test.out

#- 385 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'UgrROrP1ip3jNG68' \
    --body '{"currencyCode": "DByf2UMPtigq9zOQ", "price": 0.6488799564143124, "productId": "cAqBj0bXhOr9OHt6", "serviceLabels": [49, 26, 53]}' \
    > test.out 2>&1
eval_tap $? 385 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 386 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'srmJFHGiYnyhbqxL' \
    --body '{"appId": "uTZIxgiUaiyy0aWr", "currencyCode": "shpmb1C9Al7eWrbN", "language": "efRO-Xqpw-Oj", "price": 0.813835525210224, "productId": "IFAvYfT8XQw2EOq6", "region": "BFjmN4OqKGLRpNWz", "steamId": "KZtZnxgywmr4CYNG"}' \
    > test.out 2>&1
eval_tap $? 386 'SyncSteamInventory' test.out

#- 387 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm7Tk1mMyeNRsjQuD' \
    --body '{"gameId": "EgO3MEQNL6ijLRvQ", "language": "DGSO_cCOl", "region": "2lUda9h9FgvfhiLE"}' \
    > test.out 2>&1
eval_tap $? 387 'SyncTwitchDropsEntitlement1' test.out

#- 388 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkA7n6516ydoRT1q' \
    --body '{"currencyCode": "ZBrdTnGrwHeWoQXP", "price": 0.5036559602803903, "productId": "WFaKbDgrGkv8SVwL", "xstsToken": "yS4VbHJvD0lL7aZU"}' \
    > test.out 2>&1
eval_tap $? 388 'SyncXboxInventory' test.out

#- 389 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9d1Idud8bjYeBVM' \
    --itemId 'r7zHYmRE4X36KUOd' \
    --limit '11' \
    --offset '32' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 389 'PublicQueryUserOrders' test.out

#- 390 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'F25qu98RhktX6qwk' \
    --body '{"currencyCode": "XbCLbh8t0zPkQWRU", "discountedPrice": 23, "ext": {"eTEqYudHlA4AxeEI": {}, "fUxJ2xMSNNBxCeN3": {}, "pGn46fGvodt413MR": {}}, "itemId": "dG8qAPiANv2Ar8yX", "language": "zQVF_wteG", "price": 5, "quantity": 99, "region": "JPZPUh2nHQwpWi8H", "returnUrl": "Z6C0VJ0fK2m6lQ5A", "sectionId": "o8TITYiHSR2SEJh1"}' \
    > test.out 2>&1
eval_tap $? 390 'PublicCreateUserOrder' test.out

#- 391 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YDedZdNqkXPWZfT8' \
    --userId 'ZfdKp9q4nXuK0tJA' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetUserOrder' test.out

#- 392 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Yror2XdtSCG7ZExO' \
    --userId 'oIpWzacOvwUsnIbQ' \
    > test.out 2>&1
eval_tap $? 392 'PublicCancelUserOrder' test.out

#- 393 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M3ZAtyEWKWoZRUL7' \
    --userId 'wS3HaMTXAX6y0STT' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserOrderHistories' test.out

#- 394 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'N2sBEijjjpvSzGkE' \
    --userId 'D0oweFYDBPyd1jJB' \
    > test.out 2>&1
eval_tap $? 394 'PublicDownloadUserOrderReceipt' test.out

#- 395 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'xbrbuFay9PXgEQS4' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetPaymentAccounts' test.out

#- 396 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '871QSmsspn5sNfif' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'lW2HG8LAiIzuo321' \
    > test.out 2>&1
eval_tap $? 396 'PublicDeletePaymentAccount' test.out

#- 397 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ll90IBFsSb3FsV2P' \
    --language 'nCs9R0D5jZEwxcow' \
    --region '6L7c3COEP4AZx70u' \
    --storeId 'wV4XgvGTMHkXeEwu' \
    --viewId 'FJf7tbq5KikDE7hW' \
    > test.out 2>&1
eval_tap $? 397 'PublicListActiveSections' test.out

#- 398 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vT5bzcfzIpL2pWB4' \
    --chargeStatus 'SETUP' \
    --itemId 'sdrxIF6kEAmKGNEm' \
    --limit '64' \
    --offset '67' \
    --sku 'PcUALNziO9Bz2wx4' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserSubscriptions' test.out

#- 399 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAm8XIleiujtv2Nd' \
    --body '{"currencyCode": "QTYoHZogW8lBvniH", "itemId": "dARadfSoctA3GYO9", "language": "pf_be", "region": "5hnQtd4bcivHGIEp", "returnUrl": "lRpcHDWcIoJ45L0Z", "source": "e3YamxKDSZTl4UiJ"}' \
    > test.out 2>&1
eval_tap $? 399 'PublicSubscribeSubscription' test.out

#- 400 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SCbG4UmG3TkMTzOc' \
    --itemId 'BIciiKwRs1E7sH2G' \
    > test.out 2>&1
eval_tap $? 400 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 401 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9MJ6F7Rr7O15jqeK' \
    --userId 'ssQpme6eyM48tE7e' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserSubscription' test.out

#- 402 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JRsXNeveQXqnFRYm' \
    --userId 'EIX40XOUoLOa7oDz' \
    > test.out 2>&1
eval_tap $? 402 'PublicChangeSubscriptionBillingAccount' test.out

#- 403 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '00gxcoaH6u9TVf4D' \
    --userId 'vEzpoPRiClZ6rlwX' \
    --body '{"immediate": false, "reason": "9AHMLHqguYykVWzN"}' \
    > test.out 2>&1
eval_tap $? 403 'PublicCancelSubscription' test.out

#- 404 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wPcvGyieBsRUduW5' \
    --userId 'lxSlorWEGN5bPGSO' \
    --excludeFree  \
    --limit '91' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetUserSubscriptionBillingHistories' test.out

#- 405 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'iiItrSrEJMBAIwTL' \
    --language 'krMDFQfpQ9o0GJMT' \
    --storeId 'fqRRaZozM8xCBoaS' \
    > test.out 2>&1
eval_tap $? 405 'PublicListViews' test.out

#- 406 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '2FMwfWNCbN5GelVO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U0hHnsCl5k6Jxh5m' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetWallet' test.out

#- 407 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'kmQzKg0jWCjpGwh7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLAi5JmzvM6JFKB8' \
    --limit '17' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 407 'PublicListUserWalletTransactions' test.out

#- 408 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'llPROSfiW9zcxmgN' \
    --baseAppId 'fTHu3vkZt9FgWckj' \
    --categoryPath 'NpHhM2ZXp4N0ROmU' \
    --features 'CTrS7Gi9Iigk9vam' \
    --includeSubCategoryItem  \
    --itemName 'O7Q2WQwSWqSs05rj' \
    --itemStatus 'INACTIVE' \
    --itemType 'COINS' \
    --limit '50' \
    --offset '55' \
    --region 'CtZiAxk43DGV1SCk' \
    --sectionExclusive  \
    --sortBy 'createdAt:desc' \
    --storeId 'U0d4FvVmPMtpRMWS' \
    --tags 'Q8Szi1IrGidRmR5B' \
    --targetNamespace 'GRJhFwxmkGfPI3j4' \
    > test.out 2>&1
eval_tap $? 408 'QueryItems1' test.out

#- 409 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'luXQuuLtYa86kvL6' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 409 'ImportStore1' test.out

#- 410 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cBZQssUUXOsXMNdv' \
    --body '{"itemIds": ["W1hbvGenRbm3QtsY", "5WaKM5YY6pYrmeMI", "HLS8egV8XhgDjbru"]}' \
    > test.out 2>&1
eval_tap $? 410 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE