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
echo "1..415"

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
    --body '{"context": {"item": {"appId": "EAxcVpFrttufHIRd", "appType": "SOFTWARE", "baseAppId": "9UzVRiXbqlAw7r6W", "boothName": "2ktQG0h5JAav5kRa", "boundItemIds": ["62WopBJHPtcDs8bB", "ZLCXLx8bbgorQeFb", "Q1g7qbPngUNB1vRo"], "categoryPath": "dwpzS6DaDpv8N7ZQ", "clazz": "VqGj6oDLjWjkY1aX", "createdAt": "1977-05-08T00:00:00Z", "description": "FcDtgOjchIua5tWE", "displayOrder": 71, "entitlementType": "DURABLE", "ext": {"JSDgY1TXp38zsCTC": {}, "rbCbPOyNQkT7NvyE": {}, "3cwyALczNIicXm7a": {}}, "features": ["c8OumKtPDKJDXn7Z", "gSrjJW2OQNOs1PXh", "T5FvdiRilZ7oFgx4"], "fresh": false, "images": [{"as": "68su8XfqlqNiTvB6", "caption": "SdAdIhUDrwoZ5Mec", "height": 7, "imageUrl": "pc1C8XfwHuKeb9l3", "smallImageUrl": "rGN9A3sNm84hddSp", "width": 69}, {"as": "cBdW19m4eu6d5tA5", "caption": "jUmiTqpyhPFdxLzF", "height": 87, "imageUrl": "d8lDR6qVNPRZYdFL", "smallImageUrl": "IAjGGJddVCvu9vx5", "width": 76}, {"as": "vkLGMS0lyuI9a2I9", "caption": "u6Vpbsx5w8hqUI06", "height": 96, "imageUrl": "SuB0y5WUlrMdI4sN", "smallImageUrl": "veabntBSxTeIv53H", "width": 66}], "itemId": "YupD391C2qtPYoka", "itemIds": ["hFjkQsfCaTmt1d67", "FXGk2s9Q0mPVo3tw", "u0MesTCf9x4rt69l"], "itemQty": {"na7qxNeIxPz6MbwL": 67, "IY69z1UaLqYSYWyt": 77, "XQ0yYoNRKd3IL5TA": 87}, "itemType": "CODE", "language": "6iiPlSC2uE4o5Vwd", "listable": false, "localExt": {"m3MqHcUmLZZbSqb8": {}, "RwNmn9HrNQy4uZAA": {}, "iE0mit9RGCCHYzUO": {}}, "longDescription": "cEdscKHPEqgA8yu7", "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 94, "duration": 22, "endDate": "1994-05-19T00:00:00Z", "itemId": "Jt4Ymos9Jcdos4fY", "itemSku": "cTVU6RBt0zYoMcHy", "itemType": "CUEXlAvxJMdalwSy"}, {"count": 23, "duration": 85, "endDate": "1975-11-14T00:00:00Z", "itemId": "bOItRMvqtlB2jJCS", "itemSku": "QT279ZZPYGu0rdlg", "itemType": "dWyOtXi3choQrpOs"}, {"count": 61, "duration": 25, "endDate": "1985-08-26T00:00:00Z", "itemId": "U5SepjChB3V0v52D", "itemSku": "lym6puQ23xoJ8aeC", "itemType": "naLpUKp44YUDjasW"}], "name": "IPUvmEejtGeoyIPa", "odds": 0.9714507862859705, "type": "REWARD", "weight": 90}, {"lootBoxItems": [{"count": 7, "duration": 37, "endDate": "1977-06-26T00:00:00Z", "itemId": "ykmoPYgc2L4jk4Lo", "itemSku": "0LSP0pf4IxjUkl53", "itemType": "5X3ateEKDpADz1x3"}, {"count": 32, "duration": 30, "endDate": "1985-08-29T00:00:00Z", "itemId": "9xv32e8c5csSovoq", "itemSku": "sZNBdte9NDUPVJf6", "itemType": "c2Z0QZxfgPubTDIH"}, {"count": 36, "duration": 83, "endDate": "1982-11-17T00:00:00Z", "itemId": "qAThuwjRHpKKTlmV", "itemSku": "r9XuoJbRFQSKVPHb", "itemType": "n4Xxtu7LQRENjEEz"}], "name": "tx1WsYSiZqan0nSB", "odds": 0.5728983498865392, "type": "REWARD", "weight": 30}, {"lootBoxItems": [{"count": 0, "duration": 57, "endDate": "1981-10-04T00:00:00Z", "itemId": "91GXlvPG6bFYReVH", "itemSku": "QipcCx9Zw5D2L7vI", "itemType": "YhGGSyEW4ZJJ42d3"}, {"count": 85, "duration": 25, "endDate": "1985-03-04T00:00:00Z", "itemId": "ddN8S48l9lyNApfl", "itemSku": "xqMrj3oZk03QXcKM", "itemType": "DYDDxHSZjtqXyJ58"}, {"count": 10, "duration": 36, "endDate": "1977-09-29T00:00:00Z", "itemId": "jX9fDmIbeZxzfTcy", "itemSku": "iuATus9hsfpFDcSD", "itemType": "G8aMVGLiBNrDjqox"}], "name": "cwgGLXpUL4pp2ncY", "odds": 0.422365902819149, "type": "REWARD_GROUP", "weight": 21}], "rollFunction": "CUSTOM"}, "maxCount": 39, "maxCountPerUser": 82, "name": "fIovmv9gsR5cJcHm", "namespace": "3SZLxoRDFuuuySj2", "optionBoxConfig": {"boxItems": [{"count": 56, "duration": 1, "endDate": "1975-06-17T00:00:00Z", "itemId": "LJE8HoRS1X2PFAAM", "itemSku": "wzHPxB1UskYs4Yw2", "itemType": "0DOqOBSC2DKHRuPM"}, {"count": 80, "duration": 22, "endDate": "1995-02-07T00:00:00Z", "itemId": "H8Yb33T5UBJCjfcn", "itemSku": "LRfxeCSz9WEi8Kll", "itemType": "oeH0JT1yduat2vQR"}, {"count": 3, "duration": 66, "endDate": "1975-02-16T00:00:00Z", "itemId": "Bfsu4jmsRE2w1yEk", "itemSku": "Lgh3tIYt4SqYUTLD", "itemType": "x9gIiDandpGT2t24"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 83, "comparison": "isLessThan", "name": "Mh5eC3IHeHSKLCa3", "predicateType": "SeasonPassPredicate", "value": "AE7WIsfmx40NLRc6", "values": ["m8heKnWhzfe2Nube", "nduEEQlULdJz4mnR", "oKFeIaFQCYoDPICp"]}, {"anyOf": 56, "comparison": "is", "name": "CAcf80zfFyabWAgI", "predicateType": "SeasonTierPredicate", "value": "hRkloqxM3gpwxcfM", "values": ["Wn3CO39PXDNxtXge", "y9XzjjI5YbsKoADk", "zJEN2VHzih3bit0V"]}, {"anyOf": 83, "comparison": "isLessThanOrEqual", "name": "3FgkXhjDzaQY3snn", "predicateType": "EntitlementPredicate", "value": "ZkP7cFdP43e5dC9X", "values": ["qU0bfoMm5cTtFWbo", "IBudfZgrbHDIDm4h", "MzF4TxodenSrUTvf"]}]}, {"operator": "or", "predicates": [{"anyOf": 4, "comparison": "isLessThanOrEqual", "name": "6IjGa23YvYmmDg7V", "predicateType": "SeasonPassPredicate", "value": "PXIuvUYTZBRujIUE", "values": ["urjh2imdb4rbkXj0", "1Tq5jyAZvkRCMNFI", "ZwsVC0gL97ZVJSPq"]}, {"anyOf": 74, "comparison": "isNot", "name": "iwv1qlYB1RSKs6gQ", "predicateType": "SeasonPassPredicate", "value": "ZGF7uYnGzpipNDig", "values": ["4nmwAft4gqkNNlWk", "NJma1MbqqZtfNWql", "D9eOziYRFOn0jJLH"]}, {"anyOf": 58, "comparison": "isNot", "name": "LxhvNXTwGBCtohLt", "predicateType": "EntitlementPredicate", "value": "7MUBG7qtPu64yAtU", "values": ["m7Ta1PsKc50Kv6ec", "RKLRkb738HGS6rDg", "MdIIlhS1fSiM9331"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isNot", "name": "mQoIXimBJehyxlNs", "predicateType": "EntitlementPredicate", "value": "nGBt4P7WnbdSJtjX", "values": ["dpCROYqUiGKXVFCm", "UTrDzZSKscfOcYu3", "7ZshZyZl5x4bRXBH"]}, {"anyOf": 31, "comparison": "isGreaterThan", "name": "ogaKt2ujQSa3Zdb6", "predicateType": "SeasonTierPredicate", "value": "UXmy0Zp6iIaTIKUk", "values": ["zwLR2AK6eXUGPJsw", "1fiP80G9Pclxcft2", "mkk9QM0NBMA9ORxp"]}, {"anyOf": 42, "comparison": "is", "name": "DpZxkrQDXuNFviMa", "predicateType": "SeasonPassPredicate", "value": "uGKHhMRWLVd3DlhL", "values": ["uIpomM8sm1MiaI1m", "Mrok0WvGYYnx4V70", "X2tJoARtdbBe7uds"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 49, "fixedTrialCycles": 9, "graceDays": 2}, "region": "ue9nzJ6fH24T805t", "regionData": [{"currencyCode": "Vg8JqU0jZpjvsugA", "currencyNamespace": "OS7u8RiWyerCSa8S", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1997-06-30T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-01-29T00:00:00Z", "discountedPrice": 55, "expireAt": "1979-03-16T00:00:00Z", "price": 36, "purchaseAt": "1998-10-10T00:00:00Z", "trialPrice": 16}, {"currencyCode": "xsB0NRsB1fPqqRRu", "currencyNamespace": "lpqpymDkQhtrHWwR", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1995-08-07T00:00:00Z", "discountedPrice": 56, "expireAt": "1991-10-31T00:00:00Z", "price": 33, "purchaseAt": "1983-12-03T00:00:00Z", "trialPrice": 68}, {"currencyCode": "wbhMssAHjapIkY9R", "currencyNamespace": "f4wP57dBZNR88YbC", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1977-01-29T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1992-07-15T00:00:00Z", "discountedPrice": 82, "expireAt": "1977-11-12T00:00:00Z", "price": 10, "purchaseAt": "1984-07-26T00:00:00Z", "trialPrice": 4}], "saleConfig": {"currencyCode": "VrjfGXZnqAQUoY1G", "price": 20}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "Zp50CnPb71ORYcmQ", "stackable": false, "status": "INACTIVE", "tags": ["g4iY9u02aCNYIWek", "aKQDOJvrTefglSs6", "U5JX8ccLjMXJRk0e"], "targetCurrencyCode": "p18lOC3mNqF7Bl0L", "targetItemId": "cghVHfPEspxwhRON", "targetNamespace": "0bc1eMbEIjowLqc3", "thumbnailUrl": "ecjXJbZDKKoxLE1Y", "title": "3Dymtj3giPg4x4yi", "updatedAt": "1992-03-11T00:00:00Z", "useCount": 1}, "namespace": "6ues1Hhhkg1yLVbL", "order": {"currency": {"currencyCode": "FzHEP8cM4NTwr0KH", "currencySymbol": "aAsmTej52WKi6tAr", "currencyType": "VIRTUAL", "decimals": 46, "namespace": "URt9plCSVq8PdH6h"}, "ext": {"JPUAc0RVwXgAgntL": {}, "MCuaXBWQi6BqPg4x": {}, "r0lCancUZGCHsZYo": {}}, "free": false}, "source": "DLC"}, "script": "R1KtOv7Zy0b65uvu", "type": "grantDays"}' \
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
    --body '{"entitlementGrantList": [{"endDate": "1989-06-18T00:00:00Z", "grantedCode": "TH8MuqIg0Czkguwu", "itemId": "JCW7EEFB67AODbi9", "itemNamespace": "BzupBsFpYc77GtRU", "language": "Id_GKNz", "quantity": 92, "region": "BsbfzqxBPNe8ae1I", "source": "OTHER", "startDate": "1981-01-06T00:00:00Z", "storeId": "nQLYXxm09wpGAbpE"}, {"endDate": "1977-03-22T00:00:00Z", "grantedCode": "DY9vLh3u6EDsUmrV", "itemId": "6kH4OotKwG3UC6XC", "itemNamespace": "nnZxF8CmQr17W65b", "language": "uwW_cogH-Bh", "quantity": 61, "region": "loFSKWM1eym5ydC6", "source": "OTHER", "startDate": "1988-03-11T00:00:00Z", "storeId": "5xCWTqUOYZENJ1QH"}, {"endDate": "1997-05-12T00:00:00Z", "grantedCode": "QxPRXH7uxBJEECQE", "itemId": "1li3Bg7Jxc9pUnZm", "itemNamespace": "vhidwCkZwqjYLfTi", "language": "dpN-WJrY_eZ", "quantity": 46, "region": "4VzW0CpoBCbyJsF5", "source": "REWARD", "startDate": "1976-01-15T00:00:00Z", "storeId": "F1c0W338HS6CBgVR"}], "userIds": ["yihYNZ84CVhziXV8", "HwSmvcvcDKF19yVR", "afCjOuSYht83AdvB"]}' \
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

#- 79 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetOculusIAPConfig' test.out

#- 80 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "fCXnlUnqxT1WsRNM", "appSecret": "ZcA92hzC7MNa8vVe"}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateOculusIAPConfig' test.out

#- 81 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteOculusIAPConfig' test.out

#- 82 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetPlayStationIAPConfig' test.out

#- 83 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "4MHX6AgMep90AyyU"}' \
    > test.out 2>&1
eval_tap $? 83 'UpdatePlaystationIAPConfig' test.out

#- 84 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'DeletePlaystationIAPConfig' test.out

#- 85 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetSteamIAPConfig' test.out

#- 86 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "JyAK5PRMRMwdvl0h", "publisherAuthenticationKey": "v6g62GxBW2tQF5tk"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateSteamIAPConfig' test.out

#- 87 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeleteSteamIAPConfig' test.out

#- 88 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetTwitchIAPConfig' test.out

#- 89 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "TjgJaMYvNQOsDa4b", "clientSecret": "kcgepqtxjbrztee7", "organizationId": "QLTGAak7Kaol01DK"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateTwitchIAPConfig' test.out

#- 90 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteTwitchIAPConfig' test.out

#- 91 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetXblIAPConfig' test.out

#- 92 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "97D2xnik42miteR5"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdateXblIAPConfig' test.out

#- 93 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'DeleteXblAPConfig' test.out

#- 94 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'eQAe1rzmmgqBPRmd' \
    > test.out 2>&1
eval_tap $? 94 'UpdateXblBPCertFile' test.out

#- 95 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '6mO4oI8KDqebm83r' \
    --itemId 'aNBJ5y7axEkvI4ox' \
    --itemType 'SEASON' \
    --endTime 'EDxGiBnNbn0zaf7C' \
    --startTime 'aOSlHXrUSA6sMJzA' \
    > test.out 2>&1
eval_tap $? 95 'DownloadInvoiceDetails' test.out

#- 96 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '5mtqISQ83TTbtefX' \
    --itemId 'WznDe4LQdXfFBii2' \
    --itemType 'OPTIONBOX' \
    --endTime 'AMEX5RMjBFVZGYzQ' \
    --startTime 'qV8d9mDdUIoiIJFN' \
    > test.out 2>&1
eval_tap $? 96 'GenerateInvoiceSummary' test.out

#- 97 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xuNOmUSWw18T1IxV' \
    --body '{"categoryPath": "WCxdvPL9e4P01vxP", "targetItemId": "8xj1LyEirURERnEM", "targetNamespace": "zpImW6sjAHyCK5tN"}' \
    > test.out 2>&1
eval_tap $? 97 'SyncInGameItem' test.out

