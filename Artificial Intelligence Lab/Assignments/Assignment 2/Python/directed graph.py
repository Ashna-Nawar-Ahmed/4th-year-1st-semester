def pathFinder(nodes, start, end, path=[]):
    path = path + [start]
    if start == end:
        return path
    if start not in nodes:
        return None
    for node in nodes[start]:
        if node not in path:
            newpath = pathFinder(nodes, node, end, path)
            if newpath:
                return newpath
    return None
nodes = {
        1: [2, 3],
        3: [4],
        4: [5],
        5: [4]
        }
distances=[[1,2,10],[1,3,20],[3,4,30],[4,5,12],[5,4,12]]

src=int(input("Source:"))
dest=int(input("Destination:"))
val=pathFinder(nodes, src, dest)
dis=0
if val==None:
    print("No path found")
else:   
    for x in (range(len(val)-1)):
        for i in range(len(distances)):
            index=x
            if val[x]==distances[i][0] and val[x+1]==distances[i][1]:
                dis=dis+distances[i][2]
    print('Path:'+str(val)) 
    print('Length of Path:'+str(dis))
