## Java Extend SDK CLI Sample App Operation Index for Session service

### Operation GetHealthcheckInfo

```sh
$ build/install/cli/bin/cli session getHealthcheckInfo
```

### Operation GetHealthcheckInfoV1

```sh
$ build/install/cli/bin/cli session getHealthcheckInfoV1
```

### Operation AdminGetLogConfig

```sh
$ build/install/cli/bin/cli session adminGetLogConfig
```

### Operation AdminPatchUpdateLogConfig

```sh
$ build/install/cli/bin/cli session adminPatchUpdateLogConfig \
    --body <json string for request body>
```

### Operation AdminListEnvironmentVariables

```sh
$ build/install/cli/bin/cli session adminListEnvironmentVariables
```

### Operation AdminListGlobalConfiguration

```sh
$ build/install/cli/bin/cli session adminListGlobalConfiguration
```

### Operation AdminUpdateGlobalConfiguration

```sh
$ build/install/cli/bin/cli session adminUpdateGlobalConfiguration \
    --body <json string for request body>
```

### Operation AdminDeleteGlobalConfiguration

```sh
$ build/install/cli/bin/cli session adminDeleteGlobalConfiguration
```

### Operation AdminGetConfigurationAlertV1

```sh
$ build/install/cli/bin/cli session adminGetConfigurationAlertV1 \
    --namespace <namespace value>
```

### Operation AdminUpdateConfigurationAlertV1

```sh
$ build/install/cli/bin/cli session adminUpdateConfigurationAlertV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCreateConfigurationAlertV1

```sh
$ build/install/cli/bin/cli session adminCreateConfigurationAlertV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteConfigurationAlertV1

```sh
$ build/install/cli/bin/cli session adminDeleteConfigurationAlertV1 \
    --namespace <namespace value>
```

### Operation AdminCreateConfigurationTemplateV1

```sh
$ build/install/cli/bin/cli session adminCreateConfigurationTemplateV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetAllConfigurationTemplatesV1

```sh
$ build/install/cli/bin/cli session adminGetAllConfigurationTemplatesV1 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional>
```

### Operation AdminGetConfigurationTemplateV1

```sh
$ build/install/cli/bin/cli session adminGetConfigurationTemplateV1 \
    --name <name value> \
    --namespace <namespace value>
```

### Operation AdminUpdateConfigurationTemplateV1

```sh
$ build/install/cli/bin/cli session adminUpdateConfigurationTemplateV1 \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteConfigurationTemplateV1

```sh
$ build/install/cli/bin/cli session adminDeleteConfigurationTemplateV1 \
    --name <name value> \
    --namespace <namespace value>
```

### Operation AdminGetMemberActiveSession

```sh
$ build/install/cli/bin/cli session adminGetMemberActiveSession \
    --name <name value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminReconcileMaxActiveSession

```sh
$ build/install/cli/bin/cli session adminReconcileMaxActiveSession \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminQueryGameSessions

```sh
$ build/install/cli/bin/cli session adminQueryGameSessions \
    --namespace <namespace value> \
    --configurationName <configurationName value - optional> \
    --dsPodName <dsPodName value - optional> \
    --fromTime <fromTime value - optional> \
    --gameMode <gameMode value - optional> \
    --isPersistent <isPersistent value - optional> \
    --isSoftDeleted <isSoftDeleted value - optional> \
    --joinability <joinability value - optional> \
    --limit <limit value - optional> \
    --matchPool <matchPool value - optional> \
    --memberID <memberID value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --sessionID <sessionID value - optional> \
    --status <status value - optional> \
    --statusV2 <statusV2 value - optional> \
    --toTime <toTime value - optional>
```

### Operation AdminQueryGameSessionsByAttributes

```sh
$ build/install/cli/bin/cli session adminQueryGameSessionsByAttributes \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteBulkGameSessions

```sh
$ build/install/cli/bin/cli session adminDeleteBulkGameSessions \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminSetDSReady

```sh
$ build/install/cli/bin/cli session adminSetDSReady \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation AdminUpdateDSInformation

```sh
$ build/install/cli/bin/cli session adminUpdateDSInformation \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation AdminKickGameSessionMember

```sh
$ build/install/cli/bin/cli session adminKickGameSessionMember \
    --memberId <memberId value> \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation AdminUpdateGameSessionMember

```sh
$ build/install/cli/bin/cli session adminUpdateGameSessionMember \
    --memberId <memberId value> \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --statusType <statusType value>
