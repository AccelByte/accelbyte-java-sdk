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
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: SpHt0P7MIIR7CkyF\nfrom: 6C7duuyZ0GhDogqr\npayload: hBRd8lDR6qVNPRZY\nsentAt: dFLIAjGGJddVCvu9' -u \
    > test.out 2>&1
eval_tap $? 13 'ChannelChatNotif' test.out

#- 14 ClientResetRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: clientResetRequest\nnamespace: vx5KQ7KYnIuMBvaO\nuserId: 35llzQRaT5kPxUfo' -u \
    > test.out 2>&1
eval_tap $? 14 'ClientResetRequest' test.out

#- 15 ConnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: connectNotif\nlobbySessionId: fvnnSuB0y5WUlrMd' -u \
    > test.out 2>&1
eval_tap $? 15 'ConnectNotif' test.out

#- 16 DisconnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: I4sNveabntBSxTeI\nnamespace: v53HGCiljvjKoyD6' -u \
    > test.out 2>&1
eval_tap $? 16 'DisconnectNotif' test.out

#- 17 DsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: dsNotif\nalternateIps: [SCwGrncqmLtjQHAf,8TgoNm03VLisV6zw,Puo3td6TC6I3lMjG]\ncustomAttribute: SWN2laRlxfcjHfYa\ndeployment: kUCTqGkE7wcWfDsl\ngameVersion: pJSqGAXQ0yYoNRKd\nimageVersion: 3IL5TAQ6iiPlSC2u\nip: E4o5Vwdo3fePqIJA\nisOK: False\nisOverrideGameVersion: True\nlastUpdate: Sqb8RwNmn9HrNQy4\nmatchId: uZAAiE0mit9RGCCH\nmessage: YzUOcEdscKHPEqgA\nnamespace: 8yu7Vk6Jt4Ymos9J\npodName: cdos4fYcTVU6RBt0\nport: 52\nports: {"GZ5dAgqxpBFmaLox":30,"dalwSyliWMNW5NyL":41,"qtlB2jJCSQT279ZZ":86}\nprotocol: bQ6Q9lNmqRBaAkLn\nprovider: vxkT1X68cmDc3fxU\nregion: 8MyKrQpM4hkkK6KK\nsessionId: XNB3Gv0IqmF51Tkh\nstatus: jYnaq6foWvXa3bMr' -u \
    > test.out 2>&1
eval_tap $? 17 'DsNotif' test.out

#- 18 ErrorNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: errorNotif\nmessage: XsDr6kILsSSyDdmy' -u \
    > test.out 2>&1
eval_tap $? 18 'ErrorNotif' test.out

#- 19 ExitAllChannel
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: exitAllChannel\nnamespace: kmoPYgc2L4jk4Lo0\nuserId: LSP0pf4IxjUkl535' -u \
    > test.out 2>&1
eval_tap $? 19 'ExitAllChannel' test.out

#- 20 FriendsStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusRequest\nid: X3ateEKDpADz1x3p' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusRequest' test.out

