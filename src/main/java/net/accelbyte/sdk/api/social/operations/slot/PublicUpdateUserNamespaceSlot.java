package net.accelbyte.sdk.api.social.operations.slot;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.SlotInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class PublicUpdateUserNamespaceSlot extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/social/public/namespaces/{namespace}/users/{userId}/slots/{slotId}";

    @JsonIgnore
    private String method = "PUT";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("multipart/form-data");

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
    private String slotId;
    private String userId;
    private String label;
    private List<String> tags;
    private String checksum;
    private String customAttribute;
    private InputStream file;

    /**
    * @param namespace required
    * @param slotId required
    * @param userId required
    */
    public PublicUpdateUserNamespaceSlot(
            String namespace,
            String slotId,
            String userId,
            String label,
            List<String> tags,
            String checksum,
            String customAttribute,
            InputStream file
    )
    {
        this.namespace = namespace;
        this.slotId = slotId;
        this.userId = userId;
        this.label = label;
        this.tags = tags;
        this.checksum = checksum;
        this.customAttribute = customAttribute;
        this.file = file;
    }

    public PublicUpdateUserNamespaceSlot(){
    }

    public PublicUpdateUserNamespaceSlot createFromJson(String json) throws JsonProcessingException {
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
        if (this.slotId != null){
            pathParams.put("slotId", this.slotId);
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
        queryParams.put("label", this.label);
        queryParams.put("tags", String.valueOf(this.tags));
        return queryParams;
    }


    @Override
    @JsonIgnore
    public Map<String, String> getFormDataParams(){
        Map<String, String> formDataParams = new HashMap<>();
        formDataParams.put("checksum", this.checksum);
        formDataParams.put("customAttribute", this.customAttribute);
        formDataParams.put("file", String.valueOf(this.file));
        return formDataParams;
    }

    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("slotId","slotId");
        result.put("userId","userId");
        result.put("label","label");
        result.put("tags","tags");
        result.put("checksum","checksum");
        result.put("customAttribute","customAttribute");
        result.put("file","file");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "slotId",
            "userId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.slotId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public SlotInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new SlotInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}