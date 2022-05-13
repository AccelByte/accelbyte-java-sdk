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
public class XsollaPaywallConfigRequest extends Model {

    @JsonProperty("device")
    private String device;

    @JsonProperty("showCloseButton")
    private Boolean showCloseButton;

    @JsonProperty("size")
    private String size;

    @JsonProperty("theme")
    private String theme;


    
    @JsonIgnore
    public String getDevice() {
        return this.device;
    }
    
    @JsonIgnore
    public Device getDeviceAsEnum() {
        return Device.valueOf(this.device);
    }
    
    @JsonIgnore
    public void setDevice(final String device) {
        this.device = device;
    }
    
    @JsonIgnore
    public void setDeviceFromEnum(final Device device) {
        this.device = device.toString();
    }
    
    @JsonIgnore
    public String getSize() {
        return this.size;
    }
    
    @JsonIgnore
    public Size getSizeAsEnum() {
        return Size.valueOf(this.size);
    }
    
    @JsonIgnore
    public void setSize(final String size) {
        this.size = size;
    }
    
    @JsonIgnore
    public void setSizeFromEnum(final Size size) {
        this.size = size.toString();
    }
    
    @JsonIgnore
    public String getTheme() {
        return this.theme;
    }
    
    @JsonIgnore
    public Theme getThemeAsEnum() {
        return Theme.valueOf(this.theme);
    }
    
    @JsonIgnore
    public void setTheme(final String theme) {
        this.theme = theme;
    }
    
    @JsonIgnore
    public void setThemeFromEnum(final Theme theme) {
        this.theme = theme.toString();
    }

    @JsonIgnore
    public XsollaPaywallConfigRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<XsollaPaywallConfigRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XsollaPaywallConfigRequest>>() {});
    }

    
    public enum Device {
        DESKTOP("DESKTOP"),
        MOBILE("MOBILE");

        private String value;

        Device(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Size {
        SMALL("SMALL"),
        MEDIUM("MEDIUM"),
        LARGE("LARGE");

        private String value;

        Size(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Theme {
        DEFAULT("DEFAULT"),
        DARK("DARK"),
        DEFAULTDARK("DEFAULT_DARK");

        private String value;

        Theme(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class XsollaPaywallConfigRequestBuilder {
        private String device;
        private String size;
        private String theme;
        
        
        public XsollaPaywallConfigRequestBuilder device(final String device) {
            this.device = device;
            return this;
        }
        
        public XsollaPaywallConfigRequestBuilder deviceFromEnum(final Device device) {
            this.device = device.toString();
            return this;
        }
        
        public XsollaPaywallConfigRequestBuilder size(final String size) {
            this.size = size;
            return this;
        }
        
        public XsollaPaywallConfigRequestBuilder sizeFromEnum(final Size size) {
            this.size = size.toString();
            return this;
        }
        
        public XsollaPaywallConfigRequestBuilder theme(final String theme) {
            this.theme = theme;
            return this;
        }
        
        public XsollaPaywallConfigRequestBuilder themeFromEnum(final Theme theme) {
            this.theme = theme.toString();
            return this;
        }
    }
}