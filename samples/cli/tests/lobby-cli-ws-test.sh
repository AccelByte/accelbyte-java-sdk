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
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: gtMI5zEU' -u \
    > test.out 2>&1
eval_tap $? 2 'AcceptFriendsNotif' test.out

#- 3 AcceptFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsRequest\nid: 8dvc9Myu\nfriendId: rAjynihM' -u \
    > test.out 2>&1
eval_tap $? 3 'AcceptFriendsRequest' test.out

#- 4 AcceptFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsResponse\nid: gtFBVHGE\ncode: 20' -u \
    > test.out 2>&1
eval_tap $? 4 'AcceptFriendsResponse' test.out

#- 5 BlockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: fjfNfVf7\nuserId: MrRfnLwP' -u \
    > test.out 2>&1
eval_tap $? 5 'BlockPlayerNotif' test.out

#- 6 BlockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerRequest\nid: kHLhpO92\nblockUserId: X2tUlnbf\nnamespace: l6RQrT6n' -u \
    > test.out 2>&1
eval_tap $? 6 'BlockPlayerRequest' test.out

#- 7 BlockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerResponse\nid: snk7c5Vg\nblockUserId: nCkXhMwM\ncode: 76\nnamespace: wQwiph4n' -u \
    > test.out 2>&1
eval_tap $? 7 'BlockPlayerResponse' test.out

#- 8 CancelFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: JajOEdZe' -u \
    > test.out 2>&1
eval_tap $? 8 'CancelFriendsNotif' test.out

#- 9 CancelFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsRequest\nid: XKzlJf3i\nfriendId: UGySPafm' -u \
    > test.out 2>&1
eval_tap $? 9 'CancelFriendsRequest' test.out

#- 10 CancelFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsResponse\nid: jhoRqzgS\ncode: 63' -u \
    > test.out 2>&1
eval_tap $? 10 'CancelFriendsResponse' test.out

#- 11 CancelMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: bV6QqvFb\ngameMode: Fx0T4h2W\nisTempParty: True' -u \
    > test.out 2>&1
eval_tap $? 11 'CancelMatchmakingRequest' test.out

#- 12 CancelMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: nr5NEMni\ncode: 52' -u \
    > test.out 2>&1
eval_tap $? 12 'CancelMatchmakingResponse' test.out

#- 13 ChannelChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: TPKuvmrw\nfrom: IkUnS6Ae\npayload: Np4OOyAF\nsentAt: BFT4LHOq' -u \
    > test.out 2>&1
eval_tap $? 13 'ChannelChatNotif' test.out

#- 14 ClientResetRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: clientResetRequest\nnamespace: ZIOpDrI9\nuserId: zBcOrLFh' -u \
    > test.out 2>&1
eval_tap $? 14 'ClientResetRequest' test.out

#- 15 ConnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: connectNotif\nlobbySessionId: l86QW7H4' -u \
    > test.out 2>&1
eval_tap $? 15 'ConnectNotif' test.out

#- 16 DisconnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: NSxw11SB\nnamespace: GnqhaYZ4' -u \
    > test.out 2>&1
eval_tap $? 16 'DisconnectNotif' test.out

#- 17 DsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: dsNotif\nalternateIps: [qbnzMYer,eE1Xa9Ss,4nFC4OFV]\ncustomAttribute: LP5COts4\ndeployment: BmnZC2eO\ngameVersion: KyCug8QO\nimageVersion: 6Y6yIgAw\nip: lXtKMn8Q\nisOK: False\nisOverrideGameVersion: True\nlastUpdate: u2vq2Wy7\nmatchId: ICjalxsz\nmessage: rD3pa39c\nnamespace: Rybh8aTn\npodName: wtBeJmzr\nport: 59\nports: {"1chEd4bG":71,"QPP6bJU9":42,"iZfE68kj":67}\nprotocol: t2tLXV21\nprovider: T49jC8qs\nregion: NtdaTkWp\nsessionId: aGEmjuxk\nstatus: CzR3CHtF' -u \
    > test.out 2>&1
eval_tap $? 17 'DsNotif' test.out

#- 18 ErrorNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: errorNotif\nmessage: BivitOhN' -u \
    > test.out 2>&1
eval_tap $? 18 'ErrorNotif' test.out

#- 19 ExitAllChannel
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: exitAllChannel\nnamespace: 0V1MYKs6\nuserId: peN7evhr' -u \
    > test.out 2>&1
