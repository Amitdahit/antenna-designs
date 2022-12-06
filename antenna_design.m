p1= patchMicrostrip;
p1.Length =40e-3;
p1.Width = 30e-3;
p1.Height = 1.57e-3;
p1.GroundPlaneLength = 80e-3;
p1.GroundPlaneWidth = 60e-3;
p1.FeedOffset = [5.5e-3 0];
p1.Substrate = dielectric('Name','material1','EpsilonR',2.33);
pb1 = pcbStack(p1);
pb1.FeedDiameter = sqrt(2)*1e-3;
pb1.FeedViaModel = 'square';
figure
show(pb1)
figure
mesh(pb1,'MaxEdgeLength',.01,'MinEdgeLength',.003)
figure
impedance(pb1,linspace(2.2e9,3e9,20))
figure
pattern(pb1,2.37e9)
figure
pattern(pb1,5e9)