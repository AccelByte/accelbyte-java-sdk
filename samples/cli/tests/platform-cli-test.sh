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
echo "1..420"

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
    --body '{"context": {"item": {"appId": "EAxcVpFrttufHIRd", "appType": "SOFTWARE", "baseAppId": "9UzVRiXbqlAw7r6W", "boothName": "2ktQG0h5JAav5kRa", "boundItemIds": ["Q1g7qbPngUNB1vRo", "62WopBJHPtcDs8bB", "ZLCXLx8bbgorQeFb"], "categoryPath": "dwpzS6DaDpv8N7ZQ", "clazz": "VqGj6oDLjWjkY1aX", "createdAt": "1977-05-08T00:00:00Z", "description": "FcDtgOjchIua5tWE", "displayOrder": 71, "entitlementType": "DURABLE", "ext": {"JSDgY1TXp38zsCTC": {}, "rbCbPOyNQkT7NvyE": {}, "3cwyALczNIicXm7a": {}}, "features": ["c8OumKtPDKJDXn7Z", "gSrjJW2OQNOs1PXh", "T5FvdiRilZ7oFgx4"], "fresh": false, "images": [{"as": "68su8XfqlqNiTvB6", "caption": "SdAdIhUDrwoZ5Mec", "height": 7, "imageUrl": "pc1C8XfwHuKeb9l3", "smallImageUrl": "rGN9A3sNm84hddSp", "width": 69}, {"as": "cBdW19m4eu6d5tA5", "caption": "jUmiTqpyhPFdxLzF", "height": 87, "imageUrl": "d8lDR6qVNPRZYdFL", "smallImageUrl": "IAjGGJddVCvu9vx5", "width": 76}, {"as": "vkLGMS0lyuI9a2I9", "caption": "u6Vpbsx5w8hqUI06", "height": 96, "imageUrl": "SuB0y5WUlrMdI4sN", "smallImageUrl": "veabntBSxTeIv53H", "width": 66}], "itemId": "YupD391C2qtPYoka", "itemIds": ["hFjkQsfCaTmt1d67", "FXGk2s9Q0mPVo3tw", "u0MesTCf9x4rt69l"], "itemQty": {"na7qxNeIxPz6MbwL": 67, "IY69z1UaLqYSYWyt": 77, "XQ0yYoNRKd3IL5TA": 87}, "itemType": "CODE", "language": "6iiPlSC2uE4o5Vwd", "listable": false, "localExt": {"m3MqHcUmLZZbSqb8": {}, "RwNmn9HrNQy4uZAA": {}, "iE0mit9RGCCHYzUO": {}}, "longDescription": "cEdscKHPEqgA8yu7", "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 94, "duration": 22, "endDate": "1994-05-19T00:00:00Z", "itemId": "Jt4Ymos9Jcdos4fY", "itemSku": "cTVU6RBt0zYoMcHy", "itemType": "CUEXlAvxJMdalwSy"}, {"count": 23, "duration": 85, "endDate": "1975-11-14T00:00:00Z", "itemId": "bOItRMvqtlB2jJCS", "itemSku": "QT279ZZPYGu0rdlg", "itemType": "dWyOtXi3choQrpOs"}, {"count": 61, "duration": 25, "endDate": "1985-08-26T00:00:00Z", "itemId": "U5SepjChB3V0v52D", "itemSku": "lym6puQ23xoJ8aeC", "itemType": "naLpUKp44YUDjasW"}], "name": "IPUvmEejtGeoyIPa", "odds": 0.9714507862859705, "type": "REWARD", "weight": 90}, {"lootBoxItems": [{"count": 7, "duration": 37, "endDate": "1977-06-26T00:00:00Z", "itemId": "ykmoPYgc2L4jk4Lo", "itemSku": "0LSP0pf4IxjUkl53", "itemType": "5X3ateEKDpADz1x3"}, {"count": 32, "duration": 30, "endDate": "1985-08-29T00:00:00Z", "itemId": "9xv32e8c5csSovoq", "itemSku": "sZNBdte9NDUPVJf6", "itemType": "c2Z0QZxfgPubTDIH"}, {"count": 36, "duration": 83, "endDate": "1982-11-17T00:00:00Z", "itemId": "qAThuwjRHpKKTlmV", "itemSku": "r9XuoJbRFQSKVPHb", "itemType": "n4Xxtu7LQRENjEEz"}], "name": "tx1WsYSiZqan0nSB", "odds": 0.5728983498865392, "type": "REWARD", "weight": 30}, {"lootBoxItems": [{"count": 0, "duration": 57, "endDate": "1981-10-04T00:00:00Z", "itemId": "91GXlvPG6bFYReVH", "itemSku": "QipcCx9Zw5D2L7vI", "itemType": "YhGGSyEW4ZJJ42d3"}, {"count": 85, "duration": 25, "endDate": "1985-03-04T00:00:00Z", "itemId": "ddN8S48l9lyNApfl", "itemSku": "xqMrj3oZk03QXcKM", "itemType": "DYDDxHSZjtqXyJ58"}, {"count": 10, "duration": 36, "endDate": "1977-09-29T00:00:00Z", "itemId": "jX9fDmIbeZxzfTcy", "itemSku": "iuATus9hsfpFDcSD", "itemType": "G8aMVGLiBNrDjqox"}], "name": "cwgGLXpUL4pp2ncY", "odds": 0.422365902819149, "type": "REWARD_GROUP", "weight": 21}], "rollFunction": "CUSTOM"}, "maxCount": 39, "maxCountPerUser": 82, "name": "fIovmv9gsR5cJcHm", "namespace": "3SZLxoRDFuuuySj2", "optionBoxConfig": {"boxItems": [{"count": 56, "duration": 1, "endDate": "1975-06-17T00:00:00Z", "itemId": "LJE8HoRS1X2PFAAM", "itemSku": "wzHPxB1UskYs4Yw2", "itemType": "0DOqOBSC2DKHRuPM"}, {"count": 80, "duration": 22, "endDate": "1995-02-07T00:00:00Z", "itemId": "H8Yb33T5UBJCjfcn", "itemSku": "LRfxeCSz9WEi8Kll", "itemType": "oeH0JT1yduat2vQR"}, {"count": 3, "duration": 66, "endDate": "1975-02-16T00:00:00Z", "itemId": "Bfsu4jmsRE2w1yEk", "itemSku": "Lgh3tIYt4SqYUTLD", "itemType": "x9gIiDandpGT2t24"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 83, "comparison": "isLessThan", "name": "Mh5eC3IHeHSKLCa3", "predicateType": "SeasonPassPredicate", "value": "AE7WIsfmx40NLRc6", "values": ["oKFeIaFQCYoDPICp", "nduEEQlULdJz4mnR", "m8heKnWhzfe2Nube"]}, {"anyOf": 56, "comparison": "is", "name": "CAcf80zfFyabWAgI", "predicateType": "SeasonTierPredicate", "value": "hRkloqxM3gpwxcfM", "values": ["zJEN2VHzih3bit0V", "y9XzjjI5YbsKoADk", "Wn3CO39PXDNxtXge"]}, {"anyOf": 83, "comparison": "isLessThanOrEqual", "name": "3FgkXhjDzaQY3snn", "predicateType": "EntitlementPredicate", "value": "ZkP7cFdP43e5dC9X", "values": ["qU0bfoMm5cTtFWbo", "IBudfZgrbHDIDm4h", "MzF4TxodenSrUTvf"]}]}, {"operator": "or", "predicates": [{"anyOf": 4, "comparison": "isLessThanOrEqual", "name": "6IjGa23YvYmmDg7V", "predicateType": "SeasonPassPredicate", "value": "PXIuvUYTZBRujIUE", "values": ["1Tq5jyAZvkRCMNFI", "urjh2imdb4rbkXj0", "ZwsVC0gL97ZVJSPq"]}, {"anyOf": 74, "comparison": "isNot", "name": "iwv1qlYB1RSKs6gQ", "predicateType": "SeasonPassPredicate", "value": "ZGF7uYnGzpipNDig", "values": ["NJma1MbqqZtfNWql", "4nmwAft4gqkNNlWk", "D9eOziYRFOn0jJLH"]}, {"anyOf": 58, "comparison": "isNot", "name": "LxhvNXTwGBCtohLt", "predicateType": "EntitlementPredicate", "value": "7MUBG7qtPu64yAtU", "values": ["MdIIlhS1fSiM9331", "RKLRkb738HGS6rDg", "m7Ta1PsKc50Kv6ec"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isNot", "name": "mQoIXimBJehyxlNs", "predicateType": "EntitlementPredicate", "value": "nGBt4P7WnbdSJtjX", "values": ["UTrDzZSKscfOcYu3", "dpCROYqUiGKXVFCm", "7ZshZyZl5x4bRXBH"]}, {"anyOf": 31, "comparison": "isGreaterThan", "name": "ogaKt2ujQSa3Zdb6", "predicateType": "SeasonTierPredicate", "value": "UXmy0Zp6iIaTIKUk", "values": ["1fiP80G9Pclxcft2", "zwLR2AK6eXUGPJsw", "mkk9QM0NBMA9ORxp"]}, {"anyOf": 42, "comparison": "is", "name": "DpZxkrQDXuNFviMa", "predicateType": "SeasonPassPredicate", "value": "uGKHhMRWLVd3DlhL", "values": ["uIpomM8sm1MiaI1m", "X2tJoARtdbBe7uds", "Mrok0WvGYYnx4V70"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 49, "fixedTrialCycles": 9, "graceDays": 2}, "region": "ue9nzJ6fH24T805t", "regionData": [{"currencyCode": "Vg8JqU0jZpjvsugA", "currencyNamespace": "OS7u8RiWyerCSa8S", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1997-06-30T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-01-29T00:00:00Z", "discountedPrice": 55, "expireAt": "1979-03-16T00:00:00Z", "price": 36, "purchaseAt": "1998-10-10T00:00:00Z", "trialPrice": 16}, {"currencyCode": "xsB0NRsB1fPqqRRu", "currencyNamespace": "lpqpymDkQhtrHWwR", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1995-08-07T00:00:00Z", "discountedPrice": 56, "expireAt": "1991-10-31T00:00:00Z", "price": 33, "purchaseAt": "1983-12-03T00:00:00Z", "trialPrice": 68}, {"currencyCode": "wbhMssAHjapIkY9R", "currencyNamespace": "f4wP57dBZNR88YbC", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1977-01-29T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1992-07-15T00:00:00Z", "discountedPrice": 82, "expireAt": "1977-11-12T00:00:00Z", "price": 10, "purchaseAt": "1984-07-26T00:00:00Z", "trialPrice": 4}], "saleConfig": {"currencyCode": "VrjfGXZnqAQUoY1G", "price": 20}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "Zp50CnPb71ORYcmQ", "stackable": false, "status": "INACTIVE", "tags": ["aKQDOJvrTefglSs6", "U5JX8ccLjMXJRk0e", "g4iY9u02aCNYIWek"], "targetCurrencyCode": "p18lOC3mNqF7Bl0L", "targetItemId": "cghVHfPEspxwhRON", "targetNamespace": "0bc1eMbEIjowLqc3", "thumbnailUrl": "ecjXJbZDKKoxLE1Y", "title": "3Dymtj3giPg4x4yi", "updatedAt": "1992-03-11T00:00:00Z", "useCount": 1}, "namespace": "6ues1Hhhkg1yLVbL", "order": {"currency": {"currencyCode": "FzHEP8cM4NTwr0KH", "currencySymbol": "aAsmTej52WKi6tAr", "currencyType": "VIRTUAL", "decimals": 46, "namespace": "URt9plCSVq8PdH6h"}, "ext": {"JPUAc0RVwXgAgntL": {}, "MCuaXBWQi6BqPg4x": {}, "r0lCancUZGCHsZYo": {}}, "free": false}, "source": "EXPIRATION"}, "script": "R1KtOv7Zy0b65uvu", "type": "grantDays"}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"iS76YApGJ9ufwLYk": "qIgLuZS6hsQryiEt", "OAbpeUNf26UqkCfg": "CUYBn2xaOBdPF0Jm", "X8qwU1cTuHHPB5S3": "DvPRCzBrVUxmDOj3"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"Gs9yxahld1pO0Gyf": "5PO3COyMvczgEpzZ", "3FbtxfhcRC7IVYa6": "iZ5uFRYNn3SHiWxF", "0YbuU5ar5qTLWUCy": "0Afgc050XIZRW491"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"1PO6ApCD2VXidT7w": "0Oc15N8WXBPp17PA", "ewqSm5x3B4t7WQnp": "8jXZedgt5cyNe27H", "LtwtVOaxgP6Jbct8": "puMybYGxD9IPmmsL"}}]}' \
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

#- 66 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '2poMfZ1hDHtbh4Ht' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'RD9vNAp4jinFpnQ5' \
    --limit '49' \
    --offset '43' \
    --startTime 'F9wwbvMZyeDeRnVf' \
    --status 'INIT' \
    --userId 'Ua6xVVBcq3wZpFIY' \
    > test.out 2>&1
eval_tap $? 66 'QueryIAPClawbackHistory' test.out

#- 67 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "eAg79HcLJXJ7mpVI", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 8, "clientTransactionId": "eTYAjdPlCiQQC35c"}, {"amountConsumed": 20, "clientTransactionId": "AetsanzqP8oxfrtb"}, {"amountConsumed": 63, "clientTransactionId": "7cUQZ2QUAxJrINPX"}], "entitlementId": "ppPNO3AfmXcgwC3I", "usageCount": 82}, {"clientTransaction": [{"amountConsumed": 5, "clientTransactionId": "6tvKgLB9QmJIOq9d"}, {"amountConsumed": 85, "clientTransactionId": "G0WKt4sUmanYxM0U"}, {"amountConsumed": 68, "clientTransactionId": "9gUCeVz7fWbZIdhe"}], "entitlementId": "vfZvyV7AcodcZwKj", "usageCount": 81}, {"clientTransaction": [{"amountConsumed": 60, "clientTransactionId": "KKWrFtHIi1CMgKAO"}, {"amountConsumed": 66, "clientTransactionId": "8QqftSjq7sn8yrec"}, {"amountConsumed": 18, "clientTransactionId": "wj9cKM3Ar6MF35hC"}], "entitlementId": "ER4nGmWGgTJfHlJl", "usageCount": 40}], "purpose": "o2jZWu4yA3r0u4q1"}, "originalTitleName": "bTHXIjfJKyFlM0u1", "paymentProductSKU": "uuoVdn9yVoSlKNch", "purchaseDate": "PHNL4X3LLaGPGdqL", "sourceOrderItemId": "E8SohhhuiTnJarYY", "titleName": "kHBDdSzBXdxapwhd"}, "eventDomain": "5IQYBQuxLvPuWYvE", "eventSource": "3fsNy9Z9OhxXvCp9", "eventType": "y7fLD2qfCXnlUnqx", "eventVersion": 94, "id": "1IiD6MlcEPhMDFzj", "timestamp": "HZ3sIhzOx2CXKlvI"}' \
    > test.out 2>&1
eval_tap $? 67 'MockPlayStationStreamEvent' test.out

#- 68 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'GetAppleIAPConfig' test.out

#- 69 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "omU3pIxM9n8D2eLM", "password": "e3lt9qfx2UDcgVE7"}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateAppleIAPConfig' test.out

#- 70 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'DeleteAppleIAPConfig' test.out

#- 71 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEpicGamesIAPConfig' test.out

#- 72 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "L9FK6e0MrPc4vtxk"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateEpicGamesIAPConfig' test.out

#- 73 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteEpicGamesIAPConfig' test.out

#- 74 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetGoogleIAPConfig' test.out

#- 75 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "9hVKlG56HlzGr7Xj", "serviceAccountId": "dyRJunZPkp6ccIBn"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateGoogleIAPConfig' test.out

#- 76 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteGoogleIAPConfig' test.out

#- 77 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 77 'UpdateGoogleP12File' test.out

#- 78 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetIAPItemConfig' test.out

#- 79 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "WyPw8mj7gyQ7XdIs", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"miteR5eQAe1rzmmg": "qBPRmd6mO4oI8KDq", "ebm83raNBJ5y7axE": "kvI4oxZEDxGiBnNb", "n0zaf7CaOSlHXrUS": "A6sMJzA5mtqISQ83"}}, {"itemIdentity": "TTbtefXWznDe4LQd", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"fFBii2RAMEX5RMjB": "FVZGYzQqV8d9mDdU", "IoiIJFNxuNOmUSWw": "18T1IxVWCxdvPL9e", "4P01vxP8xj1LyEir": "URERnEMzpImW6sjA"}}, {"itemIdentity": "HyCK5tNanGBrkzUv", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"8ITGPRQBCgIs1Q2l": "zxl0yF5m77TTh4gU", "oj8u2WRcLiEtzVln": "kflfn7pHY48F1dl1", "q92m3iRlfnBAk0Cw": "iAsR65yQ9ssuHdGm"}}]}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateIAPItemConfig' test.out

#- 80 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'DeleteIAPItemConfig' test.out

#- 81 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetOculusIAPConfig' test.out

#- 82 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "xncCEr0KcgeqzGbr", "appSecret": "uNB72HHMkjzyBB4U"}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateOculusIAPConfig' test.out

#- 83 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteOculusIAPConfig' test.out

#- 84 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetPlayStationIAPConfig' test.out

#- 85 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "FKiaoV0VOem2yqPs", "backOfficeServerClientSecret": "MFxKybPkbuS6x9cL", "enableStreamJob": false, "environment": "1APnNlsa2bRBr27f", "streamName": "VMWuAfDqLMR919IZ", "streamPartnerName": "PKOKiAVQXXOmqFHL"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdatePlaystationIAPConfig' test.out

#- 86 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'DeletePlaystationIAPConfig' test.out

#- 87 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'ValidateExistedPlaystationIAPConfig' test.out

#- 88 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "byXmgCNiXH8uenbC", "backOfficeServerClientSecret": "5CphgMweexsIAP5v", "enableStreamJob": true, "environment": "LjBJ9iqMcBL4BzhD", "streamName": "UjhKPwbwcvQU5kG8", "streamPartnerName": "bXGFmPAnOkDiJq4x"}' \
    > test.out 2>&1
eval_tap $? 88 'ValidatePlaystationIAPConfig' test.out

#- 89 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'GetSteamIAPConfig' test.out

#- 90 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "Qye7HqnVK3YVeOWs", "publisherAuthenticationKey": "9mfVQh3jLBtn9pxp"}' \
    > test.out 2>&1
eval_tap $? 90 'UpdateSteamIAPConfig' test.out

#- 91 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'DeleteSteamIAPConfig' test.out

#- 92 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'GetTwitchIAPConfig' test.out

#- 93 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "E7BYtzB0B4CxyQrU", "clientSecret": "pIFvORxTi79DpSjb", "organizationId": "39ukcR6c2E2r3vk3"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateTwitchIAPConfig' test.out

#- 94 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'DeleteTwitchIAPConfig' test.out

#- 95 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetXblIAPConfig' test.out

#- 96 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "IfAKEbqcNXSGCCvN"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateXblIAPConfig' test.out

#- 97 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'DeleteXblAPConfig' test.out

#- 98 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'owNmdpcJgF88ySNq' \
    > test.out 2>&1
eval_tap $? 98 'UpdateXblBPCertFile' test.out

#- 99 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '4Mj7mulP4tQ6R1Oq' \
    --itemId 'KVOTniBgLsNhdgQ0' \
    --itemType 'SEASON' \
    --endTime 'ARHCmhNHSXuqIHsx' \
    --startTime 'vaUoXDmwWsukxncu' \
    > test.out 2>&1
eval_tap $? 99 'DownloadInvoiceDetails' test.out

#- 100 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'D3QxCXMd00YBWCaV' \
    --itemId 'VmM45mfIZsWhkS47' \
    --itemType 'APP' \
    --endTime 'ch4IjDq9aT3qZyI0' \
    --startTime 'rYsWucAkXsVJbXi7' \
    > test.out 2>&1
eval_tap $? 100 'GenerateInvoiceSummary' test.out

#- 101 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eRZa7WwIc895ImqK' \
    --body '{"categoryPath": "6tVsaUq3stUh5J5Z", "targetItemId": "9GiBiSAylX5cS0Ie", "targetNamespace": "HpWCugmfOL0QQpxs"}' \
    > test.out 2>&1
eval_tap $? 101 'SyncInGameItem' test.out

