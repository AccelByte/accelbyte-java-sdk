package net.accelbyte.sdk.api.platform.operations.subscription;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.SubscriptionPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class PublicQueryUserSubscriptions extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/public/namespaces/{namespace}/users/{userId}/subscriptions";

    @JsonIgnore
    private String method = "GET";

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
    public PublicQueryUserSubscriptions(
            String namespace,
            String userId,
            String chargeStatus,
            String itemId,
            Integer limit,
            Integer offset,
            String sku,
            String status,
            String subscribedBy
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.chargeStatus = chargeStatus;
        this.itemId = itemId;
        this.limit = limit;
        this.offset = offset;
        this.sku = sku;
        this.status = status;
        this.subscribedBy = subscribedBy;
    }

    public PublicQueryUserSubscriptions createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("chargeStatus", this.chargeStatus);
        queryParams.put("itemId", this.itemId);
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("sku", this.sku);
        queryParams.put("status", this.status);
        queryParams.put("subscribedBy", this.subscribedBy);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("userId","userId");
        result.put("chargeStatus","chargeStatus");
        result.put("itemId","itemId");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("sku","sku");
        result.put("status","status");
        result.put("subscribedBy","subscribedBy");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public SubscriptionPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new SubscriptionPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
