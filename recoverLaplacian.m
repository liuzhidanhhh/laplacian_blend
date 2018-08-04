function [img] = recoverLaplacian(lapsBlend)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[level,x]=size(lapsBlend);
w=[1/8 1/4 1/4 1/4 1/8];
img=lapsBlend{level};
for i = level-1:-1:1
    imA = expand(img,w);
    imB = lapsBlend{i};
    szA = size(imA); if(size(imA,3) == 1), szA(3) = 1; end
    szB = size(imB); if(size(imB,3) == 1), szB(3) = 1; end
    sz = max([szA(:) szB(:)],[],2);
    if(szA(1) < sz(1))
        imA_pad = vertcat(imA, zeros(sz(1)-szA(1), szA(2), szA(3)));
    else
        imA_pad = imA;
    end
    if(szA(2) < sz(2))
        imA_pad =  horzcat(imA_pad, zeros(size(imA_pad,1), sz(2) - szA(2), szA(3)));
    end
    if(szA(3) < sz(3))
        imA_pad = repmat(imA_pad,[1 1 3]);
    end
    if(szB(1) < sz(1))
        imB_pad = vertcat(imB, zeros(sz(1)-szB(1), szB(2), szB(3)));
    else
        imB_pad = imB;
    end
    if(szB(2) < sz(2))
        imB_pad =  horzcat(imB_pad, zeros(size(imB_pad,1), sz(2) - szB(2), szB(3)));
    end
    if(szB(3) < sz(3))
        imB_pad = repmat(imB_pad,[1 1 3]);
    end
    img=imA_pad+imB_pad;
end
end

