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
 * AdminUpdateInputValidations
 *
 * <p>This endpoint is used to update input validation configuration. Supported `field`: -
 * displayName - password - username - email - avatar
 *
 * <p>If `isCustomRegex` is set to true, `regex` parameter will be used as input validation and the
 * other parameters will be ignored. Otherwise, `regex` parameter will be ignored and regex for
 * input validation will be generated based on the combination of the other parameters. If
 * `allowUnicode` is set to true, unicode regex pattern will be use as the input validation and the
 * other parameters will be ignored. Supported `letterCase`: - lowercase - uppercase - mixed:
 * uppercase and lowercase - mixed: uppercase and/or lowercase
 *
 * <p>flexible special character non words with `allowAllSpecialCharacters` if
 * `allowAllSpecialCharacters` is set to true `specialCharacters` will forced to empty. Supported
 * `specialCharacterLocation`: - anywhere - middle
 *
 * <p>If `specialCharacters` is empty, `specialCharacterLocation` and `maxRepeatingSpecialCharacter`
 * will be ignored. `minCharType` is used to identify how many required criteria in the regex. The
 * supported criteria are number, letter, special character, and letter case. If set to 0 or 1 means
 * all criteria are optional. It can be set as much as the number of criteria enabled. If
 * `blockedWord` is set by admin, any input from user which contain kind of blocked word(s) will be
 * blocked for create/upgrade/update account If `avatarConfig` is set, will use this config and skip
 * all the other validation conditions
 */
@Getter
@Setter
public class AdminUpdateInputValidations extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/inputValidations";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private List<ModelInputValidationUpdatePayload> body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateInputValidations(List<ModelInputValidationUpdatePayload> body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public List<ModelInputValidationUpdatePayload> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
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
