# omp_whitelist

**omp_whitelist** is a filterscript for **open.mp** that efficiently manages player whitelisting. This script empowers server administrators to control access to the server by verifying a player's whitelist status upon connection. Players who are not whitelisted will be kicked from the server. Additionally, the script includes a user-friendly command for admins to easily whitelist players using RCON.

## Features

- **Whitelist Check**: Automatically verifies whether players are whitelisted upon connection. ✅
- **Admin Command**: Grants server administrators the ability to whitelist players through a convenient dialog interface. ⚙️
- **Easy Integration**: Simple setup and configuration for your open.mp server. 🛠️
- **Logging**: Provides detailed logging in the console and the `log.txt` file for tracking player activity. 📜

## Installation

1. Download the `omp_whitelist.pwn` script and [Pawn.CMD](https://github.com/katursis/Pawn.CMD).

2. Create a folder named `whitelist` inside your `scriptfiles` directory to store the whitelist files. 

3. Create an empty `username.txt` file (replace `username` with your in-game name) inside the `whitelist` folder. This is required for your account to connect to the server.
 
4. Place the `omp_whitelist.pwn` file into your `filterscripts` folder. 

5. Compile the script using a PAWN compiler. 

6. Add `filterscripts/omp_whitelist` to your `config.json` under the `side_scripts` line. 

7. Start your open.mp server and enjoy the whitelisting feature! 


## Usage

- **Whitelisting a Player**: Players with RCON access can use the `/whitelist` command in-game to bring up a dialog where they can enter the name of the player to whitelist.
- **Logging**: The script logs player connections and whitelist statuses in the console and the `log.txt` file for easy monitoring.

## License

This project is licensed under the Mozilla Public License 2.0 (MPL 2.0). See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to create a pull request or open an issue. 🤝

## Acknowledgments

- [Dobby](https://github.com/DobbysGamertag) - For providing the idea.
- The open.mp community for their invaluable resources and support.
