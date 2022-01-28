package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.qosm.admin.*;
import net.accelbyte.sdk.cli.api.qosm.public_.*;
import net.accelbyte.sdk.cli.api.qosm.server.*;

import picocli.CommandLine.Command;

@Command(name = "qosm",
        mixinStandardHelpOptions = true,
        subcommands = {
                DeleteServer.class,
                SetServerAlias.class,
                ListServer.class,
                Heartbeat.class,
        }
)
public class Qosm implements Runnable {

    @Override
    public void run() {

    }
}