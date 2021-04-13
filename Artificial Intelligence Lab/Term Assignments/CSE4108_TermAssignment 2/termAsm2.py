import random
import string

# this function measures the difference between the current string and the goal string
def evaluationFunction(solution, target_string):
   target = list(target_string)
   diff = 0
   for i in range(len(target)):
       s = solution[i]
       t = target[i]
       diff += abs(ord(s) - ord(t))
   return diff


# this function creates an initial random solution of the same length of the goal string
def randomSolution(length):
   return [random.choice(string.printable) for index in range(length)]


# this function creates variations in the generated string
def mutateSolution(solution):
   index = random.randint(0, len(solution) - 1)
  # choosing a solution at random
   solution[index] = random.choice(string.printable)




print("Enter the string you want to achieve: ")
goalString = str(input())
best = randomSolution(len(goalString))
bestScore = evaluationFunction(best, goalString)
stepCount = 1

while True:
   print('Step', str(stepCount), ': Current Difference ', bestScore, 'Solution', "".join(best))
   stepCount += 1
   if bestScore == 0:
       break

   newSolution = list(best)
   mutateSolution(newSolution)
   score = evaluationFunction(newSolution, goalString)

   # if the random move is not better than the previous solution then we will look for a new one
   if evaluationFunction(newSolution, goalString) < bestScore:
       best = newSolution
       bestScore = score
