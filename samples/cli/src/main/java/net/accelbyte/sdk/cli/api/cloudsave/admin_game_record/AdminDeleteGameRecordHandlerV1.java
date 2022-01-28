package net.accelbyte.sdk.cli.api.cloudsave.admin_game_record;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.wrappers.AdminGameRecord;
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

@Command(name = "adminDeleteGameRecordHandlerV1", mixinStandardHelpOptions = true)
public class AdminDeleteGameRecordHandlerV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminDeleteGameRecordHandlerV1.class);

    @Option(names = {"--key"}, description = "key")
    String key;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeleteGameRecordHandlerV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new AdminGameRecord(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminDeleteGameRecordHandlerV1(
                new net.accelbyte.sdk.api.cloudsave.operations.admin_game_record.AdminDeleteGameRecordHandlerV1(
                    key,
                    namespace
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}