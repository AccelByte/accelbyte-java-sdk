/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.ugc.admin_channel.*;
import net.accelbyte.sdk.cli.api.ugc.admin_config.*;
import net.accelbyte.sdk.cli.api.ugc.admin_content.*;
import net.accelbyte.sdk.cli.api.ugc.admin_content_v2.*;
import net.accelbyte.sdk.cli.api.ugc.admin_group.*;
import net.accelbyte.sdk.cli.api.ugc.admin_staging_content.*;
import net.accelbyte.sdk.cli.api.ugc.admin_tag.*;
import net.accelbyte.sdk.cli.api.ugc.admin_type.*;
import net.accelbyte.sdk.cli.api.ugc.anonymization.*;
import net.accelbyte.sdk.cli.api.ugc.public_channel.*;
import net.accelbyte.sdk.cli.api.ugc.public_content_legacy.*;
import net.accelbyte.sdk.cli.api.ugc.public_content_v2.*;
import net.accelbyte.sdk.cli.api.ugc.public_creator.*;
import net.accelbyte.sdk.cli.api.ugc.public_download_count_legacy.*;
import net.accelbyte.sdk.cli.api.ugc.public_download_count_v2.*;
import net.accelbyte.sdk.cli.api.ugc.public_follow.*;
import net.accelbyte.sdk.cli.api.ugc.public_group.*;
import net.accelbyte.sdk.cli.api.ugc.public_like_legacy.*;
import net.accelbyte.sdk.cli.api.ugc.public_like_v2.*;
import net.accelbyte.sdk.cli.api.ugc.public_staging_content.*;
import net.accelbyte.sdk.cli.api.ugc.public_tag.*;
import net.accelbyte.sdk.cli.api.ugc.public_type.*;
import picocli.CommandLine.Command;

