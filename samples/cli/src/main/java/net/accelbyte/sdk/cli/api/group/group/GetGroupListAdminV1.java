package net.accelbyte.sdk.cli.api.group.group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.wrappers.Group;
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

@Command(name = "getGroupListAdminV1", mixinStandardHelpOptions = true)
public class GetGroupListAdminV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(GetGroupListAdminV1.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--configurationCode"}, description = "configurationCode")
    String configurationCode;

    @Option(names = {"--groupName"}, description = "groupName")
    String groupName;

    @Option(names = {"--groupRegion"}, description = "groupRegion")
    String groupRegion;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetGroupListAdminV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsGetGroupsListResponseV1 response =
            new Group(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getGroupListAdminV1(
                new net.accelbyte.sdk.api.group.operations.group.GetGroupListAdminV1(
                    namespace,
                    configurationCode,
                    groupName,
                    groupRegion,
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