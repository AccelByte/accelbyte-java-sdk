#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Meta:
# - random seed: 256
# - template file: cli_test_ws.j2

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..104"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

#- 2 AcceptFriendsNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: FtBxyZcD' -u \
    > test.out 2>&1
eval_tap $? 2 'AcceptFriendsNotif' test.out

#- 3 AcceptFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: acceptFriendsRequest\nid: Ju8vMf0I\nfriendId: XBpGlsQu' -u \
    > test.out 2>&1
eval_tap $? 3 'AcceptFriendsRequest' test.out

#- 4 AcceptFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: acceptFriendsResponse\nid: JkTrd8ID\ncode: 36' -u \
    > test.out 2>&1
eval_tap $? 4 'AcceptFriendsResponse' test.out

#- 5 BlockPlayerNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: cV2zXnTK\nuserId: jXY1bPqa' -u \
    > test.out 2>&1
eval_tap $? 5 'BlockPlayerNotif' test.out

#- 6 BlockPlayerRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: blockPlayerRequest\nid: 18EY84ek\nblockUserId: miBxx9Cs\nnamespace: ItqRzHU1' -u \
    > test.out 2>&1
eval_tap $? 6 'BlockPlayerRequest' test.out

#- 7 BlockPlayerResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: blockPlayerResponse\nid: aewc72kr\nblockUserId: oh570KQB\ncode: 95\nnamespace: Sha68n3Y' -u \
    > test.out 2>&1
eval_tap $? 7 'BlockPlayerResponse' test.out

#- 8 CancelFriendsNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: nozp1C2K' -u \
    > test.out 2>&1
eval_tap $? 8 'CancelFriendsNotif' test.out

#- 9 CancelFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: cancelFriendsRequest\nid: EUsxFb8C\nfriendId: mIQTuBdN' -u \
    > test.out 2>&1
eval_tap $? 9 'CancelFriendsRequest' test.out

#- 10 CancelFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: cancelFriendsResponse\nid: 17M7DJZa\ncode: 70' -u \
    > test.out 2>&1
eval_tap $? 10 'CancelFriendsResponse' test.out

#- 11 CancelMatchmakingRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: ygyoarOR\ngameMode: MSxECbZb\nisTempParty: False' -u \
    > test.out 2>&1
eval_tap $? 11 'CancelMatchmakingRequest' test.out

#- 12 CancelMatchmakingResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: NHSb8Rh3\ncode: 8' -u \
    > test.out 2>&1
eval_tap $? 12 'CancelMatchmakingResponse' test.out

#- 13 ChannelChatNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: kgs9qqJb\nfrom: nQsoBgiV\npayload: pP8Cm3yv\nsentAt: ASUoxdxx' -u \
    > test.out 2>&1
eval_tap $? 13 'ChannelChatNotif' test.out

#- 14 ClientResetRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: clientResetRequest\nnamespace: FqmAGTJ8\nuserId: IEdagEtp' -u \
    > test.out 2>&1
eval_tap $? 14 'ClientResetRequest' test.out

#- 15 ConnectNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: connectNotif\nlobbySessionId: 4w29KOu9' -u \
    > test.out 2>&1
eval_tap $? 15 'ConnectNotif' test.out

#- 16 DisconnectNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: c19R6XDq\nnamespace: WHkkP8np' -u \
    > test.out 2>&1
eval_tap $? 16 'DisconnectNotif' test.out

#- 17 DsNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: dsNotif\nalternateIps: [LEKMfjiX]\ncustomAttribute: 7jpkVZk3\ndeployment: IaQYEmqG\ngameVersion: odOEGt9g\nimageVersion: POj0c6i0\nip: JkvIas73\nisOK: True\nisOverrideGameVersion: False\nlastUpdate: YnFAJ3DK\nmatchId: 5T4Eogg0\nmessage: Y39UoYlp\nnamespace: v5bVAgts\npodName: DhUTDUsc\nport: 2\nports: {"QDjbTQuP":76}\nprotocol: z2PTRlky\nprovider: U89ZPOw6\nregion: zPFJ42cw\nsessionId: mzBBSMNc\nstatus: oAAOjKNj' -u \
    > test.out 2>&1
