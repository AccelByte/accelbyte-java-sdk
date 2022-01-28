package net.accelbyte.sdk.cli.api.dsmc.public_;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.Public;
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

@Command(name = "listProviders", mixinStandardHelpOptions = true)
public class ListProviders implements Runnable {

    private static final Logger log = LogManager.getLogger(ListProviders.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ListProviders()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<String> response =
            new Public(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .listProviders(
                new net.accelbyte.sdk.api.dsmc.operations.public_.ListProviders(
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