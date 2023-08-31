typedef ConfigFile = {
	version:Int,
	rootpath:String,
	instancepath:String,
	assetpath:String,
	instances:Array<Instance>,
	accounts:Array<{
		username:String,
		uuid:String,
		type:String,
		token:String,
	}>,
	activeAccount:Int,
	assetindex:Int,
}
