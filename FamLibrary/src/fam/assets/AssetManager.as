package fam.assets
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;
	import mx.events.ModuleEvent;
	import mx.modules.ModuleLoader;

	public class AssetManager extends EventDispatcher
	{
		/**
		 * This is the interface that defines all of the assets that need
		 * to be avaiable to embed images for.  We use an interface here to avoid
		 * embedding the images directly in this API project.  At runtime, this
		 * interface is set to a concrete implementation that includes the embedded
		 * images (the FamModule Flex project provides the [Embed] functionality.
		 */
		[Bindable( "assetManagerFamAssetsChanged" )]
		public var famAssets:IFamAssets;

		//************************************************************
		// Module Loading
		//************************************************************

		private var _moduleLoader:ModuleLoader = new ModuleLoader();
		public function get moduleLoader():ModuleLoader { return _moduleLoader; }

		public var showModuleLoaderError:Boolean = true;

		/**
		 * Load the embedded assets from the OfficeAssets module.
		 */
		public function load(url:String):void
		{
			_moduleLoader.addEventListener( ModuleEvent.READY, onAssetsModuleLoaded );
			_moduleLoader.addEventListener( ModuleEvent.ERROR, onAssetsModuleError );
			_moduleLoader.url = url;
			_moduleLoader.loadModule();
		}

		protected function removeModuleLoaderListeners():void
		{
			_moduleLoader.removeEventListener( ModuleEvent.READY, onAssetsModuleLoaded );
			_moduleLoader.removeEventListener( ModuleEvent.ERROR, onAssetsModuleError );
		}

		protected function onAssetsModuleLoaded( event:ModuleEvent ):void
		{
			famAssets = IFamAssets( event.module.factory.create() );
			dispatchEvent(new Event("assetManagerFamAssetsChanged"));

			removeModuleLoaderListeners();
		}

		protected function onAssetsModuleError( event:ModuleEvent ):void
		{
			if (showModuleLoaderError)
			{
				Alert.show( "Could not load assets module..." + event.toString(), "ERROR" );
			}

			removeModuleLoaderListeners();
		}
		
		private static const _instance:AssetManager = new AssetManager();
		public static function get instance():AssetManager { return _instance; };
	}
}