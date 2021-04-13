from queue import PriorityQueue


class GBFS_Graph():
    def __init__(self):
        self.graph = []
        self.nodeDictionary = {}
        self.visitedDictionary = {}


    def greedyBestFirstSearch(self, srcNode, goal_node):
        path = []
        priorityQueueList = {}

        while srcNode != goal_node:
            if not srcNode in path:
                path.append(srcNode)
                links = self.graph[srcNode]
                pq = PriorityQueue()
                for items in links:
                  pq.put(items)
                    
            else:
                pq = priorityQueueList[srcNode]
                nodeIndex = path.index(srcNode)
                for i in range(nodeIndex+1, len(path)):
                    path.pop()

                    
            if not pq.empty():
                temp = pq.get()[1]
                priorityQueueList[srcNode] = pq
                srcNode = temp

            else:
                while len(path) != 0 and priorityQueueList[len(priorityQueueList) - 1].empty():
                    srcNode = path.pop()
                    pq = priorityQueueList.pop()
                    
                temp = pq.get()[1]
                priorityQueueList[srcNode] = pq
                srcNode = temp
                
        path.append(goalNode)
        return path

        
    def input_data(self):
        print("Enter the number of nodes: ")
        totalNodes = input()
        self.graph = [[] for t in range(int(totalNodes))]

        for i in range(int(totalNodes)):
            print("Enter the node: ")
            node = input()
            print("Enter the value of heuristic function: ")
            h_Function = int(input())
            node_tuple = (h_Function, int(node) - 1)
            self.nodeDictionary[int(node) - 1] = node_tuple
            self.visitedDictionary[int(node) - 1] = False
        print("Enter the number of edges: ")
        totalEdges = int(input())
        for i in range(totalEdges):
            print("enter source node: ")
            srcNode = int(input())
            print("enter destination node: ")
            destNode = int(input())
            self.graph[srcNode - 1].append(self.nodeDictionary[destNode - 1])
            self.graph[destNode - 1].append(self.nodeDictionary[srcNode - 1])


    



g = GBFS_Graph()
run=True
while(run):
    print("\nEnter a choice(1-5):")
    print("1: Clear Database")
    print("2: Execute GBFS")
    print("3: Display Database")
    print("4: Save Database")
    print("5: Exit")
    choice=int(input())

    if choice==1:
        print("Clearing current database.")
        g.graph = []
        g.nodeDictionary = {}
        g.visitedDictionary = {}
        print("Database cleared.")
        
    elif choice==2:
        g.input_data()
        print("enter start node: ")
        startNode = int(input())
        print("enter goal node: ")
        goalNode = int(input())
        path = g.greedyBestFirstSearch((startNode - 1), (goalNode - 1))
        print("Final Path:")
        for x in range(len(path)):
            if x==len(path)-1:
                print(path[x], end = ' ')
            else:
                print(path[x]+1)


    elif choice==3:
        print("Current Database:\nCurrent Graph(heuristic function, node):")
        print(g.graph)
        

    elif choice==4:
        print("Saving current database state...")
        f1=open("node_db_gbfs.txt", "w")
        f1.write(str(g.graph))
        f1.write("\n")
        f1.write(str(g.nodeDictionary))
        f1.close
        print("Saved.")
    else:
        run=False

