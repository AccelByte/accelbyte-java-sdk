package net.accelbyte.sdk.api.basic.operations.file_upload;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.FileUploadUrlInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class PublicGeneratedUploadUrl extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/basic/v1/public/namespaces/{namespace}/folders/{folder}/files";

    @JsonIgnore
    private String method = "POST";

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
    private String folder;
    private String namespace;
    private String fileType;

    /**
    * @param folder required
    * @param namespace required
    * @param fileType required
    */
    public PublicGeneratedUploadUrl(
            String folder,
            String namespace,
            String fileType
    )
    {
        this.folder = folder;
        this.namespace = namespace;
        this.fileType = fileType;
    }

    public PublicGeneratedUploadUrl createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.folder != null){
            pathParams.put("folder", this.folder);
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
        queryParams.put("fileType", this.fileType);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("folder","folder");
        result.put("namespace","namespace");
        result.put("fileType","fileType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "folder",
            "namespace",
            "fileType"
        );
    }

    @Override
    public boolean isValid() {
        if(this.folder == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.fileType == null) {
            return false;
        }
        return true;
    }

    @Override
    public FileUploadUrlInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FileUploadUrlInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
