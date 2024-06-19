/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ams.artifacts;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.wrappers.Artifacts;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "artifactBulkDelete", mixinStandardHelpOptions = true)
public class ArtifactBulkDelete implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ArtifactBulkDelete.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--artifactType"},
      description = "artifactType")
  String artifactType;

  @Option(
      names = {"--fleetId"},
      description = "fleetId")
  String fleetId;

  @Option(
      names = {"--uploadedBefore"},
      description = "uploadedBefore")
  String uploadedBefore;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new ArtifactBulkDelete()).execute(args);
    System.exit(exitCode);
  }

  @Override
  public Integer call() {
    try {
      final OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      final AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      final Artifacts wrapper = new Artifacts(sdk);
      final net.accelbyte.sdk.api.ams.operations.artifacts.ArtifactBulkDelete operation =
          net.accelbyte.sdk.api.ams.operations.artifacts.ArtifactBulkDelete.builder()
              .namespace(namespace)
              .artifactType(artifactType)
              .fleetId(fleetId)
              .uploadedBefore(uploadedBefore)
              .build();
      wrapper.artifactBulkDelete(operation);
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
