cam = webcam;

refFrame = snapshot(cam);
refGray = rgb2gray(refFrame);

sensitivity = 30; 

saveDir = 'C:\Users\robot\Desktop\dataset\touch\photos\right bottom(video)';
if ~exist(saveDir, 'dir')
    mkdir(saveDir);
end

while true
    currentFrame = snapshot(cam);
    currentGray = rgb2gray(currentFrame);
    
    frameDiff = abs(refGray - currentGray);
    
    threshDiff = frameDiff > sensitivity;
    
    movement = sum(threshDiff(:));
    
    if movement > 0
        filename = fullfile(saveDir, ['photo_' datestr(now, 'yyyymmdd_HHMMSS') '.jpg']);
        
        imwrite(currentFrame, filename);
        
        disp(['Movement detected! Photo saved as ' filename]);
        
        refGray = currentGray;
        
        pause(2); 
    
    pause(0.1);
end

clear cam;
