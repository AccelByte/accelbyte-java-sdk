package net.accelbyte.sdk.cli.api.group.group_member;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.wrappers.GroupMember;
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

@Command(name = "getGroupMembersListPublicV1", mixinStandardHelpOptions = true)
public class GetGroupMembersListPublicV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(GetGroupMembersListPublicV1.class);

    @Option(names = {"--groupId"}, description = "groupId")
    String groupId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--order"}, description = "order")
    String order;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetGroupMembersListPublicV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsGetGroupMemberListResponseV1 response =
            new GroupMember(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getGroupMembersListPublicV1(
                new net.accelbyte.sdk.api.group.operations.group_member.GetGroupMembersListPublicV1(
                    groupId,
                    namespace,
                    limit,
                    offset,
                    order
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