package net.accelbyte.sdk.cli.api.platform.ticket;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Ticket;
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

@Command(name = "increaseTicketSale", mixinStandardHelpOptions = true)
public class IncreaseTicketSale implements Runnable {

    private static final Logger log = LogManager.getLogger(IncreaseTicketSale.class);

    @Option(names = {"--boothName"}, description = "boothName")
    String boothName;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new IncreaseTicketSale()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            TicketSaleIncrementResult response =
            new Ticket(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .increaseTicketSale(
                new net.accelbyte.sdk.api.platform.operations.ticket.IncreaseTicketSale(
                    boothName,
                    namespace,
                    new ObjectMapper().readValue(body, TicketSaleIncrementRequest.class)  
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