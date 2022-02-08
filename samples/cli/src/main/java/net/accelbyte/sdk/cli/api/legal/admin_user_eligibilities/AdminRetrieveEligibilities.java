package net.accelbyte.sdk.cli.api.legal.admin_user_eligibilities;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.AdminUserEligibilities;
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

@Command(name = "adminRetrieveEligibilities", mixinStandardHelpOptions = true)
public class AdminRetrieveEligibilities implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminRetrieveEligibilities.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--publisherUserId"}, description = "publisherUserId")
    String publisherUserId;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--countryCode"}, description = "countryCode")
    String countryCode;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminRetrieveEligibilities()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RetrieveUserEligibilitiesIndirectResponse response =
            new AdminUserEligibilities(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminRetrieveEligibilities(
                new net.accelbyte.sdk.api.legal.operations.admin_user_eligibilities.AdminRetrieveEligibilities(
                    namespace,
                    userId,
                    publisherUserId,
                    clientId,
                    countryCode
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