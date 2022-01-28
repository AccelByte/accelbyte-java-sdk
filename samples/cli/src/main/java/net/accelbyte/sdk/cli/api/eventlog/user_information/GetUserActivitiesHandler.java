package net.accelbyte.sdk.cli.api.eventlog.user_information;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.UserInformation;
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

@Command(name = "getUserActivitiesHandler", mixinStandardHelpOptions = true)
public class GetUserActivitiesHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(GetUserActivitiesHandler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--offset"}, description = "offset")
    Float offset;

    @Option(names = {"--pageSize"}, description = "pageSize")
    Float pageSize;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetUserActivitiesHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsEventResponse response =
            new UserInformation(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getUserActivitiesHandler(
                new net.accelbyte.sdk.api.eventlog.operations.user_information.GetUserActivitiesHandler(
                    namespace,
                    userId,
                    offset,
                    pageSize
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