package net.accelbyte.sdk.cli.api.social.stat_configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.StatConfiguration;
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

@Command(name = "importStats", mixinStandardHelpOptions = true)
public class ImportStats implements Runnable {

    private static final Logger log = LogManager.getLogger(ImportStats.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--replaceExisting"}, description = "replaceExisting")
    Boolean replaceExisting;

    @Option(names = {"--file"}, description = "file")
    File file;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ImportStats()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            StatImportInfo response =
            new StatConfiguration(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .importStats(
                new net.accelbyte.sdk.api.social.operations.stat_configuration.ImportStats(
                    namespace,
                    replaceExisting,
                    FileUtils.openInputStream(file)
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