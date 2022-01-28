package net.accelbyte.sdk.cli.api.social.user_statistic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.UserStatistic;
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

@Command(name = "bulkUpdateUserStatItem2", mixinStandardHelpOptions = true)
public class BulkUpdateUserStatItem2 implements Runnable {

    private static final Logger log = LogManager.getLogger(BulkUpdateUserStatItem2.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--additionalKey"}, description = "additionalKey")
    String additionalKey;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new BulkUpdateUserStatItem2()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<BulkStatItemOperationResult> response =
            new UserStatistic(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .bulkUpdateUserStatItem2(
                new net.accelbyte.sdk.api.social.operations.user_statistic.BulkUpdateUserStatItem2(
                    namespace,
                    userId,
                    additionalKey,
                    new ObjectMapper().readValue(body, new TypeReference<List<BulkStatItemUpdate>>() {})
 
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