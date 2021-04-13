from queue import PriorityQueue


class astar_Graph:
    def __init__(self):
        self.graph = []
        self.nodeDictionary = {}
        self.path = []

    def display(self):
        print("Shortest path is: ")
        for x in range(len(self.path)):
            print(self.path[x]+1, end = ' ')

    def aStarSearch(self, s_node, g_node):
        pq = PriorityQueue()
        while s_node != g_node:
            if pq.empty():
                pq.put((0, [s_node]))
            else:
                currLeast = pq.get()
                currLeastPriority = currLeast[0]
                s_node = currLeast[1][len(currLeast[1]) - 1]
                links = self.graph[s_node]

                if len(links) != 0:
                    for items in links:
                        newList = []
                        newPriority = 0
                        newList.extend(currLeast[1])
                        newList.append(items[0])
                        newPriority = newPriority + self.nodeDictionary[items[0]]
                        if items[0] == g_node:
                            s_node = g_node
                            currLeast[1].append(g_node)
                            print(currLeast[1])
                            self.path = currLeast[1]
                            break
                        pq.put((newPriority, newList))
            
    def inputData(self):
        print("Enter the number of nodes: ")
        totalNodes = int(input())
        self.graph = [[] for t in range(totalNodes)]
        for i in range(totalNodes):
            print("Enter the node: ")
            nodeNumber = int(input())
            print("Enter the value of heuristic function: ")
            h_Function = int(input())
            self.nodeDictionary[nodeNumber-1] = h_Function

        print("Enter the number of edges: ")
        totalEdges = int(input())
        for i in range(totalEdges):
            print("Enter source Node: ")
            srcNode = int(input())
            print("Enter destination node: ")
            destNode = int(input())
            print("Enter cost: ")
            cost = int(input())
            self.graph[srcNode - 1].append((destNode - 1, cost))

        #print(self.graph)

    

    


g = astar_Graph()


print("A Star search algorithm:")


run=True
while(run):
    print("\nEnter a choice(1-5):")
    print("1: Clear Database")
    print("2: Execute A Star Search")
    print("3: Display Database")
    print("4: Save Database")
    print("5: Exit")
    choice=int(input())

    if choice==1:
        print("Clearing current database.")
        g.graph = []
        g.nodeDictionary = {}
        g.path = []
        print("Database cleared.")
    elif choice==2:
        g.inputData()
        print("Enter Source node: ")
        srcNode = int(input())

        print("Enter Goal node: ")
        goal = int(input())
        g.aStarSearch(srcNode - 1, goal - 1)
        g.display()

    elif choice==3:
        print("Current Database:\nCurrent Graph(heuristic function, node):")
        print(g.graph)
        

    elif choice==4:
        print("Saving current database state...")
        f1=open("node_db_astar.txt", "w")
        f1.write(str(g.graph))
        f1.write("\n")
        f1.write(str(g.nodeDictionary))
        f1.close
        print("Saved.")
    else:
        run=False


