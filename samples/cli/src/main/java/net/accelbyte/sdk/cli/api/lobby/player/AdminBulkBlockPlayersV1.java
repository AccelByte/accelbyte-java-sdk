package net.accelbyte.sdk.cli.api.lobby.player;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Player;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "adminBulkBlockPlayersV1", mixinStandardHelpOptions = true)
public class AdminBulkBlockPlayersV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminBulkBlockPlayersV1.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminBulkBlockPlayersV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Player(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .adminBulkBlockPlayersV1(
                new net.accelbyte.sdk.api.lobby.operations.player.AdminBulkBlockPlayersV1(
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, ModelsListBlockedPlayerRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}