#- 98 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'anGBrkzUvck3xTtm' \
    --body '{"appId": "OFMebS4AdlNzwog2", "appType": "DLC", "baseAppId": "hErkNhNcECWwchW6", "boothName": "zL9SkbLlrNXnGanM", "categoryPath": "azb8jvRWenURH48a", "clazz": "JuALEcSqcE15u6D3", "displayOrder": 61, "entitlementType": "DURABLE", "ext": {"jOsrs3CUYATdqnQG": {}, "bqiqOkNeATj7eGjo": {}, "dd7CcJUrI6MAugK5": {}}, "features": ["sK5LOq4ft5jGcMIC", "PUYnfG6jl9U4jRet", "kypNrp2nFe9FmN86"], "images": [{"as": "eIMgzISomCsodJrh", "caption": "QW41q2OspCZbt3Ut", "height": 1, "imageUrl": "H8uenbC5CphgMwee", "smallImageUrl": "xsIAP5vHLjBJ9iqM", "width": 5}, {"as": "vJ4UMS93yOxNInDB", "caption": "yhnoluO6ti0QP2ss", "height": 17, "imageUrl": "kDiJq4xQye7HqnVK", "smallImageUrl": "3YVeOWs9mfVQh3jL", "width": 57}, {"as": "ifF8y959anrNSley", "caption": "wHbHig6IKWVZ77Ke", "height": 89, "imageUrl": "9DpSjb39ukcR6c2E", "smallImageUrl": "2r3vk3IfAKEbqcNX", "width": 92}], "itemIds": ["BDh9ZFP1OW0nXOEr", "QPS4VsRoYIK69yg9", "ADCGiXaLs2xjHkin"], "itemQty": {"OD975nARHCmhNHSX": 41, "cVNX3ahvxw9gwwhT": 28, "kxncuD3QxCXMd00Y": 56}, "itemType": "CODE", "listable": true, "localizations": {"ndhhZhwAiLsZs4pm": {"description": "LDIQch4IjDq9aT3q", "localExt": {"ZyI0rYsWucAkXsVJ": {}, "bXi7eRZa7WwIc895": {}, "ImqK6tVsaUq3stUh": {}}, "longDescription": "5J5Z9GiBiSAylX5c", "title": "S0IeHpWCugmfOL0Q"}, "QpxsuD8PGqku59eF": {"description": "JrOXyDYz9vMUOPG0", "localExt": {"iHDT8QbF7gHPTPQb": {}, "vLt2NRqJGIKzLyH1": {}, "y72L13Ornyx34luL": {}}, "longDescription": "dvtsTKXMjiw6gYPv", "title": "fn2Qt9iyq3Nyk8nc"}, "u2Z3eDHH9WaVO4iK": {"description": "hDcJ7TCcNIsQ3Pup", "localExt": {"pUxDSK8aOTGMudcx": {}, "lCV4cNbJGQ57lPdi": {}, "npjS2DRfGt9GlyZV": {}}, "longDescription": "Q4X67tPZSTpPq3xj", "title": "rElvvDgw0ag7kSWE"}}, "lootBoxConfig": {"rewardCount": 69, "rewards": [{"lootBoxItems": [{"count": 17, "duration": 33, "endDate": "1996-04-05T00:00:00Z", "itemId": "kGOdC6ItxDT8p4n4", "itemSku": "XCFkD1AJLCwszbZx", "itemType": "uHSgDOK8bjoF7bL2"}, {"count": 58, "duration": 49, "endDate": "1989-02-04T00:00:00Z", "itemId": "btZTGJpqgl2IzNXG", "itemSku": "TuQPIDpor7t1aJLN", "itemType": "Nz6QIVC9Mfuc8VOs"}, {"count": 27, "duration": 78, "endDate": "1977-03-12T00:00:00Z", "itemId": "nlVljdWYmELe74p3", "itemSku": "8vumnxAnYBTxaTIz", "itemType": "0jcgDI8Pkz96vd80"}], "name": "msqIm5bufnBqrpLe", "odds": 0.25932383457217567, "type": "PROBABILITY_GROUP", "weight": 46}, {"lootBoxItems": [{"count": 43, "duration": 98, "endDate": "1981-03-05T00:00:00Z", "itemId": "L28FPwTiXfLcxDC9", "itemSku": "Ynd02mECIQhfIhHt", "itemType": "ADUQ9zimQTQT95pF"}, {"count": 73, "duration": 61, "endDate": "1995-03-03T00:00:00Z", "itemId": "AJsyAfeKOufV4f15", "itemSku": "NohXu6opxQGRt6Pq", "itemType": "lkL0diRhLC10ih2E"}, {"count": 87, "duration": 77, "endDate": "1973-08-09T00:00:00Z", "itemId": "Y3XCv4hdOa6FdZhN", "itemSku": "Md1onFjGRbxtABPX", "itemType": "DmgNEJBhgGq5GIDh"}], "name": "NC66szbCCf73IFbR", "odds": 0.17433298083147464, "type": "REWARD_GROUP", "weight": 49}, {"lootBoxItems": [{"count": 90, "duration": 82, "endDate": "1994-10-07T00:00:00Z", "itemId": "A0FqfhnaB3YxKNdO", "itemSku": "TacCcJfIfXshuLUk", "itemType": "5WdpxjZx5noXPhPU"}, {"count": 94, "duration": 3, "endDate": "1989-11-21T00:00:00Z", "itemId": "bonoucNmzwOZOK56", "itemSku": "sDkci5rZ8iMlOuks", "itemType": "QJCiRFiZWwJ7NrTb"}, {"count": 30, "duration": 94, "endDate": "1975-08-19T00:00:00Z", "itemId": "jlvDF8qBWCQ9dLWY", "itemSku": "yS8zdhMeBXH8x6Hd", "itemType": "VfZVDAiU6iJOF7JK"}], "name": "ZFNk2NKy59X8iOg2", "odds": 0.29556719804881926, "type": "PROBABILITY_GROUP", "weight": 56}], "rollFunction": "DEFAULT"}, "maxCount": 18, "maxCountPerUser": 73, "name": "CoeC5weXJl7PeiMH", "optionBoxConfig": {"boxItems": [{"count": 97, "duration": 53, "endDate": "1975-08-06T00:00:00Z", "itemId": "dVej8N2yv6VTnOK7", "itemSku": "xAvM7tuL81lsR7xx", "itemType": "SVp3Gd2TK0HzYviT"}, {"count": 14, "duration": 18, "endDate": "1996-01-12T00:00:00Z", "itemId": "mx82JVBRLPZ6Iz8t", "itemSku": "ne5dbguBF6Gsvvdl", "itemType": "8jHz9x7XZIjU4IK9"}, {"count": 22, "duration": 47, "endDate": "1991-05-01T00:00:00Z", "itemId": "LaZaMphKCqTq3EVh", "itemSku": "eJjoEEXBLIxGnNuh", "itemType": "oJM3WWPvvCiCf33V"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 75, "fixedTrialCycles": 7, "graceDays": 83}, "regionData": {"qQpoGkUWNizk5UcP": [{"currencyCode": "AGv6c1ESC6hZYTYZ", "currencyNamespace": "bzf5aANNNs5kgSZZ", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1988-05-11T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1971-01-18T00:00:00Z", "expireAt": "1980-08-01T00:00:00Z", "price": 55, "purchaseAt": "1991-05-05T00:00:00Z", "trialPrice": 67}, {"currencyCode": "mWJO5vzzXZj08a6K", "currencyNamespace": "1XRVfriSpPFnZBJZ", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1986-12-21T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1985-09-05T00:00:00Z", "expireAt": "1979-03-09T00:00:00Z", "price": 51, "purchaseAt": "1995-02-07T00:00:00Z", "trialPrice": 53}, {"currencyCode": "a2LrnpZxNnLRH36b", "currencyNamespace": "qS2oFY76PU1AziBO", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1980-08-05T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1987-01-30T00:00:00Z", "expireAt": "1972-03-29T00:00:00Z", "price": 94, "purchaseAt": "1985-01-19T00:00:00Z", "trialPrice": 43}], "os5uVJ0BJfZ0jvA5": [{"currencyCode": "4CSqZFDsO1skRjOU", "currencyNamespace": "1SMfQVQa6blj9Rdd", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1991-10-19T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1997-06-10T00:00:00Z", "expireAt": "1991-04-07T00:00:00Z", "price": 26, "purchaseAt": "1992-10-22T00:00:00Z", "trialPrice": 97}, {"currencyCode": "9rWynp1ck1vT90C6", "currencyNamespace": "o86cSRL9cgbUmulh", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1972-07-15T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1976-01-04T00:00:00Z", "expireAt": "1997-09-14T00:00:00Z", "price": 74, "purchaseAt": "1990-05-21T00:00:00Z", "trialPrice": 24}, {"currencyCode": "EWFw9GYxjiiOQAD7", "currencyNamespace": "7ci0vfWVZoRRMPi5", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1994-07-16T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1989-01-06T00:00:00Z", "expireAt": "1989-07-24T00:00:00Z", "price": 0, "purchaseAt": "1985-04-16T00:00:00Z", "trialPrice": 16}], "yI6ulKNKoXa0dgx1": [{"currencyCode": "JgjC56pda3YhtQxp", "currencyNamespace": "CYME6x21pdX2QSPA", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1980-06-30T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1978-04-27T00:00:00Z", "expireAt": "1986-11-04T00:00:00Z", "price": 98, "purchaseAt": "1977-06-10T00:00:00Z", "trialPrice": 66}, {"currencyCode": "Cdrxw1KOPhuvHuYr", "currencyNamespace": "GWDK41uMOC0mRvSo", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1987-03-23T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1973-03-25T00:00:00Z", "expireAt": "1971-06-13T00:00:00Z", "price": 19, "purchaseAt": "1987-02-11T00:00:00Z", "trialPrice": 13}, {"currencyCode": "wnJDg9Q3WXiydCOI", "currencyNamespace": "nVolsr6CHmj763vL", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1981-02-15T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1986-06-29T00:00:00Z", "expireAt": "1989-04-12T00:00:00Z", "price": 93, "purchaseAt": "1973-09-15T00:00:00Z", "trialPrice": 17}]}, "saleConfig": {"currencyCode": "pvtDtetoQVFL8LNW", "price": 99}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "SFZ0LpupEi5DbkVs", "stackable": false, "status": "INACTIVE", "tags": ["vkCPfKofwXOIZZQA", "Jza84lKKmVOaTS6x", "BbNrSUAW2ak7ISDr"], "targetCurrencyCode": "BVg6NuDZvPb1kuUf", "targetNamespace": "NfUDe4g7q6PHEaqb", "thumbnailUrl": "zHvDDl1jiLw3XMGB", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 98 'CreateItem' test.out

#- 99 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'GVU7Exlkmc4xYiLj' \
    --appId 'LyZrXr9Bhtzn8jAd' \
    > test.out 2>&1
eval_tap $? 99 'GetItemByAppId' test.out

#- 100 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'n6xBhrciryLm67rk' \
    --baseAppId 'adH5Y41SLjCPrFa0' \
    --categoryPath '5Xl5TPC5GODS44bm' \
    --features 'm7jPdKLddfdsUqjX' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --limit '53' \
    --offset '89' \
    --region 'W1QqxnWR5sheLgsA' \
    --sortBy 'updatedAt:desc,displayOrder:desc,name' \
    --storeId 'fLWoQ5nuJhatQPxR' \
    --tags '7dvBVC5zgOKLTDmH' \
    --targetNamespace 'e8c1eJ9sde7Ryt4u' \
    > test.out 2>&1
eval_tap $? 100 'QueryItems' test.out

#- 101 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'dIv22M18uux9xBom,QFPFWy5cwNPI6aFo,0MVwDZCIXFNEL3uW' \
    > test.out 2>&1
eval_tap $? 101 'ListBasicItemsByFeatures' test.out

#- 102 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'VRz3V7YbJM3bNLWH' \
    --sku 'AbCZixe2cQ6O30lp' \
    > test.out 2>&1
eval_tap $? 102 'GetItemBySku' test.out

#- 103 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zcBQMAEcNcJqrKxn' \
    --populateBundle  \
    --region 'MzSYoc4ZjiMY4H34' \
    --storeId 'B6wVd8ipcKDwQeUW' \
    --sku 'tjCC2UH6jzMO3Afm' \
    > test.out 2>&1
eval_tap $? 103 'GetLocaleItemBySku' test.out

#- 104 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'OS5mQNyRPZFPNP56' \
    --sku 'l1AT6OLKmZhCZxxP' \
    > test.out 2>&1
eval_tap $? 104 'GetItemIdBySku' test.out

#- 105 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'PdPwOtEuWBSO2jJe,pUnEEgja2mIE2kLT,nJwc5XmkCuL5W4tK' \
    --storeId 't6G3j9LYdG7xVPqB' \
    > test.out 2>&1
eval_tap $? 105 'GetBulkItemIdBySkus' test.out

#- 106 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'qe9RDQMBSYAFLqp8' \
    --region 'PF5hCcoukWpnbz4y' \
    --storeId 's7j6lxuU3u2HEG0q' \
    --itemIds 'fKegvFTD1sPykS8Y' \
    > test.out 2>&1
eval_tap $? 106 'BulkGetLocaleItems' test.out

#- 107 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetAvailablePredicateTypes' test.out

#- 108 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'LmwtYgWGcA0h4G1L' \
    --body '{"itemIds": ["Z1HaX5UBMbsF44VT", "sLDRzdq22cbnyK3g", "gFDh2kaZP7pnnVfx"]}' \
    > test.out 2>&1
eval_tap $? 108 'ValidateItemPurchaseCondition' test.out

#- 109 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Pwc259HF9ejHaILQ' \
    --body '{"changes": [{"itemIdentities": ["ruAuYyJLYGqMv824", "ouSgkpK70uJmUL0u", "zElixc023dIvDiA0"], "itemIdentityType": "ITEM_SKU", "regionData": {"sj1AKGBjnHmaAu4Y": [{"currencyCode": "K87DYAWWcbcbGWmK", "currencyNamespace": "gE8CZ4AELr5lraa5", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1989-12-04T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1976-08-21T00:00:00Z", "discountedPrice": 40, "expireAt": "1975-10-18T00:00:00Z", "price": 9, "purchaseAt": "1974-02-20T00:00:00Z", "trialPrice": 65}, {"currencyCode": "AiwKadEoIVmprwPs", "currencyNamespace": "a9YD92CX0rITajpw", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1993-02-01T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1988-04-18T00:00:00Z", "discountedPrice": 93, "expireAt": "1978-05-16T00:00:00Z", "price": 35, "purchaseAt": "1993-01-08T00:00:00Z", "trialPrice": 55}, {"currencyCode": "zBB9ZFgJbQ3Fj1um", "currencyNamespace": "x4ItzkMJ7cudf4r9", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1987-10-10T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1978-05-23T00:00:00Z", "discountedPrice": 2, "expireAt": "1975-04-22T00:00:00Z", "price": 5, "purchaseAt": "1998-10-06T00:00:00Z", "trialPrice": 8}], "OJPS3lJ80YJ41U4o": [{"currencyCode": "oQ980ywmg1pWpWit", "currencyNamespace": "1QC7FKe0fnHUlmU1", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-07-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-06-06T00:00:00Z", "price": 46, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 11}, {"currencyCode": "TX2bamSCvX1nwvSW", "currencyNamespace": "dDwD7WJHzgNZUKsI", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1981-10-28T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1985-12-23T00:00:00Z", "discountedPrice": 46, "expireAt": "1999-08-13T00:00:00Z", "price": 53, "purchaseAt": "1972-11-16T00:00:00Z", "trialPrice": 60}, {"currencyCode": "yTsftKqnsIJctAdx", "currencyNamespace": "yZVKHA9DkaSOWgtg", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1989-07-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1994-03-28T00:00:00Z", "discountedPrice": 24, "expireAt": "1988-09-03T00:00:00Z", "price": 33, "purchaseAt": "1971-10-19T00:00:00Z", "trialPrice": 97}], "qzoKMRMG541PAiNj": [{"currencyCode": "ULsx4SnKNXLMUaDS", "currencyNamespace": "wwQlnNRZJHBSB4fZ", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1987-03-25T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1995-06-10T00:00:00Z", "discountedPrice": 38, "expireAt": "1999-09-10T00:00:00Z", "price": 10, "purchaseAt": "1977-03-17T00:00:00Z", "trialPrice": 21}, {"currencyCode": "8YRvae4f4lhBPbar", "currencyNamespace": "bWEm8bVtZcfVCPdQ", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1975-04-12T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1992-06-23T00:00:00Z", "discountedPrice": 74, "expireAt": "1981-02-24T00:00:00Z", "price": 54, "purchaseAt": "1974-09-20T00:00:00Z", "trialPrice": 60}, {"currencyCode": "TVYelIlGJg9wdc8b", "currencyNamespace": "ihhWjfZpfcFBUsnn", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1989-04-04T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1977-08-30T00:00:00Z", "discountedPrice": 37, "expireAt": "1998-01-22T00:00:00Z", "price": 16, "purchaseAt": "1988-09-08T00:00:00Z", "trialPrice": 29}]}}, {"itemIdentities": ["RIJz1eI7Q5pu9Put", "Lf6IrvZoBGQbO4S3", "rURGWUzPAE6SdV4D"], "itemIdentityType": "ITEM_ID", "regionData": {"JoF2FI3vyyqRzc20": [{"currencyCode": "O7FdsJP1G9tyBTfE", "currencyNamespace": "RXdvgD1Qf7Ot2DkU", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1999-09-23T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1974-02-09T00:00:00Z", "discountedPrice": 47, "expireAt": "1982-04-17T00:00:00Z", "price": 56, "purchaseAt": "1972-12-24T00:00:00Z", "trialPrice": 44}, {"currencyCode": "ejmeZtzT0qj0ltsq", "currencyNamespace": "fiZrthVvyX0OCKDJ", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1999-10-21T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1997-11-11T00:00:00Z", "discountedPrice": 38, "expireAt": "1995-05-27T00:00:00Z", "price": 7, "purchaseAt": "1995-01-21T00:00:00Z", "trialPrice": 8}, {"currencyCode": "wSSgxCu8zru1DhGA", "currencyNamespace": "YOHR5BWa9VzIkaQE", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1998-02-21T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1982-02-03T00:00:00Z", "discountedPrice": 85, "expireAt": "1990-05-25T00:00:00Z", "price": 24, "purchaseAt": "1978-11-20T00:00:00Z", "trialPrice": 55}], "sY3SsTnDQY7kKU2u": [{"currencyCode": "06Q4veujxtyQENvJ", "currencyNamespace": "rBCqeg67d4RWOqO4", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1999-03-03T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1981-10-17T00:00:00Z", "discountedPrice": 81, "expireAt": "1988-12-17T00:00:00Z", "price": 50, "purchaseAt": "1990-09-14T00:00:00Z", "trialPrice": 51}, {"currencyCode": "Am3DQht4JwnPS2ur", "currencyNamespace": "JqerobWMZGVL5KLT", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1971-01-12T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1996-11-19T00:00:00Z", "discountedPrice": 23, "expireAt": "1975-07-04T00:00:00Z", "price": 6, "purchaseAt": "1971-08-19T00:00:00Z", "trialPrice": 49}, {"currencyCode": "aKSLCgOOPXM6XTUh", "currencyNamespace": "2dJ90yqHDNacl4F9", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1986-03-31T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1994-09-12T00:00:00Z", "discountedPrice": 68, "expireAt": "1982-08-15T00:00:00Z", "price": 58, "purchaseAt": "1996-03-11T00:00:00Z", "trialPrice": 69}], "SEAzT7TOpyiuvvQU": [{"currencyCode": "m29Iacq4XRLaA643", "currencyNamespace": "nTMtXSAyejnny0Ju", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1971-03-02T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1992-12-15T00:00:00Z", "discountedPrice": 41, "expireAt": "1982-08-12T00:00:00Z", "price": 57, "purchaseAt": "1998-08-09T00:00:00Z", "trialPrice": 74}, {"currencyCode": "M6IHy7EEvHyLmcvr", "currencyNamespace": "ZZOdwe1x8RjU6Bi8", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1986-09-23T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1998-09-20T00:00:00Z", "discountedPrice": 38, "expireAt": "1989-04-24T00:00:00Z", "price": 55, "purchaseAt": "1982-08-12T00:00:00Z", "trialPrice": 13}, {"currencyCode": "q2SimQQoLbe5YOJv", "currencyNamespace": "xGRxUzrTwagH7BMT", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1996-07-27T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1973-01-29T00:00:00Z", "discountedPrice": 81, "expireAt": "1990-09-15T00:00:00Z", "price": 62, "purchaseAt": "1995-01-28T00:00:00Z", "trialPrice": 56}]}}, {"itemIdentities": ["JFAy2JTllJkRGB8j", "qJEd6eqqsBVyONV0", "JRtozI0jpliCFQ6W"], "itemIdentityType": "ITEM_ID", "regionData": {"wBXw5uBYeQZOzATN": [{"currencyCode": "SV9E9yyNb7yaLXzA", "currencyNamespace": "VYymOuhCkZu4htrs", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1987-02-03T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1988-10-15T00:00:00Z", "discountedPrice": 65, "expireAt": "1988-12-26T00:00:00Z", "price": 15, "purchaseAt": "1978-09-20T00:00:00Z", "trialPrice": 45}, {"currencyCode": "XR2dYprPmbpuptEC", "currencyNamespace": "Gd5cdXC2Sesc6y68", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1975-02-19T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1974-08-15T00:00:00Z", "discountedPrice": 83, "expireAt": "1996-09-04T00:00:00Z", "price": 22, "purchaseAt": "1972-09-28T00:00:00Z", "trialPrice": 17}, {"currencyCode": "47gD5i2Ni6AnWn3N", "currencyNamespace": "dEPhNHSH7eKDfRcn", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1986-06-16T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1971-07-15T00:00:00Z", "discountedPrice": 27, "expireAt": "1986-12-24T00:00:00Z", "price": 74, "purchaseAt": "1995-05-17T00:00:00Z", "trialPrice": 87}], "2qEAuJbpZSrcbc4L": [{"currencyCode": "WfKaY5c1tP5TDuI5", "currencyNamespace": "f6m4KC07CnsZe32h", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1986-09-13T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1985-06-12T00:00:00Z", "discountedPrice": 63, "expireAt": "1984-07-12T00:00:00Z", "price": 1, "purchaseAt": "1991-02-02T00:00:00Z", "trialPrice": 56}, {"currencyCode": "XZOYwbwjMNdxKWlB", "currencyNamespace": "fnRyFS0Ed7gTM5AV", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1980-12-23T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1989-12-13T00:00:00Z", "discountedPrice": 27, "expireAt": "1975-03-20T00:00:00Z", "price": 60, "purchaseAt": "1994-07-08T00:00:00Z", "trialPrice": 5}, {"currencyCode": "N7HDPTUEDPN1Kb4U", "currencyNamespace": "TPWDXTSb55g8LSTs", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1978-02-13T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1992-10-28T00:00:00Z", "discountedPrice": 23, "expireAt": "1977-09-24T00:00:00Z", "price": 23, "purchaseAt": "1999-12-01T00:00:00Z", "trialPrice": 19}], "rf6obIdnI6Ag7eUY": [{"currencyCode": "cYJ4QzXCmqr6gmPG", "currencyNamespace": "aHP5SVPvRLiDi0mN", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1985-04-26T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1982-07-12T00:00:00Z", "discountedPrice": 33, "expireAt": "1990-02-05T00:00:00Z", "price": 45, "purchaseAt": "1979-08-14T00:00:00Z", "trialPrice": 92}, {"currencyCode": "uT30EYeRj17xGhaB", "currencyNamespace": "KoUfiHjGmCyPsKCJ", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1998-04-21T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1976-01-18T00:00:00Z", "discountedPrice": 44, "expireAt": "1983-02-20T00:00:00Z", "price": 43, "purchaseAt": "1985-01-01T00:00:00Z", "trialPrice": 68}, {"currencyCode": "gF2cSuztsJ5tj64g", "currencyNamespace": "V7nmDk29mcjSuz9v", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1992-12-09T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1975-05-18T00:00:00Z", "discountedPrice": 33, "expireAt": "1992-07-26T00:00:00Z", "price": 39, "purchaseAt": "1976-12-17T00:00:00Z", "trialPrice": 24}]}}]}' \
    > test.out 2>&1
