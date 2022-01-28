package net.accelbyte.sdk.cli.api.iam.o_auth;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth;
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

@Command(name = "verifyToken", mixinStandardHelpOptions = true)
public class VerifyToken implements Runnable {

    private static final Logger log = LogManager.getLogger(VerifyToken.class);

    @Option(names = {"--token"}, description = "token")
    String token;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new VerifyToken()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OauthmodelTokenResponse response =
            new OAuth(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .verifyToken(
                new net.accelbyte.sdk.api.iam.operations.o_auth.VerifyToken(
                    token
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}