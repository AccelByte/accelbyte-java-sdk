package net.accelbyte.sdk.cli.api.iam.input_validations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.InputValidations;
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

@Command(name = "adminGetInputValidations", mixinStandardHelpOptions = true)
public class AdminGetInputValidations implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminGetInputValidations.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminGetInputValidations()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelInputValidationsResponse response =
            new InputValidations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .adminGetInputValidations(
                new net.accelbyte.sdk.api.iam.operations.input_validations.AdminGetInputValidations(
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