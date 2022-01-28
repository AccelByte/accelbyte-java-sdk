package net.accelbyte.sdk.cli.api.eventlog.user_information;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.UserInformation;
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

@Command(name = "lastUserActivityTimeHandler", mixinStandardHelpOptions = true)
public class LastUserActivityTimeHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(LastUserActivityTimeHandler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new LastUserActivityTimeHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsUserLastActivity response =
            new UserInformation(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .lastUserActivityTimeHandler(
                new net.accelbyte.sdk.api.eventlog.operations.user_information.LastUserActivityTimeHandler(
                    namespace,
                    userId
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