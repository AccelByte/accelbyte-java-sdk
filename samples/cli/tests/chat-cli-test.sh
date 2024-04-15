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
echo "1..60"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId 'EAxcVpFrttufHIRd,H9UzVRiXbqlAw7r6,W2ktQG0h5JAav5kR' \
    --endCreatedAt '0' \
    --keyword '4n8mzZ0m8SAMTwE6' \
    --limit '70' \
    --offset '76' \
    --order '6IaRDBXxyaNoMR6h' \
    --senderUserId 'kspInrAip6lyzSxw' \
    --shardId 'ElFHHdgs21Jub74C' \
    --startCreatedAt '96' \
    --topic 'Gj6oDLjWjkY1aXlF,cDtgOjchIua5tWEI,C32ogW7olvbTgrhR' \
    > test.out 2>&1
eval_tap $? 2 'AdminChatHistory' test.out

#- 3 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TcPiSuL0Sly6XM4O", "name": "I18mAQLnzjMf8GZ2"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNamespaceTopic' test.out

#- 4 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '13' \
    --topicType 'BZqxYG3aREAu2D6Q' \
    > test.out 2>&1
eval_tap $? 4 'AdminTopicList' test.out

#- 5 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["VKNCWP75TB0i7pKx", "R8dl0zRVW4EZG9m0", "XcgGVbMqSszE8GHa"], "description": "vj7AorKsxwkosAVe", "isChannel": true, "isJoinable": false, "members": ["Xpc1C8XfwHuKeb9l", "3rGN9A3sNm84hddS", "pHt0P7MIIR7CkyF6"], "name": "C7duuyZ0GhDogqrh", "shardLimit": 55, "type": "FQN05MYzYiKWe5dN"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateTopic' test.out

#- 6 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '76' \
    --topicName 'ljv7IPrDQQRgat0S' \
    > test.out 2>&1
eval_tap $? 6 'AdminChannelTopicList' test.out

#- 7 AdminChannelTopicSummary
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicSummary \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminChannelTopicSummary' test.out

#- 8 AdminQueryTopicLog
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopicLog \
    --namespace "$AB_NAMESPACE" \
    --endCreatedAt '9' \
    --limit '76' \
    --offset '44' \
    --senderUserId 'Q7KYnIuMBvaO35ll' \
    --startCreatedAt '52' \
    --topicId '6Vpbsx5w8hqUI06U' \
    --topicIds 'pOXGSLmCVuHOPlLl,kvR8sKgnuRkgghGo,YupD391C2qtPYoka' \
    --userId 'hFjkQsfCaTmt1d67' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryTopicLog' test.out

#- 9 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'FXGk2s9Q0mPVo3tw' \
    --body '{"description": "u0MesTCf9x4rt69l", "isJoinable": false, "name": "aRlxfcjHfYakUCTq"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateTopic' test.out

#- 10 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'GkE7wcWfDslpJSqG' \
    > test.out 2>&1
eval_tap $? 10 'AdminDeleteTopic' test.out

#- 11 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'AXQ0yYoNRKd3IL5T' \
    --body '{"userIds": ["AQ6iiPlSC2uE4o5V", "wdo3fePqIJA8IHtr", "kmu0hpDDWVAla2l5"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminBanTopicMembers' test.out

#- 12 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'BYNtIuS5S5XUdjso' \
    > test.out 2>&1
eval_tap $? 12 'AdminChannelTopicInfo' test.out

#- 13 AdminTopicChatHistory
eval_tap 0 13 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 14 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'qwGyzzWi9gwQYv7t' \
    --body '{"message": "1o7TTr1DmrhZv15T"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminSendChat' test.out

#- 15 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId '7quIOvBMcaYmvCkG' \
    --namespace "$AB_NAMESPACE" \
    --topic 'Z5dAgqxpBFmaLoxo' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeleteChat' test.out

