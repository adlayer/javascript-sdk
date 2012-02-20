import flash.display.Loader;
import flash.net.URLRequest;
import flash.events.*;
import flash.external.*;
import flash.system.*;

Security.allowDomain('*');
var queries:Object = LoaderInfo(this.root.loaderInfo).parameters;
var adId = queries["ad_id"];
var adUrl:URLRequest = new URLRequest(queries["src"]);
//var adUrl:URLRequest = new URLRequest("http://ads.img.globo.com/RealMedia/ads/Creatives/globocom/mrv_029_229_mrv_110201/300x50_slimbanner_globo_mrv.swf/1296583715&lnk=http://www.inpixels.com.br&clickTAG=http://www.inpixels.com.br");
var adLoader:Loader = new Loader();
adLoader.load(adUrl);
adLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loaded);

function loaded (e:Event):void{
	stage.align = StageAlign.TOP_LEFT;
	stage.scaleMode = StageScaleMode.NO_SCALE;
	stage.stageWidth = adLoader.contentLoaderInfo.width;
	stage.stageHeight = adLoader.contentLoaderInfo.height;
	var flashVersion = adLoader.contentLoaderInfo.swfVersion;
	//var methodName:String = 'console.log';
	var methodName:String = 'adlayer.getAd("'+adId+'").emit';
	ExternalInterface.call(methodName,'load');
	
	//var fnName:String = "loadAd"
	//ExternalInterface.addCallback(fnName,function(){
		//ExternalInterface.call(methodName,"carregar")
	//})
}
stage.addChild(adLoader);