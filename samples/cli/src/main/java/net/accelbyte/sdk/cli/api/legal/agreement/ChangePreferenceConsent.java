package net.accelbyte.sdk.cli.api.legal.agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Agreement;
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

@Command(name = "changePreferenceConsent", mixinStandardHelpOptions = true)
public class ChangePreferenceConsent implements Runnable {

    private static final Logger log = LogManager.getLogger(ChangePreferenceConsent.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ChangePreferenceConsent()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Agreement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .changePreferenceConsent(
                new net.accelbyte.sdk.api.legal.operations.agreement.ChangePreferenceConsent(
                    new ObjectMapper().readValue(body, new TypeReference<List<AcceptAgreementRequest>>() {})
 
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}