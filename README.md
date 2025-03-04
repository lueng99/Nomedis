import Tamagochi.Tamagochi;

import javax.swing.*;
import java.util.*;
class Main {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        Tamagochi dragon= new Tamagochi(100,10);
                //Nombre del dragón
                Scanner teclado = new Scanner(System.in);  // Create a Scanner object
                System.out.println("¿Que nombre le deseas poner?");
                String nombre = teclado.nextLine();
                //Color del dragón
                System.out.println("¿Que color tiene?");
                String color = teclado.nextLine();
                //Accesorios
                System.out.println("¿Que accesorio le quieres añadir?\n (1) una guitarra\n (2) un lazo\n (3) unos cascos\n (4) un collar de corazón\n ");
                int opcion = teclado.nextInt();
                String accesorio;
                switch (opcion) {
                    case 1:
                        accesorio = "una guitarra ";
                        break;
                    case 2:
                        accesorio = "un lazo ";
                        break;
                    case 3:
                        accesorio = "unos cascos";
                        break;
                    case 4:
                        accesorio = "uno collar de corazón ";
                        break;
                    default:
                        System.out.println("Opción no válida, no tiene accesorios.");
                        accesorio = "sin accesorios";

                        System.out.println(" El nombre de tu dragón es " + nombre + "\n Es de color " + color
                                + "\n y lleva " + accesorio);
                        System.out.println(" No perdamos más el tiempo a jugar!!!");

                        //Decisión

                        System.out.println("¿Que quiere hacer" + nombre + "?\n a)Jugar\n b)Comer\n c)Beber\n d)Volar");
                        int opcion1 = teclado.nextInt();
                        String decision;
                        switch (opcion1) {
                            case 1:
                                Scanner myjuego = new Scanner(System.in);
                                System.out.println("Elige el juego:\n a)Misterios del Laberinto\n b)Desafío de Sabiduría\n ");
                                int opcion2 = myjuego.nextInt();
                                String juego;
                                switch (opcion2) {
                                    case 1:
                                        System.out.println("Has elegido los Misterios del Laberinto");
                                        Juego_Laberinto juego_laberinto = new Juego_Laberinto();
                                        int contador1 = 0;
                                        try {
                                            if (juego_laberinto.play1() == 1){
                                                dragon.aumentarvida();
                                            }
                                            else{dragon.bajarvida();}
                                        } catch (InterruptedException e) {
                                            throw new RuntimeException(e);
                                        }

                                        break;
                                    case 2:
                                        juego = "Desafia de Sabidura";
                                        Juego_Preguntas juego_preguntas = new Juego_Preguntas();
                                        int contador = juego_preguntas.play();
                                        if (contador >= 8) {
                                            System.out.println("Enorabuena has ganado!!!");

                                        } else {
                                            System.out.println("Has perdido!!!");
                                        }
                                        break;
                                }


                            case 2:

                            case 3:

                            case 4:

                        }
                }
            }

}

