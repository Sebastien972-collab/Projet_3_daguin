//
//  Game.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 09/01/2021.
//

import Foundation
class Game {
    var users : [User] = []
    
    
    //MARK: - Prepare To Play
    ///Prepare the game by creating users and characters
    func prepareToPlay(){
        
        var userTeamName : String
        var teamUser : [Character]
        var i = 1
        
        
        print("The game will soon start...")
        repeat{
            print("Select the name of your team  Player \(i) ")
            
            //We create the players
            userTeamName = readLine()!
            while clearString(string: userTeamName) == false {
                print("Error ! You must enter a valid name")
                userTeamName = readLine()!
            }
            teamUser = createCharacter()
            
            let Player = User(nameUserTeam: userTeamName, teamUser: teamUser, userScore: 0)
            users.append(Player)
            
            i = i + 1
            print("Welcome to the Game ! ")
        }while users.count < 2
        
        playGame()
    }
    //MARK: - Create character
    private func createCharacter () -> [Character]{
        var team : [Character] = []
        var characterChoice : String
        var i = 1
        /// Function that premet to create a character
        while team.count < 3 {
            
            
            print("Enter the name of your character \(i)")
            var name = readLine()!
            while clearString(string: name) == false {
                print("You must enter a valid name ! Enter the name of your character ")
                print("Enter the name of your character \(i)")
                name = readLine()!
            }
            while checkNameCharacter(userTeam: team, name: name) != true{
                print("That name is already taken!")
                print("Enter the name of your character")
                name = readLine()!
            }
            ///Here the joeur chooses the weapon he wants for his character
            print("Select your character ")
            print(" The Warrior 🗡 (w)")
            print(" The ninja 🗡 (n)")
            print(" The Magician 🔪 (m)")
            print(" The Witch 🔪 (s)")
            print(" The Paladin 🔪 (p)")
            characterChoice  = readLine()!
            while characterChoice.lowercased() != "w" && characterChoice.lowercased() != "n" && characterChoice.lowercased() != "m" && characterChoice.lowercased() != "s" && characterChoice.lowercased() != "p"{
                print("This character dosen'nt exist ! ")
                print("Select your character \(i)")
                print(" The Warrior 🗡 (w)")
                print(" The ninja 🗡 (n)")
                print(" The Magician 🔪 (m)")
                print(" The Witch 🔪 (s)")
                print(" The Paladin 🔪 (p)")
                characterChoice  = readLine()!
            }
            switch characterChoice.lowercased() {
            case "w":
                let weaponCharacter = equipWeapon()
                
                let NewCharacter = Warrior(nameWarrior: name,weaponWarrior: weaponCharacter)
                team.append(NewCharacter)
            case "n":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Ninja(nameNinja: name, weaponNinja: weaponCharacter)
                team.append(NewCharacter)
            case "m":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Magician(nameMagician: name, weaponMagician: weaponCharacter)
                team.append(NewCharacter)
            case "s":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Witch(nameWitch: name, weaponWitch: weaponCharacter)
                team.append(NewCharacter)
            case "p":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Paladin(namePaladin: name, weaponPaladin: weaponCharacter)
                team.append(NewCharacter)
            default:
                break
                
            }
            i += 1
        }
        return team
    }
    private func clearString(string : String) -> Bool{
        var stringArray = Array(string)
        var newIndex = stringArray.count - 1
        
        if stringArray.first != " " {
            return true
        }
        
        while newIndex > 0 {
            if stringArray[newIndex] == " "  {
                stringArray.remove(at: newIndex)
                newIndex -= 1
            }
        }
        if stringArray.first == " " {
            return false
        }
        return true
    }
    
