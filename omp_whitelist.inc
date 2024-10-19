/*
 * open.mp whitelist include
 * 
 * (c) Copyright 2024, itsneufox
 */

#if defined _INC_omp_whitelist
    #endinput
#endif
#define _INC_omp_whitelist

#if !defined WHITELIST_FILE
    #define WHITELIST_FILE "whitelist.txt"
#endif

forward bool:IsPlayerWhitelisted(playerid);

bool:IsPlayerWhitelisted(playerid) 
{

    new 
        name[MAX_PLAYER_NAME]
    ;

    GetPlayerName(playerid, name, sizeof(name));  

    new 
        File:file = fopen(WHITELIST_FILE, io_read)
    ;  

    if (!file) 
    {

        printf("Error: Could not open whitelist file: %s", WHITELIST_FILE);
        
        return false;
    }
    
    new 
        line[MAX_PLAYER_NAME]
    ; 

    
    while (fread(file, line)) 
    {
        new 
            len = strlen(line)
        ;
        
        while (len > 0 && (line[len - 1] == '\n' || line[len - 1] == '\r')) 
        {
            line[--len] = 0;
        }
        
        if (!strcmp(line, name, true)) 
        {

            fclose(file);
            
            return true;
        }
    }
    
    fclose(file);

    return false;
}
