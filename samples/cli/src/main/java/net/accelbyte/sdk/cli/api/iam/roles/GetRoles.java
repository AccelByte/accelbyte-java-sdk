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

@Command(name = "getRoles", mixinStandardHelpOptions = true)
public class GetRoles implements Runnable {

    private static final Logger log = LogManager.getLogger(GetRoles.class);

    @Option(names = {"--isWildcard"}, description = "isWildcard")
    String isWildcard;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetRoles()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<ModelRoleResponseWithManagers> response =
            new Roles(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getRoles(
                new net.accelbyte.sdk.api.iam.operations.roles.GetRoles(
                    isWildcard
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