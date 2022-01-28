package net.accelbyte.sdk.cli.api.iam.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Users;
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

@Command(name = "adminSearchUserV3", mixinStandardHelpOptions = true)
public class AdminSearchUserV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminSearchUserV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--by"}, description = "by")
    String by;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    String offset;

    @Option(names = {"--platformBy"}, description = "platformBy")
    String platformBy;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--query"}, description = "query")
    String query;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminSearchUserV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelSearchUsersResponseWithPaginationV3 response =
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminSearchUserV3(
                new net.accelbyte.sdk.api.iam.operations.users.AdminSearchUserV3(
                    namespace,
                    by,
                    endDate,
                    limit,
                    offset,
                    platformBy,
                    platformId,
                    query,
                    startDate
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