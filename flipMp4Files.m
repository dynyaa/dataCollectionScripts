function flipMp4Files(folderPath)
    files = dir(fullfile(folderPath, '*.mp4'));
    
    % Process each mp4 file
    for i = 1:length(files)
        inputFile = fullfile(folderPath, files(i).name);
        [~, name, ext] = fileparts(inputFile);
        outputFile = fullfile(folderPath, ['flipped_' name ext]);
        
        vidReader = VideoReader(inputFile);
        
        vidWriter = VideoWriter(outputFile, 'MPEG-4');
        open(vidWriter);
        
        while hasFrame(vidReader)
            frame = readFrame(vidReader);
            flippedFrame = flip(frame, 2); 
            writeVideo(vidWriter, flippedFrame);
        end
        
        close(vidWriter);
        
        disp([files(i).name ' flipped and saved as flipped_' files(i).name]);
    end
end
