/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.sessionhistory.x_ray.*;
import picocli.CommandLine.Command;

@Command(
    name = "sessionhistory",
    mixinStandardHelpOptions = true,
    subcommands = {
      CreateXrayTicketObservability.class,
      CreateXrayBulkTicketObservability.class,
    })
public class Sessionhistory implements Runnable {

  @Override
  public void run() {}
}
