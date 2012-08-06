pegWidth = 15;
boardWidth = 4;
mountWidth = 56.5;
hole2Front = 5.6 - boardWidth;
boardFront = 10;
boardHeight = 16+7.5;
fanHoleFromEdge = 5;
fanSize = 50;
screwDiameter = 4;
fanSizeMount = fanSize+10;
hotEndSpaceRadius = 15;
armWidth = 2;

mirror([0,0,1]){
union(){
translate([((mountWidth+(armWidth*2))-fanSizeMount)/2,boardFront-1,boardHeight-(boardWidth*2)]){
difference(){
	difference(){
		difference(){
			hull(){
				cube([fanSizeMount,1,boardWidth*2]);
				translate([0,-14,boardWidth]){
					cube([fanSizeMount,15,boardWidth]);
				}
			}
			translate([3,-14,0]){
				cube([fanSizeMount-6,16,boardWidth]);
			}
		}
		translate([((fanSizeMount-fanSize)/2)+fanHoleFromEdge,-7,boardWidth-1]){
				cylinder(r=screwDiameter/2,h=boardWidth+2,$fs=0.5);
			translate([fanSize-(fanHoleFromEdge*2),0,0]){
					cylinder(r=screwDiameter/2,h=boardWidth+2,$fs=0.5);
			}
		}
	}
	translate([fanSizeMount/2,-27,boardWidth-1]){
		cylinder(r=25,h=boardWidth+2,$fs=0.5);
	}
}
}

		difference(){
			translate([0,boardFront,0]){
				cube([mountWidth+(armWidth*2),boardWidth,boardHeight]);
			}
			translate([(mountWidth+(armWidth*2))/2,boardFront+boardWidth+1,0]){
				rotate([90,0,0]){
					cylinder(r=hotEndSpaceRadius,h=boardWidth+2,$fs=0.5);
				}
			}
		}

		translate([mountWidth+(armWidth*2),0,0]){
			mirror([1,0,0]){
				translate([0,boardFront+boardWidth,0]){
					cube([armWidth,1,boardHeight]);
				}
				hull(){
					translate([0,boardFront+armWidth,0]){
						cube([armWidth,10,boardHeight]);
					}
					translate([0,boardFront+hole2Front+pegWidth-1,0]){
						cube([armWidth,1,pegWidth+3]);
					}
				}
				difference(){
					difference(){
						translate([armWidth,boardFront+hole2Front+pegWidth,pegWidth/2]){
							rotate([90,0,90]){
							  	cylinder(r=pegWidth/2,h=boardWidth-1);
							}	
						}
						translate([boardWidth-1,boardFront+hole2Front+pegWidth,0]){
							cube([boardWidth+2,10,boardHeight]);
						}
					}
					translate([boardWidth-1+armWidth,boardFront+hole2Front+(pegWidth/2),0]){
						rotate([0,0,20]){
							cube([boardWidth+5,pegWidth+5,boardHeight]);
						}
					}
				}
			}
		}

		translate([0,boardFront+boardWidth,0]){
			cube([armWidth,1,boardHeight]);
		}
		hull(){
			translate([0,boardFront+armWidth,0]){
				cube([armWidth,10,boardHeight]);
			}
			translate([0,boardFront+hole2Front+pegWidth-1,0]){
				cube([armWidth,1,pegWidth+3]);
			}
		}
		difference(){
			difference(){
				translate([armWidth,boardFront+hole2Front+pegWidth,pegWidth/2]){
					rotate([90,0,90]){
					  	cylinder(r=pegWidth/2,h=boardWidth-1);
					}	
				}
				translate([boardWidth-1,boardFront+hole2Front+pegWidth,0]){
					cube([boardWidth+2,10,boardHeight]);
				}
			}
			translate([boardWidth-1+armWidth,boardFront+hole2Front+(pegWidth/2),0]){
				rotate([0,0,20]){
					cube([boardWidth+5,pegWidth+5,boardHeight]);
				}
			}
		}
	}
}