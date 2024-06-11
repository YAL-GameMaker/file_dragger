using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace file_dragger {
    public class file_dragger {
        private static DummyForm dummyForm;
        private static List<string> paths = new List<string>();

        [DllExport]
        unsafe public static double file_drag_drop_raw_0(string path) {
            paths.Add(path);
            return 1;
        }

        [DllExport]
        unsafe public static double file_drag_drop_raw_1(void* gameWindow) {
            /*
             * So... Control.DoDragDrop only works if the control is ""visible"".
             * And for windows, it doesn't work if the window has the taskbar button disabled? Very mysterious.
             * And a GameMaker window obviously is not a Form.
             * Anyway, I don't want to think about it too much so I'll hide a dummy Form inside the game window.
             */
            if (dummyForm == null) {
                dummyForm = new DummyForm();
                dummyForm.Show();
                WinAPI.SetParent(dummyForm.Handle, (IntPtr)gameWindow);
            }

            // https://www.codeproject.com/Answers/576756/DragplusfileplusOUTplusofplusapplication
            var dragObject = new DataObject();
            var filePaths = new StringCollection();
            foreach (var path in paths) {
                filePaths.Add(path);
            }
            paths.Clear();
            dragObject.SetFileDropList(filePaths);
            var result = dummyForm.DoDragDrop(dragObject, DragDropEffects.Copy);
            return (result != DragDropEffects.None) ? 1 : 0;
        }
    }
    public class DummyForm : Form {
        protected override void OnLoad(EventArgs e) {
            // just move it somewhere out of the way, what else
            Left = -32000;
            Top = -32000;
            base.OnLoad(e);
        }
    }
    public class WinAPI {
        [DllImport("user32.dll", SetLastError = true)]
        public static extern IntPtr SetParent(IntPtr window, IntPtr newParent);
    }
}