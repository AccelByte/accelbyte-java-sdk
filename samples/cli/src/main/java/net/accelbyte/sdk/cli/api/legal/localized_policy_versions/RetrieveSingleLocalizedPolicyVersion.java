/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.legal.localized_policy_versions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.LocalizedPolicyVersions;
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

@Command(name = "retrieveSingleLocalizedPolicyVersion", mixinStandardHelpOptions = true)
public class RetrieveSingleLocalizedPolicyVersion implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(RetrieveSingleLocalizedPolicyVersion.class);

    @Option(names = {"--localizedPolicyVersionId"}, description = "localizedPolicyVersionId")
    String localizedPolicyVersionId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveSingleLocalizedPolicyVersion()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            UpdateLocalizedPolicyVersionResponse response =
            new LocalizedPolicyVersions(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .retrieveSingleLocalizedPolicyVersion(
                new net.accelbyte.sdk.api.legal.operations.localized_policy_versions.RetrieveSingleLocalizedPolicyVersion(
                    localizedPolicyVersionId
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