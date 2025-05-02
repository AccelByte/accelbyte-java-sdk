## Java Extend SDK CLI Sample App Operation Index for Ugc service

### Operation SingleAdminGetChannel

```sh
$ build/install/cli/bin/cli ugc singleAdminGetChannel \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminCreateChannel

```sh
$ build/install/cli/bin/cli ugc adminCreateChannel \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SingleAdminUpdateChannel

```sh
$ build/install/cli/bin/cli ugc singleAdminUpdateChannel \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SingleAdminDeleteChannel

```sh
$ build/install/cli/bin/cli ugc singleAdminDeleteChannel \
    --channelId <channelId value> \
    --namespace <namespace value>
```

### Operation AdminUploadContentS3

```sh
$ build/install/cli/bin/cli ugc adminUploadContentS3 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SingleAdminUpdateContentS3

```sh
$ build/install/cli/bin/cli ugc singleAdminUpdateContentS3 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminSearchChannelSpecificContent

```sh
$ build/install/cli/bin/cli ugc adminSearchChannelSpecificContent \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --creator <creator value - optional> \
    --ishidden <ishidden value - optional> \
    --isofficial <isofficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --orderby <orderby value - optional> \
    --sortby <sortby value - optional> \
    --subtype <subtype value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional> \
    --userId <userId value - optional>
```

### Operation SingleAdminDeleteContent

```sh
$ build/install/cli/bin/cli ugc singleAdminDeleteContent \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation SingleAdminGetContent

```sh
$ build/install/cli/bin/cli ugc singleAdminGetContent \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminGetContentBulk

```sh
$ build/install/cli/bin/cli ugc adminGetContentBulk \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminSearchContent

```sh
$ build/install/cli/bin/cli ugc adminSearchContent \
    --namespace <namespace value> \
    --creator <creator value - optional> \
    --ishidden <ishidden value - optional> \
    --isofficial <isofficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --orderby <orderby value - optional> \
    --sortby <sortby value - optional> \
    --subtype <subtype value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional> \
    --userId <userId value - optional>
```

### Operation AdminGetContentBulkByShareCodes

```sh
$ build/install/cli/bin/cli ugc adminGetContentBulkByShareCodes \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetUserContentByShareCode

```sh
$ build/install/cli/bin/cli ugc adminGetUserContentByShareCode \
    --namespace <namespace value> \
    --shareCode <shareCode value>
```

### Operation AdminGetSpecificContent

```sh
$ build/install/cli/bin/cli ugc adminGetSpecificContent \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation AdminDownloadContentPreview

```sh
$ build/install/cli/bin/cli ugc adminDownloadContentPreview \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation RollbackContentVersion

```sh
$ build/install/cli/bin/cli ugc rollbackContentVersion \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --versionId <versionId value>
```

### Operation AdminUpdateScreenshots

```sh
$ build/install/cli/bin/cli ugc adminUpdateScreenshots \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUploadContentScreenshot

```sh
$ build/install/cli/bin/cli ugc adminUploadContentScreenshot \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteContentScreenshot

```sh
$ build/install/cli/bin/cli ugc adminDeleteContentScreenshot \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --screenshotId <screenshotId value>
```

### Operation ListContentVersions

```sh
$ build/install/cli/bin/cli ugc listContentVersions \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation SingleAdminGetAllGroups

```sh
$ build/install/cli/bin/cli ugc singleAdminGetAllGroups \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminCreateGroup

```sh
$ build/install/cli/bin/cli ugc adminCreateGroup \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SingleAdminGetGroup

```sh
$ build/install/cli/bin/cli ugc singleAdminGetGroup \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation SingleAdminUpdateGroup

```sh
$ build/install/cli/bin/cli ugc singleAdminUpdateGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SingleAdminDeleteGroup

```sh
$ build/install/cli/bin/cli ugc singleAdminDeleteGroup \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation SingleAdminGetGroupContents

```sh
$ build/install/cli/bin/cli ugc singleAdminGetGroupContents \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminGetTag

```sh
$ build/install/cli/bin/cli ugc adminGetTag \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminCreateTag

```sh
$ build/install/cli/bin/cli ugc adminCreateTag \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateTag

```sh
$ build/install/cli/bin/cli ugc adminUpdateTag \
    --namespace <namespace value> \
    --tagId <tagId value> \
    --body <json string for request body>
```

### Operation AdminDeleteTag

```sh
$ build/install/cli/bin/cli ugc adminDeleteTag \
    --namespace <namespace value> \
    --tagId <tagId value>
```

### Operation AdminGetType

```sh
$ build/install/cli/bin/cli ugc adminGetType \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminCreateType

```sh
$ build/install/cli/bin/cli ugc adminCreateType \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateType

```sh
$ build/install/cli/bin/cli ugc adminUpdateType \
    --namespace <namespace value> \
    --typeId <typeId value> \
    --body <json string for request body>
```

### Operation AdminDeleteType

```sh
$ build/install/cli/bin/cli ugc adminDeleteType \
    --namespace <namespace value> \
    --typeId <typeId value>
```

### Operation AdminGetChannel

```sh
$ build/install/cli/bin/cli ugc adminGetChannel \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional>
```

### Operation AdminDeleteAllUserChannels

```sh
$ build/install/cli/bin/cli ugc adminDeleteAllUserChannels \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateChannel

```sh
$ build/install/cli/bin/cli ugc adminUpdateChannel \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDeleteChannel

```sh
$ build/install/cli/bin/cli ugc adminDeleteChannel \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateContentS3ByShareCode

```sh
$ build/install/cli/bin/cli ugc adminUpdateContentS3ByShareCode \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminUpdateContentS3

```sh
$ build/install/cli/bin/cli ugc adminUpdateContentS3 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteContentByShareCode

```sh
$ build/install/cli/bin/cli ugc deleteContentByShareCode \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value>
```

### Operation AdminDeleteContent

```sh
$ build/install/cli/bin/cli ugc adminDeleteContent \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetContent

```sh
$ build/install/cli/bin/cli ugc adminGetContent \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminDeleteAllUserContents

```sh
$ build/install/cli/bin/cli ugc adminDeleteAllUserContents \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminHideUserContent

```sh
$ build/install/cli/bin/cli ugc adminHideUserContent \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetAllGroups

```sh
$ build/install/cli/bin/cli ugc adminGetAllGroups \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminDeleteAllUserGroup

```sh
$ build/install/cli/bin/cli ugc adminDeleteAllUserGroup \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetGroup

```sh
$ build/install/cli/bin/cli ugc adminGetGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateGroup

```sh
$ build/install/cli/bin/cli ugc adminUpdateGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDeleteGroup

```sh
$ build/install/cli/bin/cli ugc adminDeleteGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetGroupContents

```sh
$ build/install/cli/bin/cli ugc adminGetGroupContents \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminDeleteAllUserStates

```sh
$ build/install/cli/bin/cli ugc adminDeleteAllUserStates \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation SearchChannelSpecificContent

```sh
$ build/install/cli/bin/cli ugc searchChannelSpecificContent \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --creator <creator value - optional> \
    --ishidden <ishidden value - optional> \
    --isofficial <isofficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --orderby <orderby value - optional> \
    --sortby <sortby value - optional> \
    --subtype <subtype value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional> \
    --userId <userId value - optional>
```

### Operation PublicSearchContent

```sh
$ build/install/cli/bin/cli ugc publicSearchContent \
    --namespace <namespace value> \
    --creator <creator value - optional> \
    --ishidden <ishidden value - optional> \
    --isofficial <isofficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --orderby <orderby value - optional> \
    --sortby <sortby value - optional> \
    --subtype <subtype value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional> \
    --userId <userId value - optional>
```

### Operation PublicGetContentBulk

```sh
$ build/install/cli/bin/cli ugc publicGetContentBulk \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetFollowedContent

```sh
$ build/install/cli/bin/cli ugc getFollowedContent \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetLikedContent

```sh
$ build/install/cli/bin/cli ugc getLikedContent \
    --namespace <namespace value> \
    --isofficial <isofficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --orderby <orderby value - optional> \
    --sortby <sortby value - optional> \
    --subtype <subtype value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional>
```

