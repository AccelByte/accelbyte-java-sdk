package net.accelbyte.sdk.cli.api.matchmaking.operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Operations;
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

@Command(name = "getHealthcheckInfo", mixinStandardHelpOptions = true)
public class GetHealthcheckInfo implements Runnable {

    private static final Logger log = LogManager.getLogger(GetHealthcheckInfo.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetHealthcheckInfo()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Operations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getHealthcheckInfo(
                new net.accelbyte.sdk.api.matchmaking.operations.operations.GetHealthcheckInfo(
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}