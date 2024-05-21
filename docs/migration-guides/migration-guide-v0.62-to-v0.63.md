<a name="v0.63.0"></a>
## [v0.63.0] - 2024-05-21

### BREAKING CHANGE

### Group

All operation(s) under `net.accelbyte.sdk.api.group.operations.operations` have been removed.

### Leaderboard

- Model `net.accelbyte.sdk.api.leaderboard.models.V2Pagination` is renamed to `V2PaginationV2`
- Model `net.accelbyte.sdk.api.leaderboard.models.V2GetAllLeaderboardConfigsPublicResp`
    - field `paging` type changed from `V2Pagination?` to `V2PaginationV2?`
- Model `net.accelbyte.sdk.api.leaderboard.models.V2GetPublicLeaderboardRankingResponse`
    - field `paging` type changed from `V2Pagination?` to `V2PaginationV2?`