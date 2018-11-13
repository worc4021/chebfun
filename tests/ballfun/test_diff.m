function pass = test_diff( pref ) 

% Grab some preferences
if ( nargin == 0 )
    pref = chebfunpref();
end
tol = 1e2*pref.techPrefs.chebfuneps;

% Example 1 : dx
f = ballfun(@(r,lam,th)r.*sin(th).*cos(lam));
g = diff(f,1,"cart");
exact = ballfun(@(r,lam,th)1);
pass(1) = norm(g - exact) < tol;

% Example 2 : dx
f = ballfun(@(r,lam,th)r.^2.*sin(th).^2.*cos(lam).^2);
g = diff(f,1,"cart");
exact = ballfun(@(r,lam,th)2*r.*sin(th).*cos(lam));
pass(2) = norm(g - exact) < tol;

% Example 3 : dy
f = ballfun(@(r,lam,th)r.*sin(th).*sin(lam));
g = diff(f,2,"cart");
exact = ballfun(@(r,lam,th)1);
pass(3) = norm(g - exact) < tol;

% Example 4 : dy
f = ballfun(@(r,lam,th)r.^2.*sin(th).^2.*sin(lam).^2);
g = diff(f,2,"cart");
exact = ballfun(@(r,lam,th)2*r.*sin(th).*sin(lam));
pass(4) = norm(g - exact) < tol;

% Example 5 : dy^2
f = ballfun(@(r,lam,th)r.^2.*sin(th).^2.*sin(lam).^2);
g = diff(f,2,2,"cart");
exact = ballfun(@(r,lam,th)2);
pass(5) = norm(g - exact) < tol;

% Example 6 : dz
f = ballfun(@(r,lam,th)r.*cos(th));
g = diff(f,3,"cart");
exact = ballfun(@(r,lam,th)1);
pass(6) = norm(g - exact) < tol;

% Example 7 : dz^2
f = ballfun(@(r,lam,th)r.^2.*cos(th).^2);
g = diff(f,3,2,"cart");
exact = ballfun(@(r,lam,th)2);
pass(7) = norm(g - exact) < tol;

% Example 8 : dx
f = ballfun(@(x,y,z)x.^2+y.^2+z.^2,'cart');
g = diff(f,1,1,"cart");
exact = ballfun(@(x,y,z)2*x,'cart');
pass(8) = norm(g - exact) < tol;

if (nargout > 0)
    pass = all(pass(:));
end
end