#- 102 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uD8PGqku59eFJrOX' \
    --body '{"appId": "yDYz9vMUOPG0iHDT", "appType": "DEMO", "baseAppId": "QbF7gHPTPQbvLt2N", "boothName": "RqJGIKzLyH1y72L1", "categoryPath": "3Ornyx34luLdvtsT", "clazz": "KXMjiw6gYPvfn2Qt", "displayOrder": 82, "entitlementType": "CONSUMABLE", "ext": {"g14Ws8TIP1LKiFQo": {}, "LDvumfqrgSfnx2h6": {}, "1X9dN1MGRXBJ6mVV": {}}, "features": ["7JS9qjNLwvI8JdiY", "3RRiLilmOGF6dLLI", "eIVIjMcdlbdRXTGI"], "images": [{"as": "rdNL5gJPqTAjgqaT", "caption": "Hf1ANTJ9Yk997XkG", "height": 83, "imageUrl": "uLryiEXqvUWDjU1G", "smallImageUrl": "0EVjVZw1ToLuPakQ", "width": 80}, {"as": "gDOK8bjoF7bL2635", "caption": "KbtZTGJpqgl2IzNX", "height": 67, "imageUrl": "TDSIM7mkmvZ7Cmsh", "smallImageUrl": "4US8o4jfMANPpmZD", "width": 7}, {"as": "nmnlVljdWYmELe74", "caption": "p38vumnxAnYBTxaT", "height": 71, "imageUrl": "hcWm428XejRF94NI", "smallImageUrl": "Y9nMrBZo0lNUBDSh", "width": 68}], "itemIds": ["eqhwVhjnnjKMEmtb", "iWsAQHbMrKYi0Zxs", "5SWCqZXHLLa31oQf"], "itemQty": {"7BULnZDhutDM6Bqg": 41, "ufV4f15NohXu6opx": 88, "znsqPzPkwCBo2SwC": 95}, "itemType": "EXTENSION", "listable": false, "localizations": {"ag4MLAo3m61P2xaN": {"description": "fmn8Onb1a9gMz0F2", "localExt": {"UBRmMhAbUWmFhdYL": {}, "WzMuv3zkUY0n0BAZ": {}, "kwbYkBLyO6A0Fqfh": {}}, "longDescription": "naB3YxKNdOTacCcJ", "title": "fIfXshuLUk5Wdpxj"}, "Zx5noXPhPUTKbono": {"description": "ucNmzwOZOK56sDkc", "localExt": {"i5rZ8iMlOuksQJCi": {}, "RFiZWwJ7NrTb1XTB": {}, "9YQzUJ9XlYJ8BzP6": {}}, "longDescription": "EUmUXGM5anIloyj9", "title": "lhbvuQdW2jwKUckc"}, "794ryY91lX8DD4MY": {"description": "XlrJ81lHvv9rqvEo", "localExt": {"M8YmVjAkO3HKsEp6": {}, "KlqwW4djrexcbHdE": {}, "toQvpV344RctmToz": {}}, "longDescription": "Ci8HeV6jbalHmqBB", "title": "fi7sSF5BoGiTCVsX"}}, "lootBoxConfig": {"rewardCount": 37, "rewards": [{"lootBoxItems": [{"count": 65, "duration": 50, "endDate": "1974-09-29T00:00:00Z", "itemId": "WbjE2opXtdsJQeJ1", "itemSku": "too0qvxphTLEEBGT", "itemType": "tZyTjdKNKgYazujs"}, {"count": 26, "duration": 70, "endDate": "1993-07-09T00:00:00Z", "itemId": "mylT1YtxIq73aMb4", "itemSku": "8jISd97KORRhxSWL", "itemType": "WLNfHRD3V15QaGGL"}, {"count": 57, "duration": 76, "endDate": "1974-06-17T00:00:00Z", "itemId": "ZYTYZbzf5aANNNs5", "itemSku": "kgSZZNUHbIT9szAp", "itemType": "mWJO5vzzXZj08a6K"}], "name": "1XRVfriSpPFnZBJZ", "odds": 0.1740583947416351, "type": "REWARD", "weight": 89}, {"lootBoxItems": [{"count": 28, "duration": 56, "endDate": "1986-05-21T00:00:00Z", "itemId": "iyfa2LrnpZxNnLRH", "itemSku": "36bqS2oFY76PU1Az", "itemType": "iBOHEAj1cT3u6Zc2"}, {"count": 64, "duration": 72, "endDate": "1971-05-29T00:00:00Z", "itemId": "BJfZ0jvA54CSqZFD", "itemSku": "sO1skRjOU1SMfQVQ", "itemType": "a6blj9Rdd85bdYUu"}, {"count": 25, "duration": 26, "endDate": "1992-10-22T00:00:00Z", "itemId": "49rWynp1ck1vT90C", "itemSku": "6o86cSRL9cgbUmul", "itemType": "he98oaFKlQicdrxV"}], "name": "hrtwSd9QWVMYz7TU", "odds": 0.8660777795177917, "type": "REWARD_GROUP", "weight": 30}, {"lootBoxItems": [{"count": 37, "duration": 89, "endDate": "1983-12-24T00:00:00Z", "itemId": "sChSclSkb5aBi9K9", "itemSku": "zyv6gFZXI5nXJ7hL", "itemType": "i6HweweRmyo91dIn"}, {"count": 87, "duration": 49, "endDate": "1979-08-16T00:00:00Z", "itemId": "pdX2QSPAd9sxoLnW", "itemSku": "GP1PafIjLX8ce0Kb", "itemType": "NN7Ycl2JfmQplvGj"}, {"count": 97, "duration": 1, "endDate": "1993-09-22T00:00:00Z", "itemId": "4aebjfgGu472oWJl", "itemSku": "fglLM4xjfkNL4lU6", "itemType": "jaGfsD1cfswmeFpv"}], "name": "tDtetoQVFL8LNW11", "odds": 0.3515761672439196, "type": "REWARD", "weight": 92}], "rollFunction": "CUSTOM"}, "maxCount": 64, "maxCountPerUser": 1, "name": "Z0LpupEi5DbkVs3q", "optionBoxConfig": {"boxItems": [{"count": 64, "duration": 21, "endDate": "1994-08-17T00:00:00Z", "itemId": "i1t530Wj1WfzIvc3", "itemSku": "VlSXrA3XUGud4tVj", "itemType": "mxEf4XvVhFJTxFHI"}, {"count": 94, "duration": 57, "endDate": "1991-02-15T00:00:00Z", "itemId": "uDZvPb1kuUfNfUDe", "itemSku": "4g7q6PHEaqbzHvDD", "itemType": "l1jiLw3XMGBA6JXD"}, {"count": 32, "duration": 48, "endDate": "1984-03-30T00:00:00Z", "itemId": "1tIC45C0oaGouFu4", "itemSku": "hXONgUwJnUpryDeR", "itemType": "cpUvlrw2MwC1uuok"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 92, "fixedTrialCycles": 70, "graceDays": 77}, "regionData": {"jL0Vxe5n9Lx3QcFo": [{"currencyCode": "9gxOgvDc7xMrRKvw", "currencyNamespace": "8ISP2WKmCRRXBxla", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1985-09-28T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1980-03-01T00:00:00Z", "expireAt": "1995-01-30T00:00:00Z", "price": 24, "purchaseAt": "1990-10-24T00:00:00Z", "trialPrice": 13}, {"currencyCode": "xLpS8fLWoQ5nuJha", "currencyNamespace": "tQPxR7dvBVC5zgOK", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1986-04-19T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1972-10-04T00:00:00Z", "expireAt": "1999-02-02T00:00:00Z", "price": 14, "purchaseAt": "1995-01-20T00:00:00Z", "trialPrice": 9}, {"currencyCode": "ZFyyEr0KBXuJBqK4", "currencyNamespace": "QtEydPWLPBYiR3Ub", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1998-01-14T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1996-11-15T00:00:00Z", "expireAt": "1971-12-09T00:00:00Z", "price": 30, "purchaseAt": "1989-07-12T00:00:00Z", "trialPrice": 1}], "C477etqgfOJDUT0u": [{"currencyCode": "KAPrARya2IMlNiXp", "currencyNamespace": "F4qvsUUpHqi33TcB", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1979-01-24T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1998-01-18T00:00:00Z", "expireAt": "1988-08-11T00:00:00Z", "price": 20, "purchaseAt": "1992-11-07T00:00:00Z", "trialPrice": 4}, {"currencyCode": "AEcNcJqrKxnMzSYo", "currencyNamespace": "c4ZjiMY4H34B6wVd", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1999-04-30T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1971-10-31T00:00:00Z", "expireAt": "1972-08-29T00:00:00Z", "price": 46, "purchaseAt": "1988-12-15T00:00:00Z", "trialPrice": 2}, {"currencyCode": "eUWtjCC2UH6jzMO3", "currencyNamespace": "AfmOS5mQNyRPZFPN", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1977-10-30T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1994-11-12T00:00:00Z", "expireAt": "1995-11-23T00:00:00Z", "price": 76, "purchaseAt": "1979-10-30T00:00:00Z", "trialPrice": 26}], "mZhCZxxPPdPwOtEu": [{"currencyCode": "WBSO2jJepUnEEgja", "currencyNamespace": "2mIE2kLTnJwc5Xmk", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1981-02-04T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1999-11-16T00:00:00Z", "expireAt": "1995-08-13T00:00:00Z", "price": 65, "purchaseAt": "1981-05-06T00:00:00Z", "trialPrice": 74}, {"currencyCode": "62xlXvVcJerTPW02", "currencyNamespace": "PWsHiKYArAxnKBfB", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1986-09-11T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1979-02-27T00:00:00Z", "expireAt": "1992-08-23T00:00:00Z", "price": 86, "purchaseAt": "1972-06-15T00:00:00Z", "trialPrice": 30}, {"currencyCode": "Ac10DjjwMv4vrIPR", "currencyNamespace": "tvhQIyLarjaLOKnX", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1980-08-02T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1985-07-17T00:00:00Z", "expireAt": "1976-12-11T00:00:00Z", "price": 90, "purchaseAt": "1971-06-19T00:00:00Z", "trialPrice": 77}]}, "saleConfig": {"currencyCode": "NGKhaLlJzJMSnJII", "price": 13}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "VmaGYxUX1B9oVuzG", "stackable": true, "status": "INACTIVE", "tags": ["9HF9ejHaILQruAuY", "kaZP7pnnVfxPwc25", "dq22cbnyK3ggFDh2"], "targetCurrencyCode": "yJLYGqMv824ouSgk", "targetNamespace": "pK70uJmUL0uzElix", "thumbnailUrl": "c023dIvDiA0tQWlH", "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 102 'CreateItem' test.out

#- 103 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'GBjnHmaAu4YK87DY' \
    --appId 'AWWcbcbGWmKgE8CZ' \
    > test.out 2>&1
eval_tap $? 103 'GetItemByAppId' test.out

#- 104 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'AELr5lraa5v5P5Cj' \
    --baseAppId '8hgFsqHC9h5JPiME' \
    --categoryPath 'tgKuiGTYgwWv5Xld' \
    --features 'L6rOVGcRAn51rVAQ' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --limit '48' \
    --offset '31' \
    --region 'ZFgJbQ3Fj1umx4It' \
    --sortBy 'updatedAt,name:desc,name:asc' \
    --storeId 'Z7mLYsHooOIaxIpb' \
    --tags '1cIOJPS3lJ80YJ41' \
    --targetNamespace 'U4ooQ980ywmg1pWp' \
    > test.out 2>&1
eval_tap $? 104 'QueryItems' test.out

#- 105 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'Wit1QC7FKe0fnHUl,mU1unGKM0tgfeWy4,7bbwMI4gGmvK9gW5' \
    > test.out 2>&1
eval_tap $? 105 'ListBasicItemsByFeatures' test.out

#- 106 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '96FwBNrFXt3TAuKB' \
    --sku 'wBcD12ae6r3hHwya' \
    > test.out 2>&1
eval_tap $? 106 'GetItemBySku' test.out

#- 107 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '4NpdOzg3hr6ucHf7' \
    --populateBundle  \
    --region 'dbh2iKNUl0qJqzoK' \
    --storeId 'MRMG541PAiNjULsx' \
    --sku '4SnKNXLMUaDSwwQl' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItemBySku' test.out

#- 108 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nNRZJHBSB4fZWEFI' \
    --sku 'Zs28Ff1kZp1Zktx3' \
    > test.out 2>&1
eval_tap $? 108 'GetItemIdBySku' test.out

#- 109 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'N7WNMYIfcDKbLu8p,nK34oA1keYXJvtgg,DdXjbdjMBahFZZGM' \
    --storeId 'TcqnWrIprOv0BJ9S' \
    > test.out 2>&1
eval_tap $? 109 'GetBulkItemIdBySkus' test.out

#- 110 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'gl7H1sdH2RIJz1eI' \
    --region '7Q5pu9PutLf6IrvZ' \
    --storeId 'oBGQbO4S3rURGWUz' \
    --itemIds 'PAE6SdV4D5jftRl9' \
    > test.out 2>&1
eval_tap $? 110 'BulkGetLocaleItems' test.out

#- 111 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 111 'GetAvailablePredicateTypes' test.out

#- 112 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZmtQUvro8TWwXWs' \
    --body '{"itemIds": ["z9TVmdMKEohKzuMY", "DUTLBeCidXjuGgx8", "ncXejmeZtzT0qj0l"]}' \
    > test.out 2>&1
eval_tap $? 112 'ValidateItemPurchaseCondition' test.out

#- 113 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tsqfiZrthVvyX0OC' \
    --body '{"changes": [{"itemIdentities": ["KDJE3RMUddwSSgxC", "u8zru1DhGAYOHR5B", "Wa9VzIkaQEl1iUPr"], "itemIdentityType": "ITEM_ID", "regionData": {"T2sY3SsTnDQY7kKU": [{"currencyCode": "2u06Q4veujxtyQEN", "currencyNamespace": "vJrBCqeg67d4RWOq", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1989-02-04T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1999-03-03T00:00:00Z", "discountedPrice": 11, "expireAt": "1981-10-17T00:00:00Z", "price": 81, "purchaseAt": "1988-12-17T00:00:00Z", "trialPrice": 50}, {"currencyCode": "LzwRoWnR0AbkCPY7", "currencyNamespace": "0FmvviVIBbcujF8V", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1983-05-18T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1971-03-04T00:00:00Z", "discountedPrice": 100, "expireAt": "1991-03-30T00:00:00Z", "price": 16, "purchaseAt": "1993-06-29T00:00:00Z", "trialPrice": 6}, {"currencyCode": "axyMchkt8l5IPSrw", "currencyNamespace": "rJl7wYIVw13NCo9y", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1971-12-17T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1976-09-14T00:00:00Z", "discountedPrice": 94, "expireAt": "1994-09-12T00:00:00Z", "price": 68, "purchaseAt": "1982-08-15T00:00:00Z", "trialPrice": 58}], "Y6HKXAblkT8VGgSH": [{"currencyCode": "8MGZGwiVj7eDTaka", "currencyNamespace": "9ABfX1IByPEOuPhG", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1978-06-21T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1998-03-06T00:00:00Z", "discountedPrice": 2, "expireAt": "1971-03-02T00:00:00Z", "price": 30, "purchaseAt": "1992-12-15T00:00:00Z", "trialPrice": 41}, {"currencyCode": "vBBJI5JxytpcubN4", "currencyNamespace": "AUUPFPscZsXeJOD4", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1991-03-08T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1979-10-21T00:00:00Z", "discountedPrice": 10, "expireAt": "1996-10-09T00:00:00Z", "price": 63, "purchaseAt": "1987-03-09T00:00:00Z", "trialPrice": 67}, {"currencyCode": "sUBBq2SimQQoLbe5", "currencyNamespace": "YOJvxGRxUzrTwagH", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1990-10-07T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1984-07-26T00:00:00Z", "discountedPrice": 71, "expireAt": "1996-07-27T00:00:00Z", "price": 75, "purchaseAt": "1973-01-29T00:00:00Z", "trialPrice": 81}], "MEdJFAy2JTllJkRG": [{"currencyCode": "B8jqJEd6eqqsBVyO", "currencyNamespace": "NV0JRtozI0jpliCF", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1986-02-18T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1989-08-09T00:00:00Z", "discountedPrice": 32, "expireAt": "1996-09-20T00:00:00Z", "price": 45, "purchaseAt": "1992-03-10T00:00:00Z", "trialPrice": 41}, {"currencyCode": "gdc5VyC4qvWjVac1", "currencyNamespace": "cQvSxgTNIUzxDgBl", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1985-06-13T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1984-04-11T00:00:00Z", "discountedPrice": 42, "expireAt": "1999-08-27T00:00:00Z", "price": 16, "purchaseAt": "1984-06-09T00:00:00Z", "trialPrice": 73}, {"currencyCode": "rsf8eIFSovTGXaMs", "currencyNamespace": "q8ePN1oco2jx8Upe", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1990-05-25T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1972-05-12T00:00:00Z", "discountedPrice": 33, "expireAt": "1983-11-14T00:00:00Z", "price": 31, "purchaseAt": "1982-06-17T00:00:00Z", "trialPrice": 16}]}}, {"itemIdentities": ["ggOEdG47gD5i2Ni6", "AnWn3NdEPhNHSH7e", "KDfRcngEpTnRUQr3"], "itemIdentityType": "ITEM_SKU", "regionData": {"LOM1vEx4gqDY6jwy": [{"currencyCode": "KRxhkLe5zohg9s9u", "currencyNamespace": "tRQt28b6o3K0COF7", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1984-07-12T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1991-02-02T00:00:00Z", "discountedPrice": 56, "expireAt": "1996-01-11T00:00:00Z", "price": 83, "purchaseAt": "1972-04-01T00:00:00Z", "trialPrice": 45}, {"currencyCode": "voaJYdMqGegcg3eR", "currencyNamespace": "vBZXN3cjIXmFWRJn", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1994-07-08T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1991-11-18T00:00:00Z", "discountedPrice": 27, "expireAt": "1988-08-27T00:00:00Z", "price": 1, "purchaseAt": "1992-06-17T00:00:00Z", "trialPrice": 62}, {"currencyCode": "xk6u6HXXdiC9ZDj4", "currencyNamespace": "E4mv12FNXypoOLl1", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1973-12-07T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1997-01-05T00:00:00Z", "discountedPrice": 74, "expireAt": "1988-05-16T00:00:00Z", "price": 7, "purchaseAt": "1975-04-22T00:00:00Z", "trialPrice": 35}], "I6Ag7eUYcYJ4QzXC": [{"currencyCode": "mqr6gmPGaHP5SVPv", "currencyNamespace": "RLiDi0mNHb6Lx8eq", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1981-09-25T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1991-07-01T00:00:00Z", "discountedPrice": 62, "expireAt": "1986-12-12T00:00:00Z", "price": 83, "purchaseAt": "1973-12-25T00:00:00Z", "trialPrice": 8}, {"currencyCode": "j17xGhaBKoUfiHjG", "currencyNamespace": "mCyPsKCJTv1ic9gv", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1974-06-20T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1994-09-04T00:00:00Z", "discountedPrice": 4, "expireAt": "1972-07-29T00:00:00Z", "price": 42, "purchaseAt": "1980-07-29T00:00:00Z", "trialPrice": 40}, {"currencyCode": "KjQ3ttz8MTBt1xk9", "currencyNamespace": "IyssSA8nP5PQjpzk", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1993-01-04T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1975-02-11T00:00:00Z", "discountedPrice": 75, "expireAt": "1972-08-05T00:00:00Z", "price": 26, "purchaseAt": "1987-11-16T00:00:00Z", "trialPrice": 17}], "ZWosrsVBPZ64j0HU": [{"currencyCode": "ONscofwYLQcDvkaE", "currencyNamespace": "IIPoJT83zEGXmVBZ", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1997-05-21T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1988-06-12T00:00:00Z", "discountedPrice": 73, "expireAt": "1985-12-04T00:00:00Z", "price": 56, "purchaseAt": "1987-04-26T00:00:00Z", "trialPrice": 50}, {"currencyCode": "81q9GA5DydC2D8UT", "currencyNamespace": "6KOc4VPDUR9ayazq", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1993-02-01T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1974-12-01T00:00:00Z", "discountedPrice": 72, "expireAt": "1973-04-05T00:00:00Z", "price": 16, "purchaseAt": "1989-01-20T00:00:00Z", "trialPrice": 51}, {"currencyCode": "YXXzxsBFrUs9BYp6", "currencyNamespace": "TgCejBd5o7iTST7R", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1971-01-10T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1993-02-23T00:00:00Z", "discountedPrice": 66, "expireAt": "1990-09-03T00:00:00Z", "price": 90, "purchaseAt": "1989-11-12T00:00:00Z", "trialPrice": 81}]}}, {"itemIdentities": ["x25FZfQIodVBqQsB", "pCJBIXLGYcwWVRK6", "UKk5ozrXA4HZHNyq"], "itemIdentityType": "ITEM_ID", "regionData": {"J9j4vxmbH3rVaauu": [{"currencyCode": "fxkPHElug48TgfNu", "currencyNamespace": "0rqXUOyToLPIREGI", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1989-12-03T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1977-09-06T00:00:00Z", "discountedPrice": 7, "expireAt": "1992-10-27T00:00:00Z", "price": 64, "purchaseAt": "1976-10-29T00:00:00Z", "trialPrice": 81}, {"currencyCode": "wkENQ8VOHGwbADMf", "currencyNamespace": "uOmh0lciRhVZ2Deo", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1996-09-14T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1989-07-22T00:00:00Z", "discountedPrice": 7, "expireAt": "1990-05-22T00:00:00Z", "price": 91, "purchaseAt": "1977-05-21T00:00:00Z", "trialPrice": 19}, {"currencyCode": "zoiBnYi5UWs3tYlY", "currencyNamespace": "eMoCimJySocRvUWD", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1987-12-07T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1989-04-06T00:00:00Z", "discountedPrice": 85, "expireAt": "1987-11-22T00:00:00Z", "price": 19, "purchaseAt": "1978-11-21T00:00:00Z", "trialPrice": 44}], "9AWtLK9TFgi9j2XM": [{"currencyCode": "h9WpifqjNjLOtNQt", "currencyNamespace": "s2yxf6MLZJ2jZfZb", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1994-10-14T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1973-01-03T00:00:00Z", "discountedPrice": 53, "expireAt": "1990-07-30T00:00:00Z", "price": 35, "purchaseAt": "1980-01-23T00:00:00Z", "trialPrice": 16}, {"currencyCode": "0WFgKjE945x2CPVY", "currencyNamespace": "YG9WvoGmAmvaVV5Y", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1982-08-01T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1983-10-20T00:00:00Z", "discountedPrice": 80, "expireAt": "1991-01-15T00:00:00Z", "price": 51, "purchaseAt": "1982-03-20T00:00:00Z", "trialPrice": 71}, {"currencyCode": "r7gSGhnfuF4WZiQV", "currencyNamespace": "ICVpWd3UM08gMXhd", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1999-03-10T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1997-03-08T00:00:00Z", "discountedPrice": 100, "expireAt": "1976-05-24T00:00:00Z", "price": 72, "purchaseAt": "1991-05-05T00:00:00Z", "trialPrice": 29}], "rIb3CJCAtvSG8Cfa": [{"currencyCode": "9dzOJDGCTHIOFjeX", "currencyNamespace": "bsSgR43kIDzxBwqR", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1993-07-29T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1979-10-01T00:00:00Z", "discountedPrice": 49, "expireAt": "1991-05-06T00:00:00Z", "price": 90, "purchaseAt": "1996-04-16T00:00:00Z", "trialPrice": 38}, {"currencyCode": "q5o4ETeCUYG9ccTt", "currencyNamespace": "7Wxw8OQ13t3uTw6z", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1998-04-28T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1997-07-29T00:00:00Z", "discountedPrice": 4, "expireAt": "1994-09-18T00:00:00Z", "price": 87, "purchaseAt": "1983-05-03T00:00:00Z", "trialPrice": 23}, {"currencyCode": "oTOxe8y1jorNsg9Z", "currencyNamespace": "KYCKoISyXtHzoWGd", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1971-07-18T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1990-08-31T00:00:00Z", "discountedPrice": 32, "expireAt": "1988-11-17T00:00:00Z", "price": 42, "purchaseAt": "1991-04-07T00:00:00Z", "trialPrice": 87}]}}]}' \
    > test.out 2>&1
