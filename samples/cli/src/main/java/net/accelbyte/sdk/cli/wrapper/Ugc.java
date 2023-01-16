/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.ugc.admin_channel.*;
import net.accelbyte.sdk.cli.api.ugc.admin_content.*;
import net.accelbyte.sdk.cli.api.ugc.admin_group.*;
import net.accelbyte.sdk.cli.api.ugc.admin_tag.*;
import net.accelbyte.sdk.cli.api.ugc.admin_type.*;
import net.accelbyte.sdk.cli.api.ugc.anonymization.*;
import net.accelbyte.sdk.cli.api.ugc.public_channel.*;
import net.accelbyte.sdk.cli.api.ugc.public_content.*;
import net.accelbyte.sdk.cli.api.ugc.public_creator.*;
import net.accelbyte.sdk.cli.api.ugc.public_download_count.*;
import net.accelbyte.sdk.cli.api.ugc.public_follow.*;
import net.accelbyte.sdk.cli.api.ugc.public_group.*;
import net.accelbyte.sdk.cli.api.ugc.public_like.*;
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
      AdminGetUserContentByShareCode.class,
      AdminGetSpecificContent.class,
      AdminDownloadContentPreview.class,
      AdminUpdateScreenshots.class,
      AdminUploadContentScreenshot.class,
      AdminDeleteContentScreenshot.class,
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
      AdminUpdateContentS3.class,
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
      CreateChannel.class,
      DeleteAllUserChannel.class,
      UpdateChannel.class,
      DeleteChannel.class,
      CreateContentDirect.class,
      CreateContentS3.class,
      UpdateContentS3.class,
      UpdateContentDirect.class,
      DeleteContent.class,
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
    })
public class Ugc implements Runnable {

  @Override
  public void run() {}
}
