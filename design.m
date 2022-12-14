p = design(patchMicrostrip, 2.4e9);
pattern(p,2.4e9)
pcb = pcbStack(p);
pcb.Layers{2}= dielectric('FR4');
b1 = pcb.Layers{1};
b2 = antenna.Rectangle(...
'Length',0.02,...
'Width',0.02,...
'Center',[0, -0.01+0.01],...
'NumPoint',[4 20 4 ...
20]);
b= b1-b2;
pcb.Layers{1}=b;
show(pcb)
pcb.ViaLocations = [-0.025 0 1 3];
pcb.ViaDiameter = 0.001;
s = Sparameters(p,freq,Z0);
w = PCBServices.MayhewWriter;
w.Filename = 'Microstrip-fed-antenna';
c= PCBConnectors.SMAEdge_Samtec;
AM = PCBWriter(p,w,c);
gerberWrite(AM)