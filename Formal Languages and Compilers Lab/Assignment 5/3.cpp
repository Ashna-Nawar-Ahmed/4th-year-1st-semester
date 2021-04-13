/*
<stat> -> <asgn_stat>||<dscn_stat>||<loop_stat>
<asgn_stat> -> id = <expn>
<expn> -> <smpl_expn> <extn>
<extn> -> <relop> <smpl_expn> | epsilon
<dcsn_stat> ->  if (<expn> ) <stat> <extn1>
<extn1> ->  else <stat> | epsilon
<loop_stat> -> while (<expn>) <stat> || for (<asgn_stat> ; <expn> ; <asgn_stat> ) <stat>
<relop> -> ==||!=||<=||>=||>||<
*/
#include<bits/stdc++.h>
using namespace std;
void expr();
void term();
void factor();
void relop();

void loop_stat();
void extn1();
void dscn_stat();
void extn();
void expn();
void asgn_stat();
void stat();

char str[100];
int i=0,len=0,flag=0;
bool accepted=false,isFactor=false,isTerm=false,isExpr=false;
bool isRelop=false, isAsgn=false, isStat=false, isDscn=false,isLoop=false;
bool isExpn=false,isExtn=false,isExtn1=false;
char id[5]= {'a','b','c','d','e'};
int num[10]= {0,1,2,3,4,5,6,7,8,9};
int main()
{
    cout<<"Input string:"<<endl;
    cin>>str;
    len=strlen(str);
    stat();
    if(isStat)
    {
        cout<<"String is accepted"<<endl;
    }
    else
    {
        cout<<"String is not accepted"<<endl;
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
            //isTerm=false;
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

void relop()
{
    isRelop=false;
    if((str[i]=='='&&str[i+1]=='=')||(str[i]=='!'&&str[i+1]=='=')||(str[i]=='>'&&str[i+1]=='=')||(str[i]=='<'&&str[i+1]=='='))
    {
        i+=2;
        isRelop=true;
        return;
    }
    else if(str[i]=='>'||str[i]=='<')
    {
        i+=1;
        isRelop=true;
        return;
    }
    else
    {
        i+=1;
        return;
    }
}

void stat()
{
    isStat=false;
    asgn_stat();
    if(isAsgn)
    {
        isAsgn=false;
        isStat=true;
        return;
    }
    else
    {
        dscn_stat();
        if(isDscn)
        {
            isDscn=false;
            isStat=true;
            return;
        }
        else
        {
            loop_stat();
            if(isLoop)
            {
                isLoop=false;
                isStat=true;
                return;
            }
            else
            {
                isStat=false;
                return;
            }
        }
    }
}

void asgn_stat()
{
    isAsgn=false;
    if(str[i]=='a'||str[i]=='b'||str[i]=='c'||str[i]=='d'||str[i]=='e')
    {
        i++;
        if(str[i]=='=')
        {
            i++;
            expn();
            if(isExpn)
            {
                isExpn=false;
                isAsgn=true;
                return;
            }
            else
            {
                isAsgn=false;
                return;
            }
        }
        else
        {
            i++;
            isAsgn=false;
            return;
        }
    }
    else
    {
        i++;
        isAsgn=false;
        return;
    }
}


void expn()
{
    isExpn=false;
    expr();
    if(isExpr)
    {
        isExpr=false;
        extn();
        if(isExtn)
        {
            isExtn=false;
            isExpn=true;
            return;
        }
        else
        {
            isExpn=false;
            return;
        }
    }
    else
    {
        isExpn=false;
        return;
    }
}
void extn()
{
    isExtn=false;
    relop();
    int current_i=i;
    if(isRelop)
    {
        isRelop=false;
        expr();
        if(isExpr)
        {
            isExpr=false;
            isExtn=true;
            return;
        }
        else
        {
            isExtn=false;
            return;
        }
    }
    else
    {
        i=current_i;
        isExtn=true;
        return;
    }
}

void dscn_stat()
{
    isDscn=false;
    if(str[i]=='i'&&str[i+1]=='f'&&str[i+2]=='(')
    {
        i+=3;
        expn();
        if(isExpn)
        {
            isExpn=false;
            if(str[i]==')')
            {
                i++;
                stat();
                if(isStat)
                {
                    isStat=false;
                    extn1();
                    if(isExtn1)
                    {
                        isExtn1=false;
                        if(str[i]==')')
                        {
                            i++;
                            isDscn=true;
                            return;
                        }
                        else
                        {
                            i++;
                            isDscn=false;
                            return;
                        }


                    }
                    else
                    {
                        isDscn=false;
                        return;
                    }

                }
                else
                {
                    isDscn=false;
                    return;
                }
            }
            else
            {
                isDscn=false;
                return;
                i++;

            }
        }
        else
        {
            isDscn=false;
            return;
        }

    }
    else
    {
        isDscn=false;
        return;
    }
}


void extn1()
{
    isExtn1=false;
    if(str[i]=='e'&&str[i+1]=='l'&&str[i+2]=='s'&&str[i+3]=='e')
    {
        i+=4;
        stat();
        if(isStat)
        {
            isStat=false;
            isExtn1=true;
            return;
        }
        else
        {
            isExtn1=false;
            return;
        }
    }
    else
    {
        isExtn1=true;
        return;
    }
}

void loop_stat()
{
    isLoop=false;
    if(str[i]=='w'&&str[i+1]=='h'&&str[i+2]=='i'&&str[i+3]=='l'&&str[i+4]=='e')
    {
        i+=5;
        if(str[i]=='(')
        {
            i++;
            expn();
            if(isExpn)
            {
                isExpn=false;
                if(str[i]==')')
                {
                    i++;
                    stat();
                    if(isStat)
                    {
                        isStat=false;
                        isLoop=true;
                        return;
                    }
                    else
                    {
                        isLoop=false;
                        return;
                    }
                }
                else
                {
                    i++;
                    isLoop=false;
                    return;
                }
            }
            else
            {
                isLoop=false;
                return;
            }

        }
        else
        {
            i++;
            isLoop=false;
            return;
        }
    }
    else if(str[i]=='f'&&str[i+1]=='o'&&str[i+2]=='r')
    {
        i+=3;
        if(str[i]=='(')
        {
            i++;
            asgn_stat();
            if(isAsgn)
            {
                isAsgn=false;
                if(str[i]==';')
                {
                    i++;
                    expn();
                    if(isExpn)
                    {
                        isExpn=false;
                        if(str[i]==';')
                        {
                            i++;
                            asgn_stat();
                            if(isAsgn)
                            {
                                isAsgn=false;
                                if(str[i]==')')
                                {
                                    i++;
                                    stat();
                                    if(isStat)
                                    {
                                        isStat=false;
                                        isLoop=true;
                                        return;
                                    }
                                    else
                                    {
                                        isLoop=false;
                                        return;
                                    }

                                }
                                else
                                {
                                    i++;
                                    isLoop=false;
                                    return;
                                }

                            }
                            else
                            {
                                isLoop=false;
                                return;
                            }
                        }
                        else
                        {
                            i++;
                            isLoop=false;
                            return;
                        }
                    }
                    else
                    {
                        isLoop=false;
                        return;
                    }
                }
                else
                {
                    i++;
                    isLoop=false;
                    return;
                }
            }
            else
            {
                isLoop=false;
                return;
            }
        }
        else
        {
            isLoop=false;
            return;
        }
    }
    else
    {
        isLoop=false;
        return;
    }
}
