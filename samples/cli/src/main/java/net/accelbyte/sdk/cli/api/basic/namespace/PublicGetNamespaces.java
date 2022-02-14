package net.accelbyte.sdk.cli.api.basic.namespace;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.Namespace;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "publicGetNamespaces", mixinStandardHelpOptions = true)
public class PublicGetNamespaces implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicGetNamespaces.class);

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetNamespaces()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            List<NamespaceInfo> response =
            new Namespace(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetNamespaces(
                new net.accelbyte.sdk.api.basic.operations.namespace.PublicGetNamespaces(
                    activeOnly
                )
            );
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}