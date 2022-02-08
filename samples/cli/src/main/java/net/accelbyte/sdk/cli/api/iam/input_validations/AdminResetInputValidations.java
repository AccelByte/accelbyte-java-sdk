package net.accelbyte.sdk.cli.api.iam.input_validations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.InputValidations;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "adminResetInputValidations", mixinStandardHelpOptions = true)
public class AdminResetInputValidations implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminResetInputValidations.class);

    @Option(names = {"--field"}, description = "field")
    String field;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminResetInputValidations()).execute(args);
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

            .adminResetInputValidations(
                new net.accelbyte.sdk.api.iam.operations.input_validations.AdminResetInputValidations(
                    field
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}