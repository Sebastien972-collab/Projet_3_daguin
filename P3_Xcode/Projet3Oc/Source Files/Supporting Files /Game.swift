//
//  Game.swift
//  Projet3Oc
//
//  Created by DAGUIN Sébastien on 09/01/2021.
//

import Foundation
class Game {
    var NewUser : [User] = []
    
    
    //MARK: - Prepare To Play
    func PrepareToPlay(){
        
        var userTeamName : String
        var teamUser : [Character]
        let userScore = 0
        var i = 1
        repeat{
            print("Select the name of your team  Player \(i) ")
            
            //We create the players
            userTeamName = readLine()!
            while userTeamName == "" {
                print("Error ! You must enter a valid name")
                userTeamName = readLine()!
            }
            teamUser = createCharacter()
            
            let Player = User(nameUserTeam: userTeamName, teamUser: teamUser, userScore: userScore)
            NewUser.append(Player)
            
            i = i + 1
            print("Welcome to the Game ! ")
        }while NewUser.count < 2
        
        playGame()
    }
    //MARK: - Create character
    private func createCharacter () -> [Character]{
        var team : [Character] = []
        var characterChoice : String
        var i = 1
        // Function that premet to create a character
        while team.count < 3 {
            
            
            print("Enter the name of your character \(i)")
            var name = readLine()
            while name! == "" {
                print("You must enter a valid name ! Enter the name of your character ")
                name = readLine()
            }
            while checkNameCharacter(UserTeam: team, name: name!) != true{
                print("That name is already taken!")
                print("Enter the name of your character")
                name = readLine()
            }
            //Here the joeur chooses the weapon he wants for his character
            print("Select your character ")
            print(" The Warrior 🗡 (w)")
            print(" The ninja 🗡 (n)")
            print(" The Magician 🔪 (m)")
            print(" The Witch 🔪 (s)")
            print(" The Paladin 🔪 (p)")
            characterChoice  = readLine()!
            while characterChoice.lowercased() != "w" && characterChoice.lowercased() != "n" && characterChoice.lowercased() != "m" && characterChoice.lowercased() != "s" && characterChoice.lowercased() != "p"{
                print("This character dosen'nt exist ! ")
                characterChoice  = readLine()!
            }
            switch characterChoice.lowercased() {
            case "w":
                let weaponCharacter = equipWeapon()
                
                let NewCharacter = Warrior(nameWarrior: name!,weaponWarrior: weaponCharacter)
                team.append(NewCharacter)
            case "n":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Ninja(nameNinja: name!, weaponNinja: weaponCharacter)
                team.append(NewCharacter)
            case "m":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Magician(nameMagician: name!, weaponMagician: weaponCharacter)
                team.append(NewCharacter)
            case "s":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Witch(nameWitch: name!, weaponWitch: weaponCharacter)
                team.append(NewCharacter)
            case "p":
                let weaponCharacter = equipWeapon()
                let NewCharacter = Paladin(namePaladin: name!, weaponPaladin: weaponCharacter)
                team.append(NewCharacter)
            default:
                break
                
            }
            i += 1
        }
        return team
    }
    
    // MARK: - Equipe weapon
    private func equipWeapon() -> Weapon{
        print("Select your weapon ")
        print("Select (a) For axe")
        print("Select (s) For Sword")
        print("Select (d) For Dagger")
        print("Select (l) For Legendary Sword")
        
        var choiceWeapon = readLine()!
        while choiceWeapon.lowercased() != "a" && choiceWeapon.lowercased() != "s" && choiceWeapon.lowercased() != "d" && choiceWeapon.lowercased() != "l" {
            print("Error this weapon dosen't exist ")
            choiceWeapon = readLine()!
        }
        switch choiceWeapon.lowercased() {
        case "a":
            let NewWeapon = Axe()
            return NewWeapon
        case "s":
            let NewWeapon = Sword()
            return NewWeapon
        case "d":
            let NewWeapon = Dagger()
            return NewWeapon
        case "l":
            let NewWeapon = LegendarySword()
            return NewWeapon
        default:
            break
            
        }
        let NewWeapon = Sword()
        
        return NewWeapon
        
    }
    
