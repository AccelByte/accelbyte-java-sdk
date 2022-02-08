package net.accelbyte.sdk.cli.api.platform.key_group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.KeyGroup;
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

@Command(name = "updateKeyGroup", mixinStandardHelpOptions = true)
public class UpdateKeyGroup implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateKeyGroup.class);

    @Option(names = {"--keyGroupId"}, description = "keyGroupId")
    String keyGroupId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateKeyGroup()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            KeyGroupInfo response =
            new KeyGroup(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateKeyGroup(
                new net.accelbyte.sdk.api.platform.operations.key_group.UpdateKeyGroup(
                    keyGroupId,
                    namespace,
                    new ObjectMapper().readValue(body, KeyGroupUpdate.class)  
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