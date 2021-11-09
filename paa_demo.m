% Copyright and terms of use (DO NOT REMOVE):
% The code is made freely available for non-commercial uses only, provided that the copyright 
% header in each file not be removed, and suitable citation(s) (see below) be made for papers 
% published based on the code.
%
% The code is not optimized for speed, and we are not responsible for any errors that might
% occur in the code.
%
% The copyright of the code is retained by the authors.  By downloading/using this code you
% agree to all the terms stated above.
%
%   Lin, J., Keogh, E., Lonardi, S. & Chiu, B. 
%   "A Symbolic Representation of Time Series, with Implications for Streaming Algorithms." 
%   In proceedings of the 8th ACM SIGMOD Workshop on Research Issues in Data Mining and 
%   Knowledge Discovery. San Diego, CA. June 13, 2003. 
%
%
%   Lin, J., Keogh, E., Patel, P. & Lonardi, S. 
%   "Finding Motifs in Time Series". In proceedings of the 2nd Workshop on Temporal Data Mining, 
%   at the 8th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining. 
%   Edmonton, Alberta, Canada. July 23-26, 2002
%
%
% This code provides a step-by-step demo of SAX (Symbolic Aggregate approXimation).  Press enter
% for the next step.
% 
%   usage: [str] = sax_demo
%          [str] = sax_demo(data)
%
% Copyright (c) 2003, Eamonn Keogh, Jessica Lin, Stefano Lonardi, Pranav Patel, Li Wei. All rights reserved.
%
function paa_demo(data)

    if nargin == 0
        data_len      = 100;
        data = random_walk(data_len);
    else
        data_len      = length(data);
    end
    
    nseg          = 20;

    data_len
    nseg
    
    % nseg must be divisible by data length
    if (mod(data_len, nseg))
        
        disp('nseg must be divisible by the data length. Aborting ');
        return;  
        
    end

    % win_size is the number of data points on the raw time series that will be mapped to a 
    % single symbol
    win_size = floor(data_len/nseg);
    
    data = (data - mean(data))/std(data);

    plot(data);

    
    % special case: no dimensionality reduction
    if data_len == nseg
        PAA = data;
        
    % Convert to PAA.  Note that this line is also in timeseries2symbol, which will be
    % called later.  So it's redundant here and is for the purpose of plotting only.
    else
        PAA = [mean(reshape(data,win_size,nseg))];                     
    end
    
    % plot the PAA segments
    PAA_plot = repmat(PAA', 1, win_size);
    PAA_plot = reshape(PAA_plot', 1, data_len)';
    
    hold on;
    plot(PAA_plot,'r');