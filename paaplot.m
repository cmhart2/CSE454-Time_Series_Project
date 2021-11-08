function paaplot(paa, data, c, i)
    s = size(data);
    t_n = s(2); % number of columns
    ln = t_n/c;
    ln = ceil(ln); % round the value of ln
    paax = []; paay = [];
    z = 1; % index of value we are placing in
    n = 1; % initial segment
    
    paax(z) = 0;
    paay(z) = paa(i,n); % establish first element
    z = z + 1; % increment value index
    
    for n = 2:c
        paax(z) = paax(z-1) + ln;
        paay(z) = paa(i,n-1);
        z = z + 1; % increment value index
    
        paax(z) = paax(z-1);
        paay(z) = paa(i,n);
        z = z + 1; % increment value index
    end
    
    plot(paax, paay);
    hold on
    t = linspace(0, s(2), s(2));
    scatter(t, data(i, :), "filled");
end