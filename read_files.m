clc
clear all
close all

colorFeatures = [];
hogFeatures = [];

% houghFeatures = [];
% surfFeatures = [];

D = '~/Documents/MATLAB/Traffic_images/Train-0-15-29/'

setDir  = fullfile(D);
imds = imageDatastore(setDir,'IncludeSubfolders',true,'LabelSource','foldernames');
%bag = bagOfFeatures(imds);

while hasdata(imds)
    img = read(imds);
    colorFeatures = [colorFeatures; getColorFeature(img)];
    hogFeatures = [hogFeatures; getHogFeature(img)];
    %houghFeatures = [houghFeatures; getHoughFeature(img)];
    %surfFeatures = [surfFeatures; encode(bag, img)];
end

DATASET = [colorFeatures hogFeatures];
classifier = fitcecoc(DATASET, imds.Labels);
save('traffic_sign_classifier.mat', 'classifier');

