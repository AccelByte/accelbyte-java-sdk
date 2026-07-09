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
echo "1..65"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminFilterChatMessage
./ng net.accelbyte.sdk.cli.Main chat adminFilterChatMessage \
    --namespace "$AB_NAMESPACE" \
    --detail  \
    --body '{"message": "EAxcVpFrttufHIRd", "timestamp": 68, "topicId": "Dc09nIW0Oaiw9B0D", "topicType": "GROUP", "userId": "ktQG0h5JAav5kRa6"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminFilterChatMessage' test.out

#- 3 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId '2WopBJHPtcDs8bBZ,LCXLx8bbgorQeFbQ,1g7qbPngUNB1vRod' \
    --endCreatedAt '46' \
    --keyword 'ElFHHdgs21Jub74C' \
    --limit '96' \
    --offset '67' \
    --order 'kNmKJfh5pUkHODpo' \
    --senderUserId 'MF78NY4YkHs1cnz1' \
    --shardId 'JSDgY1TXp38zsCTC' \
    --startCreatedAt '36' \
    --topic 'cPiSuL0Sly6XM4OI,18mAQLnzjMf8GZ2W,BZqxYG3aREAu2D6Q' \
    --unfiltered  \
    > test.out 2>&1
eval_tap $? 3 'AdminChatHistory' test.out

#- 4 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VKNCWP75TB0i7pKx", "name": "R8dl0zRVW4EZG9m0"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateNamespaceTopic' test.out

#- 5 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '4' \
    --topicType '68su8XfqlqNiTvB6' \
    > test.out 2>&1
eval_tap $? 5 'AdminTopicList' test.out

#- 6 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["SdAdIhUDrwoZ5Mec", "dKi5r6QEa1ysLEzt", "h6mXhzkzWkFeZSoE"], "description": "AcBdW19m4eu6d5tA", "isChannel": false, "isJoinable": false, "members": ["UmiTqpyhPFdxLzFQ", "N05MYzYiKWe5dNRl", "jv7IPrDQQRgat0Se"], "name": "vkLGMS0lyuI9a2I9", "shardLimit": 42, "type": "zQRaT5kPxUfofvnn"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminCreateTopic' test.out

#- 7 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '32' \
    --topicName 'uB0y5WUlrMdI4sNv' \
    > test.out 2>&1
eval_tap $? 7 'AdminChannelTopicList' test.out

#- 8 AdminChannelTopicSummary
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicSummary \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminChannelTopicSummary' test.out

#- 9 AdminQueryTopicLog
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopicLog \
    --namespace "$AB_NAMESPACE" \
    --endCreatedAt '10' \
    --limit '45' \
    --offset '1' \
    --senderUserId 'R8sKgnuRkgghGoYu' \
    --startCreatedAt '31' \
    --topicId 'ljvjKoyD6SCwGrnc' \
    --topicIds 'qmLtjQHAf8TgoNm0,3VLisV6zwPuo3td6,TC6I3lMjGSWN2laR' \
    --userId 'lxfcjHfYakUCTqGk' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryTopicLog' test.out

#- 10 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'E7wcWfDslpJSqGAX' \
    --body '{"description": "Q0yYoNRKd3IL5TAQ", "isJoinable": false, "name": "PllG4cYEzfTD1ZBm"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateTopic' test.out

#- 11 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic '3MqHcUmLZZbSqb8R' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteTopic' test.out

#- 12 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'wNmn9HrNQy4uZAAi' \
    --body '{"userIds": ["E0mit9RGCCHYzUOc", "EdscKHPEqgA8yu7V", "k6Jt4Ymos9Jcdos4"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminBanTopicMembers' test.out

#- 13 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'fYcTVU6RBt0zYoMc' \
    > test.out 2>&1
eval_tap $? 13 'AdminChannelTopicInfo' test.out

#- 14 AdminTopicChatHistory
eval_tap 0 14 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 15 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'HyCUEXlAvxJMdalw' \
    --body '{"message": "SyliWMNW5NyLu0M3", "metadata": "VHh2EI8JlDbPWbQ6"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminSendChat' test.out

