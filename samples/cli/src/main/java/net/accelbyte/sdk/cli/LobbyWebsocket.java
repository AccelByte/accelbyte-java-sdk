/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli;

import net.accelbyte.sdk.api.lobby.ws_models.ErrorNotif;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.cli.utils.CLIHelper;
import net.accelbyte.sdk.core.client.WebSocketClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jetbrains.annotations.NotNull;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.util.concurrent.Callable;

@Command(name = "lobbyWebsocket", mixinStandardHelpOptions = true)
public class LobbyWebsocket implements Callable<Integer> {
    private static final Logger log = LogManager.getLogger(LobbyWebsocket.class);

    @Option(names = {"-m", "--message"}, description = "message")
    String message;

    @Option(names = {"-t", "--timeout"}, description = "timeout in millisecond")
    long timeOut = 5000; // if it takes longer than timeout with no expected response, then exit 1

    @Option(names = {"-u", "--unitTest"}, description = "unit test mode")
    boolean unitTest = false;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new LobbyWebsocket()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() throws InterruptedException {

        // create listener object
        Listener listener = new Listener();

        // create websocket object
        WebSocketClient ws = WebSocketClient.create(
                new DefaultConfigRepository(),
                CLITokenRepositoryImpl.getInstance(),
                listener
        );

        String fullMessage = message + "\n" + Helper.generateUUID();
        String requestType = CLIHelper.getLobbyWsMessageType(fullMessage);

        // send message asynchronously
        ws.sendMessage(fullMessage);

        long startTime = System.currentTimeMillis();
        while ((System.currentTimeMillis() - startTime) < timeOut) {
            if (listener.getMessage() != null) {
                String response = listener.getMessage();
                String responseType = listener.getResponseType();
                if (!unitTest && responseType.equals(CLIHelper.getResponseTypeOf(requestType))) {
                    log.info("Operation successful with response below:\n{}", response);
                    ws.close(1000, "normal close");
                    return 0;
                } else if (unitTest && response.equals(fullMessage)) {
                    log.info("Operation successful with response below:\n{}", response);
                    ws.close(1000, "normal close");
                    return 0;
                } else if (unitTest && responseType.equals(ErrorNotif.getType())) {
                    log.error("Operation unsuccessful with response below\n{}", response);
                    ws.close(1000, "normal close");
                    return 1;
                }
            } else {
                Thread.sleep(100);
            }
        }
        log.error("Operation unsuccessful");
        ws.close(1000, "normal close");
        return 1;
    }

    public static class Listener extends WebSocketListener {

        private String message;
        private String responseType;

        @Override
        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
            this.message = text;
            this.responseType = CLIHelper.getLobbyWsMessageType(text);
        }

        public String getMessage() {
            return message;
        }

        public String getResponseType() {
            return responseType;
        }
    }
}