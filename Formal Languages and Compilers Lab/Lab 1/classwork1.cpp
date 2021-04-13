#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2;
    p1=fopen("input.c","r");
    p2=fopen("output1.txt","w");
    char c;
    int cnt=1;
    if(!p1) printf("File not found");
    else
    {
        fprintf(p2,"%d: ",cnt);
        while((c=fgetc(p1))!=EOF)
        {
            if(c!='\n')
                fputc(c,p2);
            else{
                cnt++;
                fputc(c,p2);
                fprintf(p2,"%d: ",cnt);

            }

        }
    }
    fclose(p1);
    fclose(p2);
    p2=fopen("output1.txt","r");
    while((c=fgetc(p2))!=EOF)
    {
        printf("%c",c);
    }
    fclose(p2);
}
