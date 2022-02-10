package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
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

@Command(name = "publicGetItemByAppId", mixinStandardHelpOptions = true)
public class PublicGetItemByAppId implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicGetItemByAppId.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--language"}, description = "language")
    String language;

    @Option(names = {"--region"}, description = "region")
    String region;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;

    @Option(names = {"--appId"}, description = "appId")
    String appId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetItemByAppId()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            ItemInfo response =
            new Item(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetItemByAppId(
                new net.accelbyte.sdk.api.platform.operations.item.PublicGetItemByAppId(
                    namespace,
                    language,
                    region,
                    storeId,
                    appId
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