/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.input_validations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminUpdateNamespaceScopedInputValidations
 *
 * <p>Updates input validation configuration. Supported namespace: - publisher namespace - studio
 * namespace
 *
 * <p>Supported `field`: - displayName - password - username - email - avatar
 *
 * <p>If `isCustomRegex` is set to true, `regex` parameter will be used as input validation and the
 * other parameters will be ignored. Otherwise, `regex` parameter will be ignored and regex for
 * input validation will be generated based on the combination of the other parameters. If
 * `allowUnicode` is set to true, unicode regex pattern will be use as the input validation and the
 * other parameters will be ignored. Supported `letterCase`: - lowercase - uppercase - mixed:
 * uppercase and lowercase - any: uppercase and/or lowercase
 *
 * <p>To allow flexible non-word special characters, use `allowAllSpecialCharacters`. If
 * `allowAllSpecialCharacters` is set to true, `specialCharacters` will be forced to empty.
 * Supported `specialCharacterLocation`: - anywhere - middle
 *
 * <p>If `specialCharacters` is empty, `specialCharacterLocation` and `maxRepeatingSpecialCharacter`
 * will be ignored. `minCharType` is used to identify how many required criteria in the regex. The
 * supported criteria are number, letter, special character, and letter case. If set to 0 or 1, all
 * criteria are optional. It can be set as much as the number of criteria enabled. If `blockedWord`
 * is set by an admin, any user input containing a blocked word will be rejected during account
 * creation, upgrade, or update. If `avatarConfig` is set, will use this config and skip all the
 * other validation conditions.
 *
 * <p>These are the boundary values for string length: minLength: 1, maxLength: 256
 */
@Getter
@Setter
public class AdminUpdateNamespaceScopedInputValidations extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/inputValidations";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private List<ModelInputValidationUpdatePayload> body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateNamespaceScopedInputValidations(
      String namespace, List<ModelInputValidationUpdatePayload> body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public List<ModelInputValidationUpdatePayload> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
