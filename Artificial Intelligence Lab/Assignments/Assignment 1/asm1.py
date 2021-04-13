parentList1=[('parent', 'Rashid', 'Hasib'),('parent', 'Rashid', 'Humayra'),
            ('parent', 'Hasib', 'Rakib'),('parent', 'Hasib', 'Aniqua'),('parent', 'Hasib', 'Rahman'),
            ('parent', 'Rakib', 'Sohel'),('parent', 'Rakib', 'Rebeka'),('parent', 'Rakib', 'Faizah')]
genderList=[('male', 'Rashid'),('male', 'Hasib'),('male', 'Rakib'),('male', 'Sohel'),('male', 'Rahman'),
            ('female', 'Humayra'),('female', 'Aniqua'),('female', 'Rebeka'),('female', 'Faizah'),]

"""
#GRANDPARENT
X=str(input("Grandparent:"))
print('Grandchildren:', end=' ')
i=0
while(i<=7):
    if ((parentList1[i][0] == 'parent')&( parentList1[i][1] == X)):
        for j in range(8):
            if ((parentList1[j][0] == 'parent') & ( parentList1[i][2] == parentList1[j][1])):
                print(parentList1[j][2], end=' ')   
    i=i+1

"""
"""
#GRANDCHILD
X=str(input("Grandchild:"))
print('Grandparent:', end=' ')
i=0
while(i<=7):
    if ( parentList1[i][2] == X):
        par=parentList1[i][1]
        for j in range(8):
            if ((parentList1[j][0] == 'parent') & ( parentList1[j][2] == par)):
                print(parentList1[j][1], end=' ')   
    i=i+1
"""

"""
#BROTHER
X=str(input("Sibling:"))
print('Brother:', end=' ')
i=0
flag=False
while(i<len(parentList1)):
    if (( parentList1[i][2] == X)):
        par=parentList1[i][1]
        for j in range(len(parentList1)):
            if ((parentList1[j][1]==par) & (parentList1[j][2]!=X)):
                potentialBro = parentList1[j][2]
                for k in range(len(genderList)):
                    if((genderList[k][0]=='male') & (genderList[k][1]==potentialBro)):
                        print(potentialBro, end=' ')
                        flag=True
    i=i+1
if(flag==False):
    print("No brothers found", end=' ')
"""


"""
#SISTER
X=str(input("Sibling:"))
print('Sister:', end=' ')
i=0
flag=False
while(i<len(parentList1)):
    if (( parentList1[i][2] == X)):
        par=parentList1[i][1]
        for j in range(len(parentList1)):
            if ((parentList1[j][1]==par) & (parentList1[j][2]!=X)):
                potentialSis = parentList1[j][2]
                for k in range(len(genderList)):
                    if((genderList[k][0]=='female') & (genderList[k][1]==potentialSis)):
                        print(potentialSis, end=' ')
                        flag=True
    i=i+1
if(flag==False):
    print("No sisters found", end=' ')
"""

"""
#UNCLE
X=str(input("Niece/Nephew:"))
print('Uncle:', end=' ')
i=0
flag=False
while(i<len(parentList1)):
    if (( parentList1[i][2] == X)):
        par=parentList1[i][1]
        for j in range(len(parentList1)):
            if ((parentList1[j][2]==par)):
                gp=parentList1[j][1]
                for k in range(len(parentList1)):
                    if ((parentList1[k][1]==gp)&(parentList1[k][2]!=par)):
                        potentialUncle=parentList1[k][2]
                        for l in range(len(genderList)):
                            if((genderList[l][0]=='male') & (genderList[l][1]==potentialUncle)):
                                print(potentialUncle, end=' ')
                                flag=True
    i=i+1
if(flag==False):
    print("No uncles found", end=' ')
"""



#AUNT
X=str(input("Niece/Nephew:"))
print('Aunt:', end=' ')
i=0
flag=False
while(i<len(parentList1)):
    if (( parentList1[i][2] == X)):
        par=parentList1[i][1]
        for j in range(len(parentList1)):
            if ((parentList1[j][2]==par)):
                gp=parentList1[j][1]
                for k in range(len(parentList1)):
                    if ((parentList1[k][1]==gp)&(parentList1[k][2]!=par)):
                        potentialAunt=parentList1[k][2]
                        for l in range(len(genderList)):
                            if((genderList[l][0]=='female') & (genderList[l][1]==potentialAunt)):
                               print(potentialAunt, end=' ')
                               flag=True
    i=i+1
if(flag==False):
    print("No Aunts found", end=' ')

        
