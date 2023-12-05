/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsSortTicket extends Model {

  @JsonProperty("search_result")
  private String searchResult;

  @JsonProperty("ticket_queue")
  private String ticketQueue;

  @JsonIgnore
  public String getSearchResult() {
    return this.searchResult;
  }

  @JsonIgnore
  public SearchResult getSearchResultAsEnum() {
    return SearchResult.valueOf(this.searchResult);
  }

  @JsonIgnore
  public void setSearchResult(final String searchResult) {
    this.searchResult = searchResult;
  }

  @JsonIgnore
  public void setSearchResultFromEnum(final SearchResult searchResult) {
    this.searchResult = searchResult.toString();
  }

  @JsonIgnore
  public String getTicketQueue() {
    return this.ticketQueue;
  }

  @JsonIgnore
  public TicketQueue getTicketQueueAsEnum() {
    return TicketQueue.valueOf(this.ticketQueue);
  }

  @JsonIgnore
  public void setTicketQueue(final String ticketQueue) {
    this.ticketQueue = ticketQueue;
  }

  @JsonIgnore
  public void setTicketQueueFromEnum(final TicketQueue ticketQueue) {
    this.ticketQueue = ticketQueue.toString();
  }

  @JsonIgnore
  public ModelsSortTicket createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsSortTicket> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsSortTicket>>() {});
  }

  public enum SearchResult {
    Distance("distance"),
    LargestPartySize("largestPartySize"),
    None("none"),
    OldestTicketAge("oldestTicketAge"),
    Random("random");

    private String value;

    SearchResult(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum TicketQueue {
    Distance("distance"),
    LargestPartySize("largestPartySize"),
    None("none"),
    OldestTicketAge("oldestTicketAge"),
    Random("random");

    private String value;

    TicketQueue(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsSortTicketBuilder {
    private String searchResult;
    private String ticketQueue;

    public ModelsSortTicketBuilder searchResult(final String searchResult) {
      this.searchResult = searchResult;
      return this;
    }

    public ModelsSortTicketBuilder searchResultFromEnum(final SearchResult searchResult) {
      this.searchResult = searchResult.toString();
      return this;
    }

    public ModelsSortTicketBuilder ticketQueue(final String ticketQueue) {
      this.ticketQueue = ticketQueue;
      return this;
    }

    public ModelsSortTicketBuilder ticketQueueFromEnum(final TicketQueue ticketQueue) {
      this.ticketQueue = ticketQueue.toString();
      return this;
    }
  }
}
