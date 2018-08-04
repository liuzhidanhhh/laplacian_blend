function img = reduce(img1,w)
%
%   此处显示详细说明
[row,col,depth]=size(img1);
roww=floor(row/2);
coll=floor(col/2);
img2=zeros(row,coll);
img1=double(img1);
img=zeros(roww,coll);
%x方向的reduce
for k=1:depth
    for i=1:row
        for j = 1:coll
            if 2*j-2<1
                img2(i,j,k)=sum(img1(i,2*j-1:2*j+2,k).*w(2:5));
            elseif 2*j+1>col
                img2(i,j,k)=sum(img1(i,2*j-2:2*j,k).*w(1:3));
            elseif 2*j+2>col 
                img2(i,j,k)=sum(img1(i,2*j-2:2*j+1,k).*w(1:4));
            else
                img2(i,j,k)=sum(img1(i,2*j-2:2*j+2,k).*w);
            end
        end
    end
end

%y方向的ruduce
for k=1:depth
    for j=1:coll
        for i = 1:roww
            if 2*i-2<1
                img(i,j,k)=sum(img2(2*i-1:2*i+2,j,k).*(w(2:5))');
            elseif 2*i+1>roww
                img(i,j,k)=sum(img2(2*i-2:2*i,j,k).*(w(1:3))');
            elseif 2*i+2>roww 
                img(i,j,k)=sum(img2(2*i-2:2*i+1,j,k).*(w(1:4))');
            else
                img(i,j,k)=sum(img2(2*i-2:2*i+2,j,k).*w');
            end
        end
    end
end
%img=uint8(img);
end

