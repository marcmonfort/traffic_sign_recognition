clc
clear

colorFeatures = [];
circleFeatures = [];
hogFeatures = [];
surfFeatures = [];

imageLabels = [];

D = '~/Documents/MATLAB/Traffic_images/Train-0-15-29/'

setDir  = fullfile(D);
imds = imageDatastore(setDir,'IncludeSubfolders',true,'LabelSource','foldernames');
bag = bagOfFeatures(imds);

while hasdata(imds)
    img = read(imds);
    
    colorFeatures = [colorFeatures; getColorFeature(img)];
    circleFeatures = [circleFeatures; getCircleFeature(img)];
    hogFeatures = [hogFeatures; getHogFeature(img)];
    surfFeatures = [surfFeatures; encode(bag, img)];
    

end


%imds.Labels = arrayfun(@(x) str2double(char(x)), imds.Labels);
        
        
%imds.Labels = arrayfun(@num2form, imds.Labels);

        
        


%DATASET = table(surfFeatures, imds.Labels);
