with Text_IO; use Text_IO;

package body thelib is

   procedure clr_screen is
   begin
      TEXT_IO.PUT (ASCII.ESC & "[" & "1" & ";" & "1" & "f");
   end clr_screen;

   procedure draw_grid (g : in GridState) is
   begin
      for i in GridState'Range(1) loop
         for j in GridState'Range(2) loop
            Put(g(i,j)'Image);
         end loop;
         New_Line;
      end loop;
   end draw_grid;

   procedure reset (g : in out GridState) is
   begin
      for i in GridState'Range(1) loop
         for j in GridState'Range(2) loop
            g(i,j) := 0;
         end loop;
      end loop;
   end reset;

end thelib;
