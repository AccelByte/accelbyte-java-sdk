package net.accelbyte.sdk.api.platform.operations.payment_station;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
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

    @JsonIgnore
    public PublicNormalizePaymentReturnUrl createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("PayerID", this.payerID == null ? null : Arrays.asList(this.payerID));
        queryParams.put("foreinginvoice", this.foreinginvoice == null ? null : Arrays.asList(this.foreinginvoice));
        queryParams.put("invoice_id", this.invoiceId == null ? null : Arrays.asList(this.invoiceId));
        queryParams.put("payload", this.payload == null ? null : Arrays.asList(this.payload));
        queryParams.put("resultCode", this.resultCode == null ? null : Arrays.asList(this.resultCode));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        queryParams.put("token", this.token == null ? null : Arrays.asList(this.token));
        queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
        queryParams.put("user_id", this.userId == null ? null : Arrays.asList(this.userId));
        queryParams.put("orderNo", this.orderNo == null ? null : Arrays.asList(this.orderNo));
        queryParams.put("paymentOrderNo", this.paymentOrderNo == null ? null : Arrays.asList(this.paymentOrderNo));
        queryParams.put("paymentProvider", this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
        queryParams.put("returnUrl", this.returnUrl == null ? null : Arrays.asList(this.returnUrl));
        return queryParams;
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
    @JsonIgnore
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
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 204){
            throw new ResponseException(code, json);
        }
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("PayerID", "None");
        result.put("foreinginvoice", "None");
        result.put("invoice_id", "None");
        result.put("payload", "None");
        result.put("resultCode", "None");
        result.put("status", "None");
        result.put("token", "None");
        result.put("type", "None");
        result.put("user_id", "None");
        result.put("orderNo", "None");
        result.put("paymentOrderNo", "None");
        result.put("paymentProvider", "None");
        result.put("returnUrl", "None");
        return result;
    }
}