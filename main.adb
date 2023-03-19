with Text_IO; use Text_IO;
with thelib; use thelib;

procedure Main is
   grille : GridState;
   input : String(1..3);
   curr_Player : Character;
begin
   clr_screen;
   Put_Line(Item => "Hello World");
   reset(grille);
   curr_Player := 'O';
   while isFinished(grille) = ' ' loop
      switch_player(curr_Player);
      loop
         clr_screen;
         put_line("==================");
         put_line(" -- " & curr_Player & "'s Turns --");
         put_line("==================");
         draw_grid(grille);
         Get(input);
         Skip_Line;
         exit when updateGrid(grille, input, curr_Player) = True;
      end loop;
   end loop;
   clr_screen;
   draw_grid(grille);
   put_line("================================");
   put_line("-------__ " & curr_Player & " WINS !!! __---------");
   put_line("================================");
end Main;