eval_tap $? 109 'BulkUpdateRegionData' test.out

#- 110 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '81' \
    --offset '16' \
    --sortBy 'eKAGiZFCftT0RWEC' \
    --storeId 'djWYrnulxcCKAru8' \
    --keyword 'pOaAVLDB4k3Jwkda' \
    --language 'xR7GJpYmuYCPG181' \
    > test.out 2>&1
eval_tap $? 110 'SearchItems' test.out

#- 111 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '33' \
    --offset '1' \
    --sortBy 'updatedAt:desc,displayOrder:asc,displayOrder:desc' \
    --storeId 'A5DydC2D8UT6KOc4' \
    > test.out 2>&1
eval_tap $? 111 'QueryUncategorizedItems' test.out

#- 112 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'VPDUR9ayazqXRqeg' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'IUicYXXzxsBFrUs9' \
    > test.out 2>&1
eval_tap $? 112 'GetItem' test.out

#- 113 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'BYp6TgCejBd5o7iT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ST7R3KbbQGERMNpq' \
    --body '{"appId": "Wb51y5RUzvMfTkPy", "appType": "SOFTWARE", "baseAppId": "fGvTGgfLKsg0b1Bq", "boothName": "78cE5O5pmPnbiPJ9", "categoryPath": "j4vxmbH3rVaauufx", "clazz": "kPHElug48TgfNu0r", "displayOrder": 33, "entitlementType": "CONSUMABLE", "ext": {"XUOyToLPIREGIKlJ": {}, "t3EP9kKwkENQ8VOH": {}, "GwbADMfuOmh0lciR": {}}, "features": ["hVZ2DeoODXMzLSrz", "MoCimJySocRvUWDO", "oiBnYi5UWs3tYlYe"], "images": [{"as": "rFZKPNoN9AWtLK9T", "caption": "Fgi9j2XMh9Wpifqj", "height": 82, "imageUrl": "88NzxrDKVpULjjiw", "smallImageUrl": "3NeVG4DJi9DaMrc0", "width": 100}, {"as": "DWXT59SRu0YqUxKD", "caption": "c84OMIzvTScdbKBs", "height": 53, "imageUrl": "nUNcwjr7gSGhnfuF", "smallImageUrl": "4WZiQVICVpWd3UM0", "width": 19}, {"as": "gMXhdf3juXW4JprI", "caption": "b3CJCAtvSG8Cfa9d", "height": 53, "imageUrl": "qdZFLbZEHxsDxeR6", "smallImageUrl": "d7r1SQw80JfMpPrS", "width": 34}], "itemIds": ["rHNZWUsq5lQo2jy2", "9EJigqYhyVhURx1y", "PeczRpdk0HATGylx"], "itemQty": {"2JG2KNGfhzfCTxxr": 37, "CKoISyXtHzoWGdYo": 14, "aCDHN9mVug2zkVf6": 75}, "itemType": "SEASON", "listable": false, "localizations": {"6FVKlbYHtbPtaxva": {"description": "gSlpGgVTF6VeDAPO", "localExt": {"GBwweyFfXEOEAEtb": {}, "ag82KgBgyCd5vjkf": {}, "z3eR4DtNp129hzBw": {}}, "longDescription": "3xLUcCEt0DzmkJq1", "title": "sml5bYt76BNsi4gi"}, "R9434WpKKdzxoufC": {"description": "NlFoOcWQQy4bjmQe", "localExt": {"EweoBHTdwAk7ZQnb": {}, "qY1cQwVEtAr5kKKA": {}, "o9MM2Cqm84jVi9kI": {}}, "longDescription": "pqgrzpUkNOBWydXV", "title": "0Fi02aFr8CDapjwN"}, "Ol4k8rVNrm8drv8Q": {"description": "D2JOe2Ntz7EFvowP", "localExt": {"gIGuetxFMqXCQMAq": {}, "Q2ZRGzNtrThFa9XU": {}, "8mosluiHZJ7O8sAQ": {}}, "longDescription": "32wj9uaDzsr9xYiW", "title": "RuuzQJiLc1eI9w3J"}}, "lootBoxConfig": {"rewardCount": 62, "rewards": [{"lootBoxItems": [{"count": 32, "duration": 14, "endDate": "1972-07-10T00:00:00Z", "itemId": "EJsPoaIbYz8cK5jl", "itemSku": "pJdre5ur6yvWJDdv", "itemType": "M7T7PX2vamIRZHzs"}, {"count": 71, "duration": 17, "endDate": "1997-04-19T00:00:00Z", "itemId": "OCUoiCXNjrdQL2jd", "itemSku": "x1eIba1sB0HsJ06D", "itemType": "zfbzRYt4OVUyumBe"}, {"count": 71, "duration": 25, "endDate": "1979-03-18T00:00:00Z", "itemId": "dQGZC5kM03HHijsQ", "itemSku": "Rj7N8IAjmsonjj0Z", "itemType": "R50BQ1U6aFD3O2kX"}], "name": "QSc58zgZVl4gIF7v", "odds": 0.9024158618218886, "type": "REWARD", "weight": 80}, {"lootBoxItems": [{"count": 2, "duration": 12, "endDate": "1997-06-10T00:00:00Z", "itemId": "WAU6E92nHJzvw7tn", "itemSku": "YtGfv0EJyjBu4Ezw", "itemType": "RjD7jmQJeFPghqam"}, {"count": 91, "duration": 35, "endDate": "1972-06-03T00:00:00Z", "itemId": "5y0X48eT7Mluexk8", "itemSku": "7b9Z5BTsEA3EdmW8", "itemType": "saabP4xRowfNojzP"}, {"count": 64, "duration": 71, "endDate": "1992-10-21T00:00:00Z", "itemId": "v0prR3OEey0MkZwS", "itemSku": "6TYwNN3UYhic03qG", "itemType": "Eg5fNzBVrjo3g8Cf"}], "name": "Rwtyl1HeT7VEPgG4", "odds": 0.8427098833460808, "type": "REWARD_GROUP", "weight": 62}, {"lootBoxItems": [{"count": 51, "duration": 100, "endDate": "1996-07-26T00:00:00Z", "itemId": "sw8v5peiuxoBJATa", "itemSku": "uyD3XCXVMiyEvMf9", "itemType": "yilUEujk6oqYo1HQ"}, {"count": 52, "duration": 93, "endDate": "1975-09-18T00:00:00Z", "itemId": "cbuL2S3RiW8dLTCB", "itemSku": "fGUdVEdvdQL7sVwc", "itemType": "Z2PofaJoSqtrEOqx"}, {"count": 69, "duration": 67, "endDate": "1997-02-06T00:00:00Z", "itemId": "PKdbabJIkNnt9P1T", "itemSku": "km08luh4dpPRMDbU", "itemType": "XBWTbpAogG2wlZkL"}], "name": "huU5FI8NijFI0GKw", "odds": 0.5732928433661201, "type": "REWARD", "weight": 45}], "rollFunction": "CUSTOM"}, "maxCount": 37, "maxCountPerUser": 4, "name": "lsAMy2Zp2UAGxHnm", "optionBoxConfig": {"boxItems": [{"count": 91, "duration": 44, "endDate": "1983-12-17T00:00:00Z", "itemId": "vkG9UR5q9neoW6JB", "itemSku": "cGp9Rx2RfcRhXpme", "itemType": "eHdvphas9S7ivHEo"}, {"count": 76, "duration": 30, "endDate": "1971-10-13T00:00:00Z", "itemId": "UMM47f1UreUpxEkX", "itemSku": "IbE1ETzRJZKMavu4", "itemType": "Ul2IaieEbPSE7TGk"}, {"count": 9, "duration": 68, "endDate": "1990-06-02T00:00:00Z", "itemId": "px4kEWYkO6KrKUMh", "itemSku": "JrASBh61hmWKSSrF", "itemType": "35anDGvur19V18oI"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 95, "fixedTrialCycles": 15, "graceDays": 74}, "regionData": {"oS6a9oe0JaXFpff2": [{"currencyCode": "8uYbe4Cf2HEHvVev", "currencyNamespace": "hISjbtBJUK5fE3Ou", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1992-12-25T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1996-12-01T00:00:00Z", "expireAt": "1973-09-21T00:00:00Z", "price": 82, "purchaseAt": "1996-01-11T00:00:00Z", "trialPrice": 99}, {"currencyCode": "8SbLOa21DiSFsm0X", "currencyNamespace": "XQJWszvTQEuALzDN", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1993-02-12T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1976-10-07T00:00:00Z", "expireAt": "1971-08-18T00:00:00Z", "price": 60, "purchaseAt": "1996-03-31T00:00:00Z", "trialPrice": 65}, {"currencyCode": "lwzTRHak1MXxj7Es", "currencyNamespace": "rg7900nml5BidsK9", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1985-09-24T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1979-07-28T00:00:00Z", "expireAt": "1994-02-27T00:00:00Z", "price": 82, "purchaseAt": "1995-01-14T00:00:00Z", "trialPrice": 27}], "XXTUIggoH89QNmI1": [{"currencyCode": "7UDb19R6H7r1ta3m", "currencyNamespace": "7jK5pxe82pgFiAS6", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1975-07-10T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1971-07-28T00:00:00Z", "expireAt": "1994-04-11T00:00:00Z", "price": 5, "purchaseAt": "1992-05-22T00:00:00Z", "trialPrice": 83}, {"currencyCode": "KrKEPGSAcong6eNE", "currencyNamespace": "RUf8kjci1Ctccv9G", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1972-06-13T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1977-01-23T00:00:00Z", "expireAt": "1986-01-07T00:00:00Z", "price": 58, "purchaseAt": "1978-06-19T00:00:00Z", "trialPrice": 70}, {"currencyCode": "Cqf0lm6WBkIzjoSV", "currencyNamespace": "31tvmMB6jzrpRGES", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1978-09-29T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1996-09-29T00:00:00Z", "expireAt": "1992-03-09T00:00:00Z", "price": 80, "purchaseAt": "1985-05-12T00:00:00Z", "trialPrice": 97}], "xj4hBgVY3YAxZLKb": [{"currencyCode": "cOdyjqf6Q4oiwoJc", "currencyNamespace": "aRMEb15LBlTVufc5", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1992-06-27T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1988-12-18T00:00:00Z", "expireAt": "1976-11-19T00:00:00Z", "price": 96, "purchaseAt": "1995-05-18T00:00:00Z", "trialPrice": 49}, {"currencyCode": "5F2PWGTTD81xhNP4", "currencyNamespace": "t6kYBUjyXAn3bWQF", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1972-01-20T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1984-04-09T00:00:00Z", "expireAt": "1975-12-27T00:00:00Z", "price": 73, "purchaseAt": "1981-05-10T00:00:00Z", "trialPrice": 62}, {"currencyCode": "IrgroixptZhckUTG", "currencyNamespace": "kcBOE4qMcH1Kyi8Z", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1981-09-24T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1972-05-03T00:00:00Z", "expireAt": "1995-04-13T00:00:00Z", "price": 44, "purchaseAt": "1986-07-29T00:00:00Z", "trialPrice": 7}]}, "saleConfig": {"currencyCode": "OkDstxZcY1HgAnZV", "price": 98}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "QNW8Yc481dYdvGxJ", "stackable": true, "status": "INACTIVE", "tags": ["EMCtQs2FcEcvVAyI", "wgwMUSuC3Bajy3Bc", "d6Cp85HVDsZBQgOn"], "targetCurrencyCode": "XuXsGThYZrmm0wrF", "targetNamespace": "MnPpWgrQD4hEk0OL", "thumbnailUrl": "jYsnignE7KcMF7fu", "useCount": 61}' \
    > test.out 2>&1
eval_tap $? 113 'UpdateItem' test.out

#- 114 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'D2qsFiQHglUQMZi5' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'WjMZfOadpgegCUjT' \
    > test.out 2>&1
eval_tap $? 114 'DeleteItem' test.out

#- 115 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'di1Ehr8OtqpNJ9R8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 94, "orderNo": "JgakZyUV7t73VnSF"}' \
    > test.out 2>&1
eval_tap $? 115 'AcquireItem' test.out

#- 116 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'buxd4KYZ0jk0UZdh' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'tnKu9oTc8pVkiyGs' \
    > test.out 2>&1
eval_tap $? 116 'GetApp' test.out

#- 117 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'j5JdXzRxfNEjUMTs' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8WIObJBTsvsw76uI' \
    --body '{"carousel": [{"alt": "SRX0bKVoWtoUW1P7", "previewUrl": "ocuBAldDSUS7Haa6", "thumbnailUrl": "unq1yQOSRvyiLBRV", "type": "video", "url": "yM4OfCzdQCXMAWnf", "videoSource": "youtube"}, {"alt": "PNOe9Eevf1fhMg1E", "previewUrl": "2k7QLFrVgtX7y0fP", "thumbnailUrl": "OieDCow2zXyFFVpM", "type": "video", "url": "8XeEAtALFI3v8yha", "videoSource": "vimeo"}, {"alt": "pd5A7MYcpBD6lKNb", "previewUrl": "8RxvN2u5J7baOeLH", "thumbnailUrl": "19fqBwNbNe1ffYRt", "type": "video", "url": "vQaKyevWYtZjK6J2", "videoSource": "vimeo"}], "developer": "v8MpBSpo3AKRmnJk", "forumUrl": "zJHAckUyBksYQfDm", "genres": ["Racing", "Racing", "Strategy"], "localizations": {"lOsKmfsgJdmzsDPs": {"announcement": "Wh1k0cQ08NG6dX2T", "slogan": "Zkil67kRngoUa83E"}, "Ch1gqPeS193TNNzo": {"announcement": "t3sVli3GN2XTrFib", "slogan": "RAhzzEWzWlTY70qd"}, "gJRvpZrSpWX3KEe2": {"announcement": "BjV00ReCXFffjJJx", "slogan": "lgjzIhpgOoIOD74V"}}, "platformRequirements": {"21HWDAfvXwdxbyp4": [{"additionals": "HAPbBbNPStVBUpKg", "directXVersion": "OssFkz0F36piDYXe", "diskSpace": "HZ7FHls3nyvconqb", "graphics": "HQqKLQKe3xmj6s0G", "label": "qsWncp5LrqbiKudv", "osVersion": "9z75SzoCV8ZMi2o1", "processor": "nR482D6gNClk9c87", "ram": "hosaPFC5zBW3ZgVZ", "soundCard": "Cj9ObVGT0Scwl4kN"}, {"additionals": "mCi15XTJTgCNNH7R", "directXVersion": "tG5Xmo9Q0Wb07N17", "diskSpace": "fkxZSc6VbE0AGcek", "graphics": "jMNHuPXtz8tXxrmz", "label": "afMUguyDoN91uc28", "osVersion": "HoSpGt1g0GGbT4Hf", "processor": "2PPKOldkbgX9CWJK", "ram": "wXXSbv5eg9q86IaD", "soundCard": "Fjjx6uZerWbtwTX9"}, {"additionals": "gNRByjbE8lOLAfTX", "directXVersion": "KLzbrddqcKLa7Lev", "diskSpace": "xNHOSEhQRZIp693l", "graphics": "Rwtc43atCuCFxbfb", "label": "z4aQERziPL4dHhOq", "osVersion": "G5KDdUvk0LEi26Ls", "processor": "7mjRxNmvvNtjJNQe", "ram": "pUTGhwlY4lPzlsCR", "soundCard": "5rVsyfcH7WjP7HuG"}], "z3b5WAEvdRF9bqMj": [{"additionals": "4ro5B19VE838c7Oy", "directXVersion": "dVw0zCqoMZvpIOO9", "diskSpace": "7DmQ5ZOzx6iCJTu6", "graphics": "0IifzMhkk5Pxsjqb", "label": "CKpMv2Yky9DYkD2s", "osVersion": "IllFtBtXJKG3rqBm", "processor": "ILhtWm8RQvRUbUDS", "ram": "iefGEdLucrtO2gCQ", "soundCard": "D057DrDlgC2nzS9S"}, {"additionals": "iGUjVAw4v3q6JRHc", "directXVersion": "n7KaoCEkRdo6qHYI", "diskSpace": "ZWnXqQ1oHFJ9Q0vq", "graphics": "sL9SomqWsGA76yxi", "label": "0QzZWfmP2sx0KO5b", "osVersion": "EJaPnAFjsodyJQVV", "processor": "BrShGbIIuqK8C403", "ram": "HgoXCR6XOMXwKdfq", "soundCard": "k8T4QHK30EX0Fclp"}, {"additionals": "Dl5HsuracO5Mnjnx", "directXVersion": "D1OXkxShFVQTRekL", "diskSpace": "fjmy8zosRCRgVwbr", "graphics": "QKmb01yA7U7dGMju", "label": "pZkZQY8CNyT4k3DI", "osVersion": "bfT22G5NpE130YWS", "processor": "gxpKWtdtdtVW9anE", "ram": "Nmxb9e7vXZV3ig8J", "soundCard": "g5VByeI3ycMcYYBi"}], "xKJXCISQdwec1m8B": [{"additionals": "usV9tUh74KVo6Xqj", "directXVersion": "z2xUKLNWSmYyVvye", "diskSpace": "lIJ8QgaLMqi836UL", "graphics": "a7cfZl4VuY6rsZyo", "label": "6CBRRnoOikIxXKKI", "osVersion": "R6kPmswm5TCAU1cK", "processor": "ApdJDnE73GLmSZns", "ram": "5owBhoUg4LsGP6KL", "soundCard": "PXkvUv2XiXaBzsma"}, {"additionals": "xjTZPlLitytGka7K", "directXVersion": "v5TacQKF4OlRGdmX", "diskSpace": "xETLEQrr3KCAV9al", "graphics": "q3hK1G4kKooSNNUZ", "label": "uiynZ64IwncZPk82", "osVersion": "GF3eTC0vzZUDj9dz", "processor": "GgGVxo9OHgfHumyf", "ram": "uBNisecYbcOpR45V", "soundCard": "DlvSc0Mr7ImwCwGq"}, {"additionals": "Of0bNs97KvKyj3Mq", "directXVersion": "S7Dcmtfh50eObbrm", "diskSpace": "gjhWK0x0ZidAJ1CU", "graphics": "1eD1La16Bw3JbUnU", "label": "Dh5yGjjv4Mwrv2va", "osVersion": "ncmR6Z7rb21A2E9p", "processor": "X0BWCMqPsRk5htdM", "ram": "5T3fDSrSHrkoqv2m", "soundCard": "M6soMaTvQq2a9YdF"}]}, "platforms": ["Linux", "Linux", "IOS"], "players": ["Single", "LocalCoop", "Single"], "primaryGenre": "Strategy", "publisher": "O0js0hG9xmSnzd7z", "releaseDate": "1974-08-27T00:00:00Z", "websiteUrl": "UxAogcnGkXk17QPk"}' \
    > test.out 2>&1
