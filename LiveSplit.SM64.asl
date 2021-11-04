// Memory of Japanese Mupen64Plus version
state("mupen64plus-ui-console", "Japanese Mupen64Plus") {
    uint gameRunTime : "mupen64plus.dll", 0x3231C1C, 0x32C640;
    byte mapId : "mupen64plus.dll", 0x3231C1C, 0x32CE9A;
    ushort animation : "mupen64plus.dll", 0x3231C1C, 0x339E0C;
    byte keys : "mupen64plus.dll", 0x3231C1C, 0x207B08;
    byte coins : "mupen64plus.dll", 0x3231C1C, 0x339EAA;
    byte bobStars : "mupen64plus.dll", 0x3231C1C, 0x207B0F;
    byte wfStars : "mupen64plus.dll", 0x3231C1C, 0x207B0E;
    byte jrbStars : "mupen64plus.dll", 0x3231C1C, 0x207B0D;
    byte ccmStars : "mupen64plus.dll", 0x3231C1C, 0x207B0C;
    byte bbhStars : "mupen64plus.dll", 0x3231C1C, 0x207B13;
    byte hmcStars : "mupen64plus.dll", 0x3231C1C, 0x207B12;
    byte lllStars : "mupen64plus.dll", 0x3231C1C, 0x207B11;
    byte sslStars : "mupen64plus.dll", 0x3231C1C, 0x207B10;
    byte dddStars : "mupen64plus.dll", 0x3231C1C, 0x207B17;
    byte slStars : "mupen64plus.dll", 0x3231C1C, 0x207B16;
    byte wdwStars : "mupen64plus.dll", 0x3231C1C, 0x207B15;
    byte ttmStars : "mupen64plus.dll", 0x3231C1C, 0x207B14;
    byte thiStars : "mupen64plus.dll", 0x3231C1C, 0x207B1B;
    byte ttcStars : "mupen64plus.dll", 0x3231C1C, 0x207B1A;
    byte rrStars : "mupen64plus.dll", 0x3231C1C, 0x207B19;
}

// Memory of Japanese Project64 version
state("project64", "Japanese Project64") {
    uint gameRunTime : "Project64.exe", 0xD6A1C, 0x32C640;
    byte mapId : "Project64.exe", 0xD6A1C, 0x32CE9A;
    ushort animation : "Project64.exe", 0xD6A1C, 0x339E0C;
    byte keys : "Project64.exe", 0xD6A1C, 0x207B08;
    byte coins : "Project64.exe", 0xD6A1C, 0x339EAA;
    byte bobStars : "Project64.exe", 0xD6A1C, 0x207B0F;
    byte wfStars : "Project64.exe", 0xD6A1C, 0x207B0E;
    byte jrbStars : "Project64.exe", 0xD6A1C, 0x207B0D;
    byte ccmStars : "Project64.exe", 0xD6A1C, 0x207B0C;
    byte bbhStars : "Project64.exe", 0xD6A1C, 0x207B13;
    byte hmcStars : "Project64.exe", 0xD6A1C, 0x207B12;
    byte lllStars : "Project64.exe", 0xD6A1C, 0x207B11;
    byte sslStars : "Project64.exe", 0xD6A1C, 0x207B10;
    byte dddStars : "Project64.exe", 0xD6A1C, 0x207B17;
    byte slStars : "Project64.exe", 0xD6A1C, 0x207B16;
    byte wdwStars : "Project64.exe", 0xD6A1C, 0x207B15;
    byte ttmStars : "Project64.exe", 0xD6A1C, 0x207B14;
    byte thiStars : "Project64.exe", 0xD6A1C, 0x207B1B;
    byte ttcStars : "Project64.exe", 0xD6A1C, 0x207B1A;
    byte rrStars : "Project64.exe", 0xD6A1C, 0x207B19;
}

init {
    // Version identifier
    if (settings["gameVerJPM64P"])
    {
        version = "Japanese Mupen64Plus";
    }
    if (settings["gameVerJPPJ64"])
    {
        version = "Japanese Project64";
    }
    
    // Global variables
    vars.launchMapId = 1;
}

startup {
    settings.Add("settingsStart", true, "Start Settings");
    settings.Add("launchStart", false, "Start on Game Launch", "settingsStart");
    settings.Add("settingsSplit", true, "Split Settings");
    settings.Add("starAndKeySplit", false, "Every star and key", "settingsSplit");
    settings.Add("courseSplit", false, "Course completion", "settingsSplit");
    settings.Add("exceptDddSplit", false, "Except DDD (Door touch instead)", "settingsSplit");
    settings.Add("bitdwSplit", false, "BitDW", "settingsSplit");
    settings.Add("hmc100Split", false, "HMC100", "settingsSplit");
    settings.Add("vanishCapSplit", false, "VCutM", "settingsSplit");
    settings.Add("ddd100Split", false, "DDD100", "settingsSplit");
	settings.Add("bitfsSplit", false, "BitFS", "settingsSplit");
    settings.Add("upstairsDoorTouchSplit", false, "Upstairs door touch", "settingsSplit");
    settings.Add("wmotrSplit", false, "WMotR", "settingsSplit");
    
    settings.Add("settingsReset", true, "Reset Settings");
    settings.Add("gameResetReset", false, "Reset on Game Reset", "settingsReset");
    
    settings.Add("gameVersion", true, "Game Version (requires LiveSplit restart)");
    settings.Add("gameVerJPM64P", false, "Japanese Mupen64Plus", "gameVersion");
    settings.Add("gameVerJPPJ64", true, "Japanese Project64", "gameVersion");
}

