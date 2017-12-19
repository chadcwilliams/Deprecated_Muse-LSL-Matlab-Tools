function LSL_Muse_Shutdown
    clc;
    shutdown_path = which('LSL_Shutdown.scpt');
    system(['osascript ' shutdown_path]);
end