package net.accelbyte.sdk.cli.api.platform.order;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Order;
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

@Command(name = "downloadUserOrderReceipt", mixinStandardHelpOptions = true)
public class DownloadUserOrderReceipt implements Runnable {

    private static final Logger log = LogManager.getLogger(DownloadUserOrderReceipt.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--orderNo"}, description = "orderNo")
    String orderNo;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DownloadUserOrderReceipt()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Order(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .downloadUserOrderReceipt(
                new net.accelbyte.sdk.api.platform.operations.order.DownloadUserOrderReceipt(
                    namespace,
                    orderNo,
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}