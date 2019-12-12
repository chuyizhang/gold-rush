.global Title
.global GameOver
.global Bankrupt
.global WeekLabel
.global Weeks
.global Dollar
.global Chocolate
.global Find
.global Hospital
.global Robber
.global Lost

.data
    Title:
        .ascii "\033[1;33m"
        .ascii "            GGGGGGGGGGGGG     OOOOOOOOO     LLLLLLLLLLL             DDDDDDDDDDDDD        \n"
        .ascii "         GGG::::::::::::G   OO:::::::::OO   L:::::::::L             D::::::::::::DDD     \n"
        .ascii "       GG:::::::::::::::G OO:::::::::::::OO L:::::::::L             D:::::::::::::::DD   \n"
        .ascii "      G:::::GGGGGGGG::::GO:::::::OOO:::::::OLL:::::::LL             DDD:::::DDDDD:::::D  \n"
        .ascii "     G:::::G       GGGGGGO::::::O   O::::::O  L:::::L                 D:::::D    D:::::D \n"
        .ascii "    G:::::G              O:::::O     O:::::O  L:::::L                 D:::::D     D:::::D\n"
        .ascii "    G:::::G              O:::::O     O:::::O  L:::::L                 D:::::D     D:::::D\n"
        .ascii "    G:::::G    GGGGGGGGGGO:::::O     O:::::O  L:::::L                 D:::::D     D:::::D\n"
        .ascii "    G:::::G    G::::::::GO:::::O     O:::::O  L:::::L                 D:::::D     D:::::D\n"
        .ascii "    G:::::G    GGGGG::::GO:::::O     O:::::O  L:::::L                 D:::::D     D:::::D\n"
        .ascii "    G:::::G        G::::GO:::::O     O:::::O  L:::::L                 D:::::D     D:::::D\n"
        .ascii "     G:::::G       G::::GO::::::O   O::::::O  L:::::L         LLLLLL  D:::::D    D:::::D \n"
        .ascii "      G:::::GGGGGGGG::::GO:::::::OOO:::::::OLL:::::::LLLLLLLLL:::::LDDD:::::DDDDD:::::D  \n"
        .ascii "       GG:::::::::::::::G OO:::::::::::::OO L::::::::::::::::::::::LD:::::::::::::::DD   \n"
        .ascii "         GGG::::::GGG:::G   OO:::::::::OO   L::::::::::::::::::::::LD::::::::::::DDD     \n"
        .ascii "            GGGGGG   GGGG     OOOOOOOOO     LLLLLLLLLLLLLLLLLLLLLLLLDDDDDDDDDDDDD        \n"
        .ascii "                                                                                         \n"
        .ascii "    RRRRRRRRRRRRRRRRR   UUUUUUUU     UUUUUUUU   SSSSSSSSSSSSSSS HHHHHHHHH     HHHHHHHHH  \n"
        .ascii "    R::::::::::::::::R  U::::::U     U::::::U SS:::::::::::::::SH:::::::H     H:::::::H  \n"
        .ascii "    R::::::RRRRRR:::::R U::::::U     U::::::US:::::SSSSSS::::::SH:::::::H     H:::::::H  \n"
        .ascii "    RR:::::R     R:::::RUU:::::U     U:::::UUS:::::S     SSSSSSSHH::::::H     H::::::HH  \n"
        .ascii "      R::::R     R:::::R U:::::U     U:::::U S:::::S              H:::::H     H:::::H    \n"
        .ascii "      R::::R     R:::::R U:::::D     D:::::U S:::::S              H:::::H     H:::::H    \n"
        .ascii "      R::::RRRRRR:::::R  U:::::D     D:::::U  S::::SSSS           H::::::HHHHH::::::H    \n"
        .ascii "      R:::::::::::::RR   U:::::D     D:::::U   SS::::::SSSSS      H:::::::::::::::::H    \n"
        .ascii "      R::::RRRRRR:::::R  U:::::D     D:::::U     SSS::::::::SS    H:::::::::::::::::H    \n"
        .ascii "      R::::R     R:::::R U:::::D     D:::::U        SSSSSS::::S   H::::::HHHHH::::::H    \n"
        .ascii "      R::::R     R:::::R U:::::D     D:::::U             S:::::S  H:::::H     H:::::H    \n"
        .ascii "      R::::R     R:::::R U::::::U   U::::::U             S:::::S  H:::::H     H:::::H    \n"
        .ascii "    RR:::::R     R:::::R U:::::::UUU:::::::U SSSSSSS     S:::::SHH::::::H     H::::::HH  \n"
        .ascii "    R::::::R     R:::::R  UU:::::::::::::UU  S::::::SSSSSS:::::SH:::::::H     H:::::::H  \n"
        .ascii "    R::::::R     R:::::R    UU:::::::::UU    S:::::::::::::::SS H:::::::H     H:::::::H  \n"
        .ascii "    RRRRRRRR     RRRRRRR      UUUUUUUUU       SSSSSSSSSSSSSSS   HHHHHHHHH     HHHHHHHHH  "
        .ascii "\033[0m\0"

    GameOver:
        .ascii "     ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗ ██╗   ██╗███████╗██████╗ \n"
        .ascii "    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗██║   ██║██╔════╝██╔══██╗\n"
        .ascii "    ██║  ███╗███████║██╔████╔██║█████╗      ██║   ██║██║   ██║█████╗  ██████╔╝\n"
        .ascii "    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗\n"
        .ascii "    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╔╝ ╚████╔╝ ███████╗██║  ██║\n"
        .ascii "     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝\0"
    
    Bankrupt:
        .ascii "\n"
        .ascii "     ▄▄▄▄    ▄▄▄       ███▄    █  ██ ▄█▀ ██▀███   █    ██  ██▓███  ▄▄▄█████▓\n"
        .ascii "    ▓█████▄ ▒████▄     ██ ▀█   █  ██▄█▒ ▓██ ▒ ██▒ ██  ▓██▒▓██░  ██▒▓  ██▒ ▓▒\n"
        .ascii "    ▒██▒ ▄██▒██  ▀█▄  ▓██  ▀█ ██▒▓███▄░ ▓██ ░▄█ ▒▓██  ▒██░▓██░ ██▓▒▒ ▓██░ ▒░\n"
        .ascii "    ▒██░█▀  ░██▄▄▄▄██ ▓██▒  ▐▌██▒▓██ █▄ ▒██▀▀█▄  ▓▓█  ░██░▒██▄█▓▒ ▒░ ▓██▓ ░ \n"
        .ascii "    ░▓█  ▀█▓ ▓█   ▓██▒▒██░   ▓██░▒██▒ █▄░██▓ ▒██▒▒▒█████▓ ▒██▒ ░  ░  ▒██▒ ░ \n"
        .ascii "    ░▒▓███▀▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ▒ ▒▒ ▓▒░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░  ▒ ░░   \n"
        .ascii "    ▒░▒   ░   ▒   ▒▒ ░░ ░░   ░ ▒░░ ░▒ ▒░  ░▒ ░ ▒░░░▒░ ░ ░ ░▒ ░         ░    \n"
        .ascii "     ░    ░   ░   ▒      ░   ░ ░ ░ ░░ ░   ░░   ░  ░░░ ░ ░ ░░         ░      \n"
        .ascii "     ░            ░  ░         ░ ░  ░      ░        ░                       \n"
        .ascii "          ░                                                                 \0"
    
    WeekLabel:
        .ascii "                 U _____ uU _____ u  _  __    \n"
        .ascii "     __        __\\| ___\"|/\\| ___\"|/ |\"|/ /    \n"
        .ascii "     \\\"\\      /\"/ |  _|\"   |  _|\"   | ' /     \n"
        .ascii "     /\\ \\ /\\ / /\\ | |___   | |___ U/| . \\\\u   \n"
        .ascii "    U  \\ V  V /  U|_____|  |_____|  |_|\\_\\    \n"
        .ascii "    .-,_\\ /\\ /_,-.<<   >>  <<   >>,-,>> \\\\,-. \n"
        .ascii "     \\_)-'  '-(_/(__) (__)(__) (__)\\.)   (_/  \0"
    
    One:
        .ascii "       U  ___ u  _   _   U _____ u \n"
        .ascii "        \\/\"_ \\/ | \\ |\"|  \\| ___\"|/ \n"
        .ascii "        | | | |<|  \\| |>  |  _|\"   \n"
        .ascii "    .-,_| |_| |U| |\\  |u  | |___   \n"
        .ascii "     \\_)-\\___/  |_| \\_|   |_____|  \n"
        .ascii "          \\\\    ||   \\\\,-.<<   >>  \n"
        .ascii "         (__)   (_\")  (_/(__) (__) \0"
    
    Two:
        .ascii "      _____                 U  ___ u \n"
        .ascii "     |_ \" _| __        __    \\/\"_ \\/ \n"
        .ascii "       | |   \\\"\\      /\"/    | | | | \n"
        .ascii "      /| |\\  /\\ \\ /\\ / /\\.-,_| |_| | \n"
        .ascii "     u |_|U U  \\ V  V /  U\\_)-\\___/  \n"
        .ascii "     _// \\\\_.-,_\\ /\\ /_,-.     \\\\    \n"
        .ascii "    (__) (__)\\_)-'  '-(_/     (__)   \0"
    
    Three:
        .ascii "      _____    _   _    ____    U _____ uU _____ u \n"
        .ascii "     |_ \" _|  |'| |'|U |  _\"\\ u \\| ___\"|/\\| ___\"|/ \n"
        .ascii "       | |   /| |_| |\\\\| |_) |/  |  _|\"   |  _|\"   \n"
        .ascii "      /| |\\  U|  _  |u |  _ <    | |___   | |___   \n"
        .ascii "     u |_|U   |_| |_|  |_| \\_\\   |_____|  |_____|  \n"
        .ascii "     _// \\\\_  //   \\\\  //   \\\\_  <<   >>  <<   >>  \n"
        .ascii "    (__) (__)(_\") (\"_)(__)  (__)(__) (__)(__) (__) \0"
    
    Four:
        .ascii "      _____   U  ___ u   _   _    ____     \n"
        .ascii "     |\" ___|   \\/\"_ \\/U |\"|u| |U |  _\"\\ u  \n"
        .ascii "    U| |_  u   | | | | \\| |\\| | \\| |_) |/  \n"
        .ascii "    \\|  _|/.-,_| |_| |  | |_| |  |  _ <    \n"
        .ascii "     |_|    \\_)-\\___/  <<\\___/   |_| \\_\\   \n"
        .ascii "     )(\\\\,-      \\\\   (__) )(    //   \\\\_  \n"
        .ascii "    (__)(_/     (__)      (__)  (__)  (__) \0"
    
    Five:
        .ascii "      _____           __     __ U _____ u \n"
        .ascii "     |\" ___|    ___   \\ \\   /\"/u\\| ___\"|/ \n"
        .ascii "    U| |_  u   |_\"_|   \\ \\ / //  |  _|\"   \n"
        .ascii "    \\|  _|/     | |    /\\ V /_,-.| |___   \n"
        .ascii "     |_|      U/| |\\u U  \\_/-(_/ |_____|  \n"
        .ascii "     )(\\\\,-.-,_|___|_,-.//       <<   >>  \n"
        .ascii "    (__)(_/ \\_)-' '-(_/(__)     (__) (__) \0"
    
    Six:
        .ascii "      ____                   __  __   \n"
        .ascii "     / __\"| u      ___       \\ \\/\"/   \n"
        .ascii "    <\\___ \\/      |_\"_|      /\\  /\\   \n"
        .ascii "     u___) |       | |      U /  \\ u  \n"
        .ascii "     |____/>>    U/| |\\u     /_/\\_\\   \n"
        .ascii "      )(  (__).-,_|___|_,-.,-,>> \\\\_  \n"
        .ascii "     (__)      \\_)-' '-(_/  \\_)  (__) \0"
    
    Seven:
        .ascii "      ____   U _____ u__     __ U _____ u _   _     \n"
        .ascii "     / __\"| u\\| ___\"|/\\ \\   /\"/u\\| ___\"|/| \\ |\"|    \n"
        .ascii "    <\\___ \\/  |  _|\"   \\ \\ / //  |  _|\" <|  \\| |>   \n"
        .ascii "     u___) |  | |___   /\\ V /_,-.| |___ U| |\\  |u   \n"
        .ascii "     |____/>> |_____| U  \\_/-(_/ |_____| |_| \\_|    \n"
        .ascii "      )(  (__)<<   >>   //       <<   >> ||   \\\\,-. \n"
        .ascii "     (__)    (__) (__) (__)     (__) (__)(_\")  (_/  \0"
    
    Eight:
        .ascii "    U _____ u             ____   _   _    _____   \n"
        .ascii "    \\| ___\"|/    ___   U /\"___|u|'| |'|  |_ \" _|  \n"
        .ascii "     |  _|\"     |_\"_|  \\| |  _ /| |_| |\\   | |    \n"
        .ascii "     | |___      | |    | |_| |U|  _  |u  /| |\\   \n"
        .ascii "     |_____|   U/| |\\u   \\____| |_| |_|  u |_|U   \n"
        .ascii "     <<   >>.-,_|___|_,-._)(|_  //   \\\\  _// \\\\_  \n"
        .ascii "    (__) (__)\\_)-' '-(_/(__)__)(_\") (\"_)(__) (__) \0"
    
    Nine:
        .ascii "      _   _                 _   _   U _____ u \n"
        .ascii "     | \\ |\"|       ___     | \\ |\"|  \\| ___\"|/ \n"
        .ascii "    <|  \\| |>     |_\"_|   <|  \\| |>  |  _|\"   \n"
        .ascii "    U| |\\  |u      | |    U| |\\  |u  | |___   \n"
        .ascii "     |_| \\_|     U/| |\\u   |_| \\_|   |_____|  \n"
        .ascii "     ||   \\\\,-.-,_|___|_,-.||   \\\\,-.<<   >>  \n"
        .ascii "     (_\")  (_/ \\_)-' '-(_/ (_\")  (_/(__) (__) \0"
    
    Ten:
        .ascii "      _____  U _____ u _   _     \n"
        .ascii "     |_ \" _| \\| ___\"|/| \\ |\"|    \n"
        .ascii "       | |    |  _|\" <|  \\| |>   \n"
        .ascii "      /| |\\   | |___ U| |\\  |u   \n"
        .ascii "     u |_|U   |_____| |_| \\_|    \n"
        .ascii "     _// \\\\_  <<   >> ||   \\\\,-. \n"
        .ascii "    (__) (__)(__) (__)(_\")  (_/  \0"
    
    Eleven:
        .ascii "    U _____ u  _     U _____ u__     __ U _____ u _   _     \n"
        .ascii "    \\| ___\"|/ |\"|    \\| ___\"|/\\ \\   /\"/u\\| ___\"|/| \\ |\"|    \n"
        .ascii "     |  _|\" U | | u   |  _|\"   \\ \\ / //  |  _|\" <|  \\| |>   \n"
        .ascii "     | |___  \\| |/__  | |___   /\\ V /_,-.| |___ U| |\\  |u   \n"
        .ascii "     |_____|  |_____| |_____| U  \\_/-(_/ |_____| |_| \\_|    \n"
        .ascii "     <<   >>  //  \\\\  <<   >>   //       <<   >> ||   \\\\,-. \n"
        .ascii "    (__) (__)(_\")(\"_)(__) (__) (__)     (__) (__)(_\")  (_/  \0"
    
    Twelve:
        .ascii "      _____              U _____ u  _     __     __ U _____ u \n"
        .ascii "     |_ \" _| __        __\\| ___\"|/ |\"|    \\ \\   /\"/u\\| ___\"|/ \n"
        .ascii "       | |   \\\"\\      /\"/ |  _|\" U | | u   \\ \\ / //  |  _|\"   \n"
        .ascii "      /| |\\  /\\ \\ /\\ / /\\ | |___  \\| |/__  /\\ V /_,-.| |___   \n"
        .ascii "     u |_|U U  \\ V  V /  U|_____|  |_____|U  \\_/-(_/ |_____|  \n"
        .ascii "     _// \\\\_.-,_\\ /\\ /_,-.<<   >>  //  \\\\   //       <<   >>  \n"
        .ascii "    (__) (__)\\_)-'  '-(_/(__) (__)(_\")(\"_) (__)     (__) (__) \0"
    
    Thirteen:
        .ascii "      _____    _   _               ____      _____  U _____ uU _____ u _   _     \n"
        .ascii "     |_ \" _|  |'| |'|     ___   U |  _\"\\ u  |_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "       | |   /| |_| |\\   |_\"_|   \\| |_) |/    | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "      /| |\\  U|  _  |u    | |     |  _ <     /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     u |_|U   |_| |_|   U/| |\\u   |_| \\_\\   u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "     _// \\\\_  //   \\\\.-,_|___|_,-.//   \\\\_  _// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "    (__) (__)(_\") (\"_)\\_)-' '-(_/(__)  (__)(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Fourteen:
        .ascii "      _____   U  ___ u   _   _    ____      _____  U _____ uU _____ u _   _     \n"
        .ascii "     |\" ___|   \\/\"_ \\/U |\"|u| |U |  _\"\\ u  |_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "    U| |_  u   | | | | \\| |\\| | \\| |_) |/    | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "    \\|  _|/.-,_| |_| |  | |_| |  |  _ <     /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     |_|    \\_)-\\___/  <<\\___/   |_| \\_\\   u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "     )(\\\\,-      \\\\   (__) )(    //   \\\\_  _// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "    (__)(_/     (__)      (__)  (__)  (__)(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Fifteen:
        .ascii "      _____              _____  _____  U _____ uU _____ u _   _     \n"
        .ascii "     |\" ___|    ___     |\" ___||_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "    U| |_  u   |_\"_|   U| |_  u  | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "    \\|  _|/     | |    \\|  _|/  /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     |_|      U/| |\\u   |_|    u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "     )(\\\\,-.-,_|___|_,-.)(\\\\,- _// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "    (__)(_/ \\_)-' '-(_/(__)(_/(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Sixteen:
        .ascii "      ____                   __  __    _____  U _____ uU _____ u _   _     \n"
        .ascii "     / __\"| u      ___       \\ \\/\"/   |_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "    <\\___ \\/      |_\"_|      /\\  /\\     | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "     u___) |       | |      U /  \\ u   /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     |____/>>    U/| |\\u     /_/\\_\\   u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "      )(  (__).-,_|___|_,-.,-,>> \\\\_  _// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "     (__)      \\_)-' '-(_/  \\_)  (__)(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Seventeen:
        .ascii "      ____   U _____ u__     __ U _____ u _   _     _____  U _____ uU _____ u _   _     \n"
        .ascii "     / __\"| u\\| ___\"|/\\ \\   /\"/u\\| ___\"|/| \\ |\"|   |_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "    <\\___ \\/  |  _|\"   \\ \\ / //  |  _|\" <|  \\| |>    | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "     u___) |  | |___   /\\ V /_,-.| |___ U| |\\  |u   /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     |____/>> |_____| U  \\_/-(_/ |_____| |_| \\_|   u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "      )(  (__)<<   >>   //       <<   >> ||   \\\\,-._// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "     (__)    (__) (__) (__)     (__) (__)(_\")  (_/(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Eighteen:
        .ascii "    U _____ u             ____   _   _    _____  U _____ uU _____ u _   _     \n"
        .ascii "    \\| ___\"|/    ___   U /\"___|u|'| |'|  |_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "     |  _|\"     |_\"_|  \\| |  _ /| |_| |\\   | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "     | |___      | |    | |_| |U|  _  |u  /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     |_____|   U/| |\\u   \\____| |_| |_|  u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "     <<   >>.-,_|___|_,-._)(|_  //   \\\\  _// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "    (__) (__)\\_)-' '-(_/(__)__)(_\") (\"_)(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Nineteen:
        .ascii "      _   _                 _   _   U _____ u  _____  U _____ uU _____ u _   _     \n"
        .ascii "     | \\ |\"|       ___     | \\ |\"|  \\| ___\"|/ |_ \" _| \\| ___\"|/\\| ___\"|/| \\ |\"|    \n"
        .ascii "    <|  \\| |>     |_\"_|   <|  \\| |>  |  _|\"     | |    |  _|\"   |  _|\" <|  \\| |>   \n"
        .ascii "    U| |\\  |u      | |    U| |\\  |u  | |___    /| |\\   | |___   | |___ U| |\\  |u   \n"
        .ascii "     |_| \\_|     U/| |\\u   |_| \\_|   |_____|  u |_|U   |_____|  |_____| |_| \\_|    \n"
        .ascii "     ||   \\\\,-.-,_|___|_,-.||   \\\\,-.<<   >>  _// \\\\_  <<   >>  <<   >> ||   \\\\,-. \n"
        .ascii "     (_\")  (_/ \\_)-' '-(_/ (_\")  (_/(__) (__)(__) (__)(__) (__)(__) (__)(_\")  (_/  \0"
    
    Twenty:
        .ascii "      _____              U _____ u _   _     _____   __   __ \n"
        .ascii "     |_ \" _| __        __\\| ___\"|/| \\ |\"|   |_ \" _|  \\ \\ / / \n"
        .ascii "       | |   \\\"\\      /\"/ |  _|\" <|  \\| |>    | |     \\ V /  \n"
        .ascii "      /| |\\  /\\ \\ /\\ / /\\ | |___ U| |\\  |u   /| |\\   U_|\"|_u \n"
        .ascii "     u |_|U U  \\ V  V /  U|_____| |_| \\_|   u |_|U     |_|   \n"
        .ascii "     _// \\\\_.-,_\\ /\\ /_,-.<<   >> ||   \\\\,-._// \\\\_.-,//|(_  \n"
        .ascii "    (__) (__)\\_)-'  '-(_/(__) (__)(_\")  (_/(__) (__)\\_) (__) \0"
    
    Weeks:
        .quad One
        .quad Two
        .quad Three
        .quad Four
        .quad Five
        .quad Six
        .quad Seven
        .quad Eight
        .quad Nine
        .quad Ten
        .quad Eleven
        .quad Twelve
        .quad Thirteen
        .quad Fourteen
        .quad Fifteen
        .quad Sixteen
        .quad Seventeen
        .quad Eighteen
        .quad Nineteen
        .quad Twenty
    
    Dollar:
        .ascii "\n"
        .ascii "    XXXXXXXXXXXXXXXXXXFEDERAL RESERVE NOTEXXXXXXXXXXXXXXXXXXX\n"
        .ascii "    XXX  XX       THE UNITED STATES OF AMERICA        XXX  XX\n"
        .ascii "    XXXX XX  -------       ------------               XXXX XX\n"
        .ascii "    XXXX XX              /   jJ===-\\    \\      C7675  XXXX XX\n"
        .ascii "    XXXXXX     OOO      /   jJ - -  L    \\      ---    XXXXXX\n"
        .ascii "    XXXXX     OOOOO     |   JJ  |   X    |       __     XXXXX\n"
        .ascii "    XXX    3   OOO      |   JJ ---  X    |      OOOO    3 XXX\n"
        .ascii "    XXX                 |   J|\\    /|    |     OOOOOO     XXX\n"
        .ascii "    XXX     C36799887   |   /  |  |  \\   |      OOOO      XXX\n"
        .ascii "    XXX                 |  |          |  |       --       XXX\n"
        .ascii "    XXX      -------    \\ /            \\ /                XXX\n"
        .ascii "    X  XX                \\ ____________ /               X  XX\n"
        .ascii "    XX XXX 3_________        --------  ___   _______ 3 XXX XX\n"
        .ascii "    XX XXX            ___   ONE DOLLAR  i              XXX XX\n"
        .ascii "    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\0"
    
    Chocolate:
        .ascii "\n"
        .ascii "      ___  ___  ___  ___  ___.---------------.\n"
        .ascii "    .'\\__\\'\\__\\'\\__\\'\\__\\'\\__,`   .  ____ ___ \\\n"
        .ascii "    |\\/ __\\/ __\\/ __\\/ __\\/ _:\\   |`.  \\  \\___ \\\n"
        .ascii "     \\\\'\\__\\'\\__\\'\\__\\'\\__\\'\\_`.__|\"\"`. \\  \\___ \\\n"
        .ascii "      \\\\/ __\\/ __\\/ __\\/ __\\/ __:                \\\n"
        .ascii "       \\\\'\\__\\'\\__\\'\\__\\ \\__\\'\\_;-----------------`\n"
        .ascii "        \\\\/   \\/   \\/   \\/   \\/ :                 |\n"
        .ascii "         \\|______________________;________________|\0"
    
    Hospital:
        .ascii "\n"
        .ascii "          .---------.\n"
        .ascii "     _    |:: [-=-] |\n"
        .ascii "    | |   |_________|\n"
        .ascii "    |~|\n"
        .ascii "    |_|                    ,;;;;,\n"
        .ascii "     I\\  ,__ ,;;;, __,    ///\\\\\\\\\\\n"
        .ascii "     I |{   / . . \\   }   / \"  \\\\||\n"
        .ascii "     I | ) (   _   ) (    \\_= _///\n"
        .ascii "     I |{___'-. .-'___}\\___ )_\\\n"
        .ascii "     I ||~/,'~~~~~,\\~~|'---((  \\\n"
        .ascii "     I \\ //        \\\\ |     \\ \\ \\\n"
        .ascii "     I  \\/         // |     | /-/\n"
        .ascii "     I (/         (/  |     |/||\\\n"
        .ascii "     I  |             |     |    |\n"
        .ascii "     I  |             |     |____/\n"
        .ascii "     I  :-----_o_-----:      || |\n"
        .ascii "     I  | /~~|===|~~\\ |      (( |\n"
        .ascii "     I  ||   |===|   ||      ||_/\n"
        .ascii "    /^\\ \"~   '^^^'   \"\"     ((__|\0"
    
    Find:
        .ascii "\n"
        .ascii "                          ____...\n"
        .ascii "                 .-\"--\"\"\"\".__    `.\n"
        .ascii "                |            `    |\n"
        .ascii "      (         `._....------.._.:\n"
        .ascii "       )         .()''        ``().\n"
        .ascii "      '          () .=='  `===  `-.\n"
        .ascii "       . )       (         g)\n"
        .ascii "        )         )     /        J\n"
        .ascii "       (          |.   /      . (\n"
        .ascii "       $$         (.  (_'.   , )|`\n"
        .ascii "       ||         |\\`-....--'/  ' \\\n"
        .ascii "      /||.         \\\\ | | | /  /   \\.\n"
        .ascii "     //||(\\         \\`-===-'  '     \\o.\n"
        .ascii "    .//7' |)         `. --   / (     OObaaaad888b.\n"
        .ascii "    (<<. / |     .a888b`.__.'d\\     OO888888888888a.\n"
        .ascii "     \\  Y' |    .8888888aaaa88POOOOOO888888888888888.\n"
        .ascii "      \\  \\ |   .888888888888888888888888888888888888b\n"
        .ascii "       |   |  .d88888P88888888888888888888888b8888888.\n"
        .ascii "       b.--d .d88888P8888888888888888a:f888888|888888b\n"
        .ascii "       88888b 888888|8888888888888888888888888\\8888888\0"
    
    Robber:
        .ascii "\n"
        .ascii "          ||||||||||||||\n"
        .ascii "         =              \\\n"
        .ascii "         =               |\n"
        .ascii "        _=            ___/\n"
        .ascii "       / _\\           (o)\\\n"
        .ascii "      | | \\            _  \\\n"
        .ascii "      | |/            (____)\n"
        .ascii "       \\__/          /   |\n"
        .ascii "        /           /  ___)\n"
        .ascii "       /    \\       \\    _)\n"
        .ascii "      \\      \\           /\n"
        .ascii "    \\/ \\      \\_________/   |\\_________________,_\n"
        .ascii "     \\/ \\      /            |     ==== _______)__)\n"
        .ascii "      \\/ \\    /           __/___  ====_/\n"
        .ascii "       \\/ \\  /           (O____)\\\\_(_/\n"
        .ascii "                        (O_ ____)\n"
        .ascii "                         (O____)\0"
    
    Lost:
        .ascii "\n"
        .ascii "              ., _\n"
        .ascii "             /    `\n"
        .ascii "            ((|)))))\n"
        .ascii "            ((/ a a\n"
        .ascii "            )))   >)\n"
        .ascii "           ((((._e((\n"
        .ascii "          ,--/ (-.\n"
        .ascii "         / \\ <\\/>/|\n"
        .ascii "        / /)  Lo )|\n"
        .ascii "       / / )    / |\n"
        .ascii "      |   /    ( /\n"
        .ascii "      |  /     ;/\n"
        .ascii "      ||(      |\n"
        .ascii "     / )|/|    \\\n"
        .ascii "    |/'/\\ \\_____\\\n"
        .ascii "         \\   |  \\\n"
        .ascii "          \\  |\\  \\\n"
        .ascii "          |  | )  )\n"
        .ascii "          )  )/  /\n"
        .ascii "         /  /   /\n"
        .ascii "        /   |  /\n"
        .ascii "       /    | /\n"
        .ascii "      /     ||\n"
        .ascii "     /      ||\n"
        .ascii "      '-,_  |_\\\n"
        .ascii "        ( '\"'-`\n"
        .ascii "         \\(\\_\\\0"
