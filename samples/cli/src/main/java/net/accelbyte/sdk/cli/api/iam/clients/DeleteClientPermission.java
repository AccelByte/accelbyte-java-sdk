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

@Command(name = "deleteClientPermission", mixinStandardHelpOptions = true)
public class DeleteClientPermission implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteClientPermission.class);

    @Option(names = {"--action"}, description = "action")
    Integer action;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--resource"}, description = "resource")
    String resource;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteClientPermission()).execute(args);
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

            .deleteClientPermission(
                new net.accelbyte.sdk.api.iam.operations.clients.DeleteClientPermission(
                    action,
                    clientId,
                    resource
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}