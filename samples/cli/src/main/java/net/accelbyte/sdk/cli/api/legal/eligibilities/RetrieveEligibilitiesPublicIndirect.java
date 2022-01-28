package net.accelbyte.sdk.cli.api.legal.eligibilities;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Eligibilities;
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

@Command(name = "retrieveEligibilitiesPublicIndirect", mixinStandardHelpOptions = true)
public class RetrieveEligibilitiesPublicIndirect implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrieveEligibilitiesPublicIndirect.class);

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--countryCode"}, description = "countryCode")
    String countryCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveEligibilitiesPublicIndirect()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RetrieveUserEligibilitiesIndirectResponse response =
            new Eligibilities(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .retrieveEligibilitiesPublicIndirect(
                new net.accelbyte.sdk.api.legal.operations.eligibilities.RetrieveEligibilitiesPublicIndirect(
                    clientId,
                    countryCode,
                    namespace,
                    userId
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