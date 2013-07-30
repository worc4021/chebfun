function f = subsasgn(f, index, val)
% SUBSREF   Chebfun subsref.
% ( )
%   F(X) = VAL assigns the values of vector VAL at locations specified in vector
%   X in the chebfun F. size(X,1) should be equal to length(VALS) and size(X,2)
%   should be the number of columns in F. SUBSASGN introduces new break-points
%   in F at points in X that were not before in F.DOMAIN.
%
% .
%   CHEBFUN properties at restricted, and F.PROP = VAL has no effect.
%
% {}
%   F{A,B} = G redefines the CHEBFUN F in the interval [A, B] using G.
%
% See also CHEBFUN/FEVAL, CHEBFUN/GET, CHEBFUN/RESTRICT

% Copyright 2011 by The University of Oxford and The Chebfun Developers.
% See http://www.maths.ox.ac.uk/chebfun/ for Chebfun information.

idx = index(1).subs;

switch index(1).type
    case '.'

        % [TODO]: Restrict access to this.
        f = builtin('subsasgn', f, index, val);

    case '()'

        % Define a point value:
        f = definePoint(f, idx, val);

    case '{}'
        % [TODO]: Implement.

        % Define an interval:
        f = defineInterval(f, idx, val);

    otherwise
        error('CHEBFUN:UnexpectedType',...
            ['??? Unexpected index.type of ' index(1).type]);
end

end