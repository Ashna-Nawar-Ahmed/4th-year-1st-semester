#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2,*p3;
    p1=fopen("input.c","r");
    p2=fopen("temp.txt","w");
    char c;
    printf("Original:\n");
    while((c=fgetc(p1))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p1);
    p1=fopen("input.c","r");
    if(!p1)
        printf("File not found");
    else
    {
        while((c=fgetc(p1))!=EOF)
        {
            if(c=='\n')
                fputc(' ',p2);
            else if(c=='"')
            {
                do
                {
                    fputc(c,p2);
                }
                while((c=fgetc(p1))!='"');
                fputc(c,p2);
            }
            else if(c==' ')
            {
                while((c=fgetc(p1))==' ');
                fputc(' ',p2);
                if(c!='/')
                    fputc(c,p2);
                else
                {
                    char c1;
                    c1=fgetc(p1);
                    if(c1=='/')
                    {
                        while((c=fgetc(p1))!='\n');
                    }
                    else if(c1=='*')
                    {
                        while((c=fgetc(p1))!='*');
                        if((c=fgetc(p1))=='/')
                            continue;
                    }
                    else
                    {
                        fputc('/',p2);
                        fputc(c1,p2);
                    }
                }
            }
            else if(c=='/')
            {
                char c1;
                c1=fgetc(p1);
                if(c1=='/')
                {
                    while((c=fgetc(p1))!='\n');
                }
                else if(c1=='*')
                {
                    while((c=fgetc(p1))!='*');
                    if((c=fgetc(p1))=='/')
                        continue;
                }
                else
                {
                    fputc('/',p2);
                    fputc(c1,p2);
                }
            }
            else
                fputc(c,p2);

        }
    }
    fclose(p1);
    fclose(p2);
    p2=fopen("temp.txt","r");
    p3=fopen("output.txt","w");
    while((c=fgetc(p2))!=EOF)
    {
        if(c==' ')
        {
            while((c=fgetc(p2))==' ');
            fputc(' ',p3);
            if(c!='/')
                fputc(c,p3);
            else
            {
                char c1;
                c1=fgetc(p2);
                if(c1=='/')
                {
                    while((c=fgetc(p2))!='\n');
                }
                else if(c1=='*')
                {
                    while((c=fgetc(p2))!='*');
                    if((c=fgetc(p2))=='/')
                        continue;
                }
                else
                {
                    fputc('/',p3);
                    fputc(c1,p3);
                }
            }
        }
        else
        {
            fputc(c,p3);
        }
    }
    fclose(p2);
    fclose(p3);
    p3=fopen("output.txt","r");
    printf("\n\nAfter changes:\n");
    while((c=fgetc(p3))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p2);

    return 0;
}
