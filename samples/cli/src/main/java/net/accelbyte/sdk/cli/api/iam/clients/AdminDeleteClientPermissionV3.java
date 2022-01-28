package net.accelbyte.sdk.cli.api.iam.clients;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Clients;
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

@Command(name = "adminDeleteClientPermissionV3", mixinStandardHelpOptions = true)
public class AdminDeleteClientPermissionV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminDeleteClientPermissionV3.class);

    @Option(names = {"--action"}, description = "action")
    Integer action;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--resource"}, description = "resource")
    String resource;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeleteClientPermissionV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Clients(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminDeleteClientPermissionV3(
                new net.accelbyte.sdk.api.iam.operations.clients.AdminDeleteClientPermissionV3(
                    action,
                    clientId,
                    namespace,
                    resource
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}