package net.accelbyte.sdk.cli.api.seasonpass.pass;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Pass;
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

@Command(name = "getPass", mixinStandardHelpOptions = true)
public class GetPass implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(GetPass.class);

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--seasonId"}, description = "seasonId")
    String seasonId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetPass()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            PassInfo response =
            new Pass(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getPass(
                new net.accelbyte.sdk.api.seasonpass.operations.pass.GetPass(
                    code,
                    namespace,
                    seasonId
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
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