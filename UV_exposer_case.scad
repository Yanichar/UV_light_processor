// UV matrix dimensions, mm [length, width, height]
matrix_dimensions = [100, 40, 1];

// main body depth, mm
main_body_depth = 20;

wall_thin = 2;
matrix_margin = 2;

cut_depth = matrix_dimensions[2];
cut_widht = 20;

module main_body()
{
    main_body_length = matrix_dimensions[0] + (wall_thin * 2);
    main_body_width = matrix_dimensions[1] + (wall_thin * 2);
    cube([main_body_length, main_body_width, main_body_depth], center=true);
}

difference()
    {
        main_body();

        // cut matrix
        translate([0, 0, (main_body_depth / 2) - matrix_dimensions[2] / 2 ])
            cube(matrix_dimensions, center=true);

        // cut other
        translate([0, 0, wall_thin])
            cube([matrix_dimensions[0] - matrix_margin,
                  matrix_dimensions[1] - matrix_margin,
                  main_body_depth - matrix_margin], center=true);

        // cut cable
        translate([matrix_dimensions[0] / 2 + wall_thin / 2, 0, (main_body_depth / 2) - cut_depth / 2])
            #cube([wall_thin, cut_widht, cut_depth], center=true);
    }
