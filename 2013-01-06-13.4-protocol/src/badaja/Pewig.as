package badaja
{
[CLASS1489]   import mywyvuryw.Daqu;
   import flash.utils.IDataInput;


   public class Pewig extends Daqu
   {
      public function Pewig(param1:uint, param2:Function) {
         var _loc3_:* = false;
         var _loc4_:* = true;
         super(param1,param2);
         return;
      }

      public var bycyl:int;

      override public function parseFromInput(param1:IDataInput) : void {
         var _loc2_:* = true;
         var _loc3_:* = false;
         this.bycyl=param1.readInt();
         return;
      }
   }
[/CLASS]
}