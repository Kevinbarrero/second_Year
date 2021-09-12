package Laboratory_2;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class Server_number {

    private static Socket clientSocket;
    private static ServerSocket server;
    private static BufferedReader in;
    private static BufferedWriter out;
    public static void main(String[] args) throws IOException {
        try {
            server = new ServerSocket(10000);
            System.out.println("Server is running");
            clientSocket = server.accept();
            System.out.println("Connection with client established");
            int attempts = 3;
            do {

                out = new BufferedWriter(new OutputStreamWriter(clientSocket.getOutputStream()));
                out.write("Give me the number, you have: " + attempts + " attempts"+"\n");
                out.flush();
                in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                String word = in.readLine();
                System.out.println(word);
                if (Integer.parseInt(word) == (int) (Math.random() * 10)){
                    out.write("You win" + "\n");
                    out.flush();

                }else
                    attempts+=-1;
            }while (attempts!= 0);
        } catch (IOException e) {
            System.err.println(e);
        }
        server.close();
        System.out.println("Сервер закрыт!");
    }
}