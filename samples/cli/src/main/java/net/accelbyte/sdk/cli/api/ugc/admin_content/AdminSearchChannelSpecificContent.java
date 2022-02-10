package net.accelbyte.sdk.cli.api.ugc.admin_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminContent;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "adminSearchChannelSpecificContent", mixinStandardHelpOptions = true)
public class AdminSearchChannelSpecificContent implements Callable<Integer> {

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
    public Integer call() {
        try {
            ModelsPaginatedContentDownloadResponse response =
            new AdminContent(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
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
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}