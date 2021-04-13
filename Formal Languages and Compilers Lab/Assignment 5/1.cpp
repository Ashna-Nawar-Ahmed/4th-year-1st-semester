/*
A -> aXd
X -> bbX
X -> bcX
X -> epsilon
*/
#include<bits/stdc++.h>
using namespace std;
void A();
void X();
char str[100];
int i=0,len=0,flag=0;
bool accepted=false;
int main()
{
    cout<<"Input string:"<<endl;
    cin>>str;
    len=strlen(str);
    A();
    if(accepted)
    {
        cout<<"String is accepted"<<endl;
    }
    else
    {
         cout<<"String is rejected"<<endl;
    }
    return 0;
}
void A()
{
    if(str[i]=='a')
    {
        i++;
        if(i<len)
            X();
    }
    if(str[i]=='d'&&flag==1)
    {
        accepted=true;
        return;
    }
    else
        return;

}
void X()
{
    flag=1;
    if(str[i]=='b')
    {
        i++;
        if(str[i]=='b')
        {
            i++;
            flag=1;
            while(true)
            {
                if(str[i]=='b')
                {
                    flag=0;
                    i++;
                    if(str[i]=='b')
                    {
                        flag=1;
                        i++;
                    }
                }
                else if(i==len) break;
                else break;
            }

            A();
        }
        else if(str[i]=='c')
        {
            i++;
            flag=1;
            while(true)
            {
                if(str[i]=='b')
                {
                    flag=0;
                    i++;
                    if(str[i]=='c')
                    {
                        flag=1;
                        i++;
                    }
                }
                else if(i==len) break;
                else break;
            }

            A();
        }
    }
    else
        return;
}
