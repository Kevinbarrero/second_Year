package ru.itis;

import java.io.*;
import java.net.Socket;

public class Client_number {

    private static Socket clientSocket;
    private static BufferedReader reader;
    private static BufferedReader in;
    private static BufferedWriter out;

    public static void main(String[] args) {
        try {
            clientSocket = new Socket("127.0.0.1", 10000);
            while(!clientSocket.isClosed()) {
                reader = new BufferedReader(new InputStreamReader(System.in));
                in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                out = new BufferedWriter(new OutputStreamWriter(clientSocket.getOutputStream()));

                String serverWord = in.readLine();
                if (serverWord.equals("You win")){
                    clientSocket.close();
                }
                System.out.println(serverWord);
                out.write(reader.readLine() + "\n");
                out.flush();
            }
        } catch (IOException e) {
            System.err.println(e);
        }

    }
}