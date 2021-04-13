/*Name: Ashna Nawar Ahmed       ID: 16.02.04.024
Online No: 3                  Lab Group: A1*/
#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2,*p3;
    p1=fopen("input.txt","r");
    p2=fopen("output.txt","w");
    p3=fopen("output1.txt","w");
    char c;
    bool found,hashfound;

    //p1=fopen("input.c","r");
    if(!p1)
        printf("File not found");
    else
    {
        while((c=fgetc(p1))!=EOF)
        {
            /*if(c=='\n')
            {
                fputc(' ',p2);
            }
            else */
            if(c=='/')
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
    /*p2=fopen("output.txt","r");
    while((c=fgetc(p2))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p2);*/


    p1=fopen("output.txt","r");
    p2=fopen("output1.txt","w");
    if(!p1) printf("File not found");
    else
    {
        while((c=fgetc(p1))!=EOF)
        {
            if(!hashfound&&c=='#')
            {
                hashfound=true;

            }
            if(!found&&c=='<')
            {
                found=true;

            }
            else if(hashfound&&found&&c!='>')
            {
                fputc(c,p2);
            }
            else if(c=='>')
            {
                fputc('\n',p2);
                hashfound=false;
                found=false;
                continue;
            }


        }
    }
    fclose(p1);
    fclose(p2);
    printf("\nHeader files:");
    p2=fopen("output1.txt","r");
    while((c=fgetc(p2))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p2);

    int cnt=1;
    p1=fopen("output.txt","r");
    if(!p1) printf("File not found");
    else
    {
        while((c=fgetc(p1))!=EOF)
        {

            if(c=='\n'){
                cnt++;
                if((c=fgetc(p1))=='\n');

            }

        }
    }
    fclose(p1);


    printf("\nTotal executable lines:");
    printf("%d",cnt);
    return 0;
}
