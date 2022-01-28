package net.accelbyte.sdk.cli.api.ugc.admin_type;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminType;
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

@Command(name = "adminDeleteType", mixinStandardHelpOptions = true)
public class AdminDeleteType implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminDeleteType.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--typeId"}, description = "typeId")
    String typeId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeleteType()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new AdminType(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminDeleteType(
                new net.accelbyte.sdk.api.ugc.operations.admin_type.AdminDeleteType(
                    namespace,
                    typeId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}