eval_tap $? 113 'BulkUpdateRegionData' test.out

#- 114 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '41' \
    --offset '51' \
    --sortBy 'g2zkVf6KgpKOcn3t' \
    --storeId 'MD9UT67bOwugFDa6' \
    --keyword 'wUQvehKqwCh86XmR' \
    --language 'kCEcfHDCdl59Wp9A' \
    > test.out 2>&1
eval_tap $? 114 'SearchItems' test.out

#- 115 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '49' \
    --offset '40' \
    --sortBy 'updatedAt:desc,name,updatedAt:asc' \
    --storeId '5vjkfz3eR4DtNp12' \
    > test.out 2>&1
eval_tap $? 115 'QueryUncategorizedItems' test.out

#- 116 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '9hzBw3xLUcCEt0Dz' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'mkJq1sml5bYt76BN' \
    > test.out 2>&1
eval_tap $? 116 'GetItem' test.out

#- 117 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'si4giR9434WpKKdz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xoufCNlFoOcWQQy4' \
    --body '{"appId": "bjmQeEweoBHTdwAk", "appType": "GAME", "baseAppId": "nbqY1cQwVEtAr5kK", "boothName": "KAo9MM2Cqm84jVi9", "categoryPath": "kIpqgrzpUkNOBWyd", "clazz": "XV0Fi02aFr8CDapj", "displayOrder": 46, "entitlementType": "DURABLE", "ext": {"NOl4k8rVNrm8drv8": {}, "QD2JOe2Ntz7EFvow": {}, "PgIGuetxFMqXCQMA": {}}, "features": ["U8mosluiHZJ7O8sA", "qQ2ZRGzNtrThFa9X", "Q32wj9uaDzsr9xYi"], "images": [{"as": "WRuuzQJiLc1eI9w3", "caption": "JEhxPGbEk7s7gw07", "height": 65, "imageUrl": "5jlpJdre5ur6yvWJ", "smallImageUrl": "DdvM7T7PX2vamIRZ", "width": 68}, {"as": "VDginxAM77eY9C14", "caption": "FbfiI2NPvl1kCY5b", "height": 62, "imageUrl": "J06DzfbzRYt4OVUy", "smallImageUrl": "umBeIqdQGZC5kM03", "width": 69}, {"as": "Nk5FGUPhR4LEZvz3", "caption": "EjFR7996Ug5m4axD", "height": 98, "imageUrl": "3O2kXQSc58zgZVl4", "smallImageUrl": "gIF7v3qbZu9M3Oxq", "width": 98}], "itemIds": ["nHJzvw7tnYtGfv0E", "JyjBu4EzwRjD7jmQ", "JeFPghqamSc5y0X4"], "itemQty": {"8eT7Mluexk87b9Z5": 57, "LgKOwrSfWhT5B4We": 8, "xRowfNojzPXI2v0p": 35}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"3OEey0MkZwS6TYwN": {"description": "N3UYhic03qGEg5fN", "localExt": {"zBVrjo3g8CfRwtyl": {}, "1HeT7VEPgG40QyXz": {}, "sOzgck078IghoQBp": {}}, "longDescription": "2mWAOYksczxBS0OB", "title": "Ca2vWadLmQtYKmEM"}, "zicbuL2S3RiW8dLT": {"description": "CBfGUdVEdvdQL7sV", "localExt": {"wcZ2PofaJoSqtrEO": {}, "qxH46fRTSZoDdT0f": {}, "efo74eg3Nt2c0r4G": {}}, "longDescription": "qF0NHglOVuNZ9LzN", "title": "eJnBurh54CWbYb0P"}, "ebyt8b4DGscjwriz": {"description": "sFUgYwbaLvqvQ2Nb", "localExt": {"mDITuymTBjn3d2sF": {}, "zMS3QaVjZF7Ax611": {}, "5Kg9U8vrQJXQxoIb": {}}, "longDescription": "Vi2CLEk277Ivjj1A", "title": "647XQ3koaAfZIim0"}}, "lootBoxConfig": {"rewardCount": 37, "rewards": [{"lootBoxItems": [{"count": 64, "duration": 70, "endDate": "1992-01-02T00:00:00Z", "itemId": "m1YN27bojDVaZLpx", "itemSku": "4kEWYkO6KrKUMhJr", "itemType": "ASBh61hmWKSSrF35"}, {"count": 1, "duration": 22, "endDate": "1978-09-12T00:00:00Z", "itemId": "DGvur19V18oIrUKX", "itemSku": "ttgAI2QdWJFLmoPE", "itemType": "gd8EMspOs8nkic9g"}, {"count": 20, "duration": 92, "endDate": "1975-06-25T00:00:00Z", "itemId": "btBJUK5fE3OufPSX", "itemSku": "3PdOU2V9yw94oa8U", "itemType": "J34TIedV3HyoX4Vn"}], "name": "O2LpBU08wfnlHBXF", "odds": 0.5577576410980074, "type": "REWARD", "weight": 53}, {"lootBoxItems": [{"count": 65, "duration": 94, "endDate": "1995-12-20T00:00:00Z", "itemId": "mgUSMM5au8GJT0mk", "itemSku": "VPI6zUtf3QaJPGrT", "itemType": "NcXXTUIggoH89QNm"}, {"count": 72, "duration": 10, "endDate": "1998-04-21T00:00:00Z", "itemId": "7UDb19R6H7r1ta3m", "itemSku": "7jK5pxe82pgFiAS6", "itemType": "piIzmc8rKrKEPGSA"}, {"count": 5, "duration": 90, "endDate": "1978-04-19T00:00:00Z", "itemId": "zfjDZZBmOau6syme", "itemSku": "06c6SKLc2mEC3IXl", "itemType": "5XCbkOfHaGr5kdaz"}], "name": "lypvt6lSLfU7HByG", "odds": 0.7910036559502596, "type": "REWARD_GROUP", "weight": 18}, {"lootBoxItems": [{"count": 80, "duration": 58, "endDate": "1979-07-15T00:00:00Z", "itemId": "4GUOnXpapXQGRakU", "itemSku": "bcG7PcR4eiU3Idi5", "itemType": "5jNrGNT2VHTKuIT5"}, {"count": 64, "duration": 51, "endDate": "1982-12-03T00:00:00Z", "itemId": "wHj0Ur5F2PWGTTD8", "itemSku": "1xhNP4t6kYBUjyXA", "itemType": "n3bWQF6QcAiJpXIr"}, {"count": 14, "duration": 24, "endDate": "1980-04-26T00:00:00Z", "itemId": "xWnsb8oWq94RImNW", "itemSku": "VIJnhhwFDV1Vitao", "itemType": "mvWTzdsW4N70wYS4"}], "name": "Kj7Yi2VvoQNW8Yc4", "odds": 0.9778056853722586, "type": "REWARD", "weight": 7}], "rollFunction": "CUSTOM"}, "maxCount": 12, "maxCountPerUser": 44, "name": "21Lt7JwgwMUSuC3B", "optionBoxConfig": {"boxItems": [{"count": 1, "duration": 10, "endDate": "1976-03-31T00:00:00Z", "itemId": "y3BcEMCtQs2FcEcv", "itemSku": "VAyId6Cp85HVDsZB", "itemType": "QgOnXuXsGThYZrmm"}, {"count": 67, "duration": 45, "endDate": "1995-05-24T00:00:00Z", "itemId": "AvNF0Z0GkwxUNYyN", "itemSku": "wGiKrknH0Y5mrQgL", "itemType": "C6D2qsFiQHglUQMZ"}, {"count": 18, "duration": 84, "endDate": "1975-01-14T00:00:00Z", "itemId": "jMZfOadpgegCUjTd", "itemSku": "i1Ehr8OtqpNJ9R8T", "itemType": "uNy4ejmVA3vMCsGy"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 48, "fixedTrialCycles": 7, "graceDays": 57}, "regionData": {"KYZ0jk0UZdhtnKu9": [{"currencyCode": "oTc8pVkiyGsj5JdX", "currencyNamespace": "zRxfNEjUMTs8WIOb", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1994-10-04T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1993-06-26T00:00:00Z", "expireAt": "1994-05-29T00:00:00Z", "price": 87, "purchaseAt": "1982-04-09T00:00:00Z", "trialPrice": 0}, {"currencyCode": "6uISRX0bKVoWtoUW", "currencyNamespace": "1P7ocuBAldDSUS7H", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1999-06-16T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1978-12-18T00:00:00Z", "expireAt": "1979-01-15T00:00:00Z", "price": 42, "purchaseAt": "1983-04-08T00:00:00Z", "trialPrice": 87}, {"currencyCode": "u2QHLyZNuysyM4Of", "currencyNamespace": "CzdQCXMAWnf87YPN", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1978-09-09T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1972-06-23T00:00:00Z", "expireAt": "1989-02-08T00:00:00Z", "price": 88, "purchaseAt": "1973-07-26T00:00:00Z", "trialPrice": 15}], "R9AX7JjxvNZhM84D": [{"currencyCode": "iZk6ySrB9SVFctW7", "currencyNamespace": "YS0OkL78XeEAtALF", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1982-11-19T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1990-02-28T00:00:00Z", "expireAt": "1988-12-28T00:00:00Z", "price": 21, "purchaseAt": "1983-05-11T00:00:00Z", "trialPrice": 73}, {"currencyCode": "d5A7MYcpBD6lKNb8", "currencyNamespace": "RxvN2u5J7baOeLH1", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1979-07-07T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1978-07-03T00:00:00Z", "expireAt": "1992-11-22T00:00:00Z", "price": 3, "purchaseAt": "1992-11-14T00:00:00Z", "trialPrice": 68}, {"currencyCode": "e1ffYRtIvQaKyevW", "currencyNamespace": "YtZjK6J29v8MpBSp", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1999-02-02T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1989-12-24T00:00:00Z", "expireAt": "1999-04-11T00:00:00Z", "price": 27, "purchaseAt": "1994-10-18T00:00:00Z", "trialPrice": 21}], "cDaiq0nEZ7PyhqFJ": [{"currencyCode": "kDClOsKmfsgJdmzs", "currencyNamespace": "DPsWh1k0cQ08NG6d", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1980-01-03T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1989-03-07T00:00:00Z", "expireAt": "1984-04-05T00:00:00Z", "price": 27, "purchaseAt": "1972-03-30T00:00:00Z", "trialPrice": 90}, {"currencyCode": "wnnGeZsZVgbPzPFb", "currencyNamespace": "rOMZMgWkFN7Tpkx6", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1996-07-13T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1992-05-17T00:00:00Z", "expireAt": "1974-09-17T00:00:00Z", "price": 18, "purchaseAt": "1997-01-07T00:00:00Z", "trialPrice": 96}, {"currencyCode": "RAhzzEWzWlTY70qd", "currencyNamespace": "gJRvpZrSpWX3KEe2", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1975-10-16T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1974-12-27T00:00:00Z", "expireAt": "1971-02-08T00:00:00Z", "price": 51, "purchaseAt": "1985-02-20T00:00:00Z", "trialPrice": 95}]}, "saleConfig": {"currencyCode": "FffjJJxlgjzIhpgO", "price": 30}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "7gYs6unPYQ9jNQN1", "stackable": false, "status": "INACTIVE", "tags": ["qCyK1XH9D6vl5eFd", "i1ldhOh6HvjnYuV7", "NfC4A2ODiZhbfb8Q"], "targetCurrencyCode": "FfgK46GjCWaP8huT", "targetNamespace": "mnq3FGQn3Ahu5wxq", "thumbnailUrl": "6oJq4mChmQHQhO9I", "useCount": 76}' \
    > test.out 2>&1
eval_tap $? 117 'UpdateItem' test.out

#- 118 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'o1nR482D6gNClk9c' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '87hosaPFC5zBW3Zg' \
    > test.out 2>&1
eval_tap $? 118 'DeleteItem' test.out

#- 119 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'VZCj9ObVGT0Scwl4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 22, "orderNo": "m7MKclr5igjNTVIt"}' \
    > test.out 2>&1
eval_tap $? 119 'AcquireItem' test.out

#- 120 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'rH2X78hxJgaVfw5V' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nyq8OzTE89WDNoMc' \
    > test.out 2>&1
eval_tap $? 120 'GetApp' test.out

#- 121 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'OmbfJrCJQIj1haAo' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sKglqaCXE9ytpIO8' \
    --body '{"carousel": [{"alt": "btO3OwNEGSW5TaW4", "previewUrl": "to7QCY2NGGvi9kg3", "thumbnailUrl": "rMIzNmhJTNQjKlwj", "type": "image", "url": "DFjjx6uZerWbtwTX", "videoSource": "generic"}, {"alt": "gNRByjbE8lOLAfTX", "previewUrl": "KLzbrddqcKLa7Lev", "thumbnailUrl": "xNHOSEhQRZIp693l", "type": "video", "url": "3wDwD9RKvQX4yFQF", "videoSource": "generic"}, {"alt": "aQERziPL4dHhOqG5", "previewUrl": "KDdUvk0LEi26Ls7m", "thumbnailUrl": "jRxNmvvNtjJNQepU", "type": "video", "url": "hwlY4lPzlsCR5rVs", "videoSource": "vimeo"}], "developer": "2Sy8Ww79LVeVskqe", "forumUrl": "UB7RSayqGFguhh3b", "genres": ["MassivelyMultiplayer", "Action", "Action"], "localizations": {"VE838c7OydVw0zCq": {"announcement": "oMZvpIOO97DmQ5ZO", "slogan": "zx6iCJTu60IifzMh"}, "kk5PxsjqbCKpMv2Y": {"announcement": "ky9DYkD2sIllFtBt", "slogan": "XJKG3rqBmILhtWm8"}, "RQvRUbUDSiefGEdL": {"announcement": "ucrtO2gCQD057DrD", "slogan": "lgC2nzS9SiGUjVAw"}}, "platformRequirements": {"4v3q6JRHcn7KaoCE": [{"additionals": "kRdo6qHYIZWnXqQ1", "directXVersion": "oHFJ9Q0vqsL9Somq", "diskSpace": "WsGA76yxi0QzZWfm", "graphics": "P2sx0KO5bEJaPnAF", "label": "jsodyJQVVBrShGbI", "osVersion": "IuqK8C403HgoXCR6", "processor": "XOMXwKdfqk8T4QHK", "ram": "30EX0FclpDl5Hsur", "soundCard": "acO5MnjnxD1OXkxS"}, {"additionals": "hFVQTRekLfjmy8zo", "directXVersion": "sRCRgVwbrQKmb01y", "diskSpace": "A7U7dGMjupZkZQY8", "graphics": "CNyT4k3DIbfT22G5", "label": "NpE130YWSgxpKWtd", "osVersion": "tdtVW9anENmxb9e7", "processor": "vXZV3ig8Jg5VByeI", "ram": "3ycMcYYBixKJXCIS", "soundCard": "Qdwec1m8BusV9tUh"}, {"additionals": "74KVo6Xqjz2xUKLN", "directXVersion": "WSmYyVvyelIJ8Qga", "diskSpace": "LMqi836ULa7cfZl4", "graphics": "VuY6rsZyo6CBRRno", "label": "OikIxXKKIR6kPmsw", "osVersion": "m5TCAU1cKApdJDnE", "processor": "73GLmSZns5owBhoU", "ram": "g4LsGP6KLPXkvUv2", "soundCard": "XiXaBzsmaxjTZPlL"}], "itytGka7Kv5TacQK": [{"additionals": "F4OlRGdmXxETLEQr", "directXVersion": "r3KCAV9alq3hK1G4", "diskSpace": "kKooSNNUZuiynZ64", "graphics": "IwncZPk82GF3eTC0", "label": "vzZUDj9dzGgGVxo9", "osVersion": "OHgfHumyfuBNisec", "processor": "YbcOpR45VDlvSc0M", "ram": "r7ImwCwGqOf0bNs9", "soundCard": "7KvKyj3MqS7Dcmtf"}, {"additionals": "h50eObbrmgjhWK0x", "directXVersion": "0ZidAJ1CU1eD1La1", "diskSpace": "6Bw3JbUnUDh5yGjj", "graphics": "v4Mwrv2vancmR6Z7", "label": "rb21A2E9pX0BWCMq", "osVersion": "PsRk5htdM5T3fDSr", "processor": "SHrkoqv2mM6soMaT", "ram": "vQq2a9YdFNtRVSO0", "soundCard": "js0hG9xmSnzd7zgU"}, {"additionals": "xAogcnGkXk17QPkJ", "directXVersion": "HRhmLKQuQVFSKiXl", "diskSpace": "8G2uf6E8EajXLSAS", "graphics": "8MKMaxQ1QyJCpKed", "label": "huzI7G9NCKKXu1bq", "osVersion": "I2M5PmXfKnQ7BYGj", "processor": "CUDMOrbmoRvWnfmG", "ram": "Fy0eUoOBd90h9EDq", "soundCard": "STOfoNewWjwMWDKE"}], "t6JhbJ0fwTDaq6b5": [{"additionals": "RpMwhWPtndriXU9l", "directXVersion": "oOxpmEuwDVc12r0D", "diskSpace": "VUGgGHkapTCafFMd", "graphics": "vYiCBuzUUwyI6Vtd", "label": "4v9k4fv3kMiuQ3Dh", "osVersion": "sKLxjt5srPFxBgpF", "processor": "tDBmTLH9kP9U53z6", "ram": "joBAhAlJGI2YYb6a", "soundCard": "jBjgq6eY4PBNHKPx"}, {"additionals": "62tHxDb06ZFy3ugl", "directXVersion": "Sp2UxvF2uLXWilRD", "diskSpace": "7HD6LCgdFxRGj00R", "graphics": "T6LvcnGMJbJIYLss", "label": "Mvy9gkfTMRrXVRcA", "osVersion": "VRDX6gmDfNfPGYYS", "processor": "TunMgt3C8hEguCql", "ram": "MHiQN3HWJw9zIWsi", "soundCard": "P2JQ24meDrwEuTyM"}, {"additionals": "2qohglzO8AEl6A9s", "directXVersion": "h2x2ur2ccp7R7OqP", "diskSpace": "qIjS4i0N9ytb3c8p", "graphics": "VZ8GlU8962e6gtn5", "label": "pUARJM1T8QwMNOAz", "osVersion": "XmyHEV4g9P6a280S", "processor": "5RNB5dVCsB7xL4ax", "ram": "SPgPCiwLxCFLDixZ", "soundCard": "wVtt3RVTl0tR00oQ"}]}, "platforms": ["Android", "Android", "IOS"], "players": ["Multi", "MMO", "Coop"], "primaryGenre": "Strategy", "publisher": "GGK3x76U1EIckltt", "releaseDate": "1977-12-05T00:00:00Z", "websiteUrl": "rpgF5szl0sMY8es3"}' \
    > test.out 2>&1
