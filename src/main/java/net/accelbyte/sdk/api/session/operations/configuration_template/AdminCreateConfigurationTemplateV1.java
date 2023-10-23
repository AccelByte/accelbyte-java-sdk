/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.configuration_template;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminCreateConfigurationTemplateV1
 *
 * <p>Create template configuration to be applied across party and session. Session configuration
 * mandatory : - name - joinability (example value : OPEN, CLOSED, INVITE_ONLY) - autoJoin: when
 * enabled, players will automatically join the initial game session creation. Game session will not
 * send any invite and players dont need to act upon it. default: false (disabled) - Type (example
 * value : P2P, DS, NONE) if type empty, type will be assign to NONE - MinPlayers (must greater or
 * equal 0) - MaxPlayers (must greater than 0) - InviteTimeout (must greater or equal 0) if
 * InviteTimeout equal 0 will be use default DefaultTimeoutSecond (60s) - InactiveTimeout (must
 * greater or equal 0) if InactiveTimeout equal 0 will be use default DefaultTimeoutSecond (60s) -
 * Persistent will only applies to session with type DS (example value true or false, default:
 * false) - If Persistent True the session always active even DS removing or terminate and Session
 * will be request DS again until DS Ready or Busy. - To Stop Session Not request again to DS or
 * want Delete Session can Delete Session using endpoint DELETE
 * /session/v1/public/namespaces/{namespace}/gamesessions/{sessionId} - If Persistent False the
 * session will be inactive if all member left and DS terminate or removing - nativeSessionSetting:
 * - XboxSessionTemplateName: the XBox session template name that correspondent to the AB session
 * template, and is needed to define XBox session's joinRestriction and maxMembersCount when doing
 * the session sync. - XboxServiceConfigID: the XBox service configuration ID. - PSNServiceLabel:
 * the PSN service label. - SessionTitle: the session title. In PSN, this will be used to define
 * name of the session thats displayed on PlayStation system UI. - ShouldSync: to define whether the
 * service needs to do session sync with native platform(s). Default: false (disabled). -
 * PSNSupportedPlatforms: the PSN supported platforms. In PSN, if ShouldSync true and
 * PSNSupportedPlatforms is empty, then PS5 will be set as default value. - PSNBaseUrl this is for
 * base URL PSN if not set will be default value https://s2s.sp-int.playstation.net. In a single
 * namespace only 1 PSN Env that can be used. Multiple session template should refers to the same
 * PSN Env as we have in IAM Service. - https://s2s.sp-int.playstation.net (DEV, need IP Whitelist)
 * - https://s2s.prod-qa.playstation.net (QA Environment/PSN Certification) -
 * https://s2s.np.playstation.net (Production) - localizedSessionName : for localized name and
 * default language example payload : "localizedSessionName":{ "defaultLanguage" : "en-US"
 * "localizedText" :{ "en-US" : "title" } } - if the game client wants to enable push context to
 * PSN, game client will need to store PSN_PUSH_CONTEXT_ID on the player attributes, otherwise
 * Session service will try to populate from the session attributes or auto generate with random
 * UUID if empty. - TieTeamsSessionLifetime (optional, default: false): If it is set to true, the
 * lifetime of any partyId session inside teams attribute will be tied to the game session. Only
 * applies when the teams partyId is game session.
 */
@Getter
@Setter
public class AdminCreateConfigurationTemplateV1 extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/configuration";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApimodelsCreateConfigurationTemplateRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateConfigurationTemplateV1(
      String namespace, ApimodelsCreateConfigurationTemplateRequest body) {
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
  public ApimodelsCreateConfigurationTemplateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsConfigurationTemplateResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsConfigurationTemplateResponse().createFromJson(json);
  }
}
