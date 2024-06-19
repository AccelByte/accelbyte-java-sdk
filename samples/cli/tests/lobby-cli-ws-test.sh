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
echo "1..106"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

#- 2 AcceptFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: EAxcVpFrttufHIRd' -u \
    > test.out 2>&1
eval_tap $? 2 'AcceptFriendsNotif' test.out

#- 3 AcceptFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsRequest\nid: W2ktQG0h5JAav5kR\nfriendId: H9UzVRiXbqlAw7r6' -u \
    > test.out 2>&1
eval_tap $? 3 'AcceptFriendsRequest' test.out

#- 4 AcceptFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsResponse\nid: 4n8mzZ0m8SAMTwE6\ncode: 0' -u \
    > test.out 2>&1
eval_tap $? 4 'AcceptFriendsResponse' test.out

#- 5 BlockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: I56IaRDBXxyaNoMR\nuserId: 6hkspInrAip6lyzS' -u \
    > test.out 2>&1
eval_tap $? 5 'BlockPlayerNotif' test.out

#- 6 BlockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerRequest\nid: 4CUkNmKJfh5pUkHO\nblockUserId: xwElFHHdgs21Jub7\nnamespace: DpoMF78NY4YkHs1c' -u \
    > test.out 2>&1
eval_tap $? 6 'BlockPlayerRequest' test.out

#- 7 BlockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerResponse\nid: hRTcPiSuL0Sly6XM\nblockUserId: nz1JSDgY1TXp38zs\ncode: 58\nnamespace: 4OI18mAQLnzjMf8G' -u \
    > test.out 2>&1
eval_tap $? 7 'BlockPlayerResponse' test.out

#- 8 CancelFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: Z2WBZqxYG3aREAu2' -u \
    > test.out 2>&1
eval_tap $? 8 'CancelFriendsNotif' test.out

#- 9 CancelFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsRequest\nid: pKxR8dl0zRVW4EZG\nfriendId: D6QVKNCWP75TB0i7' -u \
    > test.out 2>&1
eval_tap $? 9 'CancelFriendsRequest' test.out

#- 10 CancelFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsResponse\nid: Z4U68su8XfqlqNiT\ncode: 25' -u \
    > test.out 2>&1
eval_tap $? 10 'CancelFriendsResponse' test.out

#- 11 CancelMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: MecdKi5r6QEa1ysL\ngameMode: vB6SdAdIhUDrwoZ5\nisTempParty: True' -u \
    > test.out 2>&1
eval_tap $? 11 'CancelMatchmakingRequest' test.out

#- 12 CancelMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: l3rGN9A3sNm84hdd\ncode: 53' -u \
    > test.out 2>&1
eval_tap $? 12 'CancelMatchmakingResponse' test.out

#- 13 ChannelChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: SpHt0P7MIIR7CkyF\nfrom: 6C7duuyZ0GhDogqr\npayload: hBRd8lDR6qVNPRZY\nsentAt: 1972-11-20T00:00:00Z' -u \
    > test.out 2>&1
eval_tap $? 13 'ChannelChatNotif' test.out

#- 14 ClientResetRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: clientResetRequest\nnamespace: FLIAjGGJddVCvu9v\nuserId: x5KQ7KYnIuMBvaO3' -u \
    > test.out 2>&1
eval_tap $? 14 'ClientResetRequest' test.out

#- 15 ConnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: connectNotif\nlobbySessionID: 5llzQRaT5kPxUfof' -u \
    > test.out 2>&1
eval_tap $? 15 'ConnectNotif' test.out

#- 16 DisconnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: vnnSuB0y5WUlrMdI\nnamespace: 4sNveabntBSxTeIv' -u \
    > test.out 2>&1
eval_tap $? 16 'DisconnectNotif' test.out