#- 21 FriendsStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: U6YE3p4lSck0ZHn5\nactivity: [oD3Qgb3boLQQ1MzH,7Qm8bwbmXgdAPh1E,ThG96gAFKK2WDgCc]\navailability: [49,69,43]\ncode: 36\nfriendIds: [ONZm3EeERmDnyeFo,F7VSZ6pf3vneSD2T,b3g7mSQUhAEtrmjq]\nlastSeenAt: [GI39YBHqaTHeKtW1,8iGeUlc9d9sogWa2,4CKNS0GqVvUfHQvs]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: HXNUNe4mhgo5QB65' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: cekdqCt81P1ktfIo\nattributes: {"lSAiYnNjkfZrQvGg":"bLdLsFzHkBMr1yrO","MlNFSrUEirnjX9fD":"mIbeZxzfTcyiuATu","s9hsfpFDcSDG8aMV":"GLiBNrDjqoxcwgGL"}\ncode: 32' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: LxoRDFuuuySj29a9\nfriendId: vmv9gsR5cJcHm3SZ' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: CmBUqg2SCnqntX9y\ncode: 77\nfriendshipStatus: FM3FIoVk8T3GpAnk' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: 1aZSWMiVi10sG6vx\nkey: kfUcmqRRbceJ5i0E' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: nLRfxeCSz9WEi8Kl\ncode: 9\nvalue: loeH0JT1yduat2vQ' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: R3biBfsu4jmsRE2w' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: 4XlbGL8QOxtjzm8y\nchannelSlug: 1yEkLgh3tIYt4SqY\ncode: 95' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: 2wNhmwoYZyI4EFZK' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: KLCa3xreNDUWehwH\ncode: 56\nuserIds: [3q31A806DJgas4b6,z3LNUj7fdgLA84Z8,YYk6QEgJjBbEDoNf]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: yabWAgIUXiI07A68\nfriendId: 3n0hEoRCAcf80zfF' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: DNxtXgeO3FgkXhjD\ncode: 8\nfriendIds: [gpwxcfMy9XzjjI5Y,bsKoADkzJEN2VHzi,h3bit0VWn3CO39PX]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: zaQY3snn2ZkP7cFd' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: P43e5dC9XIBudfZg' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: 23YvYmmDg7VYPXIu\ncode: 35\nfriendIds: [aKwwrAP2aMlu7Wtj,CtoYetOO847g8Oud,OfjnCuHZ3c46IjGa]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [vUYTZBRujIUE1Tq5,jyAZvkRCMNFIurjh,2imdb4rbkXj0ZwsV]\nmatchId: C0gL97ZVJSPqJiwv\nmessage: 1qlYB1RSKs6gQxC3\npartyMember: [Gb7S0o4zGYY7KQI1,AeFgPqaOkvo1aolB,4lkKB4EYOkQ1jMD3]\nreadyDuration: 4\nstatus: OziYRFOn0jJLHC9L' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: 9Zuhytm5UDrT6QXC\nfrom: xhvNXTwGBCtohLtl\npayload: s5SPBbRPZTF6oQAX\nsentAt: 97\nto: dIIlhS1fSiM9331m\ntopic: 7Ta1PsKc50Kv6ecn' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: EevcAx2K2zkRenmP' -u \
    > test.out 2>&1
eval_tap $? 40 'OfflineNotificationRequest' test.out

#- 41 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: nGBt4P7WnbdSJtjX\ncode: 19' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationResponse' test.out

#- 42 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: ZshZyZl5x4bRXBHU\ncode: 16\nonlineFriendIds: [TrDzZSKscfOcYu3d,pCROYqUiGKXVFCmp,o6sPwVOEDSJsEK5Q]' -u \
    > test.out 2>&1
eval_tap $? 42 'OnlineFriends' test.out

#- 43 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: Yck0upMzUYnb76tF\nfrom: pNhlI2iS5EpGhhvX\npayload: kEORV3bu1bNCtX7W\nreceivedAt: 45\nto: 0V6Do5sYadCCFrHH' -u \
    > test.out 2>&1
eval_tap $? 43 'PartyChatNotif' test.out

#- 44 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: Marv8mnfHK8CCmE2\nfrom: C3DpZxkrQDXuNFvi\npayload: lPnsbD3SGEdlwuUc\nreceivedAt: 4\nto: 1mX2tJoARtdbBe7u' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatRequest' test.out

#- 45 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: CjgyJlXe36mgWjLf\ncode: 6' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatResponse' test.out

#- 46 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: Fmteue9nzJ6fH24T' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyCreateRequest' test.out

#- 47 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: 05tVg8JqU0jZpjvs\ncode: 83\ninvitationToken: ugAOS7u8RiWyerCS\ninvitees: a8SRgwsAj1ik1jgl\nleaderId: aDXTvKCWwNTAhd2w\nmembers: rS0uPdjhdinpng5B\npartyId: Ly8wbhMssAHjapIk' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateResponse' test.out

