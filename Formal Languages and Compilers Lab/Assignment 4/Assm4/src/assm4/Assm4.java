/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assm4;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Pattern;

/**
 *
 * @author ashna
 */
public class Assm4 {

    public static void main(String[] args) throws FileNotFoundException, IOException {
        // TODO code application logic here
        File file = new File("input.c");
        File file1;
        FileWriter wr = new FileWriter("output1.txt");
        FileWriter wr1 = new FileWriter("output2.txt");
        FileWriter wr2 = new FileWriter("output3.txt");

        //String[] errorMessages=new String[100];
        ArrayList<String> errorMessages = new ArrayList<String>();

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
        int ifElseCount[] = new int[2];
        while (sc.hasNext()) {
            String s = sc.nextLine();
            //CALCULATING LINE NUMBER
            int lineNum = Character.getNumericValue(s.charAt(0));
            if (s.length() > 1) {
                if (Character.isDigit(s.charAt(1))) {
                    //IF THE LINE NUMBER IS IN DOUBLE DIGITS
                    lineNum = lineNum * 10 + Character.getNumericValue(s.charAt(1));

                }
            }
            if (s.contains("if")) {
                ifElseCount[0]++;
            }
            if (s.contains("else")) {
                ifElseCount[1]++;
                if (ifElseCount[1] > ifElseCount[0]) {
                    String err = "Unmatched 'else' at line " + lineNum;
                    errorMessages.add(err);
                    //System.out.println("Unmatched 'else' at line " + lineNum);
                }
            }
            if (!s.contains("for")) {

                for (int i = 0; i < s.length(); i++) {
                    if (s.charAt(i) == ';') {
                        if (s.length() > i + 1) {
                            if (s.charAt(i + 1) == ';') {
                                //System.out.println("Duplicate token at line " + lineNum);
                                String err = "Duplicate token at line " + lineNum;
                                errorMessages.add(err);
                                break;

                            }
                        }
                    }
                }
            }

            for (int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                if (c == '(' || c == ')' || c == '{' || c == '}' || c == '[' || c == ']') {
                    brackets.add(new BracketWithLineNum(c, lineNum));
                    int currentSize = brackets.size();

                    switch (c) {
                        case ')':
                            //IF BRACKETS MATCH
                            if (currentSize >= 2) {
                                if (brackets.get(currentSize - 2).bracket == '(') {
                                    brackets.remove(currentSize - 1);
                                    brackets.remove(currentSize - 2);
                                }
                            } //IF BRACKETS DONT MATCH
                            else {
                                //System.out.println("Misplaced ')' at line " + lineNum);
                                String err = "Misplaced ')' at line " + lineNum;
                                errorMessages.add(err);
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
                            } //IF BRACKETS DONT MATCH
                            else {
                                String err = "Misplaced '}' at line " + lineNum;
                                errorMessages.add(err);
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
                            } //IF BRACKETS DONT MATCH
                            else {
                                String err = "Misplaced ']' at line " + lineNum;
                                errorMessages.add(err);
                                brackets.remove(currentSize - 1);
                            }
                            break;
                    }

                }
            }

        }

        //IF THERE ARE STILL BRACKETS REMAINING IN ARRAYLIST
        if (brackets.size() > 0) {
            for (int i = 0; i < brackets.size(); i++) {
                String err = "Misplaced '" + brackets.get(i).bracket + "' at line " + brackets.get(i).line;
                errorMessages.add(err);
                //System.out.println("Misplaced '" + brackets.get(i).bracket + "' at line " + brackets.get(i).line);
            }
        }

        //OUTPUT 3
        //ADDING SPACING TO HELP WITH TOKENIZATION
        file1 = new File("output2.txt");
        sc = new Scanner(file1);
        while (sc.hasNext()) {
            String s = sc.nextLine();
            for (int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                switch (c) {
                    case ';':
                    case ',':
                    case '(':
                    case ')':
                    case '{':
                    case '}':
                    case '[':
                    case ']':
                    case '+':
                    case '-':
                    case '*':
                    case '/':
                    case '\'':
                    case '\"':
                        wr2.append(" " + c + " ");
                        if (c == '!' && s.charAt(i + 1) == '=') {
                            wr2.append(" " + c + '=' + " ");
                        }
                        break;
                    case '=':
                        if (s.charAt(i + 1) == '=') {
                            wr2.append(" " + c + c + " ");
                        } else {
                            wr2.append(" " + c + " ");
                        }
                        break;
                    case '>':
                    case '<':
                        if (s.charAt(i + 1) == '=') {
                            wr2.append(" " + c + '=' + " ");
                        } else {
                            wr2.append(" " + c + " ");
                        }
                        break;
                    default:
                        wr2.append(c);
                        break;
                }

            }
            wr2.append("\n");

        }
        wr2.close();

        //TOKENIZATION       
        file1 = new File("output3.txt");
        FileWriter wr3 = new FileWriter("output4.txt");
        sc = new Scanner(file1);
        while (sc.hasNext()) {
            String s1 = sc.nextLine();
            int lineNum = Character.getNumericValue(s1.charAt(0));
            if (s1.length() > 1) {
                if (Character.isDigit(s1.charAt(1))) {
                    //IF THE LINE NUMBER IS IN DOUBLE DIGITS
                    lineNum = lineNum * 10 + Character.getNumericValue(s1.charAt(1));

                }
            }
            String[] arrOfStr = s1.split("\\s");
            StringBuilder s2 = new StringBuilder(s1);
            int countCurrentIndex = 0;
            for (int i = 0; i < arrOfStr.length; i++) {
                String s = arrOfStr[i];
                if (isKeyword(s) || isOperator(s) || isSeparator(s) || isParentheses(s) || isNumeric(s)) {
                    countCurrentIndex += s.length() - 1;
                    if (isKeyword(s)) {
                        if (isKeyword(arrOfStr[i + 1])) {
                            String err = "Duplicate token at line " + lineNum;
                            errorMessages.add(err);
                        }

                    }
                    continue;
                } else if (isIdentifier(s)) {
                    int x = s2.indexOf(s, countCurrentIndex);
                    s2.insert(x, "id ");
                    countCurrentIndex += s.length() + 2;
                }

            }
            wr3.append(s2 + "\n");

        }
        wr3.close();

        System.out.println("\n\nFINAL OUTPUT:");
        file1 = new File("output4.txt");
        sc = new Scanner(file1);
        while (sc.hasNext()) {
            String s1 = sc.nextLine();
            System.out.println(s1);
        }
        System.out.println("\nError Messages:-");
        for(int i=0;i<errorMessages.size();i++){
            System.out.println(errorMessages.get(i));
        }

    }

