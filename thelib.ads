package thelib is
   
   type GridState is array (0..2, 0..2) of Integer;
   
   procedure clr_screen;
   
   procedure draw_grid (g : in GridState);
   
   procedure reset (g : in out GridState);

end thelib;
