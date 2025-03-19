# Common Use Cases

## Achievement

Source: [TestIntegrationServiceAchievement.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceAchievement.java)

### Create an achievement

```java
final ModelsAchievementRequest createAchievementBody =
    ModelsAchievementRequest.builder()
        .achievementCode(achievementCode)
        .defaultLanguage(achievementLanguage)
        .name(Collections.singletonMap(achievementLanguage, achievementName))
        .description(Collections.singletonMap(achievementLanguage, achievementDescription))
        .goalValue(1000f)
        .statCode(achievementCode)
        .hidden(true)
        .incremental(false)
        .lockedIcons(
            Arrays.asList(
                new ModelsIcon[] {
                  ModelsIcon.builder().slug("shield-locked").url(lockedIconUrl).build()
                }))
        .unlockedIcons(
            Arrays.asList(
                new ModelsIcon[] {
                  ModelsIcon.builder().slug("shield-unlocked").url(unlockedIconUrl).build()
                }))
        .tags(Arrays.asList(new String[] {"java", "server", "sdk", "integration", "test"}))
        .build();

final ModelsAchievementResponse createAchievementResult =
    achievementsWrapper.adminCreateNewAchievement(
        AdminCreateNewAchievement.builder()
            .namespace(this.namespace)
            .body(createAchievementBody)
            .build());
```

### Update an achievement

```java
final ModelsAchievementUpdateRequest updateAchievementBody =
    ModelsAchievementUpdateRequest.builder()
        .name(Collections.singletonMap(achievementLanguage, achievementName))
        .description(Collections.singletonMap(achievementLanguage, achievementDescription))
        .goalValue(2000f)
        .build();

final ModelsAchievementResponse updateAchievementResult =
    achievementsWrapper.adminUpdateAchievement(
        AdminUpdateAchievement.builder()
            .namespace(this.namespace)
            .achievementCode(achievementCode)
            .body(updateAchievementBody)
            .build());
```

### Get an achievement by achievement code

```java
final ModelsAchievementResponse getAchievementResult =
    achievementsWrapper.adminGetAchievement(
        AdminGetAchievement.builder()
            .namespace(this.namespace)
            .achievementCode(achievementCode)
            .build());

assertNotNull(getAchievementResult);
assertEquals(getAchievementResult.getGoalValue(), 2000f);
assertEquals(getAchievementResult.getName().get(achievementLanguage), achievementName);
```

### Get a list of achievements

```java
final ModelsPaginatedAchievementResponse getAchievementListResult =
    achievementsWrapper.adminListAchievements(
        AdminListAchievements.builder().namespace(this.namespace).limit(100).offset(0).build());

assertNotNull(getAchievementListResult);
assertTrue(getAchievementListResult.getData().size() > 0);
```

### Delete an achievement

```java
achievementsWrapper.adminDeleteAchievement(
    AdminDeleteAchievement.builder()
        .namespace(this.namespace)
        .achievementCode(achievementCode)
        .build());
```
## AMS

Source: [TestIntegrationServiceAms.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceAms.java)

### Get AMS info for info region operation

```java
final ApiAMSRegionsResponse infoRegions =
    amsInfoWrapper.infoRegions(InfoRegions.builder().namespace(this.namespace).build());
```

### Get AMS info for info region operation

```java
final ApiAMSRegionsResponse infoRegions =
    amsInfoWrapper.infoRegions(InfoRegions.builder().namespace(this.namespace).build());
```
## Basic

Source: [TestIntegrationServiceBasic.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceBasic.java)

### Create a user profile

```java
final UserProfilePrivateCreate createProfileBody =
    UserProfilePrivateCreate.builder()
        .firstName(profileFirstName)
        .lastName(profileLastName)
        .dateOfBirth(profileDateOfBirth)
        .language(profileLanguage)
        .build();

final UserProfilePrivateInfo createProfileResult =
    userProfileWrapper.createMyProfile(
        CreateMyProfile.builder().namespace(this.namespace).body(createProfileBody).build());
```

### Get a user profile

```java
final UserProfilePrivateInfo getProfileResult =
    userProfileWrapper.getMyProfileInfo(
        GetMyProfileInfo.builder().namespace(this.namespace).build());
```

### Update a user profile

```java
final UserProfileUpdate updateProfileBody =
    UserProfileUpdate.builder().timeZone(profileTimeZone).build();

final UserProfilePrivateInfo updateProfileResult =
    userProfileWrapper.updateMyProfile(
        UpdateMyProfile.builder().namespace(this.namespace).body(updateProfileBody).build());
```

### Delete a user profile

```java
final String userId = getProfileResult.getUserId();

final UserProfilePrivateInfo deleteUserProfileResult =
    userProfileWrapper.deleteUserProfile(
        DeleteUserProfile.builder().namespace(this.namespace).userId(userId).build());
```
## CloudSave

