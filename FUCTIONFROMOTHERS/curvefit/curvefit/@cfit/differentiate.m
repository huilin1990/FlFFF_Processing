function [deriv1,deriv2] = differentiate(fitobj,x)
%DIFFERENTIATE  Differentiate a fit result object.
%   DERIV1 = DIFFERENTIATE(FITOBJ,X) differentiates the model FITOBJ at the
%   points specified by X and returns the result in DERIV1. FITOBJ is a Fit
%   object generated by the FIT or CFIT function. X is a vector. DERIV1 is
%   a vector with the same size as X. Mathematically speaking, DERIV1 =
%   D(FITOBJ)/D(X).
%
%   [DERIV1,DERIV2] = DIFFERENTIATE(FITOBJ, X) computes the first and
%   second derivatives, DERIV1 and DERIV2 respectively, of the model
%   FITOBJ.
%
%   See also CFIT/INTEGRATE, FIT, CFIT.

%   Copyright 1999-2008 The MathWorks, Inc.
%   $Revision: 1.8.2.9 $  $Date: 2012/08/20 23:54:42 $

if nargin < 2
    error(message('curvefit:differentiate:twoInputsRequired'));
end

if ~isa(fitobj,'cfit')
    error(message('curvefit:differentiate:firstArgInvalid'));
end

derivH = derivexpr(fitobj); % get derivative handle;


if isempty(derivH) % no derivative handle
    % Note that if X was centered and scaled, the feval calls below
    % will take care of the centering and scaling
    ms = eps^(1/3)*max(1,max(abs(x(~isinf(x)))));
    f1 = feval(fitobj,x+ms);
    f2 = feval(fitobj,x-ms);
    deriv1 = (f1-f2)./(2*ms);
    if nargout > 1
        deriv2 = (f1+f2-2*feval(fitobj,x))./(ms*ms);
    end
else % with derivative (either from library or customer)
    % In this case we have to do the centering and scaling here
    x = (x(:)-fitobj.meanx)/fitobj.stdx;
    h = constants(fitobj);
    if nargout == 1
        deriv1 = feval(derivH,fitobj.coeffValues{:},fitobj.probValues{:},h{:},x);
    else
        [deriv1,deriv2] = feval(derivH,fitobj.coeffValues{:},fitobj.probValues{:},h{:},x);
    end
    
    % As we re-scaled X above, we need to adjust the derivatives here
    deriv1 = deriv1 / fitobj.stdx;
    if nargout > 1
        deriv2 = deriv2 / (fitobj.stdx.^2);
    end
end