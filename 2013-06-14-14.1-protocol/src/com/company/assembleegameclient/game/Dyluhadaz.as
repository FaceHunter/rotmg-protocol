package com.company.assembleegameclient.game
{
   import __AS3__.vec.Vector;
   import dasefezy.Fucyz;


   public class Dyluhadaz extends Object
   {
      public function Dyluhadaz() {
         var _loc1_:* = true;
         var _loc2_:* = false;
         this.records_=new Vector.<Fucyz>();
         super();
         return;
      }

      public var lastClearTime_:int = -1;

      public var records_:Vector.<Fucyz>;

      public function addRecord(param1:int, param2:Number, param3:Number) : void {
         var _loc9_:* = true;
         var _loc10_:* = false;
         if(this.lastClearTime_<0)
         {
            return;
         }
         var _loc4_:int = this.rivur(param1);
         if(_loc4_<1||_loc4_>10)
         {
            return;
         }
         if(this.records_.length==0)
         {
            this.records_.push(new Fucyz(param1,param2,param3));
            return;
         }
         var _loc5_:Fucyz = this.records_[this.records_.length-1];
         var _loc6_:int = this.rivur(_loc5_.time_);
         if(_loc4_!=_loc6_)
         {
            this.records_.push(new Fucyz(param1,param2,param3));
            return;
         }
         var _loc7_:int = this.nyb(_loc4_,param1);
         var _loc8_:int = this.nyb(_loc4_,_loc5_.time_);
         if(_loc7_<_loc8_)
         {
            _loc5_.time_=param1;
            _loc5_.x_=param2;
            _loc5_.y_=param3;
            return;
         }
         return;
      }

      private function rivur(param1:int) : int {
         var _loc2_:* = true;
         var _loc3_:* = false;
         return (param1-this.lastClearTime_+50)/100;
      }

      private function nyb(param1:int, param2:int) : int {
         return Math.abs(param2-this.lastClearTime_-param1*100);
      }

      public function clear(param1:int) : void {
         var _loc2_:* = true;
         var _loc3_:* = false;
         this.records_.length=0;
         this.lastClearTime_=param1;
         return;
      }
   }

}