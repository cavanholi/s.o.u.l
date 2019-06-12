# S.O.U.L

After a long journey trough the Arake mountains you came across a dangerous bridge spamming across a deep chasm.<br />
The wind has gathered strengh throughout the day and now, as darkness descends, it has become a fully fledged storm.<br />
The bridge swings madly in front of you and you must decide if you risk the crossing in such dangerous condition or not.<br />
But not all options are visible at first glance.<br />
Take the first step ahead, if you dare.


## What is S.O.U.L
### from a distant past ...

*PAR = Python Adventure RPG*<br />
*==========================*

*A simple text-styled game inspired by the classics adventure fighting fantasy game from Ian Livingstone and many others.<br />
It started when I began writing AZARIA, a simillar project with the story setted in the eponymous city but the project grew so complex in a way that I was unable to add the initial features I've planned for it, let alone implementing anything in the future.<br />
Instead of trying to fix it, it was decided to start from zero, re-using part of the code and re-writing the Objects, in a way that would be more generic and easier to write new stories.*

### nowadays

The aim of the S.O.U.L project is roughly the same.
The language has changed, from python, to swift.<br />
The mechanics, suffered a complete overhaul, what was once so difficult to implemente, it became so much easier.<br />
Not because of the language, but because of my own knownled. If anything, python would still make my task simpler, but alas!


## DONE List
The main structure is complete.<br />
Skill Check tests had been implemented in a working way.<br />
The layout, if basic and crude, but functional.<br />
- Main Structure (0.1alpha)
- Skill Check (0.1.1alpha) <- Updated (0.1.2a)
- Randomized Player Skill Attributes (0.1.1alpha) <- Removed (0.1.2a)

## YET to come 

### FAR future
- Combat
- Non-combat solutions
- Quest-based options
- NPC interactions
- Better Layout
  - Access to Items Owned
  - Access to Character Sheet
- Improved Story

#### WORK in progress
- Item based options
  - Optional Good Items
  - Forced Bad Items
- Item interactions
- Adding skills and values to Player.skill
  - Randomize them at Character Creation (app start)
  - Character Creation
  - Re-structuring
- Merge *Path* into *Scene* (and updated *main* methodes to reflect this change) 

### KnownIssues
  - *MainStory.itemCheck()* not working after updates on *Player* and *Item*
  - *MainStory.choice()* not setting *currentScene* value to *Scene.target[tag-1]*

## Updates
- 12.VI (0.1.1c) : **Started merging of *Path* into *Scene*.** *(of Course I broke it!)*
- 12.VI (0.1 celes): **Added Character Creation. Major re-structuring of Models and Controllers (see READEME.md for more details)**
  - Created CharacterCreation View and Class
    - placeholder for skill increase/decrease buttons, values and character name input
    - character creation with name derived from name input
    - issue with persistent keyboard fixed with *IQKeyboardManager*
  - Updated *AppDelegate* to enable *IQKeyboardManager*
  - Created Segueway from CharacterCreation view to main game
  - Created *Item Model*
  - *Player Skills* remodled:
    - Removed: *Sight*, *Smell*, *Listen*
    - Added: 
      - **sens** *(Hightened Senses, replacing removed skills)* 
      - **comb** *(Combat Training)*
      - **fort** *(Fortitude)*
    - Updated: **will** *(Willpower)*, **refl** *(Reflexes)*
  - Updated *Populate.popScenes()* to reflect changes in *Player.skills*
  - Updated *Populate.popItems()* to relefct changes in *Player.skills*
  - *ViewController* and *ViewControllerB* (views and classes) renamed to *MainStory* and *CharacterCreation* respectively. *(code updaed to reflect change)*
  - Updated *MainStory.skillTest()* to reflect *optional* value of *player* and *Player.skill* new structure
  - Updated *MainStory.update()* to reflect *optional* value of *player*
- 08.VI (0.1.2a): **Item Experimentation**
  - Update *Player* and *Scene* to support items
  - Created *itemCheck* method in ViewController
  - Updated *Player.skills* to use a dictionary instead of multiple variables for different skills
  - Updated *ViewController.skillTest()* to support new *Player.skill* structure
  - Updated *ViewController.update()* to use *Scene.path.count* instead of *Scene.path[1] == 0*
  - Note: *Scene.path[1] = 0* might be removed due to be no longer used
  - Note: *Scene.index* and *Path.index* might be removed due to be no longer used
- 07.VI (0.1 ~ 0.1.1): **Skill Check and Random Player Skills implemented**
- 07.VI (0.1.1b): **Update to populate class and update method**
  - Updated *Populate* Class to use dictionary instead of list for both *Scene* and *Path* base
  - Updated *ViewController.update()* to use new data structure from Populate
  - Removed *ViewController.sceneCheck()*. *Scenes* are referenced directly using *sceneBase* dictionary Keys
  - Updated *ViewController.pathCheck()* to use new data structured from *Populate*
- 07.VI (0.1.1b): **Updated Random Player Generation**
  - Removed *randomPlayer()* method from ViewController
  - Added randomization to *Player.init()*
  - Update *ViewController.skillTest()* to use swift 4.2+ random method instead of *arc4random*
 

## Copywrite
All Rights Reserved, for now ...
