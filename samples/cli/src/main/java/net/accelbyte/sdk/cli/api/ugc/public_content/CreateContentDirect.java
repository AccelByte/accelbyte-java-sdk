package net.accelbyte.sdk.cli.api.ugc.public_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicContent;
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

@Command(name = "createContentDirect", mixinStandardHelpOptions = true)
public class CreateContentDirect implements Runnable {

    private static final Logger log = LogManager.getLogger(CreateContentDirect.class);

    @Option(names = {"--channelId"}, description = "channelId")
    String channelId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CreateContentDirect()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsCreateContentResponse response =
            new PublicContent(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .createContentDirect(
                new net.accelbyte.sdk.api.ugc.operations.public_content.CreateContentDirect(
                    channelId,
                    namespace,
                    userId,
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