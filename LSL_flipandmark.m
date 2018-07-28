function LSL_flipandmark(marker,window,outlet,usingMuse)
    Screen('Flip',window);
if usingMuse
    outlet.push_sample({num2str(marker)},0);
end
end