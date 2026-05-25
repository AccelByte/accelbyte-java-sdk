/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.input_validations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class InputValidations {

  private AccelByteSDK sdk;

  public InputValidations(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetInputValidations
   * @deprecated
   */
  @Deprecated
  public ModelInputValidationsResponse adminGetInputValidations(AdminGetInputValidations input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateInputValidations
   * @deprecated
   */
  @Deprecated
  public void adminUpdateInputValidations(AdminUpdateInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetInputValidations
   * @deprecated
   */
  @Deprecated
  public void adminResetInputValidations(AdminResetInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetNamespaceScopedInputValidations
   */
  public ModelInputValidationsResponse adminGetNamespaceScopedInputValidations(
      AdminGetNamespaceScopedInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateNamespaceScopedInputValidations
   */
  public void adminUpdateNamespaceScopedInputValidations(
      AdminUpdateNamespaceScopedInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetNamespaceScopedInputValidations
   */
  public void adminResetNamespaceScopedInputValidations(
      AdminResetNamespaceScopedInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetInputValidations
   * @deprecated
   */
  @Deprecated
  public ModelInputValidationsPublicResponse publicGetInputValidations(
      PublicGetInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetInputValidationByField
   * @deprecated
   */
  @Deprecated
  public ModelInputValidationConfigVersion publicGetInputValidationByField(
      PublicGetInputValidationByField input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetNamespaceScopedInputValidations
   */
  public ModelInputValidationsPublicResponse publicGetNamespaceScopedInputValidations(
      PublicGetNamespaceScopedInputValidations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetNamespaceScopedInputValidationByField
   */
  public ModelInputValidationConfigVersion publicGetNamespaceScopedInputValidationByField(
      PublicGetNamespaceScopedInputValidationByField input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
