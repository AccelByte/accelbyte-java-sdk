/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createNewGroupPublicV2
 *
 * <p>Required valid user authentication
 *
 * <p>This endpoint is used to create new group
 *
 * <p>There are some fields that needs to be fulfilled
 *
 * <p>* **groupDescription**: the description of the group (optional) * **groupIcon**: group icon
 * URL link (optional) * **groupName**: name of the group * **groupRegion**: region of the group *
 * **groupRules**: rules for specific group. It consists of groupCustomRule that can be used to save
 * custom rule, and groupPredefinedRules that has similar usage with configuration, but this rule
 * only works in specific group * **allowedAction**: available action in group service. It consist
 * of joinGroup and inviteGroup * **ruleAttribute**: attribute of the player that needs to be
 * checked * **ruleCriteria**: criteria of the value. The value will be in enum of EQUAL, MINIMUM,
 * MAXIMUM * **ruleValue**: value that needs to be checked * **customAttributes**: additional custom
 * group attributes (optional)
 *
 * <p>Action Code: 73304
 */
@Getter
@Setter
public class CreateNewGroupPublicV2 extends Operation {
  /** generated field's value */
  private String path = "/group/v2/public/namespaces/{namespace}/groups";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelsPublicCreateNewGroupRequestV1 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateNewGroupPublicV2(String namespace, ModelsPublicCreateNewGroupRequestV1 body) {
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
  public ModelsPublicCreateNewGroupRequestV1 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsGroupResponseV1 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGroupResponseV1().createFromJson(json);
  }
}