eval_tap $? 121 'UpdateApp' test.out

#- 122 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '6r1FgR70eNLHkVrE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Fd8xArWJuCAIfNBS' \
    > test.out 2>&1
eval_tap $? 122 'DisableItem' test.out

#- 123 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'HgpFNw9K9pmAIc6V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'GetItemDynamicData' test.out

#- 124 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'SfE9nbE2PMv12ZSR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JkujxbCu1HFaj6Vx' \
    > test.out 2>&1
eval_tap $? 124 'EnableItem' test.out

#- 125 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 's3GuA4S1dS7H7yIS' \
    --itemId '7b5TSDRIoMg7Dc5A' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PzfzXDELJFaIaEMW' \
    > test.out 2>&1
eval_tap $? 125 'FeatureItem' test.out

#- 126 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '5bhJyL72WDyhBsCC' \
    --itemId 'bnfihnXKxGxaupnT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tq9ihZkvFKfSHQh8' \
    > test.out 2>&1
eval_tap $? 126 'DefeatureItem' test.out

#- 127 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'I9xk3sFl0cbuCRM6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '9XKkLwioRaKnWhlh' \
    --populateBundle  \
    --region '80BhYe2fJDS6T75Q' \
    --storeId '4ulonMFjmYqE1wJh' \
    > test.out 2>&1
eval_tap $? 127 'GetLocaleItem' test.out

#- 128 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'fogWg2Apm0sUy18a' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Wn65Co0vdCk8so6J' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 66, "comparison": "isLessThanOrEqual", "name": "DK46Eehx7xasqMY9", "predicateType": "EntitlementPredicate", "value": "dN2tmGuX6r0gBVUU", "values": ["CWbs5qugklBUS6uw", "eKKlPKtE6gnYxmkm", "WrCQt86Jrg8tLAJW"]}, {"anyOf": 32, "comparison": "includes", "name": "cyNkUvqn6eXr6FNb", "predicateType": "SeasonTierPredicate", "value": "X1xsth28NZZgsXyc", "values": ["oWiywnxuDLLuIaSx", "uQNGIDeHlf6IcX1K", "9JrK6Or2xx7rLwrP"]}, {"anyOf": 30, "comparison": "is", "name": "oID2UqO0iAXA9dB4", "predicateType": "EntitlementPredicate", "value": "wosKhDlLfTKxpVOX", "values": ["FB0sL2xt6fX9j7rh", "ZCAlDlVKBsLZiBRX", "vGSrdkqddI3ezqu6"]}]}, {"operator": "or", "predicates": [{"anyOf": 53, "comparison": "isGreaterThanOrEqual", "name": "E7CL1cQCSoqHvH7g", "predicateType": "SeasonPassPredicate", "value": "3cOx6yrIw37pKOLr", "values": ["TQO7KLdZDGwqx7T3", "F5i3gr3Cc4M2O7Nr", "l1ut2oyolliYsTJU"]}, {"anyOf": 26, "comparison": "isGreaterThan", "name": "wdRMraDLrwh3d0yk", "predicateType": "SeasonTierPredicate", "value": "tprnacA34xmIOjFL", "values": ["gKR4LjEWhOScvtQ9", "2iD02YMvEUNfoL7J", "CcMo7GxxXdbYCRex"]}, {"anyOf": 86, "comparison": "isNot", "name": "ekTsQxMTfaSot7ao", "predicateType": "EntitlementPredicate", "value": "aqZ2yfrC1V7ZpJZP", "values": ["lNlBORlC8ZkjsxYt", "SQUdKr6vgqkjycqc", "HCMqvcYmeDLYEzs2"]}]}, {"operator": "and", "predicates": [{"anyOf": 48, "comparison": "isGreaterThan", "name": "c5TETHcup8GG0VCM", "predicateType": "SeasonTierPredicate", "value": "w7UsyHq4bBb0n1Jh", "values": ["JdKMexeJc7NvgTSg", "KjCxZjKf8NA4cGUa", "PUS8BRPGV9n769zL"]}, {"anyOf": 61, "comparison": "isLessThanOrEqual", "name": "fy9XnH2r0EKrk5Vl", "predicateType": "EntitlementPredicate", "value": "hAiAItnWUmD225fp", "values": ["riclNNqLyrlzrJ4Q", "1egsx3ErheNwqd5p", "HbfnAdtkujxHff7n"]}, {"anyOf": 51, "comparison": "isGreaterThan", "name": "aNCcjgFhS0URBhl0", "predicateType": "SeasonTierPredicate", "value": "pOqUQxzqJZiWi3KQ", "values": ["o5oHzqY3DgykA8zB", "qmd87ir9op4YfGTn", "ffT5Tn61A1xW6okI"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 128 'UpdateItemPurchaseCondition' test.out

#- 129 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'JX0rkOHUkY5aSlqh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "YoSXbn6l5xAzc1nc"}' \
    > test.out 2>&1
eval_tap $? 129 'ReturnItem' test.out

#- 130 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --name 'Af5JSwjw2fE2g6jX' \
    --offset '97' \
    --tag '5mh6Rum5pbgEt39u' \
    > test.out 2>&1
eval_tap $? 130 'QueryKeyGroups' test.out

#- 131 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "JQpgEtchTe3nt7t9", "name": "ztprSfW9OutADrNG", "status": "INACTIVE", "tags": ["OuJ0ypkkt2G4eFh2", "YNsdoxpLTBM9Q8t8", "29Ido1JyveSRiBq2"]}' \
    > test.out 2>&1
eval_tap $? 131 'CreateKeyGroup' test.out

#- 132 GetKeyGroupByBoothName
eval_tap 0 132 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 133 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '3kyH9jQbHWkcVk0X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'GetKeyGroup' test.out

#- 134 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '28GS54vl7gIKBc7O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "YTylFRAJKySnC0cf", "name": "Pl3Z2zSBbs4PAV72", "status": "INACTIVE", "tags": ["jeO2zMDSy4kyqyKg", "rtEPdXXlt8geCdiX", "u3iNvn7vLZ7h6alh"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateKeyGroup' test.out

#- 135 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'JNGZF07lsPP5OfHb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetKeyGroupDynamic' test.out

#- 136 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'XzWnVO2U4uyzZo1r' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '52' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 136 'ListKeys' test.out

#- 137 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'ZrLQjk4VoYfIksth' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 137 'UploadKeys' test.out

#- 138 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '24cZBpdDFfvzeU5i' \
    --limit '34' \
    --offset '25' \
    --orderNos 'hx6zv7EURTNIoG1D,BdoKH6sREmmfwUZL,ZZS7snx0Q2Gd8m7Y' \
    --sortBy '3wiNloJfey3HXL6S' \
    --startTime 'jljNPTXA3qbg55Sy' \
    --status 'CHARGED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 138 'QueryOrders' test.out

#- 139 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'GetOrderStatistics' test.out

#- 140 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kBtXMU6KRIm5xBoI' \
    > test.out 2>&1
eval_tap $? 140 'GetOrder' test.out

#- 141 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'i99ctgFXasxp5h78' \
    --body '{"description": "0ktjQw2yXzaQWaF2"}' \
    > test.out 2>&1
eval_tap $? 141 'RefundOrder' test.out

#- 142 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetPaymentCallbackConfig' test.out

#- 143 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "wCkhOQ161TFjROYJ", "privateKey": "m75VIuCOCkt2W1Df"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdatePaymentCallbackConfig' test.out

#- 144 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'I8QtgODk9K6DcMny' \
    --externalId 'CPn1FylWdaNV1VaZ' \
    --limit '93' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'pbcv3IwmL7a1K3zI' \
    --offset '96' \
    --paymentOrderNo 'Eo5M80LLbku9GYH4' \
    --startDate 'ijqOVM50tCqkZfsS' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 144 'QueryPaymentNotifications' test.out

#- 145 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'AbDJ7sHCLup8pmEo' \
    --limit '37' \
    --offset '84' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 145 'QueryPaymentOrders' test.out

#- 146 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "DWGOLMmCZUeelXYy", "currencyNamespace": "NrXweiCnDldRPRfd", "customParameters": {"6mLZ0GTJwEjoZrRt": {}, "aeWKMC8wsOByQAMA": {}, "gqFEzEt8umj5XhKn": {}}, "description": "w7MHDwFVKUC2ecnp", "extOrderNo": "UDqvLQixPKVSmWa8", "extUserId": "TGko16XTqHc0cM7i", "itemType": "INGAMEITEM", "language": "Rku_pXoP-BG", "metadata": {"Mn0Oia336uiiMTAd": "uctvUfVwLahtRedh", "1SiZlOpIQ8GL7jBF": "1R5OexAPzCG6ZKQC", "lGc1636nbfM3J9G4": "0Y62bCo941ALznQu"}, "notifyUrl": "HVskfCjUK8GeX4Q0", "omitNotification": true, "platform": "JYj4IqWK09l4wkrz", "price": 1, "recurringPaymentOrderNo": "iz7yrIvQj2isN7bR", "region": "wcr16lW5YwgZpjlM", "returnUrl": "MtPWg8217m7qNkQi", "sandbox": true, "sku": "p2oac8QTNEuBbeuQ", "subscriptionId": "qm9wM7mgTtUdPVcQ", "targetNamespace": "ijMBhs0kDP6d3nuU", "targetUserId": "Z41mSeS9SnGqhJOv", "title": "ykBcDpzD9zh6dtPK"}' \
    > test.out 2>&1
eval_tap $? 146 'CreatePaymentOrderByDedicated' test.out

#- 147 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '4fVHLMvrCsH3RYxH' \
    > test.out 2>&1
eval_tap $? 147 'ListExtOrderNoByExtTxId' test.out

#- 148 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2Up9VthPjFrK7Hip' \
    > test.out 2>&1
eval_tap $? 148 'GetPaymentOrder' test.out

#- 149 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0eONFDgUPShG8wwF' \
    --body '{"extTxId": "KY9AMpcwJd4SrigI", "paymentMethod": "xAhbFMZfxaznlDQb", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 149 'ChargePaymentOrder' test.out

#- 150 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'EvFzox9wHocX3DRW' \
    --body '{"description": "obEoGr8W97KBedcr"}' \
    > test.out 2>&1
eval_tap $? 150 'RefundPaymentOrderByDedicated' test.out

#- 151 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6PM51z7i0wQ9egK2' \
    --body '{"amount": 39, "currencyCode": "NEJYPKxxOw7xNQ98", "notifyType": "REFUND", "paymentProvider": "XSOLLA", "salesTax": 81, "vat": 2}' \
    > test.out 2>&1
eval_tap $? 151 'SimulatePaymentOrderNotification' test.out

#- 152 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3nhkn6QIesNoYqvV' \
    > test.out 2>&1
eval_tap $? 152 'GetPaymentOrderChargeStatus' test.out

#- 153 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 153 'GetPlatformWalletConfig' test.out

#- 154 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Epic", "IOS", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdatePlatformWalletConfig' test.out

#- 155 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 155 'ResetPlatformWalletConfig' test.out

#- 156 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetRevocationConfig' test.out

#- 157 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateRevocationConfig' test.out

#- 158 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'DeleteRevocationConfig' test.out

#- 159 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'KVjOn6rtILNJVv2D' \
    --limit '76' \
    --offset '25' \
    --source 'OTHER' \
    --startTime 'AZSRkuw6q8FgqG46' \
    --status 'FAIL' \
    --transactionId 'sFK7eYlSU3vYcHZZ' \
    --userId 'jFegVnZOn0tk4IAT' \
    > test.out 2>&1
eval_tap $? 159 'QueryRevocationHistories' test.out

#- 160 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'GetRevocationPluginConfig' test.out

#- 161 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "SIefcqNEn4IZ0Dv6"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "sESaBOTHnbX9tC9P"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 161 'UpdateRevocationPluginConfig' test.out

#- 162 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'DeleteRevocationPluginConfig' test.out

#- 163 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadRevocationPluginConfigCert' test.out

#- 164 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "jvW0Qp3kTyL4CsLw", "eventTopic": "iWUMcpxn4B6XoTNM", "maxAwarded": 42, "maxAwardedPerUser": 21, "namespaceExpression": "qZTHwo1IAJQpb6r8", "rewardCode": "ZeaSHwQuiH3Ozu4G", "rewardConditions": [{"condition": "6bXxp0gYZyF9fJBJ", "conditionName": "kSOrF9Dg4FcDwBGy", "eventName": "BiHewZkwEeuzBBRS", "rewardItems": [{"duration": 21, "endDate": "1977-01-03T00:00:00Z", "itemId": "xyWkZObuvig8sMus", "quantity": 37}, {"duration": 74, "endDate": "1979-02-03T00:00:00Z", "itemId": "kMiopQrVL3ZZTVxq", "quantity": 0}, {"duration": 79, "endDate": "1999-09-25T00:00:00Z", "itemId": "gY14iWk12Jffk8dw", "quantity": 74}]}, {"condition": "QNHrjaboGomguUqe", "conditionName": "uZh5qtrRbNnGejdT", "eventName": "GvZgN5hshSe5YmZX", "rewardItems": [{"duration": 76, "endDate": "1980-09-05T00:00:00Z", "itemId": "8d3o7cTS9OIIMErn", "quantity": 80}, {"duration": 93, "endDate": "1998-10-31T00:00:00Z", "itemId": "TqGf0OyqJ9ibJMmR", "quantity": 12}, {"duration": 76, "endDate": "1978-07-20T00:00:00Z", "itemId": "xNwp1lGkYoq8HP1T", "quantity": 79}]}, {"condition": "dh7okHl1wMht2Izq", "conditionName": "7TCUJhDsDefAS09V", "eventName": "yQB1vR1mx6K17GL1", "rewardItems": [{"duration": 59, "endDate": "1980-06-01T00:00:00Z", "itemId": "O4ZuoGZSxTzm8oMS", "quantity": 86}, {"duration": 70, "endDate": "1972-10-08T00:00:00Z", "itemId": "WdVH9bww15zZsaYr", "quantity": 73}, {"duration": 18, "endDate": "1984-08-11T00:00:00Z", "itemId": "e5Kd5QB96ndlO6iP", "quantity": 66}]}], "userIdExpression": "AyZKhqilty9NVlgx"}' \
    > test.out 2>&1
eval_tap $? 164 'CreateReward' test.out

#- 165 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'UmnfdOAmu1dX1NqD' \
    --limit '86' \
    --offset '27' \
    --sortBy 'namespace:asc,rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 165 'QueryRewards' test.out

#- 166 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 166 'ExportRewards' test.out

#- 167 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 167 'ImportRewards' test.out

#- 168 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vvYeJZw6QZFN7wFC' \
    > test.out 2>&1
eval_tap $? 168 'GetReward' test.out

#- 169 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'nqpvNesGiVnt9p2t' \
    --body '{"description": "o7Yja1soDE1K0SvG", "eventTopic": "rMYwPmPXC2LfL2m5", "maxAwarded": 35, "maxAwardedPerUser": 100, "namespaceExpression": "P2A20t6foPPH94SU", "rewardCode": "inY5diUlqgvY7dPP", "rewardConditions": [{"condition": "yahppgxJhk4EdTZ0", "conditionName": "00rS92594HLvWFsX", "eventName": "HtMP0k9L5dREQbCq", "rewardItems": [{"duration": 11, "endDate": "1978-02-28T00:00:00Z", "itemId": "ssgJJC3CX0hpB1ZG", "quantity": 78}, {"duration": 89, "endDate": "1991-07-23T00:00:00Z", "itemId": "o5DSozCuFsrBMtoO", "quantity": 10}, {"duration": 4, "endDate": "1990-06-24T00:00:00Z", "itemId": "fMCYxSeeJOlxa395", "quantity": 35}]}, {"condition": "01kyaFwwD7wecuQb", "conditionName": "4GNQHVZMKGBnzh4s", "eventName": "uaGIzttTncVBf5g3", "rewardItems": [{"duration": 29, "endDate": "1973-09-27T00:00:00Z", "itemId": "uHiNyLkfPQPmjUkv", "quantity": 92}, {"duration": 64, "endDate": "1980-11-07T00:00:00Z", "itemId": "5YmIejozmG5HlrIf", "quantity": 79}, {"duration": 42, "endDate": "1984-06-28T00:00:00Z", "itemId": "5phhU315LUC6HSMQ", "quantity": 72}]}, {"condition": "2UznXNd6ve29lqqt", "conditionName": "cLJW9eTJvKNDFrx6", "eventName": "LabyDnqXjXKPIcxh", "rewardItems": [{"duration": 49, "endDate": "1994-05-21T00:00:00Z", "itemId": "RQGnnW4ugGX6mKBb", "quantity": 13}, {"duration": 7, "endDate": "1994-02-07T00:00:00Z", "itemId": "D9xL07ZzzIs3Jke3", "quantity": 91}, {"duration": 68, "endDate": "1984-07-07T00:00:00Z", "itemId": "uLP897ooMLnemwKA", "quantity": 43}]}], "userIdExpression": "l7sg7IfMH5Tu1ky1"}' \
    > test.out 2>&1
eval_tap $? 169 'UpdateReward' test.out

#- 170 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZYvyeHmfoFkUDP86' \
    > test.out 2>&1
eval_tap $? 170 'DeleteReward' test.out

#- 171 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4shbnQ3bVvuvpsDJ' \
    --body '{"payload": {"XPCWkX4Kpi8CJ88a": {}, "MPGFFAQZbfbmVTEb": {}, "iRq5Juikmpat75rV": {}}}' \
    > test.out 2>&1
eval_tap $? 171 'CheckEventCondition' test.out

#- 172 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'bN9ZBtzJ33tCwv8H' \
    --body '{"conditionName": "1f451FVZ630HNBYZ", "userId": "Srz7pMjESLLMPKDX"}' \
    > test.out 2>&1
eval_tap $? 172 'DeleteRewardConditionRecord' test.out

#- 173 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'Lki6Oz5Bygt8Q0Rj' \
    --limit '92' \
    --offset '7' \
    --start 'f1srB7hGwGbUmQmJ' \
    --storeId 'HNffZENs9X0hFMdz' \
    --viewId 'ryvhc1YjHmmulSBI' \
    > test.out 2>&1
eval_tap $? 173 'QuerySections' test.out

