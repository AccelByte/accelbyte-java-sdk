package net.accelbyte.sdk.cli.api.iam.input_validations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.InputValidations;
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

@Command(name = "adminUpdateInputValidations", mixinStandardHelpOptions = true)
public class AdminUpdateInputValidations implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminUpdateInputValidations.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminUpdateInputValidations()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new InputValidations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminUpdateInputValidations(
                new net.accelbyte.sdk.api.iam.operations.input_validations.AdminUpdateInputValidations(
                    new ObjectMapper().readValue(body, new TypeReference<List<ModelInputValidationUpdatePayload>>() {})
 
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}