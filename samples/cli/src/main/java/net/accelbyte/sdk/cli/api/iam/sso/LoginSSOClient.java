package net.accelbyte.sdk.cli.api.iam.sso;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.SSO;
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

@Command(name = "loginSSOClient", mixinStandardHelpOptions = true)
public class LoginSSOClient implements Runnable {

    private static final Logger log = LogManager.getLogger(LoginSSOClient.class);

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--payload"}, description = "payload")
    String payload;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new LoginSSOClient()).execute(args);
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

            .loginSSOClient(
                new net.accelbyte.sdk.api.iam.operations.sso.LoginSSOClient(
                    platformId,
                    payload
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}