    //MARK: - Check Name Character
    //This function is used to check that the names of the characters of the team are different
    private func checkNameCharacter(UserTeam : [Character], name : String) -> Bool {
        var i = 0
        while i < UserTeam.count {
            if UserTeam[i].name.lowercased() == name.lowercased() {
                return false
            }
            i = i + 1
        }
        return true
    }
    private func playGame()  {
        while NewUser[0].isDead() == false && NewUser[1].isDead() == false {
            //Players take turns playing until they die
            if NewUser[0].isDead() == false && NewUser[1].isDead() == false {
                roundGame()
            }
            if NewUser[0].isDead() == false && NewUser[1].isDead() == false  {
                roundGame()
            }
            
        }
        
        //Display stat winner
        if NewUser[0].isDead() == false  {
            print("The winner is \(NewUser[0].nameUserTeam) \n This stat is ")
            NewUser[0].printTeamUser()
            print(NewUser[0].userScore)
            
        }else if NewUser[1].isDead() == false {
            print("The winner is \(NewUser[1].nameUserTeam) \n This stat is ")
            NewUser[1].printTeamUser()
            print("Number of round")
            print(NewUser[1].userScore)
        }
        var choice :String
        print("Do you want toreplay ? (y/n)")
        choice = readLine()!
        while choice.lowercased() != "y" && choice.lowercased() != "n" {
            print("Error !Do you want toreplay ? (y/n)")
            choice = readLine()!
        }
        if choice.lowercased() == "y" {
            NewGame.PrepareToPlay()
            NewGame.playGame()
        }else{
            print("Good bye player !")
        }
    }
    
    //MARK: - Round Game
    // Start round game
    private func roundGame() {
        
        let statTeamUser = NewUser[0].teamUser.count
        if NewUser[0].userScore >= 1 {
            
            
            var choice : String
            
            print("What do you want to do? \(NewUser[0].nameUserTeam)")
            print("Do you want to heal or fight? \(NewUser[0].nameUserTeam)")
            print("Select (T) to treat a member of your team or (F) to fight ")
            choice = readLine()!
            
            if choice.lowercased() != "f" || choice.lowercased() != "t"{
                while choice.lowercased() != "t" && choice.lowercased() != "f"{
                    print("Error we do not reconaissons your choice ")
                    choice = readLine()!
                    
                }
                
                if choice.lowercased() == "t" {
                    print("Select a player  ")
                    let characterSelected = selectCharcter(User: NewUser[0], statTeamUser: statTeamUser)
                    let characterGainLife = usePotion(Character:  NewUser[0].teamUser[characterSelected])
                    NewUser[0].teamUser[characterSelected] = characterGainLife
                    NewUser.swapAt(0, 1)
                }else if choice.lowercased() == "f"{
                    batlleGame(Player1: NewUser[0], Player2: NewUser[1])
                    NewUser.swapAt(0, 1)
                    
                }
            }
        }
        else{
            batlleGame(Player1: NewUser[0], Player2: NewUser[1])
            NewUser.swapAt(0, 1)
            
        }
        
        
    }
    //MARK: - Battle Game
    private func batlleGame(Player1 : User, Player2 : User) {
        var statTeamEnemies = Player2.teamUser.count
        let statTeamUser = Player1.teamUser.count
        let random = Int.random(in: 0 ... (Player1.userScore + 1))
        var secretArm = false
        print("Who will fight ? \(Player1.nameUserTeam)")
        
        
        // The player enters the index of the persoonage which will attack
        let selctedCharacterUser =  selectCharcter(User: Player1, statTeamUser: statTeamUser)
        
        // The joeur returns the index of the enemy which will receive the attack
        let selctedEnemy = selectCharcter(User : Player2,statTeamUser: statTeamEnemies)
        
        if random == Player1.userScore {
            secretArm = true
        }
        attack(Character1: Player1.teamUser[selctedCharacterUser],Character2: Player2.teamUser[selctedEnemy], secretArm: secretArm )
        if Player2.teamUser[selctedEnemy].life <= 0 {
            Player2.teamUser.remove(at : selctedEnemy)
            statTeamEnemies = statTeamEnemies - 1
        }
        Player1.userScore += 1
        
        
        
        
    }
    //MARK: - Attack
    //The function that allows the character to attack
    private func attack(Character1 : Character, Character2 : Character, secretArm : Bool){
        print("- \(Character1.name) attack \(Character2.name)")
        if  secretArm == false{
            Character2.life = Character2.life - Character1.weapon.damage
        }else{
            Character2.life =  Character2.life / 2
            print("\(Character1.name) unlocked the secret arm and attack")
            
        }
        
        if Character2.life > 0 {
            print("He staying \(Character2.name)  \(Character2.life) points of life ")
        }
        else{
            print("\(Character2.name) is die ")
        }
        
        
    }
    //MARK: - Use potion
    //The function that allows the character to gain life
    private func usePotion(Character : Character ) -> Character {
        
        
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
            let NewPotion = Potion(Characterlife: Character.life)
            NewPotion.gainLife(Character:Character)
            print("The life of \(Character.name) are \(Character.life) now ")
        }
        if selectedPotion.lowercased() == "s" {
            let NewPotion = SuperPotion()
            NewPotion.gainLife(Character: Character)
            print("The life of \(Character.name) are \(Character.life) now ")
        }
        
        
        return Character
    }
    //MARK: - Selected Character
    // The player returns the index of the persoonage which will attack
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
