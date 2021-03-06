% VL_HOMKERMAP Homogeneous kernel map
%   V = VL_HOMKERMAP(X, N) computes a 2*N+1 dimensional approximated
%   kernel map for the Chi2 kernel. X is an array of data points. Each
%   point is expanded into a vector of dimension 2*N+1 and saved to
%   the output V. The expanded feature vectors are stacked along the
%   first dimension, so that the output array V has the same
%   dimensions of the input array X except for the first one, which is
%   2*N+1 times larger.
%
%   The function accepts the following options:
%
%   KChi2::
%     Compute the map for the Chi2 kernel.
%
%   KINTERS::
%     Compute the map for the intersection kernel.
%
%   KL1::
%     Same as KINTERS, but deprecated as the name is not fully
%     accurate.
%
%   KJS::
%     Compute the map for the JS (Jensen-Shannon) kernel.
%
%   Period:: [automatically tuned]
%     Set the period of the kernel specturm. The approximation is
%     based on periodicizing the kernel specturm. If not specified,
%     the period is automatically set based on the heuristic described
%     in [2].
%
%   Window:: [RECTANGULAR]
%     Set the window used to truncate the spectrum before The window
%     can be either RECTANGULAR or UNIFORM window. See [2] and the API
%     documentation for details.
%
%   Gamma:: [1]
%     Set the homogeneity degree of the kernel. The standard kernels
%     are 1-homogeneous, but sometimes smaller values perform better
%     in applications. See [2] for details.
%
%   Example::
%     The following code results in approximatively the same
%     similarities matrices between points X and Y:
%
%       x = rand(10,1) ;
%       y = rand(10,100) ;
%       psix = vl_homkermap(x, 3) ;
%       psiy = vl_homkermap(y, 3) ;
%       figure(1) ; clf ;
%       ker = vl_alldist(x, y, 'kchi2') ;
%       ker_ = psix' * psiy ;
%       plot([ker ; ker_]') ;
%
%   Note::
%     The homogeneous kernels K(X,Y) are normally defined for
%     non-negative data only. VL_HOMKERMAP defines them for both
%     positive and negative data by using the definition
%     SIGN(X)SIGN(Y)K(ABS(X),ABS(Y)) -- note that other extensions are
%     possible as well (see [2]).
%
%   REFERENCES::
%     [1] A. Vedaldi and A. Zisserman
%     `Efficient Additive Kernels via Explicit Feature Maps',
%     Proc. CVPR, 2010.
%
%     [2] A. Vedaldi and A. Zisserman
%     `Efficient Additive Kernels via Explicit Feature Maps',
%     PAMI, 2011 (submitted).
%
%   See also: VL_HELP().

% Authors: Andrea Vedaldi

% AUTORIGHTS
% Copyright (C) 2007-10 Andrea Vedaldi and Brian Fulkerson
%
% This file is part of VLFeat, available under the terms of the
% GNU GPLv2, or (at your option) any later version.
