package net.accelbyte.sdk.cli.api.platform.iap;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.IAP;
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

@Command(name = "updateSteamIAPConfig", mixinStandardHelpOptions = true)
public class UpdateSteamIAPConfig implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateSteamIAPConfig.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateSteamIAPConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            SteamIAPConfigInfo response =
            new IAP(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .updateSteamIAPConfig(
                new net.accelbyte.sdk.api.platform.operations.iap.UpdateSteamIAPConfig(
                    namespace,
                    new ObjectMapper().readValue(body, SteamIAPConfigRequest.class)  
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