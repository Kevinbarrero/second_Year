package Laboratory_2;

import java.io.*;
import java.net.Socket;

import java.io.*;
import java.net.Socket;

public class Client_number {

    private static Socket clientSocket; //сокет для общения
    private static BufferedReader reader; // нам нужен ридер читающий с консоли, иначе как
    // мы узнаем что хочет сказать клиент?
    private static BufferedReader in; // поток чтения из сокета
    private static BufferedWriter out; // поток записи в сокет

    public static void main(String[] args) {
        try {
            clientSocket = new Socket("127.0.0.1", 10000);
            while(!clientSocket.isClosed()) {
                // адрес - локальный хост, порт - 4004, такой же как у сервера
                // этой строкой мы запрашиваем
                //  у сервера доступ на соединение
                reader = new BufferedReader(new InputStreamReader(System.in));
                // читать соообщения с сервера
                in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                // писать туда же
                out = new BufferedWriter(new OutputStreamWriter(clientSocket.getOutputStream()));

                //System.out.println("Вы что-то хотели сказать? Введите это здесь:");
                // если соединение произошло и потоки успешно созданы - мы можем
                //  работать дальше и предложить клиенту что то ввести
                // если нет - вылетит исключение

                String serverWord = in.readLine();// ждём, что скажет сервер
                if (serverWord.equals("You win")){
                    clientSocket.close();
                }
                //out.write("");
                //out.flush();
                System.out.println(serverWord); // получив - выводим на экран// ждём пока клиент что-нибудь
                // не напишет в консоль
                out.write(reader.readLine() + "\n"); // отправляем сообщение на сервер
                out.flush();
            }
        } catch (IOException e) {
            System.err.println(e);
        }

    }
}