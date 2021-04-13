/*Name: Ashna Nawar Ahmed       ID: 16.02.04.024
Online No: 1                  Lab Group: A1*/


#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2;
    p1=fopen("input.c","r");
    p2=fopen("output.txt","w");
    char c;
    string s;
    char str[7];
    int line=1;
    while((c=fgetc(p1))!=EOF)
    {
        if(c=='p')
        {
            if((s=fgets(str, 6, p1))=="rintf")
            {
                while((c=fgetc(p1))!='"');
                while((c=fgetc(p1))!='"')
                {
                    cout<<c;
                }
                cout<<": Statement Line Number- "<<line;
                cout<<endl;

            }
        }
        if(c=='\n')
            line++;
    }

    return 0;
}

