/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "tokenGrantV3", mixinStandardHelpOptions = true)
public class TokenGrantV3 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(TokenGrantV3.class);

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--codeVerifier"}, description = "codeVerifier")
    String codeVerifier;

    @Option(names = {"--extendExp"}, description = "extendExp")
    Boolean extendExp;

    @Option(names = {"--password"}, description = "password")
    String password;

    @Option(names = {"--redirectUri"}, description = "redirectUri")
    String redirectUri;

    @Option(names = {"--refreshToken"}, description = "refreshToken")
    String refreshToken;

    @Option(names = {"--username"}, description = "username")
    String username;

    @Option(names = {"--grantType"}, description = "grantType")
    String grantType;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new TokenGrantV3()).execute(args);
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
            
            OauthmodelTokenResponseV3 response =
            new OAuth20(sdk)
            .tokenGrantV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3(
                    clientId != null ? clientId : null
                    ,
                    code != null ? code : null
                    ,
                    codeVerifier != null ? codeVerifier : null
                    ,
                    extendExp != null ? extendExp : null
                    ,
                    password != null ? password : null
                    ,
                    redirectUri != null ? redirectUri : null
                    ,
                    refreshToken != null ? refreshToken : null
                    ,
                    username != null ? username : null
                    ,
                    grantType != null ? grantType : null
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