%% Problem 4: Image processing and the "unsharp mask"
%img_name = 'testpat_noblur.png';
img_name = 'eye.png';
[u, ublur] = blurImg(img_name, 0.1);close all;

uedges = u - ublur;
usharp = u + uedges;

figure;
subplot(1,2,1);imagesc(u);title('Original image');
caxis([0 1]);colormap(gray);axis equal, axis tight;
subplot(1,2,2);imagesc(usharp);title('Unsharp mask');
caxis([0 1]);colormap(gray);axis equal, axis tight;

%%
% Changing the dt to 0.5
[u, ublur] = blurImg(img_name, 0.5);
figure;
subplot(1,2,1);imagesc(u);title('Original image');
caxis([0 1]);colormap(gray);axis equal, axis tight;
subplot(1,2,2);imagesc(ublur);title('');
caxis([0 1]);colormap(gray);axis equal, axis tight;