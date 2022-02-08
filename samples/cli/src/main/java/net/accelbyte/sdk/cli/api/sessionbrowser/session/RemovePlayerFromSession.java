package net.accelbyte.sdk.cli.api.sessionbrowser.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "removePlayerFromSession", mixinStandardHelpOptions = true)
public class RemovePlayerFromSession implements Runnable {

    private static final Logger log = LogManager.getLogger(RemovePlayerFromSession.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--sessionID"}, description = "sessionID")
    String sessionID;

    @Option(names = {"--userID"}, description = "userID")
    String userID;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RemovePlayerFromSession()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsAddPlayerResponse response =
            new Session(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .removePlayerFromSession(
                new net.accelbyte.sdk.api.sessionbrowser.operations.session.RemovePlayerFromSession(
                    namespace,
                    sessionID,
                    userID
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}