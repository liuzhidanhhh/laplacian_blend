function img = expand(img1,w)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[row,col,depth]=size(img1);
roww = 2 * row;
coll = 2 * col;
img1 = double(img1);
img2 = zeros(roww,col);
img = zeros(roww,coll);
%y方向expend
for k=1:depth
    for j=1:col
        for i=1:roww
            if mod(i,2)==0
                if i/2-1 < 1
                    img2(i,j,k)=img1(i/2,j,k)*1/2+img1(i/2+1,j,k)*1/4;
                elseif i/2+1 > row
                    img2(i,j,k)=img1(i/2,j,k)*1/2+img1(i/2-1,j,k)*1/4;
                else
                    img2(i,j,k)=img1(i/2,j,k)*1/2+img1(i/2+1,j,k)*1/4+img1(i/2-1,j,k)*1/4;
                end
            else
                if (i-1)/2 <1
                    img2(i,j,k)=img1((i+1)/2,j,k)*1/2;
                elseif (i+1)/2 > roww
                    img2(i,j,k)=img1((i-1)/2,j,k)*1/2;
                else
                    img2(i,j,k)=img1((i-1)/2,j,k)*1/2+img1((i+1)/2,j,k)*1/2;
                end
            end
        end
    end
end
%x 方向expend
for k=1:depth
    for i = 1:roww
        for j = 1: coll
            if mod(j,2)==0
                if j/2-1 < 1
                    img(i,j,k)=img2(i,j/2,k)*1/2+img2(i,j/2+1,k)*1/4;
                elseif j/2+1 > row
                    img(i,j,k)=img2(i,j/2,k)*1/2+img2(i,j/2-1,k)*1/4;
                else
                    img(i,j,k)=img2(i,j/2,k)*1/2+img2(i,j/2+1,k)*1/4+img2(i,j/2-1,k)*1/4;
                end
            else
                if (j-1)/2 <1
                    img(i,j,k)=img2(i,(j+1)/2,k)*1/2;
                elseif (j+1)/2 > roww
                    img(i,j,k)=img2(i,(j-1)/2,k)*1/2;
                else
                    img(i,j,k)=img2(i,(j+1)/2,k)*1/2+img2(i,(j-1)/2,k)*1/2;
                end
            end 
        end
    end
end
%img=uint8(img);
end

