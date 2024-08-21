import java.awt.Robot;
import java.awt.event.InputEvent;
mouse = Robot();

cameraX = 1878;
cameraY = 534;

numClicks = 101;

for click = 1:numClicks
    
    mouse.mouseMove(cameraX, cameraY);
        mouse.mousePress(InputEvent.BUTTON1_MASK);  
    pause(0.1);  
    mouse.mouseRelease(InputEvent.BUTTON1_MASK); 
    
    
    videoDuration = 1.5;  
    tic;  
    while toc < videoDuration
        
        pause(0.1); 
    end
    
    
    pause(0.1);
end

disp('Recording completed.');