start {
    if (settings["launchStart"] && current.mapId == vars.launchMapId && current.gameRunTime == 0) {
        return true;
    }
}

reset {
    if (settings["gameResetReset"] && (current.mapId == vars.launchMapId && old.mapId != vars.launchMapId || (current.mapId == vars.launchMapId && old.mapId == vars.launchMapId && current.gameRunTime < old.gameRunTime))) {
        return true;
    }
}

split {
    // Map IDs
    const int bow1MapId = 30;
    const int bow2MapId = 33;
    const int bow3MapId = 34;
    const int vcutmMapId = 18;
    const int wmotrMapId = 31;
    const int bobMapId = 9;
    const int wfMapId = 24;
    const int jrbMapId = 12;
    const int ccmMapId = 5;
    const int bbhMapId = 4;
    const int hmcMapId = 7;
    const int lllMapId = 22;
    const int sslMapId = 8;
    const int dddMapId = 23;
    const int slMapId = 10;
    const int wdwMapId = 11;
    const int ttmMapId = 36;
    const int thiMapId = 13;
    const int ttcMapId = 14;
    const int rrMapId = 15;
    
    // Animations
    const int starGrabAnimation = 4866;
    const int starGrabAnimationSwim = 4867;
    const int keyDoorTouchAnimation = 4910;
    const int gameEndAnimation = 6409;
    
    // Stars are represented by 1 bit each. When all stars in a stage are collected the 7 least significant bits are all 1
    const int stageDone = 127;
    
    // Record stars for each stage
    var stageStars = new Dictionary<int, int>();
    // We mask out the 8th bit since it does not represent a star
    stageStars[bobMapId] = current.bobStars & stageDone;
    stageStars[wfMapId] = current.wfStars & stageDone;
    stageStars[jrbMapId] = current.jrbStars & stageDone;
    stageStars[ccmMapId] = current.ccmStars & stageDone;
    stageStars[bbhMapId] = current.bbhStars & stageDone;
    stageStars[hmcMapId] = current.hmcStars & stageDone;
    stageStars[lllMapId] = current.lllStars & stageDone;
    stageStars[sslMapId] = current.sslStars & stageDone;
    stageStars[dddMapId] = current.dddStars & stageDone;
    stageStars[slMapId] = current.slStars & stageDone;
    stageStars[wdwMapId] = current.wdwStars & stageDone;
    stageStars[ttmMapId] = current.ttmStars & stageDone;
    stageStars[thiMapId] = current.thiStars & stageDone;
    stageStars[ttcMapId] = current.ttcStars & stageDone;
    stageStars[rrMapId] = current.rrStars & stageDone;

    bool fadeout = old.mapId != current.mapId;

    // Game end (bowser 3 big star)
    if (current.animation == gameEndAnimation && old.animation != gameEndAnimation && current.mapId == bow3MapId) {
        return true;
    }
    
    // Star and key split
    if (settings["starAndKeySplit"] && fadeout && (old.animation == starGrabAnimation || old.animation == starGrabAnimationSwim)) {
        return true;
    }

    // Course split
    if (settings["exceptDddSplit"]) {
        // Sometimes splitting after DDD is not desired
        stageStars.Remove(dddMapId);
    }
    if (settings["courseSplit"] && fadeout && stageStars.ContainsKey(old.mapId)) {
        if (stageStars[old.mapId] == stageDone) {
            return true;
        }
    }
    
    // BitDW
    if (settings["bitdwSplit"] && fadeout && old.mapId == bow1MapId && old.animation == starGrabAnimation) {
        return true;
    }
    
    // HMC100
    if (settings["hmc100Split"] && fadeout && old.mapId == hmcMapId && old.coins >= 100 && old.animation == starGrabAnimation) {
        return true;
    }
    
    // Vanish Cap
    if (settings["vanishCapSplit"] && fadeout && old.mapId == vcutmMapId && old.animation == starGrabAnimation) {
        return true;
    }

    // DDD100
    if (settings["ddd100Split"] && fadeout && old.mapId == dddMapId && old.coins >= 100 && old.animation == starGrabAnimation) {
        return true;
    }
	
	// BitDW
    if (settings["bitfsSplit"] && fadeout && old.mapId == bow2MapId && old.animation == starGrabAnimation) {
        return true;
    }
    
    // Upstairs door touch
    // Mask out the bits indicating that key 2 has been acquired but the upstairs door has not been touched.
    bool key2 = (current.keys & 32) == 32;
    if (settings["upstairsDoorTouchSplit"] && current.animation == keyDoorTouchAnimation && old.animation != keyDoorTouchAnimation && key2) {
        return true;
    }
    
    // Wing Mario over the Rainbow
    if (settings["wmotrSplit"] && fadeout && old.mapId == wmotrMapId && old.animation == starGrabAnimation) {
        return true;
    }
}

update {
    // Disable if game version is not selected.
    if (version == "") {
        return false;
    }
}