eval_tap $? 19 'ExitAllChannel' test.out

#- 20 FriendsStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusRequest\nid: mNWzyoXv' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusRequest' test.out

#- 21 FriendsStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: WSeh6u5V\nactivity: [v68cNUzr,1gY2OVVe,G2d2LLXx]\navailability: [30,97,48]\ncode: 53\nfriendIds: [RzXYdbPJ,WqcVGYBl,DhQa4OOE]\nlastSeenAt: [XNrWYTrJ,pvTATUfO,YELKQpDN]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: BaHbGHOW' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: xYl3VR5i\nattributes: {"vc4ncg2G":"z0VNeGNb","ahxiAbIp":"kQu85opk","ej9wyg4c":"zWQ0oZ4a"}\ncode: 69' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: tR7rVtfG\nfriendId: FpuYQSNJ' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: CBFEtkOx\ncode: 33\nfriendshipStatus: tC71GtEI' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: qn0zZRZL\nkey: YxCXUS4n' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: U3SKPold\ncode: 1\nvalue: OHzcOL3Q' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: RpahF91U' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: 5kgOR9bM\nchannelSlug: nDjHVQFS\ncode: 96' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: b36BNmKE' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: kzzNYx2C\ncode: 4\nuserIds: [jBjrh7XT,gceXx89I,YZGwOZ0x]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: uY9b1DUr\nfriendId: yLQIyqfr' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: SHMcFmwU\ncode: 84\nfriendIds: [CfIsCIqM,88XucVrk,IOC1dXaD]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: 4qr5qBg7' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: e4WJuBB5' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: CklpqRFi\ncode: 77\nfriendIds: [ylYZ3Knp,UQuL1KS3,rYPY19r4]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [pYLmzxlM,wp9LDQa5,GvryB1q1]\nmatchId: moGG42Np\nmessage: SEYz33Et\npartyMember: [PbiriyrM,Grm3ciCx,gzMwQTpJ]\nreadyDuration: 70\nstatus: ZU2EwAOr' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: GfH3TicW\nfrom: rMWAjuDj\npayload: p9BwUts3\nsentAt: 20\nto: SrhlYZJy\ntopic: nphDj4w4' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: hZFnhqhM' -u \
    > test.out 2>&1
eval_tap $? 40 'OfflineNotificationRequest' test.out

#- 41 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: MSz45AkH\ncode: 30' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationResponse' test.out

#- 42 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: H4aNJ5Hm\ncode: 22\nonlineFriendIds: [xhSbONle,7hfyvq9u,EP3OaNKs]' -u \
    > test.out 2>&1
eval_tap $? 42 'OnlineFriends' test.out

#- 43 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: 2G8zSvX5\nfrom: DeXaFXTq\npayload: 4RiV2KKc\nreceivedAt: 20\nto: v4QoxvlE' -u \
    > test.out 2>&1
eval_tap $? 43 'PartyChatNotif' test.out

#- 44 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: AZS3r6eL\nfrom: lN1QcLBS\npayload: Ma4qSHyW\nreceivedAt: 63\nto: eSk1S2Fx' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatRequest' test.out

#- 45 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: UFEwhrOh\ncode: 45' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatResponse' test.out

#- 46 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: 3w7daToC' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyCreateRequest' test.out

#- 47 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: PWREXhc6\ncode: 34\ninvitationToken: uaCRB5xK\ninvitees: fZtEelBA\nleaderId: EqWxDdaa\nmembers: 5a0g5hGS\npartyId: FgycHE3S' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateResponse' test.out

#- 48 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"3dqtslEo":{},"1vSIe2V3":{},"gMW6VmlY":{}}\ninvitees: [R5qGoWU6,uhwkWYky,Lrpuw3BQ]\nleader: R8wNxWpY\nmembers: [bLiHtxl1,r4SuLi3k,5c15N7qw]\nnamespace: 0Fl4RPK0\npartyId: 22FkQSiz\nupdatedAt: 12' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyDataUpdateNotif' test.out

#- 49 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: zmCe6GZS\ninvitationToken: Lr8v3JeQ\npartyId: O0S6QZUb' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyGetInvitedNotif' test.out

#- 50 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: oj2lio2j' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyInfoRequest' test.out

