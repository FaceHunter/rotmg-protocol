package warude
{
[CLASS258]   import flash.display.Sprite;
   import com.company.assembleegameclient.game.Tosahafu;


   public class Panel extends Sprite
   {
      {
         var _loc1_:* = true;
         var _loc2_:* = false;
      }

      public function Panel(param1:Tosahafu) {
         var _loc2_:* = true;
         var _loc3_:* = false;
         super();
         this.gs_=param1;
         return;
      }

      public static const WIDTH:int = 200-12;

      public static const HEIGHT:int = 100-16;

      public var gs_:Tosahafu;

      public function draw() : void {
         return;
      }
   }
[/CLASS]
}