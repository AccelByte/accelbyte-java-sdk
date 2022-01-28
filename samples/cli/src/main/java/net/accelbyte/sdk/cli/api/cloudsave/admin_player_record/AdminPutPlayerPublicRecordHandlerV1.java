package net.accelbyte.sdk.cli.api.cloudsave.admin_player_record;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.wrappers.AdminPlayerRecord;
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

@Command(name = "adminPutPlayerPublicRecordHandlerV1", mixinStandardHelpOptions = true)
public class AdminPutPlayerPublicRecordHandlerV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminPutPlayerPublicRecordHandlerV1.class);

    @Option(names = {"--key"}, description = "key")
    String key;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminPutPlayerPublicRecordHandlerV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new AdminPlayerRecord(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminPutPlayerPublicRecordHandlerV1(
                new net.accelbyte.sdk.api.cloudsave.operations.admin_player_record.AdminPutPlayerPublicRecordHandlerV1(
                    key,
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, ModelsPlayerRecordRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}