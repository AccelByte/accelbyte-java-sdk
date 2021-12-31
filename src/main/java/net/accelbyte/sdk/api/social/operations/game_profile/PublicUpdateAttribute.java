package net.accelbyte.sdk.api.social.operations.game_profile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.GameProfileInfo;
import net.accelbyte.sdk.api.social.models.Attribute;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class PublicUpdateAttribute extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/social/public/namespaces/{namespace}/users/{userId}/profiles/{profileId}/attributes/{attributeName}";

    @JsonIgnore
    private String method = "PUT";

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
    private String attributeName;
    private String namespace;
    private String profileId;
    private String userId;
    private Attribute body;

    /**
    * @param attributeName required
    * @param namespace required
    * @param profileId required
    * @param userId required
    */
    public PublicUpdateAttribute(
            String attributeName,
            String namespace,
            String profileId,
            String userId,
            Attribute body
    )
    {
        this.attributeName = attributeName;
        this.namespace = namespace;
        this.profileId = profileId;
        this.userId = userId;
        this.body = body;
    }

    public PublicUpdateAttribute createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.attributeName != null){
            pathParams.put("attributeName", this.attributeName);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.profileId != null){
            pathParams.put("profileId", this.profileId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public Attribute getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attributeName","attributeName");
        result.put("namespace","namespace");
        result.put("profileId","profileId");
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "attributeName",
            "namespace",
            "profileId",
            "userId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.attributeName == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.profileId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public GameProfileInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new GameProfileInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
