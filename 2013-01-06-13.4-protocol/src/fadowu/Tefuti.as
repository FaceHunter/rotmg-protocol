package fadowu
{
[CLASS1450]   import flash.utils.IDataOutput;


   public class Tefuti extends Jelo
   {
      public function Tefuti(param1:uint, param2:Function) {
         var _loc3_:* = false;
         var _loc4_:* = true;
         super(param1,param2);
         return;
      }

      public var guildName_:String;

      override public function writeToOutput(param1:IDataOutput) : void {
         var _loc2_:* = true;
         var _loc3_:* = false;
         param1.writeUTF(this.guildName_);
         return;
      }

      override public function toString() : String {
         return formatToString("JOINGUILD","guildName_");
      }
   }
[/CLASS]
}