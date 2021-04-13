/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab.exercise;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author ashna
 */
public class LabExercise {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        // TODO code application logic here
        File file = new File("input.c");
        File file1;
        FileWriter wr = new FileWriter("output1.txt");
        FileWriter wr1 = new FileWriter("output2.txt");
        Scanner sc = new Scanner(file);
        sc.useDelimiter("\n");
        int cnt = 1;
        //ADDING LINE NUMBERS TO EACH LINE
        System.out.println("Output 1:");
        while (sc.hasNext()) {
            String s = sc.next();
            wr.append(cnt + " " + s);
            System.out.println(cnt + " " + s);
            cnt++;
        }
        wr.close();
        
        
        System.out.println("\n");
        System.out.println("Output 2:");
        file1 = new File("output1.txt");
        sc = new Scanner(file1);

        //REMOVING COMMENTS AND WHITE SPACES
        while (sc.hasNext()) {
            String s = sc.nextLine();
            if (s.contains("/*")) {
                //ADDING THE LINE NUMBER TO THE OUTPUT FILE
                wr1.append(s.charAt(0));
                if (Character.isDigit(s.charAt(1))) {
                    //IF THE LINE NUMBER IS IN DOUBLE DIGITS
                    wr1.append(s.charAt(1));
                }
                wr1.append("\n");
                while (!s.contains("*/")) {
                    //MULTI LINE COMMENTS
                    wr1.append(s.charAt(0));
                    s = sc.nextLine();
                    wr1.append("\n");
                }
            } else {
                //REMOVING WHITE SPACES
                String s1 = s.replaceAll("\\s+", " ");
                wr1.append(s1);
                wr1.append("\n");
            }

        }
        wr1.close();

        //OUTPUT 2
        file1 = new File("output2.txt");
        sc = new Scanner(file1);
        while (sc.hasNext()) {
            String s = sc.nextLine();
            System.out.println(s);
        }
        ArrayList<BracketWithLineNum> brackets = new ArrayList<BracketWithLineNum>();
        sc = new Scanner(file1);
        while (sc.hasNext()) {
            String s = sc.nextLine();          
            int lineNum = Character.getNumericValue(s.charAt(0));
            if (s.length() > 1) {
                if (Character.isDigit(s.charAt(1))) {
                    //IF THE LINE NUMBER IS IN DOUBLE DIGITS
                    lineNum = lineNum * 10 + Character.getNumericValue(s.charAt(1));
                    
                }
            }
            for (int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                if (c == '(' || c == ')' || c == '{' || c == '}' || c == '[' || c == ']') {
                    brackets.add(new BracketWithLineNum(c,lineNum));
                    int currentSize = brackets.size();
                    
                    switch (c) {
                        case ')':
                            //IF BRACKETS MATCH
                            if (currentSize >= 2) {
                                if (brackets.get(currentSize - 2).bracket == '(') {
                                    brackets.remove(currentSize - 1);
                                    brackets.remove(currentSize - 2);
                                }
                            } 
                            //IF BRACKETS DONT MATCH
                            else {
                                System.out.println("Misplaced ')' at line " + lineNum);
                                brackets.remove(currentSize - 1);
                            }
                            break;
                        case '}':
                            //IF BRACKETS MATCH
                            if (currentSize >= 2) {
                                if (brackets.get(currentSize - 2).bracket == '{') {
                                    brackets.remove(currentSize - 1);
                                    brackets.remove(currentSize - 2);
                                }
                            } 
                            //IF BRACKETS DONT MATCH
                            else {
                                System.out.println("Misplaced '}' at line " + lineNum);
                                brackets.remove(currentSize - 1);
                            }
                            break;
                        case ']':
                            //IF BRACKETS MATCH
                            if (currentSize >= 2) {
                                if (brackets.get(currentSize - 2).bracket == '[') {
                                    brackets.remove(currentSize - 1);
                                    brackets.remove(currentSize - 2);
                                }
                            } 
                            //IF BRACKETS DONT MATCH
                            else {
                                System.out.println("Misplaced ']' at line " + lineNum);
                                brackets.remove(currentSize - 1);
                            }
                            break;
                    }

                }
            }
            
        }
        
        //IF THERE ARE STILL BRACKETS REMAINING IN ARRAYLIST
        if(brackets.size()>0){
            for(int i=0;i<brackets.size();i++){
                System.out.println("Misplaced '"+brackets.get(i).bracket+"' at line "+brackets.get(i).line);
            }
        }
    }

}
class BracketWithLineNum{
    char bracket;
    int line;
    BracketWithLineNum(char bracket,int line){
        this.bracket=bracket;
        this.line=line;
    }
}
