% Curve Fitting Toolbox
% Version 3.3.1 (R2013a) 13-Feb-2013 
%
% GUIs.
%   cftool             - Curve Fitting Tool.
%   splinetool         - Spline Tool.
%
% Preprocessing.
%   datastats          - Data statistics.
%   excludedata        - Mark some data to be excluded.
%   smooth             - Smooth data.
%   prepareSurfaceData - Prepare data inputs for surface fitting.
%
% Fitting curves and surfaces.
%   fit                - Fit curve or surface to data.
%   fittype            - Construct fittype object.
%   fitoptions         - Create or modify fit options.
%   cfit               - Result of curve fitting.
%   sfit               - Result of surface fitting.
%
% Fitting splines to data.
%   csape              - Cubic spline interpolation with end-conditions.
%   csapi              - Cubic spline interpolation.
%   csaps              - Cubic smoothing spline.
%   cscvn              - 'Natural' or periodic cubic spline curve.
%   spap2              - Least squares spline approximation.
%   spapi              - Spline interpolation.
%   spaps              - Smoothing spline.
%   tpaps              - Thin-plate smoothing spline.
%
% Constructing splines.
%   ppmak              - Construct spline in ppform.
%   spmak              - Construct spline in B-form.
%   rpmak              - Construct rational spline in rpform.
%   rsmak              - Construct rational spline in rBform.
%
% See also SPLINES.

%   Copyright 2001-2013 The MathWorks, Inc. 
%   Generated from Contents.m_template revision 1.13.4.6  $Date: 2012/08/20 23:53:41 $

% Utilities
%   cfInterrupt        - Interrupt the fitting process
%   cfalslnsh          - CFALSLNSH
%   cflscftsh          - CFLSCFTSH
%   getfittypes        - is a helper function for the Curve Fitting Toolbox
%   isfitoptions       - True for fitoptions object.

% To be removed in a future release
%   cflibhelp          - Help on fit types in Curve Fitting Library.
