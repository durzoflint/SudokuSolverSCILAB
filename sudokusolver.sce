a={8,0,0, 0,0,0, 0,0,0;
   0,0,3, 6,0,0, 0,0,0;
   0,7,0, 0,9,0, 2,0,0;

   0,5,0, 0,0,7, 0,0,0;
   0,0,0, 0,4,5, 7,0,0;
   0,0,0, 1,0,0, 0,3,0;

   0,0,1, 0,0,0, 0,6,8;
   0,0,8, 5,0,0, 0,1,0;
   0,9,0, 0,0,0, 4,0,0;}
b=a;
function [z]=generate(a,x,y)
    z=%F;
    if x==9 & y==9
        disp(a);
        z=%T;
        return;
    elseif x~=9 & y==9
            x=x+1;
            y=1;
    else
        y=y+1;
    end
    for i=x:1:9
        for j=y:1:9
            x=1;
            y=1;
            if a(i,j)==0
                for k=1:1:9
                    if checkValidity(a,i,j,k)==%T
                        a(i,j)=k;
                        z=%F;
                        z=generate(a,i,j);
                        if(z==%T)
                            return;
                        end
                        a(i,j)=0;
                    end
                    if k==9 & a(i,j)==0
                        return;
                    end
                end
            end
        end
    end
endfunction
function [b]=checkValidity(a,i,j,m)
    b=%T;
    for x=1:1:9
        if a(x,j)==m | a(i,x)==m
            b=%F;
            return;
        end
    end
    p=int((i-1)/3);
    q=int((j-1)/3);
    for x=3*p:1:3*(p+1)-1
        for y=3*q:1:3*(q+1)-1
            if a(x+1,y+1)==m
                b=%F
                return;
            end
        end
    end
endfunction
z=generate(a,1,0);