Source: [TestIntegrationServiceCloudSave.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceCloudSave.java)

### Create a game record

```java
final DummyGameRecord createGameRecordBody =
    DummyGameRecord.builder()
        .Foo(gameRecordFoo)
        .FooBar(gameRecordFooBar)
        .FooValue(gameRecordFooValue)
        .build();

publicGameRecordWrapper.postGameRecordHandlerV1(
    PostGameRecordHandlerV1.builder()
        .namespace(this.namespace)
        .key(gameRecordKey)
        .body(createGameRecordBody)
        .build());
```

### Get a game record

```java
final ModelsGameRecordResponse getGameRecordResult =
    publicGameRecordWrapper.getGameRecordHandlerV1(
        GetGameRecordHandlerV1.builder().namespace(this.namespace).key(gameRecordKey).build());
```

### Update a game record

```java
DummyGameRecord updateRecord =
    DummyGameRecord.builder()
        .Foo(gameRecordFoo)
        .FooBar(gameRecordFooBarUpdate)
        .FooValue(gameRecordFooValue)
        .build();

publicGameRecordWrapper.putGameRecordHandlerV1(
    PutGameRecordHandlerV1.builder()
        .namespace(this.namespace)
        .key(gameRecordKey)
        .body(updateRecord)
        .build());
```

### Delete a game record

```java
publicGameRecordWrapper.deleteGameRecordHandlerV1(
    DeleteGameRecordHandlerV1.builder().namespace(this.namespace).key(gameRecordKey).build());
```

### Create a player record

```java
final DummyPlayerRecord createPlayerRecordBody =
    DummyPlayerRecord.builder()
        .Foo(playerRecordFoo)
        .FooBar(playerRecordFooBar)
        .FooValue(playerRecordFooValue)
        .build();

publicPlayerRecord.postPlayerRecordHandlerV1(
    PostPlayerRecordHandlerV1.builder()
        .namespace(this.namespace)
        .userId(userId)
        .key(playerRecordKey)
        .body(createPlayerRecordBody)
        .build());
```

### Get a player record

```java
final ModelsPlayerRecordResponse getPlayerRecordResult =
    publicPlayerRecord.getPlayerRecordHandlerV1(
        GetPlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .userId(userId)
            .key(playerRecordKey)
            .build());
```

### Update a player record

```java
DummyPlayerRecord updateRecord =
    DummyPlayerRecord.builder()
        .Foo(playerRecordFoo)
        .FooBar(playerRecordFooBarUpdate)
        .FooValue(playerRecordFooValue)
        .build();

publicPlayerRecord.putPlayerRecordHandlerV1(
    PutPlayerRecordHandlerV1.builder()
        .namespace(this.namespace)
        .userId(userId)
        .key(playerRecordKey)
        .body(updateRecord)
        .build());
```

### Delete a player record

```java
publicPlayerRecord.deletePlayerRecordHandlerV1(
    DeletePlayerRecordHandlerV1.builder()
        .namespace(this.namespace)
        .userId(userId)
        .key(playerRecordKey)
        .build());
```
## CSM

Source: [TestIntegrationServiceCsm.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceCsm.java)

### Create Extend app

```java
final CreateAppV2 createAppV2Op =
    CreateAppV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .body(
            ApimodelCreateAppV2Request.builder()
                .cpu(ApimodelCPURequest.builder().requestCPU(100).build())
                .description("test integration create extend app for extend sdk")
                .memory(ApimodelMemoryRequest.builder().requestMemory(100).build())
                .scenario("service-extension")
                .build())
        .build();

final ApimodelAppItem createAppV2Res = appV2Wrapper.createAppV2(createAppV2Op);
```

### Get Extend app

```java
final GetAppV2 getAppV2Op =
    GetAppV2.builder().app(EXTEND_APP_NAME).namespace(namespace).build();

final ApimodelAppItem getAppv2Res = appV2Wrapper.getAppV2(getAppV2Op);
```

### Save secret variable

```java
final SaveSecretV2 saveSecretV2Op =
    SaveSecretV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .body(
            ApimodelSaveConfigurationV2Request.builder()
                .configName("THIS_IS_A_SECRET")
                .value("ssshhhh")
                .source("plaintext")
                .applyMask(true)
                .build())
        .build();

final ApimodelSaveConfigurationV2Response saveSecretV2Res =
    wrapper.saveSecretV2(saveSecretV2Op);
```

### Get secret variable list

```java
final GetListOfSecretsV2 getListOfSecretsV2Op =
    GetListOfSecretsV2.builder().app(EXTEND_APP_NAME).namespace(namespace).build();

final ApimodelGetListOfConfigurationsV2Response getListOfSecretsV2Res =
    wrapper.getListOfSecretsV2(getListOfSecretsV2Op);
```