#- 17 DsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: dsNotif\nalternateIps: [53HGCiljvjKoyD6S,CwGrncqmLtjQHAf8,TgoNm03VLisV6zwP]\ncustomAttribute: uo3td6TC6I3lMjGS\ndeployment: WN2laRlxfcjHfYak\ngameVersion: UCTqGkE7wcWfDslp\nimageVersion: JSqGAXQ0yYoNRKd3\nip: IL5TAQ6iiPlSC2uE\nisOK: False\nisOverrideGameVersion: False\nlastUpdate: TD1ZBm3MqHcUmLZZ\nmatchId: bSqb8RwNmn9HrNQy\nmessage: 4uZAAiE0mit9RGCC\nnamespace: HYzUOcEdscKHPEqg\npodName: A8yu7Vk6Jt4Ymos9\nport: 74\nports: {"5T7quIOvBMcaYmvC":22,"zYoMcHyCUEXlAvxJ":79,"ozr6wfNPX2bOItRM":43}\nprotocol: u0M3VHh2EI8JlDbP\nprovider: WbQ6Q9lNmqRBaAkL\nregion: nvxkT1X68cmDc3fx\nsessionId: U8MyKrQpM4hkkK6K\nstatus: KXNB3Gv0IqmF51Tk' -u \
    > test.out 2>&1
eval_tap $? 17 'DsNotif' test.out

#- 18 ErrorNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: errorNotif\nmessage: hjYnaq6foWvXa3bM' -u \
    > test.out 2>&1
eval_tap $? 18 'ErrorNotif' test.out

#- 19 ExitAllChannel
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: exitAllChannel\nnamespace: rXsDr6kILsSSyDdm\nuserId: ykmoPYgc2L4jk4Lo' -u \
    > test.out 2>&1
eval_tap $? 19 'ExitAllChannel' test.out

#- 20 FriendsStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusRequest\nid: 0LSP0pf4IxjUkl53' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusRequest' test.out

#- 21 FriendsStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: G6bFYReVHQipcCx9\nactivity: [5X3ateEKDpADz1x3,poD3Qgb3boLQQ1Mz,H7Qm8bwbmXgdAPh1]\navailability: [EThG96gAFKK2WDgC,cxvONZm3EeERmDny,eFoF7VSZ6pf3vneS]\ncode: 59\nfriendIds: [VPHbn4Xxtu7LQREN,jEEztx1WsYSiZqan,0nSBJroav91GXlvP]\nlastSeenAt: [1996-12-28T00:00:00Z,1982-08-31T00:00:00Z,1985-10-29T00:00:00Z]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: L7vIYhGGSyEW4ZJJ' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: BNrDjqoxcwgGLXpU\nattributes: {"42d3PBddN8S48l9l":"yNApflxqMrj3oZk0","3QXcKMDYDDxHSZjt":"qXyJ58f7Gc26SaiG","VkydwYWQG26yUZNm":"TBcvrbYCwZtxFHyP"}\ncode: 77' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: IP6rOvDz9KOsb392\nfriendId: L4pp2ncYAHdNzDme' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: E8HoRS1X2PFAAMwz\ncode: 21\nfriendshipStatus: oRDFuuuySj29a9LJ' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: HPxB1UskYs4Yw20D\nkey: OqOBSC2DKHRuPMMW' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: UcmqRRbceJ5i0EeD\ncode: 69\nvalue: xOgBnhhqElIaDml4' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: 8wdNFLTm5T50x9WT' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: QAk4mqrxzTtuLl4X\nchannelSlug: 0GfH2rtOa4EXsXzO\ncode: 63' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: lbGL8QOxtjzm8y2w' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: 4aOMh5eC3IHeHSKL\ncode: 80\nuserIds: [Ca3xreNDUWehwH3q,31A806DJgas4b6z3,LNUj7fdgLA84Z8YY]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: 0hEoRCAcf80zfFya\nfriendId: k6QEgJjBbEDoNf3n' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: bit0VWn3CO39PXDN\ncode: 2\nfriendIds: [JrYq6hRkloqxM3gp,wxcfMy9XzjjI5Ybs,KoADkzJEN2VHzih3]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: xtXgeO3FgkXhjDza' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: QY3snn2ZkP7cFdP4' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: TtFWbotQyXJRcQWs\ncode: 1\nfriendIds: [e5dC9XIBudfZgrbH,DIDm4hMzF4Txoden,SrUTvfqU0bfoMm5c]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [mqPNs92epxk0i8Vx,sZNereSvf9699mCE,HThUJkETAsSp7gh4]\nmatchId: TeUTkOkAYfJB8AT9\nmessage: t4Tv207Y2QD3oD5f\npartyMember: [LCr3OOlXVv8ZGF7u,YnGzpipNDigNJma1,MbqqZtfNWql4nmwA]\nreadyDuration: 11\nstatus: KB4EYOkQ1jMD3cym' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: 0KOww3HICQLfl7MU\nfrom: 8xIfkOVW2grREOLx\npayload: BG7qtPu64yAtURKL\nsentAt: 1993-12-07T00:00:00Z\nto: kb738HGS6rDgMdII\ntopic: lhS1fSiM9331m7Ta' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 MessageSessionNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageSessionNotif\nid: cAx2K2zkRenmPZnG\nfrom: 1PsKc50Kv6ecnEev\npayload: Bt4P7WnbdSJtjX7Z\nsentAt: 1980-02-23T00:00:00Z\nto: hZyZl5x4bRXBHUTr\ntopic: DzZSKscfOcYu3dpC' -u \
    > test.out 2>&1