eval_tap $? 117 'UpdateApp' test.out

#- 118 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'JHRhmLKQuQVFSKiX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l8G2uf6E8EajXLSA' \
    > test.out 2>&1
eval_tap $? 118 'DisableItem' test.out

#- 119 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'S8MKMaxQ1QyJCpKe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'GetItemDynamicData' test.out

#- 120 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'dhuzI7G9NCKKXu1b' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qI2M5PmXfKnQ7BYG' \
    > test.out 2>&1
eval_tap $? 120 'EnableItem' test.out

#- 121 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'jCUDMOrbmoRvWnfm' \
    --itemId 'GFy0eUoOBd90h9ED' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qSTOfoNewWjwMWDK' \
    > test.out 2>&1
eval_tap $? 121 'FeatureItem' test.out

#- 122 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'Et6JhbJ0fwTDaq6b' \
    --itemId '5RpMwhWPtndriXU9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'loOxpmEuwDVc12r0' \
    > test.out 2>&1
eval_tap $? 122 'DefeatureItem' test.out

#- 123 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'DVUGgGHkapTCafFM' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'dvYiCBuzUUwyI6Vt' \
    --populateBundle  \
    --region 'd4v9k4fv3kMiuQ3D' \
    --storeId 'hsKLxjt5srPFxBgp' \
    > test.out 2>&1
eval_tap $? 123 'GetLocaleItem' test.out

#- 124 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'FtDBmTLH9kP9U53z' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6joBAhAlJGI2YYb6' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 22, "comparison": "is", "name": "BzAzPkt1efGJeJax", "predicateType": "SeasonPassPredicate", "value": "2tHxDb06ZFy3uglS", "values": ["6LvcnGMJbJIYLssM", "p2UxvF2uLXWilRD7", "HD6LCgdFxRGj00RT"]}, {"anyOf": 44, "comparison": "isLessThan", "name": "y9gkfTMRrXVRcAVR", "predicateType": "SeasonPassPredicate", "value": "PHc9r8eToFmkHJ6B", "values": ["POKFLxIwKssw647Y", "U226l07jPlcYaqYM", "wDudnGRufOUGfMjT"]}, {"anyOf": 14, "comparison": "includes", "name": "fBmhjI9Y28qVceS9", "predicateType": "SeasonPassPredicate", "value": "X48dKPCFUIeyYEym", "values": ["NXzNX6TGh4UdEwee", "BsJEvBbAvCmlh6Z1", "oz9BaixUUvmzbajE"]}]}, {"operator": "and", "predicates": [{"anyOf": 13, "comparison": "is", "name": "9P6a280S5RNB5dVC", "predicateType": "SeasonPassPredicate", "value": "wQ9tkWaMOH47CAT7", "values": ["t6YJ2tWwF7RnP1oK", "cBP0918JaEBQBP76", "6LUnBBR84iAO7sBQ"]}, {"anyOf": 5, "comparison": "isGreaterThanOrEqual", "name": "4RVfjB0zi3XrYZUi", "predicateType": "SeasonTierPredicate", "value": "70eNLHkVrEFd8xAr", "values": ["9K9pmAIc6VSfE9nb", "WJuCAIfNBSHgpFNw", "E2PMv12ZSRJkujxb"]}, {"anyOf": 59, "comparison": "isLessThan", "name": "IYzaZUTmvsEzLPnn", "predicateType": "SeasonTierPredicate", "value": "dS7H7yIS7b5TSDRI", "values": ["WDyhBsCCbnfihnXK", "JFaIaEMW5bhJyL72", "oMg7Dc5APzfzXDEL"]}]}, {"operator": "or", "predicates": [{"anyOf": 23, "comparison": "isGreaterThan", "name": "xaupnTTq9ihZkvFK", "predicateType": "EntitlementPredicate", "value": "qgFddYvifGHawNx6", "values": ["lpCI8DhjlxUyrs3O", "yhniEHLbEQKc0aUv", "rKXDIjYC4df9qswS"]}, {"anyOf": 91, "comparison": "isNot", "name": "esE5p0DwUj2HKUvP", "predicateType": "SeasonPassPredicate", "value": "UcQBxMSdOOsn2Nd8", "values": ["Jpa19GJDK46Eehx7", "xasqMY9aulsL6NOV", "5agpS6A5mkufBpWV"]}, {"anyOf": 48, "comparison": "includes", "name": "IK9D2bTcgaKoccaS", "predicateType": "SeasonPassPredicate", "value": "BUS6uwWrCQt86Jrg", "values": ["LSSUlugIAknXcSaV", "eXr6FNbKJ05Orya6", "8tLAJWpcyNkUvqn6"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateItemPurchaseCondition' test.out

#- 125 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'YcAYp7qSiDvsfMUO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "pWv46sXvpOjrpRo4"}' \
    > test.out 2>&1
eval_tap $? 125 'ReturnItem' test.out

#- 126 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --name 'LLuIaSxoloIH1gBC' \
    --offset '17' \
    --tag 'VFrvls0ZwosKhDlL' \
    > test.out 2>&1
eval_tap $? 126 'QueryKeyGroups' test.out

#- 127 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fTKxpVOXvGSrdkqd", "name": "dI3ezqu6FB0sL2xt", "status": "ACTIVE", "tags": ["fX9j7rhZCAlDlVKB", "sLZiBRXszE7CL1cQ", "CSoqHvH7g63cOx6y"]}' \
    > test.out 2>&1
eval_tap $? 127 'CreateKeyGroup' test.out

#- 128 GetKeyGroupByBoothName
eval_tap 0 128 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 129 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'rIw37pKOLrF5i3gr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'GetKeyGroup' test.out

#- 130 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '3Cc4M2O7NrTQO7KL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "dZDGwqx7T3l1ut2o", "name": "yolliYsTJUmpscwL", "status": "ACTIVE", "tags": ["aDLrwh3d0ykRGkgq", "UNIbJMJ9ABbKVWO2", "YEDiqkwKbpdk7wlD"]}' \
    > test.out 2>&1
eval_tap $? 130 'UpdateKeyGroup' test.out

#- 131 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'ngNiPPjpSAlZwFGp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 131 'GetKeyGroupDynamic' test.out

#- 132 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'ea5ObBB49Km4ClIQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '87' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 132 'ListKeys' test.out

#- 133 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'xMTfaSot7aohFYy4' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 133 'UploadKeys' test.out

#- 134 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'VxwHIJ9gzxqAw4vB' \
    --limit '66' \
    --offset '4' \
    --orderNos 'QAeh0VTiTP4PSrXU,S6jYI9lsQFD43Df5,qUZOFzpFd6b5Jc5T' \
    --sortBy 'ETHcup8GG0VCMTFJ' \
    --startTime '6svTyo9RHget5hzB' \
    --status 'INIT' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 134 'QueryOrders' test.out

#- 135 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetOrderStatistics' test.out

#- 136 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BDFopxUwkMuSqQnK' \
    > test.out 2>&1
eval_tap $? 136 'GetOrder' test.out

#- 137 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zDgDAtqE3kuybwTQ' \
    --body '{"description": "FYEJjIYwqfSRy8Gg"}' \
    > test.out 2>&1
eval_tap $? 137 'RefundOrder' test.out

#- 138 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetPaymentCallbackConfig' test.out

#- 139 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "k77fd1GS5YkyhAiA", "privateKey": "ItnWUmD225fp1egs"}' \
    > test.out 2>&1
eval_tap $? 139 'UpdatePaymentCallbackConfig' test.out

#- 140 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'x3ErheNwqd5pricl' \
    --externalId 'NNqLyrlzrJ4QHbfn' \
    --limit '54' \
    --notificationSource 'ALIPAY' \
    --notificationType '6nc6jLF9DIW2ncJJ' \
    --offset '74' \
    --paymentOrderNo 'jgFhS0URBhl0L5FC' \
    --startDate 'bOn46W2B2uPQLrt2' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 140 'QueryPaymentNotifications' test.out

#- 141 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'bVpCgKvPXSDufmKh' \
    --limit '37' \
    --offset '30' \
    --status 'AUTHORISED' \
    > test.out 2>&1
eval_tap $? 141 'QueryPaymentOrders' test.out

#- 142 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "p4YfGTno5oHzqY3D", "currencyNamespace": "gykA8zBJX0rkOHUk", "customParameters": {"Y5aSlqhYoSXbn6l5": {}, "xAzc1nc3eFm950dt": {}, "VAo7w4e3v5mh6Rum": {}}, "description": "5pbgEt39uJQpgEtc", "extOrderNo": "hTe3nt7t9ztprSfW", "extUserId": "9OutADrNGBWSJ1zQ", "itemType": "SEASON", "language": "YU", "metadata": {"awjiZPMoZZcyGEHx": "AKDQher3usApPdJP", "n9eIdhIBvTTupABJ": "4RwH3EdKmYtbqQHN", "fIZwrMxf3EnzZVnk": "LT0Lb85nmpdN26BY"}, "notifyUrl": "5YI0jeO2zMDSy4ky", "omitNotification": true, "platform": "4UcYzswAGpXqQxct", "price": 43, "recurringPaymentOrderNo": "diXu3iNvn7vLZ7h6", "region": "alhJNGZF07lsPP5O", "returnUrl": "fHbXzWnVO2U4uyzZ", "sandbox": false, "sku": "RPOzwuDSdGl1A2va", "subscriptionId": "NeDiSqTfmAVg50kO", "targetNamespace": "dJagEmTuaxlxgywk", "targetUserId": "bdOsyxX1tfW488oY", "title": "UT4jyCVJ0V8obTlG"}' \
    > test.out 2>&1
eval_tap $? 142 'CreatePaymentOrderByDedicated' test.out

#- 143 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'VThz4bm41oIcV33y' \
    > test.out 2>&1
eval_tap $? 143 'ListExtOrderNoByExtTxId' test.out

#- 144 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jPxibDjfF7JkjCVp' \
    > test.out 2>&1
eval_tap $? 144 'GetPaymentOrder' test.out

#- 145 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZKMxkFkBtXMU6KRI' \
    --body '{"extTxId": "m5xBoIi99ctgFXas", "paymentMethod": "xp5h780ktjQw2yXz", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 145 'ChargePaymentOrder' test.out

#- 146 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pJSrDXVwCkhOQ161' \
    --body '{"description": "TFjROYJm75VIuCOC"}' \
    > test.out 2>&1
eval_tap $? 146 'RefundPaymentOrderByDedicated' test.out

#- 147 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kt2W1DfI8QtgODk9' \
    --body '{"amount": 75, "currencyCode": "QvRa7CDRTcsAHzD3", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 51, "vat": 98}' \
    > test.out 2>&1
eval_tap $? 147 'SimulatePaymentOrderNotification' test.out

#- 148 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WbUQpbcv3IwmL7a1' \
    > test.out 2>&1
eval_tap $? 148 'GetPaymentOrderChargeStatus' test.out

#- 149 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 149 'GetPlatformWalletConfig' test.out

#- 150 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["Nintendo", "Twitch", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePlatformWalletConfig' test.out

#- 151 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 151 'ResetPlatformWalletConfig' test.out

#- 152 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 152 'GetRevocationConfig' test.out

#- 153 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateRevocationConfig' test.out

#- 154 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'DeleteRevocationConfig' test.out

#- 155 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'H4ijqOVM50tCqkZf' \
    --limit '37' \
    --offset '94' \
    --source 'OTHER' \
    --startTime 'HcmgXsrVj3Mjml6B' \
    --status 'SUCCESS' \
    --transactionId 'osOXglQwwdeLVpmX' \
    --userId 'qRwVjc3W2ANmE3VV' \
    > test.out 2>&1
eval_tap $? 155 'QueryRevocationHistories' test.out

#- 156 GetLootBoxPluginConfig1
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetLootBoxPluginConfig1' test.out

#- 157 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "sQ1fm9EUdiaRjuLs"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "oqnpKwhpZVdw5UMa"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateRevocationPluginConfig' test.out

#- 158 DeleteLootBoxPluginConfig1
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'DeleteLootBoxPluginConfig1' test.out

#- 159 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 159 'UploadRevocationPluginConfigCert' test.out

#- 160 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ymxtEFLwELCY2vId", "eventTopic": "dlxnA1VynioJcAPw", "maxAwarded": 98, "maxAwardedPerUser": 60, "namespaceExpression": "HUGcs1ACMvoY4jWH", "rewardCode": "9dFmOHW0j9suukPE", "rewardConditions": [{"condition": "4JwQONQ2vCbMn0Oi", "conditionName": "a336uiiMTAductvU", "eventName": "fVwLahtRedh1SiZl", "rewardItems": [{"duration": 83, "endDate": "1978-10-09T00:00:00Z", "itemId": "rUFum2ZcA8iKcF0b", "quantity": 21}, {"duration": 52, "endDate": "1973-08-25T00:00:00Z", "itemId": "jcTEFXcTwEtnHxP5", "quantity": 32}, {"duration": 78, "endDate": "1995-06-09T00:00:00Z", "itemId": "J9G40Y62bCo941AL", "quantity": 53}]}, {"condition": "zsE8WObt6t0w8LOB", "conditionName": "xE15JYj4IqWK09l4", "eventName": "wkrzahXR1sDEDVKD", "rewardItems": [{"duration": 71, "endDate": "1991-11-16T00:00:00Z", "itemId": "7bRwcr16lW5YwgZp", "quantity": 19}, {"duration": 23, "endDate": "1978-11-17T00:00:00Z", "itemId": "UwnGptHUplxzaDa9", "quantity": 85}, {"duration": 75, "endDate": "1986-05-05T00:00:00Z", "itemId": "whu31d8eOdtrfq6E", "quantity": 59}]}, {"condition": "m9wM7mgTtUdPVcQi", "conditionName": "jMBhs0kDP6d3nuUZ", "eventName": "41mSeS9SnGqhJOvy", "rewardItems": [{"duration": 22, "endDate": "1976-08-14T00:00:00Z", "itemId": "nHPKrZ7TiNBE0HRs", "quantity": 63}, {"duration": 68, "endDate": "1998-10-29T00:00:00Z", "itemId": "GHDOFjrfqJcyxT2a", "quantity": 39}, {"duration": 11, "endDate": "1974-08-27T00:00:00Z", "itemId": "PjFrK7Hip0eONFDg", "quantity": 95}]}], "userIdExpression": "jfVciuLnLsBKGsAL"}' \
    > test.out 2>&1
eval_tap $? 160 'CreateReward' test.out

#- 161 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'PuCOyphUUAV95708' \
    --limit '52' \
    --offset '47' \
    --sortBy 'rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 161 'QueryRewards' test.out

#- 162 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'ExportRewards' test.out

#- 163 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'ImportRewards' test.out

#- 164 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'znlDQbzTiFrQB1yU' \
    > test.out 2>&1
eval_tap $? 164 'GetReward' test.out

#- 165 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'onirH4URx3NkKQBY' \
    --body '{"description": "rlUaMiFEWUT8cAFO", "eventTopic": "5zEw8GENEJYPKxxO", "maxAwarded": 46, "maxAwardedPerUser": 45, "namespaceExpression": "7xNQ98IEbc9YITN9", "rewardCode": "8j4P2AGeidXRRnIA", "rewardConditions": [{"condition": "JfKVjOn6rtILNJVv", "conditionName": "2DLLUyBt5hDs45si", "eventName": "G30Lv9iGa5mkZjnR", "rewardItems": [{"duration": 45, "endDate": "1995-01-14T00:00:00Z", "itemId": "cHZZjFegVnZOn0tk", "quantity": 26}, {"duration": 70, "endDate": "1993-08-06T00:00:00Z", "itemId": "97u9MVUii4KpYcb1", "quantity": 53}, {"duration": 95, "endDate": "1972-06-01T00:00:00Z", "itemId": "8WtaMVvLbG04KKnh", "quantity": 22}]}, {"condition": "jvW0Qp3kTyL4CsLw", "conditionName": "iWUMcpxn4B6XoTNM", "eventName": "uqZTHwo1IAJQpb6r", "rewardItems": [{"duration": 41, "endDate": "1997-06-01T00:00:00Z", "itemId": "eaSHwQuiH3Ozu4G6", "quantity": 4}, {"duration": 16, "endDate": "1996-07-07T00:00:00Z", "itemId": "jpszuVk6iPdJ2boQ", "quantity": 33}, {"duration": 65, "endDate": "1985-08-21T00:00:00Z", "itemId": "Dg4FcDwBGyBiHewZ", "quantity": 21}]}, {"condition": "Mm74HlSZzp4aEW4G", "conditionName": "kHG5OIVuGv47XJpk", "eventName": "MiopQrVL3ZZTVxqa", "rewardItems": [{"duration": 79, "endDate": "1999-09-25T00:00:00Z", "itemId": "gY14iWk12Jffk8dw", "quantity": 74}, {"duration": 88, "endDate": "1991-11-19T00:00:00Z", "itemId": "PUOHNZxML3yoBM9q", "quantity": 48}, {"duration": 14, "endDate": "1973-05-15T00:00:00Z", "itemId": "PWz7sVnMxge2inL8", "quantity": 11}]}], "userIdExpression": "5hshSe5YmZXKEQLk"}' \
    > test.out 2>&1
eval_tap $? 165 'UpdateReward' test.out

#- 166 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'M6o3eGSP4Htmr90T' \
    > test.out 2>&1
eval_tap $? 166 'DeleteReward' test.out

#- 167 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'qGf0OyqJ9ibJMmRg' \
    --body '{"payload": {"oxNwp1lGkYoq8HP1": {}, "TM0tefVQPWX1NPO5": {}, "Wn7rNG8rGp7Fadvo": {}}}' \
    > test.out 2>&1
eval_tap $? 167 'CheckEventCondition' test.out

#- 168 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '5EzpX0IttsRezyY9' \
    --body '{"conditionName": "GB5sf94ALBmvdncQ", "userId": "kcZb8cWdVH9bww15"}' \
    > test.out 2>&1
eval_tap $? 168 'DeleteRewardConditionRecord' test.out

#- 169 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'zZsaYrJAe5Kd5QB9' \
    --limit '38' \
    --offset '27' \
    --start '4UZDTfhAyZKhqilt' \
    --storeId 'y9NVlgxUmnfdOAmu' \
    --viewId '1dX1NqD20RUvvYeJ' \
    > test.out 2>&1
eval_tap $? 169 'QuerySections' test.out