eval_tap $? 17 'DsNotif' test.out

#- 18 ErrorNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: errorNotif\nmessage: fcYHm093' -u \
    > test.out 2>&1
eval_tap $? 18 'ErrorNotif' test.out

#- 19 ExitAllChannel
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: exitAllChannel\nnamespace: aYgBU1sq\nuserId: jyK0XH45' -u \
    > test.out 2>&1
eval_tap $? 19 'ExitAllChannel' test.out

#- 20 FriendsStatusRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: friendsStatusRequest\nid: PaRSOFQB' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusRequest' test.out

#- 21 FriendsStatusResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: friendsStatusResponse\nid: dYiQS9i7\nactivity: [tu23REZ8]\navailability: [15]\ncode: 87\nfriendIds: [VX7LGOvD]\nlastSeenAt: [mV1C91pj]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: G9gpxL6y' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: 6LFE1YHo\nattributes: {"cTQdvln2":"LAuSQWEX"}\ncode: 74' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: 8hHtWvbN\nfriendId: 9m126ZWc' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: PiHUIvaC\ncode: 33\nfriendshipStatus: gUqslArF' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: v8kU9dBB\nkey: pdsJLhsV' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: Exrkxoot\ncode: 49\nvalue: 0B7WOfer' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: cZdpMci3' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: aI3uzLte\nchannelSlug: 7Ds7YSfE\ncode: 46' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: MbFAlt4h' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: 7HmOYiBA\ncode: 35\nuserIds: [5ltAOXml]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listOfFriendsRequest\nid: oTFpBIcu\nfriendId: G6eh1dTd' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listOfFriendsResponse\nid: nJ6Te9vD\ncode: 57\nfriendIds: [1dQY93OJ]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: 8ldz7Hu8' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: AD79kdWu' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: HyhhERoG\ncode: 26\nfriendIds: [vizU0q1p]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [gdrysMiz]\nmatchId: BGSRdP2l\nmessage: 7DNSZ8Aq\npartyMember: [0XiPLQXS]\nreadyDuration: 9\nstatus: 07ZddOGT' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: messageNotif\nid: HJHQKseE\nfrom: MlJjBwj9\npayload: dSXRDSvg\nsentAt: 41\nto: auw1xT7e\ntopic: MwSl9MLH' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 OfflineNotificationRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: offlineNotificationRequest\nid: 0NnTJ2ul' -u \
    > test.out 2>&1
eval_tap $? 40 'OfflineNotificationRequest' test.out

#- 41 OfflineNotificationResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: offlineNotificationResponse\nid: zBvwJaQa\ncode: 79' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationResponse' test.out

#- 42 OnlineFriends
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: onlineFriends\nid: llvA8RWS\ncode: 71\nonlineFriendIds: [pabUt7xk]' -u \
    > test.out 2>&1
eval_tap $? 42 'OnlineFriends' test.out

#- 43 PartyChatNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyChatNotif\nid: oWfJw2o8\nfrom: 6QxyWhfq\npayload: oWUqvPCZ\nreceivedAt: 66\nto: zT7NXmWD' -u \
    > test.out 2>&1
eval_tap $? 43 'PartyChatNotif' test.out

#- 44 PartyChatRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyChatRequest\nid: JR5lsNOl\nfrom: lXsuNIdQ\npayload: vkfwaSbn\nreceivedAt: 37\nto: uLCgToxu' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatRequest' test.out

#- 45 PartyChatResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyChatResponse\nid: TekJgvg6\ncode: 94' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatResponse' test.out

#- 46 PartyCreateRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyCreateRequest\nid: h5HIpH0D' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyCreateRequest' test.out

