package narosucam
{
   import flash.events.Event;
   import com.company.assembleegameclient.appengine.SavedCharacter;


   public class Hoqak extends Event
   {
      {
         var _loc1_:* = false;
         var _loc2_:* = true;
      }

      public function Hoqak(param1:SavedCharacter) {
         var _loc2_:* = true;
         var _loc3_:* = false;
         super(GlobalNotificationActionTE_CHARACTER_EVENT);
         this.savedChar_=param1;
         return;
      }

      public static const GlobalNotificationActionTE_CHARACTER_EVENT:String = "GlobalNotificationActionTE_CHARACTER_EVENT";

      public var savedChar_:SavedCharacter;
   }

}