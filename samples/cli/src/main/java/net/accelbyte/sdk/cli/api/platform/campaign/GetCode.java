package net.accelbyte.sdk.cli.api.platform.campaign;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Campaign;
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

@Command(name = "getCode", mixinStandardHelpOptions = true)
public class GetCode implements Runnable {

    private static final Logger log = LogManager.getLogger(GetCode.class);

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--redeemable"}, description = "redeemable")
    Boolean redeemable;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetCode()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            CodeInfo response =
            new Campaign(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getCode(
                new net.accelbyte.sdk.api.platform.operations.campaign.GetCode(
                    code,
                    namespace,
                    redeemable
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