/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0_extension;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
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

@Command(name = "platformAuthenticationV3", mixinStandardHelpOptions = true)
public class PlatformAuthenticationV3 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PlatformAuthenticationV3.class);

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--error"}, description = "error")
    String error;

    @Option(names = {"--openidAssocHandle"}, description = "openidAssocHandle")
    String openidAssocHandle;

    @Option(names = {"--openidClaimedId"}, description = "openidClaimedId")
    String openidClaimedId;

    @Option(names = {"--openidIdentity"}, description = "openidIdentity")
    String openidIdentity;

    @Option(names = {"--openidMode"}, description = "openidMode")
    String openidMode;

    @Option(names = {"--openidNs"}, description = "openidNs")
    String openidNs;

    @Option(names = {"--openidOpEndpoint"}, description = "openidOpEndpoint")
    String openidOpEndpoint;

    @Option(names = {"--openidResponseNonce"}, description = "openidResponseNonce")
    String openidResponseNonce;

    @Option(names = {"--openidReturnTo"}, description = "openidReturnTo")
    String openidReturnTo;

    @Option(names = {"--openidSig"}, description = "openidSig")
    String openidSig;

    @Option(names = {"--openidSigned"}, description = "openidSigned")
    String openidSigned;

    @Option(names = {"--state"}, description = "state")
    String state;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PlatformAuthenticationV3()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        try {
            OkhttpClient httpClient = new OkhttpClient();
            if (logging) {
                httpClient.setLogger(new OkhttpLogger());
            }
            AccelByteSDK sdk = new AccelByteSDK(httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
            
            new OAuth20Extension(sdk)
            .platformAuthenticationV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.PlatformAuthenticationV3(
                    platformId,
                    code,
                    error,
                    openidAssocHandle,
                    openidClaimedId,
                    openidIdentity,
                    openidMode,
                    openidNs,
                    openidOpEndpoint,
                    openidResponseNonce,
                    openidReturnTo,
                    openidSig,
                    openidSigned,
                    state
                )
            );
            log.info("Operation successful");
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