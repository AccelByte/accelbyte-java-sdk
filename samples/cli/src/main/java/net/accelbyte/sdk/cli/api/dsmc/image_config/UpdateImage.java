package net.accelbyte.sdk.cli.api.dsmc.image_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.ImageConfig;
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

@Command(name = "updateImage", mixinStandardHelpOptions = true)
public class UpdateImage implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateImage.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateImage()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new ImageConfig(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateImage(
                new net.accelbyte.sdk.api.dsmc.operations.image_config.UpdateImage(
                    new ObjectMapper().readValue(body, ModelsImageRecordUpdate.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}