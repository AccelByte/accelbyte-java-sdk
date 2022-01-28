package net.accelbyte.sdk.cli.api.matchmaking.matchmaking;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
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

@Command(name = "addUserIntoSessionInChannel", mixinStandardHelpOptions = true)
public class AddUserIntoSessionInChannel implements Runnable {

    private static final Logger log = LogManager.getLogger(AddUserIntoSessionInChannel.class);

    @Option(names = {"--channelName"}, description = "channelName")
    String channelName;

    @Option(names = {"--matchID"}, description = "matchID")
    String matchID;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AddUserIntoSessionInChannel()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Matchmaking(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .addUserIntoSessionInChannel(
                new net.accelbyte.sdk.api.matchmaking.operations.matchmaking.AddUserIntoSessionInChannel(
                    channelName,
                    matchID,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsMatchAddUserIntoSessionRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}