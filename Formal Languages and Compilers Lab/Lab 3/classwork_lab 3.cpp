#include<bits/stdc++.h>
using namespace std;
int main()
{
    FILE *p1,*p2,*p3,*p4;
    p1=fopen("final.c","r");
    p2=fopen("output.txt","w");
    char c;
    char str[100];
    int len=0;
    while((c=fgetc(p1))!=EOF)
    {
        if(c=='[')
        {
            fputc(c,p2);
            while((c=fgetc(p1))!=' ')
            {
                str[len++]=c;
            }
            str[len]='\0';
            //cout<<str<<endl;
            if(strcmp("id", str)==0)
            {
                fputs(str,p2);
                fputc(' ',p2);
            }
            while((c=fgetc(p1))!=']')
            {
                fputc(c,p2);
            }
            fputc(c,p2);
            len=0;

        }
    }
    fclose(p1);
    fclose(p2);
    p2=fopen("output.txt","r");
    cout<<"output:"<<endl;
    while((c=fgetc(p2))!=EOF)
    {
        cout<<c;
    }

}
