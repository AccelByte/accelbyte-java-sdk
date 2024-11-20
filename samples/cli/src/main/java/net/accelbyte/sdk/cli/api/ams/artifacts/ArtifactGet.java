/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ams.artifacts;

import com.fasterxml.jackson.databind.ObjectMapper;
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

@Command(name = "artifactGet", mixinStandardHelpOptions = true)
public class ArtifactGet implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ArtifactGet.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--artifactType"},
      description = "artifactType")
  String artifactType;

  @Option(
      names = {"--count"},
      description = "count")
  Integer count;

  @Option(
      names = {"--endDate"},
      description = "endDate")
  String endDate;

  @Option(
      names = {"--fleetID"},
      description = "fleetID")
  String fleetID;

  @Option(
      names = {"--imageID"},
      description = "imageID")
  String imageID;

  @Option(
      names = {"--maxSize"},
      description = "maxSize")
  Integer maxSize;

  @Option(
      names = {"--minSize"},
      description = "minSize")
  Integer minSize;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--serverId"},
      description = "serverId")
  String serverId;

  @Option(
      names = {"--sortBy"},
      description = "sortBy")
  String sortBy;

  @Option(
      names = {"--sortDirection"},
      description = "sortDirection")
  String sortDirection;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new ArtifactGet()).execute(args);
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
      final net.accelbyte.sdk.api.ams.operations.artifacts.ArtifactGet operation =
          net.accelbyte.sdk.api.ams.operations.artifacts.ArtifactGet.builder()
              .namespace(namespace)
              .artifactType(artifactType)
              .count(count)
              .endDate(endDate)
              .fleetID(fleetID)
              .imageID(imageID)
              .maxSize(maxSize)
              .minSize(minSize)
              .offset(offset)
              .region(region)
              .serverId(serverId)
              .sortBy(sortBy)
              .sortDirection(sortDirection)
              .startDate(startDate)
              .status(status)
              .build();
      final ApiArtifactListResponse response = wrapper.artifactGet(operation);
      final String responseString =
          new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
      log.info("Operation successful\n{}", responseString);
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
