package Laboratory_2;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;

public class Server_number {

    private static Socket clientSocket; //сокет для общения
    private static ServerSocket server; // серверсокет
    private static BufferedReader in; // поток чтения из сокета
    private static BufferedWriter out; // поток записи в сокет

    public static void main(String[] args) throws IOException {
        try {
            server = new ServerSocket(10000);
            System.out.println("Server is running");
            clientSocket = server.accept();
            System.out.println("Connection with client established");
            int attempts = 3;
            do {
                // серверсокет прослушивает порт 4004
                // хорошо бы серверу
                //   объявить о своем запуске
                // accept() будет ждать пока
                //кто-нибудь не захочет подключиться
                // установив связь и воссоздав сокет для общения с клиентом можно перейти
                // к созданию потоков ввода/вывода.
                // теперь мы можем принимать сообщения

                // и отправлять
                out = new BufferedWriter(new OutputStreamWriter(clientSocket.getOutputStream()));
                out.write("Give me the number, you have: " + attempts + " attempts"+"\n");
                out.flush();
                in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                String word = in.readLine(); // ждём пока клиент что-нибудь нам напишет
                System.out.println(word);
                // не долго думая отвечает клиенту
                // выталкиваем все из буфера
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