package net.accelbyte.sdk.cli.api.gdpr.data_deletion;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.wrappers.DataDeletion;
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

@Command(name = "adminGetListDeletionDataRequest", mixinStandardHelpOptions = true)
public class AdminGetListDeletionDataRequest implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminGetListDeletionDataRequest.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--after"}, description = "after")
    String after;

    @Option(names = {"--before"}, description = "before")
    String before;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--requestDate"}, description = "requestDate")
    String requestDate;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminGetListDeletionDataRequest()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsListDeletionDataResponse response =
            new DataDeletion(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminGetListDeletionDataRequest(
                new net.accelbyte.sdk.api.gdpr.operations.data_deletion.AdminGetListDeletionDataRequest(
                    namespace,
                    after,
                    before,
                    limit,
                    offset,
                    requestDate
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