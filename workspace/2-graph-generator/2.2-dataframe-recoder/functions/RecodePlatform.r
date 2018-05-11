RecodePlatform = function(v){
    v = str_replace(v, "Sega", "SEGA")

    recode(v,
        # Arcade
        "arcade game machine" = "Arcade",
        "video game arcade cabinet" = "Arcade",

        # Atari
        "Atari 8-bit family" = "Atari 8-bit",

        # DOS
        "Disk Operating System" = "DOS",

        # iOS
        "iPad" = "iOS",
        "iPhone" = "iOS",

        # Mac
        "Apple Macintosh" = "macOS",
        "Mac OS" = "macOS",
        "Macintosh" = "macOS",

        # Mega Drive
        "Genesis" = "SEGA Mega Drive",

        # PlayStation
        "PlayStation VR" = "PlayStation 4",
        "PlayStation 4 Pro" = "PlayStation 4",

        # Windows
        "x86"  = "Windows",
        "Microsoft Windows" = "Windows",
        "Windows Apps" = "Windows",
        "Windows 3.x" = "Windows",
        "Windows 3.1" = "Windows",
        "Windows 95" = "Windows",
        "Windows 98" = "Windows",
        "Windows 9x" = "Windows",
        "Windows 2000" = "Windows",
        "Windows Me" = "Windows",
        "Windows XP" = "Windows",
        "Windows Vista"  = "Windows",
        "Windows 7"  = "Windows",
        "Windows 8"  = "Windows",
        "Windows 8.1"  = "Windows",
        "Windows 10" = "Windows"
    )
}
