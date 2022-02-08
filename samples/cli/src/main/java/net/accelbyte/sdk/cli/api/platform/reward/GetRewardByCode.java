package net.accelbyte.sdk.cli.api.platform.reward;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Reward;
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

@Command(name = "getRewardByCode", mixinStandardHelpOptions = true)
public class GetRewardByCode implements Runnable {

    private static final Logger log = LogManager.getLogger(GetRewardByCode.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--rewardCode"}, description = "rewardCode")
    String rewardCode;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetRewardByCode()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RewardInfo response =
            new Reward(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getRewardByCode(
                new net.accelbyte.sdk.api.platform.operations.reward.GetRewardByCode(
                    namespace,
                    rewardCode
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