package net.accelbyte.sdk.api.iam.operations.users_v4;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateFromInvitationRequestV4;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class CreateUserFromInvitationV4 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v4/public/namespaces/{namespace}/users/invite/{invitationId}";

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
    private String invitationId;
    private String namespace;
    private ModelUserCreateFromInvitationRequestV4 body;

    /**
    * @param invitationId required
    * @param namespace required
    * @param body required
    */
    public CreateUserFromInvitationV4(
            String invitationId,
            String namespace,
            ModelUserCreateFromInvitationRequestV4 body
    )
    {
        this.invitationId = invitationId;
        this.namespace = namespace;
        this.body = body;
    }

    public CreateUserFromInvitationV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.invitationId != null){
            pathParams.put("invitationId", this.invitationId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelUserCreateFromInvitationRequestV4 getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("invitationId","invitationId");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "invitationId",
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.invitationId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public AccountCreateUserResponseV4 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AccountCreateUserResponseV4().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
