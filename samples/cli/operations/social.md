## Java Extend SDK CLI Sample App Operation Index for Social service

### Operation GetGlobalStatItems

```sh
$ build/install/cli/bin/cli social getGlobalStatItems \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --statCodes <statCodes value - optional>
```

### Operation GetGlobalStatItemByStatCode

```sh
$ build/install/cli/bin/cli social getGlobalStatItemByStatCode \
    --namespace <namespace value> \
    --statCode <statCode value>
```

### Operation GetStatCycles

```sh
$ build/install/cli/bin/cli social getStatCycles \
    --namespace <namespace value> \
    --cycleType <cycleType value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation CreateStatCycle

```sh
$ build/install/cli/bin/cli social createStatCycle \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkGetStatCycle

```sh
$ build/install/cli/bin/cli social bulkGetStatCycle \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ExportStatCycle

```sh
$ build/install/cli/bin/cli social exportStatCycle \
    --namespace <namespace value>
```

### Operation ImportStatCycle

```sh
$ build/install/cli/bin/cli social importStatCycle \
    --namespace <namespace value> \
    --replaceExisting <replaceExisting value - optional> \
    --file <file value - optional>
```

### Operation GetStatCycle

```sh
$ build/install/cli/bin/cli social getStatCycle \
    --cycleId <cycleId value> \
    --namespace <namespace value>
```

### Operation UpdateStatCycle

```sh
$ build/install/cli/bin/cli social updateStatCycle \
    --cycleId <cycleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteStatCycle

```sh
$ build/install/cli/bin/cli social deleteStatCycle \
    --cycleId <cycleId value> \
    --namespace <namespace value>
```

### Operation BulkAddStats

```sh
$ build/install/cli/bin/cli social bulkAddStats \
    --cycleId <cycleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation StopStatCycle

```sh
$ build/install/cli/bin/cli social stopStatCycle \
    --cycleId <cycleId value> \
    --namespace <namespace value>
```

### Operation BulkFetchStatItems

```sh
$ build/install/cli/bin/cli social bulkFetchStatItems \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userIds <userIds value>
```

### Operation BulkIncUserStatItem

```sh
$ build/install/cli/bin/cli social bulkIncUserStatItem \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkIncUserStatItemValue

```sh
$ build/install/cli/bin/cli social bulkIncUserStatItemValue \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkFetchOrDefaultStatItems

```sh
$ build/install/cli/bin/cli social bulkFetchOrDefaultStatItems \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userIds <userIds value>
```

### Operation BulkResetUserStatItem

```sh
$ build/install/cli/bin/cli social bulkResetUserStatItem \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetStats

```sh
$ build/install/cli/bin/cli social getStats \
    --namespace <namespace value> \
    --cycleIds <cycleIds value - optional> \
    --isGlobal <isGlobal value - optional> \
    --isPublic <isPublic value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateStat

```sh
$ build/install/cli/bin/cli social createStat \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ExportStats

```sh
$ build/install/cli/bin/cli social exportStats \
    --namespace <namespace value>
```

### Operation ImportStats

```sh
$ build/install/cli/bin/cli social importStats \
    --namespace <namespace value> \
    --replaceExisting <replaceExisting value - optional> \
    --file <file value - optional>
```

### Operation QueryStats

```sh
$ build/install/cli/bin/cli social queryStats \
    --namespace <namespace value> \
    --isGlobal <isGlobal value - optional> \
    --isPublic <isPublic value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --keyword <keyword value>
```

### Operation GetStat

```sh
$ build/install/cli/bin/cli social getStat \
    --namespace <namespace value> \
    --statCode <statCode value>
```

### Operation DeleteStat

```sh
$ build/install/cli/bin/cli social deleteStat \
    --namespace <namespace value> \
    --statCode <statCode value>
```

### Operation UpdateStat

```sh
$ build/install/cli/bin/cli social updateStat \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --body <json string for request body>
```

### Operation GetStatItems

```sh
$ build/install/cli/bin/cli social getStatItems \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation DeleteTiedStat

```sh
$ build/install/cli/bin/cli social deleteTiedStat \
    --namespace <namespace value> \
    --statCode <statCode value>
```

### Operation GetUserStatCycleItems

```sh
$ build/install/cli/bin/cli social getUserStatCycleItems \
    --cycleId <cycleId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --isPublic <isPublic value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --statCodes <statCodes value - optional>
```

### Operation GetUserStatItems

```sh
$ build/install/cli/bin/cli social getUserStatItems \
    --namespace <namespace value> \
    --userId <userId value> \
    --isPublic <isPublic value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation BulkCreateUserStatItems

```sh
$ build/install/cli/bin/cli social bulkCreateUserStatItems \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkIncUserStatItem1

```sh
$ build/install/cli/bin/cli social bulkIncUserStatItem1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkIncUserStatItemValue1

```sh
$ build/install/cli/bin/cli social bulkIncUserStatItemValue1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkResetUserStatItem1

```sh
$ build/install/cli/bin/cli social bulkResetUserStatItem1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation CreateUserStatItem

```sh
$ build/install/cli/bin/cli social createUserStatItem \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value>
```

### Operation DeleteUserStatItems

```sh
$ build/install/cli/bin/cli social deleteUserStatItems \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value>
```

### Operation IncUserStatItemValue

```sh
$ build/install/cli/bin/cli social incUserStatItemValue \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ResetUserStatItemValue

```sh
$ build/install/cli/bin/cli social resetUserStatItemValue \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

