import sys.io.File;
import haxe.Json;
import haxe.io.Path;

using StringTools;

class Main {
	static var args = Sys.args();

	public static function main() {
		var cfg:ConfigFile = Json.parse(File.getContent("~/.local/share/libremc/libremc.json"));
		var profile = args[0];
		var path = Path.join([cfg.instancepath, profile]);
		var instance:Instance = null;
		for (i in cfg.instances)
			if (i.name == profile)
				instance = i;

		var launchcommand = 'java -Xms${instance.minmem}M -Xmx${instance.maxmem}M -Djava.library.path=${Path.addTrailingSlash(instance.nativespath)} -cp "minecraft.jar;lwjgl.jar;lwjgl_util.jar" net.minecraft.client.Minecraft';

		launchcommand += ' --version ${instance.mcversion}';
		launchcommand += ' --gameDir ${instance.instancepath}';
		launchcommand += ' --assetsDir ${cfg.assetpath}';
		launchcommand += ' --assetIndex ${cfg.assetindex}';
		launchcommand += ' --accessToken ${cfg.accounts[cfg.activeAccount].token}';
		launchcommand += ' --uuid ${cfg.accounts[cfg.activeAccount].uuid}';
		launchcommand += ' --userType msa';
		launchcommand += ' --versionType release';
		launchcommand += ' --username ${cfg.accounts[cfg.activeAccount].username}';
	}
}
