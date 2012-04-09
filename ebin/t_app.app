{application, t_app,
 	[
 	{description, "F0cking allocator"},
 	{vsn, "999"},
 	{modules, [t_app, t_sup]},
 	{registered, [t_app]},
 	{applications, [kernel, stdlib]}, 
 	{mod,{t_app,[]}} 	
 	]}.