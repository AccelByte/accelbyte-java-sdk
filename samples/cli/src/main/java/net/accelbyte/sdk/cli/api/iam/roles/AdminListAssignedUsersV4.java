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

@Command(name = "adminListAssignedUsersV4", mixinStandardHelpOptions = true)
public class AdminListAssignedUsersV4 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminListAssignedUsersV4.class);

    @Option(names = {"--roleId"}, description = "roleId")
    String roleId;

    @Option(names = {"--after"}, description = "after")
    String after;

    @Option(names = {"--before"}, description = "before")
    String before;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminListAssignedUsersV4()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelListAssignedUsersV4Response response =
            new Roles(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminListAssignedUsersV4(
                new net.accelbyte.sdk.api.iam.operations.roles.AdminListAssignedUsersV4(
                    roleId,
                    after,
                    before,
                    limit
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