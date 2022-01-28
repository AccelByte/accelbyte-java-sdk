package net.accelbyte.sdk.cli.api.social.slot;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.Slot;
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

@Command(name = "publicUpdateUserNamespaceSlotMetadata", mixinStandardHelpOptions = true)
public class PublicUpdateUserNamespaceSlotMetadata implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicUpdateUserNamespaceSlotMetadata.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--slotId"}, description = "slotId")
    String slotId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicUpdateUserNamespaceSlotMetadata()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            SlotInfo response =
            new Slot(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicUpdateUserNamespaceSlotMetadata(
                new net.accelbyte.sdk.api.social.operations.slot.PublicUpdateUserNamespaceSlotMetadata(
                    namespace,
                    slotId,
                    userId,
                    new ObjectMapper().readValue(body, SlotMetadataUpdate.class)  
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