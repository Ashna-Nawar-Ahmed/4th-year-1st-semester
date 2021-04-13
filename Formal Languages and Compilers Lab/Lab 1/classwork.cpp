#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2;
    p1=fopen("input.c","r");
    p2=fopen("output.txt","w");
    char c;
    bool found,hashfound;
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
    p2=fopen("output.txt","r");
    while((c=fgetc(p2))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p2);

    return 0;
}
