package net.accelbyte.sdk.api.platform.operations.payment_station;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class PublicNormalizePaymentReturnUrl extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/public/namespaces/{namespace}/payment/returnurl";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList();

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String payerID;
    private String foreinginvoice;
    private String invoiceId;
    private String payload;
    private String resultCode;
    private String status;
    private String token;
    private String type;
    private String userId;
    private String orderNo;
    private String paymentOrderNo;
    private String paymentProvider;
    private String returnUrl;

    /**
    * @param namespace required
    * @param orderNo required
    * @param paymentOrderNo required
    * @param paymentProvider required
    * @param returnUrl required
    */
    public PublicNormalizePaymentReturnUrl(
            String namespace,
            String payerID,
            String foreinginvoice,
            String invoiceId,
            String payload,
            String resultCode,
            String status,
            String token,
            String type,
            String userId,
            String orderNo,
            String paymentOrderNo,
            String paymentProvider,
            String returnUrl
    )
    {
        this.namespace = namespace;
        this.payerID = payerID;
        this.foreinginvoice = foreinginvoice;
        this.invoiceId = invoiceId;
        this.payload = payload;
        this.resultCode = resultCode;
        this.status = status;
        this.token = token;
        this.type = type;
        this.userId = userId;
        this.orderNo = orderNo;
        this.paymentOrderNo = paymentOrderNo;
        this.paymentProvider = paymentProvider;
        this.returnUrl = returnUrl;
    }

    public PublicNormalizePaymentReturnUrl(){
    }

    public PublicNormalizePaymentReturnUrl createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("payerID", this.payerID);
        queryParams.put("foreinginvoice", this.foreinginvoice);
        queryParams.put("invoiceId", this.invoiceId);
        queryParams.put("payload", this.payload);
        queryParams.put("resultCode", this.resultCode);
        queryParams.put("status", this.status);
        queryParams.put("token", this.token);
        queryParams.put("type", this.type);
        queryParams.put("userId", this.userId);
        queryParams.put("orderNo", this.orderNo);
        queryParams.put("paymentOrderNo", this.paymentOrderNo);
        queryParams.put("paymentProvider", this.paymentProvider);
        queryParams.put("returnUrl", this.returnUrl);
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
        result.put("PayerID","payerID");
        result.put("foreinginvoice","foreinginvoice");
        result.put("invoice_id","invoiceId");
        result.put("payload","payload");
        result.put("resultCode","resultCode");
        result.put("status","status");
        result.put("token","token");
        result.put("type","type");
        result.put("user_id","userId");
        result.put("orderNo","orderNo");
        result.put("paymentOrderNo","paymentOrderNo");
        result.put("paymentProvider","paymentProvider");
        result.put("returnUrl","returnUrl");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",









            "orderNo",
            "paymentOrderNo",
            "paymentProvider",
            "returnUrl"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.orderNo == null) {
            return false;
        }
        if(this.paymentOrderNo == null) {
            return false;
        }
        if(this.paymentProvider == null) {
            return false;
        }
        if(this.returnUrl == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 204){
            throw new ResponseException(code, json);
        }
    }
}
