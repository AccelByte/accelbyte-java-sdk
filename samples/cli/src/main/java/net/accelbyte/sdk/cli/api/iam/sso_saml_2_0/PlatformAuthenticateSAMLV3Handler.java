package net.accelbyte.sdk.cli.api.iam.sso_saml_2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.SSOSAML20;
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

@Command(name = "platformAuthenticateSAMLV3Handler", mixinStandardHelpOptions = true)
public class PlatformAuthenticateSAMLV3Handler implements Runnable {

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
    public void run() {
        try {
            new SSOSAML20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
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
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}