### Operation GetGlobalStatItems1

```sh
$ build/install/cli/bin/cli social getGlobalStatItems1 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --statCodes <statCodes value - optional>
```

### Operation GetGlobalStatItemByStatCode1

```sh
$ build/install/cli/bin/cli social getGlobalStatItemByStatCode1 \
    --namespace <namespace value> \
    --statCode <statCode value>
```

### Operation GetStatCycles1

```sh
$ build/install/cli/bin/cli social getStatCycles1 \
    --namespace <namespace value> \
    --cycleType <cycleType value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation BulkGetStatCycle1

```sh
$ build/install/cli/bin/cli social bulkGetStatCycle1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetStatCycle1

```sh
$ build/install/cli/bin/cli social getStatCycle1 \
    --cycleId <cycleId value> \
    --namespace <namespace value>
```

### Operation BulkFetchStatItems1

```sh
$ build/install/cli/bin/cli social bulkFetchStatItems1 \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userIds <userIds value>
```

### Operation PublicBulkIncUserStatItem

```sh
$ build/install/cli/bin/cli social publicBulkIncUserStatItem \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicBulkIncUserStatItemValue

```sh
$ build/install/cli/bin/cli social publicBulkIncUserStatItemValue \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkResetUserStatItem2

```sh
$ build/install/cli/bin/cli social bulkResetUserStatItem2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateStat1

```sh
$ build/install/cli/bin/cli social createStat1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicListMyStatCycleItems

```sh
$ build/install/cli/bin/cli social publicListMyStatCycleItems \
    --cycleId <cycleId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --statCodes <statCodes value - optional>
```

### Operation PublicListMyStatItems

```sh
$ build/install/cli/bin/cli social publicListMyStatItems \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation PublicListAllMyStatItems

```sh
$ build/install/cli/bin/cli social publicListAllMyStatItems \
    --namespace <namespace value> \
    --additionalKey <additionalKey value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation GetUserStatCycleItems1

```sh
$ build/install/cli/bin/cli social getUserStatCycleItems1 \
    --cycleId <cycleId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --statCodes <statCodes value - optional>
```

### Operation PublicQueryUserStatItems1

```sh
$ build/install/cli/bin/cli social publicQueryUserStatItems1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation PublicBulkCreateUserStatItems

```sh
$ build/install/cli/bin/cli social publicBulkCreateUserStatItems \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicQueryUserStatItems

```sh
$ build/install/cli/bin/cli social publicQueryUserStatItems \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation PublicBulkIncUserStatItem1

```sh
$ build/install/cli/bin/cli social publicBulkIncUserStatItem1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkIncUserStatItemValue2

```sh
$ build/install/cli/bin/cli social bulkIncUserStatItemValue2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkResetUserStatItem3

```sh
$ build/install/cli/bin/cli social bulkResetUserStatItem3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicCreateUserStatItem

```sh
$ build/install/cli/bin/cli social publicCreateUserStatItem \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value>
```

### Operation DeleteUserStatItems1

```sh
$ build/install/cli/bin/cli social deleteUserStatItems1 \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value>
```

### Operation PublicIncUserStatItem

```sh
$ build/install/cli/bin/cli social publicIncUserStatItem \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicIncUserStatItemValue

```sh
$ build/install/cli/bin/cli social publicIncUserStatItemValue \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ResetUserStatItemValue1

```sh
$ build/install/cli/bin/cli social resetUserStatItemValue1 \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value>
```

### Operation BulkUpdateUserStatItemV2

```sh
$ build/install/cli/bin/cli social bulkUpdateUserStatItemV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkFetchOrDefaultStatItems1

```sh
$ build/install/cli/bin/cli social bulkFetchOrDefaultStatItems1 \
    --namespace <namespace value> \
    --additionalKey <additionalKey value - optional> \
    --statCode <statCode value> \
    --userIds <userIds value>
```

### Operation AdminListUsersStatItems

```sh
$ build/install/cli/bin/cli social adminListUsersStatItems \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation BulkUpdateUserStatItem

```sh
$ build/install/cli/bin/cli social bulkUpdateUserStatItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

### Operation BulkGetOrDefaultByUserId

```sh
$ build/install/cli/bin/cli social bulkGetOrDefaultByUserId \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

### Operation BulkResetUserStatItemValues

```sh
$ build/install/cli/bin/cli social bulkResetUserStatItemValues \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

### Operation DeleteUserStatItems2

```sh
$ build/install/cli/bin/cli social deleteUserStatItems2 \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional>
```

### Operation UpdateUserStatItemValue

```sh
$ build/install/cli/bin/cli social updateUserStatItemValue \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

### Operation BulkUpdateUserStatItem1

```sh
$ build/install/cli/bin/cli social bulkUpdateUserStatItem1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicQueryUserStatItems2

```sh
$ build/install/cli/bin/cli social publicQueryUserStatItems2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --statCodes <statCodes value - optional> \
    --tags <tags value - optional>
```

### Operation BulkUpdateUserStatItem2

```sh
$ build/install/cli/bin/cli social bulkUpdateUserStatItem2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

### Operation UpdateUserStatItemValue1

```sh
$ build/install/cli/bin/cli social updateUserStatItemValue1 \
    --namespace <namespace value> \
    --statCode <statCode value> \
    --userId <userId value> \
    --additionalKey <additionalKey value - optional> \
    --body <json string for request body>
```

