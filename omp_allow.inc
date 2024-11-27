/*
 * open.mp allow list include
 *
 * (c) Copyright 2024, itsneufox
 */

#if defined _INC_omp_allow
    #endinput
#endif
#define _INC_omp_allow

static gs_szAllowedNames[MAX_PLAYERS][MAX_PLAYER_NAME];
static gs_iAllowedCount = 0;

stock bool:IsPlayerAllowed(playerid)
{
    if (!IsPlayerConnected(playerid))
        return false;
        
    new szName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, szName, sizeof(szName));
   
    for(new i = 0; i < gs_iAllowedCount; i++)
    {
        if(!strcmp(gs_szAllowedNames[i], szName, true))
            return true;
    }
    return false;
}

stock AllowPlayer(const szName[])
{
    if(gs_iAllowedCount >= MAX_PLAYERS || szName[0] == EOS)
        return 0;
       
    for(new i = 0; i < gs_iAllowedCount; i++)
    {
        if(!strcmp(gs_szAllowedNames[i], szName, true))
            return 0;
    }
   
    strcat(gs_szAllowedNames[gs_iAllowedCount], szName, MAX_PLAYER_NAME);
    gs_iAllowedCount++;
    return 1;
}

stock AllowPlayers(const names[][], size = sizeof(names))
{
    for(new i = 0; i < size; i++)
    {
        AllowPlayer(names[i]);
    }
    return 1;
}
