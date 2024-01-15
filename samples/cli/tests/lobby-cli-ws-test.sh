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
echo "1..105"

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
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: w5D2L7vIYhGGSyEW\nactivity: [oD3Qgb3boLQQ1MzH,7Qm8bwbmXgdAPh1E,ThG96gAFKK2WDgCc]\navailability: [xvONZm3EeERmDnye,FoF7VSZ6pf3vneSD,2Tb3g7mSQUhAEtrm]\ncode: 20\nfriendIds: [EEztx1WsYSiZqan0,nSBJroav91GXlvPG,6bFYReVHQipcCx9Z]\nlastSeenAt: [4ZJJ42d3PBddN8S4,8l9lyNApflxqMrj3,oZk03QXcKMDYDDxH]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: SZjtqXyJ58f7Gc26' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: a9LJE8HoRS1X2PFA\nattributes: {"SaiGVkydwYWQG26y":"UZNmTBcvrbYCwZtx","FHyPLtI8ilbyDPUI":"j88cekdqCt81P1kt","fIovmv9gsR5cJcHm":"3SZLxoRDFuuuySj2"}\ncode: 56' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: w20DOqOBSC2DKHRu\nfriendId: AMwzHPxB1UskYs4Y' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: 0EeDxOgBnhhqElIa\ncode: 85\nfriendshipStatus: vxkfUcmqRRbceJ5i' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: Dml48wdNFLTm5T50\nkey: x9WT0GfH2rtOa4EX' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: 2w1yEkLgh3tIYt4S\ncode: 39\nvalue: qYUTLDx9gIiDandp' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: GT2t24aOMh5eC3IH' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: x40NLRc6m8heKnWh\nchannelSlug: eHSKLCa3xreNDUWe\ncode: 15' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: zfe2NubeoKFeIaFQ' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: Z8YYk6QEgJjBbEDo\ncode: 58\nuserIds: [Nf3n0hEoRCAcf80z,fFyabWAgIUXiI07A,68eaqC2J9jyEW6GL]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: 1dQBHO86IlBhnetU\nfriendId: bc0NaKDUL3sa13lk' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: hyaKwwrAP2aMlu7W\ncode: 85\nfriendIds: [RwTqUXlTDBzOuYsa,ZA2yyd4mbqoOfADM,MAXFaY9eKa699bRV]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: tjCtoYetOO847g8O' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: udOfjnCuHZ3c46Ij' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: 7gh4TeUTkOkAYfJB\ncode: 66\nfriendIds: [cQWsmqPNs92epxk0,i8VxsZNereSvf969,9mCEHThUJkETAsSp]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [8AT9t4Tv207Y2QD3,oD5fLCr3OOlXVv8Z,GF7uYnGzpipNDigN]\nmatchId: Jma1MbqqZtfNWql4\nmessage: nmwAft4gqkNNlWkD\npartyMember: [9eOziYRFOn0jJLHC,9LxhvNXTwGBCtohL,tl9Zuhytm5UDrT6Q]\nreadyDuration: 96\nstatus: Cs5SPBbRPZTF6oQA' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: GJPN4eXbJE5Vs2Gc\nfrom: XVG7tnsZg5QgXjvy\npayload: yomQoIXimBJehyxl\nsentAt: 81\nto: PZnGBt4P7WnbdSJt\ntopic: jX7ZshZyZl5x4bRX' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: BHUTrDzZSKscfOcY' -u \
    > test.out 2>&1
eval_tap $? 40 'OfflineNotificationRequest' test.out

#- 41 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: N9LFkYW5DQyj4bj5\ncode: 41' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationResponse' test.out

#- 42 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: mpo6sPwVOEDSJsEK\ncode: 89\nonlineFriendIds: [5QpNhlI2iS5EpGhh,vXYck0upMzUYnb76,tFkEORV3bu1bNCtX]' -u \
    > test.out 2>&1
eval_tap $? 42 'OnlineFriends' test.out

#- 43 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: rHHC3DpZxkrQDXuN\nfrom: 7W40V6Do5sYadCCF\npayload: FviMarv8mnfHK8CC\nreceivedAt: 25\nto: 3DlhLuIpomM8sm1M' -u \
    > test.out 2>&1
eval_tap $? 43 'PartyChatNotif' test.out

