package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "tokenGrantV3", mixinStandardHelpOptions = true)
public class TokenGrantV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(TokenGrantV3.class);

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--codeVerifier"}, description = "codeVerifier")
    String codeVerifier;

    @Option(names = {"--redirectUri"}, description = "redirectUri")
    String redirectUri;

    @Option(names = {"--refreshToken"}, description = "refreshToken")
    String refreshToken;

    @Option(names = {"--grantType"}, description = "grantType")
    String grantType;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new TokenGrantV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OauthmodelTokenResponseV3 response =
            new OAuth20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .tokenGrantV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3(
                    clientId
                    ,
                    code
                    ,
                    codeVerifier
                    ,
                    redirectUri
                    ,
                    refreshToken
                    ,
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