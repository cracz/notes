# AppleScript
---

AppleScript scripts are used to automate actions on Macintosh Operating Systems and their scriptable applications. Scripts can be written using the Script Editor.

### Tell Statements
A tell statement is a single line beginning with the word `tell` that directs an action at a specific application or scriptable object. Composed of two parts:

1. A reference to the object
2. The action to be performed

Examples:

```applescript
tell application "Finder" to close every window
tell application "Finder" to open the startup disk
tell application "Finder" to get the name of front Finder window
```

* You can also make multiple tell statements inside a "tell block"

```applescript
tell application "Finder"
	...bunch of commands...
	tell the front Finder window
		...Nested tell block...
	end tell
end tell
```

## Finder Windows

### Index Property

* A number corresponding to a window's layer position in the stacking order of open Finder windows.
* You can use the verb `select` to bring a window to the front in a more simple way.
* The front Finder window has an index of 1.
* You can set different windows to new index values to change the order.
* Ways to reference Finder windows:

```
by name:
	Finder window "Documents"
by numeric index:
	Finder window 1
by descriptive index:
	the first Finder window
	the second Finder window
	the fifth Finder window
	the 1st Finder window
	the 23rd Finder window
by relative position index:
	the front Finder window
	the middle Finder window
	the back Finder window
	the last Finder window
by random index:
	some Finder window
```

### Target Property

* The value of the target property is a reference to the folder or disk whose contents are displayed in the Finder window. 
* This value can be both read and changed.
* Example:

```applescript
tell application "Finder" to set the target of the last Finder window to home
```

* Scriptable objects are referenced by describing their object hierarchy.

```applescript
tell application "Finder" to set the target of the front Finder window to the folder "Documents" of home
```

### Position Property

* Value of position is a list of two numbers describing the distance of the top left corner of the window with respect to the top left corner of the screen.
* Lists are enclosed in curly braces `{}`.


### Bounds Property

* This is a list of four numbers representing the top-left point and bottom-right point for a window. `{x1, y1, x2, y2}`
* You can `...get the bounds of the window of the desktop`
* To set the top-left position to `{x1,y1}` and the size to `{w,h}` at the same time, use 

```applescript
tell the application "Finder" to set the bounds of the front Finder window to {x1, y1, (x1+w), (y1+h)}
```