#- 170 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Zw6QZFN7wFCnqpvN' \
    --body '{"active": false, "displayOrder": 38, "endDate": "1999-09-22T00:00:00Z", "ext": {"F6iwkJIYOLarmpWy": {}, "vib9CDW21ANrlpuX": {}, "D9H1u1CvzWPcZwkj": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 23, "itemCount": 29, "rule": "SEQUENCE"}, "items": [{"id": "PH94SUinY5diUlqg", "sku": "vY7dPPyahppgxJhk"}, {"id": "4EdTZ000rS92594H", "sku": "LvWFsXHtMP0k9L5d"}, {"id": "REQbCqfh0gpABFBE", "sku": "R6WNcDOsRzBkf9A6"}], "localizations": {"HjCnFRdSihcvszzQ": {"description": "LZBktk0siMup01ky", "localExt": {"aFwwD7wecuQb4GNQ": {}, "HVZMKGBnzh4suaGI": {}, "zttTncVBf5g3oeuH": {}}, "longDescription": "iNyLkfPQPmjUkvSs", "title": "5YmIejozmG5HlrIf"}, "MAvvpkAHRJHZyfrX": {"description": "ZmiJX4CjKCeIRIr9", "localExt": {"97KKpJXTLbYWpqeX": {}, "jaf1f5fjNMZjKJ05": {}, "puX3197WrMnJtovS": {}}, "longDescription": "MFw8X4zxbdfXgunt", "title": "1oMNZ68eovHSH3xV"}, "3URIRVDYBd6hMB0l": {"description": "7sg7IfMH5Tu1ky1Z", "localExt": {"YvyeHmfoFkUDP864": {}, "shbnQ3bVvuvpsDJX": {}, "PCWkX4Kpi8CJ88aM": {}}, "longDescription": "PGFFAQZbfbmVTEbi", "title": "Rq5Juikmpat75rVb"}}, "name": "N9ZBtzJ33tCwv8H1", "rotationType": "CUSTOM", "startDate": "1986-11-02T00:00:00Z", "viewId": "1FVZ630HNBYZSrz7"}' \
    > test.out 2>&1
eval_tap $? 170 'CreateSection' test.out

#- 171 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pMjESLLMPKDXLki6' \
    > test.out 2>&1
eval_tap $? 171 'PurgeExpiredSection' test.out

#- 172 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Oz5Bygt8Q0RjSf1s' \
    --storeId 'rB7hGwGbUmQmJHNf' \
    > test.out 2>&1
eval_tap $? 172 'GetSection' test.out

#- 173 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'fZENs9X0hFMdzryv' \
    --storeId 'hc1YjHmmulSBIElc' \
    --body '{"active": true, "displayOrder": 6, "endDate": "1982-12-20T00:00:00Z", "ext": {"iz3fWthJSu2pUIIu": {}, "PLFAtcWhjAP57QbW": {}, "vSSp71zEPPfmAQiq": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 93, "itemCount": 4, "rule": "SEQUENCE"}, "items": [{"id": "LwZGikW7TFA9gE6S", "sku": "rYKq6lcVOhPJIcEH"}, {"id": "biKHW7flVolAWEMm", "sku": "QSPDTRqjlvwnnCA5"}, {"id": "tfK5ushaKTPVjyOU", "sku": "pR3uUdgNlyU4IJnq"}], "localizations": {"trjCOsE8VjvzhJwN": {"description": "X4bhqCjlwrmsSRV8", "localExt": {"6iic1FIMyF7CcNu2": {}, "DYn6E9Gk51kOTJZl": {}, "uTekDMCGUJvERxNg": {}}, "longDescription": "8djSb4Vt2vKQ5vlC", "title": "dI519Pf2iogwxM5D"}, "ZM0dgozmco41750x": {"description": "dYQg34WUV0WpmsQn", "localExt": {"p1n4YGumTKOlDOy5": {}, "vhSkxERZ2AQ1jvXY": {}, "Bar5RMmmGdWl0wpj": {}}, "longDescription": "5tVfKU3D8WVPh0Z7", "title": "YiGE2cyzTMBY7Xd0"}, "OoENg2Lw7uepmahX": {"description": "ojVZYz2zMU9jLzNV", "localExt": {"3GaG43R6nlRPrEAY": {}, "qRBeSc5uShoj3dGH": {}, "Meoi5DBOsQ0Gax0i": {}}, "longDescription": "X05IT9Agsjl5NmnS", "title": "HhxNmCe4txY0MsPc"}}, "name": "9EMgf9JCJiEvhL8Z", "rotationType": "CUSTOM", "startDate": "1995-06-30T00:00:00Z", "viewId": "TmZ8JSMeNmRocp40"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateSection' test.out

#- 174 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '0RZe8Bzx9aGEI22B' \
    --storeId 'TCZs97TJI8GPrM24' \
    > test.out 2>&1
eval_tap $? 174 'DeleteSection' test.out

#- 175 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 175 'ListStores' test.out

#- 176 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "F3celFgM62HQtgzQ", "defaultRegion": "hO3nR8j8DlP6OGbn", "description": "8vmfMYGLt1AjKhh3", "supportedLanguages": ["JMX7xSrz1EH6X2SM", "3xzsNrJzWBcdFlo7", "oAsOlfLB1J19b5rT"], "supportedRegions": ["fiL2P3r1a8KIJH33", "aKkPuWD59MgTy1HA", "58Jt5NaROjSKFEuZ"], "title": "o2ElXYSS4ezBRSiO"}' \
    > test.out 2>&1
eval_tap $? 176 'CreateStore' test.out

#- 177 ImportStore
eval_tap 0 177 'ImportStore # SKIP deprecated' test.out

#- 178 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetPublishedStore' test.out

#- 179 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'DeletePublishedStore' test.out

#- 180 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'GetPublishedStoreBackup' test.out

#- 181 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 181 'RollbackPublishedStore' test.out

#- 182 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yReviDaxlPdhwmcH' \
    > test.out 2>&1
eval_tap $? 182 'GetStore' test.out

#- 183 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '03yoMxzRR6xd9rTh' \
    --body '{"defaultLanguage": "3ureaIbxM3Wev9pZ", "defaultRegion": "QjWAN0tny16ZHZtu", "description": "SJGQCrM7JEMRPkdT", "supportedLanguages": ["cAzkIlndN5xeayr3", "vUKMuIiz2MiAAKcv", "AXnxnH0QIhoJRY80"], "supportedRegions": ["7VmBT4wZXQZZrSsu", "YiIPei0pXglJYnKk", "oCAZuolAWnxkImVb"], "title": "DP0QX31gI7VmnGIR"}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateStore' test.out

#- 184 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MvXe6BiphIFe2bzr' \
    > test.out 2>&1
eval_tap $? 184 'DeleteStore' test.out

#- 185 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '6qQw6fSESkM19OPM' \
    --action 'DELETE' \
    --itemSku 'MlnKW9jiNMu9QVrM' \
    --itemType 'BUNDLE' \
    --limit '95' \
    --offset '61' \
    --selected  \
    --sortBy 'createdAt,updatedAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd '8gISE34yIAZQeigi' \
    --updatedAtStart 'A3wBrmBYIlZeheP7' \
    > test.out 2>&1
eval_tap $? 185 'QueryChanges' test.out

#- 186 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '2AB8EO3YrlyrWowU' \
    > test.out 2>&1
eval_tap $? 186 'PublishAll' test.out

#- 187 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pUDVLlTtuJJsHZVs' \
    > test.out 2>&1
eval_tap $? 187 'PublishSelected' test.out

#- 188 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G6izJZruOJvSRFLD' \
    > test.out 2>&1
eval_tap $? 188 'SelectAllRecords' test.out

#- 189 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Sdj8elbtHvDU91Dm' \
    --action 'UPDATE' \
    --itemSku 'SqrKWYOuITlYS2RY' \
    --itemType 'APP' \
    --type 'STORE' \
    --updatedAtEnd '8nceFU5GKmcEKp8A' \
    --updatedAtStart 'QwqgJs6O0Qj0ccMk' \
    > test.out 2>&1
eval_tap $? 189 'GetStatistic' test.out

#- 190 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dz6zPz3BVHAqp4O9' \
    > test.out 2>&1
eval_tap $? 190 'UnselectAllRecords' test.out

#- 191 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'XSjap24esyjh6Wc3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'migf2n6iQyr5cb5Y' \
    > test.out 2>&1
eval_tap $? 191 'SelectRecord' test.out

#- 192 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'L6fwBiaVPmmn0T5u' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zlmi2NY26xrkPPdg' \
    > test.out 2>&1
eval_tap $? 192 'UnselectRecord' test.out

#- 193 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '3pXjmtpNfCrIj9nt' \
    --targetStoreId 'Yo3dupUHNu8abrVV' \
    > test.out 2>&1
eval_tap $? 193 'CloneStore' test.out

#- 194 ExportStore
eval_tap 0 194 'ExportStore # SKIP deprecated' test.out

#- 195 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'vOAUXkw36cr2WJQq' \
    --limit '92' \
    --offset '92' \
    --sku '7Tq4YIyZAFQ6lZfa' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId 'VwSaoj1ugjr8mPkr' \
    > test.out 2>&1
eval_tap $? 195 'QuerySubscriptions' test.out

#- 196 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3tZ506ERSVy5M3rr' \
    > test.out 2>&1
eval_tap $? 196 'RecurringChargeSubscription' test.out

#- 197 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'kxu0U9h9gCNVZxHG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 197 'GetTicketDynamic' test.out

#- 198 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'xhZqNXJ6JXSh0Z3S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "WISs1dYrJKmx1BT6"}' \
    > test.out 2>&1
eval_tap $? 198 'DecreaseTicketSale' test.out

#- 199 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'iLFQejNZJNF2hm0T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'GetTicketBoothID' test.out

#- 200 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'qBQprHn3whPKU5ab' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 28, "orderNo": "qstMuikKc6VNU857"}' \
    > test.out 2>&1
eval_tap $? 200 'IncreaseTicketSale' test.out

#- 201 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '0siWm3V9sirE0JOQ' \
    --body '{"achievements": [{"id": "xWeHypqCWMDPRI2c", "value": 58}, {"id": "WoE4esuiDrquccz4", "value": 73}, {"id": "cXokXbwKDtVmrYQu", "value": 44}], "steamUserId": "hZvHfiT9s9pK8HuU"}' \
    > test.out 2>&1
eval_tap $? 201 'UnlockSteamUserAchievement' test.out

#- 202 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y1QQHQ0NCEddJtx6' \
    --xboxUserId 'GV01vD7lNLxlpvqa' \
    > test.out 2>&1
eval_tap $? 202 'GetXblUserAchievements' test.out

#- 203 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9P9GaukfCEIeSBL' \
    --body '{"achievements": [{"id": "hTfzigzHcRuJgYaj", "percentComplete": 81}, {"id": "I8Dzyh1N0JEKNoMt", "percentComplete": 70}, {"id": "Kn63KIDTkUCqbbHG", "percentComplete": 74}], "serviceConfigId": "IL2P2bh14LroFTnA", "titleId": "uujPeP9N0vdVB5a2", "xboxUserId": "XkS3XQfMuzZh4AhZ"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateXblUserAchievement' test.out

#- 204 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Re2hgU56xtyJtnbT' \
    > test.out 2>&1
eval_tap $? 204 'AnonymizeCampaign' test.out

#- 205 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXu7FbleSP5PcdOu' \
    > test.out 2>&1
eval_tap $? 205 'AnonymizeEntitlement' test.out

#- 206 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'q0m0rvakR8rcwojL' \
    > test.out 2>&1
eval_tap $? 206 'AnonymizeFulfillment' test.out

#- 207 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'RjhcaJ56nGlYZ2to' \
    > test.out 2>&1
eval_tap $? 207 'AnonymizeIntegration' test.out

#- 208 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'd2BGBXjNyRCtPOr1' \
    > test.out 2>&1
eval_tap $? 208 'AnonymizeOrder' test.out

#- 209 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'FU3QZy3gdDms3kb1' \
    > test.out 2>&1
eval_tap $? 209 'AnonymizePayment' test.out

#- 210 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'htW0UGJpwQZlXuzu' \
    > test.out 2>&1
eval_tap $? 210 'AnonymizeRevocation' test.out

#- 211 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '3m9u67JjCDwg186h' \
    > test.out 2>&1
eval_tap $? 211 'AnonymizeSubscription' test.out

#- 212 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'GWKfO9MnoT3t99Hm' \
    > test.out 2>&1
eval_tap $? 212 'AnonymizeWallet' test.out

#- 213 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxzjDhTrcBKtU956' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 213 'GetUserDLCByPlatform' test.out

#- 214 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '9gD9tGN0nE7M36mI' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 214 'GetUserDLC' test.out

#- 215 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'u3EeZtLQij2JXsqd' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'hZTTaCeqGv7meuQh' \
    --features 'Juq1C6JHkWMSUbqB,yWN2BCnRz9w2nur0,B9jKaunAcylsau7w' \
    --itemId 'RQmL4i3eRyIECEDa,1I4lwXqwPfq3VzHQ,jtolx64w1gyvjacK' \
    --limit '39' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 215 'QueryUserEntitlements' test.out

#- 216 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GqxMnoAXRlcq0mYW' \
    --body '[{"endDate": "1989-12-17T00:00:00Z", "grantedCode": "LcM8LaMW0ByjsRUr", "itemId": "AHNRkIcC4wNFzsbr", "itemNamespace": "tYvLh56AWXoMiowd", "language": "uHTo-xivA-330", "quantity": 1, "region": "833TDzk66ix88sAU", "source": "PROMOTION", "startDate": "1997-05-16T00:00:00Z", "storeId": "tTJw4KV104MtMhKH"}, {"endDate": "1977-05-28T00:00:00Z", "grantedCode": "SjqPuQZX5KjdNrEw", "itemId": "fWo2MwulLg4bsO4Y", "itemNamespace": "HEYLjTSNDf3zazm6", "language": "nSz-EhEy_YP", "quantity": 58, "region": "6GqT2vSLLiMvcu39", "source": "OTHER", "startDate": "1997-10-14T00:00:00Z", "storeId": "hxczskbSUbOZ9WNl"}, {"endDate": "1999-11-20T00:00:00Z", "grantedCode": "apJmNAbl1g5ZmTTG", "itemId": "YRbP4QVey9pEz1TV", "itemNamespace": "5cUtPBsw01i5Mf7W", "language": "bCw", "quantity": 74, "region": "eDNfUESLlwHv3Jgt", "source": "GIFT", "startDate": "1980-11-26T00:00:00Z", "storeId": "w5Xl7ZZrDZdbuvCF"}]' \
    > test.out 2>&1
eval_tap $? 216 'GrantUserEntitlement' test.out

#- 217 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BaVcohewKkVuGv9f' \
    --activeOnly  \
    --appId 'QXkErF0drbYrrFQP' \
    > test.out 2>&1
eval_tap $? 217 'GetUserAppEntitlementByAppId' test.out

#- 218 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '6rW62CtetBW3pvAJ' \
    --activeOnly  \
    --limit '74' \
    --offset '17' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserEntitlementsByAppType' test.out

#- 219 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHhveGg97PY0txzv' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'P4HSuiYCbG0UyYUJ' \
    > test.out 2>&1
eval_tap $? 219 'GetUserEntitlementByItemId' test.out

#- 220 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mNL8p6AbdtU0CDrl' \
    --ids 'QpKB8qoel2QK3aSO,YdmMDikc3Fjm9HoQ,DemtiQvURYZCeF30' \
    > test.out 2>&1
eval_tap $? 220 'GetUserActiveEntitlementsByItemIds' test.out

#- 221 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'RT9rBgM8o7lxXq7T' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'cGRWzkCl1ZKuPxjD' \
    > test.out 2>&1
eval_tap $? 221 'GetUserEntitlementBySku' test.out

#- 222 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'UGRGcCEPjbUy7F82' \
    --appIds 'Adu9BYRHrVTehrqg,vEtEs2LpE0qfbvdU,8hlDoC9FnxqBlPBY' \
    --itemIds 'J7X6uVy7FWTSfMi2,CPVGxjcdpdCqVeeP,MSqb8y8qJTUQY40Z' \
    --skus 'rpn0vAD9YsPeDWrA,VQZSvgWuCuLsUGrV,QAbhS54ZuQHKersD' \
    > test.out 2>&1
eval_tap $? 222 'ExistsAnyUserActiveEntitlement' test.out

#- 223 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJLUHAKtfXCKOna8' \
    --itemIds 'DdjtZhh6ofsUoRh6,r0e0J6vyqPw7YlmV,3kES0Hi88UYgSV40' \
    > test.out 2>&1
eval_tap $? 223 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 224 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvY7apPCrN5bEhmu' \
    --appId 'HgKeWizEpw1zN0mO' \
    > test.out 2>&1
eval_tap $? 224 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 225 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgGhHMz9dddLWJWD' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'Ks2vLyH9kcSBdk7M' \
    > test.out 2>&1
eval_tap $? 225 'GetUserEntitlementOwnershipByItemId' test.out

#- 226 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQzn28Le5neohqhC' \
    --ids 'zroAzWQDve0Z2G2N,09VIbbsz24fQKDZX,6plErw0Gb0ceCbph' \
    > test.out 2>&1
eval_tap $? 226 'GetUserEntitlementOwnershipByItemIds' test.out

#- 227 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4YMhJ0S50bez9ZL' \
    --entitlementClazz 'MEDIA' \
    --sku '8Ju4XSAnlXRYB9Bg' \
    > test.out 2>&1
eval_tap $? 227 'GetUserEntitlementOwnershipBySku' test.out

#- 228 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZBvkehRn83B0nrW' \
    > test.out 2>&1
eval_tap $? 228 'RevokeAllEntitlements' test.out

#- 229 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1qx3NJTugVWXz8dv' \
    --entitlementIds '7BiEUqnzxs2deMF8' \
    > test.out 2>&1
eval_tap $? 229 'RevokeUserEntitlements' test.out

#- 230 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'UAJIHEZv5zyUUyNJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kvA5xF3zHtZSd3Qz' \
    > test.out 2>&1
eval_tap $? 230 'GetUserEntitlement' test.out

#- 231 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'XhkrN4pWryt4XTNw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pp0ni1YfIgLZ4YIz' \
    --body '{"endDate": "1986-04-02T00:00:00Z", "nullFieldList": ["OilX1e1825iasunE", "Sjcgr2drXG5NkKCy", "SLA8cKCs0dFYRSa2"], "startDate": "1992-12-21T00:00:00Z", "status": "SOLD", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateUserEntitlement' test.out

#- 232 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'Z0iOZJiOAh1SpLhM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2Pav11FuU8iXCRz' \
    --body '{"options": ["8KgqgwijYxpGhsFA", "rq6lolbj7QKvtVRC", "PMjr5M3vw1GqUjjF"], "requestId": "p6R8mYZwKftVqSEC", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 232 'ConsumeUserEntitlement' test.out

#- 233 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'hiPuDdOPHcN9drwq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ytieXpIZfr5XDq9d' \
    > test.out 2>&1
eval_tap $? 233 'DisableUserEntitlement' test.out

#- 234 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'GLHjtgE2bTXJxCCF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qPNDqWrpkWnnova1' \
    > test.out 2>&1
eval_tap $? 234 'EnableUserEntitlement' test.out

#- 235 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '5WVuE5cYVP9tQSa2' \
    --namespace "$AB_NAMESPACE" \
    --userId '7BnPyq3I1BLtGEZD' \
    > test.out 2>&1
eval_tap $? 235 'GetUserEntitlementHistories' test.out

#- 236 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'RNkk4DJUofJXK8RG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S0zCYRVmbfzwUmsy' \
    > test.out 2>&1
eval_tap $? 236 'RevokeUserEntitlement' test.out

#- 237 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId '0stUmKdXiiTObNdq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWa13g3pgHx6uPf6' \
    --body '{"reason": "jQZcYerH933X7iXE", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 237 'RevokeUseCount' test.out

#- 238 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'TrRzCCafADJfWBsp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3MLwJZquMQSPp5X' \
    --body '{"requestId": "D4S1ilfgff7Et4uY", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 238 'SellUserEntitlement' test.out

