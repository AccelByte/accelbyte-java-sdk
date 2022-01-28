package net.accelbyte.sdk.cli.api.platform.category;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Category;
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

@Command(name = "publicGetDescendantCategories", mixinStandardHelpOptions = true)
public class PublicGetDescendantCategories implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetDescendantCategories.class);

    @Option(names = {"--categoryPath"}, description = "categoryPath")
    String categoryPath;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--language"}, description = "language")
    String language;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetDescendantCategories()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<CategoryInfo> response =
            new Category(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetDescendantCategories(
                new net.accelbyte.sdk.api.platform.operations.category.PublicGetDescendantCategories(
                    categoryPath,
                    namespace,
                    language,
                    storeId
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