    // MARK: - Equipe weapon
    ///Allows you to equip the character with a weapon
    private func equipWeapon() -> Weapon{
        print("Select your weapon ")
        print("Select (a) For axe")
        print("Select (s) For Sword")
        print("Select (d) For Dagger")
        print("Select (l) For Legendary Sword")
        
        var choiceWeapon = readLine()!
        while choiceWeapon.lowercased() != "a" && choiceWeapon.lowercased() != "s" && choiceWeapon.lowercased() != "d" && choiceWeapon.lowercased() != "l" {
            
            print("Error this weapon dosen't exist ")
            print("Select your weapon ")
            print("Select (a) For axe")
            print("Select (s) For Sword")
            print("Select (d) For Dagger")
            print("Select (l) For Legendary Sword")
            choiceWeapon = readLine()!
        }
        switch choiceWeapon.lowercased() {
        case "a":
            let newWeapon = Axe()
            return newWeapon
        case "s":
            let newWeapon = Sword()
            return newWeapon
        case "d":
            let newWeapon = Dagger()
            return newWeapon
        case "l":
            let newWeapon = LegendarySword()
            return newWeapon
        default:
            break
            
        }
        let NewWeapon = Sword()
        
        return NewWeapon
        
    }
    
    //MARK: - Check Name Character
    ///This function is used to check that the names of the characters of the team are different
    private func checkNameCharacter(userTeam : [Character], name : String) -> Bool {
        var i = 0
        while i < userTeam.count {
            if userTeam[i].name.lowercased() == name.lowercased() {
                return false
            }
            i = i + 1
        }
        return true
    }
    
    //MARK: - Play Game
    ///This function launches the game and display the winner
    private func playGame()  {
        while users[0].isDead() == false && users[1].isDead() == false {
            //Players take turns playing until they die
            if users[0].isDead() == false && users[1].isDead() == false {
                roundGame()
            }
            if users[0].isDead() == false && users[1].isDead() == false  {
                roundGame()
            }
            
        }
        
        //Display stat winner
        if users[0].isDead() == false  {
            displayWinner(user: users[0])
            displayLooser(user: users[1])
            
        }else if users[1].isDead() == false {
            displayWinner(user: users[1])
            displayLooser(user: users[0])
        }
        
        var choice :String
        print("Do you want toreplay ? (y/n)")
        choice = readLine()!
        while choice.lowercased() != "y" && choice.lowercased() != "n" {
            print("Error ! Do you want toreplay ? (y/n)")
            choice = readLine()!
        }
        if choice.lowercased() == "y" {
            newGame.prepareToPlay()
        }else{
            print("Good bye player !")
        }
    }
    
    private func displayWinner(user : User){
        print("The winner is \(user.nameUserTeam) \n This stat is ")
        print("Character alive : ")
        user.printTeamUser()
        print("Character dead :")
        user.printTeamCharacterDead()
        print("Number of round")
        print(user.userScore)
    }
    private func displayLooser(user : User){
        print("The looser is \(user.nameUserTeam) \n This stat is ")
        print("Character dead :")
        user.printTeamCharacterDead()
        print("Number of round")
        print(user.userScore)
    }
    
