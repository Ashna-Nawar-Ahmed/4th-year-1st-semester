/*
Name: Ashna Nawar Ahmed
ID: 16.02.04.024
Lab Group: A1
Exam: Final Quiz
*/
#include<bits/stdc++.h>
using namespace std;
bool checker(char c1,char c2);
int main()
{
    FILE *p1;
    int lin=1,flag=false;
    int cnt=0;
    p1=fopen("input.txt","r");

    char c;
    while((c=fgetc(p1))!=EOF)
    {
        //cout<<c<<endl;
        if(c=='\n')
        {
            if(cnt!=0)
                cout<<"Line No. "<<lin<<": "<<cnt<<endl;
            lin++;
            cnt=0;
        }
        if(c=='\"')
        {
            flag=true;

            if(c=='\"'&&flag)
                flag=false;
        }
        if(!flag)
        {
            char c1=fgetc(p1);
            while(c1!='>'||c1!='<'||c1!='=')
            {
                c1=fgetc(p1);
            }
            if(c1=='>'||c1=='<'||c1=='=')
            {
                char c2=fgetc(p1);
                bool isRel=checker(c1,c2);
                if(isRel)
                {
                    cnt++;
                }

            }
        }
    }
    fclose(p1);
    return 0;
}
bool checker(char c1,char c2)
{
    if(c1=='>'||c1=='<'||c1=='=')
    {
        if(c2=='=')
        {
            return true;
        }
        else
        {
            return true;
        }
    }
    else
        return false;
}
