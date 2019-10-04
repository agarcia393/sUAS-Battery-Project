Cur_pos=[  0     0     0     0];
new_pos=[];
size_waypoint=size(Waypont);
for i=Ni
    
    if(Ni==size_waypoint(:,1))
        Ni=size_waypoint(:,1);
        new_pos=Waypont(i,:);
        
    elseif ((Cur_pos>=(Waypont(i,:)- waypoint_raduis)) & (Cur_pos<=(Waypont(i,:)+ waypoint_raduis)  ))
        Ni= Ni+1;
        new_pos=Waypont(i+1,:);
    else
        Ni=Ni;
        new_pos=Waypont(i,:);
        
    end
   
end

Dis_posx=new_pos(:,1);
Dis_posy=new_pos(:,2);
Dis_posz=new_pos(:,3);
Dis_posyaw=new_pos(:,4);  


