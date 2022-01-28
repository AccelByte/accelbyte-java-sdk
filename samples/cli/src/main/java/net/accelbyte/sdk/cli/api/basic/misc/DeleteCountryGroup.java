package net.accelbyte.sdk.cli.api.basic.misc;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.Misc;
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

@Command(name = "deleteCountryGroup", mixinStandardHelpOptions = true)
public class DeleteCountryGroup implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteCountryGroup.class);

    @Option(names = {"--countryGroupCode"}, description = "countryGroupCode")
    String countryGroupCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteCountryGroup()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Misc(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteCountryGroup(
                new net.accelbyte.sdk.api.basic.operations.misc.DeleteCountryGroup(
                    countryGroupCode,
                    namespace
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}