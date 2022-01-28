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

@Command(name = "getClient", mixinStandardHelpOptions = true)
public class GetClient implements Runnable {

    private static final Logger log = LogManager.getLogger(GetClient.class);

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetClient()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ClientmodelClientResponse response =
            new Clients(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getClient(
                new net.accelbyte.sdk.api.iam.operations.clients.GetClient(
                    clientId
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