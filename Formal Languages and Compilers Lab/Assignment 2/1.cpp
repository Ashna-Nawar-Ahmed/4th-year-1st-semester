#include<bits/stdc++.h>
using namespace std;
bool keyword(char *arr);
bool op(char *arr);
bool sep(char *arr);
bool par(char *arr);
bool num(char *arr,int len);
bool id(char *arr,int len);
int main()
{
    FILE *p1,*p2,*p3,*p4;
    p1=fopen("input.c","r");
    char c;
    printf("Original:\n");
    while((c=fgetc(p1))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p1);
    p1=fopen("input.c","r");
    p2=fopen("temp.txt","w");
    while((c=fgetc(p1))!=EOF)
    {
        if(c==';'||c==','||c=='('||c==')'||c=='{'||c=='}'||c=='['||c==']'||c=='+'||c=='-'||c=='*'||c=='/')
        {
            fputc(' ',p2);
            fputc(c,p2);
            fputc(' ',p2);
        }
        else if(c=='\''||c=='\"')
        {
            fputc(' ',p2);
            fputc(c,p2);
            fputc(' ',p2);
        }
        else if(c=='=')
        {
            if((c=fgetc(p1))=='=')
            {
                fputc(' ',p2);
                fputc(c,p2);
                fputc(c,p2);
                fputc(' ',p2);
            }
            else
            {
                fputc(' ',p2);
                fputc('=',p2);
                fputc(' ',p2);
                if(c=='\''||c=='\"')
                {
                    fputc(c,p2);
                    fputc(' ',p2);
                }
                else
                    fputc(c,p2);
            }
        }
        else if(c=='!')
        {
            if((c=fgetc(p1))=='=')
            {
                fputc(' ',p2);
                fputc('!',p2);
                fputc(c,p2);
                fputc(' ',p2);
            }
        }
        else if(c=='<'||c=='>')
        {
            char prev=c;
            if((c=fgetc(p1))=='=')
            {
                fputc(' ',p2);
                fputc(prev,p2);
                fputc(c,p2);
                fputc(' ',p2);
            }
            else
            {
                fputc(' ',p2);
                fputc(prev,p2);
                fputc(' ',p2);
                fputc(c,p2);
            }
        }
        else
        {
            fputc(c,p2);
        }

    }
    fclose(p1);
    fclose(p2);
    p2=fopen("temp.txt","r");
    p3=fopen("temp2.txt","w");
    while((c=fgetc(p2))!=EOF)
    {
        if(c==' ')
        {
            while((c=fgetc(p2))==' ');
            fputc(' ',p3);
            fputc(c,p3);
        }
        else
            fputc(c,p3);
    }
    fclose(p2);
    fclose(p3);


    p3=fopen("temp2.txt","r");
    printf("\n\nAfter Step 1:\n");
    while((c=fgetc(p3))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p3);

    p3=fopen("temp2.txt","r");
    p4=fopen("final.txt","w");
    char ar[100];
    int index=0;
    while((c=fgetc(p3))!=EOF)
    {
        ar[index++]=c;
        while((c=fgetc(p3))!=' ')
        {
            ar[index++]=c;
        }
        ar[index]='\0';

        fputc('[',p4);
        bool state=keyword(ar);
        if(!state)
        {
            state=op(ar);
            if(!state)
            {
                state=sep(ar);
                if(!state)
                {
                    state=par(ar);
                    if(!state)
                    {
                        state=num(ar,index);
                        if(!state)
                        {
                            state=id(ar,index);
                            if(!state)
                            {
                                fputs("unkn",p4);
                            }
                            else
                                fputs("id",p4);

                        }
                        else
                            fputs("num",p4);
                    }
                    else
                        fputs("par",p4);
                }
                else
                    fputs("sep",p4);
            }
            else
                fputs("op",p4);
        }
        else
            fputs("kw",p4);

        fputc(' ',p4);
        fputs(ar,p4);
        fputc(']',p4);
        index=0;
        memset(ar, 0, sizeof(ar));

    }
    fclose(p3);
    fclose(p4);
    p4=fopen("final.txt","r");
    printf("\n\nAfter Step 2:\n");
    while((c=fgetc(p4))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p4);

}
bool keyword(char *arr)
{
    if(strcmp("char", arr)==0||strcmp("int", arr)==0||strcmp("float", arr)==0||strcmp("string", arr)==0||strcmp("include", arr)==0
            ||strcmp("if", arr)==0||strcmp("else", arr)==0||strcmp("for", arr)==0||strcmp("while", arr)==0||strcmp("do", arr)==0)
    {
        return true;
    }
    else
    {
        return false;
    }

}
bool op(char *arr)
{
    if(strcmp("=", arr)==0||strcmp("+", arr)==0||strcmp("-", arr)==0||strcmp("*", arr)==0||strcmp("/", arr)==0
            ||strcmp("<=", arr)==0||strcmp(">=", arr)==0||strcmp("<", arr)==0||strcmp(">", arr)==0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool sep(char *arr)
{
    if(strcmp(",", arr)==0||strcmp(";", arr)==0||strcmp("\'", arr)==0||strcmp("\"", arr)==0)
    {
        return true;
    }
    else
    {
        return false;
    }
}
bool par(char *arr)
{
    if(strcmp("(", arr)==0||strcmp(")", arr)==0||strcmp("{", arr)==0||strcmp("}", arr)==0||strcmp("[", arr)==0||strcmp("]", arr)==0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool num(char *arr,int len)
{
    int flag=0;
    for(int i=0; i<len; i++)
    {
        if(isdigit(arr[i])!=0||arr[i]=='.')
            continue;
        else
        {
            flag=1;
            break;
        }
    }
    if(flag==1)
    {
        return false;
    }
    else
    {
        return true;
    }
}

bool id(char *arr,int len)
{
    int flag=0;
    if(arr[0]=='_'||isalpha(arr[0])!=0)
    {
        for(int i=1; i<len; i++)
        {
            if(isdigit(arr[i])!=0||isalpha(arr[i])!=0||arr[i]=='_')
                continue;
            else
            {
                flag=1;
                break;
            }
        }
        if(flag==1)
        {
            return false;
        }
        else
        {
            return true;
        }

    }
    else
    {
        return false;
    }

}