#- 16 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'zr6wfNPX2bOItRMv' \
    --isBanned  \
    --isModerator  \
    --limit '33' \
    --offset '39' \
    --shardId 'M3VHh2EI8JlDbPWb' \
    > test.out 2>&1
eval_tap $? 16 'AdminTopicMembers' test.out

#- 17 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'Q6Q9lNmqRBaAkLnv' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicShards' test.out

#- 18 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'xkT1X68cmDc3fxU8' \
    --body '{"userIds": ["MyKrQpM4hkkK6KKX", "NB3Gv0IqmF51Tkhj", "Ynaq6foWvXa3bMrX"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnbanTopicMembers' test.out

#- 19 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'sDr6kILsSSyDdmyk' \
    --userId 'moPYgc2L4jk4Lo0L' \
    --body '{"isAdmin": false}' \
    > test.out 2>&1
eval_tap $? 19 'AdminAddTopicMember' test.out

#- 20 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'jTvhZNkSQ70D0H6B' \
    --userId 'XksUC9b6i5lZC9xv' \
    > test.out 2>&1
eval_tap $? 20 'AdminRemoveTopicMember' test.out

#- 21 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '2' \
    --offset '9' \
    --topic 'boLQQ1MzH7Qm8bwb,mXgdAPh1EThG96gA,FKK2WDgCcxvONZm3' \
    --topicSubType 'PARTY' \
    --topicType 'PERSONAL' \
    --userId 'eERmDnyeFoF7VSZ6' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryTopic' test.out

#- 22 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'pf3vneSD2Tb3g7mS' \
    --includePastTopics  \
    --limit '87' \
    --offset '42' \
    --topicSubType 'CLAN' \
    --topicType 'PERSONAL' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryUsersTopic' test.out

#- 23 PublicGetMutedTopics
./ng net.accelbyte.sdk.cli.Main chat publicGetMutedTopics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'PublicGetMutedTopics' test.out

#- 24 PublicTopicList
./ng net.accelbyte.sdk.cli.Main chat publicTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '62' \
    --topicType 'RENjEEztx1WsYSiZ' \
    > test.out 2>&1
eval_tap $? 24 'PublicTopicList' test.out

#- 25 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'qan0nSBJroav91GX' \
    --body '{"userIDs": ["lvPG6bFYReVHQipc", "Cx9Zw5D2L7vIYhGG", "SyEW4ZJJ42d3PBdd"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicBanTopicMembers' test.out

#- 26 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'N8S48l9lyNApflxq' \
    --limit '79' \
    --order 'rQvGgbLdLsFzHkBM' \
    --startCreatedAt '36' \
    > test.out 2>&1
eval_tap $? 26 'PublicChatHistory' test.out

#- 27 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'DxHSZjtqXyJ58f7G' \
    --namespace "$AB_NAMESPACE" \
    --topic 'c26SaiGVkydwYWQG' \
    > test.out 2>&1
eval_tap $? 27 'PublicDeleteChat' test.out

#- 28 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic '26yUZNmTBcvrbYCw' \
    --body '{"duration": 39, "userId": "aMVGLiBNrDjqoxcw"}' \
    > test.out 2>&1
eval_tap $? 28 'PublicMuteUser' test.out

#- 29 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'gGLXpUL4pp2ncYAH' \
    --body '{"userIDs": ["dNzDmeIP6rOvDz9K", "Osb392k6YmJFfRBy", "jlBiuFM3FIoVk8T3"]}' \
    > test.out 2>&1
eval_tap $? 29 'PublicUnbanTopicMembers' test.out

#- 30 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'GpAnkCmBUqg2SCnq' \
    --body '{"userId": "ntX9y1aZSWMiVi10"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnmuteUser' test.out

#- 31 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 31 'AdminGetAllConfigV1' test.out

#- 32 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetConfigV1' test.out

