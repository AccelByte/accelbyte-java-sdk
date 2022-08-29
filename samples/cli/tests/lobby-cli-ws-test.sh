#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

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

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..104"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

#- 2 AcceptFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: FrheP3pZ' -u \
    > test.out 2>&1
eval_tap $? 2 'AcceptFriendsNotif' test.out

#- 3 AcceptFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsRequest\nid: 3ih8zKH3\nfriendId: eeTq4Yoo' -u \
    > test.out 2>&1
eval_tap $? 3 'AcceptFriendsRequest' test.out

#- 4 AcceptFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsResponse\nid: zwSZm5vT\ncode: 5' -u \
    > test.out 2>&1
eval_tap $? 4 'AcceptFriendsResponse' test.out

#- 5 BlockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: L9S30qnx\nuserId: 05AP7vJi' -u \
    > test.out 2>&1
eval_tap $? 5 'BlockPlayerNotif' test.out

#- 6 BlockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerRequest\nid: 4ukzucOc\nblockUserId: iEacji7Q\nnamespace: zR7yhc4g' -u \
    > test.out 2>&1
eval_tap $? 6 'BlockPlayerRequest' test.out

#- 7 BlockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerResponse\nid: kJUtiuFu\nblockUserId: pgE2AHnb\ncode: 84\nnamespace: kUQ5bJ80' -u \
    > test.out 2>&1
eval_tap $? 7 'BlockPlayerResponse' test.out

#- 8 CancelFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: NlGo7CGy' -u \
    > test.out 2>&1
eval_tap $? 8 'CancelFriendsNotif' test.out

#- 9 CancelFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsRequest\nid: aA05k9qz\nfriendId: YFISBb5j' -u \
    > test.out 2>&1
eval_tap $? 9 'CancelFriendsRequest' test.out

#- 10 CancelFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsResponse\nid: iVOBbaxi\ncode: 95' -u \
    > test.out 2>&1
eval_tap $? 10 'CancelFriendsResponse' test.out

#- 11 CancelMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: JCBVq3dL\ngameMode: xxJkbV64\nisTempParty: False' -u \
    > test.out 2>&1
eval_tap $? 11 'CancelMatchmakingRequest' test.out

#- 12 CancelMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: G5U6DW6Y\ncode: 84' -u \
    > test.out 2>&1
eval_tap $? 12 'CancelMatchmakingResponse' test.out

#- 13 ChannelChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: CBOjkBEN\nfrom: idkKeUNr\npayload: 4GX8w0ty\nsentAt: YQnXop9j' -u \
    > test.out 2>&1
eval_tap $? 13 'ChannelChatNotif' test.out

#- 14 ClientResetRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: clientResetRequest\nnamespace: kizwiLCi\nuserId: 0uBpbk2v' -u \
    > test.out 2>&1
eval_tap $? 14 'ClientResetRequest' test.out

#- 15 ConnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: connectNotif\nlobbySessionId: N2LgcgnG' -u \
    > test.out 2>&1
eval_tap $? 15 'ConnectNotif' test.out

#- 16 DisconnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: bLrosnnN\nnamespace: ab3cHqWf' -u \
    > test.out 2>&1
eval_tap $? 16 'DisconnectNotif' test.out

#- 17 DsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: dsNotif\nalternateIps: [BskfGfUT,qlnrq6f4,sCzGjlYC]\ncustomAttribute: YgAF4nG3\ndeployment: bDKVtS3a\ngameVersion: OcncLsMg\nimageVersion: BwHddxSR\nip: NPMGiOPU\nisOK: True\nisOverrideGameVersion: True\nlastUpdate: MwVOObjp\nmatchId: UpYEpaSR\nmessage: KFURkUZB\nnamespace: ycUNOYo9\npodName: tofZTCZq\nport: 1\nports: {"cBgDvzvS":64,"UxgR1WGH":78,"r8QhGhKP":40}\nprotocol: P1PZJ8If\nprovider: ylR9kqWM\nregion: Vl5S5qMx\nsessionId: vA84c047\nstatus: H5H3d4yq' -u \
    > test.out 2>&1
eval_tap $? 17 'DsNotif' test.out

#- 18 ErrorNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: errorNotif\nmessage: enILYgYD' -u \
    > test.out 2>&1
eval_tap $? 18 'ErrorNotif' test.out

#- 19 ExitAllChannel
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: exitAllChannel\nnamespace: DuY40gbw\nuserId: vAobhofo' -u \
    > test.out 2>&1