### Operation PublicGetContentBulkByShareCodes

```sh
$ build/install/cli/bin/cli ugc publicGetContentBulkByShareCodes \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicDownloadContentByShareCode

```sh
$ build/install/cli/bin/cli ugc publicDownloadContentByShareCode \
    --namespace <namespace value> \
    --shareCode <shareCode value>
```

### Operation PublicDownloadContentByContentID

```sh
$ build/install/cli/bin/cli ugc publicDownloadContentByContentID \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation AddDownloadCount

```sh
$ build/install/cli/bin/cli ugc addDownloadCount \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation UpdateContentLikeStatus

```sh
$ build/install/cli/bin/cli ugc updateContentLikeStatus \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicDownloadContentPreview

```sh
$ build/install/cli/bin/cli ugc publicDownloadContentPreview \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation GetTag

```sh
$ build/install/cli/bin/cli ugc getTag \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetType

```sh
$ build/install/cli/bin/cli ugc getType \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicSearchCreator

```sh
$ build/install/cli/bin/cli ugc publicSearchCreator \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --orderby <orderby value - optional> \
    --sortby <sortby value - optional>
```

### Operation GetFollowedUsers

```sh
$ build/install/cli/bin/cli ugc getFollowedUsers \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicGetCreator

```sh
$ build/install/cli/bin/cli ugc publicGetCreator \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetChannels

```sh
$ build/install/cli/bin/cli ugc getChannels \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional>
```

### Operation PublicCreateChannel

```sh
$ build/install/cli/bin/cli ugc publicCreateChannel \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteAllUserChannel

```sh
$ build/install/cli/bin/cli ugc deleteAllUserChannel \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateChannel

```sh
$ build/install/cli/bin/cli ugc updateChannel \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteChannel

```sh
$ build/install/cli/bin/cli ugc deleteChannel \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation CreateContentS3

```sh
$ build/install/cli/bin/cli ugc createContentS3 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicUpdateContentByShareCode

```sh
$ build/install/cli/bin/cli ugc publicUpdateContentByShareCode \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation UpdateContentS3

```sh
$ build/install/cli/bin/cli ugc updateContentS3 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicDeleteContentByShareCode

```sh
$ build/install/cli/bin/cli ugc publicDeleteContentByShareCode \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value>
```

### Operation DeleteContent

```sh
$ build/install/cli/bin/cli ugc deleteContent \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateContentShareCode

```sh
$ build/install/cli/bin/cli ugc updateContentShareCode \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetUserContent

```sh
$ build/install/cli/bin/cli ugc publicGetUserContent \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation DeleteAllUserContents

```sh
$ build/install/cli/bin/cli ugc deleteAllUserContents \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateScreenshots

```sh
$ build/install/cli/bin/cli ugc updateScreenshots \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation UploadContentScreenshot

```sh
$ build/install/cli/bin/cli ugc uploadContentScreenshot \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteContentScreenshot

```sh
$ build/install/cli/bin/cli ugc deleteContentScreenshot \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --screenshotId <screenshotId value> \
    --userId <userId value>
```

### Operation UpdateUserFollowStatus

```sh
$ build/install/cli/bin/cli ugc updateUserFollowStatus \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetPublicFollowers

```sh
$ build/install/cli/bin/cli ugc getPublicFollowers \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetPublicFollowing

```sh
$ build/install/cli/bin/cli ugc getPublicFollowing \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetGroups

```sh
$ build/install/cli/bin/cli ugc getGroups \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateGroup

```sh
$ build/install/cli/bin/cli ugc createGroup \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteAllUserGroup

```sh
$ build/install/cli/bin/cli ugc deleteAllUserGroup \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetGroup

```sh
$ build/install/cli/bin/cli ugc getGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateGroup

```sh
$ build/install/cli/bin/cli ugc updateGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteGroup

```sh
$ build/install/cli/bin/cli ugc deleteGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetGroupContent

```sh
$ build/install/cli/bin/cli ugc getGroupContent \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation DeleteAllUserStates

```sh
$ build/install/cli/bin/cli ugc deleteAllUserStates \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetContentByChannelIDV2

```sh
$ build/install/cli/bin/cli ugc adminGetContentByChannelIDV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminCreateContentV2

```sh
$ build/install/cli/bin/cli ugc adminCreateContentV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteOfficialContentV2

```sh
$ build/install/cli/bin/cli ugc adminDeleteOfficialContentV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation AdminUpdateOfficialContentV2

```sh
$ build/install/cli/bin/cli ugc adminUpdateOfficialContentV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCopyContent

```sh
$ build/install/cli/bin/cli ugc adminCopyContent \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateOfficialContentFileLocation

```sh
$ build/install/cli/bin/cli ugc adminUpdateOfficialContentFileLocation \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGenerateOfficialContentUploadURLV2

```sh
$ build/install/cli/bin/cli ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetConfigs

```sh
$ build/install/cli/bin/cli ugc adminGetConfigs \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminUpdateConfig

```sh
$ build/install/cli/bin/cli ugc adminUpdateConfig \
    --key <key value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListContentV2

```sh
$ build/install/cli/bin/cli ugc adminListContentV2 \
    --namespace <namespace value> \
    --isOfficial <isOfficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --subType <subType value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional>
```

### Operation AdminBulkGetContentByIDsV2

```sh
$ build/install/cli/bin/cli ugc adminBulkGetContentByIDsV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetContentBulkByShareCodesV2

```sh
$ build/install/cli/bin/cli ugc adminGetContentBulkByShareCodesV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetContentByShareCodeV2

```sh
$ build/install/cli/bin/cli ugc adminGetContentByShareCodeV2 \
    --namespace <namespace value> \
    --shareCode <shareCode value>
```

### Operation AdminGetContentByContentIDV2

```sh
$ build/install/cli/bin/cli ugc adminGetContentByContentIDV2 \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation RollbackContentVersionV2

```sh
$ build/install/cli/bin/cli ugc rollbackContentVersionV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --versionId <versionId value>
```

### Operation AdminUpdateScreenshotsV2

```sh
$ build/install/cli/bin/cli ugc adminUpdateScreenshotsV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUploadContentScreenshotV2

```sh
$ build/install/cli/bin/cli ugc adminUploadContentScreenshotV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteContentScreenshotV2

```sh
$ build/install/cli/bin/cli ugc adminDeleteContentScreenshotV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --screenshotId <screenshotId value>
```

### Operation ListContentVersionsV2

```sh
$ build/install/cli/bin/cli ugc listContentVersionsV2 \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation AdminGetOfficialGroupContentsV2

```sh
$ build/install/cli/bin/cli ugc adminGetOfficialGroupContentsV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminListStagingContents

```sh
$ build/install/cli/bin/cli ugc adminListStagingContents \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation AdminGetStagingContentByID

```sh
$ build/install/cli/bin/cli ugc adminGetStagingContentByID \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation AdminApproveStagingContent

```sh
$ build/install/cli/bin/cli ugc adminApproveStagingContent \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateContentByShareCodeV2

```sh
$ build/install/cli/bin/cli ugc adminUpdateContentByShareCodeV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDeleteContentByShareCodeV2

```sh
$ build/install/cli/bin/cli ugc adminDeleteContentByShareCodeV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value>
```

### Operation AdminDeleteUserContentV2

```sh
$ build/install/cli/bin/cli ugc adminDeleteUserContentV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateUserContentV2

```sh
$ build/install/cli/bin/cli ugc adminUpdateUserContentV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminUpdateUserContentFileLocation

```sh
$ build/install/cli/bin/cli ugc adminUpdateUserContentFileLocation \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGenerateUserContentUploadURLV2

```sh
$ build/install/cli/bin/cli ugc adminGenerateUserContentUploadURLV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetContentByUserIDV2

```sh
$ build/install/cli/bin/cli ugc adminGetContentByUserIDV2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminUpdateContentHideStatusV2

```sh
$ build/install/cli/bin/cli ugc adminUpdateContentHideStatusV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetUserGroupContentsV2

```sh
$ build/install/cli/bin/cli ugc adminGetUserGroupContentsV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminListUserStagingContents

```sh
$ build/install/cli/bin/cli ugc adminListUserStagingContents \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation PublicGetContentByChannelIDV2

```sh
$ build/install/cli/bin/cli ugc publicGetContentByChannelIDV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicListContentV2

```sh
$ build/install/cli/bin/cli ugc publicListContentV2 \
    --namespace <namespace value> \
    --isOfficial <isOfficial value - optional> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --subType <subType value - optional> \
    --tags <tags value - optional> \
    --type <type value - optional>
```

### Operation PublicBulkGetContentByIDV2

```sh
$ build/install/cli/bin/cli ugc publicBulkGetContentByIDV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetContentBulkByShareCodesV2

```sh
$ build/install/cli/bin/cli ugc publicGetContentBulkByShareCodesV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetContentByShareCodeV2

```sh
$ build/install/cli/bin/cli ugc publicGetContentByShareCodeV2 \
    --namespace <namespace value> \
    --shareCode <shareCode value>
```

### Operation PublicGetContentByIDV2

```sh
$ build/install/cli/bin/cli ugc publicGetContentByIDV2 \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation PublicAddDownloadCountV2

```sh
$ build/install/cli/bin/cli ugc publicAddDownloadCountV2 \
    --contentId <contentId value> \
    --namespace <namespace value>
```

### Operation PublicListContentDownloaderV2

```sh
$ build/install/cli/bin/cli ugc publicListContentDownloaderV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --userId <userId value - optional>
```

### Operation PublicListContentLikeV2

```sh
$ build/install/cli/bin/cli ugc publicListContentLikeV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation UpdateContentLikeStatusV2

```sh
$ build/install/cli/bin/cli ugc updateContentLikeStatusV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicCreateContentV2

```sh
$ build/install/cli/bin/cli ugc publicCreateContentV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicUpdateContentByShareCodeV2

```sh
$ build/install/cli/bin/cli ugc publicUpdateContentByShareCodeV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicDeleteContentByShareCodeV2

```sh
$ build/install/cli/bin/cli ugc publicDeleteContentByShareCodeV2 \
    --channelId <channelId value> \
    --namespace <namespace value> \
    --shareCode <shareCode value> \
    --userId <userId value>
```

### Operation PublicDeleteContentV2

```sh
$ build/install/cli/bin/cli ugc publicDeleteContentV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicUpdateContentV2

```sh
$ build/install/cli/bin/cli ugc publicUpdateContentV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicUpdateContentFileLocation

```sh
$ build/install/cli/bin/cli ugc publicUpdateContentFileLocation \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation UpdateContentShareCodeV2

```sh
$ build/install/cli/bin/cli ugc updateContentShareCodeV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGenerateContentUploadURLV2

```sh
$ build/install/cli/bin/cli ugc publicGenerateContentUploadURLV2 \
    --channelId <channelId value> \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetContentByUserIDV2

```sh
$ build/install/cli/bin/cli ugc publicGetContentByUserIDV2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation UpdateScreenshotsV2

```sh
$ build/install/cli/bin/cli ugc updateScreenshotsV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation UploadContentScreenshotV2

```sh
$ build/install/cli/bin/cli ugc uploadContentScreenshotV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteContentScreenshotV2

```sh
$ build/install/cli/bin/cli ugc deleteContentScreenshotV2 \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --screenshotId <screenshotId value> \
    --userId <userId value>
```

### Operation PublicGetGroupContentsV2

```sh
$ build/install/cli/bin/cli ugc publicGetGroupContentsV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation ListUserStagingContents

```sh
$ build/install/cli/bin/cli ugc listUserStagingContents \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation GetUserStagingContentByID

```sh
$ build/install/cli/bin/cli ugc getUserStagingContentByID \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateStagingContent

```sh
$ build/install/cli/bin/cli ugc updateStagingContent \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteUserStagingContentByID

```sh
$ build/install/cli/bin/cli ugc deleteUserStagingContentByID \
    --contentId <contentId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

