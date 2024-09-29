name = input("Hey type your name: ")
print("Hello "+ name + " welcome to my game")

should_we_play = input("Do you want to play? ")

play = should_we_play == "yes"

if play:
    print("We are gonna play!")
    weapon = input("which weapon do you wish to use? (axe/sword) ")
    direction = input("do you want to go right or left? ")
    if direction == "right":
        choice = input("ok, you now see a bridge do you want to cross or swim? ")
        if choice == "swim" and weapon == "axe":
            print("swimming is risky, there might be crocodiles in the water. You got an axe incase you might need some help")
        elif choice == "swim" and weapon == "sword":
            print("swimming is risky, there might be crocodiles in the water. You got an axe incase you might need some help")
        else:
            print("You crossed the bridge, you got the gold")
    else:
        print("Wrong way, Try again")
else:
    print("We are not gonna play")