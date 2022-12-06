p = design(patchMicrostrip, 2.4e9);
show(p)
pattern(p,2.4e9)
pcb = pcbStack(p);
pcb.Layers{2}= dielectric('FR4');
show(p)
b1 = pcb.Layers{1};
b2 = antenna.Rectangle(...
'Length',0.02,...
'Width',0.02,...
'Center',[0, -0.01+0.01],...
'NumPoint',[2 20 2 20]);
b= b1-b2;
show(b);

