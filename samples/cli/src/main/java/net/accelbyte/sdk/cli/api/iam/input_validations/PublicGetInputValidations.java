package net.accelbyte.sdk.cli.api.iam.input_validations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.InputValidations;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "publicGetInputValidations", mixinStandardHelpOptions = true)
public class PublicGetInputValidations implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicGetInputValidations.class);

    @Option(names = {"--defaultOnEmpty"}, description = "defaultOnEmpty")
    Boolean defaultOnEmpty;

    @Option(names = {"--languageCode"}, description = "languageCode")
    String languageCode;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetInputValidations()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            ModelInputValidationsPublicResponse response =
            new InputValidations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetInputValidations(
                new net.accelbyte.sdk.api.iam.operations.input_validations.PublicGetInputValidations(
                    defaultOnEmpty,
                    languageCode
                )
            );
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}