### Update secret variable

```java
final UpdateSecretV2 updateSecretV2Op =
    UpdateSecretV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(secretConfigId)
        .namespace(namespace)
        .body(
            ApimodelUpdateConfigurationV2Request.builder()
                .value("silence")
                .applyMask(true)
                .build())
        .build();

final ApimodelUpdateConfigurationV2Response updateSecretV2Res =
    wrapper.updateSecretV2(updateSecretV2Op);
```

### Delete secret variable

```java
final DeleteSecretV2 operation =
    DeleteSecretV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(secretConfigId)
        .namespace(namespace)
        .build();

wrapper.deleteSecretV2(operation);
```

### Save environment variable

```java
final SaveVariableV2 saveVariableV2Op =
    SaveVariableV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .body(
            ApimodelSaveConfigurationV2Request.builder()
                .configName("MY_ENV_VAR")
                .value("helloworld!")
                .source("plaintext")
                .applyMask(true)
                .build())
        .build();

final ApimodelSaveConfigurationV2Response saveVariableV2Res =
    wrapper.saveVariableV2(saveVariableV2Op);
```

### Get environment variable list

```java
final GetListOfVariablesV2 getListOfVariablesV2Op =
    GetListOfVariablesV2.builder().app(EXTEND_APP_NAME).namespace(namespace).build();
final ApimodelGetListOfConfigurationsV2Response getListOfVariablesV2Res =
    wrapper.getListOfVariablesV2(getListOfVariablesV2Op);
```

### Update environment variable

```java
final UpdateVariableV2 updateVariableV2Op =
    UpdateVariableV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(envConfigId)
        .namespace(namespace)
        .body(
            ApimodelUpdateConfigurationV2Request.builder()
                .value("hellosekai!")
                .applyMask(true)
                .build())
        .build();
final ApimodelUpdateConfigurationV2Response updateVariableV2Res =
    wrapper.updateVariableV2(updateVariableV2Op);
```

### Delete environment variable

```java
final DeleteVariableV2 operation =
    DeleteVariableV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(envConfigId)
        .namespace(namespace)
        .build();

wrapper.deleteVariableV2(operation);
```

### Delete Extend app

```java
final DeleteAppV2 deleteAppV2Op =
    DeleteAppV2.builder().app(EXTEND_APP_NAME).namespace(namespace).forced("true").build();

appV2Wrapper.deleteAppV2(deleteAppV2Op);
```
## GameTelemetry

Source: [TestIntegrationServiceGameTelemetry.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceGameTelemetry.java)

### Save game telemetry

```java
final TelemetryBody saveTelemetryBody =
    TelemetryBody.builder()
        .eventName(eventName)
        .eventNamespace(eventName)
        .payload(eventPayload)
        .build();

gameTelemetryWrapper.protectedSaveEventsGameTelemetryV1ProtectedEventsPost(
    ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.builder()
        .body(Arrays.asList(saveTelemetryBody))
        .build());
```
## GDPR

Source: [TestIntegrationServiceGdpr.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceGdpr.java)

### Save admin email configuration

```java
dataRetrievalWrapper.saveAdminEmailConfiguration(
    SaveAdminEmailConfiguration.builder()
        .namespace(this.namespace)
        .body(Arrays.asList(new String[] {email1}))
        .build());
```

### Get admin email configuration

```java
final List<String> emails =
    dataRetrievalWrapper.getAdminEmailConfiguration(
        GetAdminEmailConfiguration.builder().namespace(this.namespace).build());
```

### Update admin email configuration

```java
dataRetrievalWrapper.updateAdminEmailConfiguration(
    UpdateAdminEmailConfiguration.builder()
        .namespace(this.namespace)
        .body(Arrays.asList(new String[] {email2}))
        .build());
```

### Delete admin email configuration

```java
dataRetrievalWrapper.deleteAdminEmailConfiguration(
    DeleteAdminEmailConfiguration.builder()
        .namespace(this.namespace)
        .emails(Arrays.asList(new String[] {email2}))
        .build());
```
## Group

Source: [TestIntegrationServiceGroup.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceGroup.java)

### Create group configuration

```java
final ModelsCreateGroupConfigurationRequestV1 createGroupConfigBody =
    ModelsCreateGroupConfigurationRequestV1.builder()
        .configurationCode(configCode)
        .description(configDescription)
        .groupMaxMember(groupMaxMember)
        .name(configName)
        .groupAdminRoleId(defaultAdminRoleId)
        .groupMemberRoleId(defaultMemberRoleId)
        .build();

final ModelsCreateGroupConfigurationResponseV1 createGroupConfigResult =
    configurationWrapper.createGroupConfigurationAdminV1(
        CreateGroupConfigurationAdminV1.builder()
            .namespace(this.namespace)
            .body(createGroupConfigBody)
            .build());
```

