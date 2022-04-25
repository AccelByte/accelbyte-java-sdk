/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.lobby.friends.*;
import net.accelbyte.sdk.cli.api.lobby.chat.*;
import net.accelbyte.sdk.cli.api.lobby.config.*;
import net.accelbyte.sdk.cli.api.lobby.notification.*;
import net.accelbyte.sdk.cli.api.lobby.party.*;
import net.accelbyte.sdk.cli.api.lobby.lobby_operations.*;
import net.accelbyte.sdk.cli.api.lobby.player.*;
import net.accelbyte.sdk.cli.api.lobby.profanity.*;
import net.accelbyte.sdk.cli.api.lobby.third_party.*;
import net.accelbyte.sdk.cli.api.lobby.presence.*;

import picocli.CommandLine.Command;

@Command(name = "lobby",
        mixinStandardHelpOptions = true,
        subcommands = {
                GetUserFriendsUpdated.class,
                GetUserIncomingFriends.class,
                GetUserOutgoingFriends.class,
                UserRequestFriend.class,
                UserAcceptFriendRequest.class,
                UserCancelFriendRequest.class,
                UserRejectFriendRequest.class,
                UserGetFriendshipStatus.class,
                UserUnfriendRequest.class,
                AddFriendsWithoutConfirmation.class,
                PersonalChatHistory.class,
                AdminChatHistory.class,
                AdminGetAllConfigV1.class,
                AdminGetConfigV1.class,
                AdminUpdateConfigV1.class,
                AdminExportConfigV1.class,
                AdminImportConfigV1.class,
                GetListOfFriends.class,
                SendMultipleUsersFreeformNotificationV1Admin.class,
                SendUsersFreeformNotificationV1Admin.class,
                SendPartyFreeformNotificationV1Admin.class,
                SendPartyTemplatedNotificationV1Admin.class,
                GetAllNotificationTemplatesV1Admin.class,
                CreateNotificationTemplateV1Admin.class,
                SendUsersTemplatedNotificationV1Admin.class,
                GetTemplateSlugLocalizationsTemplateV1Admin.class,
                DeleteNotificationTemplateSlugV1Admin.class,
                GetSingleTemplateLocalizationV1Admin.class,
                UpdateTemplateLocalizationV1Admin.class,
                DeleteTemplateLocalizationV1Admin.class,
                PublishTemplateLocalizationV1Admin.class,
                GetAllNotificationTopicsV1Admin.class,
                CreateNotificationTopicV1Admin.class,
                GetNotificationTopicV1Admin.class,
                UpdateNotificationTopicV1Admin.class,
                DeleteNotificationTopicV1Admin.class,
                SendSpecificUserFreeformNotificationV1Admin.class,
                SendSpecificUserTemplatedNotificationV1Admin.class,
                AdminGetPartyDataV1.class,
                AdminUpdatePartyAttributesV1.class,
                AdminJoinPartyV1.class,
                AdminGetUserPartyV1.class,
                AdminGetLobbyCCU.class,
                AdminGetAllPlayerSessionAttribute.class,
                AdminSetPlayerSessionAttribute.class,
                AdminGetPlayerSessionAttribute.class,
                AdminGetPlayerBlockedPlayersV1.class,
                AdminGetPlayerBlockedByPlayersV1.class,
                AdminBulkBlockPlayersV1.class,
                AdminDebugProfanityFilters.class,
                AdminGetProfanityListFiltersV1.class,
                AdminAddProfanityFilterIntoList.class,
                AdminAddProfanityFilters.class,
                AdminImportProfanityFiltersFromFile.class,
                AdminDeleteProfanityFilter.class,
                AdminGetProfanityLists.class,
                AdminCreateProfanityList.class,
                AdminUpdateProfanityList.class,
                AdminDeleteProfanityList.class,
                AdminGetProfanityRule.class,
                AdminSetProfanityRuleForNamespace.class,
                AdminVerifyMessageProfanityResponse.class,
                AdminGetThirdPartyConfig.class,
                AdminUpdateThirdPartyConfig.class,
                AdminCreateThirdPartyConfig.class,
                AdminDeleteThirdPartyConfig.class,
                PublicGetMessages.class,
                GetPersonalChatHistoryV1Public.class,
                PublicGetPartyDataV1.class,
                PublicUpdatePartyAttributesV1.class,
                PublicGetPlayerBlockedPlayersV1.class,
                PublicGetPlayerBlockedByPlayersV1.class,
                UsersPresenceHandlerV1.class,
                FreeFormNotification.class,
                NotificationWithTemplate.class,
                GetGameTemplate.class,
                CreateTemplate.class,
                GetSlugTemplate.class,
                DeleteTemplateSlug.class,
                GetLocalizationTemplate.class,
                UpdateLocalizationTemplate.class,
                DeleteTemplateLocalization.class,
                PublishTemplate.class,
                GetTopicByNamespace.class,
                CreateTopic.class,
                GetTopicByTopicName.class,
                UpdateTopicByTopicName.class,
                DeleteTopicByTopicName.class,
                FreeFormNotificationByUserID.class,
                NotificationWithTemplateByUserID.class,
        }
)
public class Lobby implements Runnable {

    @Override
    public void run() {

    }
}