#- 174 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Elc2CdRvBb0aGnMt' \
    --body '{"active": false, "displayOrder": 95, "endDate": "1971-10-11T00:00:00Z", "ext": {"WHb5sbX6asrjV7XJ": {}, "UOtHlzXNHEPpzlMl": {}, "x7b2H2THLwZGikW7": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 55, "itemCount": 0, "rule": "SEQUENCE"}, "items": [{"id": "gE6SrYKq6lcVOhPJ", "sku": "IcEHbiKHW7flVolA"}, {"id": "WEMmQSPDTRqjlvwn", "sku": "nCA5tfK5ushaKTPV"}, {"id": "jyOUpR3uUdgNlyU4", "sku": "IJnqtrjCOsE8Vjvz"}], "localizations": {"hJwNX4bhqCjlwrms": {"description": "SRV86iic1FIMyF7C", "localExt": {"cNu2DYn6E9Gk51kO": {}, "TJZluTekDMCGUJvE": {}, "RxNg8djSb4Vt2vKQ": {}}, "longDescription": "5vlCdI519Pf2iogw", "title": "xM5DZM0dgozmco41"}, "750xdYQg34WUV0Wp": {"description": "msQnp1n4YGumTKOl", "localExt": {"DOy5vhSkxERZ2AQ1": {}, "jvXYBar5RMmmGdWl": {}, "0wpj5tVfKU3D8WVP": {}}, "longDescription": "h0Z7YiGE2cyzTMBY", "title": "7Xd0OoENg2Lw7uep"}, "mahXojVZYz2zMU9j": {"description": "LzNV3GaG43R6nlRP", "localExt": {"rEAYqRBeSc5uShoj": {}, "3dGHMeoi5DBOsQ0G": {}, "ax0iX05IT9Agsjl5": {}}, "longDescription": "NmnSHhxNmCe4txY0", "title": "MsPc9EMgf9JCJiEv"}}, "name": "hL8ZfwCVJW9yspUO", "rotationType": "FIXED_PERIOD", "startDate": "1978-09-30T00:00:00Z", "viewId": "cp400RZe8Bzx9aGE"}' \
    > test.out 2>&1
eval_tap $? 174 'CreateSection' test.out

#- 175 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I22BTCZs97TJI8GP' \
    > test.out 2>&1
eval_tap $? 175 'PurgeExpiredSection' test.out

#- 176 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'rM24F3celFgM62HQ' \
    --storeId 'tgzQhO3nR8j8DlP6' \
    > test.out 2>&1
eval_tap $? 176 'GetSection' test.out

#- 177 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'OGbn8vmfMYGLt1Aj' \
    --storeId 'Khh3JMX7xSrz1EH6' \
    --body '{"active": true, "displayOrder": 79, "endDate": "1997-10-24T00:00:00Z", "ext": {"xzsNrJzWBcdFlo7o": {}, "AsOlfLB1J19b5rTf": {}, "iL2P3r1a8KIJH33a": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 85, "itemCount": 42, "rule": "SEQUENCE"}, "items": [{"id": "WD59MgTy1HA58Jt5", "sku": "NaROjSKFEuZo2ElX"}, {"id": "YSS4ezBRSiOyRevi", "sku": "DaxlPdhwmcH03yoM"}, {"id": "xzRR6xd9rTh3urea", "sku": "IbxM3Wev9pZQjWAN"}], "localizations": {"0tny16ZHZtuSJGQC": {"description": "rM7JEMRPkdTcAzkI", "localExt": {"lndN5xeayr3vUKMu": {}, "Iiz2MiAAKcvAXnxn": {}, "H0QIhoJRY807VmBT": {}}, "longDescription": "4wZXQZZrSsuYiIPe", "title": "i0pXglJYnKkoCAZu"}, "olAWnxkImVbDP0QX": {"description": "31gI7VmnGIRMvXe6", "localExt": {"BiphIFe2bzr6qQw6": {}, "fSESkM19OPMBb12g": {}, "pmShlmIt2nfhUaZG": {}}, "longDescription": "qjslu59GT2E6Aacm", "title": "ZRXZm626POXWVj3K"}, "P1mX0iYHXBU3Uk2t": {"description": "Qm307IORTyHnLYDA", "localExt": {"Ag1YA4kZURmoGgxV": {}, "RMPf8g1rbhfIMStM": {}, "nSqrKWYOuITlYS2R": {}}, "longDescription": "YaD9WNKGhbLhjz1v", "title": "0RBIO2rkJGmPaK6H"}}, "name": "EVIQJd3930TGewjR", "rotationType": "FIXED_PERIOD", "startDate": "1991-02-15T00:00:00Z", "viewId": "9XSjap24esyjh6Wc"}' \
    > test.out 2>&1
eval_tap $? 177 'UpdateSection' test.out

#- 178 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '3migf2n6iQyr5cb5' \
    --storeId 'YL6fwBiaVPmmn0T5' \
    > test.out 2>&1
eval_tap $? 178 'DeleteSection' test.out

#- 179 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'ListStores' test.out

#- 180 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "uzlmi2NY26xrkPPd", "defaultRegion": "g3pXjmtpNfCrIj9n", "description": "tYo3dupUHNu8abrV", "supportedLanguages": ["VOKxr9Pa315FKDjG", "2ApSV94Jy6yCSXBq", "JqjAbVwSaoj1ugjr"], "supportedRegions": ["8mPkr3tZ506ERSVy", "5M3rrkxu0U9h9gCN", "VZxHGxhZqNXJ6JXS"], "title": "h0Z3SWISs1dYrJKm"}' \
    > test.out 2>&1
eval_tap $? 180 'CreateStore' test.out

#- 181 ImportStore
eval_tap 0 181 'ImportStore # SKIP deprecated' test.out

#- 182 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'GetPublishedStore' test.out

#- 183 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 183 'DeletePublishedStore' test.out

#- 184 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'GetPublishedStoreBackup' test.out

#- 185 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 185 'RollbackPublishedStore' test.out

#- 186 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x1BT6iLFQejNZJNF' \
    > test.out 2>&1
eval_tap $? 186 'GetStore' test.out

#- 187 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '2hm0TqBQprHn3whP' \
    --body '{"defaultLanguage": "KU5abnqw8fFa30pV", "defaultRegion": "bhr1BHh1arZAyuLc", "description": "ZoEkPpqKhP2jWnRT", "supportedLanguages": ["glw0gdWoE4esuiDr", "quccz4J6fFQezJ5E", "3iYHIknvPcJkjRev"], "supportedRegions": ["VYfiExpAgoK9YDq1", "x3dkbJFDEBEOOvJ5", "BKeipIldsgB4hOxb"], "title": "88WgKSLIpneDQCfw"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateStore' test.out

#- 188 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ucHRL3o2NstrL6Ts' \
    > test.out 2>&1
eval_tap $? 188 'DeleteStore' test.out

#- 189 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JeRcE7GuwKn63KID' \
    --action 'UPDATE' \
    --itemSku 'jzknv2HZMIL2P2bh' \
    --itemType 'OPTIONBOX' \
    --limit '78' \
    --offset '60' \
    --selected  \
    --sortBy 'createdAt:asc,createdAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'aFiufH2YR6QU7fj6' \
    --updatedAtStart 'w17arNs12hOoLVM7' \
    > test.out 2>&1
eval_tap $? 189 'QueryChanges' test.out

#- 190 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UFnuJDzeEkDxaVog' \
    > test.out 2>&1
eval_tap $? 190 'PublishAll' test.out

#- 191 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xHrOon2OW4Zw5QwV' \
    > test.out 2>&1
eval_tap $? 191 'PublishSelected' test.out

#- 192 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KWNy2tnF2MifJR4h' \
    > test.out 2>&1
eval_tap $? 192 'SelectAllRecords' test.out

#- 193 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'r4gdJDujYnVnFK6g' \
    --action 'DELETE' \
    --itemSku '2tod2BGBXjNyRCtP' \
    --itemType 'SUBSCRIPTION' \
    --type 'SECTION' \
    --updatedAtEnd 'GmROIqxqQ0gcNeTf' \
    --updatedAtStart 'lyvUh3w5ZtfwmOCK' \
    > test.out 2>&1
eval_tap $? 193 'GetStatistic' test.out

#- 194 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pFSMF0tfGIZCTNiI' \
    > test.out 2>&1
eval_tap $? 194 'UnselectAllRecords' test.out

#- 195 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Rc9fEjkZhEpAJMCx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Mp2J0hDg2kMgkvho' \
    > test.out 2>&1
eval_tap $? 195 'SelectRecord' test.out

#- 196 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'Qe9gD9tGN0nE7M36' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mI9u3EeZtLQij2JX' \
    > test.out 2>&1
eval_tap $? 196 'UnselectRecord' test.out

#- 197 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sqdXfhZTTaCeqGv7' \
    --targetStoreId 'meuQhJuq1C6JHkWM' \
    > test.out 2>&1
eval_tap $? 197 'CloneStore' test.out

#- 198 ExportStore
eval_tap 0 198 'ExportStore # SKIP deprecated' test.out

#- 199 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'UbqByWN2BCnRz9w2' \
    --limit '27' \
    --offset '56' \
    --sku 'ur0B9jKaunAcylsa' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    --userId '7wRQmL4i3eRyIECE' \
    > test.out 2>&1
eval_tap $? 199 'QuerySubscriptions' test.out

#- 200 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Da1I4lwXqwPfq3Vz' \
    > test.out 2>&1
eval_tap $? 200 'RecurringChargeSubscription' test.out

#- 201 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'HQjtolx64w1gyvja' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 201 'GetTicketDynamic' test.out

#- 202 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'cKtGqxMnoAXRlcq0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "mYWKQYlqMmu2pvF6"}' \
    > test.out 2>&1
eval_tap $? 202 'DecreaseTicketSale' test.out

#- 203 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'rP03bQaq1cT88H6R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'GetTicketBoothID' test.out

#- 204 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'CW8gJmGzDlqxtLsR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 18, "orderNo": "AGOiPhNt2IdH8aYY"}' \
    > test.out 2>&1
eval_tap $? 204 'IncreaseTicketSale' test.out

#- 205 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'UT6mma833TDzk66i' \
    --body '{"achievements": [{"id": "x88sAUrXr7MXxCvy", "value": 51}, {"id": "04MtMhKHmSjqPuQZ", "value": 63}, {"id": "5KjdNrEwfWo2Mwul", "value": 77}], "steamUserId": "lrwXmIGamRCARuFL"}' \
    > test.out 2>&1
eval_tap $? 205 'UnlockSteamUserAchievement' test.out

#- 206 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4rV4CXVMrDYKe2e' \
    --xboxUserId 'Tf1axo16GqT2vSLL' \
    > test.out 2>&1
eval_tap $? 206 'GetXblUserAchievements' test.out

#- 207 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'iMvcu39YZJypWzpN' \
    --body '{"achievements": [{"id": "XgnoKIz8O8NglJtZ", "percentComplete": 93}, {"id": "bl1g5ZmTTGYRbP4Q", "percentComplete": 97}, {"id": "AgyZJ16MMd2bzOrT", "percentComplete": 28}], "serviceConfigId": "w01i5Mf7WvbNSeeD", "titleId": "NfUESLlwHv3JgteO", "xboxUserId": "LyKp8a1VqxXnRhDd"}' \
    > test.out 2>&1
eval_tap $? 207 'UpdateXblUserAchievement' test.out

#- 208 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '9TGkO6aIYqftw1Sr' \
    > test.out 2>&1
eval_tap $? 208 'AnonymizeCampaign' test.out

#- 209 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'M2nhSEanfUYrMU6A' \
    > test.out 2>&1
eval_tap $? 209 'AnonymizeEntitlement' test.out

#- 210 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '43UKGpvC1cr5T1PS' \
    > test.out 2>&1
eval_tap $? 210 'AnonymizeFulfillment' test.out

#- 211 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'XhduTWchzXDv3TAt' \
    > test.out 2>&1
eval_tap $? 211 'AnonymizeIntegration' test.out

#- 212 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjP4HSuiYCbG0UyY' \
    > test.out 2>&1
eval_tap $? 212 'AnonymizeOrder' test.out

#- 213 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJmNL8p6AbdtU0CD' \
    > test.out 2>&1
eval_tap $? 213 'AnonymizePayment' test.out

#- 214 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'rlQpKB8qoel2QK3a' \
    > test.out 2>&1
eval_tap $? 214 'AnonymizeRevocation' test.out

#- 215 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'SOYdmMDikc3Fjm9H' \
    > test.out 2>&1
eval_tap $? 215 'AnonymizeSubscription' test.out

#- 216 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQDemtiQvURYZCeF' \
    > test.out 2>&1
eval_tap $? 216 'AnonymizeWallet' test.out

#- 217 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '30RT9rBgM8o7lxXq' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 217 'GetUserDLCByPlatform' test.out

#- 218 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'TkdM7FVDCBcvVegr' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 218 'GetUserDLC' test.out

#- 219 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ddP8lLQo6tHj4z4c' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'M4LMJfWNZIxAgBpe' \
    --features 'ubprKX68jTyRd3Lr,R1x6U1v6zSLjm9zm,zUW0vPj90jmLTt5Y' \
    --itemId 'QGawcomPoiYoQ1f1,AYq306Pysv4VPaZW,olXypwucUqqqff2i' \
    --limit '100' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 219 'QueryUserEntitlements' test.out

#- 220 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'i4yP3uqNcig6YcDA' \
    --body '[{"endDate": "1971-03-08T00:00:00Z", "grantedCode": "3g62oGYwkrjLI4EH", "itemId": "JEEWgki9fbdvUMDZ", "itemNamespace": "eO4U55wdCpVpnENi", "language": "lCWo-uqxX", "quantity": 24, "region": "RBElD4K2Cy1tJcPA", "source": "REFERRAL_BONUS", "startDate": "1976-08-26T00:00:00Z", "storeId": "OvY7apPCrN5bEhmu"}, {"endDate": "1988-07-11T00:00:00Z", "grantedCode": "gKeWizEpw1zN0mOY", "itemId": "gGhHMz9dddLWJWDu", "itemNamespace": "SYtCaIv4Lp91wYUJ", "language": "sBZW_Nn", "quantity": 8, "region": "DAaUXSuBQdvdhJoT", "source": "REWARD", "startDate": "1999-04-13T00:00:00Z", "storeId": "N09VIbbsz24fQKDZ"}, {"endDate": "1996-01-03T00:00:00Z", "grantedCode": "6plErw0Gb0ceCbph", "itemId": "W4YMhJ0S50bez9ZL", "itemNamespace": "HW882riiPfRQ3rJ0", "language": "tM-yKWF", "quantity": 81, "region": "Rn83B0nrW1qx3NJT", "source": "PURCHASE", "startDate": "1983-02-23T00:00:00Z", "storeId": "kzjYDw6mLBordrJk"}]' \
    > test.out 2>&1
eval_tap $? 220 'GrantUserEntitlement' test.out

#- 221 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'D6vy60uRMT1Xw9K9' \
    --activeOnly  \
    --appId 'Yb68a8ygYx2Tqkhl' \
    > test.out 2>&1
eval_tap $? 221 'GetUserAppEntitlementByAppId' test.out

#- 222 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMnE9Wj90EQzOidr' \
    --activeOnly  \
    --limit '99' \
    --offset '49' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserEntitlementsByAppType' test.out

#- 223 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 't4XTNwpp0ni1YfIg' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --itemId 'ZND0wgYOilX1e182' \
    > test.out 2>&1
eval_tap $? 223 'GetUserEntitlementByItemId' test.out

#- 224 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '5iasunESjcgr2drX' \
    --ids 'G5NkKCySLA8cKCs0,dFYRSa2OULZ0iOZJ,iOAh1SpLhMF2Pav1' \
    > test.out 2>&1
eval_tap $? 224 'GetUserActiveEntitlementsByItemIds' test.out

#- 225 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '1FuU8iXCRz8Kgqgw' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku '2iaIBpYC4txul6VK' \
    > test.out 2>&1
eval_tap $? 225 'GetUserEntitlementBySku' test.out

#- 226 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YlNYYlHPwKDpJmke' \
    --appIds 'oAkp3Z4pgyJYwclb,4gd4QgQut2hiPuDd,OPHcN9drwqytieXp' \
    --itemIds 'IZfr5XDq9dGLHjtg,E2bTXJxCCFqPNDqW,rpkWnnova15WVuE5' \
    --skus 'cYVP9tQSa27BnPyq,3I1BLtGEZDRNkk4D,JUofJXK8RGS0zCYR' \
    > test.out 2>&1
eval_tap $? 226 'ExistsAnyUserActiveEntitlement' test.out

#- 227 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VmbfzwUmsy0stUmK' \
    --itemIds 'dXiiTObNdqkWa13g,3pgHx6uPf6jQZcYe,rH933X7iXEEM2KOu' \
    > test.out 2>&1
eval_tap $? 227 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 228 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNEHcI95GGdJvucD' \
    --appId 'bs6UdccuM2ykRj3W' \
    > test.out 2>&1
eval_tap $? 228 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 229 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nyAaUaQBKFedL2ud' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'NHgfgwZwVMvshGms' \
    > test.out 2>&1
eval_tap $? 229 'GetUserEntitlementOwnershipByItemId' test.out

#- 230 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6ZJYnkHDnHTlRug' \
    --ids 'M7a2UZgeesipbP02,7okM5E8tAajVSvLR,j306RDuaSixXEdlo' \
    > test.out 2>&1
eval_tap $? 230 'GetUserEntitlementOwnershipByItemIds' test.out

#- 231 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZBkatNLc42eq0O6' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku '6S2eHsH4Y84hL75Q' \
    > test.out 2>&1
eval_tap $? 231 'GetUserEntitlementOwnershipBySku' test.out

#- 232 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'boMHCtzEF9FSeg6W' \
    > test.out 2>&1
eval_tap $? 232 'RevokeAllEntitlements' test.out

#- 233 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgtfuqJHrs4e3RnW' \
    --entitlementIds 'R30MdBZezfwc3H0q' \
    > test.out 2>&1
eval_tap $? 233 'RevokeUserEntitlements' test.out

#- 234 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'SbMq4GLj8aGsH0qE' \
    --namespace "$AB_NAMESPACE" \
    --userId '5p601ak59yFSfdZI' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlement' test.out

#- 235 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'v8oYWPUS4Zu0SbTt' \
    --namespace "$AB_NAMESPACE" \
    --userId '6M2XizikCh6q0yq2' \
    --body '{"endDate": "1995-08-11T00:00:00Z", "nullFieldList": ["AHtL7IWE3MFqvfDG", "5jvMOaXrDlEX42U0", "syrGNhBmgT2q0kIb"], "startDate": "1979-10-20T00:00:00Z", "status": "INACTIVE", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 235 'UpdateUserEntitlement' test.out

#- 236 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'tOHV5hnpjc5CNLnn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Evo25aEtdjls5oad' \
    --body '{"options": ["seJg7y4Q9CU3fjSR", "aXD4HDmdvhMXxiKR", "29LKIhNU43K8bihd"], "requestId": "w3prp0UHlWUxkBef", "useCount": 15}' \
    > test.out 2>&1
eval_tap $? 236 'ConsumeUserEntitlement' test.out

#- 237 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '6hXZ7XLoWCGf0dZE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eXBd6mGG6SHcZbX2' \
    > test.out 2>&1
eval_tap $? 237 'DisableUserEntitlement' test.out

#- 238 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'wNnT6A9zosmDnXon' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cy7NZQ4PkAPXBCfk' \
    > test.out 2>&1
eval_tap $? 238 'EnableUserEntitlement' test.out

#- 239 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'E1Fb0y94eP7yh0zs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KhR60HZwUwk48XK7' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementHistories' test.out

#- 240 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'MXHbEwAvvpEeHhXi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JcJqYSxVKUYMimVL' \
    > test.out 2>&1
eval_tap $? 240 'RevokeUserEntitlement' test.out

#- 241 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'zAP6aOzsTqEFXUhG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AwpYq1UqZydOB0MT' \
    --body '{"reason": "hZW6LwcAg57BYBVC", "useCount": 2}' \
    > test.out 2>&1
eval_tap $? 241 'RevokeUseCount' test.out

#- 242 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'iKVT3OvEujx5yjtQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SCJaOHzpb623EciY' \
    --body '{"requestId": "oYOPVg6DLEZ6Dxpw", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 242 'SellUserEntitlement' test.out

