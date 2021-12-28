package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelListRoleV4Response;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class AdminGetRolesV4 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v4/admin/roles";

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
    private Boolean adminRole;
    private String after;
    private String before;
    private Boolean isWildcard;
    private Integer limit;

    /**
    */
    public AdminGetRolesV4(
            Boolean adminRole,
            String after,
            String before,
            Boolean isWildcard,
            Integer limit
    )
    {
        this.adminRole = adminRole;
        this.after = after;
        this.before = before;
        this.isWildcard = isWildcard;
        this.limit = limit;
    }


    public AdminGetRolesV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("adminRole", String.valueOf(this.adminRole));
        queryParams.put("after", this.after);
        queryParams.put("before", this.before);
        queryParams.put("isWildcard", String.valueOf(this.isWildcard));
        queryParams.put("limit", String.valueOf(this.limit));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("adminRole","adminRole");
        result.put("after","after");
        result.put("before","before");
        result.put("isWildcard","isWildcard");
        result.put("limit","limit");
        return result;
    }


    @Override
    public ModelListRoleV4Response parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelListRoleV4Response().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
