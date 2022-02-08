package net.accelbyte.sdk.cli.api.legal.policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Policies;
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

@Command(name = "setDefaultPolicy1", mixinStandardHelpOptions = true)
public class SetDefaultPolicy1 implements Runnable {

    private static final Logger log = LogManager.getLogger(SetDefaultPolicy1.class);

    @Option(names = {"--policyId"}, description = "policyId")
    String policyId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SetDefaultPolicy1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Policies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .setDefaultPolicy1(
                new net.accelbyte.sdk.api.legal.operations.policies.SetDefaultPolicy1(
                    policyId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}