### Create a group

```java
final ModelsPublicCreateNewGroupRequestV1 createGroup =
    ModelsPublicCreateNewGroupRequestV1.builder()
        .groupName(groupName)
        .groupType(groupType)
        .groupDescription(groupDescription)
        .groupMaxMember(100)
        .groupRegion(groupRegion)
        .configurationCode(configCode)
        .build();
final ModelsGroupResponseV1 createGroupResult =
    groupWrapper.createNewGroupPublicV1(
        CreateNewGroupPublicV1.builder().namespace(this.namespace).body(createGroup).build());
```

### Get a group

```java
final ModelsGroupResponseV1 getSingleGroupResult =
    groupWrapper.getSingleGroupPublicV1(
        GetSingleGroupPublicV1.builder().namespace(this.namespace).groupId(groupId).build());
```

### Update a group

```java
final ModelsUpdateGroupRequestV1 updateGroup =
    ModelsUpdateGroupRequestV1.builder().groupDescription(groupDescriptionUpdated).build();
final ModelsGroupResponseV1 updateGroupResult =
    groupWrapper.updateSingleGroupV1(
        UpdateSingleGroupV1.builder()
            .namespace(this.namespace)
            .groupId(groupId)
            .body(updateGroup)
            .build());
```

### Delete a group

```java
groupWrapper.deleteGroupPublicV1(
    DeleteGroupPublicV1.builder().namespace(this.namespace).groupId(groupId).build());
```

### Delete group configuration

```java
configurationWrapper.deleteGroupConfigurationV1(
    DeleteGroupConfigurationV1.builder()
        .namespace(this.namespace)
        .configurationCode(configCode)
        .build());
```
## IAM

Source: [TestIntegrationServiceIam.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceIam.java)

### Create a user (v3)

```java
final ModelUserCreateRequestV3 createUserV3 =
    ModelUserCreateRequestV3.builder()
        .authType("EMAILPASSWD")
        .emailAddress(userEmail)
        .password(userPassword)
        .displayName(userDisplayName)
        .country(userCountry)
        .dateOfBirth(userDateOfBirth)
        .uniqueDisplayName(userName)
        .build();

final ModelUserCreateResponseV3 createUserV3Result =
    usersWrapper.publicCreateUserV3(
        PublicCreateUserV3.builder().namespace(namespace).body(createUserV3).build());
```

### Create a user

```java
final AccountCreateUserRequestV4 createUser =
    AccountCreateUserRequestV4.builder()
        .authTypeFromEnum(AuthType.EMAILPASSWD)
        .emailAddress(userEmail)
        .password(userPassword)
        .displayName(userDisplayName)
        .username(userName)
        .country(userCountry)
        .dateOfBirth(userDateOfBirth)
        .uniqueDisplayName(userName)
        .build();

final AccountCreateUserResponseV4 createUserResult =
    usersV4Wrapper.publicCreateUserV4(
        PublicCreateUserV4.builder().namespace(this.namespace).body(createUser).build());
```

### Get a user

```java
final ModelUserPublicInfoResponseV4 getUserResult =
    usersV4Wrapper.publicGetUserPublicInfoByUserIdV4(
        PublicGetUserPublicInfoByUserIdV4.builder()
            .namespace(this.namespace)
            .userId(userId)
            .build());
```

### Update a user

```java
final ModelUserUpdateRequestV3 updateUser =
    ModelUserUpdateRequestV3.builder().dateOfBirth(userDateOfBirthUpdate).build();

final ModelUserResponseV3 updateUserResult =
    usersWrapper.adminUpdateUserV3(
        AdminUpdateUserV3.builder()
            .namespace(this.namespace)
            .userId(userId)
            .body(updateUser)
            .build());
```

### Delete a user

```java
usersWrapper.adminDeleteUserInformationV3(
    AdminDeleteUserInformationV3.builder().namespace(this.namespace).userId(userId).build());
```
## Leaderboard

Source: [TestIntegrationServiceLeaderboard.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceLeaderboard.java)

### Create a leaderboard

```java
final ModelsLeaderboardConfigReq createLeaderboardBody =
    ModelsLeaderboardConfigReq.builder()
        .leaderboardCode(leaderboardCode)
        .name(leaderboardName)
        .statCode(leaderboardCode)
        .seasonPeriod(36)
        .descending(false)
        .startTime(startTime)
        .daily(ModelsDailyConfig.builder().resetTime("00:00:00").build())
        .weekly(ModelsWeeklyConfig.builder().resetDay(0).resetTime("00:00:00").build())
        .monthly(ModelsMonthlyConfig.builder().resetDate(1).resetTime("00:00:00").build())
        .build();

final ModelsLeaderboardConfigReq createLeaderboardResult =
    leaderboardConfigWrapper.createLeaderboardConfigurationAdminV1(
        CreateLeaderboardConfigurationAdminV1.builder()
            .namespace(this.namespace)
            .body(createLeaderboardBody)
            .build());
```

