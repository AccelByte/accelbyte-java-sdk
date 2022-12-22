/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

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
 * updateItem
 *
 * <p>This API is used to update an item.
 *
 * <p>An item update example:
 *
 * <p>{
 *
 * <p>"categoryPath": "/games",
 *
 * <p>"localizations": {
 *
 * <p>"en": {
 *
 * <p>"title":"required",
 *
 * <p>"description":"optional",
 *
 * <p>"longDescription":"optional",
 *
 * <p>"localExt": {
 *
 * <p>"properties":[
 *
 * <p>{
 *
 * <p>"key1":"value1",
 *
 * <p>"key2":"value2"
 *
 * <p>}
 *
 * <p>],
 *
 * <p>"functions":[
 *
 * <p>{
 *
 * <p>"key1":"value1",
 *
 * <p>"key2":"value2"
 *
 * <p>}
 *
 * <p>]
 *
 * <p>}
 *
 * <p>}
 *
 * <p>},
 *
 * <p>"images": [
 *
 * <p>{
 *
 * <p>"as":"optional, image for",
 *
 * <p>"caption":"optional",
 *
 * <p>"height":10,
 *
 * <p>"width":10,
 *
 * <p>"imageUrl":"http://img-url-required",
 *
 * <p>"smallImageUrl":"http://small-img-url-required"
 *
 * <p>}
 *
 * <p>],
 *
 * <p>"thumbnailUrl": "optional, thumbnail url",
 *
 * <p>"status": "ACTIVE",
 *
 * <p>"listable": true,
 *
 * <p>"purchasable": true,
 *
 * <p>"itemType": "APP(allowed: [APP,COINS,INGAMEITEM,CODE,BUNDLE])",
 *
 * <p>"name": "optional",
 *
 * <p>"entitlementType": "DURABLE(allowed:[DURABLE,CONSUMABLE], should be CONSUMABLE when item type
 * is COINS)",
 *
 * <p>"useCount": 1(optional, required if the entitlement type is consumable),
 *
 * <p>"stackable": false,
 *
 * <p>"appId": "optional, required if itemType is APP",
 *
 * <p>"baseAppId": "optional, set value of game app id if you want to link to a game",
 *
 * <p>"appType": "GAME(optional, required if itemType is APP)",
 *
 * <p>"seasonType": "PASS(optional, required if itemType is SEASON)",
 *
 * <p>"sku": "optional, commonly unique item code",
 *
 * <p>"targetCurrencyCode": "optional, required if itemType is COINS",
 *
 * <p>"targetNamespace": "optional, required when itemType is INGAMEITEM, the targetNamespace will
 * only take effect when the item
 *
 * <p>created belongs to the publisher namespace",
 *
 * <p>"regionData": {
 *
 * <p>"US(store's default region is required)": [
 *
 * <p>{
 *
 * <p>"price":10,
 *
 * <p>"discountPercentage":0(integer, optional, range[0,100], discountedPrice = price*((100 -
 * discountPercentage) * 0.01),
 *
 * <p>if it is not 0, will use it to calculate discounted price),
 *
 * <p>"discountAmount":0(integer, optional, range[0,itemPrice], will use it to calculate discounted
 * price if discountPercentage is 0),
 *
 * <p>"currencyCode":"code(required, example: USD)",
 *
 * <p>"currencyNamespace":"test-ns-required(allow publisher namespace if namespace is publisher
 * namespace, allow publisher and game namespace if namespace is not publisher namespace)",
 *
 * <p>"trialPrice":5(required while fixedTrialCycles set, should >=0 and <= price, will same as
 * price if not present),
 *
 * <p>"purchaseAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 *
 * <p>"expireAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 *
 * <p>"discountPurchaseAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 *
 * <p>"discountExpireAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 *
 * <p>}
 *
 * <p>]
 *
 * <p>},
 *
 * <p>"itemIds": [
 *
 * <p>"itemId"
 *
 * <p>],
 *
 * <p>"itemQty": {
 *
 * <p>"itemId":1
 *
 * <p>},
 *
 * <p>"recurring": {
 *
 * <p>"cycle":"MONTHLY(allowed: [WEEKLY,MONTHLY,QUARTERLY,YEARLY])",
 *
 * <p>"fixedFreeDays":0(integer, fixed free days, 0 means not set),
 *
 * <p>"fixedTrialCycles":0(integer, fixed trial cycles, 0 means not set, will not take effect if
 * fixedFreeDays set),
 *
 * <p>"graceDays":7(integer, recurring grace days, retry recurring charge within configured days if
 * charge fail, default 7)
 *
 * <p>},
 *
 * <p>"tags": [
 *
 * <p>"exampleTag24"
 *
 * <p>],
 *
 * <p>"features": [
 *
 * <p>"feature"
 *
 * <p>],
 *
 * <p>"clazz": "weapon",
 *
 * <p>"boothName": "C_campaign1",
 *
 * <p>"displayOrder": 1000,
 *
 * <p>"ext": {
 *
 * <p>"properties":[
 *
 * <p>{
 *
 * <p>"key1":"value1",
 *
 * <p>"key2":"value2"
 *
 * <p>}
 *
 * <p>],
 *
 * <p>"functions":[
 *
 * <p>{
 *
 * <p>"key1":"value1",
 *
 * <p>"key2":"value2"
 *
 * <p>}
 *
 * <p>]
 *
 * <p>},
 *
 * <p>"maxCountPerUser": 1(integer, optional, -1 means UNLIMITED),
 *
 * <p>"maxCount": 1(integer, optional, -1 means UNLIMITED, new value should >= old value if both old
 * value and new value is
 *
 * <p>limited, unset when item type is CODE)
 *
 * <p>}
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=4 (UPDATE) *
 * Returns : updated item data
 */
@Getter
@Setter
public class UpdateItem extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/{itemId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String itemId;

  private String namespace;
  private String storeId;
  private ItemUpdate body;

  /**
   * @param itemId required
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateItem(String itemId, String namespace, String storeId, ItemUpdate body) {
    this.itemId = itemId;
    this.namespace = namespace;
    this.storeId = storeId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.itemId != null) {
      pathParams.put("itemId", this.itemId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    return queryParams;
  }

  @Override
  public ItemUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.itemId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    return true;
  }

  public FullItemInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FullItemInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("storeId", "None");
    return result;
  }
}
