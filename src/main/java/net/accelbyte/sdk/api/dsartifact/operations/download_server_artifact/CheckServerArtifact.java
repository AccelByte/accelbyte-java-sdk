/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.operations.download_server_artifact;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsartifact.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * checkServerArtifact
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSAM:ARTIFACT [READ]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint will check artifact file existence before download file.
 *
 * <p>This endpoint will return the artifact status.
 *
 * <p>The possible status is : 'Empty', 'In Queue', 'Uploading', 'Ready', 'Failed'
 */
@Getter
@Setter
public class CheckServerArtifact extends Operation {
  /** generated field's value */
  private String path = "/dsartifact/namespaces/{namespace}/servers/{podName}/artifacts/exists";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json", "text/x-log");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String podName;

  /**
   * @param namespace required
   * @param podName required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CheckServerArtifact(String namespace, String podName) {
    this.namespace = namespace;
    this.podName = podName;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.podName != null) {
      pathParams.put("podName", this.podName);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.podName == null) {
      return false;
    }
    return true;
  }

  public ModelsArtifactFileStatus parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsArtifactFileStatus().createFromJson(json);
  }
}
