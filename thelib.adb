with Text_IO; use Text_IO;
with ada.characters.latin_1; use ada.characters.latin_1;

package body thelib is

   procedure clr_screen is
   begin
      TEXT_IO.PUT (ASCII.ESC & "[" & "1" & ";" & "1" & "f");
   end clr_screen;

   procedure draw_grid (g : in GridState) is
   begin
      for i in GridState'Range(1) loop
         Put_Line("+ - + - + - +");
         for j in GridState'Range(2) loop
            Put("| ");
            if g(i,j) = 'X' then
               put(ESC);
               put("[38;5;196m");
               Put(g(i,j));
               put(ESC);
               put("[0m");
            elsif g(i,j) = 'O' then
               put(ESC);
               put("[38;5;028m");
               Put(g(i,j));
               put(ESC);
               put("[0m");
            else
               Put(" ");
            end if;
            Put(" ");
         end loop;
         Put("|");
         New_Line;
      end loop;
      Put_Line("+ - + - + - +");
   end draw_grid;

   procedure reset (g : in out GridState) is
   begin
      for i in GridState'Range(1) loop
         for j in GridState'Range(2) loop
            g(i,j) := ' ';
         end loop;
      end loop;
   end reset;

   -- 0 if no winner 1 if p1 win and 2 if p2 win
   function isFinished(g : in GridState) return Character is
   begin
      if g(0,0) = g(0,1) and g(0,1) = g(0,2) and g(0,2) /= ' ' then
         return g(0,0);
      elsif g(1,0) = g(1,1) and g(1,1) = g(1,2) and g(1,2) /= ' ' then
         return g(1,0);
      elsif g(2,0) = g(2,1) and g(2,1) = g(2,2) and g(2,2) /= ' ' then
         return g(1,0);

      elsif g(0,0) = g(1,0) and g(1,0) = g(2,0) and g(2,0) /= ' ' then
         return g(0,0);
      elsif g(0,1) = g(1,1) and g(1,1) = g(2,1) and g(2,1) /= ' ' then
         return g(0,1);
      elsif g(0,2) = g(1,2) and g(1,2) = g(2,2) and g(2,2) /= ' ' then
         return g(0,2);

      elsif g(0,0) = g(1,1) and g(1,1) = g(2,2) and g(2,2) /= ' ' then
         return g(0,0);
      elsif g(2,0) = g(1,1) and g(1,1) = g(0,2) and g(0,2) /= ' ' then
         return g(2,0);
      else
        return ' ';
      end if;
   end isFinished;

   procedure switch_player(p : in out Character) is
   begin
      if p = 'X' then
         p := 'O';
      else
         p := 'X';
      end if;
   end switch_player;

   function updateGrid (g : in out GridState; input : in String; p : in Character) return Boolean is
      first : Integer;
      last : Integer;
   begin
      first := Integer'Value ((1 => input(1)));
      last := Integer'Value ((1 =>input(3)));
      if g(first, last) /= ' ' then
         return False;
      end if;
      g(first, last) := p;
      return True;
   end updateGrid;

end thelib;
