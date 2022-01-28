package net.accelbyte.sdk.cli.api.dslogmanager.operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.wrappers.Operations;
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

@Command(name = "publicGetMessages", mixinStandardHelpOptions = true)
public class PublicGetMessages implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetMessages.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetMessages()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<LogAppMessageDeclaration> response =
            new Operations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .publicGetMessages(
                new net.accelbyte.sdk.api.dslogmanager.operations.operations.PublicGetMessages(
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