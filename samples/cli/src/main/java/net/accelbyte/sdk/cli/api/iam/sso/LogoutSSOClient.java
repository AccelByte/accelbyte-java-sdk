package net.accelbyte.sdk.cli.api.iam.sso;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.SSO;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "logoutSSOClient", mixinStandardHelpOptions = true)
public class LogoutSSOClient implements Runnable {

    private static final Logger log = LogManager.getLogger(LogoutSSOClient.class);

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new LogoutSSOClient()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new SSO(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .logoutSSOClient(
                new net.accelbyte.sdk.api.iam.operations.sso.LogoutSSOClient(
                    platformId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}