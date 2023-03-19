package thelib is
   
   type GridState is array (0..2, 0..2) of Character;
   
   procedure clr_screen;
   
   procedure draw_grid (g : in GridState);
   
   procedure reset (g : in out GridState);
   
   procedure switch_player(p : in out Character);
   
   function isFinished(g : in GridState) return Character;
   
   function updateGrid (g : in out GridState; input : in String; p : in Character) return Boolean;

end thelib;
