# Challenge Service Index

&nbsp;  

## Operations

### Challenge Configuration Wrapper:  [ChallengeConfiguration](../../src/main/java/net/accelbyte/sdk/api/challenge/wrappers/ChallengeConfiguration.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/challenges` | GET | AdminGetChallenges | [AdminGetChallenges](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetChallenges.java) | [AdminGetChallenges](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetChallenges.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges` | POST | AdminCreateChallenge | [AdminCreateChallenge](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminCreateChallenge.java) | [AdminCreateChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminCreateChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}` | GET | AdminGetChallenge | [AdminGetChallenge](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetChallenge.java) | [AdminGetChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}` | PUT | AdminUpdateChallenge | [AdminUpdateChallenge](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminUpdateChallenge.java) | [AdminUpdateChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminUpdateChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}` | DELETE | AdminDeleteChallenge | [AdminDeleteChallenge](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminDeleteChallenge.java) | [AdminDeleteChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminDeleteChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/periods` | GET | AdminGetPeriods | [AdminGetPeriods](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetPeriods.java) | [AdminGetPeriods](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetPeriods.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/randomize` | POST | AdminRandomizeChallenge | [AdminRandomizeChallenge](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminRandomizeChallenge.java) | [AdminRandomizeChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminRandomizeChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/tied` | DELETE | AdminDeleteTiedChallenge | [AdminDeleteTiedChallenge](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminDeleteTiedChallenge.java) | [AdminDeleteTiedChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminDeleteTiedChallenge.java) |

### Goal Configuration Wrapper:  [GoalConfiguration](../../src/main/java/net/accelbyte/sdk/api/challenge/wrappers/GoalConfiguration.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals` | GET | AdminGetGoals | [AdminGetGoals](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminGetGoals.java) | [AdminGetGoals](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminGetGoals.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals` | POST | AdminCreateGoal | [AdminCreateGoal](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminCreateGoal.java) | [AdminCreateGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminCreateGoal.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}` | GET | AdminGetGoal | [AdminGetGoal](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminGetGoal.java) | [AdminGetGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminGetGoal.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}` | PUT | AdminUpdateGoals | [AdminUpdateGoals](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminUpdateGoals.java) | [AdminUpdateGoals](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminUpdateGoals.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}` | DELETE | AdminDeleteGoal | [AdminDeleteGoal](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminDeleteGoal.java) | [AdminDeleteGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminDeleteGoal.java) |

### Challenge Progression Wrapper:  [ChallengeProgression](../../src/main/java/net/accelbyte/sdk/api/challenge/wrappers/ChallengeProgression.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/progress/evaluate` | POST | AdminEvaluateProgress | [AdminEvaluateProgress](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/AdminEvaluateProgress.java) | [AdminEvaluateProgress](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/AdminEvaluateProgress.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/progress/evaluate` | POST | EvaluateMyProgress | [EvaluateMyProgress](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/EvaluateMyProgress.java) | [EvaluateMyProgress](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/EvaluateMyProgress.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/progress/{challengeCode}` | GET | PublicGetUserProgression | [PublicGetUserProgression](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/PublicGetUserProgression.java) | [PublicGetUserProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/PublicGetUserProgression.java) |

