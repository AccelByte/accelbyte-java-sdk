package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUnlinkUserPlatformRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicPlatformUnlinkV3
 *
 * Required valid user authorization.
 * 
 * ## Supported platforms:
 * 
 *                       * steam
 *                       * steamopenid
 *                       * facebook
 *                       * google
 *                       * oculus
 *                       * twitch
 *                       * android
 *                       * ios
 *                       * apple
 *                       * device
 *                       * discord
 *                       * awscognito
 *                       * epicgames
 *                       * nintendo
 *                       * stadia
 * 
 * Unlink user's account from a specific platform. 'justice' platform might have
 * multiple accounts from different namespaces linked.
 * platformNamespace need to be specified when the platform ID is 'justice'.
 * 
 * Unlink user's account from justice platform will enable password token grant
 * and password update.
 * 
 * If you want to unlink user's account in a game namespace, you have to specify
 * platformNamespace to that game namespace.
 * 
 * action code : 10121
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicPlatformUnlinkV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}";

    @JsonIgnore
    private String method = "DELETE";

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
    private String platformId;
    private ModelUnlinkUserPlatformRequest body;

    /**
    * @param namespace required
    * @param platformId required
    * @param body required
    */
    public PublicPlatformUnlinkV3(
            String namespace,
            String platformId,
            ModelUnlinkUserPlatformRequest body
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.body = body;
    }

    @JsonIgnore
    public PublicPlatformUnlinkV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelUnlinkUserPlatformRequest getBodyParams(){
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
    @JsonIgnore
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
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}