### Get a leaderboard

```java
final ModelsGetLeaderboardConfigResp getLeaderboardResult =
    leaderboardConfigWrapper.getLeaderboardConfigurationAdminV1(
        GetLeaderboardConfigurationAdminV1.builder()
            .namespace(this.namespace)
            .leaderboardCode(leaderboardCode)
            .build());
```

### Update a leaderboard

```java
final ModelsUpdateLeaderboardConfigReq updateLeaderboardBody =
    ModelsUpdateLeaderboardConfigReq.builder()
        .name(leaderboardName)
        .statCode(leaderboardCode)
        .startTime(startTime)
        .seasonPeriod(40)
        .build();

final ModelsGetLeaderboardConfigResp updateLeaderboardResult =
    leaderboardConfigWrapper.updateLeaderboardConfigurationAdminV1(
        UpdateLeaderboardConfigurationAdminV1.builder()
            .namespace(this.namespace)
            .leaderboardCode(leaderboardCode)
            .body(updateLeaderboardBody)
            .build());
```

### Delete a leaderboard

```java
leaderboardConfigWrapper.deleteLeaderboardConfigurationAdminV1(
    DeleteLeaderboardConfigurationAdminV1.builder()
        .namespace(this.namespace)
        .leaderboardCode(leaderboardCode)
        .build());
```
## Legal

Source: [TestIntegrationServiceLegal.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceLegal.java)

### Get agreements

```java
final List<RetrieveAcceptedAgreementResponse> agreements =
    agreementWrapper.retrieveAgreementsPublic(RetrieveAgreementsPublic.builder().build());
```
## Lobby

Source: [TestIntegrationServiceLobby.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceLobby.java)

### Sending a free from notification to users

```java
final ModelFreeFormNotificationRequest notifBody =
    ModelFreeFormNotificationRequest.builder().topic(topic).message(message).build();

adminWrapper.freeFormNotification(
    FreeFormNotification.builder().namespace(this.namespace).body(notifBody).build());
```
## LoginQueue

Source: [TestIntegrationServiceLoginQueue.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceLoginQueue.java)

### Get configuration

```java
final ApimodelsConfigurationResponse config =
    wrapper.adminGetConfiguration(AdminGetConfiguration.builder().namespace(namespace).build());
```

### Update configuration

```java
final ApimodelsConfigurationResponse configUpdate =
    wrapper.adminUpdateConfiguration(
        AdminUpdateConfiguration.builder()
            .namespace(namespace)
            .body(ApimodelsConfigurationRequest.builder().maxLoginRate(maxLoginRate).build())
            .build());
```
## MatchmakingV2

Source: [TestIntegrationServiceMatch2.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceMatch2.java)

### Create a match rule set

```java
ruleSetsWrapper.createRuleSet(
    CreateRuleSet.builder()
        .namespace(namespace)
        .body(ApiRuleSetPayload.builder().name(rulesetName).data(rulesetData).build())
        .build());
```

### Get a match rule set

```java
final ApiRuleSetPayload ruleSetDetailsResult =
    ruleSetsWrapper.ruleSetDetails(
        RuleSetDetails.builder().namespace(namespace).ruleset(rulesetName).build());
```

### Create a match pool

```java
matchPoolsWrapper.createMatchPool(
    CreateMatchPool.builder()
        .namespace(namespace)
        .body(
            ApiMatchPool.builder()
                .name(poolName)
                .matchFunction("basic")
                .sessionTemplate(cfgTemplateName)
                .backfillTicketExpirationSeconds(600)
                .ruleSet(rulesetName)
                .ticketExpirationSeconds(600)
                .build())
        .build());
```

### List match pools

```java
final ApiListMatchPoolsResponse matchPoolListResult =
    matchPoolsWrapper.matchPoolList(MatchPoolList.builder().namespace(namespace).build());
```

### Player create a match ticket

```java
final ApiMatchTicketResponse createMatchTicketResult =
    player1MatchTicketWrapper.createMatchTicket(
        CreateMatchTicket.builder()
            .namespace(namespace)
            .body(
                ApiMatchTicketRequest.builder()
                    .matchPool(poolName)
                    .sessionID(partySessionId)
                    .build())
            .build());
```

### Player delete a match ticket

```java
player1MatchTicketWrapper.deleteMatchTicket(
    DeleteMatchTicket.builder().namespace(namespace).ticketid(ticketId).build());
```

### Delete a match pool

```java
matchPoolsWrapper.deleteMatchPool(
    DeleteMatchPool.builder().namespace(namespace).pool(poolName).build());
```

### Delete a match rule set

```java
ruleSetsWrapper.deleteRuleSet(
    DeleteRuleSet.builder().namespace(namespace).ruleset(rulesetName).build());
```
## Platform

