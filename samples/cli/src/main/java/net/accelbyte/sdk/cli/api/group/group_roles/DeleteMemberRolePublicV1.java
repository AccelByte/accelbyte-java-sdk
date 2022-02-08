package net.accelbyte.sdk.cli.api.group.group_roles;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.wrappers.GroupRoles;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "deleteMemberRolePublicV1", mixinStandardHelpOptions = true)
public class DeleteMemberRolePublicV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteMemberRolePublicV1.class);

    @Option(names = {"--memberRoleId"}, description = "memberRoleId")
    String memberRoleId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteMemberRolePublicV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsUpdateMemberRoleResponseV1 response =
            new GroupRoles(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteMemberRolePublicV1(
                new net.accelbyte.sdk.api.group.operations.group_roles.DeleteMemberRolePublicV1(
                    memberRoleId,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsRemoveRoleFromMemberRequestV1.class)  
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