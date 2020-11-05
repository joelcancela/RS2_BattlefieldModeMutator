# Rising Storm 2: Vietnam - BattlefieldMode Gameplay Mutator

## Features (WIP)

- Instant respawn
- No cooldown for recon

## How to modify scripts

- Go in **My Games** folder, usually : **`C:\Users\<username>\Documents\My Games\`**
- Then in **Rising Storm 2\ROGame**, create a folder called **Src**
- Inside this folder create a folder called **BattlefieldMode** and put the folder **Classes** inside with your modifications and **RS2BFMutator.uci** next to it
- Go back in **ROGame** folder, in the Config folder put the **ROMutator_BattlefieldMode.ini** file.

### Edit ROEditor.ini

- Open **ROEditor.ini**, in the **ROGame\Config** folder
- Add the folder you created inside **Src** under the ModPackages section like this:

```ini
[ModPackages]
ModPackagesInPath=..\..\ROGame\Src
ModPackages=BattlefieldMutator # This line
ModOutputDir=..\..\ROGame\Unpublished\CookedPC\Script
```

- Open the Rising Storm 2 - SDK Frontend, add your source folder in the **Script Source Directories** section
and the .ini file in the **INIs to add** section

### Compilation

- You can either :
  - Press **Compile scripts** in SDK Frontend
  - Execute the command `VNEditor.exe make -user -useunpublished`
  - The output should be in `ROGame\Unpublished\CookedPC\Script`

### In-game testing

After publishing in the workshop, download it
Launch the game, press F3 and type `open VNTE-CuChi?mutator=BattlefieldMode.BattlefieldModeMutator`

## Notes

- The source folder, e.g. **BattlefieldMode** must match the value inside **ROEditor.ini** in the **ModPackages** section
- The config variable name, e.g. **Mutator_BattlefieldMode** in the classes :

```.uc
class BattlefieldModeMutator extends ROMutator
config(Mutator_BattlefieldMode);
```

must match the name of the .ini file without the **RO** prefix: **ROMutator_BattlefieldMode.ini**
