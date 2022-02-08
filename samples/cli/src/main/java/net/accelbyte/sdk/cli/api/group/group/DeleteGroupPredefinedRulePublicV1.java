package net.accelbyte.sdk.cli.api.group.group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.wrappers.Group;
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

@Command(name = "deleteGroupPredefinedRulePublicV1", mixinStandardHelpOptions = true)
public class DeleteGroupPredefinedRulePublicV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteGroupPredefinedRulePublicV1.class);

    @Option(names = {"--allowedAction"}, description = "allowedAction")
    String allowedAction;

    @Option(names = {"--groupId"}, description = "groupId")
    String groupId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteGroupPredefinedRulePublicV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Group(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteGroupPredefinedRulePublicV1(
                new net.accelbyte.sdk.api.group.operations.group.DeleteGroupPredefinedRulePublicV1(
                    allowedAction,
                    groupId,
                    namespace
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}