package net.accelbyte.sdk.cli.api.eventlog.event_v2;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventV2;
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

@Command(name = "queryEventStreamHandler", mixinStandardHelpOptions = true)
public class QueryEventStreamHandler implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(QueryEventStreamHandler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--offset"}, description = "offset")
    Float offset;

    @Option(names = {"--pageSize"}, description = "pageSize")
    Float pageSize;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryEventStreamHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            ModelsEventResponseV2 response =
            new EventV2(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryEventStreamHandler(
                new net.accelbyte.sdk.api.eventlog.operations.event_v2.QueryEventStreamHandler(
                    namespace,
                    endDate,
                    offset,
                    pageSize,
                    startDate,
                    new ObjectMapper().readValue(body, ModelsGenericQueryPayload.class)  
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}