#- 47 PartyCreateResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyCreateResponse\nid: iplEk4vj\ncode: 42\ninvitationToken: 3LDp4yqD\ninvitees: t8QUZDpx\nleaderId: lHasinGc\nmembers: jrkmRMtt\npartyId: gjDSaIVB' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateResponse' test.out

#- 48 PartyDataUpdateNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"mft3Udg7":{}}\ninvitees: [p9PGmY2H]\nleader: 5kX4Msis\nmembers: [SX28nARx]\nnamespace: WRpv5ou5\npartyId: xtvd28OU\nupdatedAt: 10' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyDataUpdateNotif' test.out

#- 49 PartyGetInvitedNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: Ct8UJC5f\ninvitationToken: lNyj6HsT\npartyId: tX8P3lln' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyGetInvitedNotif' test.out

#- 50 PartyInfoRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyInfoRequest\nid: aaS9lqyy' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyInfoRequest' test.out

#- 51 PartyInfoResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyInfoResponse\nid: QZza8kNV\ncode: 12\ncustomAttributes: {"PcfkJIxf":{}}\ninvitationToken: bDxVMq7H\ninvitees: Jk0F89xA\nleaderId: c3YVfaEN\nmembers: trl0pTKZ\npartyId: TXqzHuBM' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoResponse' test.out

#- 52 PartyInviteNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: YQSA2jz1\ninviterId: ZOpdOjSy' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInviteNotif' test.out

#- 53 PartyInviteRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyInviteRequest\nid: Mf7RUyBH\nfriendId: MddB41Ju' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteRequest' test.out

#- 54 PartyInviteResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyInviteResponse\nid: j8IiRimR\ncode: 87' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteResponse' test.out

#- 55 PartyJoinNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyJoinNotif\nuserId: llHT6Dc4' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyJoinNotif' test.out

#- 56 PartyJoinRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyJoinRequest\nid: 0vFFA6gp\ninvitationToken: U7EW3x1d\npartyId: Cpm55gOe' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinRequest' test.out

#- 57 PartyJoinResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyJoinResponse\nid: QIqcJVKm\ncode: 33\ninvitationToken: BM1J1Ibu\ninvitees: TrrkbmuT\nleaderId: 1whOqmEn\nmembers: DXIWrBPl\npartyId: Say46mv7' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinResponse' test.out

#- 58 PartyKickNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyKickNotif\nleaderId: 1BAZAOjt\npartyId: FJ2vmTj7\nuserId: tT7TZHWD' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyKickNotif' test.out

#- 59 PartyKickRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyKickRequest\nid: dCkIsZoA\nmemberId: rWwPHcyF' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickRequest' test.out

#- 60 PartyKickResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyKickResponse\nid: dAtYciLI\ncode: 52' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickResponse' test.out

#- 61 PartyLeaveNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: gRwFRr0g\nuserId: wB9tz3vp' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyLeaveNotif' test.out

#- 62 PartyLeaveRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyLeaveRequest\nid: 99XVlV8r\nignoreUserRegistry: True' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveRequest' test.out

#- 63 PartyLeaveResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyLeaveResponse\nid: 6n0smip1\ncode: 61' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveResponse' test.out

#- 64 PartyPromoteLeaderRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: tw3L7cUd\nnewLeaderUserId: 9pqtv6Jf' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyPromoteLeaderRequest' test.out

#- 65 PartyPromoteLeaderResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: ZwcCVOXc\ncode: 83\ninvitationToken: Va80TmCw\ninvitees: tD2lAH01\nleaderId: o6NdcBIg\nmembers: zrDyWpFB\npartyId: YGmmBawM' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderResponse' test.out

#- 66 PartyRejectNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: yoKyNpdA\npartyId: asm8xwUf\nuserId: zOlQiZY4' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyRejectNotif' test.out

#- 67 PartyRejectRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyRejectRequest\nid: NbOQXJ7u\ninvitationToken: OTzNMvuq\npartyId: 2tNl4CX4' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectRequest' test.out

