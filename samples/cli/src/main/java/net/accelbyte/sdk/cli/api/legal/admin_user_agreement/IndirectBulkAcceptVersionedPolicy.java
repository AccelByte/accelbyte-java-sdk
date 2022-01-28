package net.accelbyte.sdk.cli.api.legal.admin_user_agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.AdminUserAgreement;
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

@Command(name = "indirectBulkAcceptVersionedPolicy", mixinStandardHelpOptions = true)
public class IndirectBulkAcceptVersionedPolicy implements Runnable {

    private static final Logger log = LogManager.getLogger(IndirectBulkAcceptVersionedPolicy.class);

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

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new IndirectBulkAcceptVersionedPolicy()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            AcceptAgreementResponse response =
            new AdminUserAgreement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .indirectBulkAcceptVersionedPolicy(
                new net.accelbyte.sdk.api.legal.operations.admin_user_agreement.IndirectBulkAcceptVersionedPolicy(
                    namespace,
                    userId,
                    publisherUserId,
                    clientId,
                    countryCode,
                    new ObjectMapper().readValue(body, new TypeReference<List<AcceptAgreementRequest>>() {})
 
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