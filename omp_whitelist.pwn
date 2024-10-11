// Defines the script as a filterscript
#define                     FILTERSCRIPT

// Includes the open.mp and pawn.cmd libraries
#include                    <open.mp>
#include                    <Pawn.CMD>

// Defines the needed colours codes
#define COLOUR_YELLOW       0xFFFB00FF
#define COLOUR_RED          0xFF0000FF
#define COLOUR_GREEN        0x00FF00FF

// Defines the dialog ID
#define DIALOG_WHITELIST    555  


// Function to check if a player is whitelisted
bool:IsPlayerWhitelisted(const name[])
{

    new 
        filename[128]
    ;


    format(filename, sizeof(filename), "whitelist/%s.txt", name); 

    printf("[WL] Checking whitelist file: %s", filename);  

    if (fexist(filename))                 
    {

        printf("[WL] Whitelist file found: %s", filename);  

        return true;                      
    }

    printf("[WL] Whitelist file not found: %s", filename);  

    return false;                         
}


// Function to whitelist a player
bool:WhitelistPlayer(const name[])
{

    if(IsPlayerWhitelisted(name)) return false;  


    new 
        filename[128]
    ;                   

    format(filename, sizeof(filename), "whitelist/%s.txt", name); 

    new File:file = fopen(filename, io_write); 

    if(file)                              
    {

        fclose(file);                     

        printf("[WL] Player %s has been successfully whitelisted. File created: %s", name, filename); 

        return true;                     
    }

    printf("[WL] Failed to create whitelist file: %s", filename);  

    return false;                        
}


public OnFilterScriptInit()
{

    print("\n");                          
    print(" __          ___     _ _       _ _     _   ");  
    print(" \\ \\        / / |   (_) |     | (_)   | |  ");  
    print("  \\ \\  /\\  / /| |__  _| |_ ___| |_ ___| |_ ");  
    print("   \\ \\/  \\/ / | '_ \\| | __/ _ \\ | / __| __|");  
    print("    \\  /\\  /  | | | | | ||  __/ | \\__ \\ |_ ");  
    print("     \\/  \\/   |_| |_|_|\\__\\___|_|_|___/\\__|");  
    print("                                           ");  
    print("        System Loaded Successfully!        ");  
    print("                                           ");  

    return true;                              
}


public OnFilterScriptExit()            
{

    print("\n");                          
    print(" __          ___     _ _       _ _     _   ");  
    print(" \\ \\        / / |   (_) |     | (_)   | |  ");  
    print("  \\ \\  /\\  / /| |__  _| |_ ___| |_ ___| |_ ");  
    print("   \\ \\/  \\/ / | '_ \\| | __/ _ \\ | / __| __|");  
    print("    \\  /\\  /  | | | | | ||  __/ | \\__ \\ |_ ");  
    print("     \\/  \\/   |_| |_|_|\\__\\___|_|_|___/\\__|");  
    print("                                           ");  
    print("        System Unloaded Successfully!      ");  
    print("                                           ");

    return true;                              
}


public OnPlayerConnect(playerid)
{

    new 
        name[MAX_PLAYER_NAME + 1]
    ;      

    GetPlayerName(playerid, name, sizeof(name));  

    printf("[WL] Player attempting to connect: %s", name);  

    if(!IsPlayerWhitelisted(name))       
    {

        Kick(playerid);
                            
        printf("[WL] Player not whitelisted, kicking: %s", name);  
    }
    else
    {

        printf("[WL] Player whitelisted: %s", name);  
    }

    return true;                            
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(!response) return true;

    if(dialogid == DIALOG_WHITELIST)  
    {
        new 
            string[128]
        ;  

        if(WhitelistPlayer(inputtext))  
        {

            format(string, sizeof(string), "Player %s has been successfully whitelisted.", inputtext);

            SendClientMessage(playerid, COLOUR_GREEN, string);

            printf("[WL] Whitelisting successful for: %s", inputtext);  
        }
        else
        {

            format(string, sizeof(string), "Failed to whitelist %s. They may already be whitelisted.", inputtext); 

            SendClientMessage(playerid, COLOUR_RED, string);  

            printf("[WL] Failed to whitelist %s.", inputtext);  
        }
    }
    return true;                            
}


// Command /whitelist
CMD:whitelist(playerid, params[])
{

    if(!IsPlayerAdmin(playerid))  
    {

        SendClientMessage(playerid, COLOUR_RED, "You must be an admin to use this command."); 

        return true;                            
    }

    ShowPlayerDialog(playerid, DIALOG_WHITELIST, DIALOG_STYLE_INPUT, "Whitelist Player", "Enter the name of the player you wish to whitelist:", "Whitelist", "Cancel");
      
    return true;                            
}
