urls="
`#Sugar Pine 7` https://www.youtube.com/user/mlgHwnT/
`#JackStauber` https://www.youtube.com/user/JackStauber
`#Cinecom.net` https://www.youtube.com/user/YapperDesign
`#Cib` https://www.youtube.com/user/CibSeption
`#Luke Smith` https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA
`#Modern Rogue` https://www.youtube.com/channel/UC42VsoDtra5hMiXZSsD6eGg
`#Boys Only Club` https://www.youtube.com/channel/UCs3snA6GNU9HjV8ejeC0ISA
`#u m a m i` https://www.youtube.com/channel/UCqrrxZeeFSNCjGmD-33SKMw
`#Gus Johnson` https://www.youtube.com/user/gustoonz
`#N-O-D-E` https://www.youtube.com/channel/UCvrLvII5oxSWEMEkszrxXEA
`#88rising` https://www.youtube.com/channel/UCZW5lIUz93q_aZIkJPAC0IQ
`#H3 Podcast` https://www.youtube.com/channel/UCLtREJY21xRfCuEKvdki1Kw
`#Oats` https://www.youtube.com/channel/UCD4ZEYIBnHIC2DUhiizMOHg
`#flooperino` https://www.youtube.com/user/F10opy
`#Cody Ko` https://www.youtube.com/user/codyko69
`#Noel Miller` https://www.youtube.com/channel/UCuTQDPUE12sy7g1xf1LAdTA
`#Druaga1` https://www.youtube.com/user/Druaga1
`#kmlkmljkl` https://www.youtube.com/user/kmlkmljkl
`#kmlalt` https://www.youtube.com/channel/UCZwTDDwbC1ecOXaf7odZIIQ
`#AnonHacker` https://www.youtube.com/channel/UCh34ylC-NoOR3jQLwaGgfog
`#Kali Linux Tutorials` https://www.youtube.com/user/kalinuxx
`#Internet Historian` https://www.youtube.com/channel/UCR1D15p_vdP3HkrH8wgjQRw
`#Internet Historian Incognito` https://www.youtube.com/channel/UC8Q7XEy86Q7T-3kNpNjYgwA
`#Binging with Babish` https://www.youtube.com/user/bgfilms
`#Sadworld` https://www.youtube.com/channel/UC6ZIKcLUAdxTUOB9yIo3baw
`#Fun Church` https://www.youtube.com/channel/UC5eL-cHHG3KuYo8xg5NS5nw
`#Imaginary Ambition` https://www.youtube.com/channel/UCP5bYRGZUJMG93AVoMekz9g
`#Brockhampton` https://www.youtube.com/user/ALlVESINCEFOREVER
`#Bill Wurtz` https://www.youtube.com/user/billwurtz
`#Primitive Technology` https://www.youtube.com/channel/UCAL3JXZSzSm8AlZyD3nQdBA
`#AcesToAces` https://www.youtube.com/channel/UCmomtZFNN-A_nB7jHM7H1bw
`#KYOKU` https://www.youtube.com/channel/UCD_aYRsc8obr4WMMGULumYQ
`#Pad Chennington` https://www.youtube.com/channel/UCH4dD2XaQGE6OIG3avq5Sjw
`#Internet Media Archive` https://www.youtube.com/channel/UCDLALR63TzJLvBKKYMpSJ-A/
`#Acrylo` https://www.youtube.com/channel/UCkc9BpKNNMuNFZjVG7mwLoQ
`#Aztrosist` https://www.youtube.com/channel/UC3HjOlfXBQJO12-YhumbJCg
`#Brockhampton Vault` https://www.youtube.com/channel/UCtcZpnNyptuDnhJ1jtqo19w
`#Captain Disillusion` https://www.youtube.com/channel/UCEOXxzW2vU0P-0THehuIIeg
`#Casually Explained` https://www.youtube.com/channel/UCr3cBLTYmIK9kY0F_OdFWFQ
`#You Suck At Cooking` https://www.youtube.com/channel/UCekQr9znsk2vWxBo3YiLq2w
`#Poppy` https://www.youtube.com/user/thatPoppyTV
`#alantutorial` https://www.youtube.com/user/alantutorial
`#Film Riot Extras` https://www.youtube.com/user/filmriotextras
`#Vsauce3` https://www.youtube.com/channel/UCwmFOfFuvRPI112vR5DNnrA
`#Vsauce` https://www.youtube.com/channel/UC6nSFpj9HTCZ5t-N3Rm3-HA
`#Vsauce2` https://www.youtube.com/channel/UCqmugCqELzhIMNYnsjScXXw
`#Film Riot` https://www.youtube.com/user/filmriot
`#JakkTutorials` https://www.youtube.com/user/JackkTutorials
`#Cryptic` https://www.youtube.com/channel/UCTXe61yRpk81cIs1clU5EWA
`#FlippingChemistry` https://www.youtube.com/channel/UCAVs88nnGnW_III4RxZzzbg/
"

youtube-dl -o "%(uploader)s/%(upload_date)s - %(title)s - %(id)s - (%(resolution)s)/%(title)s.%(ext)s" -f "(bestvideo+bestaudio/best)" --geo-bypass --prefer-ffmpeg --ignore-errors --write-description --write-info-json --add-metadata --write-annotations --write-thumbnail --write-sub --embed-subs --all-subs --convert-subs srt --merge-output-format mkv --download-archive downloaded.txt $urls