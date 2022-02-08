package net.accelbyte.sdk.cli.api.basic.file_upload;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.FileUpload;
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

@Command(name = "publicGeneratedUserUploadContentUrl", mixinStandardHelpOptions = true)
public class PublicGeneratedUserUploadContentUrl implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGeneratedUserUploadContentUrl.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--fileType"}, description = "fileType")
    String fileType;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGeneratedUserUploadContentUrl()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            FileUploadUrlInfo response =
            new FileUpload(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGeneratedUserUploadContentUrl(
                new net.accelbyte.sdk.api.basic.operations.file_upload.PublicGeneratedUserUploadContentUrl(
                    namespace,
                    userId,
                    fileType
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