### Player Reward Wrapper:  [PlayerReward](../../src/main/java/net/accelbyte/sdk/api/challenge/wrappers/PlayerReward.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/users/rewards/claim` | POST | AdminClaimUsersRewards | [AdminClaimUsersRewards](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminClaimUsersRewards.java) | [AdminClaimUsersRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminClaimUsersRewards.java) |
| `/challenge/v1/admin/namespaces/{namespace}/users/{userId}/rewards` | GET | AdminGetUserRewards | [AdminGetUserRewards](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminGetUserRewards.java) | [AdminGetUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminGetUserRewards.java) |
| `/challenge/v1/admin/namespaces/{namespace}/users/{userId}/rewards/claim` | POST | AdminClaimUserRewards | [AdminClaimUserRewards](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminClaimUserRewards.java) | [AdminClaimUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminClaimUserRewards.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/rewards` | GET | PublicGetUserRewards | [PublicGetUserRewards](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/PublicGetUserRewards.java) | [PublicGetUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/PublicGetUserRewards.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/rewards/claim` | POST | PublicClaimUserRewards | [PublicClaimUserRewards](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/PublicClaimUserRewards.java) | [PublicClaimUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/PublicClaimUserRewards.java) |

### Challenge List Wrapper:  [ChallengeList](../../src/main/java/net/accelbyte/sdk/api/challenge/wrappers/ChallengeList.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/public/namespaces/{namespace}/challenges` | GET | GetChallenges | [GetChallenges](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_list/GetChallenges.java) | [GetChallenges](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_list/GetChallenges.java) |
| `/challenge/v1/public/namespaces/{namespace}/challenges/{challengeCode}/goals` | GET | PublicGetScheduledGoals | [PublicGetScheduledGoals](../../src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_list/PublicGetScheduledGoals.java) | [PublicGetScheduledGoals](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_list/PublicGetScheduledGoals.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `iam.ErrorResponse` | [IamErrorResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/IamErrorResponse.java) |
| `iam.Permission` | [IamPermission](../../src/main/java/net/accelbyte/sdk/api/challenge/models/IamPermission.java) |
| `model.ChallengeResponse` | [ModelChallengeResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelChallengeResponse.java) |
| `model.ClaimUserRewardsReq` | [ModelClaimUserRewardsReq](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUserRewardsReq.java) |
| `model.ClaimUsersRewardsRequest` | [ModelClaimUsersRewardsRequest](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUsersRewardsRequest.java) |
| `model.ClaimUsersRewardsResponse` | [ModelClaimUsersRewardsResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUsersRewardsResponse.java) |
| `model.CreateChallengeRequest` | [ModelCreateChallengeRequest](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelCreateChallengeRequest.java) |
| `model.CreateGoalRequest` | [ModelCreateGoalRequest](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelCreateGoalRequest.java) |
| `model.EvaluatePlayerProgressionRequest` | [ModelEvaluatePlayerProgressionRequest](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelEvaluatePlayerProgressionRequest.java) |
| `model.GetGoalsResponse` | [ModelGetGoalsResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGetGoalsResponse.java) |
| `model.GoalMeta` | [ModelGoalMeta](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalMeta.java) |
| `model.GoalOrder` | [ModelGoalOrder](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalOrder.java) |
| `model.GoalProgressionResponse` | [ModelGoalProgressionResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalProgressionResponse.java) |
| `model.GoalResponse` | [ModelGoalResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalResponse.java) |
| `model.GoalSchedule` | [ModelGoalSchedule](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalSchedule.java) |
| `model.ListChallengeResponse` | [ModelListChallengeResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListChallengeResponse.java) |
| `model.ListPeriodsResponse` | [ModelListPeriodsResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListPeriodsResponse.java) |
| `model.ListUserRewardsResponse` | [ModelListUserRewardsResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListUserRewardsResponse.java) |
| `model.Pagination` | [ModelPagination](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPagination.java) |
| `model.Predicate` | [ModelPredicate](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPredicate.java) |
| `model.Requirement` | [ModelRequirement](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelRequirement.java) |
| `model.RequirementProgressionResponse` | [ModelRequirementProgressionResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelRequirementProgressionResponse.java) |
| `model.ResetConfig` | [ModelResetConfig](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelResetConfig.java) |
| `model.Reward` | [ModelReward](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelReward.java) |
| `model.Schedule` | [ModelSchedule](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelSchedule.java) |
| `model.UpdateChallengeRequest` | [ModelUpdateChallengeRequest](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUpdateChallengeRequest.java) |
| `model.UpdateGoalRequest` | [ModelUpdateGoalRequest](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUpdateGoalRequest.java) |
| `model.UserProgressionResponse` | [ModelUserProgressionResponse](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserProgressionResponse.java) |
| `model.UserProgressionResponseMeta` | [ModelUserProgressionResponseMeta](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserProgressionResponseMeta.java) |
| `model.UserReward` | [ModelUserReward](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserReward.java) |
| `models.Period` | [ModelsPeriod](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ModelsPeriod.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/challenge/models/ResponseError.java) |
