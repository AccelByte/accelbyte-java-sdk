/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.session.certificate;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.wrappers.Certificate;
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

@Command(name = "adminUploadXBoxCertificate", mixinStandardHelpOptions = true)
public class AdminUploadXBoxCertificate implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminUploadXBoxCertificate.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--description"},
      description = "description")
  String description;

  @Option(
      names = {"--certname"},
      description = "certname")
  String certname;

  @Option(
      names = {"--file"},
      description = "file")
  File file;

  @Option(
      names = {"--password"},
      description = "password")
  String password;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminUploadXBoxCertificate()).execute(args);
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
      final Certificate wrapper = new Certificate(sdk);
      final net.accelbyte.sdk.api.session.operations.certificate.AdminUploadXBoxCertificate
          operation =
              net.accelbyte.sdk.api.session.operations.certificate.AdminUploadXBoxCertificate
                  .builder()
                  .namespace(namespace)
                  .description(description != null ? description : null)
                  .certname(certname != null ? certname : null)
                  .file(file != null ? file : null)
                  .password(password != null ? password : null)
                  .build();
      final ModelsPlatformCredentials response = wrapper.adminUploadXBoxCertificate(operation);
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
