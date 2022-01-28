package net.accelbyte.sdk.cli.api.sessionbrowser.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "getSessionByUserIDs", mixinStandardHelpOptions = true)
public class GetSessionByUserIDs implements Runnable {

    private static final Logger log = LogManager.getLogger(GetSessionByUserIDs.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userIds"}, description = "userIds")
    String userIds;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetSessionByUserIDs()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsSessionByUserIDsResponse response =
            new Session(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getSessionByUserIDs(
                new net.accelbyte.sdk.api.sessionbrowser.operations.session.GetSessionByUserIDs(
                    namespace,
                    userIds
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