eval_tap $? 19 'ExitAllChannel' test.out

#- 20 FriendsStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusRequest\nid: nfwrmyNP' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusRequest' test.out

#- 21 FriendsStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: 3hAWStxO\nactivity: [LwbvOXIR,jzjsjGJV,3WSt9MtK]\navailability: [86,40,2]\ncode: 21\nfriendIds: [1VVoHfiF,TYVGPXAB,R7iPLSIi]\nlastSeenAt: [IVBKlwVf,XFpZCfS1,oAHcB3D9]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: VyuJHGlK' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: oxWiiFxt\nattributes: {"FoFxDq6D":"YGOO1WYI","UM6B4Ya9":"P3OQNdF0","mLC52KfU":"OadsH4ge"}\ncode: 83' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: N6xNYa9I\nfriendId: ULnRB66o' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: fEstzw39\ncode: 70\nfriendshipStatus: RmMyHYaD' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: EXD4EVto\nkey: ePmloySJ' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: 7PP7bsfq\ncode: 56\nvalue: NDs6Xenq' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: J7XjtNk8' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: fy5byJ4o\nchannelSlug: 04cor34y\ncode: 13' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: rcB8XNV3' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: Y7hNUxzu\ncode: 48\nuserIds: [TmXw3eP8,bCzvGss7,xtzjcTH4]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: yrgMUb34\nfriendId: pYHoavrO' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: p57Jb96f\ncode: 43\nfriendIds: [qujAOYpq,UWAvd7HA,PBxASsBX]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: l3dAKTLu' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: AFDKMkdx' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: 919Nqt7d\ncode: 92\nfriendIds: [9UPRlJl8,dnxEL4kX,sYfNUKZd]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [8r2kU9g6,u9tDtgsx,3IzxdPuC]\nmatchId: 1Y9M5DZ8\nmessage: sDaHbHnx\npartyMember: [tGZwOEX0,t6PAfpXH,5GEUE95O]\nreadyDuration: 26\nstatus: kurlVAjo' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: RG6c3kdL\nfrom: ge8Mwcbd\npayload: soFHilJd\nsentAt: 58\nto: WLKGscjw\ntopic: tfZG3loC' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: eC2KMNoP' -u \
    > test.out 2>&1
eval_tap $? 40 'OfflineNotificationRequest' test.out

#- 41 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: dXHb7mHl\ncode: 91' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationResponse' test.out

#- 42 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: qbP58kPC\ncode: 6\nonlineFriendIds: [fIJcIegG,tvmWNkNb,5SAhSP5Q]' -u \
    > test.out 2>&1
eval_tap $? 42 'OnlineFriends' test.out

#- 43 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: 8QKeWKJH\nfrom: CoyUMlYH\npayload: EGkYsvMJ\nreceivedAt: 6\nto: cSSOKkDW' -u \
    > test.out 2>&1
eval_tap $? 43 'PartyChatNotif' test.out

#- 44 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: cZu31jP7\nfrom: szENY8hi\npayload: Y95Fx6RY\nreceivedAt: 73\nto: v4XuLkOC' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatRequest' test.out

#- 45 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: gD6RzbhF\ncode: 43' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatResponse' test.out

#- 46 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: 5bw9KDF3' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyCreateRequest' test.out

#- 47 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: ekhtg9GP\ncode: 96\ninvitationToken: LPF5v42F\ninvitees: UVF8kgXa\nleaderId: xzkrO0OH\nmembers: JBL4Wd1n\npartyId: 7mHjgcUK' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateResponse' test.out

#- 48 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"6qGEGqIL":{},"GKymer0K":{},"cOabAuTm":{}}\ninvitees: [m4OnZ2Bh,Gfo3mwqH,QeA82xtv]\nleader: NPtedWnC\nmembers: [ooUW6gBH,hbA50YFA,R4KvLV01]\nnamespace: ItNeWc8f\npartyId: fotxFVCk\nupdatedAt: 90' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyDataUpdateNotif' test.out

#- 49 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: kpF6BLrj\ninvitationToken: q667Jra9\npartyId: qVvIEDUs' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyGetInvitedNotif' test.out

#- 50 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: Tqg9dKQW' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyInfoRequest' test.out

