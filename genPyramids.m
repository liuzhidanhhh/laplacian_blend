
function laps1 = genPyramids(im1, nlvls)

% nargin函数 针对当前正在执行的函数，返回函数调用中给定函数输入参数的数目。该语法仅可在函数体内使用。
if(nargin <= 1)
    nlvls = 4;
end
%低通滤波器
w = [1/8 1/4 1/4 1/4 1/8];

laps1{1,1} = double(im1);
for i = 2 : nlvls
    laps1{i,1} = reduce(laps1{i-1,1},w);
end
laps1{end,2} = laps1{end,1};
for i = nlvls-1 : -1 : 1
    temp = expand(laps1{i+1,1},w);
    expSize = size(temp);
    orgSize = size(laps1{i,1});
    if(expSize(1) < orgSize(1))
        temp = vertcat(temp, temp(end,:,:));
    end
    if(expSize(2) < orgSize(2))
       temp =  horzcat(temp, temp(:,end,:));
    end
    laps1{i,2} = laps1{i,1} - temp;
end
%for i=1:nlvls
%    img=uint8(laps1{i,2});
%    figure,imshow(img);
%end

