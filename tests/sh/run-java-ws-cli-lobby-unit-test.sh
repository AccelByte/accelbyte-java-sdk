#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: java-ws-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

FINISHED_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

export AB_BASE_URL="http://0.0.0.0:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"

create_file() {
    touch $1
}

delete_file() {
    [ ! -e $1 ] || rm $1
}

update_status() {
    return_code=$1
    operation_name=$2

    FINISHED_COUNT=$(( $FINISHED_COUNT + 1 ))

    if [ $return_code == 0 ]
    then
        SUCCESS_COUNT=$(( $SUCCESS_COUNT + 1 ))
        echo "ok $FINISHED_COUNT $operation_name"
    else
        FAILED_COUNT=$(( $FAILED_COUNT + 1 ))
        echo "not ok $FINISHED_COUNT - $operation_name"
        echo '  ---'
        echo '  error: |-'
        while read line; do
        echo "    $line" | tr '\n' ' '
        echo $line
        done < $TEMP_FILE
    fi
}

create_file 'tmp.dat'

echo 'TAP version 13'
echo "1..$OPERATIONS_COUNT"

    java -jar ${JAR_PATH} loginClient

    #- 1 HandlersGetUsersPresenceResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: handlers.GetUsersPresenceResponse\nbusy: 62\ndata: [{'activity': 'tBxyZcDX', 'availability': 'BpGlsQuJ', 'lastSeenAt': 'u8vMf0Is', 'namespace': 'JkTrd8ID', 'userID': 'cV2zXnTK'}]\ninvisible: 18\noffline: 99\nonline: 3' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'HandlersGetUsersPresenceResponse'
        delete_file $TEMP_FILE

    #- 2 HandlersUserPresence
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: handlers.UserPresence\nactivity: PqamiBxx\navailability: 9Cs18EY8\nlastSeenAt: 4ekItqRz\nnamespace: HU1oh570\nuserID: KQBVaewc' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'HandlersUserPresence'
        delete_file $TEMP_FILE

    #- 3 LogAppMessageDeclaration
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: log.AppMessageDeclaration\nAttributes: [72krSha6]\nCode: 8n3Ynozp\nCodeName: 1C2KmIQT\nSection: uBdNEUsx\nService: Fb8CJ17M\nText: 7DJZaMSx' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'LogAppMessageDeclaration'
        delete_file $TEMP_FILE

    #- 4 ModelBulkAddFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.BulkAddFriendsRequest\nfriendIds: [ECbZbygy]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelBulkAddFriendsRequest'
        delete_file $TEMP_FILE

    #- 5 ModelBulkUsersFreeFormNotificationRequestV1
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.BulkUsersFreeFormNotificationRequestV1\nmessage: oarORoeN\ntopicName: HSb8Rh3k\nuserIds: [gs9qqJbn]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelBulkUsersFreeFormNotificationRequestV1'
        delete_file $TEMP_FILE

    #- 6 ModelChatMessageResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.ChatMessageResponse\nid: P8Cm3yvA\nfrom: QsoBgiVp\npayload: SUoxdxxF\nreceivedAt: 32\nto: mAGTJ8IE' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelChatMessageResponse'
        delete_file $TEMP_FILE

    #- 7 ModelCreateTemplateRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.CreateTemplateRequest\ntemplateContent: dagEtp4w\ntemplateLanguage: 29KOu9c1\ntemplateSlug: 9R6XDqWH' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelCreateTemplateRequest'
        delete_file $TEMP_FILE

    #- 8 ModelCreateTopicRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.CreateTopicRequest\ndescription: kkP8npLE\ntopic: KMfjiX7j' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelCreateTopicRequest'
        delete_file $TEMP_FILE

    #- 9 ModelCreateTopicRequestV1
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.CreateTopicRequestV1\ndescription: pkVZk3Ia\ntopicName: QYEmqGod' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelCreateTopicRequestV1'
        delete_file $TEMP_FILE

    #- 10 ModelFreeFormNotificationRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.FreeFormNotificationRequest\nmessage: OEGt9gPO\ntopic: j0c6i0Jk' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelFreeFormNotificationRequest'
        delete_file $TEMP_FILE

    #- 11 ModelFreeFormNotificationRequestV1
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.FreeFormNotificationRequestV1\nmessage: vIas73uc\ntopicName: YnFAJ3DK' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelFreeFormNotificationRequestV1'
        delete_file $TEMP_FILE

    #- 12 ModelGetAllNotificationTemplateSlugResp
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.GetAllNotificationTemplateSlugResp\ndata: [{'lastDraftAt': '5T4Eogg0', 'lastPublishedAt': 'Y39UoYlp', 'templateContent': {'draft': 'v5bVAgts', 'published': 'DhUTDUsc'}, 'templateLanguage': 'bQDjbTQu'}]\npaging: {"first":"PMz2PTRl","last":"kyU89ZPO","next":"w6zPFJ42","previous":"cwmzBBSM"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelGetAllNotificationTemplateSlugResp'
        delete_file $TEMP_FILE

    #- 13 ModelGetAllNotificationTopicsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.GetAllNotificationTopicsResponse\ndata: [{'createdAt': 78, 'description': 'coAAOjKN', 'namespace': 'jfcYHm09', 'topicName': '3aYgBU1s'}]\npaging: {"first":"qjyK0XH4","last":"5PaRSOFQ","next":"Btu23REZ","previous":"8hRVX7LG"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelGetAllNotificationTopicsResponse'
        delete_file $TEMP_FILE

    #- 14 ModelGetFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.GetFriendsResponse\nfriendIDs: [OvDdYiQS]\npaging: {"first":"9i7mV1C9","last":"1pjG9gpx","next":"L6ycTQdv","previous":"ln2LAuSQ"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelGetFriendsResponse'
        delete_file $TEMP_FILE

    #- 15 ModelGetUserFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.GetUserFriendsResponse\nfriendIDs: [WEXL6LFE]\npaging: {"first":"1YHo9m12","last":"6ZWc8hHt","next":"WvbNYqgU","previous":"qslArFPi"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelGetUserFriendsResponse'
        delete_file $TEMP_FILE

    #- 16 ModelGetUserIncomingFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.GetUserIncomingFriendsResponse\nfriendIDs: [HUIvaCv8]\npaging: {"first":"kU9dBBpd","last":"sJLhsVyE","next":"xrkxoot0","previous":"B7WOferc"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelGetUserIncomingFriendsResponse'
        delete_file $TEMP_FILE

    #- 17 ModelGetUserOutgoingFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.GetUserOutgoingFriendsResponse\nfriendIDs: [ZdpMci37]\npaging: {"first":"Ds7YSfEx","last":"aI3uzLte","next":"MbFAlt4h","previous":"r7HmOYiB"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelGetUserOutgoingFriendsResponse'
        delete_file $TEMP_FILE

    #- 18 ModelLocalization
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.Localization\nlastDraftAt: A5ltAOXm\nlastPublishedAt: lG6eh1dT\ntemplateContent: {"draft":"doTFpBIc","published":"uC1dQY93"}\ntemplateLanguage: OJnJ6Te9' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelLocalization'
        delete_file $TEMP_FILE

    #- 19 ModelNotificationTemplateResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.NotificationTemplateResponse\ntemplateLocalizations: [{'lastDraftAt': 'vD8ldz7H', 'lastPublishedAt': 'u8AD79kd', 'templateContent': {'draft': 'WunvizU0', 'published': 'q1pHyhhE'}, 'templateLanguage': 'RoGgdrys'}]\ntemplateSlug: MizBGSRd' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelNotificationTemplateResponse'
        delete_file $TEMP_FILE

    #- 20 ModelNotificationTopicResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.NotificationTopicResponse\ncreatedAt: 82\ndescription: 2l7DNSZ8\nnamespace: Aq0XiPLQ\ntopic: XSe07Zdd' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelNotificationTopicResponse'
        delete_file $TEMP_FILE

    #- 21 ModelNotificationTopicResponseV1
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.NotificationTopicResponseV1\ncreatedAt: 80\ndescription: GTMlJjBw\nnamespace: j9HJHQKs\ntopicName: eEdSXRDS' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelNotificationTopicResponseV1'
        delete_file $TEMP_FILE

    #- 22 ModelNotificationWithTemplateRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.NotificationWithTemplateRequest\ntemplateContext: {"vguauw1x":"T7eMwSl9"}\ntemplateLanguage: MLH0NnTJ\ntemplateSlug: 2ulNzBvw\ntopic: JaQa547J' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelNotificationWithTemplateRequest'
        delete_file $TEMP_FILE

    #- 23 ModelNotificationWithTemplateRequestV1
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.NotificationWithTemplateRequestV1\ntemplateContext: {"llvA8RWS":"pabUt7xk"}\ntemplateLanguage: 6QxyWhfq\ntemplateSlug: oWfJw2o8\ntopicName: oWUqvPCZ' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelNotificationWithTemplateRequestV1'
        delete_file $TEMP_FILE

    #- 24 ModelPagination
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.Pagination\nfirst: 2HzT7NXm\nlast: WDlXsuNI\nnext: dQJR5lsN\nprevious: OlvkfwaS' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelPagination'
        delete_file $TEMP_FILE

    #- 25 ModelRequestFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.RequestFriendsRequest\nfriendId: bnsuLCgT' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelRequestFriendsRequest'
        delete_file $TEMP_FILE

    #- 26 ModelTemplateContent
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.TemplateContent\ndraft: oxuVTekJ\npublished: gvg6h5HI' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelTemplateContent'
        delete_file $TEMP_FILE

    #- 27 ModelTemplateLocalization
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.TemplateLocalization\nlastDraftAt: pH0Dvipl\nlastPublishedAt: Ek4vj3LD\ntemplateContent: {"draft":"p4yqDt8Q","published":"UZDpxlHa"}\ntemplateLanguage: sinGcjrk\ntemplateSlug: mRMttgjD' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelTemplateLocalization'
        delete_file $TEMP_FILE

    #- 28 ModelTemplateLocalizationResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.TemplateLocalizationResponse\nfirst: SaIVBmft\nlast: 3Udg7p9P\nnext: GmY2H5kX\nprevious: 4MsisSX2\ntemplateLocalization: [{'lastDraftAt': '8nARxWRp', 'lastPublishedAt': 'v5ou5xtv', 'templateContent': {'draft': 'd28OUfCt', 'published': '8UJC5flN'}, 'templateLanguage': 'yj6HsTtX', 'templateSlug': '8P3llnaa'}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelTemplateLocalizationResponse'
        delete_file $TEMP_FILE

    #- 29 ModelTemplateResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.TemplateResponse\nlocalizations: [{'lastDraftAt': 'S9lqyygP', 'lastPublishedAt': 'cfkJIxfQ', 'templateContent': {'draft': 'Zza8kNVb', 'published': 'DxVMq7HJ'}, 'templateLanguage': 'k0F89xAc'}]\ntemplateSlug: 3YVfaENt' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelTemplateResponse'
        delete_file $TEMP_FILE

    #- 30 ModelTopicByNamespacesResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.TopicByNamespacesResponse\nfirst: rl0pTKZT\nlast: XqzHuBMY\nnext: QSA2jz1Z\nprevious: OpdOjSyM\ntopics: [{'createdAt': 6, 'description': 'dB41JuMf', 'namespace': '7RUyBHRj', 'topic': '8IiRimRl'}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelTopicByNamespacesResponse'
        delete_file $TEMP_FILE

    #- 31 ModelUpdateTemplateRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UpdateTemplateRequest\ntemplateContent: lHT6Dc40' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUpdateTemplateRequest'
        delete_file $TEMP_FILE

    #- 32 ModelUpdateTopicRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UpdateTopicRequest\ndescription: vFFA6gpU' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUpdateTopicRequest'
        delete_file $TEMP_FILE

    #- 33 ModelUserAcceptFriendRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UserAcceptFriendRequest\nfriendId: 7EW3x1dC' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUserAcceptFriendRequest'
        delete_file $TEMP_FILE

    #- 34 ModelUserCancelFriendRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UserCancelFriendRequest\nfriendId: pm55gOeq' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUserCancelFriendRequest'
        delete_file $TEMP_FILE

    #- 35 ModelUserGetFriendshipStatusResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UserGetFriendshipStatusResponse\ncode: 84\nname: IqcJVKmB' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUserGetFriendshipStatusResponse'
        delete_file $TEMP_FILE

    #- 36 ModelUserRejectFriendRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UserRejectFriendRequest\nfriendId: M1J1IbuT' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUserRejectFriendRequest'
        delete_file $TEMP_FILE

    #- 37 ModelUserUnfriendRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: model.UserUnfriendRequest\nfriendId: rrkbmuT1' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelUserUnfriendRequest'
        delete_file $TEMP_FILE

    #- 38 ModelsAdminAddProfanityFilterIntoListRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminAddProfanityFilterIntoListRequest\nfilter: whOqmEnD\nnote: XIWrBPlS' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminAddProfanityFilterIntoListRequest'
        delete_file $TEMP_FILE

    #- 39 ModelsAdminAddProfanityFiltersFilterRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminAddProfanityFiltersFilterRequest\nfilter: ay46mv71\nnote: BAZAOjtF' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminAddProfanityFiltersFilterRequest'
        delete_file $TEMP_FILE

    #- 40 ModelsAdminAddProfanityFiltersRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminAddProfanityFiltersRequest\nfilters: [{'filter': 'J2vmTj7t', 'note': 'T7TZHWDd'}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminAddProfanityFiltersRequest'
        delete_file $TEMP_FILE

    #- 41 ModelsAdminCreateProfanityListRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminCreateProfanityListRequest\nisEnabled: True\nisMandatory: False\nname: IsZoArWw' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminCreateProfanityListRequest'
        delete_file $TEMP_FILE

    #- 42 ModelsAdminDeleteProfanityFilterRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminDeleteProfanityFilterRequest\nfilter: PHcyFAdA' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminDeleteProfanityFilterRequest'
        delete_file $TEMP_FILE

    #- 43 ModelsAdminGetProfanityListFiltersV1Response
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminGetProfanityListFiltersV1Response\nfilters: [{'filter': 'tYciLIgR', 'listName': 'wFRr0gwB', 'namespace': '9tz3vp99', 'note': 'XVlV8rK3'}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminGetProfanityListFiltersV1Response'
        delete_file $TEMP_FILE

    #- 44 ModelsAdminGetProfanityListsListResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminGetProfanityListsListResponse\nisEnabled: True\nisMandatory: True\nname: 6n0smip1' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminGetProfanityListsListResponse'
        delete_file $TEMP_FILE

    #- 45 ModelsAdminSetProfanityRuleForNamespaceRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminSetProfanityRuleForNamespaceRequest\nrule: tw3L7cUd' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminSetProfanityRuleForNamespaceRequest'
        delete_file $TEMP_FILE

    #- 46 ModelsAdminUpdateProfanityList
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminUpdateProfanityList\nisEnabled: False\nisMandatory: True\nnewName: tv6JfPZw' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminUpdateProfanityList'
        delete_file $TEMP_FILE

    #- 47 ModelsAdminVerifyMessageProfanityRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminVerifyMessageProfanityRequest\nmessage: cCVOXcVa\nprofanityLevel: 80TmCwtD' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminVerifyMessageProfanityRequest'
        delete_file $TEMP_FILE

    #- 48 ModelsAdminVerifyMessageProfanityResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.AdminVerifyMessageProfanityResponse\nfilteredMessage: 2lAH01o6\nhasProfanity: False' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsAdminVerifyMessageProfanityResponse'
        delete_file $TEMP_FILE

    #- 49 ModelsBlockedByPlayerData
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.BlockedByPlayerData\nblockedAt: 1972-08-08T00:00:00Z\nuserId: IgzrDyWp' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsBlockedByPlayerData'
        delete_file $TEMP_FILE

    #- 50 ModelsBlockedPlayerData
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.BlockedPlayerData\nblockedAt: 1986-08-09T00:00:00Z\nblockedUserId: YGmmBawM' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsBlockedPlayerData'
        delete_file $TEMP_FILE

    #- 51 ModelsConfig
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.Config\nallowInviteNonConnectedUser: True\nautoKickOnDisconnect: False\nautoKickOnDisconnectDelay: 73\ncancelTicketOnDisconnect: True\nchatRateLimitBurst: 79\nchatRateLimitDuration: 30\nconcurrentUsersLimit: 7\ndisablePartyInvitationToken: True\nenableChat: False\nentitlementCheck: True\nentitlementItemID: m8xwUfzO\ngeneralRateLimitBurst: 23\ngeneralRateLimitDuration: 85\nmaxPartyMember: 16\nnamespace: ZY4NbOQX\nprofanityFilter: True\nreadyConsentTimeout: 81' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsConfig'
        delete_file $TEMP_FILE

    #- 52 ModelsConfigExport
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ConfigExport\nallowInviteNonConnectedUser: True\nautoKickOnDisconnect: True\nautoKickOnDisconnectDelay: 41\ncancelTicketOnDisconnect: True\nchatRateLimitBurst: 39\nchatRateLimitDuration: 79\nconcurrentUsersLimit: 23\ndisablePartyInvitationToken: True\nenableChat: False\nentitlementCheck: False\nentitlementItemID: K4DEUJRV\ngeneralRateLimitBurst: 72\ngeneralRateLimitDuration: 22\nmaxPartyMember: 60\nnamespace: b0R1XRb0\nprofanityFilter: True\nreadyConsentTimeout: 88' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsConfigExport'
        delete_file $TEMP_FILE

    #- 53 ModelsConfigList
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ConfigList\nconfigs: [{'allowInviteNonConnectedUser': True, 'autoKickOnDisconnect': False, 'autoKickOnDisconnectDelay': 8, 'cancelTicketOnDisconnect': False, 'chatRateLimitBurst': 26, 'chatRateLimitDuration': 13, 'concurrentUsersLimit': 34, 'disablePartyInvitationToken': False, 'enableChat': True, 'entitlementCheck': True, 'entitlementItemID': 'aPBtkZMi', 'generalRateLimitBurst': 28, 'generalRateLimitDuration': 44, 'maxPartyMember': 5, 'namespace': 'yhloVS3r', 'profanityFilter': False, 'readyConsentTimeout': 84}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsConfigList'
        delete_file $TEMP_FILE

    #- 54 ModelsConfigReq
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ConfigReq\nallowInviteNonConnectedUser: True\nautoKickOnDisconnect: False\nautoKickOnDisconnectDelay: 61\ncancelTicketOnDisconnect: False\nchatRateLimitBurst: 56\nchatRateLimitDuration: 60\nconcurrentUsersLimit: 95\ndisablePartyInvitationToken: False\nenableChat: False\nentitlementCheck: False\nentitlementItemID: ypWjDNhz\ngeneralRateLimitBurst: 57\ngeneralRateLimitDuration: 75\nmaxPartyMember: 36\nprofanityFilter: True\nreadyConsentTimeout: 44' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsConfigReq'
        delete_file $TEMP_FILE

    #- 55 ModelsCreateConfigRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.CreateConfigRequest\napiKey: O763iEkl' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsCreateConfigRequest'
        delete_file $TEMP_FILE

    #- 56 ModelsCreateConfigResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.CreateConfigResponse\napiKey: kzLm88Lp\nnamespace: LuYRO3C5' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsCreateConfigResponse'
        delete_file $TEMP_FILE

    #- 57 ModelsDebugProfanityFilterRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.DebugProfanityFilterRequest\ntext: 5yHpwK2J' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsDebugProfanityFilterRequest'
        delete_file $TEMP_FILE

    #- 58 ModelsGetAllPlayerBlockedByUsersResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.GetAllPlayerBlockedByUsersResponse\ndata: [{'blockedAt': '1971-05-15T00:00:00Z', 'userId': 'enDGn7a2'}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsGetAllPlayerBlockedByUsersResponse'
        delete_file $TEMP_FILE

    #- 59 ModelsGetAllPlayerBlockedUsersResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.GetAllPlayerBlockedUsersResponse\ndata: [{'blockedAt': '1990-05-02T00:00:00Z', 'blockedUserId': 'lWiLjq06'}]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsGetAllPlayerBlockedUsersResponse'
        delete_file $TEMP_FILE

    #- 60 ModelsGetAllPlayerSessionAttributeResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.GetAllPlayerSessionAttributeResponse\nattributes: {"n6a0rW8E":"fkpaXtwY"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsGetAllPlayerSessionAttributeResponse'
        delete_file $TEMP_FILE

    #- 61 ModelsGetConfigResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.GetConfigResponse\napiKey: ZJaQ4Wbw\nnamespace: NmsFYetj' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsGetConfigResponse'
        delete_file $TEMP_FILE

    #- 62 ModelsGetLobbyCcuResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.GetLobbyCcuResponse\ncountCurrentUsers: 61' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsGetLobbyCcuResponse'
        delete_file $TEMP_FILE

    #- 63 ModelsGetPlayerSessionAttributeResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.GetPlayerSessionAttributeResponse\nkey: urH8eloJ\nvalue: zNKtRUaT' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsGetPlayerSessionAttributeResponse'
        delete_file $TEMP_FILE

    #- 64 ModelsImportConfigResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ImportConfigResponse\nfailedConfigs: [z1ETdsmw]\nignoredConfigs: [zjkkn9oi]\nnewConfigs: [Ql05g7cO]\nreplacedConfigs: [3ZMb6Ojl]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsImportConfigResponse'
        delete_file $TEMP_FILE

    #- 65 ModelsListBlockedPlayerRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ListBlockedPlayerRequest\nlistBlockedUserId: [o6DMNpP2]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsListBlockedPlayerRequest'
        delete_file $TEMP_FILE

    #- 66 ModelsPartyData
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.PartyData\ncustom_attribute: {"qMrTQ1Up":{}}\ninvitees: [jfU6wJhy]\nleader: 1jOVkkUl\nmembers: [S79527EZ]\nnamespace: 25Ia8uCe\npartyId: ZFlLtEVp\nupdatedAt: 58' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsPartyData'
        delete_file $TEMP_FILE

    #- 67 ModelsPartyPUTCustomAttributesRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.PartyPUTCustomAttributesRequest\ncustom_attribute: {"AEbA82jy":{}}\nupdatedAt: 23' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsPartyPUTCustomAttributesRequest'
        delete_file $TEMP_FILE

    #- 68 ModelsProfanityFilter
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ProfanityFilter\nfilter: q0pDE5xR\nlistName: wh5b45eb\nnamespace: pcM7ScSs\nnote: 3UOpAwIp' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsProfanityFilter'
        delete_file $TEMP_FILE

    #- 69 ModelsProfanityRule
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.ProfanityRule\nNamespace: 9rRtn1Pc\nRule: CxdbumeY' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsProfanityRule'
        delete_file $TEMP_FILE

    #- 70 ModelsSetPlayerSessionAttributeRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.SetPlayerSessionAttributeRequest\nattributes: {"gOdEBWRQ":"iW3KFfU8"}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsSetPlayerSessionAttributeRequest'
        delete_file $TEMP_FILE

    #- 71 ModelsUpdateConfigRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.UpdateConfigRequest\napiKey: icH4081g' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsUpdateConfigRequest'
        delete_file $TEMP_FILE

    #- 72 ModelsUpdateConfigResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: models.UpdateConfigResponse\napiKey: RB1GyLfL\nnamespace: g4RYuEbg' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ModelsUpdateConfigResponse'
        delete_file $TEMP_FILE

    #- 73 ResponseError
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: response.Error\nerrorCode: 93\nerrorMessage: DEcJyIvs' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ResponseError'
        delete_file $TEMP_FILE

    #- 74 RestapiErrorResponseBody
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: restapi.ErrorResponseBody\nErrorCode: 83\nErrorMessage: wOr0BmV5' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RestapiErrorResponseBody'
        delete_file $TEMP_FILE

    #- 75 RestapiErrorResponseV1
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: restapi.ErrorResponseV1\nerrorCode: 16\nerrorMessage: FvfwFjTS' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RestapiErrorResponseV1'
        delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT