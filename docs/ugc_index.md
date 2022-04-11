# Ugc Service Index

&nbsp;  

## Operations

### Admin Channel Wrapper:  [AdminChannel](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/AdminChannel.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/admin/namespaces/{namespace}/channels` | GET | SingleAdminGetChannel | [SingleAdminGetChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/SingleAdminGetChannel.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels` | POST | AdminCreateChannel | [AdminCreateChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/AdminCreateChannel.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}` | PUT | SingleAdminUpdateChannel | [SingleAdminUpdateChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/SingleAdminUpdateChannel.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}` | DELETE | SingleAdminDeleteChannel | [SingleAdminDeleteChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/SingleAdminDeleteChannel.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels` | GET | AdminGetChannel | [AdminGetChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/AdminGetChannel.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels/{channelId}` | PUT | AdminUpdateChannel | [AdminUpdateChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/AdminUpdateChannel.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels/{channelId}` | DELETE | AdminDeleteChannel | [AdminDeleteChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_channel/AdminDeleteChannel.java) |

### Admin Content Wrapper:  [AdminContent](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/AdminContent.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents` | POST | AdminUploadContentDirect | [AdminUploadContentDirect](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminUploadContentDirect.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/s3` | POST | AdminUploadContentS3 | [AdminUploadContentS3](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminUploadContentS3.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/s3/{contentId}` | PUT | SingleAdminUpdateContentS3 | [SingleAdminUpdateContentS3](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/SingleAdminUpdateContentS3.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/search` | GET | AdminSearchChannelSpecificContent | [AdminSearchChannelSpecificContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminSearchChannelSpecificContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/{contentId}` | PUT | SingleAdminUpdateContentDirect | [SingleAdminUpdateContentDirect](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/SingleAdminUpdateContentDirect.java) |
| `/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/{contentId}` | DELETE | SingleAdminDeleteContent | [SingleAdminDeleteContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/SingleAdminDeleteContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents` | GET | SingleAdminGetContent | [SingleAdminGetContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/SingleAdminGetContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents/search` | GET | AdminSearchContent | [AdminSearchContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminSearchContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}` | GET | AdminGetSpecificContent | [AdminGetSpecificContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminGetSpecificContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}/preview` | GET | AdminDownloadContentPreview | [AdminDownloadContentPreview](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminDownloadContentPreview.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}/screenshots` | PUT | AdminUpdateScreenshots | [AdminUpdateScreenshots](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminUpdateScreenshots.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}/screenshots` | POST | AdminUploadContentScreenshot | [AdminUploadContentScreenshot](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminUploadContentScreenshot.java) |
| `/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}/screenshots/{screenshotId}` | DELETE | AdminDeleteContentScreenshot | [AdminDeleteContentScreenshot](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminDeleteContentScreenshot.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/s3/{contentId}` | PUT | AdminUpdateContentS3 | [AdminUpdateContentS3](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminUpdateContentS3.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/{contentId}` | PUT | AdminUpdateContentDirect | [AdminUpdateContentDirect](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminUpdateContentDirect.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/{contentId}` | DELETE | AdminDeleteContent | [AdminDeleteContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminDeleteContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/contents` | GET | AdminGetContent | [AdminGetContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminGetContent.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/contents/{contentId}/hide` | PUT | AdminHideUserContent | [AdminHideUserContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_content/AdminHideUserContent.java) |

### Admin Group Wrapper:  [AdminGroup](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/AdminGroup.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/admin/namespaces/{namespace}/groups` | GET | SingleAdminGetAllGroups | [SingleAdminGetAllGroups](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/SingleAdminGetAllGroups.java) |
| `/ugc/v1/admin/namespaces/{namespace}/groups` | POST | AdminCreateGroup | [AdminCreateGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/AdminCreateGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/groups/{groupId}` | GET | SingleAdminGetGroup | [SingleAdminGetGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/SingleAdminGetGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/groups/{groupId}` | PUT | SingleAdminUpdateGroup | [SingleAdminUpdateGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/SingleAdminUpdateGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/groups/{groupId}` | DELETE | SingleAdminDeleteGroup | [SingleAdminDeleteGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/SingleAdminDeleteGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/groups/{groupId}/contents` | GET | SingleAdminGetGroupContents | [SingleAdminGetGroupContents](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/SingleAdminGetGroupContents.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/groups` | GET | AdminGetAllGroups | [AdminGetAllGroups](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/AdminGetAllGroups.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/groups/{groupId}` | GET | AdminGetGroup | [AdminGetGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/AdminGetGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/groups/{groupId}` | PUT | AdminUpdateGroup | [AdminUpdateGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/AdminUpdateGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/groups/{groupId}` | DELETE | AdminDeleteGroup | [AdminDeleteGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/AdminDeleteGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/groups/{groupId}/contents` | GET | AdminGetGroupContents | [AdminGetGroupContents](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_group/AdminGetGroupContents.java) |

### Admin Tag Wrapper:  [AdminTag](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/AdminTag.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/admin/namespaces/{namespace}/tags` | GET | AdminGetTag | [AdminGetTag](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_tag/AdminGetTag.java) |
| `/ugc/v1/admin/namespaces/{namespace}/tags` | POST | AdminCreateTag | [AdminCreateTag](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_tag/AdminCreateTag.java) |
| `/ugc/v1/admin/namespaces/{namespace}/tags/{tagId}` | PUT | AdminUpdateTag | [AdminUpdateTag](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_tag/AdminUpdateTag.java) |
| `/ugc/v1/admin/namespaces/{namespace}/tags/{tagId}` | DELETE | AdminDeleteTag | [AdminDeleteTag](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_tag/AdminDeleteTag.java) |

### Admin Type Wrapper:  [AdminType](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/AdminType.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/admin/namespaces/{namespace}/types` | GET | AdminGetType | [AdminGetType](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_type/AdminGetType.java) |
| `/ugc/v1/admin/namespaces/{namespace}/types` | POST | AdminCreateType | [AdminCreateType](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_type/AdminCreateType.java) |
| `/ugc/v1/admin/namespaces/{namespace}/types/{typeId}` | PUT | AdminUpdateType | [AdminUpdateType](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_type/AdminUpdateType.java) |
| `/ugc/v1/admin/namespaces/{namespace}/types/{typeId}` | DELETE | AdminDeleteType | [AdminDeleteType](../src/main/java/net/accelbyte/sdk/api/ugc/operations/admin_type/AdminDeleteType.java) |

### Anonymization Wrapper:  [Anonymization](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/Anonymization.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels` | DELETE | AdminDeleteAllUserChannels | [AdminDeleteAllUserChannels](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/AdminDeleteAllUserChannels.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/contents` | DELETE | AdminDeleteAllUserContents | [AdminDeleteAllUserContents](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/AdminDeleteAllUserContents.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/groups` | DELETE | AdminDeleteAllUserGroup | [AdminDeleteAllUserGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/AdminDeleteAllUserGroup.java) |
| `/ugc/v1/admin/namespaces/{namespace}/users/{userId}/states` | DELETE | AdminDeleteAllUserStates | [AdminDeleteAllUserStates](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/AdminDeleteAllUserStates.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels` | DELETE | DeleteAllUserChannel | [DeleteAllUserChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/DeleteAllUserChannel.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents` | DELETE | DeleteAllUserContents | [DeleteAllUserContents](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/DeleteAllUserContents.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups` | DELETE | DeleteAllUserGroup | [DeleteAllUserGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/DeleteAllUserGroup.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/states` | DELETE | DeleteAllUserStates | [DeleteAllUserStates](../src/main/java/net/accelbyte/sdk/api/ugc/operations/anonymization/DeleteAllUserStates.java) |

### Public Content Wrapper:  [PublicContent](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicContent.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/channels/{channelId}/contents` | GET | SearchChannelSpecificContent | [SearchChannelSpecificContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/SearchChannelSpecificContent.java) |
| `/ugc/v1/public/namespaces/{namespace}/contents` | GET | PublicSearchContent | [PublicSearchContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/PublicSearchContent.java) |
| `/ugc/v1/public/namespaces/{namespace}/contents/sharecodes/{shareCode}` | GET | DownloadContentByShareCode | [DownloadContentByShareCode](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/DownloadContentByShareCode.java) |
| `/ugc/v1/public/namespaces/{namespace}/contents/{contentId}` | GET | PublicDownloadContentByContentID | [PublicDownloadContentByContentID](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/PublicDownloadContentByContentID.java) |
| `/ugc/v1/public/namespaces/{namespace}/contents/{contentId}/preview` | GET | PublicDownloadContentPreview | [PublicDownloadContentPreview](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/PublicDownloadContentPreview.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents` | POST | CreateContentDirect | [CreateContentDirect](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/CreateContentDirect.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/s3` | POST | CreateContentS3 | [CreateContentS3](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/CreateContentS3.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/s3/{contentId}` | PUT | UpdateContentS3 | [UpdateContentS3](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/UpdateContentS3.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/{contentId}` | PUT | UpdateContentDirect | [UpdateContentDirect](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/UpdateContentDirect.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/{contentId}` | DELETE | DeleteContent | [DeleteContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/DeleteContent.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents` | GET | PublicGetUserContent | [PublicGetUserContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/PublicGetUserContent.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents/{contentId}/screenshots` | PUT | UpdateScreenshots | [UpdateScreenshots](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/UpdateScreenshots.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents/{contentId}/screenshots` | POST | UploadContentScreenshot | [UploadContentScreenshot](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/UploadContentScreenshot.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/contents/{contentId}/screenshots/{screenshotId}` | DELETE | DeleteContentScreenshot | [DeleteContentScreenshot](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_content/DeleteContentScreenshot.java) |

### Public Follow Wrapper:  [PublicFollow](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicFollow.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/contents/followed` | GET | GetFollowedContent | [GetFollowedContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_follow/GetFollowedContent.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/followed` | GET | GetFollowedUsers | [GetFollowedUsers](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_follow/GetFollowedUsers.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/follow` | PUT | UpdateUserFollowStatus | [UpdateUserFollowStatus](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_follow/UpdateUserFollowStatus.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/followers` | GET | GetPublicFollowers | [GetPublicFollowers](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_follow/GetPublicFollowers.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/following` | GET | GetPublicFollowing | [GetPublicFollowing](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_follow/GetPublicFollowing.java) |

### Public Like Wrapper:  [PublicLike](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicLike.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/contents/liked` | GET | GetLikedContent | [GetLikedContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_like/GetLikedContent.java) |
| `/ugc/v1/public/namespaces/{namespace}/contents/{contentId}/like` | PUT | UpdateContentLikeStatus | [UpdateContentLikeStatus](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_like/UpdateContentLikeStatus.java) |

### Public Download Count Wrapper:  [PublicDownloadCount](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicDownloadCount.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/contents/{contentId}/downloadcount` | POST | AddDownloadCount | [AddDownloadCount](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_download_count/AddDownloadCount.java) |

### Public Tag Wrapper:  [PublicTag](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicTag.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/tags` | GET | GetTag | [GetTag](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_tag/GetTag.java) |

### Public Type Wrapper:  [PublicType](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicType.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/types` | GET | GetType | [GetType](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_type/GetType.java) |

### Public Creator Wrapper:  [PublicCreator](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicCreator.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}` | GET | GetCreator | [GetCreator](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_creator/GetCreator.java) |

### Public Channel Wrapper:  [PublicChannel](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicChannel.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels` | GET | GetChannels | [GetChannels](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_channel/GetChannels.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels` | POST | CreateChannel | [CreateChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_channel/CreateChannel.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}` | PUT | UpdateChannel | [UpdateChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_channel/UpdateChannel.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}` | DELETE | DeleteChannel | [DeleteChannel](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_channel/DeleteChannel.java) |

### Public Group Wrapper:  [PublicGroup](../src/main/java/net/accelbyte/sdk/api/ugc/wrappers/PublicGroup.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups` | GET | GetGroups | [GetGroups](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_group/GetGroups.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups` | POST | CreateGroup | [CreateGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_group/CreateGroup.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups/{groupId}` | GET | GetGroup | [GetGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_group/GetGroup.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups/{groupId}` | PUT | UpdateGroup | [UpdateGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_group/UpdateGroup.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups/{groupId}` | DELETE | DeleteGroup | [DeleteGroup](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_group/DeleteGroup.java) |
| `/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups/{groupId}/contents` | GET | GetGroupContent | [GetGroupContent](../src/main/java/net/accelbyte/sdk/api/ugc/operations/public_group/GetGroupContent.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.AddDownloadCountResponse` | [ModelsAddDownloadCountResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsAddDownloadCountResponse.java) |
| `models.ChannelRequest` | [ModelsChannelRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsChannelRequest.java) |
| `models.ChannelResponse` | [ModelsChannelResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsChannelResponse.java) |
| `models.ContentDownloadResponse` | [ModelsContentDownloadResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsContentDownloadResponse.java) |
| `models.ContentLikeRequest` | [ModelsContentLikeRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsContentLikeRequest.java) |
| `models.ContentLikeResponse` | [ModelsContentLikeResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsContentLikeResponse.java) |
| `models.CreateContentRequest` | [ModelsCreateContentRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateContentRequest.java) |
| `models.CreateContentRequestS3` | [ModelsCreateContentRequestS3](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateContentRequestS3.java) |
| `models.CreateContentResponse` | [ModelsCreateContentResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateContentResponse.java) |
| `models.CreateGroupRequest` | [ModelsCreateGroupRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateGroupRequest.java) |
| `models.CreateGroupResponse` | [ModelsCreateGroupResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateGroupResponse.java) |
| `models.CreateScreenshotRequest` | [ModelsCreateScreenshotRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateScreenshotRequest.java) |
| `models.CreateScreenshotResponse` | [ModelsCreateScreenshotResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateScreenshotResponse.java) |
| `models.CreateTagRequest` | [ModelsCreateTagRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateTagRequest.java) |
| `models.CreateTagResponse` | [ModelsCreateTagResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateTagResponse.java) |
| `models.CreateTypeRequest` | [ModelsCreateTypeRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateTypeRequest.java) |
| `models.CreateTypeResponse` | [ModelsCreateTypeResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateTypeResponse.java) |
| `models.CreatorFollowState` | [ModelsCreatorFollowState](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreatorFollowState.java) |
| `models.CreatorOverviewResponse` | [ModelsCreatorOverviewResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreatorOverviewResponse.java) |
| `models.GetContentPreviewResponse` | [ModelsGetContentPreviewResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsGetContentPreviewResponse.java) |
| `models.HideContentRequest` | [ModelsHideContentRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsHideContentRequest.java) |
| `models.LikeState` | [ModelsLikeState](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsLikeState.java) |
| `models.PaginatedContentDownloadResponse` | [ModelsPaginatedContentDownloadResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPaginatedContentDownloadResponse.java) |
| `models.PaginatedCreatorOverviewResponse` | [ModelsPaginatedCreatorOverviewResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPaginatedCreatorOverviewResponse.java) |
| `models.PaginatedGetChannelResponse` | [ModelsPaginatedGetChannelResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPaginatedGetChannelResponse.java) |
| `models.PaginatedGetTagResponse` | [ModelsPaginatedGetTagResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPaginatedGetTagResponse.java) |
| `models.PaginatedGetTypeResponse` | [ModelsPaginatedGetTypeResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPaginatedGetTypeResponse.java) |
| `models.PaginatedGroupResponse` | [ModelsPaginatedGroupResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPaginatedGroupResponse.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPagingCursor.java) |
| `models.PayloadURL` | [ModelsPayloadURL](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsPayloadURL.java) |
| `models.ScreenshotResponse` | [ModelsScreenshotResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsScreenshotResponse.java) |
| `models.UpdateScreenshotRequest` | [ModelsUpdateScreenshotRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsUpdateScreenshotRequest.java) |
| `models.UpdateScreenshotResponse` | [ModelsUpdateScreenshotResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsUpdateScreenshotResponse.java) |
| `models.UserFollowRequest` | [ModelsUserFollowRequest](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsUserFollowRequest.java) |
| `models.UserFollowResponse` | [ModelsUserFollowResponse](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsUserFollowResponse.java) |
| `models.createScreenshotRequestItem` | [ModelsCreateScreenshotRequestItem](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsCreateScreenshotRequestItem.java) |
| `models.updateScreenshot` | [ModelsUpdateScreenshot](../src/main/java/net/accelbyte/sdk/api/ugc/models/ModelsUpdateScreenshot.java) |
| `response.Error` | [ResponseError](../src/main/java/net/accelbyte/sdk/api/ugc/models/ResponseError.java) |
