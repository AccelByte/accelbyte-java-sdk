/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth;
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

@Command(name = "tokenGrant", mixinStandardHelpOptions = true)
public class TokenGrant implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(TokenGrant.class);

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--extendExp"}, description = "extendExp")
    Boolean extendExp;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

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
        int exitCode = new CommandLine(new TokenGrant()).execute(args);
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
            
            OauthmodelTokenResponse response =
            new OAuth(sdk)
            .tokenGrant(
                new net.accelbyte.sdk.api.iam.operations.o_auth.TokenGrant(
                    code != null ? code : null
                    ,
                    extendExp != null ? extendExp : null
                    ,
                    namespace != null ? namespace : null
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
        } catch (HttpResponseException e) {
            log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}