#- 44 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: e7udsMrok0WvGYYn\nfrom: iaI1mX2tJoARtdbB\npayload: x4V709xbnGezKsDw\nreceivedAt: 66\nto: 24T805tVg8JqU0jZ' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatRequest' test.out

#- 45 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: vzcWbfUpaXp5JMl5\ncode: 31' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatResponse' test.out

#- 46 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: LL4bTxBmZjdrrIxs' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyCreateRequest' test.out

#- 47 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: jglaDXTvKCWwNTAh\ncode: 56\ninvitationToken: d2wrS0uPdjhdinpn\ninvitees: g5BLy8wbhMssAHja\nleaderId: pIkY9Rf4wP57dBZN\nmembers: R88YbCtmKy8M9zVr\npartyId: jfGXZnqAQUoY1Gjl' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateResponse' test.out

#- 48 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"IIk0iKoTTS1j02o7":{},"JjTXAQN0qdskdQV0":{},"TqI8EFnmDbxIxi4Y":{}}\ninvitees: [KlONk2Q5Y4Jvaizw,iilatuUjjt9lIMGq,l5ElEa9EIIlGcHB3]\nleader: CfR3ncDlwi3v3MFF\nmembers: [J1KesKoELCpobBEG,8X645xpdXpai0rYa,T5hOPjaf3H0tYigh]\nnamespace: U0VUfcYHJbBfAKSi\npartyId: PW3VgsZXiR1DJ7HV\nupdatedAt: 99' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyDataUpdateNotif' test.out

#- 49 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: Ki6tArAURt9plCSV\ninvitationToken: q8PdH6hJPUAc0RVw\npartyId: XgAgntLMCuaXBWQi' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyGetInvitedNotif' test.out

#- 50 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: 6BqPg4xr0lCancUZ' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyInfoRequest' test.out

#- 51 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: ZXElW9YfRSse6AAz\ncode: 66\ncustomAttributes: {"vSZIPkhSgORcz5S5":{},"BvmgBLxh4ijFnE3T":{},"am69qSZ7PC6f6Qkm":{}}\ninvitationToken: 3S4czz0QKFlAVmVL\ninvitees: u4AOec0z8eBeeoip\nleaderId: 68J1nsv4W2OJhtaf\nmembers: xMSJlHeb34sZKHcl\npartyId: 5LLLOexL4fZvWtND' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoResponse' test.out

#- 52 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: 2tcBFpX8lNtFEJ7t\ninviterId: nkY6Mca5afj12K2I' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInviteNotif' test.out

#- 53 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: XgNne8kJATwlc6es\nfriendId: zrBvvWm4udE0OXud' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteRequest' test.out

#- 54 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: BsV6xnZ5Jrzzjrca\ncode: 95' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteResponse' test.out

#- 55 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: ug6CWVG8SWP3glU6' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyJoinNotif' test.out

#- 56 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: muswVJnNnN7kAa7j\ninvitationToken: 0riFc5HTHQIoVsGo\npartyId: 7dwV9DBqFKHQkETJ' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinRequest' test.out

#- 57 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: UVSC00PYeDcaggin\ncode: 50\ninvitationToken: xnFIna3yddcbsPhe\ninvitees: TH26IUJNvYuGRUvp\nleaderId: ZaHCuESOiIZsMfB4\nmembers: ZH3mtgWgU4pCAKxe\npartyId: E70CaunQNxot371W' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinResponse' test.out

#- 58 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: 9G4AvQkqsGnmyo5J\npartyId: JTUVmb8GEXFTlEME\nuserId: sFzYqwgK1Np5nodq' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyKickNotif' test.out

#- 59 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: pLm7FhJBNXzAFdO0\nmemberId: Khqf6kiTdSGv2LFj' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickRequest' test.out

#- 60 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: xL6ozRmDD0jJvlfV\ncode: 54' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickResponse' test.out

#- 61 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: 5OemPYdYT7DROCjt\nuserId: uzFMbAG9YI89hmgu' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyLeaveNotif' test.out

#- 62 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: B8FOTjMLo4b9rIzq\nignoreUserRegistry: True' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveRequest' test.out

#- 63 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: drKF7SUQPLG59e0k\ncode: 21' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveResponse' test.out

#- 64 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: 5ZtX6wK7PpUlcIW3\nnewLeaderUserId: 2iK7MGt1ixY5rA1W' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyPromoteLeaderRequest' test.out