eval_tap $? 40 'MessageSessionNotif' test.out

#- 41 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: ROYqUiGKXVFCmpo6' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationRequest' test.out

#- 42 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: aKt2ujQSa3Zdb65U\ncode: 38' -u \
    > test.out 2>&1
eval_tap $? 42 'OfflineNotificationResponse' test.out

#- 43 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: my0Zp6iIaTIKUkmk\ncode: 24\nonlineFriendIds: [k9QM0NBMA9ORxpzw,LR2AK6eXUGPJsw1f,iP80G9Pclxcft2ul]' -u \
    > test.out 2>&1
eval_tap $? 43 'OnlineFriends' test.out

#- 44 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: uGKHhMRWLVd3DlhL\nfrom: IJzPyrVEiOG4Ucqs\npayload: uIpomM8sm1MiaI1m\nreceivedAt: 1996-06-06T00:00:00Z\nto: ugBp3HBvepnDCjgy' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatNotif' test.out

#- 45 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: ue9nzJ6fH24T805t\nfrom: JlXe36mgWjLfFmte\npayload: Vg8JqU0jZpjvsugA\nreceivedAt: 1991-05-04T00:00:00Z\nto: S7u8RiWyerCSa8SR' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatRequest' test.out

#- 46 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: ZjdrrIxsB0NRsB1f\ncode: 13' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyChatResponse' test.out

#- 47 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: PqqRRulpqpymDkQh' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateRequest' test.out

#- 48 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: djhdinpng5BLy8wb\ncode: 40\ninvitationToken: hMssAHjapIkY9Rf4\ninvitees: wP57dBZNR88YbCtm\nleaderId: Ky8M9zVrjfGXZnqA\nmembers: QUoY1GjlIIk0iKoT\npartyId: TS1j02o7JjTXAQN0' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyCreateResponse' test.out

#- 49 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"qdskdQV0TqI8EFnm":{},"DbxIxi4YKlONk2Q5":{},"Y4JvaizwiilatuUj":{}}\ninvitees: [jt9lIMGql5ElEa9E,IIlGcHB3CfR3ncDl,wi3v3MFFJ1KesKoE]\nleader: LCpobBEG8X645xpd\nmembers: [Xpai0rYaT5hOPjaf,3H0tYighU0VUfcYH,JbBfAKSiPW3VgsZX]\nnamespace: iR1DJ7HVWqMkNSaw\npartyId: QUWDFJvJBWic7UkB\nupdatedAt: 1973-12-09T00:00:00Z' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyDataUpdateNotif' test.out

