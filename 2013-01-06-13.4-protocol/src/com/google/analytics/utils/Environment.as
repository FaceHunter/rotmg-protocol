package com.google.analytics.utils
{
[CLASS1581]   import flash.system.Security;
   import flash.system.Capabilities;
   import com.google.analytics.external.HTMLDOM;
   import flash.system.System;
   import com.google.analytics.debug.DebugConfiguration;
   import com.google.analytics.core.ga_internal;

   use namespace ga_internal;

   public class Environment extends Object
   {
      public function Environment(param1:String="", param2:String="", param3:String="", param4:DebugConfiguration=null, param5:HTMLDOM=null) {
         var _loc6_:Version = null;
         super();
         if(param2=="")
         {
            if(isAIR())
            {
               param2="AIR";
            }
            else
            {
               param2="Flash";
            }
         }
         if(param3=="")
         {
            _loc6_=flashVersion;
         }
         else
         {
            _loc6_=Version.fromString(param3);
         }
         _url=param1;
         _appName=param2;
         _appVersion=_loc6_;
         _debug=param4;
         _dom=param5;
         return;
      }

      public function isAIR() : Boolean {
         return playerType=="Desktop"&&Security.sandboxType.toString()=="application";
      }

      public function get screenWidth() : Number {
         return Capabilities.screenResolutionX;
      }

      public function get playerType() : String {
         return Capabilities.playerType;
      }

      private var _dom:HTMLDOM;

      public function get locationSearch() : String {
         var _loc1_:String = _dom.search;
         if(_loc1_)
         {
            return _loc1_;
         }
         return "";
      }

      public function get protocol() : Protocols {
         if(!_protocol)
         {
            _findProtocol();
         }
         return _protocol;
      }

      public function get flashVersion() : Version {
         var _loc1_:Version = Version.fromString(Capabilities.version.split(" ")[1],",");
         return _loc1_;
      }

      public function get userAgent() : UserAgent {
         if(!_userAgent)
         {
            _userAgent=new UserAgent(this,appName,appVersion.toString(4));
         }
         return _userAgent;
      }

      public function get languageEncoding() : String {
         var _loc1_:String = null;
         if(System.useCodePage)
         {
            _loc1_=_dom.characterSet;
            if(_loc1_)
            {
               return _loc1_;
            }
            return "-";
         }
         return "UTF-8";
      }

      public function get appName() : String {
         return _appName;
      }

      private var _appName:String;

      public function get screenColorDepth() : String {
         var _loc1_:String = null;
         switch(null)
         {
            case "bw":
               _loc1_="1";
               break;
            case "gray":
               _loc1_="2";
               break;
            case "color":
         }
         _loc1_="24";
         var _loc2_:String = _dom.colorDepth;
         if(_loc2_)
         {
            _loc1_=_loc2_;
         }
         return _loc1_;
      }

      private function _findProtocol() : void {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc1_:Protocols = Protocols.none;
         if(_url!="")
         {
            _loc4_=_url.toLowerCase();
            _loc5_=_loc4_.substr(0,5);
            switch(_loc5_)
            {
               case "file:":
                  _loc1_=Protocols.file;
                  break;
               case "http:":
                  _loc1_=Protocols.HTTP;
                  break;
               case "https":
                  if(_loc4_.charAt(5)==":")
                  {
                     _loc1_=Protocols.HTTPS;
                  }
                  break;
               default:
                  _protocol=Protocols.none;
            }
         }
         var _loc2_:String = _dom.protocol;
         var _loc3_:String = (_loc1_.toString()+":").toLowerCase();
         if((_loc2_)&&(!(_loc2_==_loc3_))&&(_debug))
         {
            _debug.warning("Protocol mismatch: SWF="+_loc3_+", DOM="+_loc2_);
         }
         _protocol=_loc1_;
         return;
      }

      public function get locationSWFPath() : String {
         return _url;
      }

      private var _debug:DebugConfiguration;

      public function get platform() : String {
         var _loc1_:String = Capabilities.manufacturer;
         return _loc1_.split("Adobe ")[1];
      }

      private var _appVersion:Version;

      public function get operatingSystem() : String {
         return Capabilities.os;
      }

      public function set appName(param1:String) : void {
         _appName=param1;
         userAgent.applicationProduct=param1;
         return;
      }

      ga_internal function set url(param1:String) : void {
         _url=param1;
         return;
      }

      public function get referrer() : String {
         var _loc1_:String = _dom.referrer;
         if(_loc1_)
         {
            return _loc1_;
         }
         if(protocol==Protocols.file)
         {
            return "localhost";
         }
         return "";
      }

      public function isInHTML() : Boolean {
         return Capabilities.playerType=="PlugIn";
      }

      public function get language() : String {
         var _loc1_:String = _dom.language;
         var _loc2_:String = Capabilities.language;
         if(_loc1_)
         {
            if(_loc1_.length>_loc2_.length&&_loc1_.substr(0,_loc2_.length)==_loc2_)
            {
               _loc2_=_loc1_;
            }
         }
         return _loc2_;
      }

      public function get domainName() : String {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:* = 0;
         if(protocol==Protocols.HTTP||protocol==Protocols.HTTPS)
         {
            _loc1_=_url.toLowerCase();
            if(protocol==Protocols.HTTP)
            {
               _loc2_=_loc1_.split("http://").join("");
            }
            else
            {
               if(protocol==Protocols.HTTPS)
               {
                  _loc2_=_loc1_.split("https://").join("");
               }
            }
            _loc3_=_loc2_.indexOf("/");
            if(_loc3_>-1)
            {
               _loc2_=_loc2_.substring(0,_loc3_);
            }
            return _loc2_;
         }
         if(protocol==Protocols.file)
         {
            return "localhost";
         }
         return "";
      }

      private var _url:String;

      public function set userAgent(param1:UserAgent) : void {
         _userAgent=param1;
         return;
      }

      public function set appVersion(param1:Version) : void {
         _appVersion=param1;
         userAgent.applicationVersion=param1.toString(4);
         return;
      }

      private var _protocol:Protocols;

      public function get screenHeight() : Number {
         return Capabilities.screenResolutionY;
      }

      public function get locationPath() : String {
         var _loc1_:String = _dom.pathname;
         if(_loc1_)
         {
            return _loc1_;
         }
         return "";
      }

      private var _userAgent:UserAgent;

      public function get documentTitle() : String {
         var _loc1_:String = _dom.title;
         if(_loc1_)
         {
            return _loc1_;
         }
         return "";
      }

      public function get appVersion() : Version {
         return _appVersion;
      }
   }
[/CLASS]
}