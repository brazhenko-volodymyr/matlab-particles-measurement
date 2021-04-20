 %Read data
filename = 'myExample.xlsx';%read exel file
Size_of_particles = xlsread(filename,'A:A'); %Size of particles
p = xlsread(filename,'B:B'); %Volume of particles befor membrane
p1 = xlsread(filename,'C:C');  %Volume of particles after membrane
 %Solution
b = p - p1; % b = pi- pi'
p12 = -1 * p1;
A = p12(:,ones(1,39));%Create matrix A
ncols = 39;
nrows = 39;
i=0;

for c = 1:ncols
    for r = 1:nrows
      
        if r == c
            A(r,c) = 1-p1(i+1);
            i=i+1;
        else 
        end
     
    end
end

x = linsolve (A,b); % to find X vector
removed_particles = x./p; %the fraction of particles from class i, removed by filtering
beta_ratio = p./(p - x); %Filter beta ratio

T = table(Size_of_particles,p,p1,b, removed_particles, beta_ratio);