```

### Operation AdminGetListNativeSession

```sh
$ build/install/cli/bin/cli session adminGetListNativeSession \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional>
```

### Operation AdminQueryParties

```sh
$ build/install/cli/bin/cli session adminQueryParties \
    --namespace <namespace value> \
    --configurationName <configurationName value - optional> \
    --fromTime <fromTime value - optional> \
    --isSoftDeleted <isSoftDeleted value - optional> \
    --joinability <joinability value - optional> \
    --key <key value - optional> \
    --leaderID <leaderID value - optional> \
    --limit <limit value - optional> \
    --memberID <memberID value - optional> \
    --memberStatus <memberStatus value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --partyID <partyID value - optional> \
    --toTime <toTime value - optional> \
    --value <value value - optional>
```

### Operation AdminDeleteBulkParties

```sh
$ build/install/cli/bin/cli session adminDeleteBulkParties \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminReadPartySessionStorage

```sh
$ build/install/cli/bin/cli session adminReadPartySessionStorage \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation AdminGetPlatformCredentials

```sh
$ build/install/cli/bin/cli session adminGetPlatformCredentials \
    --namespace <namespace value>
```

### Operation AdminUpdatePlatformCredentials

```sh
$ build/install/cli/bin/cli session adminUpdatePlatformCredentials \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeletePlatformCredentials

```sh
$ build/install/cli/bin/cli session adminDeletePlatformCredentials \
    --namespace <namespace value>
```

### Operation AdminDeletePlatformCredentialsByPlatformId

```sh
$ build/install/cli/bin/cli session adminDeletePlatformCredentialsByPlatformId \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation AdminSyncPlatformCredentials

```sh
$ build/install/cli/bin/cli session adminSyncPlatformCredentials \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation AdminUploadPlatformCredentials

```sh
$ build/install/cli/bin/cli session adminUploadPlatformCredentials \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --description <description value - optional> \
    --file <file value> \
    --password <password value>
```

### Operation AdminGetRecentPlayer

```sh
$ build/install/cli/bin/cli session adminGetRecentPlayer \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --userId <userId value - optional>
```

### Operation AdminGetRecentTeamPlayer

```sh
$ build/install/cli/bin/cli session adminGetRecentTeamPlayer \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --userId <userId value - optional>
```

### Operation AdminReadSessionStorage

```sh
$ build/install/cli/bin/cli session adminReadSessionStorage \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation AdminDeleteUserSessionStorage

```sh
$ build/install/cli/bin/cli session adminDeleteUserSessionStorage \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation AdminReadUserSessionStorage

```sh
$ build/install/cli/bin/cli session adminReadUserSessionStorage \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --userId <userId value>
```

### Operation AdminQueryPlayerAttributes

```sh
$ build/install/cli/bin/cli session adminQueryPlayerAttributes \
    --namespace <namespace value> \
    --users <users value - optional>
```

### Operation AdminGetPlayerAttributes

```sh
$ build/install/cli/bin/cli session adminGetPlayerAttributes \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminSyncNativeSession

```sh
$ build/install/cli/bin/cli session adminSyncNativeSession \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation CreateGameSession

```sh
$ build/install/cli/bin/cli session createGameSession \
    --namespace <namespace value> \
    --resolveMaxActiveSession <resolveMaxActiveSession value - optional> \
    --body <json string for request body>
```

### Operation PublicQueryGameSessionsByAttributes

```sh
$ build/install/cli/bin/cli session publicQueryGameSessionsByAttributes \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicSessionJoinCode

```sh
$ build/install/cli/bin/cli session publicSessionJoinCode \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetGameSessionByPodName

```sh
$ build/install/cli/bin/cli session getGameSessionByPodName \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation GetGameSession

```sh
$ build/install/cli/bin/cli session getGameSession \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation UpdateGameSession

```sh
$ build/install/cli/bin/cli session updateGameSession \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation DeleteGameSession

```sh
$ build/install/cli/bin/cli session deleteGameSession \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PatchUpdateGameSession

```sh
$ build/install/cli/bin/cli session patchUpdateGameSession \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation UpdateGameSessionBackfillTicketID

```sh
$ build/install/cli/bin/cli session updateGameSessionBackfillTicketID \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation GameSessionGenerateCode

```sh
$ build/install/cli/bin/cli session gameSessionGenerateCode \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PublicRevokeGameSessionCode

```sh
$ build/install/cli/bin/cli session publicRevokeGameSessionCode \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PublicGameSessionInvite

```sh
$ build/install/cli/bin/cli session publicGameSessionInvite \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation JoinGameSession

```sh
$ build/install/cli/bin/cli session joinGameSession \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PublicPromoteGameSessionLeader

