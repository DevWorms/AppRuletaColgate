if ( string.sub( system.getInfo("model"), 1, 4 ) == "iPad" ) then

	print("ipad")

   application =
   {
      content =
      {
         width = 660,
         height = 1024,
         scale = "zoomStretch",
         xAlign = "center",
         yAlign = "center",
         imageSuffix =
         {
            ["@2x"] = 1.5,
            ["@4x"] = 3.0,
         },
      },
   }
else 
	application =
	{
        content =
        {	
            width = 600,
            height = 1024,
            scale = "zoomStretch",
            fps = 35,
        },
	}
end




