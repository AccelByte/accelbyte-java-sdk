package net.accelbyte.sdk.cli.api.ugc.public_group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicGroup;
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

@Command(name = "getGroupContent", mixinStandardHelpOptions = true)
public class GetGroupContent implements Runnable {

    private static final Logger log = LogManager.getLogger(GetGroupContent.class);

    @Option(names = {"--groupId"}, description = "groupId")
    String groupId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--limit"}, description = "limit")
    String limit;

    @Option(names = {"--offset"}, description = "offset")
    String offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetGroupContent()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsPaginatedContentDownloadResponse response =
            new PublicGroup(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getGroupContent(
                new net.accelbyte.sdk.api.ugc.operations.public_group.GetGroupContent(
                    groupId,
                    namespace,
                    userId,
                    limit,
                    offset
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