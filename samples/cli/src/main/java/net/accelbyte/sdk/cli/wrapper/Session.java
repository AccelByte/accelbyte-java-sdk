/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.session.configuration_template.*;
import net.accelbyte.sdk.cli.api.session.game_session.*;
import net.accelbyte.sdk.cli.api.session.operations.*;
import net.accelbyte.sdk.cli.api.session.party.*;
import picocli.CommandLine.Command;

@Command(
    name = "session",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetHealthcheckInfo.class,
      GetHealthcheckInfoV1.class,
      AdminCreateConfigurationTemplateV1.class,
      AdminGetAllConfigurationTemplatesV1.class,
      AdminGetConfigurationTemplateV1.class,
      AdminUpdateConfigurationTemplateV1.class,
      AdminDeleteConfigurationTemplateV1.class,
      AdminQueryGameSessions.class,
      AdminUpdateGameSessionMember.class,
      AdminQueryParties.class,
      CreateGameSession.class,
      PublicQueryGameSessions.class,
      GetGameSessionByPodName.class,
      GetGameSession.class,
      UpdateGameSession.class,
      DeleteGameSession.class,
      PatchUpdateGameSession.class,
      PublicGameSessionInvite.class,
      JoinGameSession.class,
      LeaveGameSession.class,
      PublicGameSessionReject.class,
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
      PublicQueryMyGameSessions.class,
      PublicQueryMyParties.class,
    })
public class Session implements Runnable {

  @Override
  public void run() {}
}
