package com.google.analytics.core
{
[CLASS1563]

   public class ServerOperationMode extends Object
   {
      public function ServerOperationMode(param1:int=0, param2:String="") {
         super();
         _value=param1;
         _name=param2;
         return;
      }

      public static const both:ServerOperationMode = new ServerOperationMode(2,"both");

      public static const remote:ServerOperationMode = new ServerOperationMode(1,"remote");

      public static const local:ServerOperationMode = new ServerOperationMode(0,"local");

      private var _value:int;

      public function valueOf() : int {
         return _value;
      }

      private var _name:String;

      public function toString() : String {
         return _name;
      }
   }
[/CLASS]
}