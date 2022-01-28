package net.accelbyte.sdk.cli.api.platform.campaign;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Campaign;
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

@Command(name = "getCampaignDynamic", mixinStandardHelpOptions = true)
public class GetCampaignDynamic implements Runnable {

    private static final Logger log = LogManager.getLogger(GetCampaignDynamic.class);

    @Option(names = {"--campaignId"}, description = "campaignId")
    String campaignId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetCampaignDynamic()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            CampaignDynamicInfo response =
            new Campaign(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getCampaignDynamic(
                new net.accelbyte.sdk.api.platform.operations.campaign.GetCampaignDynamic(
                    campaignId,
                    namespace
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