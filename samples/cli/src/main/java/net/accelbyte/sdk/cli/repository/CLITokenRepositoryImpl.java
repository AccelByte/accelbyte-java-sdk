/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import net.accelbyte.sdk.core.repository.TokenRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class CLITokenRepositoryImpl implements TokenRepository {

  private static final Logger log = LogManager.getLogger(CLITokenRepositoryImpl.class);
  private static final String DATA_STORE_FILE_NAME = "accelbyte-java-sdk-cli.yaml";
  private static CLITokenRepositoryImpl instance = null;

  private CLITokenRepositoryImpl() {}

  public static CLITokenRepositoryImpl getInstance() {
    if (instance == null) {
      synchronized (CLITokenRepositoryImpl.class) {
        if (instance == null) {
          instance = new CLITokenRepositoryImpl();
        }
      }
    }
    return instance;
  }

  @Override
  public String getToken() {
    try {
      File file = new File(getDataStorePath());
      ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
      DataStore dataStore =
          file.exists() ? mapper.readValue(file, DataStore.class) : new DataStore();
      return dataStore.getAccessToken();
    } catch (Exception e) {
      log.error("File not found with exception: {}", e.getMessage());
    }
    return "";
  }

  @Override
  public void removeToken() throws IOException {
    try {
      File file = new File(getDataStorePath());
      ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
      DataStore dataStore =
          file.exists() ? mapper.readValue(file, DataStore.class) : new DataStore();
      dataStore.setAccessToken("");
      mapper.writeValue(file, dataStore);
    } catch (NullPointerException e) {
      log.error("File not found with exception: {}", e.getMessage());
    }
  }

  @Override
  public void storeToken(String token) throws IOException {
    try {
      File file = new File(getDataStorePath());
      ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
      DataStore dataStore =
          file.exists() ? mapper.readValue(file, DataStore.class) : new DataStore();
      dataStore.setAccessToken(token);
      mapper.writeValue(file, dataStore);
    } catch (NullPointerException e) {
      log.error("File not found with exception: {}", e.getMessage());
    }
  }

  private String getDataStorePath() {
    Path dataStorePath = Paths.get(System.getProperty("java.io.tmpdir"), DATA_STORE_FILE_NAME);
    return dataStorePath.toString();
  }
}
