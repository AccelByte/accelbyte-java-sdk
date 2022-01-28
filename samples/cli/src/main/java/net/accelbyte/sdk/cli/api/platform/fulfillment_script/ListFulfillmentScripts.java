package net.accelbyte.sdk.cli.api.platform.fulfillment_script;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.FulfillmentScript;
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

@Command(name = "listFulfillmentScripts", mixinStandardHelpOptions = true)
public class ListFulfillmentScripts implements Runnable {

    private static final Logger log = LogManager.getLogger(ListFulfillmentScripts.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ListFulfillmentScripts()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<FulfillmentScriptInfo> response =
            new FulfillmentScript(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .listFulfillmentScripts(
                new net.accelbyte.sdk.api.platform.operations.fulfillment_script.ListFulfillmentScripts(
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