#- 68 PartyRejectResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: partyRejectResponse\nid: jiK4DEUJ\ncode: 68\npartyId: RVK3l9Eb' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectResponse' test.out

#- 69 PersonalChatHistoryRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: H8vS1sme\nfriendId: 0R1XRb0R' -u \
    > test.out 2>&1
eval_tap $? 69 'PersonalChatHistoryRequest' test.out

#- 70 PersonalChatHistoryResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: io4wcyhl\nchat: OlngrdTX\ncode: 56\nfriendId: zaPBtkZM' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryResponse' test.out

#- 71 PersonalChatNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: personalChatNotif\nid: QtcEmCEV\nfrom: oVS3rYp8\npayload: c75Ufeyp\nreceivedAt: 96\nto: jDNhzCL5' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatNotif' test.out

#- 72 PersonalChatRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: personalChatRequest\nid: 63iEklkz\nfrom: sWS2qwO7\npayload: Lm88LpLu\nreceivedAt: 86\nto: O3C55yHp' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatRequest' test.out

#- 73 PersonalChatResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: personalChatResponse\nid: K2JaqenD\ncode: 45' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatResponse' test.out

#- 74 RejectFriendsNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: Gn7a2NUp' -u \
    > test.out 2>&1
eval_tap $? 74 'RejectFriendsNotif' test.out

#- 75 RejectFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: rejectFriendsRequest\nid: n6a0rW8E\nfriendId: lWiLjq06' -u \
    > test.out 2>&1
eval_tap $? 75 'RejectFriendsRequest' test.out

#- 76 RejectFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: rejectFriendsResponse\nid: kpaXtwYZ\ncode: 11' -u \
    > test.out 2>&1
eval_tap $? 76 'RejectFriendsResponse' test.out

#- 77 RematchmakingNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 70' -u \
    > test.out 2>&1
eval_tap $? 77 'RematchmakingNotif' test.out

#- 78 RequestFriendsNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: aQ4WbwNm' -u \
    > test.out 2>&1
eval_tap $? 78 'RequestFriendsNotif' test.out

#- 79 RequestFriendsRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: requestFriendsRequest\nid: rH8eloJz\nfriendId: sFYetjEu' -u \
    > test.out 2>&1
eval_tap $? 79 'RequestFriendsRequest' test.out

#- 80 RequestFriendsResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: requestFriendsResponse\nid: KtRUaTz1\ncode: 78' -u \
    > test.out 2>&1
eval_tap $? 80 'RequestFriendsResponse' test.out

#- 81 SendChannelChatRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: sendChannelChatRequest\nid: kkn9oiQl\nchannelSlug: ETdsmwzj\npayload: 05g7cO3Z' -u \
    > test.out 2>&1
eval_tap $? 81 'SendChannelChatRequest' test.out

#- 82 SendChannelChatResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: sendChannelChatResponse\nid: b6Ojlo6D\ncode: 76' -u \
    > test.out 2>&1
eval_tap $? 82 'SendChannelChatResponse' test.out

#- 83 SetReadyConsentNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: MNpP2qMr\nuserId: TQ1UpjfU' -u \
    > test.out 2>&1
eval_tap $? 83 'SetReadyConsentNotif' test.out

#- 84 SetReadyConsentRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setReadyConsentRequest\nid: 6wJhy1jO\nmatchId: VkkUlS79' -u \
    > test.out 2>&1
eval_tap $? 84 'SetReadyConsentRequest' test.out

#- 85 SetReadyConsentResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setReadyConsentResponse\nid: Z25Ia8uC\ncode: 60' -u \
    > test.out 2>&1
eval_tap $? 85 'SetReadyConsentResponse' test.out

#- 86 SetSessionAttributeRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: eZFlLtEV\nkey: pDAEbA82\nnamespace: jy74lq0p\nvalue: DE5xRwh5' -u \
    > test.out 2>&1
eval_tap $? 86 'SetSessionAttributeRequest' test.out

