package net.accelbyte.sdk.cli.api.seasonpass.season;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Season;
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

@Command(name = "resetUserSeason", mixinStandardHelpOptions = true)
public class ResetUserSeason implements Runnable {

    private static final Logger log = LogManager.getLogger(ResetUserSeason.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ResetUserSeason()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Season(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .resetUserSeason(
                new net.accelbyte.sdk.api.seasonpass.operations.season.ResetUserSeason(
                    namespace,
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}