package net.accelbyte.sdk.cli.api.group.group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.wrappers.Group;
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

@Command(name = "updateGroupPredefinedRulePublicV1", mixinStandardHelpOptions = true)
public class UpdateGroupPredefinedRulePublicV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateGroupPredefinedRulePublicV1.class);

    @Option(names = {"--allowedAction"}, description = "allowedAction")
    String allowedAction;

    @Option(names = {"--groupId"}, description = "groupId")
    String groupId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateGroupPredefinedRulePublicV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsGroupResponseV1 response =
            new Group(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateGroupPredefinedRulePublicV1(
                new net.accelbyte.sdk.api.group.operations.group.UpdateGroupPredefinedRulePublicV1(
                    allowedAction,
                    groupId,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsUpdateGroupPredefinedRuleRequestV1.class)  
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