    //MARK: - Round Game
    /// Start round game allows select to heal or fight
    private func roundGame() {
        
        let statTeamUser = users[0].teamUser.count
        if users[0].userScore >= 1 {
            
            
            var choice : String
            
            print("What do you want to do? \(users[0].nameUserTeam)")
            print("Do you want to heal or fight? \(users[0].nameUserTeam)")
            print("Select (T) to treat a member of your team or (F) to fight ")
            choice = readLine()!
            
            if choice.lowercased() != "f" || choice.lowercased() != "t"{
                while choice.lowercased() != "t" && choice.lowercased() != "f"{
                    print("Error we do not recognize your choice ")
                    choice = readLine()!
                    
                }
                
                if choice.lowercased() == "t" {
                    print("Select a player  ")
                    let characterSelected = selectCharcter(User: users[0], statTeamUser: statTeamUser)
                    let characterGainLife = usePotion(character:  users[0].teamUser[characterSelected])
                    users[0].teamUser[characterSelected] = characterGainLife
                    users.swapAt(0, 1)
                }else if choice.lowercased() == "f"{
                    batleGame(Player1: users[0], Player2: users[1])
                    users.swapAt(0, 1)
                    
                }
            }
        }
        else{
            batleGame(Player1: users[0], Player2: users[1])
            users.swapAt(0, 1)
            
        }
        
        
    }
    //MARK: - Battle Game
    /// The logic of combat is happening here
    private func batleGame(Player1 : User, Player2 : User) {
        var statTeamEnemies = Player2.teamUser.count
        let statTeamUser = Player1.teamUser.count
        let random = Int.random(in: 0 ... (Player1.userScore + 1))
        var secretChest = false
        print("Who will fight ? \(Player1.nameUserTeam)")
        
        
        // The player enters the index of the persoonage which will attack
        let selctedCharacterUser =  selectCharcter(User: Player1, statTeamUser: statTeamUser)
        
        // The player returns the index of the enemy which will receive the attack
        print("Who do you want to attack ?")
        let selctedEnemy = selectCharcter(User : Player2,statTeamUser: statTeamEnemies)
        //To unlock the secret chest
        if random == Player1.userScore {
            secretChest = true
        }
        attack(Character1: Player1.teamUser[selctedCharacterUser],Character2: Player2.teamUser[selctedEnemy], secretChest: secretChest )
        if Player2.teamUser[selctedEnemy].life <= 0 {
            Player2.teamCharacterDead.append(Player2.teamUser[selctedEnemy])
            Player2.teamUser.remove(at : selctedEnemy)
            statTeamEnemies = statTeamEnemies - 1
        }
        Player1.userScore += 1
        
        
        
        
    }
    //MARK: - Attack
    ///The function that allows the character to attack
    private func attack(Character1 : Character, Character2 : Character, secretChest : Bool){
        print("- \(Character1.name) attack \(Character2.name)")
        if  secretChest == false{
            Character2.life = Character2.life - Character1.weapon.damage
        }else{
            Character2.life =  Character2.life / 2
            print("\(Character1.name) unlocked the secret chest ")
            print("\(Character1.name) open the chest, take out the weapon and attack")
            
        }
        
        if Character2.life > 0 {
            print(" \(Character2.name) has left  \(Character2.life) points of life ")
        }
        else{
            print("\(Character2.name) is dead ")
        }
        
        
    }
    //MARK: - Use potion
    ///The function that allows the character to gain life
    private func usePotion(character : Character ) -> Character {
        
        
        print("What potion do you want use ? ")
        print("(P): For the normal potion ")
        print("(S): For the super potion")
        
        var selectedPotion = readLine()!
        if selectedPotion.lowercased() != "p" && selectedPotion.lowercased() != "s"{
            while selectedPotion.lowercased() != "p" {
                print("This potion dosen't exist ! Select another potion ")
                selectedPotion = readLine()!
            }
        }
        if selectedPotion.lowercased() == "p" {
            let newPotion = Potion(characterlife: character.life)
            newPotion.gainLife(character:character)
            print("The life of \(character.name) are \(character.life) now ")
        }
        if selectedPotion.lowercased() == "s" {
            let newPotion = SuperPotion()
            newPotion.gainLife(character: character)
            print("The life of \(character.name) are \(character.life) now ")
        }
        
        
        return character
    }
    //MARK: - Selected Character
    /// The player returns the index of the persoonage which will attack
    private func selectCharcter(User : User,statTeamUser : Int) -> Int {
        
        User.printTeamUser()
        
        var selectedCharacterUser = checkUserSelection()
        
        if selectedCharacterUser > statTeamUser - 1 {
            print("Oops your character does not exist or no longer exists ")
            print("Select another character ")
            selectedCharacterUser = checkUserSelection()
        }
        return selectedCharacterUser
        
    }
    ///This function allows to check selection
    private func checkUserSelection() -> Int {
        var selctedCharacter : String
        var selectedCharacterUser = 0
        selctedCharacter = readLine()!
        while selctedCharacter.lowercased() != "0" && selctedCharacter.lowercased() != "1" && selctedCharacter.lowercased() != "2"{
            print("You must enter a number (0, 1 , 2)")
            selctedCharacter = readLine()!
        }
        selectedCharacterUser = Int(selctedCharacter)!
        
        return selectedCharacterUser
        
    }
    
    
}
