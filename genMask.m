
% ����һ��ͼ������Matlab��roipoly�������һ������ε�����
im1 = imread('girl.png'); 


% ����roipoly��ͼƬ1��ѡ�����Ȥ����
figure(1);clf; %imshow(im1);
[BW, xi, yi] = roipoly(im1);
save('cat.mat','BW','xi','yi');