#- 16 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'Q9lNmqRBaAkLnvxk' \
    --namespace "$AB_NAMESPACE" \
    --topic 'T1X68cmDc3fxU8My' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteChat' test.out

#- 17 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'KrQpM4hkkK6KKXNB' \
    --isBanned  \
    --isModerator  \
    --limit '48' \
    --offset '66' \
    --shardId 'oJ8aeCnaLpUKp44Y' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicMembers' test.out

#- 18 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'UDjasWIPUvmEejtG' \
    > test.out 2>&1
eval_tap $? 18 'AdminTopicShards' test.out

#- 19 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'eoyIPa8ZRrvjj7il' \
    --body '{"userIds": ["35MXbN9oCMNqq98S", "jTvhZNkSQ70D0H6B", "XksUC9b6i5lZC9xv"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnbanTopicMembers' test.out

#- 20 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic '32e8c5csSovoqsZN' \
    --userId 'Bdte9NDUPVJf6c2Z' \
    --body '{"isAdmin": false}' \
    > test.out 2>&1
eval_tap $? 20 'AdminAddTopicMember' test.out

#- 21 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'QZxfgPubTDIHrvqA' \
    --userId 'ThuwjRHpKKTlmVr9' \
    > test.out 2>&1
eval_tap $? 21 'AdminRemoveTopicMember' test.out

#- 22 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '42' \
    --offset '30' \
    --topic 'pf3vneSD2Tb3g7mS,QUhAEtrmjqU6YE3p,4lSck0ZHn5GI39YB' \
    --topicSubType 'SESSION' \
    --topicType 'PERSONAL' \
    --userId '1GXlvPG6bFYReVHQ' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryTopic' test.out

#- 23 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipcCx9Zw5D2L7vIY' \
    --includePastTopics  \
    --limit '15' \
    --offset '97' \
    --topicSubType 'SESSION' \
    --topicType 'PERSONAL' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryUsersTopic' test.out

#- 24 PublicGetMutedTopics
./ng net.accelbyte.sdk.cli.Main chat publicGetMutedTopics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'PublicGetMutedTopics' test.out

#- 25 PublicTopicList
./ng net.accelbyte.sdk.cli.Main chat publicTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '96' \
    --topicType 'SyEW4ZJJ42d3PBdd' \
    > test.out 2>&1
eval_tap $? 25 'PublicTopicList' test.out

#- 26 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'N8S48l9lyNApflxq' \
    --body '{"userIDs": ["Mrj3oZk03QXcKMDY", "DDxHSZjtqXyJ58f7", "Gc26SaiGVkydwYWQ"]}' \
    > test.out 2>&1
eval_tap $? 26 'PublicBanTopicMembers' test.out

#- 27 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'G26yUZNmTBcvrbYC' \
    --limit '46' \
    --order 'G8aMVGLiBNrDjqox' \
    --startCreatedAt '5' \
    > test.out 2>&1
eval_tap $? 27 'PublicChatHistory' test.out

#- 28 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'PUIj88cekdqCt81P' \
    --namespace "$AB_NAMESPACE" \
    --topic '1ktfIovmv9gsR5cJ' \
    > test.out 2>&1
eval_tap $? 28 'PublicDeleteChat' test.out

#- 29 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'cHm3SZLxoRDFuuuy' \
    --body '{"duration": 91, "userId": "yjlBiuFM3FIoVk8T"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicMuteUser' test.out

#- 30 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic '3GpAnkCmBUqg2SCn' \
    --body '{"userIDs": ["qntX9y1aZSWMiVi1", "0sG6vxkfUcmqRRbc", "eJ5i0EeDxOgBnhhq"]}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnbanTopicMembers' test.out

#- 31 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'ElIaDml48wdNFLTm' \
    --body '{"userId": "5T50x9WT0GfH2rtO"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicUnmuteUser' test.out

#- 32 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 32 'AdminGetAllConfigV1' test.out

#- 33 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main chat adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 33 'AdminGetLogConfig' test.out