#- 243 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'fsSgZxSYnVwXqF6K' \
    --body '{"duration": 26, "endDate": "1996-07-29T00:00:00Z", "itemId": "R0H3EkrHqaLNdfKs", "itemSku": "zYZzOg113h6fIaHS", "language": "x5bClxUOBmMwv5pm", "metadata": {"iIVnhlLoMemsp7o3": {}, "F2LQw7Y2VdSxgXez": {}, "7VvS0C9JLVQQPa7P": {}}, "order": {"currency": {"currencyCode": "Px4Zi6WaC8wk7HMb", "currencySymbol": "JhNwZgf5nlMDORYu", "currencyType": "REAL", "decimals": 85, "namespace": "uZXUCBYnkY0LEBSY"}, "ext": {"BdUSiTOrhB8hVs29": {}, "WOKmZRTtgycLzXz6": {}, "lUMKi5mweMEZo2Zn": {}}, "free": true}, "orderNo": "1Zg2JfH4f73jAevO", "origin": "Nintendo", "quantity": 91, "region": "ES6YJLlb2AfUEEBb", "source": "OTHER", "startDate": "1989-11-07T00:00:00Z", "storeId": "5PT404mFw4HJv5T2"}' \
    > test.out 2>&1
eval_tap $? 243 'FulfillItem' test.out

#- 244 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIQOecfLsYKTmUnK' \
    --body '{"code": "lrOsJmEwjGYN8VNP", "language": "pjSN-uNak", "region": "HNI0l6jJVzF1Oi2s"}' \
    > test.out 2>&1
eval_tap $? 244 'RedeemCode' test.out

#- 245 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'QuWUBBHZonSmzF83' \
    --body '{"metadata": {"1vlCiZAZHCWMXxVh": {}, "8HTrKqVwnpPn8N5x": {}, "MRgU7cPqNZrLCRRU": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "9IltQUku3n32atB0", "namespace": "QPQPEp5UtwUWGt6t"}, "item": {"itemId": "ooHP5kAww01zalTd", "itemSku": "dhAQ1pwqnybvUIfu", "itemType": "ulmeegRwPPbn7ltt"}, "quantity": 6, "type": "ITEM"}, {"currency": {"currencyCode": "21cS6IVE4fzwG3BH", "namespace": "aRcZ8NK4gkLmvEOa"}, "item": {"itemId": "RcqTgF0xtQAXoDoF", "itemSku": "kmA3fgzcwdgJMjIy", "itemType": "GfiNBQy41M1gzGCb"}, "quantity": 1, "type": "ITEM"}, {"currency": {"currencyCode": "v8ry8IyqNVv0KVpX", "namespace": "JTMx3Y8Um1iqehOb"}, "item": {"itemId": "g3OZ9j0HDtbqMFlg", "itemSku": "HKQIRtLfPngD83ro", "itemType": "OeqE7fcCAeExeQX4"}, "quantity": 2, "type": "ITEM"}], "source": "ORDER_REVOCATION", "transactionId": "jPyq35BWDoc3qNcQ"}' \
    > test.out 2>&1
eval_tap $? 245 'FulfillRewards' test.out

#- 246 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FFyHv141NPqjRUMK' \
    --endTime 'SQjFdjqTaZFsWzbq' \
    --limit '47' \
    --offset '94' \
    --productId 'rNJLM0OOVG5cG6Xx' \
    --startTime 'ENbWqlX7idzjpKDf' \
    --status 'FULFILLED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserIAPOrders' test.out

#- 247 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'YxMID9pqZ5rryiMM' \
    > test.out 2>&1
eval_tap $? 247 'QueryAllUserIAPOrders' test.out

#- 248 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 't6fQtLhzylaquioT' \
    --endTime '3QBt29AiRASsuFM4' \
    --limit '1' \
    --offset '39' \
    --startTime 'hGw7XcF1Qwzz606U' \
    --status 'SUCCESS' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 248 'QueryUserIAPConsumeHistory' test.out

#- 249 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XPhoNZlXMef7AvS3' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "Rl-cucZ", "productId": "gbtOtcQS4Cmgw1wR", "region": "UnIVYxY6OhdkrYiC", "transactionId": "inoVOzo4Plv1IlTp", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 249 'MockFulfillIAPItem' test.out

#- 250 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gz7qbPnXEuOzzkoB' \
    --itemId 'mMR9C4qPqJrAdh1H' \
    --limit '70' \
    --offset '22' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 250 'QueryUserOrders' test.out

#- 251 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '7vCEq7FQ2S5VeW9d' \
    --body '{"currencyCode": "dxzLPV8wDjsnyPh5", "currencyNamespace": "yNbYXmlAOi1SC3I1", "discountedPrice": 91, "ext": {"0scd97A0GP6djn2P": {}, "s3IVT5hUZ3cnDq0d": {}, "dZG0EpfGAqHKcSxU": {}}, "itemId": "c2YgRpk2IFGIgIps", "language": "cUpVAciu2XPPUxzX", "options": {"skipPriceValidation": true}, "platform": "Steam", "price": 45, "quantity": 64, "region": "xhvTZcvRKoaM4ozS", "returnUrl": "Ag8FTLrByWOJhboc", "sandbox": false, "sectionId": "Ps2SO9XrgXNIaU11"}' \
    > test.out 2>&1
eval_tap $? 251 'AdminCreateUserOrder' test.out

#- 252 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cBXLwTfopqeZtHJn' \
    --itemId 'RgaGfLMFbvyI5PZG' \
    > test.out 2>&1
eval_tap $? 252 'CountOfPurchasedItem' test.out

#- 253 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zVLcmZKKKYARape2' \
    --userId 'tsNczam4Cdd1QYvw' \
    > test.out 2>&1
eval_tap $? 253 'GetUserOrder' test.out

#- 254 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'w4XDokltgq2vXtUn' \
    --userId 'Y6UhDJ4pe0s0Cuhl' \
    --body '{"status": "REFUND_FAILED", "statusReason": "dU9b4seYCyiB4tDC"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateUserOrderStatus' test.out

#- 255 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Wx3cEX8wTi1v2abp' \
    --userId 'CWytPEi9Ze0hL9rP' \
    > test.out 2>&1
eval_tap $? 255 'FulfillUserOrder' test.out

#- 256 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kV5GkSrcl2O47XVz' \
    --userId 'U7qlNVk7qnmBS3XK' \
    > test.out 2>&1
eval_tap $? 256 'GetUserOrderGrant' test.out

#- 257 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Dhp1OkMcErmeH0lX' \
    --userId '1hj0LaXgQ94flh77' \
    > test.out 2>&1
eval_tap $? 257 'GetUserOrderHistories' test.out

#- 258 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5AQfzNjQ7IuMSY2e' \
    --userId 'pRDJjDyMDKQhuTjt' \
    --body '{"additionalData": {"cardSummary": "QZyIiAmCL8bNTTfq"}, "authorisedTime": "1990-09-16T00:00:00Z", "chargebackReversedTime": "1985-03-23T00:00:00Z", "chargebackTime": "1981-07-21T00:00:00Z", "chargedTime": "1975-09-02T00:00:00Z", "createdTime": "1993-08-15T00:00:00Z", "currency": {"currencyCode": "fMnTbKdwNhiIP7dp", "currencySymbol": "J8B8VwFQnVco2oCn", "currencyType": "VIRTUAL", "decimals": 100, "namespace": "JmbjapW9UlEqtzDd"}, "customParameters": {"7SgxdxB5kvtM8ah9": {}, "bPsksceGUEX8ERZc": {}, "KSYLo6y7yJMowQ6L": {}}, "extOrderNo": "pHCvCYTgX9JQwErz", "extTxId": "jtuP9pUUv7qefNMF", "extUserId": "sZAIqak1zi0JSa5c", "issuedAt": "1993-06-28T00:00:00Z", "metadata": {"n31D8ubfdXi7BycD": "PckeGJUgU8bD5mGF", "FmKTTUxG0mpmFxxD": "NXGlGJvHf558h1lt", "yhiSGhfqXhxBJ7zL": "XioAGkWgSDdDQvpR"}, "namespace": "fGe3z2rtjWpJAlKH", "nonceStr": "F0ebxhJ1176CeD4d", "paymentMethod": "WCp4wqlQJcZroNQi", "paymentMethodFee": 8, "paymentOrderNo": "Pj2XoFug8BUQUmPH", "paymentProvider": "PAYPAL", "paymentProviderFee": 66, "paymentStationUrl": "PumcazKAna0ji757", "price": 2, "refundedTime": "1991-04-09T00:00:00Z", "salesTax": 60, "sandbox": false, "sku": "FeKnQP2j2WsQImTw", "status": "CHARGEBACK", "statusReason": "gx0UC6eWKCFGS97S", "subscriptionId": "i6XyLVPrkUxyZ1OH", "subtotalPrice": 47, "targetNamespace": "Nn4nMT8QOyTuUSD9", "targetUserId": "ImtaPAocOQcpBWSN", "tax": 36, "totalPrice": 58, "totalTax": 60, "txEndTime": "1976-02-18T00:00:00Z", "type": "NEAdojkCMmYyTGO0", "userId": "7foRZ6FujpIWo0qJ", "vat": 39}' \
    > test.out 2>&1
eval_tap $? 258 'ProcessUserOrderNotification' test.out

#- 259 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'afwbFPX15633pFgA' \
    --userId '7i9tqvfHmFvUZiUW' \
    > test.out 2>&1
eval_tap $? 259 'DownloadUserOrderReceipt' test.out

#- 260 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '5Y0CYw5OXSGwQkJu' \
    --body '{"currencyCode": "y9oLFcHHcraLXR2n", "currencyNamespace": "9JQvq7NKWIHYsii3", "customParameters": {"fCh7sieJjZPAkiWu": {}, "mllU31uXPwYxedGH": {}, "CIkmt4bfJOhNaIT0": {}}, "description": "pv7XeqO8gY3c4Sry", "extOrderNo": "WB4yRaDxvxwaLM8H", "extUserId": "kVOW8PnLkgqkqYZW", "itemType": "SUBSCRIPTION", "language": "xv_lMAO", "metadata": {"RfUilcKA84d9pMsl": "7zrNJvDiP2hNNEI8", "QrQ6H1ro5CtU8Ujg": "yCUpM1JBcTzf4dz1", "BojPoQg976409vFd": "5z9r4nJWUvLp1wxG"}, "notifyUrl": "F747468MXUq3uIff", "omitNotification": false, "platform": "zaOrxuKvtUVtqbDW", "price": 27, "recurringPaymentOrderNo": "jXSwsBBRopVl38d4", "region": "NZGtk6EmWxC75M88", "returnUrl": "TKhFYkA9aRNDe2Io", "sandbox": true, "sku": "MSQKcg0OTT9JA0ll", "subscriptionId": "1RimBCiQwuyrI87u", "title": "SyXP6C0jXS8au2wc"}' \
    > test.out 2>&1
eval_tap $? 260 'CreateUserPaymentOrder' test.out

#- 261 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WYyj3JvHqXp4JR7x' \
    --userId 'I59Z9tfGVsglnOxO' \
    --body '{"description": "XBfgBLuglkd9LIos"}' \
    > test.out 2>&1
eval_tap $? 261 'RefundUserPaymentOrder' test.out

#- 262 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'hGnFSuHmrqej8PRp' \
    --body '{"code": "pYY1vlV0M2g6oreq", "orderNo": "yBzWzCgMMWZuD6tm"}' \
    > test.out 2>&1
eval_tap $? 262 'ApplyUserRedemption' test.out

#- 263 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'IR28xVxbtpSKOfiI' \
    --body '{"meta": {"P3S6pypZqISn3msr": {}, "ykQFtW8QGKFZLrIf": {}, "qrZuu7IwKcT7sAsv": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "TKCbYMVkXEHmsHwI", "namespace": "GGsusS0zZRODEKPd"}, "entitlement": {"entitlementId": "udZsLaf8aZrXW84d"}, "item": {"itemIdentity": "t0TSTmy7XF26K2U7", "itemIdentityType": "ITEM_SKU", "origin": "Other"}, "quantity": 65, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "System", "currencyCode": "Uz8nWKJjv06PuffH", "namespace": "ghAQfAsYXVzBenLt"}, "entitlement": {"entitlementId": "aAoYyRfiCWrm3s1A"}, "item": {"itemIdentity": "h3TII70MIcBMJ045", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 80, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "LLoPZrkjRm5Ki0or", "namespace": "hXrISEaPZHLQkTHv"}, "entitlement": {"entitlementId": "ndQsCKAO2JRz3CGw"}, "item": {"itemIdentity": "tujkzxidLcAQWGVR", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 73, "type": "ENTITLEMENT"}], "source": "ORDER", "transactionId": "Vso5TJCSugdo4XTm"}' \
    > test.out 2>&1
eval_tap $? 263 'DoRevocation' test.out

#- 264 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '8t1YTWqItjNWXm9s' \
    --body '{"gameSessionId": "raeMA78YSRS2fPy5", "payload": {"fpbbbMIu9lu18jIM": {}, "BUM77XmemN8LO03m": {}, "nFSq9jJTVFoFjxZj": {}}, "scid": "h5qUR1Pq4a4uaMfd", "sessionTemplateName": "0SQAfYIyzHL8jxak"}' \
    > test.out 2>&1
eval_tap $? 264 'RegisterXblSessions' test.out

#- 265 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'uVu5r5B08VZxI4TU' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'apnZXoJ4gI4EQKO8' \
    --limit '47' \
    --offset '34' \
    --sku 'C4D0FsUo3IB2kX5R' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserSubscriptions' test.out

#- 266 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZsHyXzoIXNf0KbL9' \
    --excludeSystem  \
    --limit '69' \
    --offset '50' \
    --subscriptionId 'lzuVRVEvhKIbrq1x' \
    > test.out 2>&1
eval_tap $? 266 'GetUserSubscriptionActivities' test.out

#- 267 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'sGpdobYun8hcO55h' \
    --body '{"grantDays": 98, "itemId": "UpmA4ehxNIIlcrZz", "language": "gameT2mLkkAMjHyI", "reason": "0e2Axj0nZHjmoKHJ", "region": "ngwMe1AnQVj6QQjZ", "source": "tkNJCnDSrsSey2Bq"}' \
    > test.out 2>&1
eval_tap $? 267 'PlatformSubscribeSubscription' test.out

#- 268 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OxgwCymCDYsuff3b' \
    --itemId '7G5FDX4mu0qPHb9L' \
    > test.out 2>&1
eval_tap $? 268 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 269 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'l2EFEb8GnsthmQ2Y' \
    --userId '6ZGOiqrg3lpqN5bO' \
    > test.out 2>&1
eval_tap $? 269 'GetUserSubscription' test.out

#- 270 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fnqJ5bzDRzbhMxfE' \
    --userId 'DE4TrtIHyyMq79Ed' \
    > test.out 2>&1
eval_tap $? 270 'DeleteUserSubscription' test.out

#- 271 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'B9MxaF8QHGM2IuQY' \
    --userId 'BO8m0HgTth479W8r' \
    --force  \
    --body '{"immediate": true, "reason": "VwR3yNKDtMqMrAGp"}' \
    > test.out 2>&1
eval_tap $? 271 'CancelSubscription' test.out

#- 272 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dyF6WDHn3ePBxQNz' \
    --userId '2IUEHMzl5jhwVDsu' \
    --body '{"grantDays": 51, "reason": "WqP4ElzL44KEm3uH"}' \
    > test.out 2>&1
eval_tap $? 272 'GrantDaysToSubscription' test.out

#- 273 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BMCP5ckjphURs4ks' \
    --userId 'gsKJ2R6Jacwwu8W1' \
    --excludeFree  \
    --limit '53' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 273 'GetUserSubscriptionBillingHistories' test.out

#- 274 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vrKMRPvwA9k6yJz0' \
    --userId '3NETdywPqYerrpOm' \
    --body '{"additionalData": {"cardSummary": "4M2pM4fIfcHBWZM5"}, "authorisedTime": "1997-12-29T00:00:00Z", "chargebackReversedTime": "1979-10-01T00:00:00Z", "chargebackTime": "1987-01-13T00:00:00Z", "chargedTime": "1973-12-07T00:00:00Z", "createdTime": "1994-05-21T00:00:00Z", "currency": {"currencyCode": "Rns3qwYL6LwGlZGF", "currencySymbol": "7XQPLAcIL7FvAMWq", "currencyType": "REAL", "decimals": 81, "namespace": "yyNZH1CducB5y5iM"}, "customParameters": {"deBG7REG4meKEabf": {}, "VXBJPIZqZC5d6JuF": {}, "dcfiNf0DOHKwxDF5": {}}, "extOrderNo": "GJhCjVHiCn2hTefT", "extTxId": "8gPFJ4WndMpQhcLK", "extUserId": "0WTZbtmQkwC8azx3", "issuedAt": "1988-08-20T00:00:00Z", "metadata": {"RWme3C6p2r4D3NQd": "jrjkX3AMgK3JgZuf", "zssA284mG7uAojLY": "Bsx8oqMzbE0ljQaB", "tb47V691j0FZp2vj": "OXptxzx6kkaZYpl5"}, "namespace": "2sQR9Znp5d1eSwrG", "nonceStr": "2GBBEWrDbQ1ZzhDu", "paymentMethod": "LHq9LTBstguOdN0O", "paymentMethodFee": 23, "paymentOrderNo": "l3GbKPHdDTQDEEE2", "paymentProvider": "PAYPAL", "paymentProviderFee": 93, "paymentStationUrl": "GFXChtxB10d4Q8nl", "price": 56, "refundedTime": "1994-06-06T00:00:00Z", "salesTax": 100, "sandbox": false, "sku": "dEyOVYrTdDq7IqbT", "status": "REQUEST_FOR_INFORMATION", "statusReason": "eLMZs9lSQVDp16qV", "subscriptionId": "IqXCK9dS5JTbdJEe", "subtotalPrice": 94, "targetNamespace": "mnkYAfw61kyKk0UX", "targetUserId": "UF2523OTvOmfVNJN", "tax": 60, "totalPrice": 90, "totalTax": 0, "txEndTime": "1973-01-28T00:00:00Z", "type": "O3FEkk4It6V8Bu7r", "userId": "IjGrxUMKbv60ixUu", "vat": 96}' \
    > test.out 2>&1
eval_tap $? 274 'ProcessUserSubscriptionNotification' test.out

#- 275 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'kn9OEVwLWGT4MXhm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zvRQb7c0vmjWq9fQ' \
    --body '{"count": 33, "orderNo": "bAFn8oWQcmFkkRX6"}' \
    > test.out 2>&1
eval_tap $? 275 'AcquireUserTicket' test.out

#- 276 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'EqadAEIzxld80Yns' \
    > test.out 2>&1
eval_tap $? 276 'QueryUserCurrencyWallets' test.out

#- 277 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 's7hc3VUxxZIgkTLq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MeJPCbs8jWmTteJh' \
    --body '{"allowOverdraft": true, "amount": 58, "balanceOrigin": "Xbox", "balanceSource": "PAYMENT", "metadata": {"bwHGG39YAZJ4HuLf": {}, "eTfFBTOFFMJ9pq51": {}, "1jZcTK8zmMfyshYk": {}}, "reason": "3b5cAFVo85r1b8Yp"}' \
    > test.out 2>&1
eval_tap $? 277 'DebitUserWalletByCurrencyCode' test.out

#- 278 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '2QnuhQuIdvZdj6As' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWBfRnLcLbp7Omcr' \
    --limit '60' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 278 'ListUserCurrencyTransactions' test.out

#- 279 CheckWallet
eval_tap 0 279 'CheckWallet # SKIP deprecated' test.out

#- 280 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'J7u1rrRPcnG89rnN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W1Yjfn8lY4DnYRxY' \
    --body '{"amount": 79, "expireAt": "1997-01-22T00:00:00Z", "metadata": {"hHeb0CaPFDjrSotK": {}, "npJWALpToj9rgr5R": {}, "ffM5JXvPdzEpDln0": {}}, "origin": "System", "reason": "aYSvsWiNJtqXltZF", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 280 'CreditUserWallet' test.out

#- 281 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'aSRmHU5iR3hXIbzW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PKOkzftOgDQAWhul' \
    --body '{"amount": 3, "metadata": {"DArk4L80aXFY7SQk": {}, "ym9KvKMHK5fbqioe": {}, "oRIplY0DIzRCNAO6": {}}, "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 281 'PayWithUserWallet' test.out

#- 282 GetUserWallet
eval_tap 0 282 'GetUserWallet # SKIP deprecated' test.out

#- 283 DebitUserWallet
eval_tap 0 283 'DebitUserWallet # SKIP deprecated' test.out

#- 284 DisableUserWallet
eval_tap 0 284 'DisableUserWallet # SKIP deprecated' test.out

#- 285 EnableUserWallet
eval_tap 0 285 'EnableUserWallet # SKIP deprecated' test.out

