package net.accelbyte.sdk.cli.api.basic.namespace;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.Namespace;
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

@Command(name = "getNamespaces", mixinStandardHelpOptions = true)
public class GetNamespaces implements Runnable {

    private static final Logger log = LogManager.getLogger(GetNamespaces.class);

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetNamespaces()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<NamespaceInfo> response =
            new Namespace(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getNamespaces(
                new net.accelbyte.sdk.api.basic.operations.namespace.GetNamespaces(
                    activeOnly
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