#- 87 SetSessionAttributeResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: 45ebpcM7\ncode: 2' -u \
    > test.out 2>&1
eval_tap $? 87 'SetSessionAttributeResponse' test.out

#- 88 SetUserStatusRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setUserStatusRequest\nid: wIp9rRtn\nactivity: ScSs3UOp\navailability: 53' -u \
    > test.out 2>&1
eval_tap $? 88 'SetUserStatusRequest' test.out

#- 89 SetUserStatusResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: setUserStatusResponse\nid: cCxdbume\ncode: 82' -u \
    > test.out 2>&1
eval_tap $? 89 'SetUserStatusResponse' test.out

#- 90 ShutdownNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: shutdownNotif\nmessage: YgOdEBWR' -u \
    > test.out 2>&1
eval_tap $? 90 'ShutdownNotif' test.out

#- 91 SignalingP2PNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: QiW3KFfU\nmessage: 8icH4081' -u \
    > test.out 2>&1
eval_tap $? 91 'SignalingP2PNotif' test.out

#- 92 StartMatchmakingRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: startMatchmakingRequest\nid: gUDEcJyI\nextraAttributes: gRB1GyLf\ngameMode: Lg4RYuEb\npartyAttributes: {"vsPwOr0B":{}}\npriority: 25\ntempParty: V5iFvfwF' -u \
    > test.out 2>&1
eval_tap $? 92 'StartMatchmakingRequest' test.out

#- 93 StartMatchmakingResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: startMatchmakingResponse\nid: TSmIEqoL\ncode: 19' -u \
    > test.out 2>&1
eval_tap $? 93 'StartMatchmakingResponse' test.out

#- 94 SystemComponentsStatus
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: systemComponentsStatus\ncomponents: {"yLeUGmom":true}' -u \
    > test.out 2>&1
eval_tap $? 94 'SystemComponentsStatus' test.out

#- 95 UnblockPlayerNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: XTZ0v8pq\nuserId: Lfc5SwGn' -u \
    > test.out 2>&1
eval_tap $? 95 'UnblockPlayerNotif' test.out

#- 96 UnblockPlayerRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: unblockPlayerRequest\nid: ReUULDX4\nnamespace: QUIbb5nh\nunblockedUserId: 68ZnyUtR' -u \
    > test.out 2>&1
eval_tap $? 96 'UnblockPlayerRequest' test.out

#- 97 UnblockPlayerResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: unblockPlayerResponse\nid: W9hNBSFT\ncode: 42\nnamespace: tFrOmjkF\nunblockedUserId: rFVA8t0x' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerResponse' test.out

#- 98 UnfriendNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: unfriendNotif\nfriendId: F34Xpt6Z' -u \
    > test.out 2>&1
eval_tap $? 98 'UnfriendNotif' test.out

#- 99 UnfriendRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: unfriendRequest\nid: 2a0nI2oo\nfriendId: lTTic0kr' -u \
    > test.out 2>&1
eval_tap $? 99 'UnfriendRequest' test.out

#- 100 UnfriendResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: unfriendResponse\nid: HCJK5sp0\ncode: 92' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendResponse' test.out

#- 101 UserBannedNotification
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 101 'UserBannedNotification' test.out

#- 102 UserMetricRequest
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: userMetricRequest\nid: aCvIq3aH' -u \
    > test.out 2>&1
eval_tap $? 102 'UserMetricRequest' test.out

#- 103 UserMetricResponse
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: userMetricResponse\nid: YIlewLRu\ncode: 94\nplayerCount: 67' -u \
    > test.out 2>&1
eval_tap $? 103 'UserMetricResponse' test.out

#- 104 UserStatusNotif
java -jar ${CLI_JAR} lobbyWebsocket -m $'type: userStatusNotif\nactivity: Y83bGj0H\navailability: 90\nlastSeenAt: eeWXlIcR\nuserId: idqctDpy' -u \
    > test.out 2>&1
eval_tap $? 104 'UserStatusNotif' test.out


exit $EXIT_CODE