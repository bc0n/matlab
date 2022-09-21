function dist = distH(H1, H2)

dist = sqrt( sum((H1(1:3,4)-H2(1:3,4)).^2) );


end