#- 48 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"Y9Rf4wP57dBZNR88":{},"YbCtmKy8M9zVrjfG":{},"XZnqAQUoY1GjlIIk":{}}\ninvitees: [0iKoTTS1j02o7JjT,XAQN0qdskdQV0TqI,8EFnmDbxIxi4YKlO]\nleader: Nk2Q5Y4Jvaizwiil\nmembers: [atuUjjt9lIMGql5E,lEa9EIIlGcHB3CfR,3ncDlwi3v3MFFJ1K]\nnamespace: esKoELCpobBEG8X6\npartyId: 45xpdXpai0rYaT5h\nupdatedAt: 83' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyDataUpdateNotif' test.out

#- 49 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: iPX6ues1Hhhkg1yL\ninvitationToken: VbLFzHEP8cM4NTwr\npartyId: 0KHaAsmTej52WKi6' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyGetInvitedNotif' test.out

#- 50 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: tArAURt9plCSVq8P' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyInfoRequest' test.out

#- 51 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: IPkhSgORcz5S5Bvm\ncode: 7\ncustomAttributes: {"7UkBeIXuqDuAXI66":{},"bQ71w0deoV9Lx5RD":{},"A1l2XcrciYNEzvSZ":{}}\ninvitationToken: gBLxh4ijFnE3Tam6\ninvitees: 9qSZ7PC6f6QkmZXE\nleaderId: lW9YfRSse6AAz3S4\nmembers: czz0QKFlAVmVLu4A\npartyId: Oec0z8eBeeoip68J' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoResponse' test.out

#- 52 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: 1nsv4W2OJhtafxMS\ninviterId: JlHeb34sZKHcl5LL' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInviteNotif' test.out

#- 53 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: BFpX8lNtFEJ7tnkY\nfriendId: LOexL4fZvWtND2tc' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteRequest' test.out

#- 54 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: Mca5afj12K2IzrBv\ncode: 52' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteResponse' test.out

#- 55 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: vWm4udE0OXudXgNn' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyJoinNotif' test.out

#- 56 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: e8kJATwlc6esUp6S\ninvitationToken: w1I98jeZQ7hfxnhL\npartyId: d3Knaknoed9DHhLO' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinRequest' test.out

#- 57 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: VJnNnN7kAa7j0riF\ncode: 33\ninvitationToken: c5HTHQIoVsGo7dwV\ninvitees: 9DBqFKHQkETJyTlU\nleaderId: rwDTnoujQD4IEiH9\nmembers: Z5qXn3aoRtlqOECo\npartyId: hViHA5CzgFSy8X1A' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinResponse' test.out

#- 58 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: 3PrIfapq5AAeMe4L\npartyId: 3mDWORBVXTIIJM9X\nuserId: sYIIZxiXNMR9BgaW' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyKickNotif' test.out

#- 59 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: cFX3SUBhyoTsMWPA\nmemberId: xUMkawaGpAyrIwMi' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickRequest' test.out

#- 60 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: qwgK1Np5nodqpLm7\ncode: 10' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickResponse' test.out

#- 61 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: FhJBNXzAFdO0Khqf\nuserId: 6kiTdSGv2LFjAKY7' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyLeaveNotif' test.out

#- 62 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: CbgsWqFWZX7kPBom\nignoreUserRegistry: False' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveRequest' test.out

#- 63 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: YT7DROCjtuzFMbAG\ncode: 66' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveResponse' test.out

#- 64 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: 9YI89hmguB8FOTjM\nnewLeaderUserId: Lo4b9rIzqYkEpsty' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyPromoteLeaderRequest' test.out

#- 65 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: UQPLG59e0k5ZtX6w\ncode: 98\ninvitationToken: K7PpUlcIW32iK7MG\ninvitees: t1ixY5rA1WoVeJIe\nleaderId: PF8ZrQzP4zvtdxdb\nmembers: ZUpd6FJtHJ1pyVwy\npartyId: KQLY6FEO65Rb3z7C' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderResponse' test.out

#- 66 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: YLM8IlsHqffnrfsG\npartyId: lfPaZKBwa3Ddb60u\nuserId: fPpzwj1QGIFmlVf4' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyRejectNotif' test.out

