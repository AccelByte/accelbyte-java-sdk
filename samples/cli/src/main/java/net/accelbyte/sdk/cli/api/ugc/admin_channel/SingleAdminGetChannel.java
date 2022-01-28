package net.accelbyte.sdk.cli.api.ugc.admin_channel;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminChannel;
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

@Command(name = "singleAdminGetChannel", mixinStandardHelpOptions = true)
public class SingleAdminGetChannel implements Runnable {

    private static final Logger log = LogManager.getLogger(SingleAdminGetChannel.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--limit"}, description = "limit")
    String limit;

    @Option(names = {"--offset"}, description = "offset")
    String offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SingleAdminGetChannel()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsPaginatedGetChannelResponse response =
            new AdminChannel(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .singleAdminGetChannel(
                new net.accelbyte.sdk.api.ugc.operations.admin_channel.SingleAdminGetChannel(
                    namespace,
                    limit,
                    offset
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