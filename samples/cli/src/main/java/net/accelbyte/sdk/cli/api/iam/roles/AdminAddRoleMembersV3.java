package net.accelbyte.sdk.cli.api.iam.roles;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Roles;
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

@Command(name = "adminAddRoleMembersV3", mixinStandardHelpOptions = true)
public class AdminAddRoleMembersV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminAddRoleMembersV3.class);

    @Option(names = {"--roleId"}, description = "roleId")
    String roleId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminAddRoleMembersV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Roles(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .adminAddRoleMembersV3(
                new net.accelbyte.sdk.api.iam.operations.roles.AdminAddRoleMembersV3(
                    roleId,
                    new ObjectMapper().readValue(body, ModelRoleMembersRequestV3.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}