#- 67 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: jvapseE9LN9bvhOr\ninvitationToken: HflIOd6X3viLvtEk\npartyId: 4mTIpUA9gxo8SV38' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectRequest' test.out

#- 68 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: TOg54vCE48L5oLF6\ncode: 28\npartyId: M4lNa4JUMSHNgqRq' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectResponse' test.out

#- 69 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: fo95HgXqKhTPkwfL\nfriendId: CV7usamANkZlOX9S' -u \
    > test.out 2>&1
eval_tap $? 69 'PersonalChatHistoryRequest' test.out

#- 70 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: 9dD1kOmvrAejcq2L\nchat: M9uSybRzWek2gZvR\ncode: 36\nfriendId: Xzt6bSc6bWvgpVyW' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryResponse' test.out

#- 71 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: jBOxrZDyvpcLYOWA\nfrom: gkQuaS7RBx3vim02\npayload: 8NjxOnaEok4nOOCz\nreceivedAt: 11\nto: aBcAXXKlhvyH8paO' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatNotif' test.out

#- 72 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: 7fH0XrKEDpEY8Vno\nfrom: JtxqMPpcVfRwNj54\npayload: cGAjci0V3tBf2jnH\nreceivedAt: 67\nto: WCqQpQ2FbKPFMycM' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatRequest' test.out

#- 73 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: Z2jxLRX3z46OCaGB\ncode: 91' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatResponse' test.out

#- 74 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: eMfPlNos4yBRjrER' -u \
    > test.out 2>&1
eval_tap $? 74 'RejectFriendsNotif' test.out

#- 75 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: 6QCyY6vSkVFWdsbY\nfriendId: HEonAZR8GmEu0q1p' -u \
    > test.out 2>&1
eval_tap $? 75 'RejectFriendsRequest' test.out

#- 76 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: hxOdcuDXSxSc3aZP\ncode: 41' -u \
    > test.out 2>&1
eval_tap $? 76 'RejectFriendsResponse' test.out

#- 77 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 98' -u \
    > test.out 2>&1
eval_tap $? 77 'RematchmakingNotif' test.out

#- 78 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: vwv7K8Asvt1j1Rx5' -u \
    > test.out 2>&1
eval_tap $? 78 'RequestFriendsNotif' test.out

#- 79 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: DAF8KDsBZOuYQJ03\nfriendId: 9hesNWy2NvZ85DDK' -u \
    > test.out 2>&1
eval_tap $? 79 'RequestFriendsRequest' test.out

#- 80 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: eHpATHccee9GXhKc\ncode: 57' -u \
    > test.out 2>&1
eval_tap $? 80 'RequestFriendsResponse' test.out

#- 81 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: LfYalUlfwEQKjU7e\nchannelSlug: jmSEwdrkEnnqKzFs\npayload: HGebSVu0LQ40kepE' -u \
    > test.out 2>&1
eval_tap $? 81 'SendChannelChatRequest' test.out

#- 82 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: zohZyjMQAg5mPYhr\ncode: 1' -u \
    > test.out 2>&1
eval_tap $? 82 'SendChannelChatResponse' test.out

#- 83 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: LTyU8OhgfY9JQYGF\nuserId: 4bYXEcENx9xZlAch' -u \
    > test.out 2>&1
eval_tap $? 83 'SetReadyConsentNotif' test.out

#- 84 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: ob44lONDDwMvgI0H\nmatchId: lyPR7wZNiVsF6xG2' -u \
    > test.out 2>&1
eval_tap $? 84 'SetReadyConsentRequest' test.out

#- 85 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: eGelYF5wWaDhukU4\ncode: 26' -u \
    > test.out 2>&1
eval_tap $? 85 'SetReadyConsentResponse' test.out

#- 86 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: khGG4vZFTYnPkmSu\nkey: 4PWam1jxR7SETWjt\nnamespace: eoc8fgvZDDhoO05o\nvalue: KqymxLD1Lcvw6T6m' -u \
    > test.out 2>&1
