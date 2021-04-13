
import random


#KNOWLEDGE BASE
grid={
    #cell number: [monster, gold, smell]
        11:[False,False,False],
        12:[False,False,True],
        13:[False,False,True],
        14:[True,True,True],
        21:[False,False,True],
        22:[False,True,True],
        23:[True,False,True],
        24:[False,False,True],
        31:[False,False,False],
        32:[False,False,True],
        33:[False,False,False],
        34:[False,True,False],
        41:[False,False,False],
        42:[False,False,False],
        43:[False,False,False],
        44:[False,True,False]
    
     }
optionsForEachCell={
    11:[21,12],
    12:[22,13],
    13:[23,14],
    14:[24],
    21:[31,22],
    22:[32,23],
    23:[33,24],
    24:[34],
    31:[41,32],
    32:[42,33],
    33:[43,34],
    34:[44],
    41:[42],
    42:[43],
    43:[44]    
    
}

#initial position
pos = 11
path=[]
print("FIND GOLD AVOIDING MONSTER\n")
print("Current Position: 11")
path.append(pos)
positionChoice=-1
while 1:
    print("You can move to positions:")
    print(optionsForEachCell[pos])
    for x in optionsForEachCell[pos]:
        if(grid[x][2]==True):
            print(x," has a smell. There may be monsters nearby.")
        else:
            print(x," has no smell.")

    countNonSmellyOptions=0

    for x in optionsForEachCell[pos]:
        if(grid[x][2]==False):
            countNonSmellyOptions=countNonSmellyOptions+1

    #BOTH CHOICES HAVE SMELL/ONLY HAVE ONE CHOICE WHICH IS SMELLY
    if(countNonSmellyOptions==0):
        #2 CHOICES
        if(len(optionsForEachCell[pos])>1):
            print("Neither of the choices is perfect. Let's pick a direction at random.")
            r = random.randint(0, 1)
            positionChoice=optionsForEachCell[pos][r]
            print(positionChoice, " has been picked.")

        #1 CHOICE ONLY
        else:
            print("Only one option is available.")
            positionChoice = optionsForEachCell[pos][0]
            print(positionChoice, " has to be picked.")
    #BOTH CHOICES HAVE NO SMELL
    elif(countNonSmellyOptions==2):
        print("Both of the choices are suitable. Let's pick a direction at random.")
        r = random.randint(0, 1)
        positionChoice = optionsForEachCell[pos][r]
        print(positionChoice, " has been picked.")
    pos=positionChoice
    path.append(pos)
    print("Path so far:")
    print(path)
    situation=grid[pos]
    positionChoice = -1
    countNonSmellyOptions=0

    #MONSTER CHECKING
    if(situation[0]==False):
        print(pos," has no monster.")
    else:
        print(pos," has a monster! You just got eaten!")
        break

    #GOLD CHECKING
    if(situation[1]==False):
        print(pos," has no gold.")
    else:
        print("Congratulations!!! ",pos," has some gold!!! You successfully acquired gold without getting eaten!!!")
        break


    

print("Game Over")
print("Path was: ")
print(path)

    
