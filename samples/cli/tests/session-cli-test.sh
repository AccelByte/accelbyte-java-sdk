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
echo "1..37"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "GsjIW4iF", "deployment": "TArkhUix", "inactiveTimeout": 86, "inviteTimeout": 17, "joinability": "7QBIyqHl", "maxPlayers": 36, "minPlayers": 7, "name": "oHROlfqE", "requestedRegions": ["Az6ijc0a", "OpoMeDGb", "LkfCnhiQ"], "textChat": false, "type": "sounCE0f"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'tcgBYk8g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'pUgxAzOE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "aVD8xfYQ", "deployment": "IawjJhyl", "inactiveTimeout": 51, "inviteTimeout": 93, "joinability": "801aaSo3", "maxPlayers": 88, "minPlayers": 63, "name": "aUzR1Isp", "requestedRegions": ["SVdYYqqe", "3Yq70kTr", "a02I4p9J"], "textChat": true, "type": "OcLXu34f"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'yAuvrjYg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '7YTm0aHl' \
    --dsPodName '3TJPzQSa' \
    --fromTime 'HIN7331l' \
    --gameMode 'qHCrWKwR' \
    --joinability 'PSsXltPl' \
    --limit '22' \
    --matchPool 'SoVGfyW4' \
    --memberID 's2ZqAGAf' \
    --offset '45' \
    --order 'cjnMTNbU' \
    --orderBy 'LA6sXl85' \
    --sessionID 'iUDrGJBv' \
    --status 'FHEBv2Md' \
    --toTime 'BXybjV3q' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'CYjOhIhp' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HWmk3zmn' \
    --statusType 'rqfy2t31' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'oykwsH3Q' \
    --key 'Dk8c9QZ7' \
    --leaderID 'kcyaUoFN' \
    --limit '62' \
    --memberID 'xheyju85' \
    --memberStatus 'oJGDlcEh' \
    --offset '67' \
    --order 'daSoINnV' \
    --orderBy 'BdVFMpEQ' \
    --value 'RyWC7mEW' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"egRJsGGm": {}, "sPSwSL1u": {}, "9ADMqEH7": {}}, "backfillTicketID": "qQqebqgE", "clientVersion": "CS8iKlBk", "configurationName": "HtodEDhO", "deployment": "5eOAqkvR", "inactiveTimeout": 83, "inviteTimeout": 69, "joinability": "6DOOyhuc", "matchPool": "sDVCMeUw", "maxPlayers": 32, "minPlayers": 3, "requestedRegions": ["aleGyx1U", "ByTGLB1T", "JoGdYvCQ"], "serverName": "RWH60CRf", "teams": [{"UserIDs": ["9FIL52yk", "XfrvuN7y", "MNLNPfLL"]}, {"UserIDs": ["Rhv48RUR", "OXzajuvf", "iozh8UGj"]}, {"UserIDs": ["5IyEStx9", "dVAsirnG", "ZanImpEG"]}], "textChat": true, "ticketIDs": ["Am6iou3X", "2ugos9d5", "Md2zHPjC"], "type": "IT1aFbzF"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"rO45VuJs": {}, "u84Op6gH": {}, "hgciZYkk": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'zpW17nJs' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KwjArdAK' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 's8Q273Zg' \
    --body '{"attributes": {"GtQLIAf1": {}, "MMjl1csW": {}, "1pcJPjzd": {}}, "backfillTicketID": "HM71aI5e", "clientVersion": "Rvtkwjy0", "deployment": "8sl2dWWe", "inactiveTimeout": 47, "inviteTimeout": 99, "joinability": "jq5rxvGQ", "matchPool": "BZn7HaFg", "maxPlayers": 29, "minPlayers": 8, "requestedRegions": ["e75iX9OY", "qqMEKVER", "sCY6RM1w"], "teams": [{"UserIDs": ["y9kwvMZp", "yiJdxJYd", "PvjJmNMh"]}, {"UserIDs": ["x19admCV", "3tKCUfUu", "AUjX6877"]}, {"UserIDs": ["yyOmaN5Y", "YEJeqPaA", "7ouvfm6r"]}], "ticketIDs": ["1AJZbzqz", "j4F9VSvp", "Of8Aa5xH"], "type": "coUkb3Ei", "version": 96}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'K2oT2e2T' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KzazKt92' \
    --body '{"attributes": {"mKmfE1v0": {}, "77QqoHoF": {}, "nWpvleuN": {}}, "backfillTicketID": "STAvFjgD", "clientVersion": "zYV0owTq", "deployment": "GSbnYmQh", "inactiveTimeout": 79, "inviteTimeout": 61, "joinability": "WEk3nfBO", "matchPool": "P2Co2G3U", "maxPlayers": 64, "minPlayers": 59, "requestedRegions": ["YbZU3N6P", "QF5YUBG8", "zy1Z1A3N"], "teams": [{"UserIDs": ["n3wXwfbE", "oeLojALR", "d6eAObGa"]}, {"UserIDs": ["uDJhmf4r", "crIIP45i", "KUteoKDm"]}, {"UserIDs": ["uCNtvrL7", "rbyuKIIt", "Xe2tvM1j"]}], "ticketIDs": ["MuBNFbuX", "c5vdXlr3", "O0RUu5UH"], "type": "PIQB8PK1", "version": 91}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'efJ48pzM' \
    --body '{"userID": "rvZ4NbAj"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EIz243Tv' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9GLLvwWM' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'a0vNGjKR' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2shOLprm"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zsbyOaJT' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'N1BOHWeE' \
    --body '{"attributes": {"NsUsk5Pz": {}, "wcwuCsxY": {}, "9qTJCCyL": {}}, "inactiveTimeout": 88, "inviteTimeout": 46, "joinability": "8my2AHLI", "maxPlayers": 8, "minPlayers": 20, "type": "Mud89pKz", "version": 95}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '7zmBFeZ3' \
    --body '{"attributes": {"HJkek1xl": {}, "nTjmkbmu": {}, "cpXxBsQy": {}}, "inactiveTimeout": 23, "inviteTimeout": 66, "joinability": "gTtOyVS1", "maxPlayers": 21, "minPlayers": 100, "type": "H3TzbguT", "version": 57}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'A7Co61Eh' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hEW557ho' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eAnjb1L3' \
    --body '{"userID": "Dbxu4vDM"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'x6FjCZbt' \
    --body '{"leaderID": "hvUaZcj1"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BBZiHc6D' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Zz4IEU2L' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '64VOPHjr' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UBzBEkGz' \
    --userId 'absSFZpH' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"liRLA0Eg": {}, "Zn0VcVVc": {}, "sd0VbUce": {}}, "configurationName": "DdPfZqCD", "inactiveTimeout": 71, "inviteTimeout": 11, "joinability": "wietXMjy", "maxPlayers": 69, "members": [{"ID": "31HGxNiG", "PlatformID": "OtXcvNfb", "PlatformUserID": "eaBQm0KI"}, {"ID": "Znqjgm5s", "PlatformID": "xRiBOB5K", "PlatformUserID": "pKTtCRjZ"}, {"ID": "7qFkMGan", "PlatformID": "tUmqrB0j", "PlatformUserID": "a3yi5jbI"}], "minPlayers": 56, "textChat": false, "type": "dlDWMVpp"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'Yjlpopx1' \
    --orderBy '0gMq5ayV' \
    --status 'VcS2d2xL' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'Ku4UInOF' \
    --orderBy 'gRBRUZ5s' \
    --status '8mhSvcb8' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE