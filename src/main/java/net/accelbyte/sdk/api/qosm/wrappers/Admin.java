/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.operations.admin.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Admin {

  private AccelByteSDK sdk;

  public Admin(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see UpdateServerConfig
   */
  public void updateServerConfig(UpdateServerConfig input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see DeleteServer
   */
  public void deleteServer(DeleteServer input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see SetServerAlias
   */
  public void setServerAlias(SetServerAlias input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}
