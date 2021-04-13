/*
Name: Ashna Nawar Ahmed
ID: 16.02.04.024
Lab Group: A1
Exam: Final Quiz
*/
#include<bits/stdc++.h>
using namespace std;
void E();
void A();
void B();
char str[100];
int i=0,len=0,flag=0;
bool accepted=false,isA=false,isB=false,isE=false;
int main()
{
    cout<<"Input string:"<<endl;
    cin>>str;
    len=strlen(str);
    E();
    if(isE)
    {
        cout<<"String is accepted"<<endl;
    }
    else
    {
        cout<<"String is rejected"<<endl;
    }
    return 0;
}
void E()
{
    isE=false;
    if(str[i]=='a')
    {
        i++;
        A();
        if(isA)
        {
            isA=false;
            isE=true;
            return;
        }
        else
        {
            isE=false;
            return;

        }
    }
    else if(str[i]=='b')
    {
        i++;
        A();
        if(isA)
        {
            isA=false;
            B();
            if(isB)
            {
                isB=false;
                isE=true;
                return;
            }
            else
            {
                isE=false;
                return;

            }
        }
        else
        {
            isE=false;
            return;

        }
    }
    else{
        isE=false;
        return;
    }

}
void A()
{
    isA=false;
    if(str[i]=='b'){
        i++;
        while(str[i]=='b'){
            i++;
        }
        isA=true;
        return;
    }
    else{
        isA=false;
        return;
    }

}
void B()
{
    if(str[i]=='a'){
        i++;
        isB=true;
        return;
    }
    else{

        isB=true;
        return;
    }
}
