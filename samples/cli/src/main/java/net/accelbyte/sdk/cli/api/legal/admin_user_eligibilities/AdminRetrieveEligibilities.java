package net.accelbyte.sdk.cli.api.legal.admin_user_eligibilities;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.AdminUserEligibilities;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "adminRetrieveEligibilities", mixinStandardHelpOptions = true)
public class AdminRetrieveEligibilities implements Callable<Integer> {

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
    public Integer call() {
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
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}