#- 239 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nlBwGNHgfgwZwVMv' \
    --body '{"duration": 39, "endDate": "1986-03-02T00:00:00Z", "itemId": "3NExUFipJsUiDawA", "itemSku": "jgHFQk0VzWRNFNiU", "language": "n2yXMSCcHADYpS86", "order": {"currency": {"currencyCode": "1c0CJ7LzpFvOSF6x", "currencySymbol": "KA6yrnvXY5dDwnea", "currencyType": "REAL", "decimals": 82, "namespace": "5C6S2eHsH4Y84hL7"}, "ext": {"5QboMHCtzEF9FSeg": {}, "6WYgtfuqJHrs4e3R": {}, "nWR30MdBZezfwc3H": {}}, "free": true}, "orderNo": "ZAtyjTxnlmSyjEaF", "origin": "System", "quantity": 32, "region": "DRN6HIEqIFEcS0yn", "source": "REFERRAL_BONUS", "startDate": "1978-11-17T00:00:00Z", "storeId": "YWPUS4Zu0SbTt6M2"}' \
    > test.out 2>&1
eval_tap $? 239 'FulfillItem' test.out

#- 240 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'XizikCh6q0yq2WAH' \
    --body '{"code": "tL7IWE3MFqvfDG5j", "language": "nIq_217", "region": "bBd5wb5H3qppoCiH"}' \
    > test.out 2>&1
eval_tap $? 240 'RedeemCode' test.out

#- 241 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'MD4iBK2O7qYtOHV5' \
    --body '{"origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "8kYEVylINJpxFY8E", "namespace": "6pU8eHjh0aTjIOaQ"}, "item": {"itemId": "t0snbE0yMvqF7TJ9", "itemSku": "uB0zypjJiu7BIimN", "itemType": "uwB3hBVhuSMHhf5R"}, "quantity": 95, "type": "CURRENCY"}, {"currency": {"currencyCode": "lWUxkBefhxRtrqbv", "namespace": "56oqwnCLVc2qHZuu"}, "item": {"itemId": "edbBOd19DqZJRYV1", "itemSku": "oqNLmPAUIMwa2wYq", "itemType": "6DsUq38bYvaWLoKz"}, "quantity": 70, "type": "CURRENCY"}, {"currency": {"currencyCode": "nngdfFnOfY9stXH6", "namespace": "LYXXMndxBPKmHVB7"}, "item": {"itemId": "cNzHhvxc4xAPZ86W", "itemSku": "NnQOhusPn4466u8a", "itemType": "gb5HPsBU0Eo6QJ9v"}, "quantity": 56, "type": "ITEM"}], "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 241 'FulfillRewards' test.out

#- 242 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4UP09fabC01Thm9' \
    --endTime 'f4AWpyiKVT3OvEuj' \
    --limit '47' \
    --offset '92' \
    --productId '5yjtQSCJaOHzpb62' \
    --startTime '3EciYoYOPVg6DLEZ' \
    --status 'FULFILLED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 242 'QueryUserIAPOrders' test.out

#- 243 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BXefsSgZxSYnVwXq' \
    > test.out 2>&1
eval_tap $? 243 'QueryAllUserIAPOrders' test.out

#- 244 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'F6K0WA76Kl2mHHoz' \
    --endTime '6qBQnEDgX49n1xTD' \
    --limit '66' \
    --offset '10' \
    --startTime 'cmOm1sqdIWU6ERyl' \
    --status 'PENDING' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserIAPConsumeHistory' test.out

#- 245 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sgf5dXMrPoYSohfr' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "yn-YTxd", "productId": "wflNGfufW5cWeg6e", "region": "SCypsceITTkJGGCV", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 245 'MockFulfillIAPItem' test.out

#- 246 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wk7HMbJhNwZgf5nl' \
    --itemId 'MDORYuXnPNJgayPF' \
    --limit '4' \
    --offset '22' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserOrders' test.out

#- 247 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y0LEBSYBdUSiTOrh' \
    --body '{"currencyCode": "B8hVs29WOKmZRTtg", "currencyNamespace": "ycLzXz6lUMKi5mwe", "discountedPrice": 79, "ext": {"cH4UJrrCKvrOAi7l": {}, "MgkVWJYzSCIDxWUx": {}, "gOzeRNHIqK5PT404": {}}, "itemId": "mFw4HJv5T2kIQOec", "language": "fLsYKTmUnKlrOsJm", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 46, "quantity": 19, "region": "1cA0PwZxTIZVSGQy", "returnUrl": "Tzhs9Asy4d629N4Y", "sandbox": false, "sectionId": "2sQuWUBBHZonSmzF"}' \
    > test.out 2>&1
eval_tap $? 247 'AdminCreateUserOrder' test.out

#- 248 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '831vlCiZAZHCWMXx' \
    --itemId 'Vh8HTrKqVwnpPn8N' \
    > test.out 2>&1
eval_tap $? 248 'CountOfPurchasedItem' test.out

#- 249 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5xMRgU7cPqNZrLCR' \
    --userId 'RUysya4J3rvTzMTM' \
    > test.out 2>&1
eval_tap $? 249 'GetUserOrder' test.out

#- 250 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SwrNov2GW9i54JY2' \
    --userId '3AUWFTLq0W1JqwKs' \
    --body '{"status": "CLOSED", "statusReason": "ddhAQ1pwqnybvUIf"}' \
    > test.out 2>&1
eval_tap $? 250 'UpdateUserOrderStatus' test.out

#- 251 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uulmeegRwPPbn7lt' \
    --userId 'td21cS6IVE4fzwG3' \
    > test.out 2>&1
eval_tap $? 251 'FulfillUserOrder' test.out

#- 252 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BHaRcZ8NK4gkLmvE' \
    --userId 'OaRcqTgF0xtQAXoD' \
    > test.out 2>&1
eval_tap $? 252 'GetUserOrderGrant' test.out

#- 253 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oFkmA3fgzcwdgJMj' \
    --userId 'IyGfiNBQy41M1gzG' \
    > test.out 2>&1
eval_tap $? 253 'GetUserOrderHistories' test.out

#- 254 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Cbaxw33rNbE4bbDU' \
    --userId '4FMTbQaANJOODGer' \
    --body '{"additionalData": {"cardSummary": "DCWcl3VSJENQopeH"}, "authorisedTime": "1986-09-17T00:00:00Z", "chargebackReversedTime": "1976-03-13T00:00:00Z", "chargebackTime": "1974-10-25T00:00:00Z", "chargedTime": "1988-08-09T00:00:00Z", "createdTime": "1989-09-20T00:00:00Z", "currency": {"currencyCode": "QIRtLfPngD83roOe", "currencySymbol": "qE7fcCAeExeQX43L", "currencyType": "REAL", "decimals": 18, "namespace": "mdMiZeyIrA4QUKSJ"}, "customParameters": {"gECzvaWUCA7wKru7": {}, "ry3AQ2sEHvSxjWoM": {}, "1rNJLM0OOVG5cG6X": {}}, "extOrderNo": "xENbWqlX7idzjpKD", "extTxId": "fwl6XlCF6YxFMD8t", "extUserId": "JQwZvUVInos5RK10", "issuedAt": "1997-04-25T00:00:00Z", "metadata": {"yH89i8ZDPXRL8cbT": "AntB1STaab1UeibX", "g7RCe5BtKcwj6Pqq": "OgCimr3ZQNBBkrXu", "9czsYr3cFeVw70xd": "NTuOdLKK0M2B2hbq"}, "namespace": "Jin37P69t1KqeGz7", "nonceStr": "qbPnXEuOzzkoBmMR", "paymentMethod": "9C4qPqJrAdh1HIk7", "paymentMethodFee": 45, "paymentOrderNo": "kyxoUzfMFoXCOguS", "paymentProvider": "STRIPE", "paymentProviderFee": 52, "paymentStationUrl": "2A4R3wDdSkNfHJtA", "price": 88, "refundedTime": "1996-03-08T00:00:00Z", "salesTax": 26, "sandbox": false, "sku": "9ZvtydbaVb0scd97", "status": "DELETED", "statusReason": "tyZKrTJo0L5sHil4", "subscriptionId": "Q0mqa8GatrjbJ5YT", "subtotalPrice": 66, "targetNamespace": "uvqarTvrG1DXZAWl", "targetUserId": "vz3c3XALMresGFfs", "tax": 68, "totalPrice": 1, "totalTax": 86, "txEndTime": "1996-12-07T00:00:00Z", "type": "CDhshvEF8rHd250n", "userId": "yihcUVGHQczI5ZoT", "vat": 90}' \
    > test.out 2>&1
eval_tap $? 254 'ProcessUserOrderNotification' test.out

#- 255 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WOJhbocoGlPzdfxc' \
    --userId 'C3rpWhSpq0InxMLp' \
    > test.out 2>&1
eval_tap $? 255 'DownloadUserOrderReceipt' test.out

#- 256 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7n7M3JXjEvsj5Wc' \
    --body '{"currencyCode": "Q99M1yuXeqV31LX2", "currencyNamespace": "ehcMnM6QtjzQjDlU", "customParameters": {"MCGnxZwak7KHnzGA": {}, "SmVzePIroz41oQCu": {}, "XeTRyJQrNLTcqLVT": {}}, "description": "N5Qf4tjPGpu27yxb", "extOrderNo": "1of79zVTWIfgdNph", "extUserId": "qe9fS1m77MAg4KoZ", "itemType": "SUBSCRIPTION", "language": "qn-646", "metadata": {"lNVk7qnmBS3XKDhp": "1OkMcErmeH0lX1hj", "0LaXgQ94flh775AQ": "fzNjQ7IuMSY2epRD", "JjDyMDKQhuTjtQZy": "IiAmCL8bNTTfqLCv"}, "notifyUrl": "9DYBOProN4UWbQaK", "omitNotification": true, "platform": "dpJ8B8VwFQnVco2o", "price": 59, "recurringPaymentOrderNo": "I3XJWBxTLcOef8Mg", "region": "IwkrKFEtwESJCe2k", "returnUrl": "sG3nZE13H2fILFzO", "sandbox": false, "sku": "ERZcKSYLo6y7yJMo", "subscriptionId": "wQ6LpHCvCYTgX9JQ", "title": "wErzjtuP9pUUv7qe"}' \
    > test.out 2>&1
eval_tap $? 256 'CreateUserPaymentOrder' test.out

#- 257 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fNMFsZAIqak1zi0J' \
    --userId 'Sa5cRn31D8ubfdXi' \
    --body '{"description": "7BycDPckeGJUgU8b"}' \
    > test.out 2>&1
eval_tap $? 257 'RefundUserPaymentOrder' test.out

#- 258 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'D5mGFFmKTTUxG0mp' \
    --body '{"code": "mFxxDNXGlGJvHf55", "orderNo": "8h1ltyhiSGhfqXhx"}' \
    > test.out 2>&1
eval_tap $? 258 'ApplyUserRedemption' test.out

#- 259 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJ7zLXioAGkWgSDd' \
    --body '{"meta": {"DQvpRfGe3z2rtjWp": {}, "JAlKHF0ebxhJ1176": {}, "CeD4dWCp4wqlQJcZ": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "Z7eGOPj2XoFug8BU", "namespace": "QUmPHnPumcazKAna"}, "entitlement": {"entitlementId": "0ji757aNDFeKnQP2"}, "item": {"itemIdentity": "j2WsQImTwYkiuxzL", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 2, "type": "ITEM"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "0BkGzCNgesQlZZHI", "namespace": "ZH0iks6kx0adnimP"}, "entitlement": {"entitlementId": "yyzezsHdFftHHR6x"}, "item": {"itemIdentity": "bcVVonwz27DWfGRV", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 3, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "TvCPrrZCTU5WUJiz", "namespace": "F69PSsquWUafwbFP"}, "entitlement": {"entitlementId": "X15633pFgA7i9tqv"}, "item": {"itemIdentity": "fHmFvUZiUW5Y0CYw", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 91, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "HE69D1MMoaf6KlgR"}' \
    > test.out 2>&1
eval_tap $? 259 'DoRevocation' test.out

#- 260 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'twaM2IoyY1wpIdjc' \
    --body '{"gameSessionId": "AtTj1IMuuhxxlulf", "payload": {"mya73hX0a8Ri85PA": {}, "9wNpmrK5Y5heA2ew": {}, "WnFcqHxXP3kRhtrB": {}}, "scid": "cBofWTGYx2ihgioL", "sessionTemplateName": "8VvEzHGTt9emdCLm"}' \
    > test.out 2>&1
eval_tap $? 260 'RegisterXblSessions' test.out

#- 261 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'zJbdkykVAnmnRfUi' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'Ycko7U3gH239LhRx' \
    --limit '43' \
    --offset '76' \
    --sku 'DiP2hNNEI8QrQ6H1' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 261 'QueryUserSubscriptions' test.out

#- 262 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '3s9UyeaFi8OE7BCK' \
    --excludeSystem  \
    --limit '4' \
    --offset '64' \
    --subscriptionId 'Tzf4dz1BojPoQg97' \
    > test.out 2>&1
eval_tap $? 262 'GetUserSubscriptionActivities' test.out

#- 263 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '6409vFd5z9r4nJWU' \
    --body '{"grantDays": 43, "itemId": "3slUe94NxhXsVcqT", "language": "Yi1TMBMzaOrxuKvt", "reason": "UVtqbDWnJ2i9TRmJ", "region": "OqIl7U12hO5vpk9D", "source": "OSgbsdGVPLD9A5Nm"}' \
    > test.out 2>&1
eval_tap $? 263 'PlatformSubscribeSubscription' test.out

#- 264 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'uZDUV3yHurgOfba1' \
    --itemId 'XeoHYTNoRol84Ulk' \
    > test.out 2>&1
eval_tap $? 264 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 265 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xtP5Vok9sNK1ORg3' \
    --userId 'tChsS3fFpaS1uq1m' \
    > test.out 2>&1
eval_tap $? 265 'GetUserSubscription' test.out

#- 266 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'H3oYfPK2QiAUhIfi' \
    --userId '17YrkWHNxiaNyqBf' \
    > test.out 2>&1
eval_tap $? 266 'DeleteUserSubscription' test.out

#- 267 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gw58Hx0XYL0fJOPY' \
    --userId 'pnPqGlPnhBDOWqDU' \
    --force  \
    --body '{"immediate": false, "reason": "DjVUt0n0jfyDbtIX"}' \
    > test.out 2>&1
eval_tap $? 267 'CancelSubscription' test.out

#- 268 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ICLkK8ZvbnTg3znl' \
    --userId 'g8nmzQx1RsYhcRlv' \
    --body '{"grantDays": 28, "reason": "6Wwe8YK3lZFslECI"}' \
    > test.out 2>&1
eval_tap $? 268 'GrantDaysToSubscription' test.out

#- 269 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9QzuQcsjFehD6uTD' \
    --userId 'YnqyNgN7GoeMsezF' \
    --excludeFree  \
    --limit '24' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 269 'GetUserSubscriptionBillingHistories' test.out

#- 270 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'sHwIGGsusS0zZROD' \
    --userId 'EKPdudZsLaf8aZrX' \
    --body '{"additionalData": {"cardSummary": "W84dt0TSTmy7XF26"}, "authorisedTime": "1989-03-04T00:00:00Z", "chargebackReversedTime": "1999-02-14T00:00:00Z", "chargebackTime": "1995-11-19T00:00:00Z", "chargedTime": "1983-06-11T00:00:00Z", "createdTime": "1987-06-05T00:00:00Z", "currency": {"currencyCode": "FkP7O3F4vsohRWDy", "currencySymbol": "GYIVFDbTvRYfpJ4w", "currencyType": "REAL", "decimals": 55, "namespace": "WZfOOxAzmsbhi5QJ"}, "customParameters": {"uc2SNBaOlXfgsgBd": {}, "7MYLLoPZrkjRm5Ki": {}, "0orhXrISEaPZHLQk": {}}, "extOrderNo": "THvndQsCKAO2JRz3", "extTxId": "CGwtujkzxidLcAQW", "extUserId": "GVRg6DVso5TJCSug", "issuedAt": "1972-10-22T00:00:00Z", "metadata": {"o4XTm8t1YTWqItjN": "WXm9sraeMA78YSRS", "2fPy5fpbbbMIu9lu": "18jIMBUM77XmemN8", "LO03mnFSq9jJTVFo": "FjxZjh5qUR1Pq4a4"}, "namespace": "uaMfd0SQAfYIyzHL", "nonceStr": "8jxakuVu5r5B08VZ", "paymentMethod": "xI4TU3apnZXoJ4gI", "paymentMethodFee": 39, "paymentOrderNo": "EQKO8xC4D0FsUo3I", "paymentProvider": "WXPAY", "paymentProviderFee": 0, "paymentStationUrl": "2kX5REQZsHyXzoIX", "price": 80, "refundedTime": "1999-02-09T00:00:00Z", "salesTax": 74, "sandbox": false, "sku": "bL9HyJttdgfLGO3u", "status": "CHARGEBACK_REVERSED", "statusReason": "rq1xsGpdobYun8hc", "subscriptionId": "O55hVjfWyK02w5Qy", "subtotalPrice": 40, "targetNamespace": "crZzgameT2mLkkAM", "targetUserId": "jHyI0e2Axj0nZHjm", "tax": 29, "totalPrice": 75, "totalTax": 20, "txEndTime": "1988-07-10T00:00:00Z", "type": "JngwMe1AnQVj6QQj", "userId": "ZtkNJCnDSrsSey2B", "vat": 33}' \
    > test.out 2>&1
eval_tap $? 270 'ProcessUserSubscriptionNotification' test.out

#- 271 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'EctVEux2MSuwsEHl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wdeJyhsHS6YqPudW' \
    --body '{"count": 43, "orderNo": "l2EFEb8GnsthmQ2Y"}' \
    > test.out 2>&1
eval_tap $? 271 'AcquireUserTicket' test.out

#- 272 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '6ZGOiqrg3lpqN5bO' \
    > test.out 2>&1
eval_tap $? 272 'QueryUserCurrencyWallets' test.out

#- 273 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'fnqJ5bzDRzbhMxfE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DE4TrtIHyyMq79Ed' \
    --body '{"allowOverdraft": true, "amount": 49, "balanceOrigin": "Epic", "reason": "MxaF8QHGM2IuQYBO"}' \
    > test.out 2>&1
eval_tap $? 273 'DebitUserWalletByCurrencyCode' test.out

#- 274 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '8m0HgTth479W8rXq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wGVIRWgTNHCka3Wb' \
    --limit '50' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 274 'ListUserCurrencyTransactions' test.out

#- 275 CheckWallet
eval_tap 0 275 'CheckWallet # SKIP deprecated' test.out

#- 276 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'F6WDHn3ePBxQNz2I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UEHMzl5jhwVDsuzw' \
    --body '{"amount": 73, "expireAt": "1992-06-25T00:00:00Z", "origin": "Steam", "reason": "50eoaIBrTh0EKkJi", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 276 'CreditUserWallet' test.out

#- 277 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'ckjphURs4ksgsKJ2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6Jacwwu8W1zvrKM' \
    --body '{"amount": 90, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 277 'PayWithUserWallet' test.out

#- 278 GetUserWallet
eval_tap 0 278 'GetUserWallet # SKIP deprecated' test.out

#- 279 DebitUserWallet
eval_tap 0 279 'DebitUserWallet # SKIP deprecated' test.out

#- 280 DisableUserWallet
eval_tap 0 280 'DisableUserWallet # SKIP deprecated' test.out