```sh
$ build/install/cli/bin/cli session publicPromoteGameSessionLeader \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation LeaveGameSession

```sh
$ build/install/cli/bin/cli session leaveGameSession \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PublicKickGameSessionMember

```sh
$ build/install/cli/bin/cli session publicKickGameSessionMember \
    --memberId <memberId value> \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PublicGameSessionReject

```sh
$ build/install/cli/bin/cli session publicGameSessionReject \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation GetSessionServerSecret

```sh
$ build/install/cli/bin/cli session getSessionServerSecret \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation PublicGameSessionCancel

```sh
$ build/install/cli/bin/cli session publicGameSessionCancel \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --userId <userId value>
```

### Operation PublicPartyJoinCode

```sh
$ build/install/cli/bin/cli session publicPartyJoinCode \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetParty

```sh
$ build/install/cli/bin/cli session publicGetParty \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicUpdateParty

```sh
$ build/install/cli/bin/cli session publicUpdateParty \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --body <json string for request body>
```

### Operation PublicPatchUpdateParty

```sh
$ build/install/cli/bin/cli session publicPatchUpdateParty \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --body <json string for request body>
```

### Operation PublicGeneratePartyCode

```sh
$ build/install/cli/bin/cli session publicGeneratePartyCode \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicRevokePartyCode

```sh
$ build/install/cli/bin/cli session publicRevokePartyCode \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicPartyInvite

```sh
$ build/install/cli/bin/cli session publicPartyInvite \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --body <json string for request body>
```

### Operation PublicPromotePartyLeader

```sh
$ build/install/cli/bin/cli session publicPromotePartyLeader \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --body <json string for request body>
```

### Operation PublicReadPartySessionStorage

```sh
$ build/install/cli/bin/cli session publicReadPartySessionStorage \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicUpdateInsertPartySessionStorage

```sh
$ build/install/cli/bin/cli session publicUpdateInsertPartySessionStorage \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicUpdateInsertPartySessionStorageReserved

```sh
$ build/install/cli/bin/cli session publicUpdateInsertPartySessionStorageReserved \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicPartyJoin

```sh
$ build/install/cli/bin/cli session publicPartyJoin \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicPartyLeave

```sh
$ build/install/cli/bin/cli session publicPartyLeave \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicPartyReject

```sh
$ build/install/cli/bin/cli session publicPartyReject \
    --namespace <namespace value> \
    --partyId <partyId value>
```

### Operation PublicPartyCancel

```sh
$ build/install/cli/bin/cli session publicPartyCancel \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --userId <userId value>
```

### Operation PublicPartyKick

```sh
$ build/install/cli/bin/cli session publicPartyKick \
    --namespace <namespace value> \
    --partyId <partyId value> \
    --userId <userId value>
```

### Operation PublicCreateParty

```sh
$ build/install/cli/bin/cli session publicCreateParty \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetRecentPlayer

```sh
$ build/install/cli/bin/cli session publicGetRecentPlayer \
    --namespace <namespace value> \
    --limit <limit value - optional>
```

### Operation PublicGetRecentTeamPlayer

```sh
$ build/install/cli/bin/cli session publicGetRecentTeamPlayer \
    --namespace <namespace value> \
    --limit <limit value - optional>
```

### Operation PublicUpdateInsertSessionStorageLeader

```sh
$ build/install/cli/bin/cli session publicUpdateInsertSessionStorageLeader \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --body <json string for request body>
```

### Operation PublicUpdateInsertSessionStorage

```sh
$ build/install/cli/bin/cli session publicUpdateInsertSessionStorage \
    --namespace <namespace value> \
    --sessionId <sessionId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetBulkPlayerCurrentPlatform

```sh
$ build/install/cli/bin/cli session publicGetBulkPlayerCurrentPlatform \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetPlayerAttributes

```sh
$ build/install/cli/bin/cli session publicGetPlayerAttributes \
    --namespace <namespace value>
```

### Operation PublicStorePlayerAttributes

```sh
$ build/install/cli/bin/cli session publicStorePlayerAttributes \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicDeletePlayerAttributes

```sh
$ build/install/cli/bin/cli session publicDeletePlayerAttributes \
    --namespace <namespace value>
```

### Operation PublicQueryMyGameSessions

```sh
$ build/install/cli/bin/cli session publicQueryMyGameSessions \
    --namespace <namespace value> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --status <status value - optional>
```

### Operation PublicQueryMyParties

```sh
$ build/install/cli/bin/cli session publicQueryMyParties \
    --namespace <namespace value> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --status <status value - optional>
```

