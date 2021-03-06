/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.operations.file_upload.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class FileUpload {

  private AccelByteSDK sdk;

  public FileUpload(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GeneratedUploadUrl
   */
  public FileUploadUrlInfo generatedUploadUrl(GeneratedUploadUrl input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GeneratedUserUploadContentUrl
   */
  public FileUploadUrlInfo generatedUserUploadContentUrl(GeneratedUserUploadContentUrl input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicGeneratedUploadUrl
   */
  public FileUploadUrlInfo publicGeneratedUploadUrl(PublicGeneratedUploadUrl input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicGeneratedUserUploadContentUrl
   */
  public FileUploadUrlInfo publicGeneratedUserUploadContentUrl(
      PublicGeneratedUserUploadContentUrl input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}
