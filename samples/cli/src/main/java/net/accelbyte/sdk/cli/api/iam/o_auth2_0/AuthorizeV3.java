package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "authorizeV3", mixinStandardHelpOptions = true)
public class AuthorizeV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AuthorizeV3.class);

    @Option(names = {"--codeChallenge"}, description = "codeChallenge")
    String codeChallenge;

    @Option(names = {"--codeChallengeMethod"}, description = "codeChallengeMethod")
    String codeChallengeMethod;

    @Option(names = {"--redirectUri"}, description = "redirectUri")
    String redirectUri;

    @Option(names = {"--scope"}, description = "scope")
    String scope;

    @Option(names = {"--state"}, description = "state")
    String state;

    @Option(names = {"--targetAuthPage"}, description = "targetAuthPage")
    String targetAuthPage;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--responseType"}, description = "responseType")
    String responseType;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AuthorizeV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new OAuth20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .authorizeV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3(
                    codeChallenge,
                    codeChallengeMethod,
                    redirectUri,
                    scope,
                    state,
                    targetAuthPage,
                    clientId,
                    responseType
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}