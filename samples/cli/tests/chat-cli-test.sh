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
echo "1..62"

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

#- 33 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'AdminGetConfigV1' test.out

#- 34 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"chatRateLimitBurst": 41, "chatRateLimitDuration": 94, "concurrentUsersLimit": 0, "enableClanChat": true, "enableManualTopicCreation": true, "enableProfanityFilter": true, "filterAppName": "9WT0GfH2rtOa4EXs", "filterParam": "XzOXQAk4mqrxzTtu", "filterType": "Ll4XlbGL8QOxtjzm", "generalRateLimitBurst": 93, "generalRateLimitDuration": 51, "maxChatMessageLength": 39, "shardCapacityLimit": 47, "shardDefaultLimit": 80, "shardHardLimit": 15, "spamChatBurst": 1, "spamChatDuration": 25, "spamMuteDuration": 83}' \
    > test.out 2>&1
eval_tap $? 34 'AdminUpdateConfigV1' test.out

#- 35 ExportConfig
./ng net.accelbyte.sdk.cli.Main chat exportConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'ExportConfig' test.out

#- 36 ImportConfig
./ng net.accelbyte.sdk.cli.Main chat importConfig \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 36 'ImportConfig' test.out

#- 37 AdminGetInboxCategories
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'AdminGetInboxCategories' test.out

#- 38 AdminAddInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminAddInboxCategory \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 78, "hook": {"driver": "oYZyI4EFZKBcYrCE", "params": {"AE7WIsfmx40NLRc6": {}, "m8heKnWhzfe2Nube": {}, "oKFeIaFQCYoDPICp": {}}}, "jsonSchema": {"nduEEQlULdJz4mnR": {}, "BkMNxvvKgAT8mJrY": {}, "q6hRkloqxM3gpwxc": {}}, "name": "fMy9XzjjI5YbsKoA", "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 38 'AdminAddInboxCategory' test.out

#- 39 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category '3sa13lk1dQBHO86I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteInboxCategory' test.out

#- 40 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'lBhnetU4RwTqUXlT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 83, "hook": {"driver": "BzOuYsaZA2yyd4mb", "params": {"qoOfADMMAXFaY9eK": {}, "a699bRVhyaKwwrAP": {}, "2aMlu7WtjCtoYetO": {}}}, "jsonSchema": {"O847g8OudOfjnCuH": {}, "Z3c46IjGa23YvYmm": {}, "Dg7VYPXIuvUYTZBR": {}}, "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateInboxCategory' test.out

#- 41 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'jIUE1Tq5jyAZvkRC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminGetCategorySchema' test.out

#- 42 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'MNFIurjh2imdb4rb' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteInboxMessage' test.out

#- 43 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '21' \
    --limit '21' \
    --messageId 'Xj0ZwsVC0gL97ZVJ,SPqJiwv1qlYB1RSK,s6gQxC3Gb7S0o4zG' \
    --offset '81' \
    --order 'Y7KQI1AeFgPqaOkv' \
    --scope 'NAMESPACE' \
    --startCreatedAt '100' \
    --status 'SENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 43 'AdminGetInboxMessages' test.out

#- 44 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "aolB4lkKB4EYOkQ1", "expiredAt": 18, "message": {"kD9eOziYRFOn0jJL": {}, "HC9LxhvNXTwGBCto": {}, "hLtl9Zuhytm5UDrT": {}}, "scope": "USER", "status": "SENT", "userIds": ["XCs5SPBbRPZTF6oQ", "AXVG7tnsZg5QgXjv", "yGJPN4eXbJE5Vs2G"]}' \
    > test.out 2>&1
eval_tap $? 44 'AdminSaveInboxMessage' test.out

#- 45 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'cyomQoIXimBJehyx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["lNsjUgxBkF6wFPoJ", "eQediogEhhM2rIiz", "GdKvOPdq5xrgxSmy"]}' \
    > test.out 2>&1
eval_tap $? 45 'AdminUnsendInboxMessage' test.out

#- 46 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox '1DN9LFkYW5DQyj4b' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '64' \
    --status 'UNREAD' \
    --userId 'Ro2ogaKt2ujQSa3Z' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetInboxUsers' test.out

