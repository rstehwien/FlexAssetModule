package fam.assets
{
	public class SubFamAssets implements ISubFamAssets
	{
		[Embed( "/../assets/103px-Hamsa_hand.svg.png" )]
		private const _image1:Class;
		public function get image1():Class
		{
			return _image1;
		}
	}
}