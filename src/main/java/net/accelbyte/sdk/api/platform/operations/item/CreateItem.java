package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FullItemInfo;
import net.accelbyte.sdk.api.platform.models.ItemCreate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * createItem
 *
 * This API is used to create an item. APP item only can created in publisher
 * namespace.
 * 
 * An item create example:
 * 
 * 
 * 
 *     {
 *        "categoryPath": "/games",
 *        "localizations": {
 *            "en": {
 *                "title":"required",
 *                "description":"optional",
 *                "longDescription":"optional",
 *                "localExt": {
 *                       "properties":[
 *                                        {
 *                                            "key1":"value1",
 *                                            "key2":"value2"
 *                                        }
 *                       ],
 *                       "functions":[
 *                                        {
 *                                            "key1":"value1",
 *                                            "key2":"value2"
 *                                        }
 *                      ]
 *                }
 *             }
 *        },
 *        "images": [
 *          {
 *                "as":"optional, image for",
 *                "caption":"optional",
 *                "height":10,
 *                "width":10,
 *                "imageUrl":"http://img-url-required",
 *                "smallImageUrl":"http://small-img-url-required"
 *          }
 *        ],
 *        "thumbnailUrl": "optional, thumbnail url",
 *        "status": "ACTIVE",
 *        "listable": true,
 *        "purchasable": true,
 *        "itemType": "APP(allowed: [APP,COINS,INGAMEITEM,CODE,BUNDLE])",
 *        "name": "required, also will be used as entitlement name",
 *        "entitlementType": "DURABLE(allowed:[DURABLE,CONSUMABLE], should be CONSUMABLE when item type is COINS)",
 *        "useCount": 1(optional, required if the entitlement type is consumable),
 *        "stackable": false,
 *        "appId": "optional, required if itemType is APP",
 *        "appType": "GAME(optional, required if itemType is APP)",
 *        "seasonType": "PASS(optional, required if itemType is SEASON)",
 *        "baseAppId": "optional, set value of game app id if you want to link to a game",
 *        "targetCurrencyCode": "optional, required if itemType is COINS",
 *        "targetNamespace": "optional, required when itemType is INGAMEITEM, the targetNamespace will only take effect when the item
 *        created belongs to the publisher namespace",
 *        "sku": "optional, commonly unique item code",
 *        "regionData": {
 *            "US(store's default region is required)": [
 *              {
 *                 "price":10,
 *                 "discountPercentage": 0(integer, optional, range[0,100], discountedPrice = price  * ((100 - discountPercentage) * 0.01),
 *                   will use it to calculate discounted price if it is not 0),
 *                 "discountAmount":0(integer, optional, range[0,itemPrice], will use it to calculate discounted price if discountPercentage is 0),
 *                 "currencyCode":"code(required, example: USD)",
 *                 "currencyNamespace":"test-ns-required(allow publisher namespace if namespace is publisher namespace, allow publisher and game namespace if namespace is not publisher namespace)",
 *                 "trialPrice":5(required while fixedTrialCycles set, should >=0 and <= price, will same as price if not present),
 *                 "purchaseAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 *                 "expireAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 *                 "discountPurchaseAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 *                 "discountExpireAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 *              }
 *            ]
 *        },
 *        "itemIds": [
 *            "itemId"
 *        ],
 *        "itemQty": {
 *            "itemId":1
 *        },
 *        "recurring": {
 *            "cycle":"MONTHLY(allowed: [WEEKLY,MONTHLY,QUARTERLY,YEARLY])",
 *            "fixedFreeDays":0(integer, fixed free days, 0 means not set),
 *            "fixedTrialCycles":0(integer, fixed trial cycles, 0 means not set, will not take effect if fixedFreeDays set),
 *            "graceDays":7(integer, recurring grace days, retry recurring charge within configured days if charge fail, default 7)
 *        },
 *        "tags": [
 *            "tag"
 *        ],
 *        "features": [
 *            "feature"
 *        ],
 *        "clazz": "weapon",
 *        "boothName": "C_campaign1",
 *        "displayOrder": 1000,
 *        "ext": {
 *            "properties":[
 *                {
 *                    "key1":"value1",
 *                    "key2":"value2"
 *                }
 *            ],
 *            "functions":[
 *                {
 *                    "key1":"value1",
 *                    "key2":"value2"
 *                }
 *            ]
 *        },
 *        "maxCountPerUser": 1(integer, optional, -1 means UNLIMITED),
 *        "maxCount": 1(integer, optional, -1 means UNLIMITED, unset when itemType is CODE)
 *     }
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=1 (CREATE)
 *   *  Returns : created item data
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateItem extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/items";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String storeId;
    private ItemCreate body;

    /**
    * @param namespace required
    * @param storeId required
    */
    public CreateItem(
            String namespace,
            String storeId,
            ItemCreate body
    )
    {
        this.namespace = namespace;
        this.storeId = storeId;
        this.body = body;
    }

    @JsonIgnore
    public CreateItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        return queryParams;
    }

    @Override
    @JsonIgnore
    public ItemCreate getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("storeId","storeId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "storeId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.storeId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public FullItemInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new FullItemInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("storeId", "None");
        return result;
    }
}