Source: [TestIntegrationServicePlatform.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServicePlatform.java)

### Create a store

```java
final StoreCreate createStoreBody =
    StoreCreate.builder()
        .title(storeTitle)
        .description(storeDescription)
        .defaultLanguage("en")
        .defaultRegion("US")
        .supportedLanguages(Arrays.asList(new String[] {"en", "id"}))
        .supportedRegions(Arrays.asList(new String[] {"US", "ID"}))
        .build();

final StoreInfo createStoreResult =
    storeWrapper.createStore(
        CreateStore.builder().namespace(this.namespace).body(createStoreBody).build());
```

### Get a store

```java
final StoreInfo getStoreBody =
    storeWrapper.getStore(
        GetStore.builder().namespace(this.namespace).storeId(storeId).build());
```

### Update a store

```java
final StoreUpdate updateStoreBody =
    StoreUpdate.builder().description(storeDescriptionUpdate).build();

final StoreInfo updateStoreResult =
    storeWrapper.updateStore(
        UpdateStore.builder()
            .namespace(this.namespace)
            .storeId(storeId)
            .body(updateStoreBody)
            .build());
```

### Export a store

```java
final ExportStoreRequest exportStoreBody = ExportStoreRequest.builder().build();

final InputStream exportStoreResult =
    storeWrapper.exportStore1(
        ExportStore1.builder()
            .namespace(namespace)
            .storeId(storeId)
            .body(exportStoreBody)
            .build());
java.nio.file.Files.copy(
    exportStoreResult,
    exportStoreFile.toPath(),
    java.nio.file.StandardCopyOption.REPLACE_EXISTING);
org.apache.commons.io.IOUtils.closeQuietly(exportStoreResult);
```

### Import a store

```java
final ImportStoreResult importStoreResult =
    storeWrapper.importStore1(
        ImportStore1.builder()
            .namespace(namespace)
            .storeId(storeId)
            .file(exportStoreFile)
            .build());
```

### Delete a store

```java
final StoreInfo deleteStoreResult =
    storeWrapper.deleteStore(
        DeleteStore.builder().namespace(this.namespace).storeId(storeId).build());
```

### Export rewards

```java
final InputStream exportRewardsResult =
    rewardWrapper.exportRewards(ExportRewards.builder().namespace(namespace).build());
java.nio.file.Files.copy(
    exportRewardsResult,
    exportRewardFile.toPath(),
    java.nio.file.StandardCopyOption.REPLACE_EXISTING);
org.apache.commons.io.IOUtils.closeQuietly(exportRewardsResult);
```
## Reporting

Source: [TestIntegrationServiceReporting.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceReporting.java)

### Create a reason

```java
final RestapiAdminReasonResponse createReasonResponse =
    adminReasonsWrapper.createReason(
        CreateReason.builder()
            .namespace(namespace)
            .body(
                RestapiCreateReasonRequest.builder()
                    .title(reasonTitle)
                    .description(reasonDescription)
                    .build())
            .build());
```

### Get a list of reasons

```java
final RestapiPublicReasonListResponse publicGetReasonResponse =
    wrapper.publicGetReasons(
        PublicGetReasons.builder().namespace(namespace).title(reasonTitle).build());
```

### Submit a report

```java
final RestapiSubmitReportResponse submitReportResponse =
    publicReportsWrapper.submitReport(
        SubmitReport.builder()
            .namespace(namespace)
            .body(
                RestapiSubmitReportRequest.builder()
                    .categoryFromEnum(Category.UGC)
                    .reason(reasonTitle)
                    .userId(player2UserId)
                    .objectId(UUID.randomUUID().toString().replace("-", ""))
                    .objectType(UUID.randomUUID().toString().replace("-", ""))
                    .build())
            .build());
```

### Delete a reason

```java
adminReasonsWrapper.deleteReason(
    DeleteReason.builder().namespace(namespace).reasonId(reasonId).build());
```
## SeasonPass

Source: [TestIntegrationServiceSeasonPass.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceSeasonPass.java)

### Create season

```java
final net.accelbyte.sdk.api.seasonpass.models.Localization englishSPLocalName =
    net.accelbyte.sdk.api.seasonpass.models.Localization.builder()
        .title("English")
        .description("English")
        .build();

Map<String, net.accelbyte.sdk.api.seasonpass.models.Localization> mapSeasonLocals =
    new HashMap<>();

mapSeasonLocals.put("en", englishSPLocalName);

final LocalDateTime now = LocalDateTime.now();
final String seasonStart =
    now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
final String seasonEnd =
    now.plusDays(7).format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));

final SeasonCreate createSeasonBody =
    SeasonCreate.builder()
        .name(seasonName)
        .start(seasonStart)
        .end(seasonEnd)
        .defaultRequiredExp(100)
        .draftStoreId(selectedStore.getStoreId())
        .tierItemId(createItemResult.getItemId())
        .localizations(mapSeasonLocals)
        .defaultLanguage("en")
        .build();

final SeasonInfo createSeasonResult =
    seasonWrapper.createSeason(
        CreateSeason.builder().namespace(this.namespace).body(createSeasonBody).build());
```

