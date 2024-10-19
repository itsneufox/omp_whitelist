# omp_whitelist
**omp_whitelist** is an include for **open.mp** that provides simple and efficient player whitelisting functionality. This include allows server developers to easily implement whitelist verification in their gamemodes by checking player names against a text file.

## Features
- **Simple Whitelist System**: Verifies players against a whitelist file. ✅
- **File-Based Storage**: Uses a simple text file system for storing whitelisted players. 📜
- **Easy Integration**: Simple to implement in any gamemode. 🛠️

## Installation
1. Download `omp_whitelist.inc`
2. Place it in your includes folder
3. Create an empty `whitelist.txt` file in your server's `scriptfiles` folder
4. Include the file in your script:
```pawn
#include <omp_whitelist>
```

## Usage
### Basic Implementation
```pawn
public OnPlayerConnect(playerid)
{
    if (!IsPlayerWhitelisted(playerid))
    {
        Kick(playerid);
        return false;
    }

    //rest of the code

    return true;
}
```

### Whitelist File Format
The `whitelist.txt` should contain one player name per line:
```
Player_Name
BadPlayer
Cool.Player
```

## Functions
### IsPlayerWhitelisted
```pawn
bool:IsPlayerWhitelisted(playerid)
```
Returns `true` if the player is whitelisted, `false` otherwise.

## Configuration
You can change the whitelist file location by defining `WHITELIST_FILE` before including the file:
```pawn
#define WHITELIST_FILE "custom_whitelist.txt"
#include <omp_whitelist>
```

## License
This project is licensed under the Mozilla Public License 2.0 (MPL 2.0). See the [LICENSE](LICENSE) file for details.

## Contributing
Contributions are welcome! If you have suggestions for improvements or new features, feel free to create a pull request or open an issue. 🤝

## Acknowledgments
- [Dobby](https://github.com/DobbysGamertag) - For providing the idea.
- The open.mp community for their invaluable resources and support.
