package net.accelbyte.sdk.cli.api.platform.payment;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Payment;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "queryPaymentNotifications", mixinStandardHelpOptions = true)
public class QueryPaymentNotifications implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryPaymentNotifications.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--externalId"}, description = "externalId")
    String externalId;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--notificationSource"}, description = "notificationSource")
    String notificationSource;

    @Option(names = {"--notificationType"}, description = "notificationType")
    String notificationType;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--paymentOrderNo"}, description = "paymentOrderNo")
    String paymentOrderNo;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;

    @Option(names = {"--status"}, description = "status")
    String status;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryPaymentNotifications()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PaymentNotificationPagingSlicedResult response =
            new Payment(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .queryPaymentNotifications(
                new net.accelbyte.sdk.api.platform.operations.payment.QueryPaymentNotifications(
                    namespace,
                    endDate,
                    externalId,
                    limit,
                    notificationSource,
                    notificationType,
                    offset,
                    paymentOrderNo,
                    startDate,
                    status
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