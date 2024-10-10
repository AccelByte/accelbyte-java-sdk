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
echo "1..64"

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
    --body '{"message": "SyliWMNW5NyLu0M3"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminSendChat' test.out

#- 16 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'VHh2EI8JlDbPWbQ6' \
    --namespace "$AB_NAMESPACE" \
    --topic 'Q9lNmqRBaAkLnvxk' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteChat' test.out

#- 17 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'T1X68cmDc3fxU8My' \
    --isBanned  \
    --isModerator  \
    --limit '75' \
    --offset '36' \
    --shardId 'V0v52Dlym6puQ23x' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicMembers' test.out

#- 18 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'oJ8aeCnaLpUKp44Y' \
    > test.out 2>&1
eval_tap $? 18 'AdminTopicShards' test.out

#- 19 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'UDjasWIPUvmEejtG' \
    --body '{"userIds": ["eoyIPa8ZRrvjj7il", "35MXbN9oCMNqq98S", "jTvhZNkSQ70D0H6B"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnbanTopicMembers' test.out

#- 20 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'XksUC9b6i5lZC9xv' \
    --userId '32e8c5csSovoqsZN' \
    --body '{"isAdmin": true}' \
    > test.out 2>&1
eval_tap $? 20 'AdminAddTopicMember' test.out

#- 21 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'wbmXgdAPh1EThG96' \
    --userId 'gAFKK2WDgCcxvONZ' \
    > test.out 2>&1
eval_tap $? 21 'AdminRemoveTopicMember' test.out

#- 22 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '25' \
    --offset '94' \
    --topic '3EeERmDnyeFoF7VS,Z6pf3vneSD2Tb3g7,mSQUhAEtrmjqU6YE' \
    --topicSubType 'NAMESPACE' \
    --topicType 'PERSONAL' \
    --userId '4lSck0ZHn5GI39YB' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryTopic' test.out

#- 23 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'HqaTHeKtW18iGeUl' \
    --includePastTopics  \
    --limit '4' \
    --offset '87' \
    --topicSubType 'NAMESPACE' \
    --topicType 'GROUP' \
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
    --limit '32' \
    --offset '5' \
    --topicType 'sogWa24CKNS0GqVv' \
    > test.out 2>&1
eval_tap $? 25 'PublicTopicList' test.out

#- 26 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'UfHQvsHXNUNe4mhg' \
    --body '{"userIDs": ["o5QB65lSAiYnNjkf", "ZrQvGgbLdLsFzHkB", "Mr1yrOMlNFSrUEir"]}' \
    > test.out 2>&1
eval_tap $? 26 'PublicBanTopicMembers' test.out

#- 27 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'njX9fDmIbeZxzfTc' \
    --limit '49' \
    --order 'G26yUZNmTBcvrbYC' \
    --startCreatedAt '46' \
    > test.out 2>&1
eval_tap $? 27 'PublicChatHistory' test.out

#- 28 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'G8aMVGLiBNrDjqox' \
    --namespace "$AB_NAMESPACE" \
    --topic 'cwgGLXpUL4pp2ncY' \
    > test.out 2>&1
eval_tap $? 28 'PublicDeleteChat' test.out

#- 29 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'AHdNzDmeIP6rOvDz' \
    --body '{"duration": 5, "userId": "KOsb392k6YmJFfRB"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicMuteUser' test.out

#- 30 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'yjlBiuFM3FIoVk8T' \
    --body '{"userIDs": ["3GpAnkCmBUqg2SCn", "qntX9y1aZSWMiVi1", "0sG6vxkfUcmqRRbc"]}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnbanTopicMembers' test.out

#- 31 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'eJ5i0EeDxOgBnhhq' \
    --body '{"userId": "ElIaDml48wdNFLTm"}' \
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
    --body '{"logLevel": "fatal", "logLevelDB": "trace", "slowQueryThreshold": 0, "socketLogEnabled": true}' \
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
    --body '{"chatRateLimitBurst": 48, "chatRateLimitDuration": 43, "concurrentUsersLimit": 88, "enableClanChat": false, "enableManualTopicCreation": false, "enableProfanityFilter": false, "filterAppName": "Bfsu4jmsRE2w1yEk", "filterParam": "Lgh3tIYt4SqYUTLD", "filterType": "x9gIiDandpGT2t24", "generalRateLimitBurst": 1, "generalRateLimitDuration": 25, "maxChatMessageLength": 83, "shardCapacityLimit": 45, "shardDefaultLimit": 78, "shardHardLimit": 29, "spamChatBurst": 16, "spamChatDuration": 8, "spamMuteDuration": 50}' \
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
    --body '{"enabled": true, "expiresIn": 72, "hook": {"driver": "3IHeHSKLCa3xreND", "params": {"UWehwH3q31A806DJ": {}, "gas4b6z3LNUj7fdg": {}, "LA84Z8YYk6QEgJjB": {}}}, "jsonSchema": {"bEDoNf3n0hEoRCAc": {}, "f80zfFyabWAgIUXi": {}, "I07A68eaqC2J9jyE": {}}, "name": "W6GLbc0NaKDUL3sa", "saveInbox": false, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'Hzih3bit0VWn3CO3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category '9PXDNxtXgeO3FgkX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 1, "hook": {"driver": "jDzaQY3snn2ZkP7c", "params": {"FdP43e5dC9XIBudf": {}, "ZgrbHDIDm4hMzF4T": {}, "xodenSrUTvfqU0bf": {}}}, "jsonSchema": {"oMm5cTtFWbotQyXJ": {}, "RcQWsmqPNs92epxk": {}, "0i8VxsZNereSvf96": {}}, "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'jyAZvkRCMNFIurjh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'AdminGetCategorySchema' test.out

