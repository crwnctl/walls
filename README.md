# Random Wallpaper Automation

I wrote `random-manga-wallpaper.sh` to automate wallpaper selection in Hyprland.

## Why the name is `random-manga-wallpaper.sh`

The script started as a manga-only wallpaper picker, which is why the name still says "manga."
Later, I expanded it because I had too many wallpapers across different styles I liked.
Now it picks from one large curated folder.

## Wallpaper source and curation

- Base collection: `dharmx/walls`
- I trimmed the set down to wallpapers I personally liked
- I kept only files that were properly formatted and worked well on my setup

Final wallpapers live in:

`~/Pictures/wallpapers/walls/wallpapers`

## Random sample showcase

![a_purple_and_orange_mountain_range](wallpapers/a_purple_and_orange_mountain_range.png)


## How the script works

- Scans the wallpaper directory for image files (`jpg`, `jpeg`, `png`, `webp`)
- Starts `swww-daemon` if it is not already running
- Randomly selects one wallpaper
- Saves the selected wallpaper path to:
	`~/.cache/current_manga_wallpaper`
- Applies the wallpaper using `swww img` with a transition animation

## Hyprland integration

I run the script from `hyprland.conf`:

- On boot (`exec-once`) so a wallpaper is set at login
- On a keybind (hotkey) to randomize the wallpaper anytime

Example config:

```ini
exec-once = ~/Pictures/wallpapers/walls/random-manga-wallpaper.sh
bind = $mainMod, U, exec, ~/Pictures/wallpapers/walls/random-manga-wallpaper.sh
```

## Requirements

- `bash`
- `swww`
- `hyprland`
