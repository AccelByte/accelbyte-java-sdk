package net.accelbyte.sdk.cli.api.ugc.admin_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminContent;
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

@Command(name = "adminSearchChannelSpecificContent", mixinStandardHelpOptions = true)
public class AdminSearchChannelSpecificContent implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminSearchChannelSpecificContent.class);

    @Option(names = {"--channelId"}, description = "channelId")
    String channelId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--creator"}, description = "creator")
    String creator;

    @Option(names = {"--isofficial"}, description = "isofficial")
    String isofficial;

    @Option(names = {"--limit"}, description = "limit")
    String limit;

    @Option(names = {"--name"}, description = "name")
    String name;

    @Option(names = {"--offset"}, description = "offset")
    String offset;

    @Option(names = {"--orderby"}, description = "orderby")
    String orderby;

    @Option(names = {"--sortby"}, description = "sortby")
    String sortby;

    @Option(names = {"--subtype"}, description = "subtype")
    String subtype;

    @Option(names = {"--tags"}, description = "tags")
    String tags;

    @Option(names = {"--type"}, description = "type")
    String type;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminSearchChannelSpecificContent()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsPaginatedContentDownloadResponse response =
            new AdminContent(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .adminSearchChannelSpecificContent(
                new net.accelbyte.sdk.api.ugc.operations.admin_content.AdminSearchChannelSpecificContent(
                    channelId,
                    namespace,
                    creator,
                    isofficial,
                    limit,
                    name,
                    offset,
                    orderby,
                    sortby,
                    subtype,
                    tags,
                    type,
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