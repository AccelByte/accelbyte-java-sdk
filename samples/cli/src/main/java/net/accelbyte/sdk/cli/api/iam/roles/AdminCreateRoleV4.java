package net.accelbyte.sdk.cli.api.iam.roles;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Roles;
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

@Command(name = "adminCreateRoleV4", mixinStandardHelpOptions = true)
public class AdminCreateRoleV4 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminCreateRoleV4.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminCreateRoleV4()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelRoleV4Response response =
            new Roles(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminCreateRoleV4(
                new net.accelbyte.sdk.api.iam.operations.roles.AdminCreateRoleV4(
                    new ObjectMapper().readValue(body, ModelRoleV4Request.class)  
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