package net.accelbyte.sdk.cli.api.platform.anonymization;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Anonymization;
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

@Command(name = "anonymizeIntegration", mixinStandardHelpOptions = true)
public class AnonymizeIntegration implements Runnable {

    private static final Logger log = LogManager.getLogger(AnonymizeIntegration.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AnonymizeIntegration()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Anonymization(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .anonymizeIntegration(
                new net.accelbyte.sdk.api.platform.operations.anonymization.AnonymizeIntegration(
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