#- 65 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: JXTIMtpgkieDyF97\ncode: 30\ninvitationToken: lGdMiHKxbWCYzo8y\ninvitees: O2KTK9tmmOnYnOpa\nleaderId: s6ghP1y4Zi7s7QBl\nmembers: k44Z44B1GZgKg4uK\npartyId: xaCgcGLuC3brWdTY' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderResponse' test.out

#- 66 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: CfHkIySok5DiXZtL\npartyId: W87rGysryod3dNQr\nuserId: msApRA6HX3RwrKt2' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyRejectNotif' test.out

#- 67 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: ecozL0TOg54vCE48\ninvitationToken: L5oLF6M4lNa4JUMS\npartyId: HNgqRqCV7usamANk' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectRequest' test.out

#- 68 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: lOX9Sfo95HgXqKhT\ncode: 30\npartyId: PkwfLM9uSybRzWek' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectResponse' test.out

#- 69 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: cKMLhrTrcBE2ItBS\nfriendId: 2gZvRrvr0n9d9lvc' -u \
    > test.out 2>&1
eval_tap $? 69 'PersonalChatHistoryRequest' test.out

#- 70 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: LYOWA8NjxOnaEok4\nchat: 3KtKZWe8aoFzAyBM\ncode: 63\nfriendId: vim02jBOxrZDyvpc' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryResponse' test.out

#- 71 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: Un18G5MlfDTk8aG4\nfrom: nOOCzfsflhjbngJO\npayload: 0NlncceIZSwgAIkg\nreceivedAt: 51\nto: Y8VnocGAjci0V3tB' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatNotif' test.out

#- 72 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: NLDljhZ2jxLRX3z4\nfrom: f2jnHGKXphn50c9t\npayload: 6OCaGBeMfPlNos4y\nreceivedAt: 57\nto: ifnKqmTSoGH1XEfY' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatRequest' test.out

#- 73 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: QAYn6WQ5UBEU1QAO\ncode: 42' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatResponse' test.out

#- 74 RefreshTokenRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenRequest\nid: HfZiGhxOdcuDXSxS\ntoken: c3aZPV87pna08gxe' -u \
    > test.out 2>&1
eval_tap $? 74 'RefreshTokenRequest' test.out

#- 75 RefreshTokenResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenResponse\nid: j1Rx59hesNWy2NvZ\ncode: 11' -u \
    > test.out 2>&1
eval_tap $? 75 'RefreshTokenResponse' test.out

#- 76 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: 85DDKDAF8KDsBZOu' -u \
    > test.out 2>&1
eval_tap $? 76 'RejectFriendsNotif' test.out

#- 77 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: kMpcmnnx6RVBrop9\nfriendId: YQJ03BAHZ7c53q7a' -u \
    > test.out 2>&1
eval_tap $? 77 'RejectFriendsRequest' test.out

#- 78 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: qKzFsLfYalUlfwEQ\ncode: 44' -u \
    > test.out 2>&1
eval_tap $? 78 'RejectFriendsResponse' test.out

#- 79 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 74' -u \
    > test.out 2>&1
eval_tap $? 79 'RematchmakingNotif' test.out

#- 80 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: SfQrtfF3TQN0OcND' -u \
    > test.out 2>&1
eval_tap $? 80 'RequestFriendsNotif' test.out

#- 81 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: mPYhrLTyU8OhgfY9\nfriendId: Lr36vzohZyjMQAg5' -u \
    > test.out 2>&1
eval_tap $? 81 'RequestFriendsRequest' test.out

#- 82 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: G99LyvfvHEsJKQQe\ncode: 73' -u \
    > test.out 2>&1
eval_tap $? 82 'RequestFriendsResponse' test.out

#- 83 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: jfIGaffoflEIByYq\nchannelSlug: wVLMUoAnaRcYp7FU\npayload: eKN0meGelYF5wWaD' -u \
    > test.out 2>&1
eval_tap $? 83 'SendChannelChatRequest' test.out

#- 84 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: lncV7vWgSHdfo07U\ncode: 16' -u \
    > test.out 2>&1
eval_tap $? 84 'SendChannelChatResponse' test.out

#- 85 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: ctPErqxyMyOK06Mq\nuserId: QBErxgjVBycvU4Pb' -u \
    > test.out 2>&1
eval_tap $? 85 'SetReadyConsentNotif' test.out

