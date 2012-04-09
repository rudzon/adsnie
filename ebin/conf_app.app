{application, conf_app,
 	[
 	{description, "configuration"},
 	{vsn, "999"},
 	{modules, [conf_app, conf_sup, conf_srv]},
 	{registered, [conf_app]},
 	{applications, [kernel, stdlib]}, 
 	{mod,{conf_app,[]}} 	
 	]}.