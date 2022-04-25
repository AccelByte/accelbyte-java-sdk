/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderCreate extends Model {

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("discountedPrice")
    private Integer discountedPrice;

    @JsonProperty("ext")
    private Map<String, ?> ext;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("language")
    private String language;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("region")
    private String region;

    @JsonProperty("returnUrl")
    private String returnUrl;



    @JsonIgnore
    public OrderCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OrderCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OrderCreate>>() {});
    }

    
}