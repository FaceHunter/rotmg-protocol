package sowojotac
{
[CLASS1616]

   public class Gafo extends Object
   {
      public function Gafo() {
         var _loc1_:* = false;
         var _loc2_:* = true;
         super();
         return;
      }

      public static function toArray(param1:Object) : Array {
         var _loc6_:* = false;
         var _loc7_:* = true;
         var _loc3_:Object = null;
         var _loc2_:Array = [];
         for each (_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
   }
[/CLASS]
}