/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordRequest;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DummyGameRecord extends ModelsGameRecordRequest {
  @JsonProperty("foo")
  private String Foo;

  @JsonProperty("foo_bar")
  private String FooBar;

  @JsonProperty("foo_value")
  private int FooValue;
}
