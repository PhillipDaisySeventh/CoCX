/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
    import classes.PerkClass;
    import classes.PerkType;
import classes.Player;

public class RaijuCathodeMutation extends PerkType
    {
        //v1 contains the mutation tier
        override public function desc(params:PerkClass = null):String {
            var descS:String = "";
            var pTier:int = player.perkv1(IMutationsLib.RaijuCathodeIM);
            if (pTier == 1){
                descS = "Your Raiju Cathode provides an increase in speed by 10% and increase lust damage from weapons and natural weapons by 50%";
            }
            if (pTier == 2){
                descS = "Your Raiju Cathode provides an increase in speed by 25% and increase lust damage from weapons and natural weapons by 100%, All lightning damage is increased by 20%";
            }
            if (pTier == 3){
                descS = "Your Raiju Cathode provides an increase in speed by 50% and increase lust damage from weapons and natural weapons by 200%, All lightning damage is increased by 20%, Supercharged bonuses are twice as strong";
            }
            if (descS != "")descS += ".";
            return descS;
        }

        //Name. Need it say more?
        override public function name(params:PerkClass=null):String {
            var sufval:String;
            switch (player.perkv1(IMutationsLib.RaijuCathodeIM)){
                case 2:
                    sufval = "(Primitive)";
                    break;
                case 3:
                    sufval = "(Evolved)";
                    break;
                default:
                    sufval = "";
            }
            return "Raiju Cathode" + sufval;
        }

        //Mutation Requirements
        public static function pReqs(pTier:int = 0):void{
            try{
                //This helps keep the requirements output clean.
                IMutationsLib.RaijuCathodeIM.requirements = [];
                if (pTier == 0){
                    IMutationsLib.RaijuCathodeIM.requirePeripheralNervSysMutationSlot()
                    .requireCustomFunction(function (player:Player):Boolean {
                        return player.raijuScore() >= 10;
                    }, "Raiju race");
                }
                else{
                    var pLvl:int = pTier * 30;
                    IMutationsLib.RaijuCathodeIM.requireLevel(pLvl);
                }
            }catch(e:Error){
                trace(e.getStackTrace());
            }
        }

        //Perk Max Level
        //Ignore the variable. Reusing the function that triggers this elsewhere and they need the int.
        public static function perkLvl(useless:int = 0):int{
            return 3;
        }

        //Mutations Buffs
        public function pBuffs(pTier:int = 1):Object{
            var pBuffs:Object = {};
            if (pTier == 1) pBuffs['spe.mult'] = 0.1;
            else if (pTier == 2) pBuffs['spe.mult'] = 0.25;
            else if (pTier == 3) pBuffs['spe.mult'] = 0.5;
            return pBuffs;
        }

        public function RaijuCathodeMutation() {
            super("Raiju Cathode IM", "Raiju Cathode", ".");
        }

        override public function keepOnAscension(respec:Boolean = false):Boolean {
            return true;
        }
    }
}