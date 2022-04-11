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

OPERATIONS_COUNT=103

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

    #- 1 AcceptFriendsNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: FtBxyZcD' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'AcceptFriendsNotif'
        delete_file $TEMP_FILE

    #- 2 AcceptFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: acceptFriendsRequest\nid: Ju8vMf0I\nfriendId: XBpGlsQu' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'AcceptFriendsRequest'
        delete_file $TEMP_FILE

    #- 3 AcceptFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: acceptFriendsResponse\nid: JkTrd8ID\ncode: 36' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'AcceptFriendsResponse'
        delete_file $TEMP_FILE

    #- 4 BlockPlayerNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: cV2zXnTK\nuserId: jXY1bPqa' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'BlockPlayerNotif'
        delete_file $TEMP_FILE

    #- 5 BlockPlayerRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: blockPlayerRequest\nid: 18EY84ek\nblockUserId: miBxx9Cs\nnamespace: ItqRzHU1' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'BlockPlayerRequest'
        delete_file $TEMP_FILE

    #- 6 BlockPlayerResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: blockPlayerResponse\nid: aewc72kr\nblockUserId: oh570KQB\ncode: 95\nnamespace: Sha68n3Y' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'BlockPlayerResponse'
        delete_file $TEMP_FILE

    #- 7 CancelFriendsNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: nozp1C2K' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'CancelFriendsNotif'
        delete_file $TEMP_FILE

    #- 8 CancelFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: cancelFriendsRequest\nid: EUsxFb8C\nfriendId: mIQTuBdN' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'CancelFriendsRequest'
        delete_file $TEMP_FILE

    #- 9 CancelFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: cancelFriendsResponse\nid: 17M7DJZa\ncode: 70' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'CancelFriendsResponse'
        delete_file $TEMP_FILE

    #- 10 CancelMatchmakingRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: ygyoarOR\ngameMode: MSxECbZb\nisTempParty: False' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'CancelMatchmakingRequest'
        delete_file $TEMP_FILE

    #- 11 CancelMatchmakingResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: NHSb8Rh3\ncode: 8' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'CancelMatchmakingResponse'
        delete_file $TEMP_FILE

    #- 12 ChannelChatNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: kgs9qqJb\nfrom: nQsoBgiV\npayload: pP8Cm3yv\nsentAt: ASUoxdxx' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ChannelChatNotif'
        delete_file $TEMP_FILE

    #- 13 ClientResetRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: clientResetRequest\nnamespace: FqmAGTJ8\nuserId: IEdagEtp' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ClientResetRequest'
        delete_file $TEMP_FILE

    #- 14 ConnectNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: connectNotif\nlobbySessionId: 4w29KOu9' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ConnectNotif'
        delete_file $TEMP_FILE

    #- 15 DisconnectNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: c19R6XDq\nnamespace: WHkkP8np' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'DisconnectNotif'
        delete_file $TEMP_FILE

    #- 16 DsNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: dsNotif\nalternateIps: [LEKMfjiX]\ncustomAttribute: 7jpkVZk3\ndeployment: IaQYEmqG\ngameVersion: odOEGt9g\nimageVersion: POj0c6i0\nip: JkvIas73\nisOK: True\nisOverrideGameVersion: False\nlastUpdate: YnFAJ3DK\nmatchId: 5T4Eogg0\nmessage: Y39UoYlp\nnamespace: v5bVAgts\npodName: DhUTDUsc\nport: 2\nports: {"QDjbTQuP":76}\nprotocol: z2PTRlky\nprovider: U89ZPOw6\nregion: zPFJ42cw\nsessionId: mzBBSMNc\nstatus: oAAOjKNj' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'DsNotif'
        delete_file $TEMP_FILE

    #- 17 ErrorNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: errorNotif\nmessage: fcYHm093' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ErrorNotif'
        delete_file $TEMP_FILE

    #- 18 ExitAllChannel
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: exitAllChannel\nnamespace: aYgBU1sq\nuserId: jyK0XH45' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ExitAllChannel'
        delete_file $TEMP_FILE

    #- 19 FriendsStatusRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: friendsStatusRequest\nid: PaRSOFQB' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'FriendsStatusRequest'
        delete_file $TEMP_FILE

    #- 20 FriendsStatusResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: friendsStatusResponse\nid: dYiQS9i7\nactivity: [tu23REZ8]\navailability: [15]\ncode: 87\nfriendIds: [VX7LGOvD]\nlastSeenAt: [mV1C91pj]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'FriendsStatusResponse'
        delete_file $TEMP_FILE

    #- 21 GetAllSessionAttributeRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: G9gpxL6y' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'GetAllSessionAttributeRequest'
        delete_file $TEMP_FILE

    #- 22 GetAllSessionAttributeResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: 6LFE1YHo\nattributes: {"cTQdvln2":"LAuSQWEX"}\ncode: 74' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'GetAllSessionAttributeResponse'
        delete_file $TEMP_FILE

    #- 23 GetFriendshipStatusRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: 8hHtWvbN\nfriendId: 9m126ZWc' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'GetFriendshipStatusRequest'
        delete_file $TEMP_FILE

    #- 24 GetFriendshipStatusResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: PiHUIvaC\ncode: 33\nfriendshipStatus: gUqslArF' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'GetFriendshipStatusResponse'
        delete_file $TEMP_FILE

    #- 25 GetSessionAttributeRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: v8kU9dBB\nkey: pdsJLhsV' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'GetSessionAttributeRequest'
        delete_file $TEMP_FILE

    #- 26 GetSessionAttributeResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: Exrkxoot\ncode: 49\nvalue: 0B7WOfer' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'GetSessionAttributeResponse'
        delete_file $TEMP_FILE

    #- 27 Heartbeat
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: heartbeat' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'Heartbeat'
        delete_file $TEMP_FILE

    #- 28 JoinDefaultChannelRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: cZdpMci3' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'JoinDefaultChannelRequest'
        delete_file $TEMP_FILE

    #- 29 JoinDefaultChannelResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: aI3uzLte\nchannelSlug: 7Ds7YSfE\ncode: 46' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'JoinDefaultChannelResponse'
        delete_file $TEMP_FILE

    #- 30 ListIncomingFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: MbFAlt4h' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListIncomingFriendsRequest'
        delete_file $TEMP_FILE

    #- 31 ListIncomingFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: 7HmOYiBA\ncode: 35\nuserIds: [5ltAOXml]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListIncomingFriendsResponse'
        delete_file $TEMP_FILE

    #- 32 ListOfFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listOfFriendsRequest\nid: oTFpBIcu\nfriendId: G6eh1dTd' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListOfFriendsRequest'
        delete_file $TEMP_FILE

    #- 33 ListOfFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listOfFriendsResponse\nid: nJ6Te9vD\ncode: 57\nfriendIds: [1dQY93OJ]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListOfFriendsResponse'
        delete_file $TEMP_FILE

    #- 34 ListOnlineFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: 8ldz7Hu8' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListOnlineFriendsRequest'
        delete_file $TEMP_FILE

    #- 35 ListOutgoingFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: AD79kdWu' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListOutgoingFriendsRequest'
        delete_file $TEMP_FILE

    #- 36 ListOutgoingFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: HyhhERoG\ncode: 26\nfriendIds: [vizU0q1p]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ListOutgoingFriendsResponse'
        delete_file $TEMP_FILE

    #- 37 MatchmakingNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [gdrysMiz]\nmatchId: BGSRdP2l\nmessage: 7DNSZ8Aq\npartyMember: [0XiPLQXS]\nreadyDuration: 9\nstatus: 07ZddOGT' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'MatchmakingNotif'
        delete_file $TEMP_FILE

    #- 38 MessageNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: messageNotif\nid: HJHQKseE\nfrom: MlJjBwj9\npayload: dSXRDSvg\nsentAt: 41\nto: auw1xT7e\ntopic: MwSl9MLH' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'MessageNotif'
        delete_file $TEMP_FILE

    #- 39 OfflineNotificationRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: offlineNotificationRequest\nid: 0NnTJ2ul' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'OfflineNotificationRequest'
        delete_file $TEMP_FILE

    #- 40 OfflineNotificationResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: offlineNotificationResponse\nid: zBvwJaQa\ncode: 79' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'OfflineNotificationResponse'
        delete_file $TEMP_FILE

    #- 41 OnlineFriends
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: onlineFriends\nid: llvA8RWS\ncode: 71\nonlineFriendIds: [pabUt7xk]' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'OnlineFriends'
        delete_file $TEMP_FILE

    #- 42 PartyChatNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyChatNotif\nid: oWfJw2o8\nfrom: 6QxyWhfq\npayload: oWUqvPCZ\nreceivedAt: 66\nto: zT7NXmWD' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyChatNotif'
        delete_file $TEMP_FILE

    #- 43 PartyChatRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyChatRequest\nid: JR5lsNOl\nfrom: lXsuNIdQ\npayload: vkfwaSbn\nreceivedAt: 37\nto: uLCgToxu' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyChatRequest'
        delete_file $TEMP_FILE

    #- 44 PartyChatResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyChatResponse\nid: TekJgvg6\ncode: 94' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyChatResponse'
        delete_file $TEMP_FILE

    #- 45 PartyCreateRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyCreateRequest\nid: h5HIpH0D' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyCreateRequest'
        delete_file $TEMP_FILE

    #- 46 PartyCreateResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyCreateResponse\nid: iplEk4vj\ncode: 42\ninvitationToken: 3LDp4yqD\ninvitees: t8QUZDpx\nleaderId: lHasinGc\nmembers: jrkmRMtt\npartyId: gjDSaIVB' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyCreateResponse'
        delete_file $TEMP_FILE

    #- 47 PartyDataUpdateNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"mft3Udg7":{}}\ninvitees: [p9PGmY2H]\nleader: 5kX4Msis\nmembers: [SX28nARx]\nnamespace: WRpv5ou5\npartyId: xtvd28OU\nupdatedAt: 10' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyDataUpdateNotif'
        delete_file $TEMP_FILE

    #- 48 PartyGetInvitedNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: Ct8UJC5f\ninvitationToken: lNyj6HsT\npartyId: tX8P3lln' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyGetInvitedNotif'
        delete_file $TEMP_FILE

    #- 49 PartyInfoRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyInfoRequest\nid: aaS9lqyy' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyInfoRequest'
        delete_file $TEMP_FILE

    #- 50 PartyInfoResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyInfoResponse\nid: QZza8kNV\ncode: 12\ncustomAttributes: {"PcfkJIxf":{}}\ninvitationToken: bDxVMq7H\ninvitees: Jk0F89xA\nleaderId: c3YVfaEN\nmembers: trl0pTKZ\npartyId: TXqzHuBM' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyInfoResponse'
        delete_file $TEMP_FILE

    #- 51 PartyInviteNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: YQSA2jz1\ninviterId: ZOpdOjSy' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyInviteNotif'
        delete_file $TEMP_FILE

    #- 52 PartyInviteRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyInviteRequest\nid: Mf7RUyBH\nfriendId: MddB41Ju' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyInviteRequest'
        delete_file $TEMP_FILE

    #- 53 PartyInviteResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyInviteResponse\nid: j8IiRimR\ncode: 87' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyInviteResponse'
        delete_file $TEMP_FILE

    #- 54 PartyJoinNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyJoinNotif\nuserId: llHT6Dc4' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyJoinNotif'
        delete_file $TEMP_FILE

    #- 55 PartyJoinRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyJoinRequest\nid: 0vFFA6gp\ninvitationToken: U7EW3x1d\npartyId: Cpm55gOe' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyJoinRequest'
        delete_file $TEMP_FILE

    #- 56 PartyJoinResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyJoinResponse\nid: QIqcJVKm\ncode: 33\ninvitationToken: BM1J1Ibu\ninvitees: TrrkbmuT\nleaderId: 1whOqmEn\nmembers: DXIWrBPl\npartyId: Say46mv7' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyJoinResponse'
        delete_file $TEMP_FILE

    #- 57 PartyKickNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyKickNotif\nleaderId: 1BAZAOjt\npartyId: FJ2vmTj7\nuserId: tT7TZHWD' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyKickNotif'
        delete_file $TEMP_FILE

    #- 58 PartyKickRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyKickRequest\nid: dCkIsZoA\nmemberId: rWwPHcyF' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyKickRequest'
        delete_file $TEMP_FILE

    #- 59 PartyKickResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyKickResponse\nid: dAtYciLI\ncode: 52' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyKickResponse'
        delete_file $TEMP_FILE

    #- 60 PartyLeaveNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: gRwFRr0g\nuserId: wB9tz3vp' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyLeaveNotif'
        delete_file $TEMP_FILE

    #- 61 PartyLeaveRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyLeaveRequest\nid: 99XVlV8r\nignoreUserRegistry: True' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyLeaveRequest'
        delete_file $TEMP_FILE

    #- 62 PartyLeaveResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyLeaveResponse\nid: 6n0smip1\ncode: 61' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyLeaveResponse'
        delete_file $TEMP_FILE

    #- 63 PartyPromoteLeaderRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: tw3L7cUd\nnewLeaderUserId: 9pqtv6Jf' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyPromoteLeaderRequest'
        delete_file $TEMP_FILE

    #- 64 PartyPromoteLeaderResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: ZwcCVOXc\ncode: 83\ninvitationToken: Va80TmCw\ninvitees: tD2lAH01\nleaderId: o6NdcBIg\nmembers: zrDyWpFB\npartyId: YGmmBawM' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyPromoteLeaderResponse'
        delete_file $TEMP_FILE

    #- 65 PartyRejectNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: yoKyNpdA\npartyId: asm8xwUf\nuserId: zOlQiZY4' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyRejectNotif'
        delete_file $TEMP_FILE

    #- 66 PartyRejectRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyRejectRequest\nid: NbOQXJ7u\ninvitationToken: OTzNMvuq\npartyId: 2tNl4CX4' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyRejectRequest'
        delete_file $TEMP_FILE

    #- 67 PartyRejectResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: partyRejectResponse\nid: jiK4DEUJ\ncode: 68\npartyId: RVK3l9Eb' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PartyRejectResponse'
        delete_file $TEMP_FILE

    #- 68 PersonalChatHistoryRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: H8vS1sme\nfriendId: 0R1XRb0R' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PersonalChatHistoryRequest'
        delete_file $TEMP_FILE

    #- 69 PersonalChatHistoryResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: io4wcyhl\nchat: OlngrdTX\ncode: 56\nfriendId: zaPBtkZM' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PersonalChatHistoryResponse'
        delete_file $TEMP_FILE

    #- 70 PersonalChatNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: personalChatNotif\nid: QtcEmCEV\nfrom: oVS3rYp8\npayload: c75Ufeyp\nreceivedAt: 96\nto: jDNhzCL5' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PersonalChatNotif'
        delete_file $TEMP_FILE

    #- 71 PersonalChatRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: personalChatRequest\nid: 63iEklkz\nfrom: sWS2qwO7\npayload: Lm88LpLu\nreceivedAt: 86\nto: O3C55yHp' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PersonalChatRequest'
        delete_file $TEMP_FILE

    #- 72 PersonalChatResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: personalChatResponse\nid: K2JaqenD\ncode: 45' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'PersonalChatResponse'
        delete_file $TEMP_FILE

    #- 73 RejectFriendsNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: Gn7a2NUp' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RejectFriendsNotif'
        delete_file $TEMP_FILE

    #- 74 RejectFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: rejectFriendsRequest\nid: n6a0rW8E\nfriendId: lWiLjq06' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RejectFriendsRequest'
        delete_file $TEMP_FILE

    #- 75 RejectFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: rejectFriendsResponse\nid: kpaXtwYZ\ncode: 11' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RejectFriendsResponse'
        delete_file $TEMP_FILE

    #- 76 RematchmakingNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 70' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RematchmakingNotif'
        delete_file $TEMP_FILE

    #- 77 RequestFriendsNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: aQ4WbwNm' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RequestFriendsNotif'
        delete_file $TEMP_FILE

    #- 78 RequestFriendsRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: requestFriendsRequest\nid: rH8eloJz\nfriendId: sFYetjEu' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RequestFriendsRequest'
        delete_file $TEMP_FILE

    #- 79 RequestFriendsResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: requestFriendsResponse\nid: KtRUaTz1\ncode: 78' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'RequestFriendsResponse'
        delete_file $TEMP_FILE

    #- 80 SendChannelChatRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: sendChannelChatRequest\nid: kkn9oiQl\nchannelSlug: ETdsmwzj\npayload: 05g7cO3Z' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SendChannelChatRequest'
        delete_file $TEMP_FILE

    #- 81 SendChannelChatResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: sendChannelChatResponse\nid: b6Ojlo6D\ncode: 76' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SendChannelChatResponse'
        delete_file $TEMP_FILE

    #- 82 SetReadyConsentNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: MNpP2qMr\nuserId: TQ1UpjfU' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetReadyConsentNotif'
        delete_file $TEMP_FILE

    #- 83 SetReadyConsentRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setReadyConsentRequest\nid: 6wJhy1jO\nmatchId: VkkUlS79' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetReadyConsentRequest'
        delete_file $TEMP_FILE

    #- 84 SetReadyConsentResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setReadyConsentResponse\nid: Z25Ia8uC\ncode: 60' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetReadyConsentResponse'
        delete_file $TEMP_FILE

    #- 85 SetSessionAttributeRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: eZFlLtEV\nkey: pDAEbA82\nnamespace: jy74lq0p\nvalue: DE5xRwh5' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetSessionAttributeRequest'
        delete_file $TEMP_FILE

    #- 86 SetSessionAttributeResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: 45ebpcM7\ncode: 2' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetSessionAttributeResponse'
        delete_file $TEMP_FILE

    #- 87 SetUserStatusRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setUserStatusRequest\nid: wIp9rRtn\nactivity: ScSs3UOp\navailability: 53' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetUserStatusRequest'
        delete_file $TEMP_FILE

    #- 88 SetUserStatusResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: setUserStatusResponse\nid: cCxdbume\ncode: 82' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SetUserStatusResponse'
        delete_file $TEMP_FILE

    #- 89 ShutdownNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: shutdownNotif\nmessage: YgOdEBWR' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'ShutdownNotif'
        delete_file $TEMP_FILE

    #- 90 SignalingP2PNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: QiW3KFfU\nmessage: 8icH4081' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SignalingP2PNotif'
        delete_file $TEMP_FILE

    #- 91 StartMatchmakingRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: startMatchmakingRequest\nid: gUDEcJyI\nextraAttributes: gRB1GyLf\ngameMode: Lg4RYuEb\npartyAttributes: {"vsPwOr0B":{}}\npriority: 25\ntempParty: V5iFvfwF' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'StartMatchmakingRequest'
        delete_file $TEMP_FILE

    #- 92 StartMatchmakingResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: startMatchmakingResponse\nid: TSmIEqoL\ncode: 19' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'StartMatchmakingResponse'
        delete_file $TEMP_FILE

    #- 93 SystemComponentsStatus
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: systemComponentsStatus\ncomponents: {"yLeUGmom":true}' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'SystemComponentsStatus'
        delete_file $TEMP_FILE

    #- 94 UnblockPlayerNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: XTZ0v8pq\nuserId: Lfc5SwGn' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UnblockPlayerNotif'
        delete_file $TEMP_FILE

    #- 95 UnblockPlayerRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: unblockPlayerRequest\nid: ReUULDX4\nnamespace: QUIbb5nh\nunblockedUserId: 68ZnyUtR' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UnblockPlayerRequest'
        delete_file $TEMP_FILE

    #- 96 UnblockPlayerResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: unblockPlayerResponse\nid: W9hNBSFT\ncode: 42\nnamespace: tFrOmjkF\nunblockedUserId: rFVA8t0x' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UnblockPlayerResponse'
        delete_file $TEMP_FILE

    #- 97 UnfriendNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: unfriendNotif\nfriendId: F34Xpt6Z' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UnfriendNotif'
        delete_file $TEMP_FILE

    #- 98 UnfriendRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: unfriendRequest\nid: 2a0nI2oo\nfriendId: lTTic0kr' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UnfriendRequest'
        delete_file $TEMP_FILE

    #- 99 UnfriendResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: unfriendResponse\nid: HCJK5sp0\ncode: 92' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UnfriendResponse'
        delete_file $TEMP_FILE

    #- 100 UserBannedNotification
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: userBannedNotification' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UserBannedNotification'
        delete_file $TEMP_FILE

    #- 101 UserMetricRequest
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: userMetricRequest\nid: aCvIq3aH' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UserMetricRequest'
        delete_file $TEMP_FILE

    #- 102 UserMetricResponse
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: userMetricResponse\nid: YIlewLRu\ncode: 94\nplayerCount: 67' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UserMetricResponse'
        delete_file $TEMP_FILE

    #- 103 UserStatusNotif
    java -jar ${JAR_PATH} lobbyWebsocket -m $'type: userStatusNotif\nactivity: Y83bGj0H\navailability: 90\nlastSeenAt: eeWXlIcR\nuserId: idqctDpy' -u \
        >$TEMP_FILE 2>&1
        update_status $? 'UserStatusNotif'
        delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT