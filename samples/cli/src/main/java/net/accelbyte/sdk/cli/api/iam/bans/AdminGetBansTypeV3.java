package net.accelbyte.sdk.cli.api.iam.bans;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Bans;
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

@Command(name = "adminGetBansTypeV3", mixinStandardHelpOptions = true)
public class AdminGetBansTypeV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminGetBansTypeV3.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminGetBansTypeV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            AccountcommonBansV3 response =
            new Bans(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .adminGetBansTypeV3(
                new net.accelbyte.sdk.api.iam.operations.bans.AdminGetBansTypeV3(
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