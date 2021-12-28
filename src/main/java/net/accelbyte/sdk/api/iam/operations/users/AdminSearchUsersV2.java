package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelSearchUsersByPlatformIDResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class AdminSearchUsersV2 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v2/admin/namespaces/{namespace}/users";

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
    private String after;
    private String before;
    private String displayName;
    private String limit;
    private String loginId;
    private String platformUserId;
    private String roleId;
    private String userId;
    private String platformId;

    /**
    * @param namespace required
    * @param platformId required
    */
    public AdminSearchUsersV2(
            String namespace,
            String after,
            String before,
            String displayName,
            String limit,
            String loginId,
            String platformUserId,
            String roleId,
            String userId,
            String platformId
    )
    {
        this.namespace = namespace;
        this.after = after;
        this.before = before;
        this.displayName = displayName;
        this.limit = limit;
        this.loginId = loginId;
        this.platformUserId = platformUserId;
        this.roleId = roleId;
        this.userId = userId;
        this.platformId = platformId;
    }

    public AdminSearchUsersV2(){
    }

    public AdminSearchUsersV2 createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("after", this.after);
        queryParams.put("before", this.before);
        queryParams.put("displayName", this.displayName);
        queryParams.put("limit", this.limit);
        queryParams.put("loginId", this.loginId);
        queryParams.put("platformUserId", this.platformUserId);
        queryParams.put("roleId", this.roleId);
        queryParams.put("userId", this.userId);
        queryParams.put("platformId", this.platformId);
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
        result.put("after","after");
        result.put("before","before");
        result.put("displayName","displayName");
        result.put("limit","limit");
        result.put("loginId","loginId");
        result.put("platformUserId","platformUserId");
        result.put("roleId","roleId");
        result.put("userId","userId");
        result.put("platformId","platformId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",








            "platformId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platformId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelSearchUsersByPlatformIDResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelSearchUsersByPlatformIDResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
