package net.accelbyte.sdk.cli.api.gdpr.data_retrieval;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.wrappers.DataRetrieval;
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

@Command(name = "adminGeneratePersonalDataURL", mixinStandardHelpOptions = true)
public class AdminGeneratePersonalDataURL implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminGeneratePersonalDataURL.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--requestDate"}, description = "requestDate")
    String requestDate;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--password"}, description = "password")
    String password;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminGeneratePersonalDataURL()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsUserDataURL response =
            new DataRetrieval(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminGeneratePersonalDataURL(
                new net.accelbyte.sdk.api.gdpr.operations.data_retrieval.AdminGeneratePersonalDataURL(
                    namespace,
                    requestDate,
                    userId,
                    password
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