#- 286 ListUserWalletTransactions
eval_tap 0 286 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 287 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sEYogFWiH9z4E8zm' \
    > test.out 2>&1
eval_tap $? 287 'ListViews' test.out

#- 288 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aZ5cg0REtUWY4fVI' \
    --body '{"displayOrder": 7, "localizations": {"eXGgxNg33ZIUrIkf": {"description": "mdXVvaPQzzKdFg7N", "localExt": {"7piT8VcrXLZnuMNp": {}, "KEIs3GC9VTK7tkJW": {}, "FpHt7MdKu9Xwn5GH": {}}, "longDescription": "JDGatrYOMO91CYEj", "title": "X867n9PT9fR7mMuB"}, "XPDKCriRKzTZ7TXA": {"description": "VRnUVbxEJcKHE764", "localExt": {"EwhQfxFKIOGT1WKS": {}, "mLoA0ILaESC1GJXs": {}, "oBwqh0TQXa2j7v3z": {}}, "longDescription": "QJoQLTAlW75icIKU", "title": "pXazsFrmaGNoi3RP"}, "TgWotLNz0u8ySxA0": {"description": "yrjz4q7e0EJnADXC", "localExt": {"2y0DY1E1SMK9oA4v": {}, "K56dsYI5SKV5pDAN": {}, "yJ184miBhdVJt81f": {}}, "longDescription": "mLSyGuu5rbJVIwRM", "title": "twApGbXnR3yC6f2M"}}, "name": "HGGedk0KzXRclOXd"}' \
    > test.out 2>&1
eval_tap $? 288 'CreateView' test.out

#- 289 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'PYZQxBnttu4yW5et' \
    --storeId 'l4Xk8Hd1lRtoPMvs' \
    > test.out 2>&1
eval_tap $? 289 'GetView' test.out

#- 290 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'u9oswEPTvzwwGnpb' \
    --storeId 'x8MCIjKzylqW8auy' \
    --body '{"displayOrder": 38, "localizations": {"Q7HMPO4ozK705ykR": {"description": "qSPYZgPm4JLsXVtB", "localExt": {"OEetHsxAJ8Ny1LRk": {}, "PU9hrl5nkpEdBe8b": {}, "YWdok4UnUEOyP0cP": {}}, "longDescription": "Zf5OvolfI0mqZcto", "title": "hLheRaQkfMLFW9B7"}, "jHZro4hhwnANAGp8": {"description": "zGqNGrcQyoA1TWPc", "localExt": {"y83iXfYXNdMkdg9T": {}, "MwxNcQ6CkVi8fqVP": {}, "RqNbF5yLnYSa8xFL": {}}, "longDescription": "vcYexMMMiDFh5RbW", "title": "021cHN3QbzVuJZH3"}, "k54cExxWKtdGTW4F": {"description": "ILotv5ycTa0i6ifY", "localExt": {"P1zfgjsy3VRjX4qA": {}, "4g9OGoWw1qnCAvdn": {}, "AcokJ0rzqX2KJcYH": {}}, "longDescription": "giFDxclBXap6j73d", "title": "oCWxhubMXbxNvT6w"}}, "name": "Affv4uzKAwiI4wTx"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateView' test.out

#- 291 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'NIefCmtrxWu29355' \
    --storeId '1nQBNKcqCkUXRj8g' \
    > test.out 2>&1
eval_tap $? 291 'DeleteView' test.out

#- 292 QueryWallets
eval_tap 0 292 'QueryWallets # SKIP deprecated' test.out

#- 293 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 89, "expireAt": "1999-09-25T00:00:00Z", "metadata": {"qoogOxoPYvdIBJYy": {}, "GURjEjnslEYM8ngV": {}, "T1ewVxvgAocOqsd5": {}}, "origin": "Other", "reason": "fHdITmN9opaF0kh3", "source": "GIFT"}, "currencyCode": "W8fNAM5YdHivK2Q0", "userIds": ["WwolQy037hJMOEv5", "AKKWMDebehSjpt0w", "W0v25yAObZIbrA8X"]}, {"creditRequest": {"amount": 36, "expireAt": "1989-02-13T00:00:00Z", "metadata": {"CSDyYy4e5qoTZxSo": {}, "ZbQUnUxS6m68WL3H": {}, "DL4yx5I0euBsccHP": {}}, "origin": "Playstation", "reason": "5eiQO3oWdgXdm1Ix", "source": "REDEEM_CODE"}, "currencyCode": "gIYqxFfSNJlHCjxL", "userIds": ["559ilm3cauhrw9Yn", "NnYUlGQsFpy9ZVlL", "IFwLgT78nootfUs9"]}, {"creditRequest": {"amount": 32, "expireAt": "1984-04-23T00:00:00Z", "metadata": {"cnbm7z2Aa24yBTw3": {}, "wfNGyWf3VujS7Bq5": {}, "bcfPW4pPZB9YXltC": {}}, "origin": "Playstation", "reason": "yBGygWFTAY3Th5mO", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "vziexzOLbOWbtcJU", "userIds": ["kulpM4SRtUE5P4kx", "xM3AWyDkA5LmART6", "mHtFbjqurHix0QYy"]}]' \
    > test.out 2>&1
eval_tap $? 293 'BulkCredit' test.out

#- 294 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "cDH5we2Mx0sYCnYP", "request": {"allowOverdraft": false, "amount": 18, "balanceOrigin": "IOS", "balanceSource": "PAYMENT", "metadata": {"mxc14iRfzJwKuc7E": {}, "piQEzz5N5osRYO7w": {}, "bYh7q02W8tkTURUF": {}}, "reason": "mqNc8xhQqptccNor"}, "userIds": ["Rls7EC3nDnhFvDlF", "lzGCII156hIg0g8H", "d7iyZpvWVJFK6Zuv"]}, {"currencyCode": "Ixpzm9AcFhH4ZlYY", "request": {"allowOverdraft": false, "amount": 37, "balanceOrigin": "Nintendo", "balanceSource": "ORDER_REVOCATION", "metadata": {"Zf5fEdvjbyJPQ1qd": {}, "RcJjsme1OukIfIZV": {}, "H8q8svV5hMOSfpyJ": {}}, "reason": "kJlmJmTkFvB7wkY6"}, "userIds": ["nuUEGJ3k0HGtpK43", "uORGREOOwTuY8dhN", "CDWWpN3B6tedgFUz"]}, {"currencyCode": "Bm5vGA3itKaF9z3W", "request": {"allowOverdraft": true, "amount": 60, "balanceOrigin": "Other", "balanceSource": "ORDER_REVOCATION", "metadata": {"3j8T9g1f6P3D3rVc": {}, "C2g6t42jE1Wad232": {}, "YV7A2zHFGbN8AQaC": {}}, "reason": "aw9UF7cdSDd99DQZ"}, "userIds": ["7vnTx8HDXTJWiyw1", "DLGvn6qtroZcp16H", "7ogzmbj4SLYDrZJv"]}]' \
    > test.out 2>&1
eval_tap $? 294 'BulkDebit' test.out

#- 295 GetWallet
eval_tap 0 295 'GetWallet # SKIP deprecated' test.out

#- 296 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'KXX1ft5nBA9xNIJV' \
    --end 'uMz04evSdE2FMcKd' \
    --start '7c94rEmIYuAT5OAc' \
    > test.out 2>&1
eval_tap $? 296 'SyncOrders' test.out

#- 297 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["UwYHGmG5rNDBF1oU", "37vjfyX5YLaM0wmi", "0i1WABBbq8IzZsMF"], "apiKey": "LX9ZhFXcFtfBS3ZI", "authoriseAsCapture": true, "blockedPaymentMethods": ["ofhwyM6Bw2sFGQ5D", "QoDwzrKPOZZnV3zR", "7YxSu6addocg10Hy"], "clientKey": "9jx7gBHTOHHArjld", "dropInSettings": "0LnREsrrB2pJ7V8B", "liveEndpointUrlPrefix": "SrucjO3zvSM5KeVN", "merchantAccount": "HU9GcOivIfcCJt4U", "notificationHmacKey": "8VSgXoi9Fw25b9qX", "notificationPassword": "zlIK2G6AUjBCdf0R", "notificationUsername": "p5e5IvFuN1oUsCnB", "returnUrl": "mGMx5F6EhM3dKvIG", "settings": "9MR0hTINvq1VR9SJ"}' \
    > test.out 2>&1
eval_tap $? 297 'TestAdyenConfig' test.out

#- 298 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "UfQEX996Mh1sQ3Dw", "privateKey": "3uyjgQNAs9188Qm3", "publicKey": "W1De2McGd10wefF0", "returnUrl": "CJlH55RLEgeAsSpQ"}' \
    > test.out 2>&1
eval_tap $? 298 'TestAliPayConfig' test.out

#- 299 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "dcmGHZuRVQ8tzwqM", "secretKey": "ayP8A3HGNI3BfjkF"}' \
    > test.out 2>&1
eval_tap $? 299 'TestCheckoutConfig' test.out

#- 300 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'd6MHo6gGQ5mChYoK' \
    > test.out 2>&1
eval_tap $? 300 'DebugMatchedPaymentMerchantConfig' test.out

#- 301 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "D7yqCR03RovQZhwf", "clientSecret": "jkq9iyTbyD3D01tR", "returnUrl": "puuyIagSSzEL8H4e", "webHookId": "uLufhQj2KP3LLxl9"}' \
    > test.out 2>&1
eval_tap $? 301 'TestPayPalConfig' test.out

#- 302 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["Hs2L2wlpKBVURxHe", "fz77a9fntCNiHBRU", "NCPSre5GmZzCQwil"], "publishableKey": "S3IxSjlyvR9PxG9L", "secretKey": "ji2Vc88W8aLjIxVG", "webhookSecret": "pdOqguxvRwI9ZBTi"}' \
    > test.out 2>&1
eval_tap $? 302 'TestStripeConfig' test.out

#- 303 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "pMRlhK9DMMaI4ryV", "key": "DvNaruZxwTfh9gEs", "mchid": "6GF247cbBLjUr5z0", "returnUrl": "3wxB3E9hrE9f9COF"}' \
    > test.out 2>&1
eval_tap $? 303 'TestWxPayConfig' test.out

#- 304 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "rOr6wJDBwIDsJHNg", "flowCompletionUrl": "6TvNGjwI4TbTwBuf", "merchantId": 95, "projectId": 31, "projectSecretKey": "orJouduhCEJ5XiKD"}' \
    > test.out 2>&1
eval_tap $? 304 'TestXsollaConfig' test.out

#- 305 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'IE9YugcupLxVBcRk' \
    > test.out 2>&1
eval_tap $? 305 'GetPaymentMerchantConfig' test.out

#- 306 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'fhRuqkOTHSia7oFd' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["1fEmDuyAsQGzwJR5", "poI718RQnj4imu6X", "FfRcWDXhq1YmGeyg"], "apiKey": "r2S4Yw8NmPaBeryz", "authoriseAsCapture": false, "blockedPaymentMethods": ["EFuEVP9bF07gnWDU", "LkJPQR0UJMr8oucc", "GH0B4LCe2h0iFCCZ"], "clientKey": "gFWs5s0nT89A88GD", "dropInSettings": "OUClGyzYgnYTdim6", "liveEndpointUrlPrefix": "PkRoq5TO65KWh8zt", "merchantAccount": "RJkXxUAj3jzZvEaY", "notificationHmacKey": "103YUIMuSjDHz0zP", "notificationPassword": "WMZQNNP2JqQqhIST", "notificationUsername": "BT1Gofv4SuaZ8yCB", "returnUrl": "9TVZnuzgvAZJRm71", "settings": "EC3ENuvD8OPsp5Z3"}' \
    > test.out 2>&1
eval_tap $? 306 'UpdateAdyenConfig' test.out

#- 307 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'ez84KVB7HeWPnVeF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 307 'TestAdyenConfigById' test.out

#- 308 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'dy5ezlCU6SGzkMpT' \
    --sandbox  \
    --validate  \
    --body '{"appId": "L2wxobjxAbagqEmX", "privateKey": "n6U2VeV2emK3JecJ", "publicKey": "A4skqCbPxRkIAFQh", "returnUrl": "9yDdoLE2s7mrVrmT"}' \
    > test.out 2>&1
eval_tap $? 308 'UpdateAliPayConfig' test.out

#- 309 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'JwtBTzQTrNo1LcWN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 309 'TestAliPayConfigById' test.out

#- 310 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'f7xHpi1JZJjIRtCf' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "qDHSlo54zSnRN0zG", "secretKey": "Mworzym1z3ZdetOi"}' \
    > test.out 2>&1
eval_tap $? 310 'UpdateCheckoutConfig' test.out

#- 311 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'c9AQOFWpdItLBhvK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 311 'TestCheckoutConfigById' test.out

#- 312 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'Jq9tWz9yui8a6jOf' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "lFJlZEhz1QDeh05h", "clientSecret": "j92bwVVxJ62Q5AOA", "returnUrl": "OyL65cPaOZA8BG8K", "webHookId": "cVWOX9n3YsjJexnF"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdatePayPalConfig' test.out

#- 313 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'A9Umz3KPICya5Fk5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 313 'TestPayPalConfigById' test.out

#- 314 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'TPaEbX29cV8v7MXc' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["tihtxMnIr4b7jyfL", "3zMkklGCPISlsnVA", "6z0uSfNNpJUYzJxn"], "publishableKey": "OyvqmswrToyBIQum", "secretKey": "xDfAxNqCUtizYM97", "webhookSecret": "ebZcYqwfIHPWMkOm"}' \
    > test.out 2>&1
eval_tap $? 314 'UpdateStripeConfig' test.out

#- 315 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'rT5HL16jMwECnmwJ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 315 'TestStripeConfigById' test.out

#- 316 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'v4rpqtzDaz0WUJlB' \
    --validate  \
    --body '{"appId": "CHzJ2v9K8c1zOlZg", "key": "30pagfP0FfOMBOpe", "mchid": "QT4zYIbU4i9mLyX4", "returnUrl": "6Alt08rrnG8y2ScX"}' \
    > test.out 2>&1
eval_tap $? 316 'UpdateWxPayConfig' test.out

#- 317 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'kwjpAp82pGcxvXaG' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 317 'UpdateWxPayConfigCert' test.out

#- 318 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '9LzHpMS53jllopwi' \
    > test.out 2>&1
eval_tap $? 318 'TestWxPayConfigById' test.out

#- 319 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'rRo3A8WxnR0YaMsF' \
    --validate  \
    --body '{"apiKey": "3f5KLtpTSsPMGDZT", "flowCompletionUrl": "OwEP5Bhh0NStWIgg", "merchantId": 26, "projectId": 82, "projectSecretKey": "hfAzVdNYP7Ao1z7F"}' \
    > test.out 2>&1
eval_tap $? 319 'UpdateXsollaConfig' test.out

#- 320 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'eJM2fWXGk7JObSHk' \
    > test.out 2>&1
eval_tap $? 320 'TestXsollaConfigById' test.out

#- 321 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'sRkabpmvRsc7ZYvX' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 321 'UpdateXsollaUIConfig' test.out

#- 322 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '26' \
    --namespace "$AB_NAMESPACE" \
    --offset '73' \
    --region '6mRZAlLBczJVeil7' \
    > test.out 2>&1
eval_tap $? 322 'QueryPaymentProviderConfig' test.out

#- 323 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "GkXNwMYwFyljy5bY", "region": "QdQ87hUHA0FJZwP8", "sandboxTaxJarApiToken": "GslMpx3m7lEXTmnT", "specials": ["ADYEN", "ADYEN", "WALLET"], "taxJarApiToken": "mf392ersoZ2KbMb5", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 323 'CreatePaymentProviderConfig' test.out

#- 324 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 324 'GetAggregatePaymentProviders' test.out

#- 325 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'al0ruZmBXlGSp85q' \
    > test.out 2>&1
eval_tap $? 325 'DebugMatchedPaymentProviderConfig' test.out

#- 326 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 326 'GetSpecialPaymentProviders' test.out

#- 327 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '6fuGfo5wSDHnyabk' \
    --body '{"aggregate": "XSOLLA", "namespace": "3I3pvHKDaWhTN1qy", "region": "xpUzWIZWJTDzWguh", "sandboxTaxJarApiToken": "ujw1EoR58uCVldef", "specials": ["PAYPAL", "WXPAY", "PAYPAL"], "taxJarApiToken": "337LLNCjIySe36SA", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 327 'UpdatePaymentProviderConfig' test.out

#- 328 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'wZk0HGeJNaBjVdMB' \
    > test.out 2>&1
eval_tap $? 328 'DeletePaymentProviderConfig' test.out

#- 329 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 329 'GetPaymentTaxConfig' test.out

#- 330 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "5kMzKycYrhr4FnNz", "taxJarApiToken": "dT4pWwIVXp9avUr6", "taxJarEnabled": false, "taxJarProductCodesMapping": {"ydpXW0MO0eT9okl6": "MlWOl9feWO2bmOik", "TBJHTEm5PSeyod5L": "6OooYoQn9iHEqWO1", "cVCUIOx90FQdwLi3": "GOQkLtpuRNeT1CUL"}}' \
    > test.out 2>&1
eval_tap $? 330 'UpdatePaymentTaxConfig' test.out

#- 331 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'EMPaOU5nukycAUlk' \
    --end 'USZKUrsxNRzF3NaU' \
    --start 'uCyQyze6zPKu5sE8' \
    > test.out 2>&1
eval_tap $? 331 'SyncPaymentOrders' test.out

#- 332 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '9JW8UU0RsB6dvrpm' \
    --storeId 'InhHYzVVlHGFSwjb' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetRootCategories' test.out

#- 333 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'y6rMYkVQnZDUAbIN' \
    --storeId 'RKQsxUO1YMxAndOj' \
    > test.out 2>&1
eval_tap $? 333 'DownloadCategories' test.out

#- 334 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '5O6IBwXJjgQjgLoJ' \
    --namespace "$AB_NAMESPACE" \
    --language 'yqwFVBd1ZjaRXEdW' \
    --storeId 'gS12bSbPgOCWUogi' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetCategory' test.out

#- 335 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'zeWOPUMrqgEIsMwN' \
    --namespace "$AB_NAMESPACE" \
    --language 'bfti0LoTBcNzyoCS' \
    --storeId 'w1t653G3ydYmGzvx' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetChildCategories' test.out

#- 336 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '9bSqqyAPha5b6PQT' \
    --namespace "$AB_NAMESPACE" \
    --language 'PTytHeeXo7gOFVLZ' \
    --storeId 'CBWuVIROZuqdJBi8' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetDescendantCategories' test.out

#- 337 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 337 'PublicListCurrencies' test.out

#- 338 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 338 'GetIAPItemMapping' test.out

#- 339 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'kn98VtLNkaIQJfkF' \
    --region 'DhSeSGXtZU5SuIhM' \
    --storeId 'SaDRp17dUWHcjrb6' \
    --appId 'qNeKpOxPrlG9svdq' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetItemByAppId' test.out

#- 340 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId '2KEsIdtozVltBhoX' \
    --categoryPath 'E4wgcYT5CdjaJuUz' \
    --features 'FIeqaVr1CE1gu6cY' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --language 'q9KBqBwiNCsnK8Cc' \
    --limit '84' \
    --offset '40' \
    --region '1OHbpQZtwW3EwLre' \
    --sortBy 'updatedAt:asc,name,createdAt:asc' \
    --storeId 'L4dJnkRLJbMvOGSd' \
    --tags '7uMrmQ2SaLd6M7TM' \
    > test.out 2>&1
eval_tap $? 340 'PublicQueryItems' test.out

#- 341 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '3wnJyExuo5z9RAcY' \
    --region 'gYZb7cAakJpqN6eu' \
    --storeId 'bdp49JFwXG0EvoSH' \
    --sku 'NC97eEyhnL1QH5Al' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetItemBySku' test.out

#- 342 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'YRAqCAC2gy1WF9QL' \
    --region 'NgDxAkwgfB8jIecO' \
    --storeId 'x5ugNCDd6jW6fjtB' \
    --itemIds 'cO3fWq9qfmBv0XgJ' \
    > test.out 2>&1
eval_tap $? 342 'PublicBulkGetItems' test.out

#- 343 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["B6a7uykADFpinFcH", "2ZMSYijqEuMfuYFU", "S079tOpZYM1XV0Op"]}' \
    > test.out 2>&1
eval_tap $? 343 'PublicValidateItemPurchaseCondition' test.out

