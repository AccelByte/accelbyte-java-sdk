/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.operations.artifacts.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Artifacts {

  private AccelByteSDK sdk;

  public Artifacts(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ArtifactGet
   */
  public List<ApiArtifactResponse> artifactGet(ArtifactGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ArtifactUsageGet
   */
  public ApiArtifactUsageResponse artifactUsageGet(ArtifactUsageGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ArtifactDelete
   */
  public void artifactDelete(ArtifactDelete input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ArtifactGetURL
   */
  public ApiArtifactURLResponse artifactGetURL(ArtifactGetURL input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FleetArtifactSamplingRulesGet
   */
  public ApiFleetArtifactsSampleRules fleetArtifactSamplingRulesGet(
      FleetArtifactSamplingRulesGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FleetArtifactSamplingRulesSet
   */
  public void fleetArtifactSamplingRulesSet(FleetArtifactSamplingRulesSet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
