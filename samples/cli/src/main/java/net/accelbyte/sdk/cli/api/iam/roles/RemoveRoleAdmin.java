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

@Command(name = "removeRoleAdmin", mixinStandardHelpOptions = true)
public class RemoveRoleAdmin implements Runnable {

    private static final Logger log = LogManager.getLogger(RemoveRoleAdmin.class);

    @Option(names = {"--roleId"}, description = "roleId")
    String roleId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RemoveRoleAdmin()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Roles(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .removeRoleAdmin(
                new net.accelbyte.sdk.api.iam.operations.roles.RemoveRoleAdmin(
                    roleId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}