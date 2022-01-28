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

@Command(name = "tokenGrant", mixinStandardHelpOptions = true)
public class TokenGrant implements Runnable {

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


    public static void main(String[] args) {
            int exitCode = new CommandLine(new TokenGrant()).execute(args);
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

            .tokenGrant(
                new net.accelbyte.sdk.api.iam.operations.o_auth.TokenGrant(
                    code,
                    extendExp,
                    namespace,
                    password,
                    redirectUri,
                    refreshToken,
                    username,
                    grantType
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