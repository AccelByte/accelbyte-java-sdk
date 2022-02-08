package net.accelbyte.sdk.cli.api.lobby.friends;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Friends;
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

@Command(name = "userAcceptFriendRequest", mixinStandardHelpOptions = true)
public class UserAcceptFriendRequest implements Runnable {

    private static final Logger log = LogManager.getLogger(UserAcceptFriendRequest.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UserAcceptFriendRequest()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Friends(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .userAcceptFriendRequest(
                new net.accelbyte.sdk.api.lobby.operations.friends.UserAcceptFriendRequest(
                    namespace,
                    new ObjectMapper().readValue(body, ModelUserAcceptFriendRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}