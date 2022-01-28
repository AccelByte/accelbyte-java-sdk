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

@Command(name = "deleteImage", mixinStandardHelpOptions = true)
public class DeleteImage implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteImage.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--imageURI"}, description = "imageURI")
    String imageURI;

    @Option(names = {"--version"}, description = "version")
    String version;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteImage()).execute(args);
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

            .deleteImage(
                new net.accelbyte.sdk.api.dsmc.operations.image_config.DeleteImage(
                    namespace,
                    imageURI,
                    version
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}