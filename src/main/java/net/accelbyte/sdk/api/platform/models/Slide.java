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
public class Slide extends Model {

    @JsonProperty("alt")
    private String alt;

    @JsonProperty("previewUrl")
    private String previewUrl;

    @JsonProperty("thumbnailUrl")
    private String thumbnailUrl;

    @JsonProperty("type")
    private String type;

    @JsonProperty("url")
    private String url;

    @JsonProperty("videoSource")
    private String videoSource;


    
    public String getType() {
        return this.type;
    }
    
    public Type getTypeAsEnum() {
        return Type.valueOf(this.type);
    }
    
    public void setType(final String type) {
        this.type = type;
    }
    
    public void setTypeFromEnum(final Type type) {
        this.type = type.toString();
    }
    
    public String getVideoSource() {
        return this.videoSource;
    }
    
    public VideoSource getVideoSourceAsEnum() {
        return VideoSource.valueOf(this.videoSource);
    }
    
    public void setVideoSource(final String videoSource) {
        this.videoSource = videoSource;
    }
    
    public void setVideoSourceFromEnum(final VideoSource videoSource) {
        this.videoSource = videoSource.toString();
    }

    @JsonIgnore
    public Slide createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<Slide> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Slide>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("alt", "alt");
        result.put("previewUrl", "previewUrl");
        result.put("thumbnailUrl", "thumbnailUrl");
        result.put("type", "type");
        result.put("url", "url");
        result.put("videoSource", "videoSource");
        return result;
    }
    
    public enum Type {
        Image("Image"),
        Video("Video");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum VideoSource {
        Generic("Generic"),
        Youtube("Youtube"),
        Vimeo("Vimeo");

        private String value;

        VideoSource(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class SlideBuilder {
        private String type;
        private String videoSource;
        
        
        public SlideBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public SlideBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
        
        public SlideBuilder videoSource(final String videoSource) {
            this.videoSource = videoSource;
            return this;
        }
        
        public SlideBuilder videoSourceFromEnum(final VideoSource videoSource) {
            this.videoSource = videoSource.toString();
            return this;
        }
    }
}