#- 44 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId '2imdb4rbkXj0ZwsV' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteInboxMessage' test.out

#- 45 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '58' \
    --limit '93' \
    --messageId '0gL97ZVJSPqJiwv1,qlYB1RSKs6gQxC3G,b7S0o4zGYY7KQI1A' \
    --offset '9' \
    --order '1MbqqZtfNWql4nmw' \
    --scope 'USER' \
    --startCreatedAt '21' \
    --status 'DRAFT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 45 'AdminGetInboxMessages' test.out

#- 46 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "KB4EYOkQ1jMD3cym", "expiredAt": 49, "message": {"RFOn0jJLHC9LxhvN": {}, "XTwGBCtohLtl9Zuh": {}, "ytm5UDrT6QXCs5SP": {}}, "scope": "USER", "status": "DRAFT", "userIds": ["bRPZTF6oQAXVG7tn", "sZg5QgXjvyGJPN4e", "XbJE5Vs2GcyomQoI"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminSaveInboxMessage' test.out

#- 47 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'XimBJehyxlNsjUgx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["BkF6wFPoJeQediog", "EhhM2rIizGdKvOPd", "q5xrgxSmy1DN9LFk"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUnsendInboxMessage' test.out

#- 48 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'YW5DQyj4bj5Ro2og' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '86' \
    --status 'UNREAD' \
    --userId 't2ujQSa3Zdb65UXm' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetInboxUsers' test.out

#- 49 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'y0Zp6iIaTIKUkmkk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 32, "message": {"QM0NBMA9ORxpzwLR": {}, "2AK6eXUGPJsw1fiP": {}, "80G9Pclxcft2ulIJ": {}}, "scope": "USER", "userIds": ["xkrQDXuNFviMarv8", "mnfHK8CCmE2lPnsb", "D3SGEdlwuUccE536"]}' \
    > test.out 2>&1
eval_tap $? 49 'AdminUpdateInboxMessage' test.out

#- 50 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'ugBp3HBvepnDCjgy' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 50 'AdminSendInboxMessage' test.out

#- 51 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'JlXe36mgWjLfFmte,ue9nzJ6fH24T805t,Vg8JqU0jZpjvsugA' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetInboxStats' test.out

#- 52 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'OS7u8RiWyerCSa8S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetChatSnapshot' test.out

#- 53 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'RgwsAj1ik1jglaDX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminDeleteChatSnapshot' test.out

#- 54 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'TvKCWwNTAhd2wrS0' \
    --includeChildren  \
    --limit '42' \
    --offset '14' \
    --parentId 'Pdjhdinpng5BLy8w' \
    --startWith 'bhMssAHjapIkY9Rf' \
    --wordType '4wP57dBZNR88YbCt' \
    > test.out 2>&1
eval_tap $? 54 'AdminProfanityQuery' test.out

#- 55 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["mKy8M9zVrjfGXZnq", "AQUoY1GjlIIk0iKo", "TTS1j02o7JjTXAQN"], "falsePositive": ["0qdskdQV0TqI8EFn", "mDbxIxi4YKlONk2Q", "5Y4JvaizwiilatuU"], "word": "jjt9lIMGql5ElEa9", "wordType": "EIIlGcHB3CfR3ncD"}' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityCreate' test.out

#- 56 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["lwi3v3MFFJ1KesKo", "ELCpobBEG8X645xp", "dXpai0rYaT5hOPja"], "falsePositive": ["f3H0tYighU0VUfcY", "HJbBfAKSiPW3VgsZ", "XiR1DJ7HVWqMkNSa"], "word": "wQUWDFJvJBWic7Uk", "wordType": "BeIXuqDuAXI66bQ7"}, {"falseNegative": ["1w0deoV9Lx5RDA1l", "2XcrciYNEzvSZIPk", "hSgORcz5S5BvmgBL"], "falsePositive": ["xh4ijFnE3Tam69qS", "Z7PC6f6QkmZXElW9", "YfRSse6AAz3S4czz"], "word": "0QKFlAVmVLu4AOec", "wordType": "0z8eBeeoip68J1ns"}, {"falseNegative": ["v4W2OJhtafxMSJlH", "eb34sZKHcl5LLLOe", "xL4fZvWtND2tcBFp"], "falsePositive": ["X8lNtFEJ7tnkY6Mc", "a5afj12K2IzrBvvW", "m4udE0OXudXgNne8"], "word": "kJATwlc6esUp6Sw1", "wordType": "I98jeZQ7hfxnhLd3"}]}' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityCreateBulk' test.out

#- 57 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityExport' test.out

#- 58 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityGroup' test.out

#- 59 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'FULLREPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityImport' test.out

#- 60 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id '8SWP3glU6muswVJn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["NnN7kAa7j0riFc5H", "THQIoVsGo7dwV9DB", "qFKHQkETJyTlUrwD"], "falsePositive": ["TnoujQD4IEiH9Z5q", "Xn3aoRtlqOECohVi", "HA5CzgFSy8X1A3Pr"], "word": "Ifapq5AAeMe4L3mD", "wordType": "WORBVXTIIJM9XsYI"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityUpdate' test.out

#- 61 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'IZxiXNMR9BgaWcFX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminProfanityDelete' test.out

#- 62 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 62 'PublicGetMessages' test.out

#- 63 PublicGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat publicGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'PublicGetConfigV1' test.out

#- 64 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId '3SUBhyoTsMWPAxUM' \
    --namespace "$AB_NAMESPACE" \
    --topic 'kawaGpAyrIwMif3B' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE