package net.accelbyte.sdk.cli.api.ugc.public_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicContent;
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

@Command(name = "downloadContentByShareCode", mixinStandardHelpOptions = true)
public class DownloadContentByShareCode implements Runnable {

    private static final Logger log = LogManager.getLogger(DownloadContentByShareCode.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--shareCode"}, description = "shareCode")
    String shareCode;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DownloadContentByShareCode()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsContentDownloadResponse response =
            new PublicContent(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .downloadContentByShareCode(
                new net.accelbyte.sdk.api.ugc.operations.public_content.DownloadContentByShareCode(
                    namespace,
                    shareCode
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