%% ala
naca = 4412;
wing_root = .6;
wing_tip = .2;
wing_span = 1;
n_chord = 10;
n_span = 30;
wing_sweep = deg2rad(30);
wing_twist = deg2rad(30);

Wing = build_wing(wing_root,wing_tip,wing_span,n_chord,n_span,naca,wing_sweep,wing_twist);

% winglet
w_let_root = wing_tip;
w_let_tip = .1;
height = .6;
Radius = .25;
n_height = 20;
cant = deg2rad(45);
sweep = deg2rad(30);
toe_out = deg2rad(-10);
up = 1; % 1 --> winglet verso l'alto
         % -1 --> winglet verso il basso

W_let = build_winglet(w_let_root,w_let_tip,height,Radius,n_chord,n_height,cant,sweep,toe_out,naca,Wing,wing_twist,up);

W = assemble_wing(Wing,W_let);
surf(W(:,:,1),W(:,:,2),W(:,:,3))
axis equal


p_controllo = collocazione(W);
hold on
plot3(p_controllo(:,:,1),p_controllo(:,:,2),p_controllo(:,:,3),'r*')

[N,T] = versori(W);
% quiver3(p_controllo(:,:,1),p_controllo(:,:,2),p_controllo(:,:,3),N(:,:,1),N(:,:,2),N(:,:,3),'k')
% quiver3(p_controllo(:,:,1),p_controllo(:,:,2),p_controllo(:,:,3),T(:,:,1),T(:,:,2),T(:,:,3),'r')
%%
% V = induced_ring_speed(W(1:2,1:2,:),1,p_controllo;
V_prova = induced_ring_speed(W(1:2,1:2,:),1,[W(1,1,:) W(1,2,:)]);