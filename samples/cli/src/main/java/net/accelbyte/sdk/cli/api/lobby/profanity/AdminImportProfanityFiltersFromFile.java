package net.accelbyte.sdk.cli.api.lobby.profanity;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Profanity;
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

@Command(name = "adminImportProfanityFiltersFromFile", mixinStandardHelpOptions = true)
public class AdminImportProfanityFiltersFromFile implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminImportProfanityFiltersFromFile.class);

    @Option(names = {"--list"}, description = "list")
    String list;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminImportProfanityFiltersFromFile()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Profanity(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminImportProfanityFiltersFromFile(
                new net.accelbyte.sdk.api.lobby.operations.profanity.AdminImportProfanityFiltersFromFile(
                    list,
                    namespace,
                    new ObjectMapper().readValue(body, new TypeReference<List<Integer>>() {})
 
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}