#- 281 EnableUserWallet
eval_tap 0 281 'EnableUserWallet # SKIP deprecated' test.out

#- 282 ListUserWalletTransactions
eval_tap 0 282 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 283 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PvwA9k6yJz03NETd' \
    > test.out 2>&1
eval_tap $? 283 'ListViews' test.out

#- 284 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ywPqYerrpOm4M2pM' \
    --body '{"displayOrder": 66, "localizations": {"fIfcHBWZM50aHbPX": {"description": "Rns3qwYL6LwGlZGF", "localExt": {"7XQPLAcIL7FvAMWq": {}, "hyyNZH1CducB5y5i": {}, "MdeBG7REG4meKEab": {}}, "longDescription": "fVXBJPIZqZC5d6Ju", "title": "FdcfiNf0DOHKwxDF"}, "5GJhCjVHiCn2hTef": {"description": "T8gPFJ4WndMpQhcL", "localExt": {"K0WTZbtmQkwC8azx": {}, "3IRWme3C6p2r4D3N": {}, "QdjrjkX3AMgK3JgZ": {}}, "longDescription": "ufzssA284mG7uAoj", "title": "LYBsx8oqMzbE0ljQ"}, "aBtb47V691j0FZp2": {"description": "vjOXptxzx6kkaZYp", "localExt": {"l52sQR9Znp5d1eSw": {}, "rG2GBBEWrDbQ1Zzh": {}, "DuLHq9LTBstguOdN": {}}, "longDescription": "0O7l3GbKPHdDTQDE", "title": "EE2mTsn1NwJ71szs"}}, "name": "NmnqZSWdEyOVYrTd"}' \
    > test.out 2>&1
eval_tap $? 284 'CreateView' test.out

#- 285 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Dq7IqbTVv8BLsqQW' \
    --storeId '8HSrEm5Y7jI232Sj' \
    > test.out 2>&1
eval_tap $? 285 'GetView' test.out

#- 286 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'ktijiNzTUe8KdizX' \
    --storeId 'mrmK0sCUsqxKocHo' \
    --body '{"displayOrder": 26, "localizations": {"vOmfVNJNDaSO3FEk": {"description": "k4It6V8Bu7rIjGrx", "localExt": {"UMKbv60ixUuUhopd": {}, "qGrqRZ124P7PauXT": {}, "rpWAjwatSvtPbAFn": {}}, "longDescription": "8oWQcmFkkRX6Eqad", "title": "AEIzxld80Ynss7hc"}, "3VUxxZIgkTLqMeJP": {"description": "Cbs8jWmTteJhwNbw", "localExt": {"HGG39YAZJ4HuLfeT": {}, "fFBTOFFMJ9pq511j": {}, "ZcTK8zmMfyshYk3b": {}}, "longDescription": "5cAFVo85r1b8Yp2Q", "title": "nuhQuIdvZdj6AspW"}, "BfRnLcLbp7OmcrDJ": {"description": "7u1rrRPcnG89rnNW", "localExt": {"1Yjfn8lY4DnYRxY8": {}, "ZhHeb0CaPFDjrSot": {}, "KnpJWALpToj9rgr5": {}}, "longDescription": "RffM5JXvPdzEpDln", "title": "04F8BQjzobhDa8Vx"}}, "name": "KOrfVfBRIfkStOqd"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateView' test.out

#- 287 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'XqhDMQ6tBLljC7gc' \
    --storeId 'T3M1DArk4L80aXFY' \
    > test.out 2>&1
eval_tap $? 287 'DeleteView' test.out

#- 288 QueryWallets
eval_tap 0 288 'QueryWallets # SKIP deprecated' test.out

#- 289 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 18, "expireAt": "1994-09-07T00:00:00Z", "origin": "Xbox", "reason": "u4CNtX2lnqi7cHTS", "source": "ACHIEVEMENT"}, "currencyCode": "eoRIplY0DIzRCNAO", "userIds": ["6ZpqXJmPJso6M11L", "LZWKgWxn9YL16HQd", "tAneXGgxNg33ZIUr"]}, {"creditRequest": {"amount": 72, "expireAt": "1983-03-23T00:00:00Z", "origin": "Playstation", "reason": "fmdXVvaPQzzKdFg7", "source": "REWARD"}, "currencyCode": "rF3SmgudQusJLsPl", "userIds": ["rDzNgVEcw0lxRam1", "6O6v4VjJf40LjUdO", "W7ZyORFkN9EbKbTb"]}, {"creditRequest": {"amount": 90, "expireAt": "1996-09-05T00:00:00Z", "origin": "Twitch", "reason": "67n9PT9fR7mMuBXP", "source": "REDEEM_CODE"}, "currencyCode": "fp41k1uDg59PhdUX", "userIds": ["eR3EYXBFpUX9y4tY", "ShabwyYCxTHrDel8", "oThvr8CUEzw4zL1Q"]}]' \
    > test.out 2>&1
eval_tap $? 289 'BulkCredit' test.out

#- 290 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "7o5FFi1n10vDgyoH", "request": {"allowOverdraft": false, "amount": 95, "balanceOrigin": "Oculus", "reason": "AlW75icIKUpXazsF"}, "userIds": ["rmaGNoi3RPTgWotL", "7e0EJnADXC2y0DY1", "Nz0u8ySxA0yrjz4q"]}, {"currencyCode": "E1SMK9oA4vK56dsY", "request": {"allowOverdraft": false, "amount": 99, "balanceOrigin": "Other", "reason": "5pDANyJ184miBhdV"}, "userIds": ["C6f2MHGGedk0KzXR", "VIwRMtwApGbXnR3y", "Jt81fmLSyGuu5rbJ"]}, {"currencyCode": "clOXdPYZQxBnttu4", "request": {"allowOverdraft": true, "amount": 100, "balanceOrigin": "IOS", "reason": "5etl4Xk8Hd1lRtoP"}, "userIds": ["npbx8MCIjKzylqW8", "Mvsu9oswEPTvzwwG", "auyseP9wEEyYAnHP"]}]' \
    > test.out 2>&1
eval_tap $? 290 'BulkDebit' test.out

#- 291 GetWallet
eval_tap 0 291 'GetWallet # SKIP deprecated' test.out

#- 292 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'p4XzVL5McglFCrjx' \
    --end 'qqxAYqXG2V3baMkZ' \
    --start '9JCqBIkUID0EE9In' \
    > test.out 2>&1
eval_tap $? 292 'SyncOrders' test.out

#- 293 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["ZNLwwAhW2b5OHKtU", "v4lTkQNjxhXdj1CG", "0EBgst9Qu8Ofl2oB"], "apiKey": "8VTjF0pD3NHU8iYU", "authoriseAsCapture": true, "blockedPaymentMethods": ["p8zGqNGrcQyoA1TW", "Pcy83iXfYXNdMkdg", "9TMwxNcQ6CkVi8fq"], "clientKey": "VPRqNbF5yLnYSa8x", "dropInSettings": "FLvcYexMMMiDFh5R", "liveEndpointUrlPrefix": "bW021cHN3QbzVuJZ", "merchantAccount": "H3k54cExxWKtdGTW", "notificationHmacKey": "4FILotv5ycTa0i6i", "notificationPassword": "fYP1zfgjsy3VRjX4", "notificationUsername": "qA4g9OGoWw1qnCAv", "returnUrl": "dnAcokJ0rzqX2KJc", "settings": "YHgiFDxclBXap6j7"}' \
    > test.out 2>&1
eval_tap $? 293 'TestAdyenConfig' test.out

#- 294 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "3doCWxhubMXbxNvT", "privateKey": "6wAffv4uzKAwiI4w", "publicKey": "TxNIefCmtrxWu293", "returnUrl": "551nQBNKcqCkUXRj"}' \
    > test.out 2>&1
eval_tap $? 294 'TestAliPayConfig' test.out

#- 295 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "8gQHEe4CO370Osbz", "secretKey": "RKKPd6mjzLxllUrF"}' \
    > test.out 2>&1
eval_tap $? 295 'TestCheckoutConfig' test.out

#- 296 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Yn7cSuO7NxKHUHg0' \
    > test.out 2>&1
eval_tap $? 296 'DebugMatchedPaymentMerchantConfig' test.out

#- 297 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "c4X7fHdITmN9opaF", "clientSecret": "0kh3pCRB3infEVxA", "returnUrl": "rF7TB6A6a71zAJpa", "webHookId": "PeudUtKPJUmAvxBx"}' \
    > test.out 2>&1
eval_tap $? 297 'TestPayPalConfig' test.out

#- 298 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["JNPlvvYZw4MWzWFT", "uNPf5JCSDyYy4e5q", "oTZxSoZbQUnUxS6m"], "publishableKey": "68WL3HDL4yx5I0eu", "secretKey": "BsccHPA2v9XP9enf", "webhookSecret": "EX7lloLgIYqxFfSN"}' \
    > test.out 2>&1
eval_tap $? 298 'TestStripeConfig' test.out

#- 299 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "JlHCjxLNnYUlGQsF", "key": "py9ZVlLIFwLgT78n", "mchid": "ootfUs9559ilm3ca", "returnUrl": "uhrw9Yn2z5cnbm7z"}' \
    > test.out 2>&1
eval_tap $? 299 'TestWxPayConfig' test.out

#- 300 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "2Aa24yBTw3wfNGyW", "flowCompletionUrl": "f3VujS7Bq5bcfPW4", "merchantId": 32, "projectId": 65, "projectSecretKey": "PZB9YXltCxyztUnj"}' \
    > test.out 2>&1
eval_tap $? 300 'TestXsollaConfig' test.out

#- 301 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '17t3gHBXvjvziexz' \
    > test.out 2>&1
eval_tap $? 301 'GetPaymentMerchantConfig' test.out

#- 302 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'OLbOWbtcJUxM3AWy' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["DkA5LmART6kulpM4", "SRtUE5P4kxmHtFbj", "qurHix0QYycDH5we"], "apiKey": "2Mx0sYCnYPT4i4mx", "authoriseAsCapture": false, "blockedPaymentMethods": ["J8dkAVOJ5imghdfV", "hjnjd66A1SQmWGSQ", "LAVPAJ7zX5lB80k2"], "clientKey": "smdkBS2MaIP7Pjng", "dropInSettings": "EFggq91cpgvoDBgY", "liveEndpointUrlPrefix": "fLBdGNAZEvbvxqa0", "merchantAccount": "K7VUbjUnzirnEsxS", "notificationHmacKey": "E4vBzG7VK8sWEshm", "notificationPassword": "Zf5fEdvjbyJPQ1qd", "notificationUsername": "RcJjsme1OukIfIZV", "returnUrl": "H8q8svV5hMOSfpyJ", "settings": "kJlmJmTkFvB7wkY6"}' \
    > test.out 2>&1
eval_tap $? 302 'UpdateAdyenConfig' test.out

#- 303 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'nuUEGJ3k0HGtpK43' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 303 'TestAdyenConfigById' test.out

#- 304 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'uORGREOOwTuY8dhN' \
    --sandbox  \
    --validate  \
    --body '{"appId": "CDWWpN3B6tedgFUz", "privateKey": "Bm5vGA3itKaF9z3W", "publicKey": "Wuv3j8T9g1f6P3D3", "returnUrl": "rVcC2g6t42jE1Wad"}' \
    > test.out 2>&1
eval_tap $? 304 'UpdateAliPayConfig' test.out

#- 305 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '232YV7A2zHFGbN8A' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 305 'TestAliPayConfigById' test.out

#- 306 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'QaCaw9UF7cdSDd99' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "DQZ7vnTx8HDXTJWi", "secretKey": "yw17ogzmbj4SLYDr"}' \
    > test.out 2>&1
eval_tap $? 306 'UpdateCheckoutConfig' test.out

#- 307 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'ZJvDLGvn6qtroZcp' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 307 'TestCheckoutConfigById' test.out

#- 308 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '16HKXX1ft5nBA9xN' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "IJVuMz04evSdE2FM", "clientSecret": "cKd7c94rEmIYuAT5", "returnUrl": "OAcUwYHGmG5rNDBF", "webHookId": "1oU37vjfyX5YLaM0"}' \
    > test.out 2>&1
eval_tap $? 308 'UpdatePayPalConfig' test.out

#- 309 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'wmi0i1WABBbq8IzZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 309 'TestPayPalConfigById' test.out

#- 310 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'sMFLX9ZhFXcFtfBS' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["3ZIHofhwyM6Bw2sF", "GQ5DQoDwzrKPOZZn", "V3zR7YxSu6addocg"], "publishableKey": "10Hy9jx7gBHTOHHA", "secretKey": "rjld0LnREsrrB2pJ", "webhookSecret": "7V8BSrucjO3zvSM5"}' \
    > test.out 2>&1
eval_tap $? 310 'UpdateStripeConfig' test.out

#- 311 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'KeVNHU9GcOivIfcC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 311 'TestStripeConfigById' test.out

#- 312 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'Jt4U8VSgXoi9Fw25' \
    --validate  \
    --body '{"appId": "b9qXzlIK2G6AUjBC", "key": "df0Rp5e5IvFuN1oU", "mchid": "sCnBmGMx5F6EhM3d", "returnUrl": "KvIG9MR0hTINvq1V"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateWxPayConfig' test.out

#- 313 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'R9SJUfQEX996Mh1s' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 313 'UpdateWxPayConfigCert' test.out

#- 314 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'Q3Dw3uyjgQNAs918' \
    > test.out 2>&1
eval_tap $? 314 'TestWxPayConfigById' test.out

#- 315 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '8Qm3W1De2McGd10w' \
    --validate  \
    --body '{"apiKey": "efF0CJlH55RLEgeA", "flowCompletionUrl": "sSpQdcmGHZuRVQ8t", "merchantId": 51, "projectId": 49, "projectSecretKey": "wqMayP8A3HGNI3Bf"}' \
    > test.out 2>&1
eval_tap $? 315 'UpdateXsollaConfig' test.out

#- 316 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'jkFd6MHo6gGQ5mCh' \
    > test.out 2>&1
eval_tap $? 316 'TestXsollaConfigById' test.out

#- 317 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'YoKD7yqCR03RovQZ' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "LARGE", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 317 'UpdateXsollaUIConfig' test.out

#- 318 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '19' \
    --namespace "$AB_NAMESPACE" \
    --offset '22' \
    --region '78mhb2I2yBJeCJgh' \
    > test.out 2>&1
eval_tap $? 318 'QueryPaymentProviderConfig' test.out

#- 319 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "rk68FWFzuLBdlrKj", "region": "UbgZQfw6Zys3mN8f", "sandboxTaxJarApiToken": "IcC9CkharfqaoMsG", "specials": ["WXPAY", "WALLET", "ADYEN"], "taxJarApiToken": "1RuSNdycDssUeHiV", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 319 'CreatePaymentProviderConfig' test.out

#- 320 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 320 'GetAggregatePaymentProviders' test.out

#- 321 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'XzSJ8kbFAyidbnXd' \
    > test.out 2>&1
eval_tap $? 321 'DebugMatchedPaymentProviderConfig' test.out

#- 322 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 322 'GetSpecialPaymentProviders' test.out

#- 323 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'MSwmkBkKC1h6h45u' \
    --body '{"aggregate": "XSOLLA", "namespace": "W8aLjIxVGpdOqgux", "region": "vRwI9ZBTipMRlhK9", "sandboxTaxJarApiToken": "DMMaI4ryVDvNaruZ", "specials": ["WXPAY", "WALLET", "WALLET"], "taxJarApiToken": "AkVH75UcmNXK5Rqc", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 323 'UpdatePaymentProviderConfig' test.out

#- 324 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '9lpz9oM52vHPlwVV' \
    > test.out 2>&1
eval_tap $? 324 'DeletePaymentProviderConfig' test.out

#- 325 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 325 'GetPaymentTaxConfig' test.out

#- 326 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "3jlPKDEYahnlLJaL", "taxJarApiToken": "CvjRKKX1brmkJDfd", "taxJarEnabled": false, "taxJarProductCodesMapping": {"TwBufUorJouduhCE": "J5XiKDIE9YugcupL", "xVBcRkfhRuqkOTHS": "ia7oFd1fEmDuyAsQ", "GzwJR5poI718RQnj": "4imu6XFfRcWDXhq1"}}' \
    > test.out 2>&1
eval_tap $? 326 'UpdatePaymentTaxConfig' test.out

#- 327 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'YmGeygr2S4Yw8NmP' \
    --end 'aBeryzX2hOPVVFqV' \
    --start 'qxjq1iG3TySOh8SI' \
    > test.out 2>&1
eval_tap $? 327 'SyncPaymentOrders' test.out

#- 328 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '75oXbyq8FBbur80Q' \
    --storeId 'wnlgAVfqz6gQJh8s' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetRootCategories' test.out

#- 329 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'n0bVWRkvmAemh8li' \
    --storeId 'oBR7xTXcEIFod3lC' \
    > test.out 2>&1
eval_tap $? 329 'DownloadCategories' test.out

#- 330 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'zvjHzDHOrSJ1vbB7' \
    --namespace "$AB_NAMESPACE" \
    --language 'LRHd96dGLgkfrZve' \
    --storeId 'FMWAFT7l0l1jaOAM' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetCategory' test.out

#- 331 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'CzbsoIgmKwwMDQPj' \
    --namespace "$AB_NAMESPACE" \
    --language 'UIosq1l6xo0D4JRb' \
    --storeId 'NqO6IuP2PY5hhX6u' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetChildCategories' test.out

#- 332 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Nah9JoHPj7jFWxSv' \
    --namespace "$AB_NAMESPACE" \
    --language '1lYylYAiZ8c7Zd7E' \
    --storeId 'UoezOLw8C1c5bBB3' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetDescendantCategories' test.out

#- 333 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 333 'PublicListCurrencies' test.out

#- 334 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 334 'GetIAPItemMapping' test.out

#- 335 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '7ColKwlsNvtFuunQ' \
    --region 'svdXGlD40xxIyVwY' \
    --storeId 'jn6dlC9Kfh9gHulo' \
    --appId 'yce0cLJu4ljPWlCW' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetItemByAppId' test.out

#- 336 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'uGO8MnfOQu3wdT4A' \
    --categoryPath 'odp95o1RkX7iW7Vp' \
    --features 'CngWAv5DAG8dPdkK' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'detOic9AQOFWpdIt' \
    --limit '76' \
    --offset '81' \
    --region 'BhvKJq9tWz9yui8a' \
    --sortBy 'displayOrder:asc,name:desc' \
    --storeId 'Q421q7Nb1vrKthVv' \
    --tags 'U5on065ApCkVN3Qc' \
    > test.out 2>&1
eval_tap $? 336 'PublicQueryItems' test.out

#- 337 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'huQ6pntxB648ss7r' \
    --region 'BnvQHAM8gSdIybKU' \
    --storeId 'ByHBzfvgtRTPPzwJ' \
    --sku 'mKaLCx3gcidEALWe' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetItemBySku' test.out

#- 338 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language '6RG5wWznu5AjwR1Z' \
    --region '4fU7ICcaQtuuKUw3' \
    --storeId 'dUwWHhQW3I1y9tjR' \
    --itemIds 'LVOXBMa0JiIe1AY0' \
    > test.out 2>&1
eval_tap $? 338 'PublicBulkGetItems' test.out

#- 339 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["tUA7EKASk3USNLhO", "BlxRBLgohp8ByTi2", "F6AyUX8w77riPlPg"]}' \
    > test.out 2>&1
eval_tap $? 339 'PublicValidateItemPurchaseCondition' test.out

