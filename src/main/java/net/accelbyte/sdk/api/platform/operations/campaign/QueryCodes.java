package net.accelbyte.sdk.api.platform.operations.campaign;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.CodeInfoPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class QueryCodes extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}";

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
    private String campaignId;
    private String namespace;
    private Boolean activeOnly;
    private Integer batchNo;
    private String code;
    private Integer limit;
    private Integer offset;

    /**
    * @param campaignId required
    * @param namespace required
    */
    public QueryCodes(
            String campaignId,
            String namespace,
            Boolean activeOnly,
            Integer batchNo,
            String code,
            Integer limit,
            Integer offset
    )
    {
        this.campaignId = campaignId;
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.batchNo = batchNo;
        this.code = code;
        this.limit = limit;
        this.offset = offset;
    }

    public QueryCodes(){
    }

    public QueryCodes createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.campaignId != null){
            pathParams.put("campaignId", this.campaignId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("activeOnly", String.valueOf(this.activeOnly));
        queryParams.put("batchNo", String.valueOf(this.batchNo));
        queryParams.put("code", this.code);
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", String.valueOf(this.offset));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("campaignId","campaignId");
        result.put("namespace","namespace");
        result.put("activeOnly","activeOnly");
        result.put("batchNo","batchNo");
        result.put("code","code");
        result.put("limit","limit");
        result.put("offset","offset");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "campaignId",
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.campaignId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public CodeInfoPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new CodeInfoPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
