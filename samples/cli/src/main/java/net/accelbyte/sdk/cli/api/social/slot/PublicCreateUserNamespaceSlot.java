package net.accelbyte.sdk.cli.api.social.slot;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.Slot;
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

@Command(name = "publicCreateUserNamespaceSlot", mixinStandardHelpOptions = true)
public class PublicCreateUserNamespaceSlot implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicCreateUserNamespaceSlot.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--label"}, description = "label")
    String label;

    @Option(names = {"--tags"}, description = "tags")
    List<String> tags;

    @Option(names = {"--checksum"}, description = "checksum")
    String checksum;

    @Option(names = {"--customAttribute"}, description = "customAttribute")
    String customAttribute;

    @Option(names = {"--file"}, description = "file")
    File file;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicCreateUserNamespaceSlot()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            new Slot(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicCreateUserNamespaceSlot(
                new net.accelbyte.sdk.api.social.operations.slot.PublicCreateUserNamespaceSlot(
                    namespace,
                    userId,
                    label,
                    tags,
                    checksum != null ? checksum : null
                    ,
                    customAttribute != null ? customAttribute : null
                    ,
                    file != null ? FileUtils.openInputStream(file) : null
                )
            );
            log.info("Operation successful");
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}