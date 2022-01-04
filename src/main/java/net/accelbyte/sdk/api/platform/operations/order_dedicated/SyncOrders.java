package net.accelbyte.sdk.api.platform.operations.order_dedicated;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.OrderSyncResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class SyncOrders extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/orders";

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
    private String nextEvaluatedKey;
    private String end;
    private String start;

    /**
    * @param end required
    * @param start required
    */
    public SyncOrders(
            String nextEvaluatedKey,
            String end,
            String start
    )
    {
        this.nextEvaluatedKey = nextEvaluatedKey;
        this.end = end;
        this.start = start;
    }

    @JsonIgnore
    public SyncOrders createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("nextEvaluatedKey", this.nextEvaluatedKey);
        queryParams.put("end", this.end);
        queryParams.put("start", this.start);
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
        result.put("nextEvaluatedKey","nextEvaluatedKey");
        result.put("end","end");
        result.put("start","start");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(

            "end",
            "start"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.end == null) {
            return false;
        }
        if(this.start == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public OrderSyncResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OrderSyncResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
