package net.accelbyte.sdk.cli.api.platform.payment;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Payment;
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

@Command(name = "queryPaymentNotifications", mixinStandardHelpOptions = true)
public class QueryPaymentNotifications implements Callable<Integer> {

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
    public Integer call() {
        try {
            PaymentNotificationPagingSlicedResult response =
            new Payment(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
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
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
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