function [model1,inliers,outliers] = fitPlane(ptc, maxdist, normal)

%% Method 3:
% Fit a plane to the data using regression method. 
% normal: fit a plane for a given normal (dim: 1x3) 
% perp: (boolean) the plane has to be perpendicular to the ground
if nargin < 3
    [model1,inlierIndices,outlierIndices] = pcfitplane(ptc, maxdist);
else
    [model1,inlierIndices,outlierIndices] = pcfitplane(ptc, maxdist, normal);
end 
inliers = select(ptc,inlierIndices);
outliers = select(ptc,outlierIndices);


%% Method 2:
% Copyright (c) 2014, Adrien Leygue
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.

% % the mean of the samples belongs to the plane. 
% p = mean(points,1);
% % the samples are reduced
% R = bsxfun(@minus, points, p);
% % computation of the principal direction if the samples cloud
% [V, ~] = eig(R'*R);
% % Extract the output from the eigencevtors. n is the normal vector:
% n = V(:,1);
% z = - p*n; 
% plane = [n; z];
% 
%% Method 1:
% % loss = @(x)sum(dist2plane(x,points));
% % x0 = [1 1 1 1]';
% % plane = fminsearch(loss, x0);

end 

