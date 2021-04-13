#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2;
    p1=fopen("input.c","r");
    p2=fopen("output.txt","w");
    char c;

    if(!p1) printf("File not found");
    else
    {
        while((c=fgetc(p1))!=EOF)
        {
            //fputc(c,p2);
            //printf("%c",c);
            if(c=='\n')
                fputc(' ',p2);
            else fputc(c,p2);

        }
    }
    fclose(p1);
    fclose(p2);
    p1=fopen("input.c","r");
    printf("Original:\n");
    while((c=fgetc(p1))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p1);
    p2=fopen("output.txt","r");
    printf("\n\nAfter changes:\n");
    while((c=fgetc(p2))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p2);

    return 0;
}