### Get Season

```java
final SeasonInfo getSeasonResult =
    seasonWrapper.getSeason(
        GetSeason.builder()
            .namespace(this.namespace)
            .seasonId(createSeasonResult.getId())
            .build());
```

### Update season

```java
final SeasonUpdate updateSeasonBody = SeasonUpdate.builder().name(seasonNameUpdated).build();

final SeasonInfo updateSeasonResult =
    seasonWrapper.updateSeason(
        UpdateSeason.builder()
            .namespace(this.namespace)
            .seasonId(createSeasonResult.getId())
            .body(updateSeasonBody)
            .build());
```

### Delete Sseason

```java
seasonWrapper.deleteSeason(
    DeleteSeason.builder()
        .namespace(this.namespace)
        .seasonId(createSeasonResult.getId())
        .build());
```
## Session

Source: [TestIntegrationServiceSession.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceSession.java)

### Create session configuration template

```java
configurationTemplateWrapper.adminCreateConfigurationTemplateV1(
    AdminCreateConfigurationTemplateV1.builder()
        .namespace(namespace)
        .body(
            ApimodelsCreateConfigurationTemplateRequest.builder()
                .name(cfgTemplateName)
                .type("P2P")
                .minPlayers(2)
                .maxPlayers(2)
                .inviteTimeout(60)
                .inactiveTimeout(60)
                .joinability("OPEN")
                .clientVersion("1.0.0")
                .requestedRegions(Collections.singletonList("us-west-2"))
                .build())
        .build());
```

### Get session configuration template

```java
final ApimodelsConfigurationTemplateResponse adminGetConfigurationTemplateResult =
    configurationTemplateWrapper.adminGetConfigurationTemplateV1(
        AdminGetConfigurationTemplateV1.builder()
            .name(cfgTemplateName)
            .namespace(namespace)
            .build());
```

### Update session configuration template

```java
final ApimodelsConfigurationTemplateResponse adminUpdateConfigurationTemplateResult =
    configurationTemplateWrapper.adminUpdateConfigurationTemplateV1(
        AdminUpdateConfigurationTemplateV1.builder()
            .name(cfgTemplateName)
            .namespace(namespace)
            .body(
                ApimodelsUpdateConfigurationTemplateRequest.builder()
                    .name(cfgTemplateName)
                    .type("P2P")
                    .joinability("OPEN")
                    .maxPlayers(4)
                    .build())
            .build());
```

### Delete session configuration template

```java
configurationTemplateWrapper.adminDeleteConfigurationTemplateV1(
    AdminDeleteConfigurationTemplateV1.builder()
        .namespace(namespace)
        .name(cfgTemplateName)
        .build());
```

### Create a game session

```java
final ApimodelsGameSessionResponse createGameSessionResult =
    player1GameSessionWrapper.createGameSession(
        CreateGameSession.builder()
            .namespace(namespace)
            .body(
                ApimodelsCreateGameSessionRequest.builder()
                    .configurationName(cfgTemplateName)
                    .build())
            .build());
```

### Join a game session

```java
final ApimodelsGameSessionResponse joinGameSessionResult =
    player2GameSessionWrapper.joinGameSession(
        JoinGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());

assertNotNull(joinGameSessionResult);
```

### Get game session

```java
final ApimodelsGameSessionResponse getGameSessionResult =
    gameSessionWrapper.getGameSession(
        net.accelbyte.sdk.api.session.operations.game_session.GetGameSession.builder()
            .namespace(namespace)
            .sessionId(gameSessionId)
            .build());
```

### Leave game session

```java
player2GameSessionWrapper.leaveGameSession(
    LeaveGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());
```

### Delete game session

```java
player1GameSessionWrapper.deleteGameSession(
    DeleteGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());
```

### User create a party

```java
final ApimodelsPartySessionResponse publicCreatePartyResult =
    player1PartyWrapper.publicCreateParty(
        net.accelbyte.sdk.api.session.operations.party.PublicCreateParty.builder()
            .namespace(namespace)
            .body(
                ApimodelsCreatePartyRequest.builder()
                    .configurationName(cfgTemplateName)
                    .members(
                        Collections.singletonList(
                            ApimodelsRequestMember.builder().id(player1UserId).build()))
                    .build())
            .build());
```

### User join a party with code

