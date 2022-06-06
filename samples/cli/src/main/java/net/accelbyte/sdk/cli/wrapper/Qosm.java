/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.qosm.admin.*;
import net.accelbyte.sdk.cli.api.qosm.public_.*;
import net.accelbyte.sdk.cli.api.qosm.server.*;

import picocli.CommandLine.Command;

@Command(name = "qosm",
        mixinStandardHelpOptions = true,
        subcommands = {
                UpdateServerConfig.class,
                DeleteServer.class,
                SetServerAlias.class,
                ListServerPerNamespace.class,
                ListServer.class,
                Heartbeat.class,
        }
)
public class Qosm implements Runnable {

    @Override
    public void run() {

    }
}