eval_tap $? 86 'SetSessionAttributeRequest' test.out

#- 87 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: EiwxxElpMYSWIeVz\ncode: 24' -u \
    > test.out 2>&1
eval_tap $? 87 'SetSessionAttributeResponse' test.out

#- 88 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: kIf5weqZ18MH57l2\nactivity: m7z9noowmlTIKVow\navailability: 16' -u \
    > test.out 2>&1
eval_tap $? 88 'SetUserStatusRequest' test.out

#- 89 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: z9F1BxNNgnke4akn\ncode: 39' -u \
    > test.out 2>&1
eval_tap $? 89 'SetUserStatusResponse' test.out

#- 90 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: cw7wu9TmXfJWBPrx' -u \
    > test.out 2>&1
eval_tap $? 90 'ShutdownNotif' test.out

#- 91 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: 9Ns8eLzYEvwSWTaL\nmessage: QjctvrK2jhsYpKPl' -u \
    > test.out 2>&1
eval_tap $? 91 'SignalingP2PNotif' test.out

#- 92 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: cWw7Rry0KK5rgAGO\nextraAttributes: Xn77AtYoFzLAATPY\ngameMode: 8P8P3cfoivvQxeve\npartyAttributes: {"0dW8rX2MVUGKSZ4G":{},"cLkt4pK32sJxlZcC":{},"TpTdRtCHvuk6B6XT":{}}\npriority: 26\ntempParty: O2m9vqjhbeK2qN8g' -u \
    > test.out 2>&1
eval_tap $? 92 'StartMatchmakingRequest' test.out

#- 93 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: x2PyYDo5R3hLiD5s\ncode: 97' -u \
    > test.out 2>&1
eval_tap $? 93 'StartMatchmakingResponse' test.out

#- 94 SystemComponentsStatus
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: systemComponentsStatus\ncomponents: {"f5y1JsxJNGmyt0SQ":true,"blS7Nz81GRazPAAN":false,"AWc9x1aMjgGim51T":true}' -u \
    > test.out 2>&1
eval_tap $? 94 'SystemComponentsStatus' test.out

#- 95 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: 07XIZRZ7tZdIs0xf\nuserId: 4czdt7zqmSKxOEQl' -u \
    > test.out 2>&1
eval_tap $? 95 'UnblockPlayerNotif' test.out

#- 96 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: Vcx6GqsBq8vdhWVn\nnamespace: uYLgpZehK0G2nmyu\nunblockedUserId: ViB9kRTcSQdTnNYG' -u \
    > test.out 2>&1
eval_tap $? 96 'UnblockPlayerRequest' test.out

#- 97 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: I9FmYel0kOw72o8Z\ncode: 8\nnamespace: kgk0jS6rDWUwfhKv\nunblockedUserId: rf2AaH4yCWrHSppn' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerResponse' test.out

#- 98 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: IZkNnTn3rzH5NvAt' -u \
    > test.out 2>&1
eval_tap $? 98 'UnfriendNotif' test.out

#- 99 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: bmu8ePWlQMVDXEHe\nfriendId: cvNedgS1fUfKmihD' -u \
    > test.out 2>&1
eval_tap $? 99 'UnfriendRequest' test.out

#- 100 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: MsQgb64ELbzDMwyo\ncode: 17' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendResponse' test.out

#- 101 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 101 'UserBannedNotification' test.out

#- 102 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: 4nIRysQdbufXjYnS' -u \
    > test.out 2>&1
eval_tap $? 102 'UserMetricRequest' test.out

#- 103 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: TKWjmv67nuHCXWfw\ncode: 29\nplayerCount: 27' -u \
    > test.out 2>&1
eval_tap $? 103 'UserMetricResponse' test.out

#- 104 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: lGVE9sJ4NpUtKp6M\navailability: 34\nlastSeenAt: I6nEwnZhsjwJeGwa\nuserId: PSDMZz95OYKiqaZD' -u \
    > test.out 2>&1
eval_tap $? 104 'UserStatusNotif' test.out


exit $EXIT_CODE