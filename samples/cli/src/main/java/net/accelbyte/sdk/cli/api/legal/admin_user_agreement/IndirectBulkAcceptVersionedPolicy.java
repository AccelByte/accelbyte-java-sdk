/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.legal.admin_user_agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.AdminUserAgreement;
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

@Command(name = "indirectBulkAcceptVersionedPolicy", mixinStandardHelpOptions = true)
public class IndirectBulkAcceptVersionedPolicy implements Callable<Integer> {

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
    public Integer call() {
        try {
            AcceptAgreementResponse response =
            new AdminUserAgreement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
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