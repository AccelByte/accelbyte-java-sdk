package net.accelbyte.sdk.cli.api.iam.users_v4;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
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

@Command(name = "adminUpdateMyUserV4", mixinStandardHelpOptions = true)
public class AdminUpdateMyUserV4 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminUpdateMyUserV4.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminUpdateMyUserV4()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelUserResponseV3 response =
            new UsersV4(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminUpdateMyUserV4(
                new net.accelbyte.sdk.api.iam.operations.users_v4.AdminUpdateMyUserV4(
                    new ObjectMapper().readValue(body, ModelUserUpdateRequestV3.class)  
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