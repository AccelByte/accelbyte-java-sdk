package net.accelbyte.sdk.cli.api.ugc.admin_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminContent;
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

@Command(name = "singleAdminUpdateContentDirect", mixinStandardHelpOptions = true)
public class SingleAdminUpdateContentDirect implements Runnable {

    private static final Logger log = LogManager.getLogger(SingleAdminUpdateContentDirect.class);

    @Option(names = {"--channelId"}, description = "channelId")
    String channelId;

    @Option(names = {"--contentId"}, description = "contentId")
    String contentId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SingleAdminUpdateContentDirect()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsCreateContentResponse response =
            new AdminContent(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .singleAdminUpdateContentDirect(
                new net.accelbyte.sdk.api.ugc.operations.admin_content.SingleAdminUpdateContentDirect(
                    channelId,
                    contentId,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsCreateContentRequest.class)  
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