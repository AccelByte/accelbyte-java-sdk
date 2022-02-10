package net.accelbyte.sdk.cli.api.iam.o_auth;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth;
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

@Command(name = "authorization", mixinStandardHelpOptions = true)
public class Authorization implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(Authorization.class);

    @Option(names = {"--login"}, description = "login")
    String login;

    @Option(names = {"--password"}, description = "password")
    String password;

    @Option(names = {"--scope"}, description = "scope")
    String scope;

    @Option(names = {"--state"}, description = "state")
    String state;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--redirectUri"}, description = "redirectUri")
    String redirectUri;

    @Option(names = {"--responseType"}, description = "responseType")
    String responseType;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new Authorization()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            new OAuth(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .authorization(
                new net.accelbyte.sdk.api.iam.operations.o_auth.Authorization(
                    login != null ? login : null
                    ,
                    password != null ? password : null
                    ,
                    scope != null ? scope : null
                    ,
                    state != null ? state : null
                    ,
                    clientId != null ? clientId : null
                    ,
                    redirectUri != null ? redirectUri : null
                    ,
                    responseType != null ? responseType : null
                )
            );
            log.info("Operation successful");
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}