#- 33 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"chatRateLimitBurst": 37, "chatRateLimitDuration": 90, "concurrentUsersLimit": 66, "enableClanChat": true, "enableManualTopicCreation": true, "enableProfanityFilter": true, "filterAppName": "MWH8Yb33T5UBJCjf", "filterParam": "cnLRfxeCSz9WEi8K", "filterType": "lloeH0JT1yduat2v", "generalRateLimitBurst": 88, "generalRateLimitDuration": 100, "shardCapacityLimit": 89, "shardDefaultLimit": 94, "shardHardLimit": 3, "spamChatBurst": 66, "spamChatDuration": 16, "spamMuteDuration": 11}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateConfigV1' test.out

#- 34 ExportConfig
./ng net.accelbyte.sdk.cli.Main chat exportConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'ExportConfig' test.out

#- 35 ImportConfig
./ng net.accelbyte.sdk.cli.Main chat importConfig \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 35 'ImportConfig' test.out

#- 36 AdminGetInboxCategories
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'AdminGetInboxCategories' test.out

#- 37 AdminAddInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminAddInboxCategory \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 69, "hook": {"driver": "fsu4jmsRE2w1yEkL", "params": {"gh3tIYt4SqYUTLDx": {}, "9gIiDandpGT2t24a": {}, "OMh5eC3IHeHSKLCa": {}}}, "jsonSchema": {"3xreNDUWehwH3q31": {}, "A806DJgas4b6z3LN": {}, "Uj7fdgLA84Z8YYk6": {}}, "name": "QEgJjBbEDoNf3n0h", "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 37 'AdminAddInboxCategory' test.out

#- 38 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'BkMNxvvKgAT8mJrY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteInboxCategory' test.out

#- 39 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'q6hRkloqxM3gpwxc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 79, "hook": {"driver": "jyEW6GLbc0NaKDUL", "params": {"3sa13lk1dQBHO86I": {}, "lBhnetU4RwTqUXlT": {}, "DBzOuYsaZA2yyd4m": {}}}, "jsonSchema": {"bqoOfADMMAXFaY9e": {}, "Ka699bRVhyaKwwrA": {}, "P2aMlu7WtjCtoYet": {}}, "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateInboxCategory' test.out

#- 40 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category '847g8OudOfjnCuHZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'AdminGetCategorySchema' test.out

#- 41 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId '3c46IjGa23YvYmmD' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxMessage' test.out

#- 42 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '13' \
    --limit '8' \
    --messageId 'VYPXIuvUYTZBRujI,UE1Tq5jyAZvkRCMN,FIurjh2imdb4rbkX' \
    --offset '20' \
    --order 'YfJB8AT9t4Tv207Y' \
    --scope 'USER' \
    --startCreatedAt '87' \
    --status 'UNSENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 42 'AdminGetInboxMessages' test.out

#- 43 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "D3oD5fLCr3OOlXVv", "expiredAt": 47, "message": {"ZGF7uYnGzpipNDig": {}, "NJma1MbqqZtfNWql": {}, "4nmwAft4gqkNNlWk": {}}, "scope": "USER", "status": "SENT", "userIds": ["9eOziYRFOn0jJLHC", "9LxhvNXTwGBCtohL", "tl9Zuhytm5UDrT6Q"]}' \
    > test.out 2>&1
eval_tap $? 43 'AdminSaveInboxMessage' test.out

#- 44 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'XCs5SPBbRPZTF6oQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["AXVG7tnsZg5QgXjv", "yGJPN4eXbJE5Vs2G", "cyomQoIXimBJehyx"]}' \
    > test.out 2>&1
eval_tap $? 44 'AdminUnsendInboxMessage' test.out

#- 45 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'lNsjUgxBkF6wFPoJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '40' \
    --status 'READ' \
    --userId 'ediogEhhM2rIizGd' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetInboxUsers' test.out