#- 86 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: mRDcrg0DjQjBECXv\nmatchId: ea7H1m2lJFRZ3Zpr' -u \
    > test.out 2>&1
eval_tap $? 86 'SetReadyConsentRequest' test.out

#- 87 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: 60zMjhTHeh94TSen\ncode: 99' -u \
    > test.out 2>&1
eval_tap $? 87 'SetReadyConsentResponse' test.out

#- 88 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: E5hCFkIf5weqZ18M\nkey: H57l2Zsrh90ETtYm\nnamespace: Gukz3MnlrjcHp6B8\nvalue: Vj7rXFgDnDkdZ9bp' -u \
    > test.out 2>&1
eval_tap $? 88 'SetSessionAttributeRequest' test.out

#- 89 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: wSWTaLQjctvrK2jh\ncode: 18' -u \
    > test.out 2>&1
eval_tap $? 89 'SetSessionAttributeResponse' test.out

#- 90 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: pPr2QEPx3zTxBGtE\nactivity: sYpKPlXn77AtYoFz\navailability: 76' -u \
    > test.out 2>&1
eval_tap $? 90 'SetUserStatusRequest' test.out

#- 91 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: QxevecWw7Rry0KK5\ncode: 73' -u \
    > test.out 2>&1
eval_tap $? 91 'SetUserStatusResponse' test.out

#- 92 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: rgAGO0dW8rX2MVUG' -u \
    > test.out 2>&1
eval_tap $? 92 'ShutdownNotif' test.out

#- 93 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: KSZ4GcLkt4pK32sJ\nmessage: xlZcCTpTdRtCHvuk' -u \
    > test.out 2>&1
eval_tap $? 93 'SignalingP2PNotif' test.out

#- 94 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: uL02Le8HSCslsDd4\nextraAttributes: 6B6XTmSLyn50sigB\ngameMode: VZxiKdV57GvRyd9U\npartyAttributes: {"M1F5qRIblS7Nz81G":{},"RazPAANjfBoldFOy":{},"qA2clJ5gEOaCgM6Y":{}}\npriority: 28\ntempParty: tZdIs0xf4czdt7zq' -u \
    > test.out 2>&1
eval_tap $? 94 'StartMatchmakingRequest' test.out

#- 95 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: 5mM7k8nbLzvtCIW5\ncode: 26' -u \
    > test.out 2>&1
eval_tap $? 95 'StartMatchmakingResponse' test.out

#- 96 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: ynMKquUicAeIVXto\nuserId: WAXhMlW4tLqX7OIC' -u \
    > test.out 2>&1
eval_tap $? 96 'UnblockPlayerNotif' test.out

#- 97 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: f5oD1e6oI9FmYel0\nnamespace: kOw72o8Zkgk0jS6r\nunblockedUserId: DWUwfhKvrf2AaH4y' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerRequest' test.out

#- 98 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: SwyagYvDJ3w3UNgI\ncode: 58\nnamespace: Gj2jZtEYT8sIPSE1\nunblockedUserId: XXPzySa0sZoFS6xC' -u \
    > test.out 2>&1
eval_tap $? 98 'UnblockPlayerResponse' test.out

#- 99 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: OWMpyh9pMsQgb64E' -u \
    > test.out 2>&1
eval_tap $? 99 'UnfriendNotif' test.out

#- 100 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: bufXjYnSoIFeouC2\nfriendId: LbzDMwyo4nIRysQd' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendRequest' test.out

#- 101 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: nuHCXWfwnwGioVwV\ncode: 25' -u \
    > test.out 2>&1
eval_tap $? 101 'UnfriendResponse' test.out

#- 102 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 102 'UserBannedNotification' test.out

#- 103 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: zmmBVVFfpqx1AeLt' -u \
    > test.out 2>&1
eval_tap $? 103 'UserMetricRequest' test.out

#- 104 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: hsjwJeGwaPSDMZz9\ncode: 52\nplayerCount: 58' -u \
    > test.out 2>&1
eval_tap $? 104 'UserMetricResponse' test.out

#- 105 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: OYKiqaZD63xe5rru\navailability: 73\nlastSeenAt: zpqIFGLkDs7ACC1R\nuserId: gBfoNrHlFi2qJLgm' -u \
    > test.out 2>&1
eval_tap $? 105 'UserStatusNotif' test.out


exit $EXIT_CODE