package lyfer
{
[CLASS722]   import syfuqycy.Gyz;
   import vofepimy.Kipupaqy;
   import leselo.Account;
   import kyhawibyc.Fapu;
   import zib.Bebemed;
   import qiwyz.Bozakehy;


   public class Doru extends Gyz implements Kipupaqy
   {
      public function Doru() {
         var _loc1_:* = false;
         var _loc2_:* = true;
         super();
         return;
      }

      public var account:Account;

      public var data:Fapu;

      public var lowemycu:Bebemed;

      public var client:Bozakehy;

      override protected function startTask() : void {
         var _loc1_:* = true;
         var _loc2_:* = false;
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/steamworks/link",this.winy());
         return;
      }

      private function winy() : Object {
         var _loc2_:* = false;
         var _loc3_:* = true;
         var _loc1_:Object = this.lowemycu.nin();
         _loc1_.guid=this.data.username;
         _loc1_.password=this.data.password;
         return _loc1_;
      }

      private function onComplete(param1:Boolean, param2:*) : void {
         var _loc3_:* = true;
         var _loc4_:* = false;
         pylebodyq(param1,param2);
         return;
      }

      private function nemyh(param1:String) : void {
         var _loc3_:* = true;
         var _loc4_:* = false;
         var _loc2_:XML = new XML(param1);
         this.account.fuv(_loc2_.GUID,_loc2_.Secret);
         this.account.kowumaj(_loc2_.PlatformToken);
         return;
      }
   }
[/CLASS]
}