/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.chat.topic.*;
import net.accelbyte.sdk.cli.api.chat.config.*;
import net.accelbyte.sdk.cli.api.chat.inbox.*;
import net.accelbyte.sdk.cli.api.chat.moderation.*;
import net.accelbyte.sdk.cli.api.chat.profanity.*;
import net.accelbyte.sdk.cli.api.chat.operations.*;

import picocli.CommandLine.Command;

@Command(name = "chat",
        mixinStandardHelpOptions = true,
        subcommands = {
                AdminChatHistory.class,
                AdminCreateNamespaceTopic.class,
                AdminTopicList.class,
                AdminCreateTopic.class,
                AdminChannelTopicList.class,
                AdminChannelTopicSummary.class,
                AdminQueryTopicLog.class,
                AdminUpdateTopic.class,
                AdminDeleteTopic.class,
                AdminBanTopicMembers.class,
                AdminChannelTopicInfo.class,
                AdminTopicChatHistory.class,
                AdminSendChat.class,
                AdminDeleteChat.class,
                AdminTopicMembers.class,
                AdminTopicShards.class,
                AdminUnbanTopicMembers.class,
                AdminAddTopicMember.class,
                AdminRemoveTopicMember.class,
                AdminQueryTopic.class,
                AdminQueryUsersTopic.class,
                PublicGetMutedTopics.class,
                PublicTopicList.class,
                PublicBanTopicMembers.class,
                PublicChatHistory.class,
                PublicDeleteChat.class,
                PublicMuteUser.class,
                PublicUnbanTopicMembers.class,
                PublicUnmuteUser.class,
                AdminGetAllConfigV1.class,
                AdminGetConfigV1.class,
                AdminUpdateConfigV1.class,
                ExportConfig.class,
                ImportConfig.class,
                AdminGetInboxCategories.class,
                AdminAddInboxCategory.class,
                AdminDeleteInboxCategory.class,
                AdminUpdateInboxCategory.class,
                AdminGetCategorySchema.class,
                AdminDeleteInboxMessage.class,
                AdminGetInboxMessages.class,
                AdminSaveInboxMessage.class,
                AdminUnsendInboxMessage.class,
                AdminGetInboxUsers.class,
                AdminUpdateInboxMessage.class,
                AdminSendInboxMessage.class,
                AdminGetInboxStats.class,
                AdminGetChatSnapshot.class,
                AdminDeleteChatSnapshot.class,
                AdminProfanityQuery.class,
                AdminProfanityCreate.class,
                AdminProfanityCreateBulk.class,
                AdminProfanityExport.class,
                AdminProfanityGroup.class,
                AdminProfanityImport.class,
                AdminProfanityUpdate.class,
                AdminProfanityDelete.class,
                PublicGetMessages.class,
                PublicGetChatSnapshot.class,
        }
)
public class Chat implements Runnable {

    @Override
    public void run() {

    }
}