#- 51 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: OeUHR0nP\ncode: 36\ncustomAttributes: {"ixAjuHGm":{},"qBycctHE":{},"M1AABMl7":{}}\ninvitationToken: C9X746jf\ninvitees: eIrCPqKJ\nleaderId: XQhcpJ4P\nmembers: xcWLmt3V\npartyId: PCGt4u6z' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoResponse' test.out

#- 52 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: zAZhGyKW\ninviterId: G9J7iTDe' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInviteNotif' test.out

#- 53 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: TD4OScnB\nfriendId: mzjVZ7Cz' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteRequest' test.out

#- 54 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: GlcAnjEi\ncode: 62' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteResponse' test.out

#- 55 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: ezBBzskS' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyJoinNotif' test.out

#- 56 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: VrLy9u6n\ninvitationToken: AJZPq0kn\npartyId: iiCl8AlZ' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinRequest' test.out

#- 57 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: 2EXRmW4c\ncode: 87\ninvitationToken: bxHUzKle\ninvitees: gYIDEFaI\nleaderId: nvi0BohW\nmembers: znOmmDxd\npartyId: edJ9Ql3a' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinResponse' test.out

#- 58 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: zDMJm54T\npartyId: 64dyNWWK\nuserId: 6DbT0QeC' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyKickNotif' test.out

#- 59 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: AK39F9kx\nmemberId: ei6nAtxZ' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickRequest' test.out

#- 60 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: v8wlsiiZ\ncode: 58' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickResponse' test.out

#- 61 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: hSysBG0H\nuserId: bJJP7G05' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyLeaveNotif' test.out

#- 62 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: w1QpFN3w\nignoreUserRegistry: False' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveRequest' test.out

#- 63 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: eixZo0RM\ncode: 35' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveResponse' test.out

#- 64 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: ZUyms5d8\nnewLeaderUserId: NuHpyfkZ' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyPromoteLeaderRequest' test.out

#- 65 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: CuIihdPi\ncode: 86\ninvitationToken: Gfg1R46S\ninvitees: FAFYKWEz\nleaderId: oqnxo2vh\nmembers: gRXy29Ov\npartyId: Vb7WoZRv' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderResponse' test.out

#- 66 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: Je012gCU\npartyId: ex76NTsH\nuserId: lvt9s67k' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyRejectNotif' test.out

#- 67 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: TMH6MzEB\ninvitationToken: HXkh0GOo\npartyId: 1gqFehG5' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectRequest' test.out

#- 68 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: Zvfp9YEC\ncode: 80\npartyId: YdITWMjJ' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectResponse' test.out

#- 69 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: 90TxZ1zy\nfriendId: pTrR14J4' -u \
    > test.out 2>&1
eval_tap $? 69 'PersonalChatHistoryRequest' test.out

#- 70 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: iZ4mb253\nchat: nTL0Fusq\ncode: 17\nfriendId: dfe7vwXN' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryResponse' test.out

#- 71 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: CnzXWz6y\nfrom: F8jT91C9\npayload: g87p2VDr\nreceivedAt: 48\nto: 926Aqy98' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatNotif' test.out

#- 72 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: 66hHVjnw\nfrom: yX3choCW\npayload: ENW3VaOF\nreceivedAt: 58\nto: tSBMjGXf' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatRequest' test.out

#- 73 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: vIGNLICD\ncode: 65' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatResponse' test.out

#- 74 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: IPPcxeb8' -u \
    > test.out 2>&1
eval_tap $? 74 'RejectFriendsNotif' test.out

#- 75 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: 8F2dKHos\nfriendId: UkQXaHEo' -u \
    > test.out 2>&1
eval_tap $? 75 'RejectFriendsRequest' test.out

#- 76 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: 2BF9Vn73\ncode: 82' -u \
    > test.out 2>&1
eval_tap $? 76 'RejectFriendsResponse' test.out

#- 77 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 52' -u \
    > test.out 2>&1
eval_tap $? 77 'RematchmakingNotif' test.out

#- 78 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: EIzd3NX8' -u \
    > test.out 2>&1
eval_tap $? 78 'RequestFriendsNotif' test.out

#- 79 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: wysM13Xa\nfriendId: dWl0G4Q9' -u \
    > test.out 2>&1
eval_tap $? 79 'RequestFriendsRequest' test.out

#- 80 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: hucGIY4l\ncode: 42' -u \
    > test.out 2>&1
eval_tap $? 80 'RequestFriendsResponse' test.out

