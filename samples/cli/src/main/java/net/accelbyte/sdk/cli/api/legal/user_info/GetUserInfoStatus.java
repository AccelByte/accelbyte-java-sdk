package net.accelbyte.sdk.cli.api.legal.user_info;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.UserInfo;
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

@Command(name = "getUserInfoStatus", mixinStandardHelpOptions = true)
public class GetUserInfoStatus implements Runnable {

    private static final Logger log = LogManager.getLogger(GetUserInfoStatus.class);

    @Option(names = {"--namespaces"}, description = "namespaces")
    String namespaces;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetUserInfoStatus()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<RetrieveUserInfoCacheStatusResponse> response =
            new UserInfo(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getUserInfoStatus(
                new net.accelbyte.sdk.api.legal.operations.user_info.GetUserInfoStatus(
                    namespaces
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