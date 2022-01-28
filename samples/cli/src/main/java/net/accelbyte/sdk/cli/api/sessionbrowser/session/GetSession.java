package net.accelbyte.sdk.cli.api.sessionbrowser.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
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

@Command(name = "getSession", mixinStandardHelpOptions = true)
public class GetSession implements Runnable {

    private static final Logger log = LogManager.getLogger(GetSession.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--sessionID"}, description = "sessionID")
    String sessionID;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetSession()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsSessionResponse response =
            new Session(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getSession(
                new net.accelbyte.sdk.api.sessionbrowser.operations.session.GetSession(
                    namespace,
                    sessionID
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