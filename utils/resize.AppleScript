(*
This script resizes the Atom window to the specified size to help with
screenshot diff'ing.

1. Run `osascript utils/resize.AppleScript`.
2. Make sure you're using a Retina display (don't use an external monitor).
3. Take a screenshot with `Cmd + Shift + 4`, then `Space`, then click on the
Atom window.
4. Compress the png file.

Source: http://www.labnol.org/software/resize-mac-windows-to-specific-size/28345/
*)
set theApp to "Atom"
set appHeight to 800
set appWidth to 1200

tell application "Finder"
	set screenResolution to bounds of window of desktop
end tell

set screenWidth to item 3 of screenResolution
set screenHeight to item 4 of screenResolution

tell application theApp
	activate
	reopen
	set yAxis to (screenHeight - appHeight) / 2 as integer
	set xAxis to (screenWidth - appWidth) / 2 as integer
	set the bounds of the first window to {xAxis, yAxis, appWidth + xAxis, appHeight + yAxis}
end tell
