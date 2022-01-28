package net.accelbyte.sdk.cli.api.basic.user_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.UserProfile;
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

@Command(name = "updateMyZipCode", mixinStandardHelpOptions = true)
public class UpdateMyZipCode implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateMyZipCode.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userZipCodeUpdate"}, description = "userZipCodeUpdate")
    String userZipCodeUpdate;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateMyZipCode()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            UserZipCode response =
            new UserProfile(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .updateMyZipCode(
                new net.accelbyte.sdk.api.basic.operations.user_profile.UpdateMyZipCode(
                    namespace,
                    new ObjectMapper().readValue(userZipCodeUpdate, UserZipCodeUpdate.class)  
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