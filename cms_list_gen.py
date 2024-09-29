import json
def add_person():
    name = input("Name: ")
    age = input("Age: ")
    email = input("Email: ")

    person = {"Name": name, "Age": age, "Email": email}
    return person

def display_people(people):
    for i,person in enumerate(people):
        print(i + 1, "|", person["Name"], "|", person["Age"], "|", person["Email"])

def delete_contact(people):
    display_people(people)
    
    while True:
        number = input("Which number do you want to delete? ")
        try:
            number = int(number)
            if number <= 0 or number > len(people):
                print("Invalid number, try again")
            else:
                break
        except:
            print("Invalid number")
    
    people.pop(number - 1)  

def search(people):
    search_name = input("Search for a name: ").lower()
    search_result = []

    for person in people:
        name = person["Name"]
        if search_name in name.lower():
            search_result.append(person)
    display_people(search_result)


with open("contacts.json", "r") as file:
    people = json.load(file)["contacts"]

print("Hi, Welcome to the Contact Management System")

while True:
    print()
    print("Size of contact list:", len(people))
    command = input("What do you want to do? Add/Delete/Search/Q for quit: ").lower()
    if command == "add":
        person = add_person()
        people.append(person)
        print("Person Added!")
    elif command == "delete":
        delete_contact(people)
        print("Person deleted!")
    elif command == "search":
        search(people)
    elif command == "q":
        break
    else:
        print("Invalid command")

with open("contacts.json", "w") as file:
    json.dump({"contacts" : people}, file)
    