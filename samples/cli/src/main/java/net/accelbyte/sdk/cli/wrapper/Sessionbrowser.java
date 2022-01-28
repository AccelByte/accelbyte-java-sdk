package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.sessionbrowser.session.*;

import picocli.CommandLine.Command;

@Command(name = "sessionbrowser",
        mixinStandardHelpOptions = true,
        subcommands = {
                GetTotalActiveSession.class,
                GetActiveCustomGameSessions.class,
                GetActiveMatchmakingGameSessions.class,
                AdminGetSession.class,
                QuerySession.class,
                CreateSession.class,
                GetSessionByUserIDs.class,
                GetSession.class,
                UpdateSession.class,
                DeleteSession.class,
                JoinSession.class,
                DeleteSessionLocalDS.class,
                AddPlayerToSession.class,
                RemovePlayerFromSession.class,
                GetRecentPlayer.class,
        }
)
public class Sessionbrowser implements Runnable {

    @Override
    public void run() {

    }
}