#- 81 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: cBxsQMaN\nchannelSlug: ZRFigf6G\npayload: PjiYLw6r' -u \
    > test.out 2>&1
eval_tap $? 81 'SendChannelChatRequest' test.out

#- 82 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: qbZ5JTaH\ncode: 32' -u \
    > test.out 2>&1
eval_tap $? 82 'SendChannelChatResponse' test.out

#- 83 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: LWqOb1xB\nuserId: rTnWCugD' -u \
    > test.out 2>&1
eval_tap $? 83 'SetReadyConsentNotif' test.out

#- 84 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: krbsmsj7\nmatchId: IJNbCzFg' -u \
    > test.out 2>&1
eval_tap $? 84 'SetReadyConsentRequest' test.out

#- 85 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: twlam3dW\ncode: 81' -u \
    > test.out 2>&1
eval_tap $? 85 'SetReadyConsentResponse' test.out

#- 86 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: MlkYBQh1\nkey: ZmiDbVgU\nnamespace: kgWnFtGl\nvalue: 2aaEnvH1' -u \
    > test.out 2>&1
eval_tap $? 86 'SetSessionAttributeRequest' test.out

#- 87 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: wqWbViBu\ncode: 1' -u \
    > test.out 2>&1
eval_tap $? 87 'SetSessionAttributeResponse' test.out

#- 88 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: oaIdFdmA\nactivity: mWS7YOqG\navailability: 36' -u \
    > test.out 2>&1
eval_tap $? 88 'SetUserStatusRequest' test.out

#- 89 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: X1hPQAhB\ncode: 44' -u \
    > test.out 2>&1
eval_tap $? 89 'SetUserStatusResponse' test.out

#- 90 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: DvAc9Uul' -u \
    > test.out 2>&1
eval_tap $? 90 'ShutdownNotif' test.out

#- 91 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: tIWHzGVI\nmessage: qe5i7yJQ' -u \
    > test.out 2>&1
eval_tap $? 91 'SignalingP2PNotif' test.out

#- 92 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: 3HbKCV1U\nextraAttributes: hRnYHquY\ngameMode: DK1MjjTH\npartyAttributes: {"6MEUx65u":{},"1x31oepU":{},"9zQR47d6":{}}\npriority: 93\ntempParty: EoADRpBZ' -u \
    > test.out 2>&1
eval_tap $? 92 'StartMatchmakingRequest' test.out

#- 93 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: PHXY12Sd\ncode: 86' -u \
    > test.out 2>&1
eval_tap $? 93 'StartMatchmakingResponse' test.out

#- 94 SystemComponentsStatus
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: systemComponentsStatus\ncomponents: {"bgW1tshL":false,"haq2gqzm":true,"axrxSe6Q":false}' -u \
    > test.out 2>&1
eval_tap $? 94 'SystemComponentsStatus' test.out

#- 95 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: GBu6f6PN\nuserId: 9vYA0n1v' -u \
    > test.out 2>&1
eval_tap $? 95 'UnblockPlayerNotif' test.out

#- 96 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: rvOXCTum\nnamespace: 3SdbivD2\nunblockedUserId: cFIzU77d' -u \
    > test.out 2>&1
eval_tap $? 96 'UnblockPlayerRequest' test.out

#- 97 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: vvf9Ohbo\ncode: 89\nnamespace: yWAubVTh\nunblockedUserId: hQ3O7Lsy' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerResponse' test.out

#- 98 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: tNYKZR12' -u \
    > test.out 2>&1
eval_tap $? 98 'UnfriendNotif' test.out

#- 99 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: GrWbRt3l\nfriendId: hOyt3n0n' -u \
    > test.out 2>&1
eval_tap $? 99 'UnfriendRequest' test.out

#- 100 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: pNUj0PRg\ncode: 59' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendResponse' test.out

#- 101 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 101 'UserBannedNotification' test.out

#- 102 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: Tv34zxNQ' -u \
    > test.out 2>&1
eval_tap $? 102 'UserMetricRequest' test.out

#- 103 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: F4OCK72d\ncode: 78\nplayerCount: 98' -u \
    > test.out 2>&1
eval_tap $? 103 'UserMetricResponse' test.out

#- 104 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: GameMIcr\navailability: 39\nlastSeenAt: 1KoNF4Ik\nuserId: uIrqynVf' -u \
    > test.out 2>&1
eval_tap $? 104 'UserStatusNotif' test.out


exit $EXIT_CODE