#- 51 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: kcyWQsim\ncode: 25\ncustomAttributes: {"AV4MoNZ5":{},"glcuiQ87":{},"R9hn3ug5":{}}\ninvitationToken: P76ye40r\ninvitees: aS3dRgXK\nleaderId: mkf433Nf\nmembers: GSpu5nex\npartyId: qDOcrHiy' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoResponse' test.out

#- 52 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: GqlFDBS0\ninviterId: eaSqLCRP' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInviteNotif' test.out

#- 53 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: 0iQ5iPLh\nfriendId: mxSEq5he' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteRequest' test.out

#- 54 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: K1GNcyg6\ncode: 31' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteResponse' test.out

#- 55 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: hg7DsCkO' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyJoinNotif' test.out

#- 56 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: a0PgfcT1\ninvitationToken: jP5aJHL0\npartyId: MV7Z1uRi' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinRequest' test.out

#- 57 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: 5VD62fhd\ncode: 41\ninvitationToken: dNSonvkJ\ninvitees: WuS75lXt\nleaderId: 46epcoUN\nmembers: ebR6U6bU\npartyId: 6DvPYKSG' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinResponse' test.out

#- 58 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: 5DX0IDnK\npartyId: LafbMVVU\nuserId: 2aHWi0RR' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyKickNotif' test.out

#- 59 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: V6lDPgUj\nmemberId: keBZL61I' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickRequest' test.out

#- 60 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: q9mkdNKx\ncode: 49' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickResponse' test.out

#- 61 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: 85dnDNdK\nuserId: sU74I588' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyLeaveNotif' test.out

#- 62 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: jDzFIJxo\nignoreUserRegistry: False' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveRequest' test.out

#- 63 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: dAmVEcg8\ncode: 81' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveResponse' test.out

#- 64 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: HOSJ4tyL\nnewLeaderUserId: VIJhh8CO' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyPromoteLeaderRequest' test.out

#- 65 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: hdNMrasn\ncode: 10\ninvitationToken: c8obldll\ninvitees: U1oxV9Xm\nleaderId: TzI7sMGu\nmembers: mDUu4zRB\npartyId: aJbo6cCk' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderResponse' test.out

#- 66 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: 8Mqem8vo\npartyId: TfK7JD39\nuserId: r9qYs0TU' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyRejectNotif' test.out

#- 67 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: iUDVcaGk\ninvitationToken: JkNPnH57\npartyId: KjfvBlnF' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectRequest' test.out

#- 68 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: HMBQmbw4\ncode: 54\npartyId: 4c4byMbk' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectResponse' test.out

#- 69 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: yKFQtToR\nfriendId: n36qJQvi' -u \
    > test.out 2>&1
eval_tap $? 69 'PersonalChatHistoryRequest' test.out

#- 70 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: amOxzT7u\nchat: Q8e6zRew\ncode: 96\nfriendId: 3W8almPx' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryResponse' test.out

#- 71 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: c42sRvbJ\nfrom: iCmIiPSf\npayload: kdUHAcoR\nreceivedAt: 36\nto: IcG8Sxhj' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatNotif' test.out

#- 72 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: AUFNXrdm\nfrom: 7qwLPbHJ\npayload: KMUPikWX\nreceivedAt: 0\nto: Rnq1M6H0' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatRequest' test.out

#- 73 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: 3QGlKgOf\ncode: 0' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatResponse' test.out

#- 74 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: NrSaCVGn' -u \
    > test.out 2>&1
eval_tap $? 74 'RejectFriendsNotif' test.out

#- 75 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: d3goCru3\nfriendId: aBGkkChM' -u \
    > test.out 2>&1
eval_tap $? 75 'RejectFriendsRequest' test.out

#- 76 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: fKxVk3Xc\ncode: 1' -u \
    > test.out 2>&1
eval_tap $? 76 'RejectFriendsResponse' test.out

#- 77 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 38' -u \
    > test.out 2>&1
eval_tap $? 77 'RematchmakingNotif' test.out

#- 78 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: xRUjaWMS' -u \
    > test.out 2>&1
eval_tap $? 78 'RequestFriendsNotif' test.out

#- 79 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: 1FaQMH7V\nfriendId: WtQEnqgg' -u \
    > test.out 2>&1
eval_tap $? 79 'RequestFriendsRequest' test.out

#- 80 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: F9w5Pe8s\ncode: 80' -u \
    > test.out 2>&1
eval_tap $? 80 'RequestFriendsResponse' test.out

#- 81 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: T7IMKOXP\nchannelSlug: D4XdjemI\npayload: 8VQoFRl1' -u \
    > test.out 2>&1
eval_tap $? 81 'SendChannelChatRequest' test.out

#- 82 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: 4YQmYgpk\ncode: 4' -u \
    > test.out 2>&1
eval_tap $? 82 'SendChannelChatResponse' test.out

#- 83 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: 2DPks56h\nuserId: mynZRKWM' -u \
    > test.out 2>&1
eval_tap $? 83 'SetReadyConsentNotif' test.out

#- 84 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: Kq2ofgIZ\nmatchId: lF1mCcZz' -u \
    > test.out 2>&1
eval_tap $? 84 'SetReadyConsentRequest' test.out

#- 85 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: a3ISCswN\ncode: 63' -u \
    > test.out 2>&1
eval_tap $? 85 'SetReadyConsentResponse' test.out

#- 86 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: Tfk53IJz\nkey: oqsD4Yod\nnamespace: BJ0y5Gcm\nvalue: XefkRz6j' -u \
    > test.out 2>&1
eval_tap $? 86 'SetSessionAttributeRequest' test.out

#- 87 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: YQmlBf9T\ncode: 87' -u \
    > test.out 2>&1
eval_tap $? 87 'SetSessionAttributeResponse' test.out

#- 88 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: gk2ZEmJY\nactivity: n5VFVpfg\navailability: 64' -u \
    > test.out 2>&1
eval_tap $? 88 'SetUserStatusRequest' test.out

#- 89 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: XsDiwQVo\ncode: 89' -u \
    > test.out 2>&1
eval_tap $? 89 'SetUserStatusResponse' test.out

#- 90 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: vZYtEkza' -u \
    > test.out 2>&1
eval_tap $? 90 'ShutdownNotif' test.out

#- 91 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: SxuEsvmq\nmessage: 6qKGFmWd' -u \
    > test.out 2>&1
eval_tap $? 91 'SignalingP2PNotif' test.out

#- 92 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: 9WdCERMs\nextraAttributes: BOcjEZKB\ngameMode: h3mI0xsh\npartyAttributes: {"cOtOiIH4":{},"jckRpkEc":{},"KsPwHS89":{}}\npriority: 32\ntempParty: 4iS5YQLR' -u \
    > test.out 2>&1
eval_tap $? 92 'StartMatchmakingRequest' test.out

#- 93 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: x6yMp3ib\ncode: 4' -u \
    > test.out 2>&1
eval_tap $? 93 'StartMatchmakingResponse' test.out

#- 94 SystemComponentsStatus
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: systemComponentsStatus\ncomponents: {"i8Aaw4KQ":true,"FvFbQSlS":false,"K2pYpmat":false}' -u \
    > test.out 2>&1
eval_tap $? 94 'SystemComponentsStatus' test.out

#- 95 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: 2uQBcLQ4\nuserId: ihBn4TOw' -u \
    > test.out 2>&1
eval_tap $? 95 'UnblockPlayerNotif' test.out

#- 96 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: ag868JQe\nnamespace: mmFfL65u\nunblockedUserId: myPWV8Hf' -u \
    > test.out 2>&1
eval_tap $? 96 'UnblockPlayerRequest' test.out

#- 97 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: KbR0QRFa\ncode: 1\nnamespace: wp1XtAgM\nunblockedUserId: j7DRefce' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerResponse' test.out

#- 98 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: 4VG8qEiD' -u \
    > test.out 2>&1
eval_tap $? 98 'UnfriendNotif' test.out

#- 99 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: qnUwFKc0\nfriendId: rjx4idAp' -u \
    > test.out 2>&1
eval_tap $? 99 'UnfriendRequest' test.out

#- 100 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: OabZ3Jo3\ncode: 24' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendResponse' test.out

#- 101 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 101 'UserBannedNotification' test.out

#- 102 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: d8wfcS98' -u \
    > test.out 2>&1
eval_tap $? 102 'UserMetricRequest' test.out

#- 103 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: 3RqzFP3C\ncode: 90\nplayerCount: 34' -u \
    > test.out 2>&1
eval_tap $? 103 'UserMetricResponse' test.out

#- 104 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: A7KPLU0W\navailability: 50\nlastSeenAt: 0zMzn0of\nuserId: IiWi3kTu' -u \
    > test.out 2>&1
eval_tap $? 104 'UserStatusNotif' test.out


exit $EXIT_CODE