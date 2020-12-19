

radius = 20;
angles = [45, 290];
width = 2;
fn = 24;

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 24) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
}



module rounded_square(w,h, radius, center=true, fn=24)
{
	hull()
    {
        points = [[0,0],[ w,0],[w,h],[0,h]]; 
        polygon(points,center,$fn=fn);
        
		for (p = points)
        {
			translate(p)
				circle(r=radius,$fn=fn);
		}
        
        
	}
}

rounded_square(10,20, radius=2, fn=24);

//linear_extrude(1) arc(radius, angles, width);