#- 47 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'db65UXmy0Zp6iIaT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 71, "message": {"vXYck0upMzUYnb76": {}, "tFkEORV3bu1bNCtX": {}, "7W40V6Do5sYadCCF": {}}, "scope": "USER", "userIds": ["ft2ulIJzPyrVEiOG", "4UcqsuGKHhMRWLVd", "3DlhLuIpomM8sm1M"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUpdateInboxMessage' test.out

#- 48 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'iaI1mX2tJoARtdbB' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 48 'AdminSendInboxMessage' test.out

#- 49 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'e7udsMrok0WvGYYn,x4V709xbnGezKsDw,G2omOR2nvYI9TVqJ' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetInboxStats' test.out

#- 50 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'dvzcWbfUpaXp5JMl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'AdminGetChatSnapshot' test.out

#- 51 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId '5LL4bTxBmZjdrrIx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteChatSnapshot' test.out

#- 52 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'sB0NRsB1fPqqRRul' \
    --includeChildren  \
    --limit '32' \
    --offset '16' \
    --parentId 'qpymDkQhtrHWwRVn' \
    --startWith 'wVBOqOHi8pWGd1ju' \
    --wordType 'YhiqjRJOqB5F93zF' \
    > test.out 2>&1
eval_tap $? 52 'AdminProfanityQuery' test.out

#- 53 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["QbJndUDpdONneAcz", "bBdHb2slt71B1SmZ", "p2JZp50CnPb71ORY"], "falsePositive": ["cmQbTU5JX8ccLjMX", "JRk0eaKQDOJvrTef", "glSs6g4iY9u02aCN"], "word": "YIWekp18lOC3mNqF", "wordType": "7Bl0LcghVHfPEspx"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminProfanityCreate' test.out

#- 54 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["whRON0bc1eMbEIjo", "wLqc3ecjXJbZDKKo", "xLE1Y3Dymtj3giPg"], "falsePositive": ["4x4yiPX6ues1Hhhk", "g1yLVbLFzHEP8cM4", "NTwr0KHaAsmTej52"], "word": "WKi6tArAURt9plCS", "wordType": "Vq8PdH6hJPUAc0RV"}, {"falseNegative": ["wXgAgntLMCuaXBWQ", "i6BqPg4xr0lCancU", "ZGCHsZYoLfR1KtOv"], "falsePositive": ["7Zy0b65uvuKNuy0y", "tZQ7M6Nzy1adnSKO", "LFKx1dX4LuWJu3pD"], "word": "MUAeeZ97SBROPYuG", "wordType": "6XqP6oo7G73zdxTg"}, {"falseNegative": ["OfnwIdlNa29fDLh7", "41IslKHzGlLKWUtD", "Qs61OQAoxyyQpRWC"], "falsePositive": ["iiPDGQhNPEwiJCf2", "XJVrlzqQls1ozhLV", "A3kE8jKvgatOEBM7"], "word": "0TdlNBJYOmpu1VCa", "wordType": "rzBsV6xnZ5Jrzzjr"}]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminProfanityCreateBulk' test.out

#- 55 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityExport' test.out

#- 56 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityGroup' test.out

#- 57 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'FULLREPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityImport' test.out

#- 58 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id 'xnhLd3Knaknoed9D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["HhLOqQGhCUr6iTrj", "yEgarAdNJOIG36I6", "tRbRcrEveMdAdiPK"], "falsePositive": ["DUVSC00PYeDcaggi", "nxnFIna3yddcbsPh", "eTH26IUJNvYuGRUv"], "word": "pZaHCuESOiIZsMfB", "wordType": "4ZH3mtgWgU4pCAKx"}' \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityUpdate' test.out

#- 59 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'eE70CaunQNxot371' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityDelete' test.out

#- 60 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 60 'PublicGetMessages' test.out

#- 61 PublicGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat publicGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'PublicGetConfigV1' test.out

#- 62 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId 'W9G4AvQkqsGnmyo5' \
    --namespace "$AB_NAMESPACE" \
    --topic 'JJTUVmb8GEXFTlEM' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE