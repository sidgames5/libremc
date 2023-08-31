package;

typedef Instance = {
	name:String,
	group:String,
	mcversion:String,
	forgeversion:Null<String>,
	fabricversion:Null<String>,
	quiltversion:Null<String>,
	mods:Array<Mod>,
	nativespath:String,
	instancepath:String,
	minmem:Int,
	maxmem:Int,
	javapath:Null<String>
}
