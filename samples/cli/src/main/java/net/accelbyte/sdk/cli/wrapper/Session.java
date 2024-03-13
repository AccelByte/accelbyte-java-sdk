/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.session.certificate.*;
import net.accelbyte.sdk.cli.api.session.configuration_template.*;
import net.accelbyte.sdk.cli.api.session.dsmc_default_configuration.*;
import net.accelbyte.sdk.cli.api.session.environment_variable.*;
import net.accelbyte.sdk.cli.api.session.game_session.*;
import net.accelbyte.sdk.cli.api.session.global_configuration.*;
import net.accelbyte.sdk.cli.api.session.max_active.*;
import net.accelbyte.sdk.cli.api.session.native_session.*;
import net.accelbyte.sdk.cli.api.session.operations.*;
import net.accelbyte.sdk.cli.api.session.party.*;
import net.accelbyte.sdk.cli.api.session.platform_credential.*;
import net.accelbyte.sdk.cli.api.session.player.*;
import net.accelbyte.sdk.cli.api.session.recent_player.*;
import net.accelbyte.sdk.cli.api.session.session_storage.*;
import picocli.CommandLine.Command;

@Command(
    name = "session",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetHealthcheckInfo.class,
      GetHealthcheckInfoV1.class,
      AdminGetDSMCConfigurationDefault.class,
      AdminListEnvironmentVariables.class,
      AdminListGlobalConfiguration.class,
      AdminUpdateGlobalConfiguration.class,
      AdminDeleteGlobalConfiguration.class,
      AdminGetConfigurationAlertV1.class,
      AdminUpdateConfigurationAlertV1.class,
      AdminCreateConfigurationAlertV1.class,
      AdminDeleteConfigurationAlertV1.class,
      HandleUploadXboxPFXCertificate.class,
      AdminCreateConfigurationTemplateV1.class,
      AdminGetAllConfigurationTemplatesV1.class,
      AdminGetConfigurationTemplateV1.class,
      AdminUpdateConfigurationTemplateV1.class,
      AdminDeleteConfigurationTemplateV1.class,
      AdminGetMemberActiveSession.class,
      AdminReconcileMaxActiveSession.class,
      AdminGetDSMCConfiguration.class,
      AdminSyncDSMCConfiguration.class,
      AdminQueryGameSessions.class,
      AdminQueryGameSessionsByAttributes.class,
      AdminDeleteBulkGameSessions.class,
      AdminSetDSReady.class,
      AdminUpdateGameSessionMember.class,
      AdminGetListNativeSession.class,
      AdminQueryParties.class,
      AdminGetPlatformCredentials.class,
      AdminUpdatePlatformCredentials.class,
      AdminDeletePlatformCredentials.class,
      AdminGetRecentPlayer.class,
      AdminReadSessionStorage.class,
      AdminDeleteUserSessionStorage.class,
      AdminReadUserSessionStorage.class,
      AdminQueryPlayerAttributes.class,
      AdminGetPlayerAttributes.class,
      CreateGameSession.class,
      PublicQueryGameSessionsByAttributes.class,
      PublicSessionJoinCode.class,
      GetGameSessionByPodName.class,
      GetGameSession.class,
      UpdateGameSession.class,
      DeleteGameSession.class,
      PatchUpdateGameSession.class,
      UpdateGameSessionBackfillTicketID.class,
      GameSessionGenerateCode.class,
      PublicRevokeGameSessionCode.class,
      PublicGameSessionInvite.class,
      JoinGameSession.class,
      PublicPromoteGameSessionLeader.class,
      LeaveGameSession.class,
      PublicGameSessionReject.class,
      GetSessionServerSecret.class,
      AppendTeamGameSession.class,
      PublicPartyJoinCode.class,
      PublicGetParty.class,
      PublicUpdateParty.class,
      PublicPatchUpdateParty.class,
      PublicGeneratePartyCode.class,
      PublicRevokePartyCode.class,
      PublicPartyInvite.class,
      PublicPromotePartyLeader.class,
      PublicPartyJoin.class,
      PublicPartyLeave.class,
      PublicPartyReject.class,
      PublicPartyKick.class,
      PublicCreateParty.class,
      PublicGetRecentPlayer.class,
      PublicUpdateInsertSessionStorageLeader.class,
      PublicUpdateInsertSessionStorage.class,
      PublicGetBulkPlayerCurrentPlatform.class,
      PublicGetPlayerAttributes.class,
      PublicStorePlayerAttributes.class,
      PublicDeletePlayerAttributes.class,
      PublicQueryMyGameSessions.class,
      PublicQueryMyParties.class,
    })
public class Session implements Runnable {

  @Override
  public void run() {}
}
