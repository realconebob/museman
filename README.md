# Museman

## A Cross-platform Music Manager

VLC, MPV, and the other popular music apps are great and all, but I find them cumbersome for dealing with downloaded music. If I want to manage playlists in VLC, the easiest way to do so is to have separate folders of music, and to recreate the entire playlist any time you add or remove music from the folder. This also means that unless you want to manually add songs to other playlists, you have to duplicate music across several folders, which obviously uses up extra space (yes, you could soft link the file, but I'm not opening termux every time I want to make a new playlist)

Museman solves these problems by creating a "music root", from which playlists are created by soft-link or database entry
