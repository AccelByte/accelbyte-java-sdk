## Java Extend SDK CLI Sample App Operation Index for Challenge service

### Operation AdminGetChallenges

```sh
$ build/install/cli/bin/cli challenge adminGetChallenges \
    --namespace <namespace value> \
    --keyword <keyword value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional> \
    --tags <tags value - optional>
```

### Operation AdminCreateChallenge

```sh
$ build/install/cli/bin/cli challenge adminCreateChallenge \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetItemReferences

```sh
$ build/install/cli/bin/cli challenge adminGetItemReferences \
    --namespace <namespace value> \
    --itemId <itemId value>
```

### Operation AdminGetActiveChallenges

```sh
$ build/install/cli/bin/cli challenge adminGetActiveChallenges \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminGetChallenge

```sh
$ build/install/cli/bin/cli challenge adminGetChallenge \
    --challengeCode <challengeCode value> \
    --namespace <namespace value>
```

### Operation AdminUpdateChallenge

```sh
$ build/install/cli/bin/cli challenge adminUpdateChallenge \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteChallenge

```sh
$ build/install/cli/bin/cli challenge adminDeleteChallenge \
    --challengeCode <challengeCode value> \
    --namespace <namespace value>
```

### Operation AdminGetGoals

```sh
$ build/install/cli/bin/cli challenge adminGetGoals \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation AdminCreateGoal

```sh
$ build/install/cli/bin/cli challenge adminCreateGoal \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetGoal

```sh
$ build/install/cli/bin/cli challenge adminGetGoal \
    --challengeCode <challengeCode value> \
    --code <code value> \
    --namespace <namespace value>
```

### Operation AdminUpdateGoals

```sh
$ build/install/cli/bin/cli challenge adminUpdateGoals \
    --challengeCode <challengeCode value> \
    --code <code value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteGoal

```sh
$ build/install/cli/bin/cli challenge adminDeleteGoal \
    --challengeCode <challengeCode value> \
    --code <code value> \
    --namespace <namespace value>
```

### Operation AdminListSchedulesByGoal

```sh
$ build/install/cli/bin/cli challenge adminListSchedulesByGoal \
    --challengeCode <challengeCode value> \
    --code <code value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --userId <userId value - optional>
```

### Operation AdminGetPeriods

```sh
$ build/install/cli/bin/cli challenge adminGetPeriods \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminRandomizeChallenge

```sh
$ build/install/cli/bin/cli challenge adminRandomizeChallenge \
    --challengeCode <challengeCode value> \
    --namespace <namespace value>
```

### Operation AdminListSchedules

```sh
$ build/install/cli/bin/cli challenge adminListSchedules \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --dateTime <dateTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --userId <userId value - optional>
```

### Operation AdminDeleteTiedChallenge

```sh
$ build/install/cli/bin/cli challenge adminDeleteTiedChallenge \
    --challengeCode <challengeCode value> \
    --namespace <namespace value>
```

### Operation AdminUpdateTiedChallengeSchedule

```sh
$ build/install/cli/bin/cli challenge adminUpdateTiedChallengeSchedule \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetAssignmentPlugin

```sh
$ build/install/cli/bin/cli challenge adminGetAssignmentPlugin \
    --namespace <namespace value>
```

### Operation AdminUpdateAssignmentPlugin

```sh
$ build/install/cli/bin/cli challenge adminUpdateAssignmentPlugin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCreateAssignmentPlugin

```sh
$ build/install/cli/bin/cli challenge adminCreateAssignmentPlugin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteAssignmentPlugin

```sh
$ build/install/cli/bin/cli challenge adminDeleteAssignmentPlugin \
    --namespace <namespace value>
```

### Operation AdminEvaluateProgress

```sh
$ build/install/cli/bin/cli challenge adminEvaluateProgress \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminClaimUsersRewards

```sh
$ build/install/cli/bin/cli challenge adminClaimUsersRewards \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminClaimUserRewardsByGoalCode

```sh
$ build/install/cli/bin/cli challenge adminClaimUserRewardsByGoalCode \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetUserProgression

```sh
$ build/install/cli/bin/cli challenge adminGetUserProgression \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --dateTime <dateTime value - optional> \
    --goalCode <goalCode value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --tags <tags value - optional>
```

### Operation AdminGetUserRewards

```sh
$ build/install/cli/bin/cli challenge adminGetUserRewards \
    --namespace <namespace value> \
    --userId <userId value> \
    --challengeCode <challengeCode value - optional> \
    --goalProgressionId <goalProgressionId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation AdminClaimUserRewards

```sh
$ build/install/cli/bin/cli challenge adminClaimUserRewards \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetChallenges

```sh
$ build/install/cli/bin/cli challenge getChallenges \
    --namespace <namespace value> \
    --keyword <keyword value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional> \
    --tags <tags value - optional>
```

### Operation PublicGetScheduledGoals

```sh
$ build/install/cli/bin/cli challenge publicGetScheduledGoals \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --tags <tags value - optional>
```

### Operation PublicListSchedulesByGoal

```sh
$ build/install/cli/bin/cli challenge publicListSchedulesByGoal \
    --challengeCode <challengeCode value> \
    --code <code value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicListSchedules

```sh
$ build/install/cli/bin/cli challenge publicListSchedules \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --dateTime <dateTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicClaimUserRewardsByGoalCode

```sh
$ build/install/cli/bin/cli challenge publicClaimUserRewardsByGoalCode \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation EvaluateMyProgress

```sh
$ build/install/cli/bin/cli challenge evaluateMyProgress \
    --namespace <namespace value>
```

### Operation PublicGetUserProgression

```sh
$ build/install/cli/bin/cli challenge publicGetUserProgression \
    --challengeCode <challengeCode value> \
    --namespace <namespace value> \
    --dateTime <dateTime value - optional> \
    --goalCode <goalCode value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --tags <tags value - optional>
```

### Operation PublicGetPastUserProgression

```sh
$ build/install/cli/bin/cli challenge publicGetPastUserProgression \
    --challengeCode <challengeCode value> \
    --index <index value> \
    --namespace <namespace value> \
    --goalCode <goalCode value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --tags <tags value - optional>
```

### Operation PublicGetUserRewards

```sh
$ build/install/cli/bin/cli challenge publicGetUserRewards \
    --namespace <namespace value> \
    --challengeCode <challengeCode value - optional> \
    --goalProgressionId <goalProgressionId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation PublicClaimUserRewards

```sh
$ build/install/cli/bin/cli challenge publicClaimUserRewards \
    --namespace <namespace value> \
    --body <json string for request body>
```

