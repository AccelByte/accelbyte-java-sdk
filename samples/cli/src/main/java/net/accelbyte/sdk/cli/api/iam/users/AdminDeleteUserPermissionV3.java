package net.accelbyte.sdk.cli.api.iam.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Users;
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

@Command(name = "adminDeleteUserPermissionV3", mixinStandardHelpOptions = true)
public class AdminDeleteUserPermissionV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminDeleteUserPermissionV3.class);

    @Option(names = {"--action"}, description = "action")
    Integer action;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--resource"}, description = "resource")
    String resource;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeleteUserPermissionV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminDeleteUserPermissionV3(
                new net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserPermissionV3(
                    action,
                    namespace,
                    resource,
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}