#- 46 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'KvOPdq5xrgxSmy1D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 81, "message": {"3dpCROYqUiGKXVFC": {}, "mpo6sPwVOEDSJsEK": {}, "5QpNhlI2iS5EpGhh": {}}, "scope": "USER", "userIds": ["KUkmkk9QM0NBMA9O", "RxpzwLR2AK6eXUGP", "Jsw1fiP80G9Pclxc"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateInboxMessage' test.out

#- 47 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'ft2ulIJzPyrVEiOG' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSendInboxMessage' test.out

#- 48 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId '4UcqsuGKHhMRWLVd,3DlhLuIpomM8sm1M,iaI1mX2tJoARtdbB' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetInboxStats' test.out

#- 49 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'e7udsMrok0WvGYYn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'AdminGetChatSnapshot' test.out

#- 50 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'x4V709xbnGezKsDw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteChatSnapshot' test.out

#- 51 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'G2omOR2nvYI9TVqJ' \
    --includeChildren  \
    --limit '8' \
    --offset '31' \
    --parentId 'vzcWbfUpaXp5JMl5' \
    --startWith 'LL4bTxBmZjdrrIxs' \
    --wordType 'B0NRsB1fPqqRRulp' \
    > test.out 2>&1
eval_tap $? 51 'AdminProfanityQuery' test.out

#- 52 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["qpymDkQhtrHWwRVn", "wVBOqOHi8pWGd1ju", "YhiqjRJOqB5F93zF"], "falsePositive": ["QbJndUDpdONneAcz", "bBdHb2slt71B1SmZ", "p2JZp50CnPb71ORY"], "word": "cmQbTU5JX8ccLjMX", "wordType": "JRk0eaKQDOJvrTef"}' \
    > test.out 2>&1
eval_tap $? 52 'AdminProfanityCreate' test.out

#- 53 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["glSs6g4iY9u02aCN", "YIWekp18lOC3mNqF", "7Bl0LcghVHfPEspx"], "falsePositive": ["whRON0bc1eMbEIjo", "wLqc3ecjXJbZDKKo", "xLE1Y3Dymtj3giPg"], "word": "4x4yiPX6ues1Hhhk", "wordType": "g1yLVbLFzHEP8cM4"}, {"falseNegative": ["NTwr0KHaAsmTej52", "WKi6tArAURt9plCS", "Vq8PdH6hJPUAc0RV"], "falsePositive": ["wXgAgntLMCuaXBWQ", "i6BqPg4xr0lCancU", "ZGCHsZYoLfR1KtOv"], "word": "7Zy0b65uvuKNuy0y", "wordType": "tZQ7M6Nzy1adnSKO"}, {"falseNegative": ["LFKx1dX4LuWJu3pD", "MUAeeZ97SBROPYuG", "6XqP6oo7G73zdxTg"], "falsePositive": ["OfnwIdlNa29fDLh7", "41IslKHzGlLKWUtD", "Qs61OQAoxyyQpRWC"], "word": "iiPDGQhNPEwiJCf2", "wordType": "XJVrlzqQls1ozhLV"}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminProfanityCreateBulk' test.out

#- 54 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminProfanityExport' test.out

#- 55 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityGroup' test.out

#- 56 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'LEAVEOUT' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityImport' test.out

#- 57 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id 'kE8jKvgatOEBM70T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["dlNBJYOmpu1VCarz", "BsV6xnZ5Jrzzjrca", "ug6CWVG8SWP3glU6"], "falsePositive": ["muswVJnNnN7kAa7j", "0riFc5HTHQIoVsGo", "7dwV9DBqFKHQkETJ"], "word": "yTlUrwDTnoujQD4I", "wordType": "EiH9Z5qXn3aoRtlq"}' \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityUpdate' test.out

#- 58 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'OECohViHA5CzgFSy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityDelete' test.out

#- 59 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 59 'PublicGetMessages' test.out

#- 60 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId '8X1A3PrIfapq5AAe' \
    --namespace "$AB_NAMESPACE" \
    --topic 'Me4L3mDWORBVXTII' \
    > test.out 2>&1
eval_tap $? 60 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE