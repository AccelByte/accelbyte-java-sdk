package net.accelbyte.sdk.cli.api.ugc.admin_tag;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminTag;
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

@Command(name = "adminDeleteTag", mixinStandardHelpOptions = true)
public class AdminDeleteTag implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminDeleteTag.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--tagId"}, description = "tagId")
    String tagId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeleteTag()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new AdminTag(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .adminDeleteTag(
                new net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminDeleteTag(
                    namespace,
                    tagId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}