# file_dragger

**Quick links:** [itch.io](https://yellowafterlife.itch.io/gamemaker-file-dropper)  
**Versions:** GameMaker 2022+..?  
**Platforms:** Windows, Windows (YYC)

Company for 
[file_dropper](https://github.com/YAL-GameMaker/file_dropper),
this extension allows you to drag files _out_ of the game window.

Featuring a total of 2 (two!) functions:

### file_drag_drop(path, ...paths)➜
Starts a drag-and-drop operation for one or more files with the given (absolute!) paths.

Returns whether successful.

Should be called when the primary mouse button is pressed
(e.g. `mouse_check_button_pressed(mb_left)`).

### file_drag_drop_array(paths)
Like above, but takes an array of paths instead.

## What's interesting here
This was supposed to be one of those tiny C++ DLLs
but it takes quite a lot of boilerplate to implement a draggable IDataObject
and I couldn't get it to consistently work with various places
that you might drag a file to.

So I have settled for a
[C# approach](https://www.codeproject.com/Answers/576756/DragplusfileplusOUTplusofplusapplication)
(someone found out what Windows itself uses), but:
1.	This is a bit of a hack  
	You're supposed to use WinForms drag-and-drop with WinForms components,
	but GameMaker window isn't one, so I'm hiding a WinForms window inside the game window.
2.	It doesn't work in GameMaker: Studio for some reason.  
	There are no errors or anything, it just returns as if the user did a short click without dragging.

I decided not to take any more time
(and money of the person that wanted this extension)
to flop about with potentially no results, so this is as far as I'll be going with this.

If you have time to spare, you can investigate the following:
[1](https://www.codeproject.com/articles/840/how-to-implement-drag-and-drop-between-your-progra)
[2](https://github.com/MicrosoftDocs/win32/blob/docs/desktop-src/shell/dragdrop.md)

## Meta

**Author:** [YellowAfterlife](https://github.com/YellowAfterlife)  
**License:** MIT