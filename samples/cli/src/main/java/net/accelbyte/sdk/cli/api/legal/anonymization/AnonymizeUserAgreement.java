package net.accelbyte.sdk.cli.api.legal.anonymization;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Anonymization;
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

@Command(name = "anonymizeUserAgreement", mixinStandardHelpOptions = true)
public class AnonymizeUserAgreement implements Runnable {

    private static final Logger log = LogManager.getLogger(AnonymizeUserAgreement.class);

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AnonymizeUserAgreement()).execute(args);
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

            .anonymizeUserAgreement(
                new net.accelbyte.sdk.api.legal.operations.anonymization.AnonymizeUserAgreement(
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}