function [Ix,Iy] = vl_grad(I,varargin) ;
% VL_GRAD Compute the gradient of an image
%   [IX,IY] = VL_GRAD(I) returns the gradient components IX,IY of the
%   2-D discrete function I. I must be a two-dimensional
%   matrix. VL_GRAD() computes the gradient by using finite
%   differences; specifically, it uses central differences for all but
%   the boundary pixels, for which it uses forward/backward
%   differences as appropriate.
%
%   Remark::
%     VL_GRAD() is similar to the MATLAB built-in GRADIENT() function,
%     excepts that it supports different gradient approximations.
%
%   VL_GRAD() accepts the following options:
%
%   Type:: central
%     Specify which type of finite differences to use for all but the
%     boundary samples. TYPE can be one of 'central', 'forward', or
%     'backward'.
%
%   See also: GRADIENT(), VL_HELP().

% Authors: Andrea Vedaldi

% AUTORIGHTS
% Copyright (C) 2007-10 Andrea Vedaldi and Brian Fulkerson
%
% This file is part of VLFeat, available under the terms of the
% GNU GPLv2, or (at your option) any later version.

opts.type = 'central' ;
opts = vl_argparse(opts, varargin) ;

switch lower(opts.type)
  case 'central'
    Ix = [ I(:,2)-I(:,1) , ...
           0.5*(I(:,3:end)-I(:,1:end-2)) , I(:,end)-I(:,end-1) ] ;
    Iy = [ I(2,:)-I(1,:) ; ...
           0.5*(I(3:end,:)-I(1:end-2,:)) ; I(end,:)-I(end-1,:) ] ;
  case 'forward'
    Ix = [ I(:,2:end)-I(:,1:end-1) , I(:,end)-I(:,end-1) ] ;
    Iy = [ I(2:end,:)-I(1:end-1,:) ; I(end,:)-I(end-1,:) ] ;
  case 'backward'
    Ix = [ I(:,2)-I(:,1) , I(:,2:end)-I(:,1:end-1)] ;
    Iy = [ I(2,:)-I(1,:) ; I(2:end,:)-I(1:end-1,:)] ;
  otherwise
    error('Difference type ''%s'' unknown.', opts.type) ;
end
