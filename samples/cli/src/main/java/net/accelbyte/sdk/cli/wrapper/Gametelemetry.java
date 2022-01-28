package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.gametelemetry.operations.*;

import picocli.CommandLine.Command;

@Command(name = "gametelemetry",
        mixinStandardHelpOptions = true,
        subcommands = {
                ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.class,
                ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.class,
                ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.class,
        }
)
public class Gametelemetry implements Runnable {

    @Override
    public void run() {

    }
}