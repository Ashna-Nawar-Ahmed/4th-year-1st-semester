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
optionsForEach={
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

print("FIND GOLD AVOIDING MONSTER\n")
print("You are in now Position: 11")
while 1:
    currentChoice = input("move(M) or quit(Q)? ")
    mode = str(currentChoice).lower()
    try:								
        assert mode in ['m', 'q']
    
    except (ValueError, AssertionError):
        print("This is not a valid action: pick 'Q' to quit and 'M' to move.")
    
    if mode == 'm':
        print("You can move to positions:")
        print(optionsForEach[pos])
        for x in optionsForEach[pos]:
            if(grid[x][2]==True):
                print(x," has a smell. There may be monsters nearby.")
            else:
                print(x," has no smell. You can rest assured.")
        positionChoice = int(input("Enter where you want to move:"))
        pos=positionChoice

        situation=grid[pos]

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
        
        
    elif mode == 'q':
            pos =-1
            break

print("Game Over")
 

    
