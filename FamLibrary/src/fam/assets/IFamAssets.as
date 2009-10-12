package fam.assets
{
	/**
	 * This interface defines the assets that need to be made available for the
	 * embedded assets in the views of this API project.  Because it takes the
	 * compiler a LONG time to embed all of the assets, we're going to play a little
	 * trick here.
	 *
	 * We'll compile all of the assets in a separate module that implements this interface.
	 * At runtime, we'll load in the assets and construct a concrete implementation that
	 * implements this inferace inside of the AssetManager class.  Instead of
	 * embedding images directly in our views then, we'll bind to
	 * { AssetManager.instance.famAssets.something } -- this means that when we compile the API
	 * project we no longer have to compress images.  The images will come from the loaded
	 * assets module that gets compiled separately.
	 *
	 * Note: The Bindable meta-data is only to supress binding warnings.  These
	 * values will not change at runtime.
	 */
	public interface IFamAssets
	{
		[Bindable( "moduleChange" )]
		function get image1():Class;

		[Bindable( "moduleChange" )]
		function get subFamAssets():ISubFamAssets;
	}
}