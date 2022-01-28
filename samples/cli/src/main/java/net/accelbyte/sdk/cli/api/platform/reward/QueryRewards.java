package net.accelbyte.sdk.cli.api.platform.reward;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Reward;
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

@Command(name = "queryRewards", mixinStandardHelpOptions = true)
public class QueryRewards implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryRewards.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--eventTopic"}, description = "eventTopic")
    String eventTopic;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--sortBy"}, description = "sortBy")
    String sortBy;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryRewards()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RewardPagingSlicedResult response =
            new Reward(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryRewards(
                new net.accelbyte.sdk.api.platform.operations.reward.QueryRewards(
                    namespace,
                    eventTopic,
                    limit,
                    offset,
                    sortBy
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