/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.session.certificate.*;
import net.accelbyte.sdk.cli.api.session.config.*;
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
      AdminGetLogConfig.class,
      AdminPatchUpdateLogConfig.class,
      AdminGetDSMCConfigurationDefault.class,
      AdminListEnvironmentVariables.class,
      AdminListGlobalConfiguration.class,
      AdminUpdateGlobalConfiguration.class,
      AdminDeleteGlobalConfiguration.class,
      AdminGetConfigurationAlertV1.class,
      AdminUpdateConfigurationAlertV1.class,
      AdminCreateConfigurationAlertV1.class,
      AdminDeleteConfigurationAlertV1.class,
      AdminUploadXBoxCertificate.class,
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
      AdminKickGameSessionMember.class,
      AdminUpdateGameSessionMember.class,
      AdminGetListNativeSession.class,
      AdminQueryParties.class,
      AdminDeleteBulkParties.class,
      AdminGetPlatformCredentials.class,
      AdminUpdatePlatformCredentials.class,
      AdminDeletePlatformCredentials.class,
      AdminDeletePlatformCredentialsByPlatformId.class,
      AdminSyncPlatformCredentials.class,
      AdminGetRecentPlayer.class,
      AdminGetRecentTeamPlayer.class,
      AdminReadSessionStorage.class,
      AdminDeleteUserSessionStorage.class,
      AdminReadUserSessionStorage.class,
      AdminQueryPlayerAttributes.class,
      AdminGetPlayerAttributes.class,
      AdminSyncNativeSession.class,
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
      PublicKickGameSessionMember.class,
      PublicGameSessionReject.class,
      GetSessionServerSecret.class,
      AppendTeamGameSession.class,
      PublicGameSessionCancel.class,
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
      PublicPartyCancel.class,
      PublicPartyKick.class,
      PublicCreateParty.class,
      PublicGetRecentPlayer.class,
      PublicGetRecentTeamPlayer.class,
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
