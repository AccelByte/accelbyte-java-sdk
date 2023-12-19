/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.operations.topic.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Topic {

  private AccelByteSDK sdk;

  public Topic(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminChatHistory
   */
  public ModelsChatMessageWithPaginationResponse adminChatHistory(AdminChatHistory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateNamespaceTopic
   */
  public ApiCreateTopicResponse adminCreateNamespaceTopic(AdminCreateNamespaceTopic input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTopicList
   */
  public List<ModelsTopicResponse> adminTopicList(AdminTopicList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateTopic
   */
  public ApiCreateTopicResponse adminCreateTopic(AdminCreateTopic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChannelTopicList
   */
  public ModelsChannelTopicWithPaginationResponse adminChannelTopicList(AdminChannelTopicList input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChannelTopicSummary
   */
  public ModelsChannelTopicSummaryResponse adminChannelTopicSummary(AdminChannelTopicSummary input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryTopicLog
   */
  public ModelsTopicLogWithPaginationResponse adminQueryTopicLog(AdminQueryTopicLog input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateTopic
   */
  public ApiCreateTopicResponse adminUpdateTopic(AdminUpdateTopic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteTopic
   */
  public MessageActionDeleteTopicResult adminDeleteTopic(AdminDeleteTopic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBanTopicMembers
   */
  public ModelsBanTopicMemberResult adminBanTopicMembers(AdminBanTopicMembers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChannelTopicInfo
   */
  public ModelsChannelTopicResponse adminChannelTopicInfo(AdminChannelTopicInfo input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTopicChatHistory
   * @deprecated
   */
  @Deprecated
  public ModelsChatMessageWithPaginationResponse adminTopicChatHistory(AdminTopicChatHistory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSendChat
   */
  public List<ModelsChatMessageResponse> adminSendChat(AdminSendChat input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteChat
   */
  public void adminDeleteChat(AdminDeleteChat input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTopicMembers
   */
  public ModelsTopicMemberWithPaginationResponse adminTopicMembers(AdminTopicMembers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTopicShards
   */
  public List<String> adminTopicShards(AdminTopicShards input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUnbanTopicMembers
   */
  public ModelsUnbanTopicMemberResult adminUnbanTopicMembers(AdminUnbanTopicMembers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddTopicMember
   */
  public MessageActionAddUserToTopicResult adminAddTopicMember(AdminAddTopicMember input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRemoveTopicMember
   */
  public MessageActionAddUserToTopicResult adminRemoveTopicMember(AdminRemoveTopicMember input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryTopic
   */
  public List<ModelsTopicInfo> adminQueryTopic(AdminQueryTopic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryUsersTopic
   */
  public ModelsTopicLogWithPaginationResponse adminQueryUsersTopic(AdminQueryUsersTopic input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMutedTopics
   */
  public List<ApiMutedTopicResponse> publicGetMutedTopics(PublicGetMutedTopics input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicTopicList
   */
  public List<ModelsChatMessageResponse> publicTopicList(PublicTopicList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBanTopicMembers
   */
  public ModelsPublicBanTopicMembersResponse publicBanTopicMembers(PublicBanTopicMembers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicChatHistory
   */
  public List<ModelsChatMessageResponse> publicChatHistory(PublicChatHistory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteChat
   */
  public void publicDeleteChat(PublicDeleteChat input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicMuteUser
   */
  public void publicMuteUser(PublicMuteUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUnbanTopicMembers
   */
  public ModelsPublicUnbanTopicMembersResponse publicUnbanTopicMembers(
      PublicUnbanTopicMembers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUnmuteUser
   */
  public void publicUnmuteUser(PublicUnmuteUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