    static boolean isKeyword(String s) {
        if (s.equals("int") || s.equals("float") || s.equals("double") || s.equals("char")
                || s.equals("string") || s.equals("include") || s.equals("if") || s.equals("else")
                || s.equals("for") || s.equals("while") || s.equals("do")) {
            return true;
        }
        return false;
    }

    static boolean isOperator(String s) {
        if (s.equals("=") || s.equals("+") || s.equals("-") || s.equals("*") || s.equals('/')
                || s.equals("<") || s.equals(">") || s.equals("<=") || s.equals(">=")) {
            return true;
        }
        return false;
    }

    static boolean isSeparator(String s) {
        if (s.equals(",") || s.equals(";") || s.equals("\'") || s.equals("\"")) {
            return true;
        }
        return false;
    }

    static boolean isParentheses(String s) {
        if (s.equals("(") || s.equals(")") || s.equals("{") || s.equals("}")
                || s.equals("[") || s.equals("]")) {
            return true;
        }
        return false;
    }

    static boolean isNumeric(String s) {
        Pattern isNumber = Pattern.compile("-?\\d+(\\.\\d+)?");

        if (isNumber.matcher(s).matches()) {
            return true;
        }
        return false;
    }

    static boolean isIdentifier(String s) {
        Pattern isId = Pattern.compile("(\\w+)?");
        if (s.length() >= 1) {
            if (isId.matcher(s.substring(1)).matches()) {
                return true;
            }
        }
        return false;

    }
}

/*file1 = new File("output4.txt");
        sc = new Scanner(file1);
        while (sc.hasNext()) {
            String s = sc.nextLine();
            System.out.println(s);
        }*/
class BracketWithLineNum {

    char bracket;
    int line;

    BracketWithLineNum(char bracket, int line) {
        this.bracket = bracket;
        this.line = line;
    }
}