#- 340 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '72' \
    --offset '5' \
    --region 'v4rpqtzDaz0WUJlB' \
    --storeId 'CHzJ2v9K8c1zOlZg' \
    --keyword '30pagfP0FfOMBOpe' \
    --language 'QT4zYIbU4i9mLyX4' \
    > test.out 2>&1
eval_tap $? 340 'PublicSearchItems' test.out

#- 341 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '6Alt08rrnG8y2ScX' \
    --namespace "$AB_NAMESPACE" \
    --language 'kwjpAp82pGcxvXaG' \
    --region '9LzHpMS53jllopwi' \
    --storeId 'rRo3A8WxnR0YaMsF' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetApp' test.out

#- 342 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '3f5KLtpTSsPMGDZT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'PublicGetItemDynamicData' test.out

#- 343 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'OwEP5Bhh0NStWIgg' \
    --namespace "$AB_NAMESPACE" \
    --language 'mhfAzVdNYP7Ao1z7' \
    --populateBundle  \
    --region 'FeJM2fWXGk7JObSH' \
    --storeId 'ksRkabpmvRsc7ZYv' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetItem' test.out

#- 344 GetPaymentCustomization
eval_tap 0 344 'GetPaymentCustomization # SKIP deprecated' test.out

#- 345 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "XCT6m6mRZAlLBczJ", "paymentProvider": "PAYPAL", "returnUrl": "eil7GbG1ISBCkcnp", "ui": "xKUxLjmxhBS6YypR", "zipCode": "W7fNntaIEtDI6Mbh"}' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetPaymentUrl' test.out

#- 346 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xkQdezbmf392erso' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetPaymentMethods' test.out

#- 347 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Z2KbMb5jal0ruZmB' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUnpaidPaymentOrder' test.out

#- 348 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XlGSp85q6fuGfo5w' \
    --paymentProvider 'STRIPE' \
    --zipCode 'DHnyabk493I3pvHK' \
    --body '{"token": "DaWhTN1qyxpUzWIZ"}' \
    > test.out 2>&1
eval_tap $? 348 'Pay' test.out

#- 349 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WJTDzWguhujw1EoR' \
    > test.out 2>&1
eval_tap $? 349 'PublicCheckPaymentOrderPaidStatus' test.out

#- 350 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'uCVldefonHJZAiX4' \
    > test.out 2>&1
eval_tap $? 350 'GetPaymentPublicConfig' test.out

#- 351 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'abmqqi90KTWwZk0H' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetQRCode' test.out

#- 352 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'GeJNaBjVdMB5kMzK' \
    --foreinginvoice 'ycYrhr4FnNzdT4pW' \
    --invoiceId 'wIVXp9avUr6IydpX' \
    --payload 'W0MO0eT9okl6MlWO' \
    --redirectResult 'l9feWO2bmOikTBJH' \
    --resultCode 'TEm5PSeyod5L6Ooo' \
    --sessionId 'YoQn9iHEqWO1cVCU' \
    --status 'IOx90FQdwLi3GOQk' \
    --token 'LtpuRNeT1CULEMPa' \
    --type 'OU5nukycAUlkUSZK' \
    --userId 'UrsxNRzF3NaUuCyQ' \
    --orderNo 'yze6zPKu5sE89JW8' \
    --paymentOrderNo 'UU0RsB6dvrpmInhH' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'zVVlHGFSwjby6rMY' \
    > test.out 2>&1
eval_tap $? 352 'PublicNormalizePaymentReturnUrl' test.out

#- 353 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'kVQnZDUAbINRKQsx' \
    --paymentOrderNo 'UO1YMxAndOj5O6IB' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 353 'GetPaymentTaxValue' test.out

#- 354 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '8goZgsX4RwfM4qnU' \
    > test.out 2>&1
eval_tap $? 354 'GetRewardByCode' test.out

#- 355 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'dcQqZ9F1uivPob0Y' \
    --limit '3' \
    --offset '62' \
    --sortBy 'rewardCode:desc,namespace,namespace:desc' \
    > test.out 2>&1
eval_tap $? 355 'QueryRewards1' test.out

#- 356 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'XQACDDQryNf9VGxb' \
    > test.out 2>&1
eval_tap $? 356 'GetReward1' test.out

#- 357 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'PublicListStores' test.out

#- 358 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'OeJe4n9eUlBQZ2UG,ePWXbAyGiXa9nUsH,CVicuJ7onrUXVlB6' \
    --itemIds 'xNel4Bxb9KwFYqdh,EVq3hbsApeASfR0l,jKxqZcLuhwNDvVal' \
    --skus 'v3bkoMXNzl1ywEPi,unixlEAHZzHs8x5o,PSkZFIV2feXnTRlz' \
    > test.out 2>&1
eval_tap $? 358 'PublicExistsAnyMyActiveEntitlement' test.out

#- 359 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'AJy9oFOHB2KEsIdt' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 360 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'Y1yxl7zeEpmSPO6K' \
    > test.out 2>&1
eval_tap $? 360 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 361 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'CdjaJuUzFIeqaVr1' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 362 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'CE1gu6cYuzC77J4i,rvZ9tktWLtDdlmVG,K6iolEw6IIpDc9X5' \
    --itemIds 'ijmtDGvd9ESdY0eT,kBWA44Qqsi5yOjvl,5sRN2ENn1RLi5iMP' \
    --skus 'nbg7o1zYpqUsliPy,XZGYIW5ZDtWbdkzP,P47RcUIi2CoNj4EG' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetEntitlementOwnershipToken' test.out

#- 363 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "2emxKQk8cBrt5E8k", "language": "SW_GcKK", "region": "ICP75cm8YDChFi3z"}' \
    > test.out 2>&1
eval_tap $? 363 'SyncTwitchDropsEntitlement' test.out

#- 364 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'LvfQWC85MxWxvW0v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 364 'PublicGetMyWallet' test.out

#- 365 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFl3uU1aMD0mczWx' \
    --body '{"epicGamesJwtToken": "c8f1s2QPMMZsf2dv"}' \
    > test.out 2>&1
eval_tap $? 365 'SyncEpicGameDLC' test.out

#- 366 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'KZyHChRPHvdkcKW2' \
    > test.out 2>&1
eval_tap $? 366 'SyncOculusDLC' test.out

#- 367 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1B5EFtD2pYaKTz1g' \
    --body '{"serviceLabel": 5}' \
    > test.out 2>&1
eval_tap $? 367 'PublicSyncPsnDlcInventory' test.out

#- 368 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppZNOkqxc42HKv5w' \
    --body '{"serviceLabels": [25, 44, 39]}' \
    > test.out 2>&1
eval_tap $? 368 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 369 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9mYBvtOwxjqyrjD' \
    --body '{"appId": "ApeN5eAfRqSgH5xI", "steamId": "uBTYOdsvNyk52MQF"}' \
    > test.out 2>&1
eval_tap $? 369 'SyncSteamDLC' test.out

#- 370 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'kVVEf36S7yPgG48b' \
    --body '{"xstsToken": "k6PwH1tdEAJSqXA0"}' \
    > test.out 2>&1
eval_tap $? 370 'SyncXboxDLC' test.out

#- 371 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wv0zWGvkc6byp3mv' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'YT3GuaZVTxBlw1IW' \
    --features 'eXKFT4rfSbbSlDPG,f9Fn32SJNPZkEfkA,cJTMS4pVRcCHIGfm' \
    --itemId 'CMTr9ACnI2sMrEgl,7ZR1HCkf2Sw78lLG,KjDHuXt358gzqRMu' \
    --limit '79' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 371 'PublicQueryUserEntitlements' test.out

#- 372 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PrIekxq58fikq83h' \
    --appId 'qJ7HP63Se6kVW5fk' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetUserAppEntitlementByAppId' test.out

#- 373 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'l60ImLBv6nUU0r1r' \
    --limit '11' \
    --offset '65' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 373 'PublicQueryUserEntitlementsByAppType' test.out

#- 374 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9stpvJUuyPdzx8BM' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'wEgTtLRT5stwQFUE' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserEntitlementByItemId' test.out

#- 375 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bTPQ8p7VMlxEXnqH' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'Tw6YKhVrYkMqXkQ7' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetUserEntitlementBySku' test.out

#- 376 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qlaJjSYEseBYCFGo' \
    --appIds 'KpXx60GmEX9x2BYp,yKEBQ7TW7lZvDbwF,JJhBRdq8BgAI81k4' \
    --itemIds 'Gr7jVVx5l3yrH9HR,4reG0HwUXxQTf5Yp,DUGYsJBEkYUrLv4q' \
    --skus 'UiTkFcLBrg2JB0Wi,CpVBwvAffJ3btt0P,pQY3Pnnic80yEO8d' \
    > test.out 2>&1
eval_tap $? 376 'PublicExistsAnyUserActiveEntitlement' test.out

#- 377 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6Jh10XMUGeDavCK' \
    --appId 'radJmJFUsU418vAl' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 378 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mfGg9NO1Z2DvnAxH' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'pS3jyCkGKltBNE2U' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 379 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhNtH3yYg4Qnn2uh' \
    --ids 'dw7C9Bx1LQOTCbAP,LC3iqrkyJFOVaewF,cv9h31YxuZnoSesW' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 380 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLUHjGaIcZN28gH4' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'QBuZK5GJlBncg8tQ' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 381 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'nJOKHC16xjJZ4kiU' \
    --namespace "$AB_NAMESPACE" \
    --userId '3N8556ll2LQWpdES' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetUserEntitlement' test.out

#- 382 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'OBV7wZJsg7wSv9ly' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyTdYBUljvBzvYNE' \
    --body '{"options": ["tfgBFikt18cQ677S", "otDEtU2xBSEQ8rBK", "c2K6oJXxVEfnaqX8"], "requestId": "NuZtRUTKUvR69PIm", "useCount": 51}' \
    > test.out 2>&1
eval_tap $? 382 'PublicConsumeUserEntitlement' test.out

#- 383 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'z4kvEv6tNjGRhrmR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AxRGeIKGlCJmDXpj' \
    --body '{"requestId": "yvLSHB1y3klHuAGn", "useCount": 16}' \
    > test.out 2>&1
eval_tap $? 383 'PublicSellUserEntitlement' test.out

#- 384 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Clc3RDXF5055tUle' \
    --body '{"code": "nimjIbm0riCaNp8d", "language": "Wcne", "region": "1T5FzYMf1jaCgZos"}' \
    > test.out 2>&1
eval_tap $? 384 'PublicRedeemCode' test.out

#- 385 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ntPzP1vXXB92q150' \
    --body '{"excludeOldTransactions": true, "language": "cEpT_985", "productId": "p7lUfQqXrqGadwvK", "receiptData": "lJFX1ZHV9yo9Ur1h", "region": "fhmGEKuVUZdCacRG", "transactionId": "ataPrcgTcA71dtqt"}' \
    > test.out 2>&1
eval_tap $? 385 'PublicFulfillAppleIAPItem' test.out

#- 386 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUN4zvBzGh3mhIDN' \
    --body '{"epicGamesJwtToken": "uMBZegHtB9uTCiiI"}' \
    > test.out 2>&1
eval_tap $? 386 'SyncEpicGamesInventory' test.out

#- 387 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'oMZCjGiOZJpUf9Rp' \
    --body '{"autoAck": false, "language": "FIf_bpUF_zA", "orderId": "OQznHZTj8oYfWOby", "packageName": "NJKVSQsaCokoGynp", "productId": "6xcqNKJnAhrSt96O", "purchaseTime": 1, "purchaseToken": "Dac7hSLldWx5Dyni", "region": "VESUgrROrP1ip3jN"}' \
    > test.out 2>&1
eval_tap $? 387 'PublicFulfillGoogleIAPItem' test.out

#- 388 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'G68DByf2UMPtigq9' \
    > test.out 2>&1
eval_tap $? 388 'SyncOculusConsumableEntitlements' test.out

#- 389 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'zOQOcAqBj0bXhOr9' \
    --body '{"currencyCode": "OHt6zx1i2W3GY7td", "price": 0.12207897848536342, "productId": "8hHlQyMlgfkTsATh", "serviceLabel": 77}' \
    > test.out 2>&1
eval_tap $? 389 'PublicReconcilePlayStationStore' test.out

#- 390 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '0aWrshpmb1C9Al7e' \
    --body '{"currencyCode": "WrbNRE0xyYPUZHyL", "price": 0.5165277656422274, "productId": "Q52IjGpRJCUJpscO", "serviceLabels": [93, 22, 63]}' \
    > test.out 2>&1
eval_tap $? 390 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 391 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oq6BFjmN4OqKGLRp' \
    --body '{"appId": "NWzKZtZnxgywmr4C", "currencyCode": "YNGm7Tk1mMyeNRsj", "language": "VteQ_Vouf", "price": 0.6872585066027621, "productId": "NL6ijLRvQOgoaBoo", "region": "TawHLMxhx9nC3o6p", "steamId": "XU5MDJLCB6WbXWIR"}' \
    > test.out 2>&1
eval_tap $? 391 'SyncSteamInventory' test.out

#- 392 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pgjooaBVemsbkaXZ' \
    --body '{"gameId": "Q6nTj9rZpkSntuOe", "language": "Yq-Eifk-329", "region": "L7aZUY9d1Idud8bj"}' \
    > test.out 2>&1
eval_tap $? 392 'SyncTwitchDropsEntitlement1' test.out

#- 393 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YeBVMr7zHYmRE4X3' \
    --body '{"currencyCode": "6KUOdfEmoIYwSxxA", "price": 0.30242147528195873, "productId": "fwDMivWqHHGlnAnE", "xstsToken": "u6EKYceTEqYudHlA"}' \
    > test.out 2>&1
eval_tap $? 393 'SyncXboxInventory' test.out

#- 394 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '4AxeEIfUxJ2xMSNN' \
    --itemId 'BxCeN3pGn46fGvod' \
    --limit '41' \
    --offset '83' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 394 'PublicQueryUserOrders' test.out

#- 395 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'CSmmT3WKijbqhT3u' \
    --body '{"currencyCode": "yQRXvvcUYDeWPZ8y", "discountedPrice": 14, "ext": {"h2nHQwpWi8HZ6C0V": {}, "J0fK2m6lQ5Ao8TIT": {}, "YiHSR2SEJh1YDedZ": {}}, "itemId": "dNqkXPWZfT8ZfdKp", "language": "nNA_cUJk", "price": 55, "quantity": 16, "region": "Yror2XdtSCG7ZExO", "returnUrl": "oIpWzacOvwUsnIbQ", "sectionId": "M3ZAtyEWKWoZRUL7"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicCreateUserOrder' test.out

#- 396 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wS3HaMTXAX6y0STT' \
    --userId 'N2sBEijjjpvSzGkE' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetUserOrder' test.out

#- 397 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'D0oweFYDBPyd1jJB' \
    --userId 'xbrbuFay9PXgEQS4' \
    > test.out 2>&1
eval_tap $? 397 'PublicCancelUserOrder' test.out

#- 398 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '871QSmsspn5sNfif' \
    --userId 'K65tvaH9jwcO48pt' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserOrderHistories' test.out

#- 399 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hyYpBJDHIIxTIGI5' \
    --userId 'EssYllIqjJzuQ8Gg' \
    > test.out 2>&1
eval_tap $? 399 'PublicDownloadUserOrderReceipt' test.out

#- 400 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'lVgxjOGQGlHm8VTN' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetPaymentAccounts' test.out

#- 401 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '56tJKwD8O07L9GG1' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'EwuFJf7tbq5KikDE' \
    > test.out 2>&1
eval_tap $? 401 'PublicDeletePaymentAccount' test.out

#- 402 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '7hWvT5bzcfzIpL2p' \
    --language 'WB4XsdrxIF6kEAmK' \
    --region 'GNEmFPcUALNziO9B' \
    --storeId 'z2wx4kDAm8XIleiu' \
    --viewId 'jtv2NdQTYoHZogW8' \
    > test.out 2>&1
eval_tap $? 402 'PublicListActiveSections' test.out

#- 403 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'lBvniHdARadfSoct' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'AI8F2f3mEv09kAA5' \
    --limit '15' \
    --offset '78' \
    --sku 'nQtd4bcivHGIEplR' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 403 'PublicQueryUserSubscriptions' test.out

#- 404 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHDWcIoJ45L0Ze3Y' \
    --body '{"currencyCode": "amxKDSZTl4UiJSCb", "itemId": "G4UmG3TkMTzOcBIc", "language": "VI_hc", "region": "E7sH2G9MJ6F7Rr7O", "returnUrl": "15jqeKssQpme6eyM", "source": "48tE7eJRsXNeveQX"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicSubscribeSubscription' test.out

#- 405 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qnFRYmEIX40XOUoL' \
    --itemId 'Oa7oDz00gxcoaH6u' \
    > test.out 2>&1
eval_tap $? 405 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 406 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9TVf4DvEzpoPRiCl' \
    --userId 'Z6rlwX99AHMLHqgu' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserSubscription' test.out

#- 407 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'YykVWzNwPcvGyieB' \
    --userId 'sRUduW5lxSlorWEG' \
    > test.out 2>&1
eval_tap $? 407 'PublicChangeSubscriptionBillingAccount' test.out

#- 408 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'N5bPGSOSiiItrSrE' \
    --userId 'JMBAIwTLkrMDFQfp' \
    --body '{"immediate": false, "reason": "o0GJMTfqRRaZozM8"}' \
    > test.out 2>&1
eval_tap $? 408 'PublicCancelSubscription' test.out

#- 409 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xCBoaS2FMwfWNCbN' \
    --userId '5GelVOU0hHnsCl5k' \
    --excludeFree  \
    --limit '50' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserSubscriptionBillingHistories' test.out

#- 410 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQf2Pn9A4gcbDJ0L' \
    --language 'mdnOPkIT1C6KGTpA' \
    --storeId '7JZ6xullPROSfiW9' \
    > test.out 2>&1
eval_tap $? 410 'PublicListViews' test.out

#- 411 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'zcxmgNfTHu3vkZt9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FgWckjNpHhM2ZXp4' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetWallet' test.out

#- 412 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'N0ROmUCTrS7Gi9Ii' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gk9vamO7Q2WQwSWq' \
    --limit '92' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 412 'PublicListUserWalletTransactions' test.out

#- 413 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'bRov7Bm40CtZiAxk' \
    --baseAppId '43DGV1SCkw8U0d4F' \
    --categoryPath 'vVmPMtpRMWSQ8Szi' \
    --features '1IrGidRmR5BGRJhF' \
    --includeSubCategoryItem  \
    --itemName 'wxmkGfPI3j4luXQu' \
    --itemStatus 'INACTIVE' \
    --itemType 'OPTIONBOX' \
    --limit '78' \
    --offset '52' \
    --region 'tYa86kvL6cBZQssU' \
    --sectionExclusive  \
    --sortBy 'updatedAt:desc,displayOrder:asc,displayOrder:desc' \
    --storeId 'sXMNdvW1hbvGenRb' \
    --tags 'm3QtsY5WaKM5YY6p' \
    --targetNamespace 'YrmeMIHLS8egV8Xh' \
    > test.out 2>&1
eval_tap $? 413 'QueryItems1' test.out

#- 414 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gDjbrum8UxcutmVg' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 414 'ImportStore1' test.out

#- 415 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '8APWKxoj6MF68VuK' \
    --body '{"itemIds": ["DoklYmkytCAH8Jiq", "e7gfV1G6bYgIbVKp", "4Kgew2mHDksA6Mv9"]}' \
    > test.out 2>&1
eval_tap $? 415 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE