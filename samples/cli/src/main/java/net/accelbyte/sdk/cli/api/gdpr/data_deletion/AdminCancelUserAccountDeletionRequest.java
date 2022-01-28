package net.accelbyte.sdk.cli.api.gdpr.data_deletion;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.wrappers.DataDeletion;
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

@Command(name = "adminCancelUserAccountDeletionRequest", mixinStandardHelpOptions = true)
public class AdminCancelUserAccountDeletionRequest implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminCancelUserAccountDeletionRequest.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminCancelUserAccountDeletionRequest()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new DataDeletion(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminCancelUserAccountDeletionRequest(
                new net.accelbyte.sdk.api.gdpr.operations.data_deletion.AdminCancelUserAccountDeletionRequest(
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