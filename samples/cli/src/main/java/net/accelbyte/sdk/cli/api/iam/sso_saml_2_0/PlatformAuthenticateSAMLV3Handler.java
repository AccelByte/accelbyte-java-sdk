/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.iam.sso_saml_2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.SSOSAML20;
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

@Command(name = "platformAuthenticateSAMLV3Handler", mixinStandardHelpOptions = true)
public class PlatformAuthenticateSAMLV3Handler implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PlatformAuthenticateSAMLV3Handler.class);

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--error"}, description = "error")
    String error;

    @Option(names = {"--state"}, description = "state")
    String state;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PlatformAuthenticateSAMLV3Handler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            new SSOSAML20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .platformAuthenticateSAMLV3Handler(
                new net.accelbyte.sdk.api.iam.operations.sso_saml_2_0.PlatformAuthenticateSAMLV3Handler(
                    platformId,
                    code,
                    error,
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