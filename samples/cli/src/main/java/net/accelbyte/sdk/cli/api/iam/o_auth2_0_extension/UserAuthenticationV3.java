/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0_extension;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
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

@Command(name = "userAuthenticationV3", mixinStandardHelpOptions = true)
public class UserAuthenticationV3 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(UserAuthenticationV3.class);

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--extendExp"}, description = "extendExp")
    Boolean extendExp;

    @Option(names = {"--redirectUri"}, description = "redirectUri")
    String redirectUri;

    @Option(names = {"--password"}, description = "password")
    String password;

    @Option(names = {"--requestId"}, description = "requestId")
    String requestId;

    @Option(names = {"--userName"}, description = "userName")
    String userName;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new UserAuthenticationV3()).execute(args);
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
            OAuth20Extension wrapper = new OAuth20Extension(sdk);
            net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3 operation =
                    net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3.builder()
                            .clientId(clientId != null ? clientId : null)
                            .extendExp(extendExp != null ? extendExp : null)
                            .redirectUri(redirectUri != null ? redirectUri : null)
                            .password(password != null ? password : null)
                            .requestId(requestId != null ? requestId : null)
                            .userName(userName != null ? userName : null)
                            .build();
                    wrapper.userAuthenticationV3(operation);
            log.info("Operation successful");
            return 0;
        } catch (HttpResponseException e) {
            log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}