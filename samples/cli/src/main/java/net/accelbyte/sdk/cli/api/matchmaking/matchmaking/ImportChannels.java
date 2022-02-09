package net.accelbyte.sdk.cli.api.matchmaking.matchmaking;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
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

@Command(name = "importChannels", mixinStandardHelpOptions = true)
public class ImportChannels implements Runnable {

    private static final Logger log = LogManager.getLogger(ImportChannels.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--file"}, description = "file")
    File file;

    @Option(names = {"--strategy"}, description = "strategy")
    String strategy;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ImportChannels()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsImportConfigResponse response =
            new Matchmaking(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .importChannels(
                new net.accelbyte.sdk.api.matchmaking.operations.matchmaking.ImportChannels(
                    namespace,
                    file != null ? FileUtils.openInputStream(file) : null
                    ,
                    strategy != null ? strategy : null
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