#- 50 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: IXuqDuAXI66bQ71w\ninvitationToken: 0deoV9Lx5RDA1l2X\npartyId: crciYNEzvSZIPkhS' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyGetInvitedNotif' test.out

#- 51 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: gORcz5S5BvmgBLxh' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoRequest' test.out

#- 52 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: FlAVmVLu4AOec0z8\ncode: 76\ncustomAttributes: {"ijFnE3Tam69qSZ7P":{},"C6f6QkmZXElW9YfR":{},"Sse6AAz3S4czz0QK":{}}\ninvitationToken: eBeeoip68J1nsv4W\ninvitees: 2OJhtafxMSJlHeb3\nleaderId: 4sZKHcl5LLLOexL4\nmembers: fZvWtND2tcBFpX8l\npartyId: NtFEJ7tnkY6Mca5a' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInfoResponse' test.out

#- 53 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: fj12K2IzrBvvWm4u\ninviterId: dE0OXudXgNne8kJA' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteNotif' test.out

#- 54 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: jeZQ7hfxnhLd3Kna\nfriendId: Twlc6esUp6Sw1I98' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteRequest' test.out

#- 55 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: WP3glU6muswVJnNn\ncode: 21' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyInviteResponse' test.out

#- 56 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: N7kAa7j0riFc5HTH' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinNotif' test.out

#- 57 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: QIoVsGo7dwV9DBqF\ninvitationToken: KHQkETJyTlUrwDTn\npartyId: oujQD4IEiH9Z5qXn' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinRequest' test.out

#- 58 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: aoRtlqOECohViHA5\ncode: 8\ninvitationToken: CzgFSy8X1A3PrIfa\ninvitees: pq5AAeMe4L3mDWOR\nleaderId: BVXTIIJM9XsYIIZx\nmembers: iXNMR9BgaWcFX3SU\npartyId: BhyoTsMWPAxUMkaw' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyJoinResponse' test.out

#- 59 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: aGpAyrIwMif3BOdk\npartyId: ocVTd4BxqGWV6mTJ\nuserId: 0sQs6XNbjvqhnUVL' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickNotif' test.out

#- 60 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: Wu8olKdxL6ozRmDD\nmemberId: 0jJvlfV5OemPYdYT' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickRequest' test.out

#- 61 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: DROCjtuzFMbAG9YI\ncode: 94' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyKickResponse' test.out

#- 62 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: 89hmguB8FOTjMLo4\nuserId: b9rIzqYkEpstyVTB' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveNotif' test.out

#- 63 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: crM8rG0rH0zcswwV\nignoreUserRegistry: False' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveRequest' test.out

#- 64 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: MK6MbGIVIu8vvwLc\ncode: 32' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyLeaveResponse' test.out

#- 65 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: 7KY3uVoJXTIMtpgk\nnewLeaderUserId: ieDyF97lGdMiHKxb' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderRequest' test.out

#- 66 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: 6FJtHJ1pyVwyKQLY\ncode: 100\ninvitationToken: 6FEO65Rb3z7CYLM8\ninvitees: IlsHqffnrfsGlfPa\nleaderId: ZKBwa3Ddb60ufPpz\nmembers: wj1QGIFmlVf4jvap\npartyId: seE9LN9bvhOrHflI' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyPromoteLeaderResponse' test.out

#- 67 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: Od6X3viLvtEk4mTI\npartyId: pUA9gxo8SV38nEho\nuserId: XmM2W7l6jHMA2rG3' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectNotif' test.out

#- 68 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: nakopAywelu01nry\ninvitationToken: EJ0NqoTow0qiOiC4\npartyId: j0iktm0ZPLkLOsp0' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectRequest' test.out

#- 69 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: ybRzWek2gZvRrvr0\ncode: 77\npartyId: n9d9lvccKMLhrTrc' -u \
    > test.out 2>&1
eval_tap $? 69 'PartyRejectResponse' test.out

