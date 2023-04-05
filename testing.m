clear all;
close all;
Ireal = imread('real_1_changed.jpg'); % Real
Iscaned = imread('dupe_1_changed.jpg'); % scaned

%%//Pre-analysis
hsvImageReal = rgb2hsv(Ireal);
hsvImagescaned = rgb2hsv(Iscaned);
figure;
imshow([hsvImageReal(:,:,1) hsvImageReal(:,:,2) hsvImageReal(:,:,3)]);
title('Real pre process');
figure;
imshow([hsvImagescaned(:,:,1) hsvImagescaned(:,:,2) hsvImagescaned(:,:,3)]);
title('scaned');

%%//Initial segmentation
croppedImageReal = hsvImageReal(:,90:95,:);
croppedImagescaned = hsvImagescaned(:,93:98,:);
satThresh = 0.4;
valThresh = 0.3;
BWImageReal = (croppedImageReal(:,:,2) > satThresh & croppedImageReal(:,:,3) < valThresh);
figure;
subplot(1,2,1);
imshow(BWImageReal);
title('Real initial seg');
BWImagescaned = (croppedImagescaned(:,:,2) > satThresh & croppedImagescaned(:,:,3) < valThresh);
subplot(1,2,2);
imshow(BWImagescaned);
title('scaned');