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

@Command(name = "saveAdminEmailConfiguration", mixinStandardHelpOptions = true)
public class SaveAdminEmailConfiguration implements Runnable {

    private static final Logger log = LogManager.getLogger(SaveAdminEmailConfiguration.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SaveAdminEmailConfiguration()).execute(args);
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

            .saveAdminEmailConfiguration(
                new net.accelbyte.sdk.api.gdpr.operations.data_retrieval.SaveAdminEmailConfiguration(
                    namespace,
                    new ObjectMapper().readValue(body, new TypeReference<List<String>>() {})
 
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}