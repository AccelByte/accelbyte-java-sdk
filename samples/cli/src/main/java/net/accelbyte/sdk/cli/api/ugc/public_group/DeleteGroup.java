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

@Command(name = "deleteGroup", mixinStandardHelpOptions = true)
public class DeleteGroup implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteGroup.class);

    @Option(names = {"--groupId"}, description = "groupId")
    String groupId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteGroup()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new PublicGroup(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteGroup(
                new net.accelbyte.sdk.api.ugc.operations.public_group.DeleteGroup(
                    groupId,
                    namespace,
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}