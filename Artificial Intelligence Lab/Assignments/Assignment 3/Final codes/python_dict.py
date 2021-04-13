f1=open("student_data.txt", "w")
print("\n")
student_num=int(input("Enter number of students:"))
for i in range(student_num):
        name=str(input("Enter the name:"))
        dept=str(input("Enter the department:"))
        cgpa=str(input("Enter the cgpa:"))
        std=name+"\t"+dept+"\t"+cgpa+"\n"
        #print(std, end="\n", file=f1)
        f1.write(std)
        print("\n")
f1.close

student_dict={}
f1=open("student_data.txt", "r")       
for l in f1:
        name, dept, cgpa =l.split("\t")
        cgpa=cgpa.split("\n")
        student_dict[name]=[dept,cgpa[0]]
f1.close
print("Original Data:\n{Name:[Dept, CGPA]}")
print(student_dict)
std_name=input("Which student's cgpa do you want to change?")
std_cgpa=input("Input new cgpa:")
student_dict[std_name]=[(student_dict.get(name))[0],std_cgpa]

print("\nNew Data:\n{Name:[Dept, CGPA]}")
print(student_dict)

f2=open("student_data_new.txt", "w")
for i in student_dict:
        name=str(i)
        dept=str(student_dict[i][0])
        cgpa=str(student_dict[i][1])
        std=name+"\t"+dept+"\t"+cgpa+"\n"
        #print(std)
        #print(std, end="\n", file=f2)
        f2.write(std)
f2.close
