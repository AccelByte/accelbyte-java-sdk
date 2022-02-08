package net.accelbyte.sdk.cli.api.social.slot;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.Slot;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "publicUpdateUserNamespaceSlot", mixinStandardHelpOptions = true)
public class PublicUpdateUserNamespaceSlot implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicUpdateUserNamespaceSlot.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--slotId"}, description = "slotId")
    String slotId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--label"}, description = "label")
    String label;

    @Option(names = {"--tags"}, description = "tags")
    List<String> tags;

    @Option(names = {"--checksum"}, description = "checksum")
    String checksum;

    @Option(names = {"--customAttribute"}, description = "customAttribute")
    String customAttribute;

    @Option(names = {"--file"}, description = "file")
    File file;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicUpdateUserNamespaceSlot()).execute(args);
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

            .publicUpdateUserNamespaceSlot(
                new net.accelbyte.sdk.api.social.operations.slot.PublicUpdateUserNamespaceSlot(
                    namespace,
                    slotId,
                    userId,
                    label,
                    tags,
                    checksum
                    ,
                    customAttribute
                    ,
                    FileUtils.openInputStream(file)
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