#- 34 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main chat adminPatchUpdateLogConfig \
    --body '{"internalAccessLogEnabled": false, "logLevel": "error", "logLevelDB": "fatal", "slowQueryThreshold": 62, "socketLogEnabled": true}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPatchUpdateLogConfig' test.out

#- 35 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminGetConfigV1' test.out

#- 36 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"chatRateLimitBurst": 39, "chatRateLimitDuration": 47, "concurrentUsersLimit": 53, "enableClanChat": true, "enableManualTopicCreation": true, "enablePmSendPlatformId": false, "enableProfanityFilter": true, "filterAppName": "Lgh3tIYt4SqYUTLD", "filterParam": "x9gIiDandpGT2t24", "filterType": "aOMh5eC3IHeHSKLC", "generalRateLimitBurst": 1, "generalRateLimitDuration": 58, "maxChatMessageLength": 62, "maxChatMetadataSize": 48, "shardCapacityLimit": 55, "shardDefaultLimit": 36, "shardHardLimit": 62, "spamChatBurst": 8, "spamChatDuration": 80, "spamMuteDuration": 100}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateConfigV1' test.out

#- 37 ExportConfig
./ng net.accelbyte.sdk.cli.Main chat exportConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'ExportConfig' test.out

#- 38 ImportConfig
./ng net.accelbyte.sdk.cli.Main chat importConfig \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 38 'ImportConfig' test.out

#- 39 AdminGetInboxCategories
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'AdminGetInboxCategories' test.out

#- 40 AdminAddInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminAddInboxCategory \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 71, "hook": {"driver": "UWehwH3q31A806DJ", "params": {"gas4b6z3LNUj7fdg": {}, "LA84Z8YYk6QEgJjB": {}, "bEDoNf3n0hEoRCAc": {}}}, "jsonSchema": {"f80zfFyabWAgIUXi": {}, "I07A68eaqC2J9jyE": {}, "W6GLbc0NaKDUL3sa": {}}, "name": "13lk1dQBHO86IlBh", "saveInbox": false, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'etU4RwTqUXlTDBzO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'uYsaZA2yyd4mbqoO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 85, "hook": {"driver": "ADMMAXFaY9eKa699", "params": {"bRVhyaKwwrAP2aMl": {}, "u7WtjCtoYetOO847": {}, "g8OudOfjnCuHZ3c4": {}}}, "jsonSchema": {"6IjGa23YvYmmDg7V": {}, "YPXIuvUYTZBRujIU": {}, "E1Tq5jyAZvkRCMNF": {}}, "saveInbox": true, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'Sp7gh4TeUTkOkAYf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'AdminGetCategorySchema' test.out

#- 44 AdminListKafkaTopic
./ng net.accelbyte.sdk.cli.Main chat adminListKafkaTopic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'AdminListKafkaTopic' test.out

#- 45 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'JB8AT9t4Tv207Y2Q' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteInboxMessage' test.out

#- 46 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '60' \
    --limit '17' \
    --messageId '3oD5fLCr3OOlXVv8,ZGF7uYnGzpipNDig,NJma1MbqqZtfNWql' \
    --offset '23' \
    --order 'nmwAft4gqkNNlWkD' \
    --scope 'NAMESPACE' \
    --startCreatedAt '4' \
    --status 'UNSENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 46 'AdminGetInboxMessages' test.out

#- 47 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "ym8xIfkOVW2grREO", "expiredAt": 77, "message": {"hvNXTwGBCtohLtl9": {}, "Zuhytm5UDrT6QXCs": {}, "5SPBbRPZTF6oQAXV": {}}, "scope": "USER", "status": "DRAFT", "userIds": ["nsZg5QgXjvyGJPN4", "eXbJE5Vs2GcyomQo", "IXimBJehyxlNsjUg"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSaveInboxMessage' test.out

#- 48 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'xBkF6wFPoJeQedio' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["gEhhM2rIizGdKvOP", "dq5xrgxSmy1DN9LF", "kYW5DQyj4bj5Ro2o"]}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUnsendInboxMessage' test.out

#- 49 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'gaKt2ujQSa3Zdb65' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '14' \
    --status 'READ' \
    --userId 'my0Zp6iIaTIKUkmk' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetInboxUsers' test.out

