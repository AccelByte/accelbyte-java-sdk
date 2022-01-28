package net.accelbyte.sdk.cli.api.gdpr.data_retrieval;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.wrappers.DataRetrieval;
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

@Command(name = "deleteAdminEmailConfiguration", mixinStandardHelpOptions = true)
public class DeleteAdminEmailConfiguration implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteAdminEmailConfiguration.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--emails"}, description = "emails")
    List<String> emails;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteAdminEmailConfiguration()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new DataRetrieval(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .deleteAdminEmailConfiguration(
                new net.accelbyte.sdk.api.gdpr.operations.data_retrieval.DeleteAdminEmailConfiguration(
                    namespace,
                    emails
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}