#- 344 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'MEDIA' \
    --limit '6' \
    --offset '64' \
    --region 'amycnTUOoMkOppZN' \
    --storeId 'Okqxc42HKv5wvtPJ' \
    --keyword 'VsuzaBciSxwzuIpG' \
    --language 'BYHTHoSVxgQCbpZx' \
    > test.out 2>&1
eval_tap $? 344 'PublicSearchItems' test.out

#- 345 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '5yMGIQ1ZxVIefYlK' \
    --namespace "$AB_NAMESPACE" \
    --language 'BJyQMqUEfDikX6yO' \
    --region 'lgZrn0I6T0hvcAFT' \
    --storeId 'aSWR4VOGIY7hM6uh' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetApp' test.out

#- 346 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'onkAe0FdTSSEluBx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'PublicGetItemDynamicData' test.out

#- 347 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'M47BTww3nBTVmBFZ' \
    --namespace "$AB_NAMESPACE" \
    --language '6TIs9bTi2m7eNsYE' \
    --populateBundle  \
    --region 'qKkeuLWDfeFeExlO' \
    --storeId 'FjRh8mLFTJLveQSD' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetItem' test.out

#- 348 GetPaymentCustomization
eval_tap 0 348 'GetPaymentCustomization # SKIP deprecated' test.out

#- 349 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "WnMQGaYRxFWia7yJ", "paymentProvider": "XSOLLA", "returnUrl": "d87XjA0ajvb7JcGU", "ui": "Fgp6LkyXpxJeFxhg", "zipCode": "TwyO51CUpcdxL0a9"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetPaymentUrl' test.out

#- 350 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'VDhrqWCTXOxQUpyF' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetPaymentMethods' test.out

#- 351 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gZhNpOTE4toH57yr' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUnpaidPaymentOrder' test.out

#- 352 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '01N33p1Gha8Hwpag' \
    --paymentProvider 'WALLET' \
    --zipCode 'EbTPQ8p7VMlxEXnq' \
    --body '{"token": "HwMyKpwphjUXvM1G"}' \
    > test.out 2>&1
eval_tap $? 352 'Pay' test.out

#- 353 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qMkZ44UXgdBqtJaR' \
    > test.out 2>&1
eval_tap $? 353 'PublicCheckPaymentOrderPaidStatus' test.out

#- 354 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'oKpXx60GmEX9x2BY' \
    > test.out 2>&1
eval_tap $? 354 'GetPaymentPublicConfig' test.out

#- 355 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'pyKEBQ7TW7lZvDbw' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetQRCode' test.out

#- 356 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'FJJhBRdq8BgAI81k' \
    --foreinginvoice '4Gr7jVVx5l3yrH9H' \
    --invoiceId 'R4reG0HwUXxQTf5Y' \
    --payload 'pDUGYsJBEkYUrLv4' \
    --redirectResult 'qUiTkFcLBrg2JB0W' \
    --resultCode 'iCpVBwvAffJ3btt0' \
    --sessionId 'PpQY3Pnnic80yEO8' \
    --status 'dL6Jh10XMUGeDavC' \
    --token 'KradJmJFUsU418vA' \
    --type 'lmfGg9NO1Z2DvnAx' \
    --userId 'H3pS3jyCkGKltBNE' \
    --orderNo '2UbhNtH3yYg4Qnn2' \
    --paymentOrderNo 'uhdw7C9Bx1LQOTCb' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'HTdnUtdrRcs3GeOs' \
    > test.out 2>&1
eval_tap $? 356 'PublicNormalizePaymentReturnUrl' test.out

#- 357 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'KPNlG7rEXi6LEqJE' \
    --paymentOrderNo 'RpbxEq07txnvZZeA' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 357 'GetPaymentTaxValue' test.out

#- 358 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '4Cd9xTdt2K1CzpQW' \
    > test.out 2>&1
eval_tap $? 358 'GetRewardByCode' test.out

#- 359 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'slNGnLYUYR0yOvJh' \
    --limit '95' \
    --offset '95' \
    --sortBy 'rewardCode,namespace:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 359 'QueryRewards1' test.out

#- 360 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'cMtwINUlrhIpnlam' \
    > test.out 2>&1
eval_tap $? 360 'GetReward1' test.out

#- 361 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 361 'PublicListStores' test.out

#- 362 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '2EefVopbpPhsana0,uXG7GUTV1BwgkLDj,4pjVktyoNSsEHlzy' \
    --itemIds 'd0SarkhltUxgbN5e,ElQNESFLD8hCc9on,SNjbQEqFGwnDG8kz' \
    --skus '4kvEv6tNjGRhrmRA,xRGeIKGlCJmDXpjy,vLSHB1y3klHuAGni' \
    > test.out 2>&1
eval_tap $? 362 'PublicExistsAnyMyActiveEntitlement' test.out

#- 363 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'dOyGuS0OG7ohiL29' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 364 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId '3ClrNhEdxd24ZKfv' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 365 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'DinAB6HqIWIi5Bvb' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 366 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '1rcuEtWAF763kci7,lT62BOHaso53W3U2,Mu9ZGMWou1U0RVCf' \
    --itemIds '3gMWDAodCKqfqzee,xHA70NgJTxjtzgO7,W3taRvJ6lKWJwHO6' \
    --skus '5aOFDwpqy7XOU3Dw,glyMGNll4O8ELahc,NJqRjepck1l0qxRy' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetEntitlementOwnershipToken' test.out

#- 367 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Q2pi7xuAufJakIPX", "language": "asba_iGxv", "region": "j8oYfWObyNJKVSQs"}' \
    > test.out 2>&1
eval_tap $? 367 'SyncTwitchDropsEntitlement' test.out

#- 368 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'aCokoGynp6xcqNKJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 368 'PublicGetMyWallet' test.out

#- 369 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'nAhrSt96OaARAjHL' \
    --body '{"epicGamesJwtToken": "GV3sNxS8uLBZiVRY"}' \
    > test.out 2>&1
eval_tap $? 369 'SyncEpicGameDLC' test.out

#- 370 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'IyQLcslTEqgVNG8A' \
    > test.out 2>&1
eval_tap $? 370 'SyncOculusDLC' test.out

#- 371 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'qktgvjwNJAwIpEy2' \
    --body '{"serviceLabel": 56}' \
    > test.out 2>&1
eval_tap $? 371 'PublicSyncPsnDlcInventory' test.out

#- 372 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'NpojZ24I2n25smsr' \
    --body '{"serviceLabels": [72, 26, 100]}' \
    > test.out 2>&1
eval_tap $? 372 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 373 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'FHGiYnyhbqxLuTZI' \
    --body '{"appId": "xgiUaiyy0aWrshpm", "steamId": "b1C9Al7eWrbNRE0x"}' \
    > test.out 2>&1
eval_tap $? 373 'SyncSteamDLC' test.out

#- 374 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'yYPUZHyLGQ52IjGp' \
    --body '{"xstsToken": "RJCUJpscOTkWETSJ"}' \
    > test.out 2>&1
eval_tap $? 374 'SyncXboxDLC' test.out

#- 375 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '04c5MGInO4yznh2Y' \
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'ZvvmziSSiSpXeWOG' \
    --features 'ayfRkQvoN06SpNOn,uSksfm7hcIFdkdrw,AcK2lUda9h9Fgvfh' \
    --itemId 'iLEAkA7n6516ydoR,T1qZBrdTnGrwHeWo,QXPFWFaKbDgrGkv8' \
    --limit '92' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 375 'PublicQueryUserEntitlements' test.out

#- 376 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'VwLyS4VbHJvD0lL7' \
    --appId 'aZUY9d1Idud8bjYe' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetUserAppEntitlementByAppId' test.out

#- 377 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BVMr7zHYmRE4X36K' \
    --limit '95' \
    --offset '23' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 377 'PublicQueryUserEntitlementsByAppType' test.out

#- 378 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zpF25qu98RhktX6q' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'ivWqHHGlnAnEu6EK' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetUserEntitlementByItemId' test.out

#- 379 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'YceTEqYudHlA4Axe' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'HAEV7C65Ans9SquN' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserEntitlementBySku' test.out

#- 380 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJIay5VdUdYy9Y9O' \
    --appIds 'CSmmT3WKijbqhT3u,yQRXvvcUYDeWPZ8y,hwQ0gIdj1lTJdNLm' \
    --itemIds 'AvEdEBVAU3rbkv8V,98cupW0L5WsiuITR,MSPOUfWQwr4PYf48' \
    --skus 'r66MaToxBiliy2vt,RkpqL6KrVcNz83J5,7t6OcYPQ5bk5IeuA' \
    > test.out 2>&1
eval_tap $? 380 'PublicExistsAnyUserActiveEntitlement' test.out

#- 381 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3zWFGorCbncoj5R' \
    --appId 'vEtXiKyUGdNfMiwg' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 382 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SvsTRmJsOm0wVFyH' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'FYDBPyd1jJBxbrbu' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 383 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fay9PXgEQS4871QS' \
    --ids 'msspn5sNfifK65tv,aH9jwcO48pthyYpB,JDHIIxTIGI5EssYl' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 384 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIqjJzuQ8GglVgxj' \
    --entitlementClazz 'OPTIONBOX' \
    --sku '7c3COEP4AZx70uwV' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 385 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '4XgvGTMHkXeEwuFJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f7tbq5KikDE7hWvT' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetUserEntitlement' test.out

#- 386 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '5bzcfzIpL2pWB4Xs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'drxIF6kEAmKGNEmF' \
    --body '{"options": ["PcUALNziO9Bz2wx4", "kDAm8XIleiujtv2N", "dQTYoHZogW8lBvni"], "requestId": "HdARadfSoctA3GYO", "useCount": 12}' \
    > test.out 2>&1
eval_tap $? 386 'PublicConsumeUserEntitlement' test.out

#- 387 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId '4ZOo94gS5DHLB65f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xQ06GwTmobiBnfrn' \
    --body '{"requestId": "q9kOFBWhUTPiKR3q", "useCount": 5}' \
    > test.out 2>&1
eval_tap $? 387 'PublicSellUserEntitlement' test.out

#- 388 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSZTl4UiJSCbG4Um' \
    --body '{"code": "G3TkMTzOcBIciiKw", "language": "IThc-ilCh_473", "region": "O15jqeKssQpme6ey"}' \
    > test.out 2>&1
eval_tap $? 388 'PublicRedeemCode' test.out

#- 389 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'M48tE7eJRsXNeveQ' \
    --body '{"excludeOldTransactions": true, "language": "NKg", "productId": "YmEIX40XOUoLOa7o", "receiptData": "Dz00gxcoaH6u9TVf", "region": "4DvEzpoPRiClZ6rl", "transactionId": "wX99AHMLHqguYykV"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicFulfillAppleIAPItem' test.out

#- 390 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WzNwPcvGyieBsRUd' \
    --body '{"epicGamesJwtToken": "uW5lxSlorWEGN5bP"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncEpicGamesInventory' test.out

#- 391 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSOSiiItrSrEJMBA' \
    --body '{"autoAck": true, "language": "qvy_RFnG_Qf", "orderId": "Q9o0GJMTfqRRaZoz", "packageName": "M8xCBoaS2FMwfWNC", "productId": "bN5GelVOU0hHnsCl", "purchaseTime": 13, "purchaseToken": "k6Jxh5mkmQzKg0jW", "region": "CjpGwh7pLAi5Jmzv"}' \
    > test.out 2>&1
eval_tap $? 391 'PublicFulfillGoogleIAPItem' test.out

#- 392 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'M6JFKB8ikHpl3sNR' \
    > test.out 2>&1
eval_tap $? 392 'SyncOculusConsumableEntitlements' test.out

#- 393 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'aDEC2OkXA3WqypoO' \
    --body '{"currencyCode": "w0H2s0sibQNBz81z", "price": 0.6975579653374555, "productId": "Pntxpgi7tXIcNEcG", "serviceLabel": 72}' \
    > test.out 2>&1
eval_tap $? 393 'PublicReconcilePlayStationStore' test.out

#- 394 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'igk9vamO7Q2WQwSW' \
    --body '{"currencyCode": "qSs05rjISy4B0X9A", "price": 0.5778789846564555, "productId": "dkT7UYCV8agvwOI2", "serviceLabels": [24, 65, 77]}' \
    > test.out 2>&1
eval_tap $? 394 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 395 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVmPMtpRMWSQ8Szi' \
    --body '{"appId": "1IrGidRmR5BGRJhF", "currencyCode": "wxmkGfPI3j4luXQu", "language": "gna_AcdL-bx", "price": 0.8272478202556274, "productId": "QssUUXOsXMNdvW1h", "region": "bvGenRbm3QtsY5Wa", "steamId": "KM5YY6pYrmeMIHLS"}' \
    > test.out 2>&1
eval_tap $? 395 'SyncSteamInventory' test.out

#- 396 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8egV8XhgDjbrum8U' \
    --body '{"gameId": "xcutmVg8APWKxoj6", "language": "mgQE_bPLA", "region": "xixm9X9TXNhN8y1P"}' \
    > test.out 2>&1
eval_tap $? 396 'SyncTwitchDropsEntitlement1' test.out

#- 397 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'VriIyv9kjuiAGiXx' \
    --body '{"currencyCode": "47etMikLFggYDc2F", "price": 0.6206555663747275, "productId": "bzZoeKagnKf2Yifz", "xstsToken": "vr9OqTsInGzHFpFX"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncXboxInventory' test.out

#- 398 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'YJtHtqwoIwQBeIAL' \
    --itemId 'I8JNIII4jrzrPsuM' \
    --limit '52' \
    --offset '16' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserOrders' test.out

#- 399 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BWdw2b031dm4N41M' \
    --body '{"currencyCode": "Opmm04BlZUAlYnCT", "discountedPrice": 5, "ext": {"1qD03er5mdraK47F": {}, "dxXisVlo3aVOGARF": {}, "DJcGWy826ilCxAxQ": {}}, "itemId": "UM5DyrPfBmpZIzSF", "language": "QJx_gd", "price": 59, "quantity": 22, "region": "MTsLA8vYVvrIAEeh", "returnUrl": "UV0jsjAyVgxS54NN", "sectionId": "s3XdhMbQX9D1znEW"}' \
    > test.out 2>&1
eval_tap $? 399 'PublicCreateUserOrder' test.out

#- 400 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'w9p7g4UsQCTKDh5n' \
    --userId '9yc34xF8qFllM1LT' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserOrder' test.out

#- 401 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rl4MP3Nl4T3ujvV7' \
    --userId 'W6ADLtn7oInn1Bz3' \
    > test.out 2>&1
eval_tap $? 401 'PublicCancelUserOrder' test.out

#- 402 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wM3BI51etn17OcmS' \
    --userId 'VHZ6wtPVAwgvxYxX' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUserOrderHistories' test.out

#- 403 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JTduZp1nNYHREmm1' \
    --userId 'cBuaRaGeM8yxRfej' \
    > test.out 2>&1
eval_tap $? 403 'PublicDownloadUserOrderReceipt' test.out

#- 404 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSbVgLd1FoyNFGpu' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetPaymentAccounts' test.out

#- 405 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '5r2K0IvVg5LwUygH' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId '8dzTL8azKCCNBZpw' \
    > test.out 2>&1
eval_tap $? 405 'PublicDeletePaymentAccount' test.out

#- 406 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'RFNYxx2dr6DDuDHX' \
    --language 'cfvXPXJURX3XwhOl' \
    --region 'gcpcOIxqCMSpZxby' \
    --storeId '2J9vGOUeSeGb02vD' \
    --viewId 'PUpv5VEdIG82dpIb' \
    > test.out 2>&1
eval_tap $? 406 'PublicListActiveSections' test.out

#- 407 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fxVFfdvKQVgPQw3M' \
    --chargeStatus 'CHARGED' \
    --itemId 'M6Twpwq3nLwxnJKj' \
    --limit '83' \
    --offset '85' \
    --sku 'o9fvfXF1VsikD3Ip' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 407 'PublicQueryUserSubscriptions' test.out

#- 408 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'QQiRcOtsthUwgQzN' \
    --body '{"currencyCode": "HUZ0l1FRfOjJUmCb", "itemId": "i2llksf6GA8vTt92", "language": "bM", "region": "TUGpd8KFrXKFA2gd", "returnUrl": "jQCYoE8b0CZetLfp", "source": "FNyp7375rhOmR4zF"}' \
    > test.out 2>&1
eval_tap $? 408 'PublicSubscribeSubscription' test.out

#- 409 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'joJZVKZjOD2ePKAK' \
    --itemId 'YjJMVnYj2yKqavWp' \
    > test.out 2>&1
eval_tap $? 409 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 410 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ydepM3ap069B9Okr' \
    --userId '0xJ5XRZVoxPGOLVB' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserSubscription' test.out

#- 411 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IlFgTAsXgqx3mfB5' \
    --userId 'ZwV25N7NAvZdGuyY' \
    > test.out 2>&1
eval_tap $? 411 'PublicChangeSubscriptionBillingAccount' test.out

#- 412 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'EYZE3KaGSdhEGKcp' \
    --userId '6g1A8O9N9cbYBK6X' \
    --body '{"immediate": true, "reason": "ZZaUccuBYep9n7b1"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicCancelSubscription' test.out

#- 413 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7fsblalJrwQiU3DD' \
    --userId '0xZFH1fHFLSr0O4r' \
    --excludeFree  \
    --limit '62' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUserSubscriptionBillingHistories' test.out

#- 414 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'TbFDj2L2McvCrrR7' \
    --language 'h9uKLXDaRf3pxKtJ' \
    --storeId 'bRY5luCwKrt6wn3y' \
    > test.out 2>&1
eval_tap $? 414 'PublicListViews' test.out

#- 415 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'VrRCh6j7rpv8K8fB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AeRa1R6ksxLYGkOL' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetWallet' test.out

#- 416 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'gReff5IHxLJIemNH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bzgAFjtjC7suvgIU' \
    --limit '22' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 416 'PublicListUserWalletTransactions' test.out

#- 417 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'C4jXGj2G0GZ3JBYi' \
    --baseAppId '9bBKBRpdbLCiwxOx' \
    --categoryPath '2XQn94xPqXhqeNMD' \
    --features 'GA3O5hQAl6U2g9im' \
    --includeSubCategoryItem  \
    --itemName 'VMh3i7j095rDL6lE' \
    --itemStatus 'INACTIVE' \
    --itemType 'EXTENSION' \
    --limit '57' \
    --offset '36' \
    --region '1ZIMIs1dFvYokH9t' \
    --sectionExclusive  \
    --sortBy 'displayOrder:desc,createdAt:desc,createdAt:asc' \
    --storeId '8ZZnyHKkk6Gh25tE' \
    --tags 'cX9GegDnrYz0GFpS' \
    --targetNamespace 'VdxFsXAp1roclyXl' \
    > test.out 2>&1
eval_tap $? 417 'QueryItems1' test.out

#- 418 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lFitPamSKRzDIZgS' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 418 'ImportStore1' test.out

#- 419 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'k6suS90ZbDdmjU11' \
    --body '{"itemIds": ["QIZtkSn8QRbA5V4g", "jWv1W6cqnvSuKswQ", "7vH8GScnP5QzRBY1"]}' \
    > test.out 2>&1
eval_tap $? 419 'ExportStore1' test.out

#- 420 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UrefgmVFBVz4KRCU' \
    --body '{"metadata": {"0p4jIt01gzH17Icf": {}, "JyGulmByN5rcDA3W": {}, "cv9ouALjgLZZzLU9": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "pqpajYEHs9TIkcnr", "namespace": "J64BOKqywS6DKNSe"}, "item": {"itemId": "b2UMWOgVeYkCvqq0", "itemSku": "tO15pEVG7sNihxpu", "itemType": "uL7DJCxvzZnh8oBA"}, "quantity": 21, "type": "CURRENCY"}, {"currency": {"currencyCode": "1MNCAUmdnLaVRUu5", "namespace": "VbjwPa9rYgHaxeTT"}, "item": {"itemId": "3ebuaYPNBp9wA4Lx", "itemSku": "O2n7WJQFzBCD9S03", "itemType": "D7JLsIM3VOMRvvqk"}, "quantity": 97, "type": "ITEM"}, {"currency": {"currencyCode": "0NtCxDDz5rxt6Lfl", "namespace": "BJjokLAaL4oAF2lq"}, "item": {"itemId": "x8yneWKrOy4xcg30", "itemSku": "BqC5W7g7hiwumJTI", "itemType": "3jlZPjoCdGiIP6cB"}, "quantity": 53, "type": "CURRENCY"}], "source": "GIFT", "transactionId": "1lfIR7jnetIJPGOb"}' \
    > test.out 2>&1
eval_tap $? 420 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE