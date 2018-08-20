function v = sobol(u)
  %%
  % Get size of initial condition matrix
  [nx ny] = size(u);

  %% 
  % Setup indexing. We don't update the boundary pixels, as they are set by
  % the boundary conditions
  i=2:nx-1;
  j=2:ny-1;
  
  ux = u(i+1,j+1) + 2*u(i+1,j) + u(i+1,j-1) - (u(i-1,j+1) + 2*u(i-1,j) + u(i-1,j-1));
  uy = u(i+1,j+1) + 2*u(i,j+1) + u(i-1,j+1) - (u(i+1,j-1) + 2*u(i,j-1) + u(i-1,j-1));
  v = sqrt(ux.^2 + uy.^2);
end
