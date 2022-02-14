package net.accelbyte.sdk.cli.api.platform.campaign;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Campaign;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "download", mixinStandardHelpOptions = true)
public class Download implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(Download.class);

    @Option(names = {"--campaignId"}, description = "campaignId")
    String campaignId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--batchNo"}, description = "batchNo")
    Integer batchNo;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new Download()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            new Campaign(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .download(
                new net.accelbyte.sdk.api.platform.operations.campaign.Download(
                    campaignId,
                    namespace,
                    batchNo
                )
            );
            log.info("Operation successful");
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}