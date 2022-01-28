package net.accelbyte.sdk.cli.api.platform.key_group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.KeyGroup;
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

@Command(name = "queryKeyGroups", mixinStandardHelpOptions = true)
public class QueryKeyGroups implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryKeyGroups.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--name"}, description = "name")
    String name;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--tag"}, description = "tag")
    String tag;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryKeyGroups()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            KeyGroupPagingSlicedResult response =
            new KeyGroup(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryKeyGroups(
                new net.accelbyte.sdk.api.platform.operations.key_group.QueryKeyGroups(
                    namespace,
                    limit,
                    name,
                    offset,
                    tag
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