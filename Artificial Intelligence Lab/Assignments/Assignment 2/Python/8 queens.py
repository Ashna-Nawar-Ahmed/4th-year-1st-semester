#QueenNum,Row,Col(here,queenNum=col)
currentPos=[(1,6,1),(2,1,2),(3,5,3),(4,7,4),(5,4,5),(6,3,6),(7,8,7),(8,1,8)]
X=int(input("Queen Number:"))
print('Number of Conflicting Queens:', end=' ')
count=0
queenPos=currentPos[X-1]
boardSize=8

r=queenPos[1]
c=queenPos[2]
#Checking Sideways, above and below
for i in range(boardSize):
    if (i!=X-1):
        if(r==currentPos[i][1] or c==currentPos[i][2]):
            count=count+1
#Checking Diagonally
p=1
for i in range(boardSize):
    if (i!=X-1):
        while(p!=7):
            if((currentPos[i][1]==r-p and currentPos[i][2]==c-p)or
               (currentPos[i][1]==r-p and currentPos[i][2]==c+p)or
               (currentPos[i][1]==r+p and currentPos[i][2]==c-p)or
               (currentPos[i][1]==r+p and currentPos[i][2]==c+p)):
                count=count+1
            p=p+1       
    p=1        
print(count)
