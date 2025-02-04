/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.loginqueue.admin_v1.*;
import net.accelbyte.sdk.cli.api.loginqueue.ticket_v1.*;
import picocli.CommandLine.Command;

@Command(
    name = "loginqueue",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminGetConfiguration.class,
      AdminUpdateConfiguration.class,
      AdminGetStatus.class,
      RefreshTicket.class,
      CancelTicket.class,
    })
public class Loginqueue implements Runnable {

  @Override
  public void run() {}
}
