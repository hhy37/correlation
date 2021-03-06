% ICPDF
%
%   Parameters:
%      x     vector (N x 1)
% 
%   Returns:
%      zp    ICPDF vector (N x 1) of x

function zp = icpdf(x)
  a0=3.3871327179; a1=50.434271938; a2=159.29113202;
  a3=59.109374720; b1=17.895169469; b2=78.757757664;
  b3=67.187563600; c0=1.4234372777; c1=2.7568153900;
  c2=1.3067284816; c3=0.17023821103; d1=0.73700164250;
  d2=0.12021132975; e0=6.6579051150; e1=3.0812263860;
  e2=0.42868294337; e3=0.017337203997;
  f1=0.24197894225; f2=0.012258202635;

  q=x-0.5;
  if abs(q)<=0.425
    r=0.425^2-q.^2;
    zp=q*(((a3*r+a2)*r+a1)*r+a0)/(((b3*r+b2)*r+b1)*r+1);
  else
    if x==0||x==1
      r=27;
    else
      r=sqrt(-log(min([x 1-x])));
      r=min([r 27]);
    end
    if r<=5
      r=r-1.6;
      zp=(((c3*r+c2)*r+c1)*r+c0)/((d2*r+d1)*r+1);
    else
      r=r-5.0;
      zp=(((e3*r+e2)*r+e1)*r+e0)/((f2*r+f1)*r+1);
    end

    if q<0
      zp=-zp;
    end
  end

end
