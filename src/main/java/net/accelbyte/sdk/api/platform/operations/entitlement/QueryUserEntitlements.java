package net.accelbyte.sdk.api.platform.operations.entitlement;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.EntitlementPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class QueryUserEntitlements extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

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
    private Boolean activeOnly;
    private String appType;
    private String entitlementClazz;
    private String entitlementName;
    private List<String> itemId;
    private Integer limit;
    private Integer offset;

    /**
    * @param namespace required
    * @param userId required
    */
    public QueryUserEntitlements(
            String namespace,
            String userId,
            Boolean activeOnly,
            String appType,
            String entitlementClazz,
            String entitlementName,
            List<String> itemId,
            Integer limit,
            Integer offset
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.activeOnly = activeOnly;
        this.appType = appType;
        this.entitlementClazz = entitlementClazz;
        this.entitlementName = entitlementName;
        this.itemId = itemId;
        this.limit = limit;
        this.offset = offset;
    }

    @JsonIgnore
    public QueryUserEntitlements createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("activeOnly", this.activeOnly == null ? null : String.valueOf(this.activeOnly));
        queryParams.put("appType", this.appType);
        queryParams.put("entitlementClazz", this.entitlementClazz);
        queryParams.put("entitlementName", this.entitlementName);
        queryParams.put("itemId", this.itemId == null ? null : String.valueOf(this.itemId));
        queryParams.put("limit", this.limit == null ? null : String.valueOf(this.limit));
        queryParams.put("offset", this.offset == null ? null : String.valueOf(this.offset));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("userId","userId");
        result.put("activeOnly","activeOnly");
        result.put("appType","appType");
        result.put("entitlementClazz","entitlementClazz");
        result.put("entitlementName","entitlementName");
        result.put("itemId","itemId");
        result.put("limit","limit");
        result.put("offset","offset");
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
    @JsonIgnore
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
    @JsonIgnore
    public EntitlementPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new EntitlementPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
