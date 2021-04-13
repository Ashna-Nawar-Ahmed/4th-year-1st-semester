/*
Name: Ashna Nawar Ahmed     ID:16.02.04.024
Online No.: 2               Lab Group: A1
*/
#include<bits/stdc++.h>
using namespace std;
bool num(char *arr,int len);
int main()
{
    cout<<"enter a string:"<<endl;
    char c;
    char arr[100];
    gets(arr);
    //cout<<arr;
    int len=sizeof(arr)/sizeof(arr[0]);
    bool found=num(arr,len);
    if(found)
    {
        cout<<"Floating point Number."<<endl;
    }
    else
    {
        cout<<"Not a Floating point Number."<<endl;
    }
}

bool num(char *arr,int len)
{
    int flag=0;
    bool foundDecimalPoint=false;
    for(int i=0; i<len; i++)
    {
        if(isdigit(arr[i])!=0||arr[i]=='.')
        {
            if(arr[i]=='.')
            {
                foundDecimalPoint=true;
            }
            continue;
        }
        else
        {
            flag=1;
            break;
        }
    }
    if(flag==1&&!foundDecimalPoint)
    {
        return false;
    }
    else
    {
        return true;
    }

}
