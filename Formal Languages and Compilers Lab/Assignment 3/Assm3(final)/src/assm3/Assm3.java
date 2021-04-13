/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assm3;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/**
 *
 * @author ashna
 */
public class Assm3 {

    /**
     * @param args the command line arguments
     */
    static SymbolTable finalst[] = new SymbolTable[100];
    static int count = 0;

    public static void main(String[] args) throws FileNotFoundException, IOException {
        // TODO code application logic here

        ///STEP 1: REMOVING EVERYTHING EXCEPT IDENTIFIER NAMES
        File file = new File("input.txt");
        File file1;
        FileWriter wr = new FileWriter("output1.txt");
        FileWriter wr1 = new FileWriter("output2.txt");
        Scanner sc = new Scanner(file);
        sc.useDelimiter(" ");

        while (sc.hasNext()) {
            String s = sc.next();
            if (s.equals("[id")) {
                wr.append(s + " ");
            } else if (s.charAt(0) == '[') {
                wr.append("[");
            } else {
                wr.append(s);
            }
        }
        wr.close();
        file = new File("output1.txt");
        sc = new Scanner(file);
        sc.useDelimiter("]");

        System.out.println("After step 1:");
        while (sc.hasNext()) {
            System.out.print(sc.next() + "]");
        }
        System.out.println();
        for (int i = 0; i < 100; i++) {
            SymbolTable s1 = new SymbolTable(0, "", "", "", "", "");
            finalst[i] = s1;

        }

        //STEP 2:  Symbol Table generation
        SymbolTable st1 = new SymbolTable(0, "", "", "", "", "");
        file1 = new File("output1.txt");
        Scanner sc1 = new Scanner(file1);
        sc1.useDelimiter("\\]");//SO EACH STRING LOOKS LIKE "[..."
        String scope = "global";
        int ar[] = new int[100];
        int arCount = 0;
        while (sc1.hasNext()) {
            String s = sc1.next();
            String sn = s.substring(1, s.length());
            if (sn.equals("float") || sn.equals("int") || sn.equals("double") || sn.equals("long") || sn.equals("void") || sn.equals("string")) {
                st1.dataType = sn;
                wr1.append("[" + sn + "]");

            } else if (s.length() > 4) {
                //identifier
                if (s.charAt(3) == ' ') {
                    wr1.append("[id ***]");
                    st1.name = s.substring(4);
                    s = sc1.next();
                    //variable with value OR calling a function
                    if (s.charAt(1) == '=') {
                        wr1.append("[=]");
                        st1.idType = "var";
                        st1.scope = scope;
                        st1.value = "";

                        //TAKING VALUE
                        s = sc1.next();

                        //DIRECT VALUE
                        if (s.length() < 4 || (s.length() > 4 && s.charAt(3) != ' ')) {

                            st1.value = s.substring(1, s.length());
                            wr1.append("[" + st1.value + "]");
                            int x = search(st1.name, st1.scope);

                            //new entry
                            if (x == 0) {

                                int y = insert(st1);
                                ar[arCount++] = y;
                                reset(st1);
                                
                            } //updating old entry
                            else {
                                ar[arCount++] = x;
                                update(st1.name, st1.scope, st1.value);
                            }

                        } //VARIABLE REFERS TO A FUNCTION
                        else if (s.length() > 4 && s.charAt(3) == ' ') {
                            //for leftside's variable
                            wr1.append("[id ***]");
                            int x = search(st1.name, st1.scope);

                            if (x == 0) {
                                int y = insert(st1);
                                ar[arCount++] = y;

                                reset(st1);
                            } else {
                                ar[arCount++] = x;
                            }

                            String nameOfFunc = s.substring(4);
                            int z = search(nameOfFunc, "global");
                            ar[arCount++] = z;
                            while (!s.equals("[;")) {
                                s = sc1.next();
                                if (s.equals("[(")) {
                                    wr1.append("[(]");
                                }
                                if (s.equals("[)")) {
                                    wr1.append("[)]");
                                }
                                //variable passed as argument
                                if (s.length() > 4 && s.charAt(3) == ' ') {
                                    wr1.append("[id ***]");
                                    String sname = s.substring(4);
                                    int w = search(sname, scope);
                                    ar[arCount++] = w;

                                }

                            }
                            if (s.equals("[;")) {
                                wr1.append("[;]");
                            }
                        }

                    } //function
                    else if (s.charAt(1) == '(') {
                        wr1.append("[(]");
                        st1.idType = "func";
                        st1.scope = scope;
                        scope = st1.name;
                        st1.value = "";
                        int x = search(st1.name, st1.scope);
                        //new entry
                        if (x == 0) {

                            int y = insert(st1);
                            ar[arCount++] = y;

                            reset(st1);
                        } 
                        //old entry update
                        else {
                            ar[arCount++] = x;

                        }
                        //PRINTING TILL NEXT ARGUMENT
                        while (sc1.hasNext()) {
                            String a = sc1.next();
                            if (a.equals("[void")) {
                                wr1.append("[void]");
                            }
                            if (a.equals("[)")) {
                                wr1.append("[)][{]");
                                break;
                            } else {
                                String sn12 = a.substring(1);
                                if (sn12.equals("int") || sn12.equals("string") || sn12.equals("float") || sn12.equals("double") || sn12.equals("long")) {
                                    wr1.append("[" + sn12 + "]");
                                    st1.idType = "var";
                                    st1.scope = scope;
                                    wr1.append("[id ***]");
                                    st1.name = sc1.next().substring(4);
                                    st1.dataType = sn12;
                                    int y = insert(st1);
                                    ar[arCount++] = y;

                                    reset(st1);
                                }
                                if (sn12.equals(",")) {
                                    wr1.append("[" + sn12 + "]");
                                }

                            }

                        }

                    } //variable without value
                    else if (s.charAt(1) == ';') {
                        wr1.append("[;]");
                        st1.idType = "var";
                        st1.scope = scope;
                        st1.value = "";
                        int x = search(st1.name, st1.scope);

                        if (x == 0) {
                            int y = insert(st1);
                            ar[arCount++] = y;

                            reset(st1);
                        } else {
                            ar[arCount++] = x;
                        }
                    }

                } else if (s.equals("[return")) {
                    wr1.append("[return]");
                    while (sc1.hasNext()) {
                        String a = sc1.next();
                        String an = a.substring(1);
                        if (a.length() > 4) {
                            if (a.charAt(3) == ' ') {
                                String name = a.substring(4);
                                int x = 5;
                                x = search(name, scope);
                                wr1.append("[id ***]");
                                ar[arCount++] = x;
                            }
                        }
                        if (a.equals("[;")) {
                            wr1.append("[;]");

                        }
                        if (a.equals("[}")) {
                            wr1.append("[}]");
                            scope = "global";
                            break;
                        }
                    }
                }
            } else if (s.equals("[}")) {

                scope = "global";
            } else if (sn.equals(";") || sn.equals(",") || sn.equals("}") || sn.equals("void")) {
                wr1.append("[" + sn + "]");

            }

        }
        wr1.close();

        for (int i = 0; i < count; i++) {
            if (finalst[i].value.length() > 3) {
                if (finalst[i].value.charAt(2) == ' ') {

                    finalst[i].value = "";
                }
            }
        }

        display();
        
        
        
        //FINAL OUTPUT WITH STEP 4 DONE
        System.out.println("\nFinal Output:");
        file = new File("output1.txt");
        Scanner sc2 = new Scanner(file);
        sc2 = new Scanner(file);
        sc2.useDelimiter("]");
        int cnt = 1;

        file = new File("output2.txt");
        sc2 = new Scanner(file);
        sc2.useDelimiter("]");
        int arCnt2 = 0;
        while (sc2.hasNext()) {
            String s = sc2.next();
            if (s.length() > 4) {
                if (s.charAt(3) == ' ') {
                    System.out.print("[id " + ar[arCnt2++] + "]");
                } else {
                    System.out.print(s + "]");
                }
            } else {
                System.out.print(s + "]");
            }
            
        }
        System.out.println();

    }

