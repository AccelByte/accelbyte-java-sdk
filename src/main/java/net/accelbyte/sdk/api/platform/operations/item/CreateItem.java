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
 * createItem
 *
 * <p>This API is used to create an item. APP item only can created in publisher namespace.
 *
 * <p>An item create example:
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
 * <p>"name": "required, also will be used as entitlement name",
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
 * <p>"appType": "GAME(optional, required if itemType is APP)",
 *
 * <p>"seasonType": "PASS(optional, required if itemType is SEASON)",
 *
 * <p>"baseAppId": "optional, set value of game app id if you want to link to a game",
 *
 * <p>"targetCurrencyCode": "optional, required if itemType is COINS",
 *
 * <p>"targetNamespace": "optional, required when itemType is INGAMEITEM, the targetNamespace will
 * only take effect when the item
 *
 * <p>created belongs to the publisher namespace",
 *
 * <p>"sku": "optional, commonly unique item code",
 *
 * <p>"regionData": {
 *
 * <p>"US(store's default region is required)": [
 *
 * <p>{
 *
 * <p>"price":10,
 *
 * <p>"discountPercentage": 0(integer, optional, range[0,100], discountedPrice = price * ((100 -
 * discountPercentage) * 0.01),
 *
 * <p>will use it to calculate discounted price if it is not 0),
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
 * <p>"maxCount": 1(integer, optional, -1 means UNLIMITED, unset when itemType is CODE)
 *
 * <p>}
 *
 * <p>Other detail info:
 *
 * <p>* Returns : created item data
 *
 * <p>## Restrictions for item extension and localization extension and inventory config custom
 * attributes
 *
 * <p>1. Cannot use "." as the key name -
 *
 * <p>{ "data.2": "value" }
 *
 * <p>2. Cannot use "$" as the prefix in key names -
 *
 * <p>{ "$data": "value" }
 */
@Getter
@Setter
public class CreateItem extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String storeId;
  private ItemCreate body;

  /**
   * @param namespace required
   * @param storeId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateItem(String namespace, String storeId, ItemCreate body) {
    this.namespace = namespace;
    this.storeId = storeId;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    return queryParams;
  }

  @Override
  public ItemCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public FullItemInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
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
