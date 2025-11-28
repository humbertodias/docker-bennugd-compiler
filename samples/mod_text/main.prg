import "mod_key"  
import "mod_video"
import "mod_text"

begin
	 set_mode(640,480,16);	  	
	 
	 write (0,100,130,0, "Hello World");
	          		
	 while (!key(_esc))
	 	   frame;
	 end;
		
end;