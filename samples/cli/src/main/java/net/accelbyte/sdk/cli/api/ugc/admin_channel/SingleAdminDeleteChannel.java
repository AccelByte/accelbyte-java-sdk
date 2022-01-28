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

@Command(name = "singleAdminDeleteChannel", mixinStandardHelpOptions = true)
public class SingleAdminDeleteChannel implements Runnable {

    private static final Logger log = LogManager.getLogger(SingleAdminDeleteChannel.class);

    @Option(names = {"--channelId"}, description = "channelId")
    String channelId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SingleAdminDeleteChannel()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new AdminChannel(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .singleAdminDeleteChannel(
                new net.accelbyte.sdk.api.ugc.operations.admin_channel.SingleAdminDeleteChannel(
                    channelId,
                    namespace
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}