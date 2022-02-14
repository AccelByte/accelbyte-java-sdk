package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * deleteNotificationTopicV1Admin
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [DELETE]` with
 * scope `social`
 * delete topic information by topic name.
 * topic should be alphabets, no special char except underscore, uppercase and no
 * spacing. for example: TOPIC_TEST. Already existing topic can not be created
 * Action Code: 50217
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteNotificationTopicV1Admin extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/lobby/v1/admin/notification/namespaces/{namespace}/topics/{topicName}";

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
    private String topicName;

    /**
    * @param namespace required
    * @param topicName required
    */
    public DeleteNotificationTopicV1Admin(
            String namespace,
            String topicName
    )
    {
        this.namespace = namespace;
        this.topicName = topicName;
    }

    @JsonIgnore
    public DeleteNotificationTopicV1Admin createFromJson(String json) throws JsonProcessingException {
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
        if (this.topicName != null){
            pathParams.put("topicName", this.topicName);
        }
        return pathParams;
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
        result.put("topicName","topicName");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "topicName"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.topicName == null) {
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