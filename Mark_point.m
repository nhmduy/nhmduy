function [v2] = Mark_point(v,Mark)
%% Ham Mark_point co tac dung map cac vi tri cac landmark tu tap 
%  Mark vao tap cac diem v.
%% Input: v tap hop cac diem da cham
%         Mark tap hop cac diem quan trong can map      
%% Output: v2 vecto v co them 1 cot danh dau. 0 la diem binh thuong. 1 la diem dac biet

v2=[v,zeros(size(v,1),1)];
for i=1:size(Mark,1)
    rt=find_p(Mark(i,:),v);
    v2(rt,3)=1;

end

end
function [P]= find_p(M,v)
x=M(1); y=M(2);
ar=find(v(:,1)==x)';
if (isempty(ar)==0)
    d=[];
    for j=1:size(ar,2)
    X=[v(ar(j),1:2);x y];
    d=[d;pdist(X,'euclidean')];
    end

    id=find(d==min(d));
    if(length(id)>1)
    vt=id(1);
    P=ar(vt);
    else
        P=ar(id);
    end
else
    d2=[];
    for j=1:size(v,1)
         X=[v(j,1:2);x y];
         d2=[d2;pdist(X,'euclidean')];
    end
     id=find(d2==min(d2));
     if length(id)>1
         P=id(1);
     else
         P=id;
     end
    
end

end
