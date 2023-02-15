/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.notification.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Notification {

  private AccelByteSDK sdk;

  public Notification(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see SendMultipleUsersFreeformNotificationV1Admin
   */
  public void sendMultipleUsersFreeformNotificationV1Admin(
      SendMultipleUsersFreeformNotificationV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendUsersFreeformNotificationV1Admin
   */
  public void sendUsersFreeformNotificationV1Admin(SendUsersFreeformNotificationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendPartyFreeformNotificationV1Admin
   */
  public void sendPartyFreeformNotificationV1Admin(SendPartyFreeformNotificationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendPartyTemplatedNotificationV1Admin
   */
  public void sendPartyTemplatedNotificationV1Admin(SendPartyTemplatedNotificationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllNotificationTemplatesV1Admin
   */
  public List<ModelNotificationTemplateResponse> getAllNotificationTemplatesV1Admin(
      GetAllNotificationTemplatesV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNotificationTemplateV1Admin
   */
  public void createNotificationTemplateV1Admin(CreateNotificationTemplateV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendUsersTemplatedNotificationV1Admin
   */
  public void sendUsersTemplatedNotificationV1Admin(SendUsersTemplatedNotificationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTemplateSlugLocalizationsTemplateV1Admin
   */
  public ModelGetAllNotificationTemplateSlugResp getTemplateSlugLocalizationsTemplateV1Admin(
      GetTemplateSlugLocalizationsTemplateV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNotificationTemplateSlugV1Admin
   */
  public void deleteNotificationTemplateSlugV1Admin(DeleteNotificationTemplateSlugV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSingleTemplateLocalizationV1Admin
   */
  public ModelLocalization getSingleTemplateLocalizationV1Admin(
      GetSingleTemplateLocalizationV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateTemplateLocalizationV1Admin
   */
  public void updateTemplateLocalizationV1Admin(UpdateTemplateLocalizationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteTemplateLocalizationV1Admin
   */
  public void deleteTemplateLocalizationV1Admin(DeleteTemplateLocalizationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublishTemplateLocalizationV1Admin
   */
  public void publishTemplateLocalizationV1Admin(PublishTemplateLocalizationV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllNotificationTopicsV1Admin
   */
  public ModelGetAllNotificationTopicsResponse getAllNotificationTopicsV1Admin(
      GetAllNotificationTopicsV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNotificationTopicV1Admin
   */
  public void createNotificationTopicV1Admin(CreateNotificationTopicV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNotificationTopicV1Admin
   */
  public ModelNotificationTopicResponseV1 getNotificationTopicV1Admin(
      GetNotificationTopicV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateNotificationTopicV1Admin
   */
  public void updateNotificationTopicV1Admin(UpdateNotificationTopicV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNotificationTopicV1Admin
   */
  public void deleteNotificationTopicV1Admin(DeleteNotificationTopicV1Admin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendSpecificUserFreeformNotificationV1Admin
   */
  public void sendSpecificUserFreeformNotificationV1Admin(
      SendSpecificUserFreeformNotificationV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendSpecificUserTemplatedNotificationV1Admin
   */
  public void sendSpecificUserTemplatedNotificationV1Admin(
      SendSpecificUserTemplatedNotificationV1Admin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTopicByNamespace
   */
  public ModelTopicByNamespacesResponse getTopicByNamespace(GetTopicByNamespace input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateTopic
   */
  public void createTopic(CreateTopic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTopicByTopicName
   */
  public ModelNotificationTopicResponse getTopicByTopicName(GetTopicByTopicName input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateTopicByTopicName
   */
  public void updateTopicByTopicName(UpdateTopicByTopicName input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteTopicByTopicName
   */
  public void deleteTopicByTopicName(DeleteTopicByTopicName input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FreeFormNotificationByUserID
   */
  public void freeFormNotificationByUserID(FreeFormNotificationByUserID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see NotificationWithTemplateByUserID
   */
  public void notificationWithTemplateByUserID(NotificationWithTemplateByUserID input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