#- 50 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'k9QM0NBMA9ORxpzw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 77, "message": {"V3bu1bNCtX7W40V6": {}, "Do5sYadCCFrHHC3D": {}, "pZxkrQDXuNFviMar": {}}, "scope": "USER", "userIds": ["GKHhMRWLVd3DlhLu", "IpomM8sm1MiaI1mX", "2tJoARtdbBe7udsM"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminUpdateInboxMessage' test.out

#- 51 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'rok0WvGYYnx4V709' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 51 'AdminSendInboxMessage' test.out

#- 52 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'xbnGezKsDwG2omOR,2nvYI9TVqJdvzcWb,fUpaXp5JMl5LL4bT' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetInboxStats' test.out

#- 53 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'xBmZjdrrIxsB0NRs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminGetChatSnapshot' test.out

#- 54 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'B1fPqqRRulpqpymD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteChatSnapshot' test.out

#- 55 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'kQhtrHWwRVnwVBOq' \
    --includeChildren  \
    --limit '84' \
    --offset '68' \
    --parentId 'wbhMssAHjapIkY9R' \
    --startWith 'f4wP57dBZNR88YbC' \
    --wordType 'tmKy8M9zVrjfGXZn' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityQuery' test.out

#- 56 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["qAQUoY1GjlIIk0iK", "oTTS1j02o7JjTXAQ", "N0qdskdQV0TqI8EF"], "falsePositive": ["nmDbxIxi4YKlONk2", "Q5Y4Jvaizwiilatu", "Ujjt9lIMGql5ElEa"], "word": "9EIIlGcHB3CfR3nc", "wordType": "Dlwi3v3MFFJ1KesK"}' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityCreate' test.out

#- 57 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["oELCpobBEG8X645x", "pdXpai0rYaT5hOPj", "af3H0tYighU0VUfc"], "falsePositive": ["YHJbBfAKSiPW3Vgs", "ZXiR1DJ7HVWqMkNS", "awQUWDFJvJBWic7U"], "word": "kBeIXuqDuAXI66bQ", "wordType": "71w0deoV9Lx5RDA1"}, {"falseNegative": ["l2XcrciYNEzvSZIP", "khSgORcz5S5BvmgB", "Lxh4ijFnE3Tam69q"], "falsePositive": ["SZ7PC6f6QkmZXElW", "9YfRSse6AAz3S4cz", "z0QKFlAVmVLu4AOe"], "word": "c0z8eBeeoip68J1n", "wordType": "sv4W2OJhtafxMSJl"}, {"falseNegative": ["Heb34sZKHcl5LLLO", "exL4fZvWtND2tcBF", "pX8lNtFEJ7tnkY6M"], "falsePositive": ["ca5afj12K2IzrBvv", "Wm4udE0OXudXgNne", "8kJATwlc6esUp6Sw"], "word": "1I98jeZQ7hfxnhLd", "wordType": "3Knaknoed9DHhLOq"}]}' \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityCreateBulk' test.out

#- 58 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityExport' test.out

#- 59 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityGroup' test.out

#- 60 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'REPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityImport' test.out

#- 61 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id 'nNnN7kAa7j0riFc5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["HTHQIoVsGo7dwV9D", "BqFKHQkETJyTlUrw", "DTnoujQD4IEiH9Z5"], "falsePositive": ["qXn3aoRtlqOECohV", "iHA5CzgFSy8X1A3P", "rIfapq5AAeMe4L3m"], "word": "DWORBVXTIIJM9XsY", "wordType": "IIZxiXNMR9BgaWcF"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminProfanityUpdate' test.out

#- 62 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'X3SUBhyoTsMWPAxU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AdminProfanityDelete' test.out

#- 63 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 63 'PublicGetMessages' test.out

#- 64 PublicGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat publicGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicGetConfigV1' test.out

#- 65 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId 'MkawaGpAyrIwMif3' \
    --namespace "$AB_NAMESPACE" \
    --topic 'BOdkocVTd4BxqGWV' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE