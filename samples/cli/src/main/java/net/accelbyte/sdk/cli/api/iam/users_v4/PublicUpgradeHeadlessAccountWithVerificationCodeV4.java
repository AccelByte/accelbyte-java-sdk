package net.accelbyte.sdk.cli.api.iam.users_v4;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
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

@Command(name = "publicUpgradeHeadlessAccountWithVerificationCodeV4", mixinStandardHelpOptions = true)
public class PublicUpgradeHeadlessAccountWithVerificationCodeV4 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicUpgradeHeadlessAccountWithVerificationCodeV4.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicUpgradeHeadlessAccountWithVerificationCodeV4()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            AccountUserResponseV4 response =
            new UsersV4(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicUpgradeHeadlessAccountWithVerificationCodeV4(
                new net.accelbyte.sdk.api.iam.operations.users_v4.PublicUpgradeHeadlessAccountWithVerificationCodeV4(
                    namespace,
                    new ObjectMapper().readValue(body, AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4.class)  
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