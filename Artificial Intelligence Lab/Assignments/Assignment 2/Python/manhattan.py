goal=[(1,1,1), (2,1,2), (3,1,3), (4,2,3), (5,3,3), (6,3,2), (7,3,1), (8,2,1)]
gblnk = (2,1)
current=[(1,1,2), (2,1,3), (3,2,1), (4,2,3), (5,3,3), (6,2,2), (7,3,2), (8,1,1)]
blnk = (3,1)
sumDistance=0
for i in range(8):
    if(goal[i][1]!=current[i][1] or goal[i][2]!=current[i][2]):
        sumDistance=sumDistance+abs(current[i][1]-goal[i][1])+abs(current[i][2]-goal[i][2])
print('Manhattan Distance='+str(sumDistance))