```java
final ApimodelsPartySessionResponse publicPartyJoinCodeResult =
    player2PartyWrapper.publicPartyJoinCode(
        PublicPartyJoinCode.builder()
            .namespace(namespace)
            .body(ApimodelsJoinByCodeRequest.builder().code(joinCode).build())
            .build());
```

### Get party detail

```java
final ApimodelsPartySessionResponse publicGetPartyResult1 =
    partyWrapper.publicGetParty(
        PublicGetParty.builder().namespace(namespace).partyId(partyId).build());
```

### User leave a party

```java
player2PartyWrapper.publicPartyLeave(
    net.accelbyte.sdk.api.session.operations.party.PublicPartyLeave.builder()
        .namespace(namespace)
        .partyId(partyId)
        .build());
```
## Social

Source: [TestIntegrationServiceSocial.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceSocial.java)

### Create a statistic

```java
final StatCreate createStatBody =
    StatCreate.builder()
        .name(statName)
        .description(statDescription)
        .statCode(statCode)
        .setByFromEnum(StatCreate.SetBy.SERVER)
        .minimum(0f)
        .maximum(100f)
        .defaultValue(50f)
        .incrementOnly(true)
        .setAsGlobal(false)
        .tags(statTags)
        .build();

final StatInfo createStatResult =
    statConfigWrapper.createStat(
        CreateStat.builder().namespace(this.namespace).body(createStatBody).build());
```

### Get a statistic

```java
final StatInfo getStatResult =
    statConfigWrapper.getStat(
        GetStat.builder().namespace(this.namespace).statCode(statCode).build());

assertNotNull(getStatResult);
assertEquals(statName, getStatResult.getName());
```

### Update a statistic

```java
final StatUpdate updateStat = StatUpdate.builder().description(statDescriptionUpdated).build();

final StatInfo updateStatResult =
    statConfigWrapper.updateStat(
        UpdateStat.builder()
            .namespace(this.namespace)
            .statCode(statCode)
            .body(updateStat)
            .build());
```

### Export statistics

```java
final InputStream exportStatsResult =
    statConfigWrapper.exportStats(ExportStats.builder().namespace(namespace).build());
java.nio.file.Files.copy(
    exportStatsResult,
    exportStatsFile.toPath(),
    java.nio.file.StandardCopyOption.REPLACE_EXISTING);
org.apache.commons.io.IOUtils.closeQuietly(exportStatsResult);
```

### Delete a statistic

```java
statConfigWrapper.deleteStat(
    DeleteStat.builder().namespace(this.namespace).statCode(statCode).build());
```

### Create user stat item

```java
userStatisticWrapper.createUserStatItem(
    CreateUserStatItem.builder()
        .namespace(this.namespace)
        .userId(userId)
        .statCode(statCode)
        .build());
```

### Get user stat items

```java
final UserStatItemPagingSlicedResult getUserStatItemsResult =
    userStatisticWrapper.getUserStatItems(
        GetUserStatItems.builder()
            .namespace(this.namespace)
            .userId(userId)
            .statCodes(statCode)
            .offset(0)
            .limit(10)
            .build());
```

### Update user stat item value

```java
final StatItemIncResult incUserStatItemValueResult =
    userStatisticWrapper.incUserStatItemValue(
        IncUserStatItemValue.builder()
            .namespace(this.namespace)
            .userId(userId)
            .statCode(statCode)
            .body(StatItemInc.builder().inc(5f).build())
            .build());
```

### Delete user stat item

```java
userStatisticWrapper.deleteUserStatItems(
    DeleteUserStatItems.builder()
        .namespace(this.namespace)
        .userId(userId)
        .statCode(statCode)
        .build());
```
## UGC

Source: [TestIntegrationServiceUgc.java](../src/test/java/net/accelbyte/sdk/integration/TestIntegrationServiceUgc.java)

### Create a tag

```java
final ModelsCreateTagRequest createTagBody =
    ModelsCreateTagRequest.builder().tag(tagName).build();

final ModelsCreateTagResponse createTagResult =
    adminTagWrapper.adminCreateTag(
        AdminCreateTag.builder().namespace(this.namespace).body(createTagBody).build());
```

### Get tags

```java
final ModelsPaginatedGetTagResponse getTagResult =
    adminTagWrapper.adminGetTag(
        AdminGetTag.builder().namespace(this.namespace).offset(0).limit(10).build());
```

### Update a tag

```java
final ModelsCreateTagRequest updateTag =
    ModelsCreateTagRequest.builder().tag(tagNameUpdate).build();

final ModelsCreateTagResponse updateTagResult =
    adminTagWrapper.adminUpdateTag(
        AdminUpdateTag.builder()
            .namespace(this.namespace)
            .tagId(tagId)
            .body(updateTag)
            .build());
```

### Delete a tag

```java
adminTagWrapper.adminDeleteTag(
    AdminDeleteTag.builder().namespace(this.namespace).tagId(tagId).build());
```

