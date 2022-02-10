package net.accelbyte.sdk.cli.api.legal.agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Agreement;
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

@Command(name = "indirectBulkAcceptVersionedPolicy1", mixinStandardHelpOptions = true)
public class IndirectBulkAcceptVersionedPolicy1 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(IndirectBulkAcceptVersionedPolicy1.class);

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new IndirectBulkAcceptVersionedPolicy1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            AcceptAgreementResponse response =
            new Agreement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .indirectBulkAcceptVersionedPolicy1(
                new net.accelbyte.sdk.api.legal.operations.agreement.IndirectBulkAcceptVersionedPolicy1(
                    userId,
                    new ObjectMapper().readValue(body, new TypeReference<List<AcceptAgreementRequest>>() {})
 
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