@Command(
    name = "ugc",
    mixinStandardHelpOptions = true,
    subcommands = {
      SingleAdminGetChannel.class,
      AdminCreateChannel.class,
      SingleAdminUpdateChannel.class,
      SingleAdminDeleteChannel.class,
      AdminUploadContentDirect.class,
      AdminUploadContentS3.class,
      SingleAdminUpdateContentS3.class,
      AdminSearchChannelSpecificContent.class,
      SingleAdminUpdateContentDirect.class,
      SingleAdminDeleteContent.class,
      SingleAdminGetContent.class,
      AdminGetContentBulk.class,
      AdminSearchContent.class,
      AdminGetContentBulkByShareCodes.class,
      AdminGetUserContentByShareCode.class,
      AdminGetSpecificContent.class,
      AdminDownloadContentPreview.class,
      RollbackContentVersion.class,
      AdminUpdateScreenshots.class,
      AdminUploadContentScreenshot.class,
      AdminDeleteContentScreenshot.class,
      ListContentVersions.class,
      SingleAdminGetAllGroups.class,
      AdminCreateGroup.class,
      SingleAdminGetGroup.class,
      SingleAdminUpdateGroup.class,
      SingleAdminDeleteGroup.class,
      SingleAdminGetGroupContents.class,
      AdminGetTag.class,
      AdminCreateTag.class,
      AdminUpdateTag.class,
      AdminDeleteTag.class,
      AdminGetType.class,
      AdminCreateType.class,
      AdminUpdateType.class,
      AdminDeleteType.class,
      AdminGetChannel.class,
      AdminDeleteAllUserChannels.class,
      AdminUpdateChannel.class,
      AdminDeleteChannel.class,
      AdminUpdateContentS3ByShareCode.class,
      AdminUpdateContentS3.class,
      DeleteContentByShareCode.class,
      AdminUpdateContentDirect.class,
      AdminDeleteContent.class,
      AdminGetContent.class,
      AdminDeleteAllUserContents.class,
      AdminHideUserContent.class,
      AdminGetAllGroups.class,
      AdminDeleteAllUserGroup.class,
      AdminGetGroup.class,
      AdminUpdateGroup.class,
      AdminDeleteGroup.class,
      AdminGetGroupContents.class,
      AdminDeleteAllUserStates.class,
      SearchChannelSpecificContent.class,
      PublicSearchContent.class,
      PublicGetContentBulk.class,
      GetFollowedContent.class,
      GetLikedContent.class,
      PublicGetContentBulkByShareCodes.class,
      PublicDownloadContentByShareCode.class,
      PublicDownloadContentByContentID.class,
      AddDownloadCount.class,
      UpdateContentLikeStatus.class,
      PublicDownloadContentPreview.class,
      GetTag.class,
      GetType.class,
      PublicSearchCreator.class,
      GetFollowedUsers.class,
      PublicGetCreator.class,
      GetChannels.class,
      PublicCreateChannel.class,
      DeleteAllUserChannel.class,
      UpdateChannel.class,
      DeleteChannel.class,
      CreateContentDirect.class,
      CreateContentS3.class,
      PublicUpdateContentByShareCode.class,
      UpdateContentS3.class,
      PublicDeleteContentByShareCode.class,
      UpdateContentDirect.class,
      DeleteContent.class,
      UpdateContentShareCode.class,
      PublicGetUserContent.class,
      DeleteAllUserContents.class,
      UpdateScreenshots.class,
      UploadContentScreenshot.class,
      DeleteContentScreenshot.class,
      UpdateUserFollowStatus.class,
      GetPublicFollowers.class,
      GetPublicFollowing.class,
      GetGroups.class,
      CreateGroup.class,
      DeleteAllUserGroup.class,
      GetGroup.class,
      UpdateGroup.class,
      DeleteGroup.class,
      GetGroupContent.class,
      DeleteAllUserStates.class,
      AdminGetContentByChannelIDV2.class,
      AdminCreateContentV2.class,
      AdminDeleteOfficialContentV2.class,
      AdminUpdateOfficialContentV2.class,
      AdminCopyContent.class,
      AdminUpdateOfficialContentFileLocation.class,
      AdminGenerateOfficialContentUploadURLV2.class,
      AdminGetConfigs.class,
      AdminUpdateConfig.class,
      AdminListContentV2.class,
      AdminBulkGetContentByIDsV2.class,
      AdminGetContentBulkByShareCodesV2.class,
      AdminGetContentByShareCodeV2.class,
      AdminGetContentByContentIDV2.class,
      RollbackContentVersionV2.class,
      AdminUpdateScreenshotsV2.class,
      AdminUploadContentScreenshotV2.class,
      AdminDeleteContentScreenshotV2.class,
      ListContentVersionsV2.class,
      AdminGetOfficialGroupContentsV2.class,
      AdminListStagingContents.class,
      AdminGetStagingContentByID.class,
      AdminApproveStagingContent.class,
      AdminUpdateContentByShareCodeV2.class,
      AdminDeleteContentByShareCodeV2.class,
      AdminDeleteUserContentV2.class,
      AdminUpdateUserContentV2.class,
      AdminUpdateUserContentFileLocation.class,
      AdminGenerateUserContentUploadURLV2.class,
      AdminGetContentByUserIDV2.class,
      AdminUpdateContentHideStatusV2.class,
      AdminGetUserGroupContentsV2.class,
      AdminListUserStagingContents.class,
      PublicGetContentByChannelIDV2.class,
      PublicListContentV2.class,
      PublicBulkGetContentByIDV2.class,
      PublicGetContentBulkByShareCodesV2.class,
      PublicGetContentByShareCodeV2.class,
      PublicGetContentByIDV2.class,
      PublicAddDownloadCountV2.class,
      PublicListContentDownloaderV2.class,
      PublicListContentLikeV2.class,
      UpdateContentLikeStatusV2.class,
      PublicCreateContentV2.class,
      PublicUpdateContentByShareCodeV2.class,
      PublicDeleteContentByShareCodeV2.class,
      PublicDeleteContentV2.class,
      PublicUpdateContentV2.class,
      PublicUpdateContentFileLocation.class,
      UpdateContentShareCodeV2.class,
      PublicGenerateContentUploadURLV2.class,
      PublicGetContentByUserIDV2.class,
      UpdateScreenshotsV2.class,
      UploadContentScreenshotV2.class,
      DeleteContentScreenshotV2.class,
      PublicGetGroupContentsV2.class,
      ListUserStagingContents.class,
      GetUserStagingContentByID.class,
      UpdateStagingContent.class,
      DeleteUserStagingContentByID.class,
    })
public class Ugc implements Runnable {

  @Override
  public void run() {}
}
