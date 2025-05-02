## Java Extend SDK CLI Sample App Operation Index for Achievement service

### Operation AdminListAchievements

```sh
$ build/install/cli/bin/cli achievement adminListAchievements \
    --namespace <namespace value> \
    --global <global value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation AdminCreateNewAchievement

```sh
$ build/install/cli/bin/cli achievement adminCreateNewAchievement \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ExportAchievements

```sh
$ build/install/cli/bin/cli achievement exportAchievements \
    --namespace <namespace value> \
    --tags <tags value - optional>
```

### Operation ImportAchievements

```sh
$ build/install/cli/bin/cli achievement importAchievements \
    --namespace <namespace value> \
    --file <file value - optional> \
    --strategy <strategy value - optional>
```

### Operation AdminGetAchievement

```sh
$ build/install/cli/bin/cli achievement adminGetAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value>
```

### Operation AdminUpdateAchievement

```sh
$ build/install/cli/bin/cli achievement adminUpdateAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteAchievement

```sh
$ build/install/cli/bin/cli achievement adminDeleteAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value>
```

### Operation AdminUpdateAchievementListOrder

```sh
$ build/install/cli/bin/cli achievement adminUpdateAchievementListOrder \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListGlobalAchievements

```sh
$ build/install/cli/bin/cli achievement adminListGlobalAchievements \
    --namespace <namespace value> \
    --achievementCodes <achievementCodes value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional> \
    --tags <tags value - optional>
```

### Operation AdminListGlobalAchievementContributors

```sh
$ build/install/cli/bin/cli achievement adminListGlobalAchievementContributors \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation ResetGlobalAchievement

```sh
$ build/install/cli/bin/cli achievement resetGlobalAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value>
```

### Operation BulkCreatePSNEvent

```sh
$ build/install/cli/bin/cli achievement bulkCreatePSNEvent \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListTags

```sh
$ build/install/cli/bin/cli achievement adminListTags \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminListUserAchievements

```sh
$ build/install/cli/bin/cli achievement adminListUserAchievements \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --preferUnlocked <preferUnlocked value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation AdminBulkUnlockAchievement

```sh
$ build/install/cli/bin/cli achievement adminBulkUnlockAchievement \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminResetAchievement

```sh
$ build/install/cli/bin/cli achievement adminResetAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUnlockAchievement

```sh
$ build/install/cli/bin/cli achievement adminUnlockAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminAnonymizeUserAchievement

```sh
$ build/install/cli/bin/cli achievement adminAnonymizeUserAchievement \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminListUserContributions

```sh
$ build/install/cli/bin/cli achievement adminListUserContributions \
    --namespace <namespace value> \
    --userId <userId value> \
    --achievementCodes <achievementCodes value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation PublicListAchievements

```sh
$ build/install/cli/bin/cli achievement publicListAchievements \
    --namespace <namespace value> \
    --global <global value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional> \
    --language <language value>
```

### Operation PublicGetAchievement

```sh
$ build/install/cli/bin/cli achievement publicGetAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --language <language value>
```

### Operation PublicListGlobalAchievements

```sh
$ build/install/cli/bin/cli achievement publicListGlobalAchievements \
    --namespace <namespace value> \
    --achievementCodes <achievementCodes value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional> \
    --tags <tags value - optional>
```

### Operation ListGlobalAchievementContributors

```sh
$ build/install/cli/bin/cli achievement listGlobalAchievementContributors \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicListTags

```sh
$ build/install/cli/bin/cli achievement publicListTags \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicListUserAchievements

```sh
$ build/install/cli/bin/cli achievement publicListUserAchievements \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --preferUnlocked <preferUnlocked value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation PublicBulkUnlockAchievement

```sh
$ build/install/cli/bin/cli achievement publicBulkUnlockAchievement \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicUnlockAchievement

```sh
$ build/install/cli/bin/cli achievement publicUnlockAchievement \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation ListUserContributions

```sh
$ build/install/cli/bin/cli achievement listUserContributions \
    --namespace <namespace value> \
    --userId <userId value> \
    --achievementCodes <achievementCodes value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation ClaimGlobalAchievementReward

```sh
$ build/install/cli/bin/cli achievement claimGlobalAchievementReward \
    --achievementCode <achievementCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

