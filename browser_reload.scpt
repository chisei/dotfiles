tell application "Google Chrome" to reload active tab of window 1
tell application "Safari"
    do JavaScript "window.location.reload();" in document 1
end tell