#- 70 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: oFzAyBME74HUtipU\nfriendId: BE2ItBS3KtKZWe8a' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryRequest' test.out

#- 71 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: hjbngJOUn18G5Mlf\nchat: WYhWV1qx8CzPML52\ncode: 11\nfriendId: OnaEok4nOOCzfsfl' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatHistoryResponse' test.out

#- 72 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: SwgAIkgzh4pTU0Am\nfrom: DTk8aG40NlncceIZ\npayload: 4DZhl0bQxFJ3sWCq\nreceivedAt: 1992-02-26T00:00:00Z\nto: pQ2FbKPFMycMSQ4q' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatNotif' test.out

#- 73 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: u2s6w3VifnKqmTSo\nfrom: fAacR0LgB5BUXvjc\npayload: GH1XEfY6QAYn6WQ5\nreceivedAt: 1994-08-10T00:00:00Z\nto: 6vSkVFWdsbYuVEGV' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatRequest' test.out

#- 74 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: uDXSxSc3aZPV87pn\ncode: 49' -u \
    > test.out 2>&1
eval_tap $? 74 'PersonalChatResponse' test.out

#- 75 RefreshTokenRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenRequest\nid: a08gxefTYKhuxaEc\ntoken: 7M4P7UckSC6ePeN8' -u \
    > test.out 2>&1
eval_tap $? 75 'RefreshTokenRequest' test.out

#- 76 RefreshTokenResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenResponse\nid: DsBZOuYQJ03BAHZ7\ncode: 17' -u \
    > test.out 2>&1
eval_tap $? 76 'RefreshTokenResponse' test.out

#- 77 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: c53q7akMpcmnnx6R' -u \
    > test.out 2>&1
eval_tap $? 77 'RejectFriendsNotif' test.out

#- 78 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: bN15zfQSfQrtfF3T\nfriendId: VBrop9v7aZK3h65h' -u \
    > test.out 2>&1
eval_tap $? 78 'RejectFriendsRequest' test.out

#- 79 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: Vu0LQ40kepEaC4df\ncode: 88' -u \
    > test.out 2>&1
eval_tap $? 79 'RejectFriendsResponse' test.out

#- 80 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 18' -u \
    > test.out 2>&1
eval_tap $? 80 'RematchmakingNotif' test.out

#- 81 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: jMQAg5mPYhrLTyU8' -u \
    > test.out 2>&1
eval_tap $? 81 'RequestFriendsNotif' test.out

#- 82 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: cENx9xZlAchob44l\nfriendId: OhgfY9JQYGF4bYXE' -u \
    > test.out 2>&1
eval_tap $? 82 'RequestFriendsRequest' test.out

#- 83 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: cYp7FUjfIGaffofl\ncode: 84' -u \
    > test.out 2>&1
eval_tap $? 83 'RequestFriendsResponse' test.out

#- 84 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: F5wWaDhukU4khGG4\nchannelSlug: EIByYqeKN0meGelY\npayload: vZFTYnPkmSu4PWam' -u \
    > test.out 2>&1
eval_tap $? 84 'SendChannelChatRequest' test.out

#- 85 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: jxR7SETWjteoc8fg\ncode: 82' -u \
    > test.out 2>&1
eval_tap $? 85 'SendChannelChatResponse' test.out

#- 86 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: vZDDhoO05oKqymxL\nuserId: D1Lcvw6T6mZEiwxx' -u \
    > test.out 2>&1
eval_tap $? 86 'SetReadyConsentNotif' test.out

#- 87 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: ElpMYSWIeVzm7z9n\nmatchId: oowmlTIKVowi0RY2' -u \
    > test.out 2>&1
eval_tap $? 87 'SetReadyConsentRequest' test.out

#- 88 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: eqZ18MH57l2Zsrh9\ncode: 97' -u \
    > test.out 2>&1
eval_tap $? 88 'SetReadyConsentResponse' test.out