    static void reset(SymbolTable st1) {
        st1.dataType = "";
        st1.idType = "";
        st1.name = "";
        st1.value = "";
    }
    
    
    //STEP 3: Implementing functions on symbol table
    static int insert(SymbolTable st) {
        finalst[count].slNo = count + 1;
        finalst[count].name = st.name;
        finalst[count].idType = st.idType;
        finalst[count].dataType = st.dataType;
        finalst[count].scope = st.scope;
        finalst[count].value = st.value;
        count++;
        return count;

    }

    static void update(String name, String scope, String val) {
        int found = search(name, scope);
        if (found != 0) {
            finalst[found - 1].value = val;
        }
    }

    static void delete(String name, String scope) {
        for (int i = 0; i < count; i++) {
            if (finalst[i].name.equals(name) && finalst[i].scope.equals(scope)) {
                SymbolTable s1 = new SymbolTable(0, "", "", "", "", "");
                finalst[i] = s1;
            }
        }

    }

    static int search(String name, String scope) {
        int found = 0;
        for (int i = 0; i < count; i++) {

            if (finalst[i].name.equals(name) && finalst[i].scope.equals(scope)) {

                found = finalst[i].slNo;
                break;
            }
        }
        return found;

    }

    static void display() {
        System.out.println("Sl. No.-> Name-> Id Type-> Data Type-> Scope-> Value ");
        for (int i = 0; i < count; i++) {
            if (finalst[i].slNo != 0) {
                System.out.println(finalst[i].slNo + "->" + finalst[i].name + "->" + finalst[i].idType + "->" + finalst[i].dataType + "->" + finalst[i].scope + "->" + finalst[i].value);

            }
        }
    }

}

class SymbolTable {

    //Sl. No. Name Id Type Data Type Scope Value 
    int slNo;
    String name, idType, dataType, scope, value;

    SymbolTable(int slNo, String name, String idType, String dataType, String scope, String value) {
        this.slNo = slNo;
        this.name = name;
        this.idType = idType;
        this.dataType = dataType;
        this.scope = scope;
        this.value = value;

    }
}
