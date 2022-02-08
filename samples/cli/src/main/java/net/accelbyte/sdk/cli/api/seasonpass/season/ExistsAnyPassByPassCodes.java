package net.accelbyte.sdk.cli.api.seasonpass.season;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Season;
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

@Command(name = "existsAnyPassByPassCodes", mixinStandardHelpOptions = true)
public class ExistsAnyPassByPassCodes implements Runnable {

    private static final Logger log = LogManager.getLogger(ExistsAnyPassByPassCodes.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--passCodes"}, description = "passCodes")
    List<String> passCodes;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ExistsAnyPassByPassCodes()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            Ownership response =
            new Season(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .existsAnyPassByPassCodes(
                new net.accelbyte.sdk.api.seasonpass.operations.season.ExistsAnyPassByPassCodes(
                    namespace,
                    userId,
                    passCodes
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