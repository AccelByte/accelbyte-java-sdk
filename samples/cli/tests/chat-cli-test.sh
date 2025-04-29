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
    --body '{"internalAccessLogEnabled": true, "logLevel": "trace", "logLevelDB": "debug", "slowQueryThreshold": 39, "socketLogEnabled": true}' \
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
    --body '{"chatRateLimitBurst": 43, "chatRateLimitDuration": 88, "concurrentUsersLimit": 100, "enableClanChat": false, "enableManualTopicCreation": false, "enablePmSendPlatformId": false, "enableProfanityFilter": true, "filterAppName": "H2rtOa4EXsXzOXQA", "filterParam": "k4mqrxzTtuLl4Xlb", "filterType": "GL8QOxtjzm8y2wNh", "generalRateLimitBurst": 25, "generalRateLimitDuration": 83, "maxChatMessageLength": 45, "shardCapacityLimit": 78, "shardDefaultLimit": 29, "shardHardLimit": 16, "spamChatBurst": 8, "spamChatDuration": 50, "spamMuteDuration": 59}' \
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
    --body '{"enabled": true, "expiresIn": 68, "hook": {"driver": "FZKBcYrCEAE7WIsf", "params": {"mx40NLRc6m8heKnW": {}, "hzfe2NubeoKFeIaF": {}, "QCYoDPICpnduEEQl": {}}}, "jsonSchema": {"ULdJz4mnRBkMNxvv": {}, "KgAT8mJrYq6hRklo": {}, "qxM3gpwxcfMy9Xzj": {}}, "name": "jI5YbsKoADkzJEN2", "saveInbox": false, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'dQBHO86IlBhnetU4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'RwTqUXlTDBzOuYsa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 54, "hook": {"driver": "zaQY3snn2ZkP7cFd", "params": {"P43e5dC9XIBudfZg": {}, "rbHDIDm4hMzF4Txo": {}, "denSrUTvfqU0bfoM": {}}}, "jsonSchema": {"m5cTtFWbotQyXJRc": {}, "QWsmqPNs92epxk0i": {}, "8VxsZNereSvf9699": {}}, "saveInbox": false, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'CEHThUJkETAsSp7g' \
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
    --messageId 'h4TeUTkOkAYfJB8A' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteInboxMessage' test.out

#- 46 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '93' \
    --limit '13' \
    --messageId 't4Tv207Y2QD3oD5f,LCr3OOlXVv8ZGF7u,YnGzpipNDigNJma1' \
    --offset '80' \
    --order 'gPqaOkvo1aolB4lk' \
    --scope 'USER' \
    --startCreatedAt '57' \
    --status 'DRAFT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 46 'AdminGetInboxMessages' test.out

#- 47 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "EYOkQ1jMD3cym8xI", "expiredAt": 10, "message": {"On0jJLHC9LxhvNXT": {}, "wGBCtohLtl9Zuhyt": {}, "m5UDrT6QXCs5SPBb": {}}, "scope": "NAMESPACE", "status": "SENT", "userIds": ["QAXVG7tnsZg5QgXj", "vyGJPN4eXbJE5Vs2", "GcyomQoIXimBJehy"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSaveInboxMessage' test.out

#- 48 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'xlNsjUgxBkF6wFPo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["JeQediogEhhM2rIi", "zGdKvOPdq5xrgxSm", "y1DN9LFkYW5DQyj4"]}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUnsendInboxMessage' test.out

#- 49 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'bj5Ro2ogaKt2ujQS' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '38' \
    --status 'UNREAD' \
    --userId 'Zdb65UXmy0Zp6iIa' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetInboxUsers' test.out

#- 50 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'TIKUkmkk9QM0NBMA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 82, "message": {"tFkEORV3bu1bNCtX": {}, "7W40V6Do5sYadCCF": {}, "rHHC3DpZxkrQDXuN": {}}, "scope": "USER", "userIds": ["UcqsuGKHhMRWLVd3", "DlhLuIpomM8sm1Mi", "aI1mX2tJoARtdbBe"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminUpdateInboxMessage' test.out

#- 51 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId '7udsMrok0WvGYYnx' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 51 'AdminSendInboxMessage' test.out

#- 52 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId '4V709xbnGezKsDwG,2omOR2nvYI9TVqJd,vzcWbfUpaXp5JMl5' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetInboxStats' test.out

#- 53 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'LL4bTxBmZjdrrIxs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminGetChatSnapshot' test.out

#- 54 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'B0NRsB1fPqqRRulp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteChatSnapshot' test.out

#- 55 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'qpymDkQhtrHWwRVn' \
    --includeChildren  \
    --limit '47' \
    --offset '13' \
    --parentId 'VBOqOHi8pWGd1juY' \
    --startWith 'hiqjRJOqB5F93zFQ' \
    --wordType 'bJndUDpdONneAczb' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityQuery' test.out

#- 56 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["BdHb2slt71B1SmZp", "2JZp50CnPb71ORYc", "mQbTU5JX8ccLjMXJ"], "falsePositive": ["Rk0eaKQDOJvrTefg", "lSs6g4iY9u02aCNY", "IWekp18lOC3mNqF7"], "word": "Bl0LcghVHfPEspxw", "wordType": "hRON0bc1eMbEIjow"}' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityCreate' test.out

#- 57 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["Lqc3ecjXJbZDKKox", "LE1Y3Dymtj3giPg4", "x4yiPX6ues1Hhhkg"], "falsePositive": ["1yLVbLFzHEP8cM4N", "Twr0KHaAsmTej52W", "Ki6tArAURt9plCSV"], "word": "q8PdH6hJPUAc0RVw", "wordType": "XgAgntLMCuaXBWQi"}, {"falseNegative": ["6BqPg4xr0lCancUZ", "GCHsZYoLfR1KtOv7", "Zy0b65uvuKNuy0yt"], "falsePositive": ["ZQ7M6Nzy1adnSKOL", "FKx1dX4LuWJu3pDM", "UAeeZ97SBROPYuG6"], "word": "XqP6oo7G73zdxTgO", "wordType": "fnwIdlNa29fDLh74"}, {"falseNegative": ["1IslKHzGlLKWUtDQ", "s61OQAoxyyQpRWCi", "iPDGQhNPEwiJCf2X"], "falsePositive": ["JVrlzqQls1ozhLVA", "3kE8jKvgatOEBM70", "TdlNBJYOmpu1VCar"], "word": "zBsV6xnZ5Jrzzjrc", "wordType": "aug6CWVG8SWP3glU"}]}' \
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
    --limit '68' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityGroup' test.out

#- 60 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'FULLREPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityImport' test.out

#- 61 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id 'uswVJnNnN7kAa7j0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["riFc5HTHQIoVsGo7", "dwV9DBqFKHQkETJy", "TlUrwDTnoujQD4IE"], "falsePositive": ["iH9Z5qXn3aoRtlqO", "ECohViHA5CzgFSy8", "X1A3PrIfapq5AAeM"], "word": "e4L3mDWORBVXTIIJ", "wordType": "M9XsYIIZxiXNMR9B"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminProfanityUpdate' test.out

#- 62 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'gaWcFX3SUBhyoTsM' \
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
    --chatId 'WPAxUMkawaGpAyrI' \
    --namespace "$AB_NAMESPACE" \
    --topic 'wMif3BOdkocVTd4B' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE