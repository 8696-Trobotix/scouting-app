# scouting-app
Status: Experiment

**Critical Findings**  
Because the Android emulator refuses, for some unknown reason, to load any test APKs, we must resort to using the web testing capabilities of Flutter as a replacement.  
There are two ways to do this:
- Launch a "standard" web server with device ID `web-server`.
- Launch Chrome in a special debug mode with device ID `chrome`.

Due to the inherent nature of port forwarding, the Chrome option is unappealing and simply won't work at initial thought.  
However, although the web server option is far easier to set up and **get into a working state**, any client will lack the ability to communicate with the Dart VM, and as a result debugging will be extremely tedious. The built-in browser DevTools definitely help, but say that we cannot access those due to certain *device restrictions*... then the Dart Debug Extension for Chrome wouldn't work either as that augments the Chrome DevTools.  
The solution to debugging the application over port forwarding within a low-privelege devcontainer without client-side DevTools is to use a remote desktop that displays the Chrome browser launched using some extremely specific commands (namely disabled sandbox).  
This is the launch command.  
`flutter run -d chrome --web-browser-flag "--no-sandbox" --web-browser-flag "--disable-setuid-sandbox" --web-browser-flag "--disable-gpu" --web-browser-flag "--disable-dev-shm-usage"`  
To get Chrome, install Firefox to install Chrome... Use `sudo dpkg -i [chrome].deb` and `sudo apt --fix-broken install` to complete.
