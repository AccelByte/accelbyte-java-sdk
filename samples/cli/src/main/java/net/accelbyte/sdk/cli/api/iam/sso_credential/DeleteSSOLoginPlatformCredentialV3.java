package net.accelbyte.sdk.cli.api.iam.sso_credential;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.SSOCredential;
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

@Command(name = "deleteSSOLoginPlatformCredentialV3", mixinStandardHelpOptions = true)
public class DeleteSSOLoginPlatformCredentialV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteSSOLoginPlatformCredentialV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteSSOLoginPlatformCredentialV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new SSOCredential(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteSSOLoginPlatformCredentialV3(
                new net.accelbyte.sdk.api.iam.operations.sso_credential.DeleteSSOLoginPlatformCredentialV3(
                    namespace,
                    platformId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}