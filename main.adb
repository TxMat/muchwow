with Text_IO; use Text_IO;
with thelib; use thelib;

procedure Main is
   grille : GridState;
begin
   clr_screen;
   Put_Line(Item => "Hello World");
   reset(grille);
   draw_grid(grille);
   null;
end Main;
