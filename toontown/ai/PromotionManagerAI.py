from toontown.coghq import CogDisguiseGlobals
from toontown.suit import SuitDNA


class PromotionManagerAI:
    def __init__(self, air):
        self.air = air

    def recoverMerits(self, toon, suitsKilled, zoneId, multiplier):
        cogMerits = toon.getCogMerits()
        parts = toon.getCogParts()
        completedSuits = (
            CogDisguiseGlobals.isSuitComplete(parts, 0),
            CogDisguiseGlobals.isSuitComplete(parts, 1),
            CogDisguiseGlobals.isSuitComplete(parts, 2),
            CogDisguiseGlobals.isSuitComplete(parts, 3)
        )
        for suit in suitsKilled:
            deptIndex = SuitDNA.suitDepts.index(suit['track'])
            if completedSuits[deptIndex]:
                cogMerits[deptIndex] += (suit['level']/2) * multiplier
        toon.b_setCogMerits(cogMerits)
        return cogMerits