#- 89 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: 0ETtYmGukz3Mnlrj\nkey: cHp6B8Vj7rXFgDnD\nnamespace: kdZ9bpjb1tdA3Qhj\nvalue: CMW64f4XhIjSoTB2' -u \
    > test.out 2>&1
eval_tap $? 89 'SetSessionAttributeRequest' test.out

#- 90 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: AtYoFzLAATPY8P8P\ncode: 80' -u \
    > test.out 2>&1
eval_tap $? 90 'SetSessionAttributeResponse' test.out

#- 91 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: oHw2hyd12uSE7BEv\nactivity: 3cfoivvQxevecWw7\navailability: 90' -u \
    > test.out 2>&1
eval_tap $? 91 'SetUserStatusRequest' test.out

#- 92 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: 2MVUGKSZ4GcLkt4p\ncode: 1' -u \
    > test.out 2>&1
eval_tap $? 92 'SetUserStatusResponse' test.out

#- 93 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: K32sJxlZcCTpTdRt' -u \
    > test.out 2>&1
eval_tap $? 93 'ShutdownNotif' test.out

#- 94 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: CHvuk6B6XTmSLyn5\nmessage: 0sigBVZxiKdV57Gv' -u \
    > test.out 2>&1
eval_tap $? 94 'SignalingP2PNotif' test.out

#- 95 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: Nz81GRazPAANjfBo\nextraAttributes: Ryd9UuL02Le8HSCs\ngameMode: lsDd4M1F5qRIblS7\npartyAttributes: {"ldFOyqA2clJ5gEOa":{},"CgM6Yn6RugbNEIpG":{},"BFUjOn5mM7k8nbLz":{}}\npriority: 43\ntempParty: 6GqsBq8vdhWVnuYL' -u \
    > test.out 2>&1
eval_tap $? 95 'StartMatchmakingRequest' test.out

#- 96 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: IVXtoWAXhMlW4tLq\ncode: 12' -u \
    > test.out 2>&1
eval_tap $? 96 'StartMatchmakingResponse' test.out

#- 97 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: X7OICf5oD1e6oI9F\nuserId: mYel0kOw72o8Zkgk' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerNotif' test.out

#- 98 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: 0jS6rDWUwfhKvrf2\nnamespace: AaH4yCWrHSppnIZk\nunblockedUserId: NnTn3rzH5NvAtcvN' -u \
    > test.out 2>&1
eval_tap $? 98 'UnblockPlayerRequest' test.out

#- 99 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: IPSE1XXPzySa0sZo\ncode: 9\nnamespace: FS6xCOWMpyh9pMsQ\nunblockedUserId: gb64ELbzDMwyo4nI' -u \
    > test.out 2>&1
eval_tap $? 99 'UnblockPlayerResponse' test.out

#- 100 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: RysQdbufXjYnSoIF' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendNotif' test.out

#- 101 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: VE9sJ4NpUtKp6M9I\nfriendId: eouC2m38kXrDZWlG' -u \
    > test.out 2>&1
eval_tap $? 101 'UnfriendRequest' test.out

#- 102 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: AeLtzcPJ3jtDYBo4\ncode: 27' -u \
    > test.out 2>&1
eval_tap $? 102 'UnfriendResponse' test.out

#- 103 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 103 'UserBannedNotification' test.out

#- 104 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: FUTH7CGfKSyxgRR1' -u \
    > test.out 2>&1
eval_tap $? 104 'UserMetricRequest' test.out

#- 105 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: e5rruJVfLGea0Ztl\ncode: 61\nplayerCount: 52' -u \
    > test.out 2>&1
eval_tap $? 105 'UserMetricResponse' test.out

#- 106 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: ACC1RgBfoNrHlFi2\navailability: 34\nlastSeenAt: 1971-10-20T00:00:00Z\nuserId: XsAuGsZaSHevO0TQ' -u \
    > test.out 2>&1
eval_tap $? 106 'UserStatusNotif' test.out


exit $EXIT_CODE