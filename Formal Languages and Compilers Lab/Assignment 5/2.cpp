/*
GENERATING SIMPLE ARITHMETIC EXPRESSIONS
*/
#include<bits/stdc++.h>
using namespace std;
void expr();
void term();
void factor();
char str[100];
int i=0,len=0,flag=0;
bool accepted=false,isFactor=false,isTerm=false,isExpr=false;
char id[5]= {'a','b','c','d','e'};
int num[10]= {0,1,2,3,4,5,6,7,8,9};
int main()
{
    cout<<"Input string:"<<endl;
    cin>>str;
    len=strlen(str);
    expr();
    if(isExpr)
    {
        cout<<"String is an expression"<<endl;
    }
    else
    {
        cout<<"String is not an expression"<<endl;
    }
    return 0;
}


void expr()
{
    isExpr=false;
    term();
    if(isTerm)
    {
        isTerm=false;
        if(str[i]=='+'||str[i]=='-')
        {
            i++;
            isExpr=false;
            term();
            if(isTerm)
            {
                isTerm=false;
                isExpr=true;
                return;
            }
            else
            {
                isExpr=false;
                return;
            }
        }
        else
        {
            isExpr=true;
            return;
        }
    }
}
void term()
{
    isTerm=false;
    factor();
    if(isFactor)
    {
        isFactor=false;
        if(str[i]=='*'||str[i]=='/')
        {
            i++;
            factor();
            if(isFactor)
            {
                isFactor=false;
                isTerm=true;
                return;
            }
            else
            {
                isFactor=false;
                isTerm=false;
                return;
            }
        }
        else
        {
            isTerm=true;
            return;
        }
    }
}
void factor()
{
    isFactor=false;
    if(isdigit(str[i])==1)
    {
        while(isdigit(str[i])==1)
        {
            isFactor=true;
            i++;
        }
        return;
    }
    else if(str[i]=='a'||str[i]=='b'||str[i]=='c'||str[i]=='d'||str[i]=='e')
    {
        isFactor=true;
        i++;
        return;
    }
    else if(str[i]=='(')
    {
        i++;
        expr();
        if(isExpr)
        {
            isExpr=false;
            if(str[i]==')')
            {
                isFactor=true;
                i++;
                return;
            }
            else
            {
                isFactor=false;
                i++;
                return;
            }
        }
        else
        {
            return;
        }
    }
    else
    {
        isFactor=false;
        return;
    }
}


