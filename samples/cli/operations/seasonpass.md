## Java Extend SDK CLI Sample App Operation Index for Seasonpass service

### Operation ExportSeason

```sh
$ build/install/cli/bin/cli seasonpass exportSeason \
    --namespace <namespace value>
```

### Operation QuerySeasons

```sh
$ build/install/cli/bin/cli seasonpass querySeasons \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional>
```

### Operation CreateSeason

```sh
$ build/install/cli/bin/cli seasonpass createSeason \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetCurrentSeason

```sh
$ build/install/cli/bin/cli seasonpass getCurrentSeason \
    --namespace <namespace value>
```

### Operation BulkGetUserSeasonProgression

```sh
$ build/install/cli/bin/cli seasonpass bulkGetUserSeasonProgression \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetItemReferences

```sh
$ build/install/cli/bin/cli seasonpass getItemReferences \
    --namespace <namespace value> \
    --itemId <itemId value>
```

### Operation GetSeason

```sh
$ build/install/cli/bin/cli seasonpass getSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation DeleteSeason

```sh
$ build/install/cli/bin/cli seasonpass deleteSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation UpdateSeason

```sh
$ build/install/cli/bin/cli seasonpass updateSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation CloneSeason

```sh
$ build/install/cli/bin/cli seasonpass cloneSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation GetFullSeason

```sh
$ build/install/cli/bin/cli seasonpass getFullSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation QueryPasses

```sh
$ build/install/cli/bin/cli seasonpass queryPasses \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation CreatePass

```sh
$ build/install/cli/bin/cli seasonpass createPass \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation GetPass

```sh
$ build/install/cli/bin/cli seasonpass getPass \
    --code <code value> \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation DeletePass

```sh
$ build/install/cli/bin/cli seasonpass deletePass \
    --code <code value> \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation UpdatePass

```sh
$ build/install/cli/bin/cli seasonpass updatePass \
    --code <code value> \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation PublishSeason

```sh
$ build/install/cli/bin/cli seasonpass publishSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation RetireSeason

```sh
$ build/install/cli/bin/cli seasonpass retireSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --force <force value - optional>
```

### Operation QueryRewards

```sh
$ build/install/cli/bin/cli seasonpass queryRewards \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --q <q value - optional>
```

### Operation CreateReward

```sh
$ build/install/cli/bin/cli seasonpass createReward \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation GetReward

```sh
$ build/install/cli/bin/cli seasonpass getReward \
    --code <code value> \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation DeleteReward

```sh
$ build/install/cli/bin/cli seasonpass deleteReward \
    --code <code value> \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation UpdateReward

```sh
$ build/install/cli/bin/cli seasonpass updateReward \
    --code <code value> \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation QueryTiers

```sh
$ build/install/cli/bin/cli seasonpass queryTiers \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateTier

```sh
$ build/install/cli/bin/cli seasonpass createTier \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation UpdateTier

```sh
$ build/install/cli/bin/cli seasonpass updateTier \
    --id <id value> \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation DeleteTier

```sh
$ build/install/cli/bin/cli seasonpass deleteTier \
    --id <id value> \
    --namespace <namespace value> \
    --seasonId <seasonId value>
```

### Operation ReorderTier

```sh
$ build/install/cli/bin/cli seasonpass reorderTier \
    --id <id value> \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --body <json string for request body>
```

### Operation UnpublishSeason

```sh
$ build/install/cli/bin/cli seasonpass unpublishSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --force <force value - optional>
```

### Operation GetUserParticipatedSeasons

```sh
$ build/install/cli/bin/cli seasonpass getUserParticipatedSeasons \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GrantUserExp

```sh
$ build/install/cli/bin/cli seasonpass grantUserExp \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GrantUserPass

```sh
$ build/install/cli/bin/cli seasonpass grantUserPass \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ExistsAnyPassByPassCodes

```sh
$ build/install/cli/bin/cli seasonpass existsAnyPassByPassCodes \
    --namespace <namespace value> \
    --userId <userId value> \
    --passCodes <passCodes value - optional>
```

### Operation GetCurrentUserSeasonProgression

```sh
$ build/install/cli/bin/cli seasonpass getCurrentUserSeasonProgression \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation CheckSeasonPurchasable

```sh
$ build/install/cli/bin/cli seasonpass checkSeasonPurchasable \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ResetUserSeason

```sh
$ build/install/cli/bin/cli seasonpass resetUserSeason \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GrantUserTier

```sh
$ build/install/cli/bin/cli seasonpass grantUserTier \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation QueryUserExpGrantHistory

```sh
$ build/install/cli/bin/cli seasonpass queryUserExpGrantHistory \
    --namespace <namespace value> \
    --userId <userId value> \
    --from <from value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --seasonId <seasonId value - optional> \
    --source <source value - optional> \
    --tags <tags value - optional> \
    --to <to value - optional>
```

### Operation QueryUserExpGrantHistoryTag

```sh
$ build/install/cli/bin/cli seasonpass queryUserExpGrantHistoryTag \
    --namespace <namespace value> \
    --userId <userId value> \
    --seasonId <seasonId value - optional>
```

### Operation GetUserSeason

```sh
$ build/install/cli/bin/cli seasonpass getUserSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --userId <userId value>
```

### Operation PublicGetCurrentSeason

```sh
$ build/install/cli/bin/cli seasonpass publicGetCurrentSeason \
    --namespace <namespace value> \
    --language <language value - optional>
```

### Operation PublicGetCurrentUserSeason

```sh
$ build/install/cli/bin/cli seasonpass publicGetCurrentUserSeason \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicClaimUserReward

```sh
$ build/install/cli/bin/cli seasonpass publicClaimUserReward \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicBulkClaimUserRewards

```sh
$ build/install/cli/bin/cli seasonpass publicBulkClaimUserRewards \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicGetUserSeason

```sh
$ build/install/cli/bin/cli seasonpass publicGetUserSeason \
    --namespace <namespace value> \
    --seasonId <seasonId value> \
    --userId <userId value>
```

