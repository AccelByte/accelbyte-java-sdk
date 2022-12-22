/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.subscription;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicQueryUserSubscriptions
 *
 * <p>Query user subscriptions. Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:SUBSCRIPTION", action=2
 * (READ) * Returns : paginated subscription
 */
@Getter
@Setter
public class PublicQueryUserSubscriptions extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/users/{userId}/subscriptions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String chargeStatus;
  private String itemId;
  private Integer limit;
  private Integer offset;
  private String sku;
  private String status;
  private String subscribedBy;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicQueryUserSubscriptions(
      String namespace,
      String userId,
      String chargeStatus,
      String itemId,
      Integer limit,
      Integer offset,
      String sku,
      String status,
      String subscribedBy) {
    this.namespace = namespace;
    this.userId = userId;
    this.chargeStatus = chargeStatus;
    this.itemId = itemId;
    this.limit = limit;
    this.offset = offset;
    this.sku = sku;
    this.status = status;
    this.subscribedBy = subscribedBy;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "chargeStatus", this.chargeStatus == null ? null : Arrays.asList(this.chargeStatus));
    queryParams.put("itemId", this.itemId == null ? null : Arrays.asList(this.itemId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sku", this.sku == null ? null : Arrays.asList(this.sku));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put(
        "subscribedBy", this.subscribedBy == null ? null : Arrays.asList(this.subscribedBy));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public SubscriptionPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new SubscriptionPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("chargeStatus", "None");
    result.put("itemId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sku", "None");
    result.put("status", "None");
    result.put("subscribedBy", "None");
    return result;
  }

  public enum ChargeStatus {
    CHARGED("CHARGED"),
    CHARGEFAILED("CHARGE_FAILED"),
    NEVER("NEVER"),
    RECURRINGCHARGING("RECURRING_CHARGING"),
    SETUP("SETUP");

    private String value;

    ChargeStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    CANCELLED("CANCELLED"),
    EXPIRED("EXPIRED"),
    INIT("INIT");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SubscribedBy {
    PLATFORM("PLATFORM"),
    USER("USER");

    private String value;

    SubscribedBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicQueryUserSubscriptionsBuilder {
    private String chargeStatus;
    private String status;
    private String subscribedBy;

    public PublicQueryUserSubscriptionsBuilder chargeStatus(final String chargeStatus) {
      this.chargeStatus = chargeStatus;
      return this;
    }

    public PublicQueryUserSubscriptionsBuilder chargeStatusFromEnum(
        final ChargeStatus chargeStatus) {
      this.chargeStatus = chargeStatus.toString();
      return this;
    }

    public PublicQueryUserSubscriptionsBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PublicQueryUserSubscriptionsBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public PublicQueryUserSubscriptionsBuilder subscribedBy(final String subscribedBy) {
      this.subscribedBy = subscribedBy;
      return this;
    }

    public PublicQueryUserSubscriptionsBuilder subscribedByFromEnum(
        final SubscribedBy subscribedBy) {
      this.subscribedBy = subscribedBy.toString();
      return this;
    }
  }
}
