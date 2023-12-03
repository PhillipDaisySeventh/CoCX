package classes.Scenes.Combat.SpecialsMagic {

import classes.Scenes.Combat.AbstractMagicSpecial;
import classes.StatusEffects;
import classes.Monster;
import classes.PerkLib;

public class EAspectMetalSkill extends AbstractMagicSpecial {
    public function EAspectMetalSkill() {
        super (
            "Elemental Aspect: Metal",
            "Increases the player's unarmed damage for a few turns.",
            TARGET_SELF,
            TIMING_LASTING,
            [TAG_BUFF, TAG_TIER2],
            StatusEffects.SummonedElementalsMetal
        )
        
    }

    override public function calcCooldown():int {
        return -1;
    }

    override public function calcDuration():int {
        return elementalAspectBaseDuration(StatusEffects.SummonedElementalsMetal) + combat.magic.perkRelatedDurationBoosting();
    }

    override public function get buttonName():String {
		return "Metal E.Asp";
	}

    private function costMultiplier():Number {
		var spellMightMultiplier:Number = 1;
		if (player.hasPerk(PerkLib.EverLastingBuffs)) spellMightMultiplier *= 2;
		if (player.hasPerk(PerkLib.EternalyLastingBuffs)) spellMightMultiplier *= 2;
		return spellMightMultiplier;
	}

    override public function describeEffectVs(target:Monster):String {
		return "Increases unarmed damage by " + numberFormat(getBonus()) + " for " + calcDuration() + " rounds";
    }

    /**
     * Returns the bonus of this ability grants to physical and magical resistance
     * @return stoneskinbonus (Number) - ability defense bonus
     */
    public function getBonus():Number {
        var metalskinbonus:Number = 0;
		metalskinbonus += player.inte * 0.5;
		metalskinbonus += player.wis * 0.5;
		return Math.round(metalskinbonus);
    }

    override public function doEffect(display:Boolean = true):void {
		if (display) outputText("Your elemental encases your body into a layer of flexible yet solid steel. The metal gives strength to your frame, empowering your unarmed strikes.\n\n");
        setDuration();
    }

    override public function durationEnd(display:Boolean = true):void {
        if (display) outputText("<b>Metal Skin effect wore off!</b>\n\n");
    }
}
}  