/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli;

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
    int timeOut = 5000; // if it takes longer than timeout with no expected response, then exit 1

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
            if (listener.getMessage() != null && CLIHelper.getResponseTypeOf(requestType).equals(listener.getResponseType())) {
                log.info("Operation successful with response below:\n{}", listener.getMessage());
                return 0;
            } else {
                Thread.sleep(100);
            }
        }
        ws.close(1000, "normal close");
        log.error("Operation unsuccessful");
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