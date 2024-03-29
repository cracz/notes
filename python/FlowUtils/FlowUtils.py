class Particle:
    def __init__(self,phi,eta,pT,KT,weight,rapidity,EPDTnMIP,EPDring,ppTag,pmTag,kpTag,kmTag,prTag,deTag,trTag,isInTpcA,isInTpcB,isInEpdA,isInEpdB):
        self.phi = -999.0
        self.eta = -999.0
        self.pT = -999.0
        self.KT = -999.0
        self.weight = -999.0
        self.rapidity = -999.0
        self.EPDTnMIP = -999.0
        self.EPDring = -999
        self.ppTag = False 
        self.pmTag = False 
        self.kpTag = False 
        self.kmTag = False 
        self.prTag = False 
        self.deTag = False 
        self.trTag = False 
        self.isInTpcA = False 
        self.isInTpcB = False 
        self.isInEpdA = False 
        self.isInEpdB = False 

    def reset(self):
        self.phi = -999.0
        self.eta = -999.0
        self.pT = -999.0
        self.KT = -999.0
        self.weight = -999.0
        self.rapidity = -999.0
        self.EPDTnMIP = -999.0
        self.EPDring = -999
        self.ppTag = False 
        self.pmTag = False 
        self.kpTag = False 
        self.kmTag = False 
        self.prTag = False 
        self.deTag = False 
        self.trTag = False 
        self.isInTpcA = False 
        self.isInTpcB = False 
        self.isInEpdA = False 
        self.isInEpdB = False 
