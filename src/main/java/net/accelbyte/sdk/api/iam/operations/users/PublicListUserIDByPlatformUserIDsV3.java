/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonUserPlatforms;
import net.accelbyte.sdk.api.iam.models.ModelPlatformUserIDRequest;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicListUserIDByPlatformUserIDsV3
 *
 * <p>List User ID By Platform User ID This endpoint intended to list game user ID from the given
 * namespace This endpoint return list of user ID by given platform ID and list of platform user ID
 *
 * <p>nintendo platform user ID : NSA ID need to be appended with Environment ID using colon as
 * separator. e.g kmzwa8awaa:dd1
 */
@Getter
@Setter
public class PublicListUserIDByPlatformUserIDsV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/platforms/{platformId}/users";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private ModelPlatformUserIDRequest body;

  /**
   * @param namespace required
   * @param platformId required
   * @param body required
   */
  @Builder
  public PublicListUserIDByPlatformUserIDsV3(
      String namespace, String platformId, ModelPlatformUserIDRequest body) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    return pathParams;
  }

  @Override
  public ModelPlatformUserIDRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public AccountcommonUserPlatforms parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new AccountcommonUserPlatforms().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
