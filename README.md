# omp_allow

**omp_allow** is a simple include for **open.mp** that provides basic and efficient player allowlist functionality. 
This include enables server developers to implement a simple player verification system in their gamemodes.

## Installation

1. Download `omp_allow.inc`.
2. Place it in your includes folder.
3. Include the file in your script:

```pawn
#include <omp_allow>
```

## Functions

### IsPlayerAllowed
```pawn
bool:IsPlayerAllowed(playerid)
```
Returns `true` if the player is allowed, `false` otherwise. Automatically checks if the player is connected.

### AllowPlayer
```pawn
AllowPlayer(const szName[])
```
Adds a single player to the allowlist. Returns `true` if successful.

### AllowPlayers
```pawn
AllowPlayers(const names[][], size = sizeof(names))
```
Helper function to add multiple player names at once. Returns `true` when completed.

## Examples

### Using the Function

```pawn
public OnGameModeInit()
{
    AllowPlayer("Happy_Macaco");
    AllowPlayer("Angry_Macaco");

    return true;
}

public OnPlayerConnect(playerid)
{
    if (!IsPlayerAllowed(playerid))
    {
        Kick(playerid);
        return false;
    }

    // rest of the code

    return true;
}
```

### Using an Array

```pawn
public OnGameModeInit()
{
    // Array of allowed players
    new const ALLOWED_PLAYERS[][] = {
        "Happy_Macaco",
        "Angry_Macaco",
        "Sad_Macaco",
        "Excited_Macaco",
        "Relaxed_Macaco",
        "Bored_Macaco"
    };
    
    // Add all players to the allowlist
    AllowPlayers(ALLOWED_PLAYERS);

    return true;
}

public OnPlayerConnect(playerid)
{
    if (!IsPlayerAllowed(playerid))
    {
        Kick(playerid);
        return false;
    }

    // rest of the code

    return true;
}
```

## License

This project is licensed under the Mozilla Public License 2.0 (MPL 2.0). See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to create a pull request or open an issue. 🤝

## Credits

Created by [itsneufox](https://github.com/itsneufox)


## Acknowledgments
- [Dobby](https://github.com/DobbysGamertag) - For providing the idea.
- The open.mp community for their invaluable resources and support.
