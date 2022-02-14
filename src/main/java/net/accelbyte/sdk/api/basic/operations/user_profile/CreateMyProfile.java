package net.accelbyte.sdk.api.basic.operations.user_profile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateCreate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * createMyProfile
 *
 * Create my profile.
 *  Client with user token can create user profile in target namespace
 * Other detail info:
 * 
 *   * Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=1 (CREATE)
 *   *  Action code : 11401
 *   *  Returns : Created user profile
 *   *  Path's namespace :
 *     * can be filled with publisher namespace in order to create publisher user profile
 *     * can be filled with game namespace in order to create game user profile
 *   *  Language : allowed format: en, en-US
 *   *  Country : ISO3166-1 alpha-2 two letter, e.g. US
 *   * Timezone : IANA time zone, e.g. Asia/Shanghai
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateMyProfile extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/basic/v1/public/namespaces/{namespace}/users/me/profiles";

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
    private UserProfilePrivateCreate body;

    /**
    * @param namespace required
    */
    public CreateMyProfile(
            String namespace,
            UserProfilePrivateCreate body
    )
    {
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public CreateMyProfile createFromJson(String json) throws JsonProcessingException {
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
    public UserProfilePrivateCreate getBodyParams(){
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
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public UserProfilePrivateInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new UserProfilePrivateInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}