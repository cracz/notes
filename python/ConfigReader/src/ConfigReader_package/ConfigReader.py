import numpy as np

class ConfigReader:

    def __init__(self):

        self._lastKey   = ""
        self._lastValue = ""
        self._errorFlag = False
        self._intValCuts = {
            "fixed_target":   -999,
            "epd_max_weight": -999,
            "nHits":          -999,
            "nHits_dEdx":     -999,
            "min_tracks":     -999,
            "shift_terms":    -999,
            "epdA_inner_row": -999,
            "epdA_outer_row": -999,
            "epdB_inner_row": -999,
            "epdB_outer_row": -999
        }
        self._floatValCuts = {
            "sqrt_s_NN"      : -999.0,
            "order_n"        : -999.0,
            "order_m"        : -999.0,
            "epd_threshold"  : -999.0,
            "nHits_ratio"    : -999.0,
            "dca"            : -999.0,
            "tpc_A_low_eta"  : -999.0,
            "tpc_A_high_eta" : -999.0,
            "tpc_B_low_eta"  : -999.0,
            "tpc_B_high_eta" : -999.0,
            "r_vtx"          : -999.0,
            "z_vtx_low"      : -999.0,
            "z_vtx_high"     : -999.0,
            "y_mid"          : -999.0,
            "nSig_pi_low"    : -999.0,
            "nSig_pi_high"   : -999.0,
            "nSig_ka_low"    : -999.0,
            "nSig_ka_high"   : -999.0,
            "nSig_pr_low"    : -999.0,
            "nSig_pr_high"   : -999.0,
            "z_de_low"       : -999.0,
            "z_de_high"      : -999.0,
            "z_tr_low"       : -999.0,
            "z_tr_high"      : -999.0,
            "m2_pi_low"      : -999.0,
            "m2_pi_high"     : -999.0,
            "m2_ka_low"      : -999.0,
            "m2_ka_high"     : -999.0,
            "m2_de_low"      : -999.0,
            "m2_de_high"     : -999.0,
            "m2_tr_low"      : -999.0,
            "m2_tr_high"     : -999.0,

            "yCM_pid_pi_low"       : -999.0,
            "yCM_pid_pi_high"      : -999.0,
            "yCM_flow_pi_low"      : -999.0,
            "yCM_flow_pi_high"     : -999.0,
            "yCM_ext_flow_pi_low"  : -999.0,
            "yCM_ext_flow_pi_high" : -999.0,

            "yCM_pid_ka_low"       : -999.0,
            "yCM_pid_ka_high"      : -999.0,
            "yCM_flow_ka_low"      : -999.0,
            "yCM_flow_ka_high"     : -999.0,
            "yCM_ext_flow_ka_low"  : -999.0,
            "yCM_ext_flow_ka_high" : -999.0,

            "yCM_pid_pr_low"       : -999.0,
            "yCM_pid_pr_high"      : -999.0,
            "yCM_flow_pr_low"      : -999.0,
            "yCM_flow_pr_high"     : -999.0,
            "yCM_dep_flow_pr_low"  : -999.0,
            "yCM_dep_flow_pr_high" : -999.0,
            "yCM_ext_flow_pr_low"  : -999.0,
            "yCM_ext_flow_pr_high" : -999.0,
            "yCM_sym_flow_pr_low"  : -999.0,
            "yCM_sym_flow_pr_high" : -999.0,
            "yCM_for_flow_pr_low"  : -999.0,
            "yCM_for_flow_pr_high" : -999.0,

            "yCM_pid_de_low"       : -999.0,
            "yCM_pid_de_high"      : -999.0,
            "yCM_flow_de_low"      : -999.0,
            "yCM_flow_de_high"     : -999.0,
            "yCM_ext_flow_de_low"  : -999.0,
            "yCM_ext_flow_de_high" : -999.0,

            "yCM_pid_tr_low"       : -999.0,
            "yCM_pid_tr_high"      : -999.0,
            "yCM_flow_tr_low"      : -999.0,
            "yCM_flow_tr_high"     : -999.0,
            "yCM_ext_flow_tr_low"  : -999.0,
            "yCM_ext_flow_tr_high" : -999.0,

            "pt_pid_pi_low"  : -999.0,
            "pt_pid_pi_high" : -999.0,

            "pt_pid_ka_low"  : -999.0,
            "pt_pid_ka_high" : -999.0,

            "pt_pid_pr_low"        : -999.0,
            "pt_pid_pr_high"       : -999.0,
            "pt_flow_pr_low"       : -999.0,
            "pt_flow_pr_high"      : -999.0,
            "pt_ydep_flow_pr_low"  : -999.0,
            "pt_ydep_flow_pr_high" : -999.0,
            "pt_ext_flow_pr_low"   : -999.0,
            "pt_ext_flow_pr_high"  : -999.0,
            "pt_sym_flow_pr_low"   : -999.0,
            "pt_sym_flow_pr_high"  : -999.0,
            "pt_for_flow_pr_low"   : -999.0,
            "pt_for_flow_pr_high"  : -999.0,

            "pt_pid_de_low"  : -999.0,
            "pt_pid_de_high" : -999.0,

            "pt_pid_tr_low"  : -999.0,
            "pt_pid_tr_high" : -999.0
        }

        self.triggers = np.array([], int)

        #integers
        self.fixed_target   = -999 # boolean: 0 or 1
        self.epd_max_weight = -999
        self.nHits          = -999
        self.nHits_dEdx     = -999
        self.min_tracks     = -999
        self.shift_terms    = -999
        self.epdA_inner_row = -999
        self.epdA_outer_row = -999
        self.epdB_inner_row = -999
        self.epdB_outer_row = -999

        #Floats
        self.sqrt_s_NN      = -999.0
        self.order_n        = -999.0
        self.order_m        = -999.0
        self.epd_threshold  = -999.0
        self.nHits_ratio    = -999.0
        self.dca            = -999.0
        self.tpc_A_low_eta  = -999.0
        self.tpc_A_high_eta = -999.0
        self.tpc_B_low_eta  = -999.0
        self.tpc_B_high_eta = -999.0
        self.r_vtx          = -999.0
        self.z_vtx_low      = -999.0
        self.z_vtx_high     = -999.0
        self.y_mid          = -999.0
        self.nSig_pi_low    = -999.0
        self.nSig_pi_high   = -999.0
        self.nSig_ka_low    = -999.0
        self.nSig_ka_high   = -999.0
        self.nSig_pr_low    = -999.0
        self.nSig_pr_high   = -999.0
        self.z_de_low       = -999.0
        self.z_de_high      = -999.0
        self.z_tr_low       = -999.0
        self.z_tr_high      = -999.0
        self.m2_pi_low      = -999.0
        self.m2_pi_high     = -999.0
        self.m2_ka_low      = -999.0
        self.m2_ka_high     = -999.0
        self.m2_de_low      = -999.0
        self.m2_de_high     = -999.0
        self.m2_tr_low      = -999.0
        self.m2_tr_high     = -999.0

        self.yCM_pid_pi_low       = -999.0
        self.yCM_pid_pi_high      = -999.0
        self.yCM_flow_pi_low      = -999.0
        self.yCM_flow_pi_high     = -999.0
        self.yCM_ext_flow_pi_low  = -999.0
        self.yCM_ext_flow_pi_high = -999.0

        self.yCM_pid_ka_low       = -999.0
        self.yCM_pid_ka_high      = -999.0
        self.yCM_flow_ka_low      = -999.0
        self.yCM_flow_ka_high     = -999.0
        self.yCM_ext_flow_ka_low  = -999.0
        self.yCM_ext_flow_ka_high = -999.0

        self.yCM_pid_pr_low       = -999.0
        self.yCM_pid_pr_high      = -999.0
        self.yCM_flow_pr_low      = -999.0
        self.yCM_flow_pr_high     = -999.0
        self.yCM_dep_flow_pr_low  = -999.0
        self.yCM_dep_flow_pr_high = -999.0
        self.yCM_ext_flow_pr_low  = -999.0
        self.yCM_ext_flow_pr_high = -999.0
        self.yCM_sym_flow_pr_low  = -999.0
        self.yCM_sym_flow_pr_high = -999.0
        self.yCM_for_flow_pr_low  = -999.0
        self.yCM_for_flow_pr_high = -999.0

        self.yCM_pid_de_low       = -999.0
        self.yCM_pid_de_high      = -999.0
        self.yCM_flow_de_low      = -999.0
        self.yCM_flow_de_high     = -999.0
        self.yCM_ext_flow_de_low  = -999.0
        self.yCM_ext_flow_de_high = -999.0

        self.yCM_pid_tr_low       = -999.0
        self.yCM_pid_tr_high      = -999.0
        self.yCM_flow_tr_low      = -999.0
        self.yCM_flow_tr_high     = -999.0
        self.yCM_ext_flow_tr_low  = -999.0
        self.yCM_ext_flow_tr_high = -999.0

        self.pt_pid_pi_low  = -999.0
        self.pt_pid_pi_high = -999.0

        self.pt_pid_ka_low  = -999.0
        self.pt_pid_ka_high = -999.0

        self.pt_pid_pr_low        = -999.0
        self.pt_pid_pr_high       = -999.0
        self.pt_flow_pr_low       = -999.0
        self.pt_flow_pr_high      = -999.0
        self.pt_ydep_flow_pr_low  = -999.0
        self.pt_ydep_flow_pr_high = -999.0
        self.pt_ext_flow_pr_low   = -999.0
        self.pt_ext_flow_pr_high  = -999.0
        self.pt_sym_flow_pr_low   = -999.0
        self.pt_sym_flow_pr_high  = -999.0
        self.pt_for_flow_pr_low   = -999.0
        self.pt_for_flow_pr_high  = -999.0

        self.pt_pid_de_low  = -999.0
        self.pt_pid_de_high = -999.0

        self.pt_pid_tr_low  = -999.0
        self.pt_pid_tr_high = -999.0
    # END __init__()

    def _errorFound(self):
        return self._errorFlag

    def _notifyError(self):
        print("\nThere was an error reading the config file.")
        if self._lastKey != "":
            print("The last key and value read were: ", self._lastKey, ", ", self._lastValue)
        else:
            print("There were no keys or values read successfully.")

    def _setAllCuts(self):
        self.fixed_target   = self._intValCuts["fixed_target"]
        self.epd_max_weight = self._intValCuts["epd_max_weight"]
        self.nHits          = self._intValCuts["nHits"]
        self.nHits_dEdx     = self._intValCuts["nHits_dEdx"]
        self.min_tracks     = self._intValCuts["min_tracks"]
        self.shift_terms    = self._intValCuts["shift_terms"]
        self.epdA_inner_row = self._intValCuts["epdA_inner_row"]
        self.epdA_outer_row = self._intValCuts["epdA_outer_row"]
        self.epdB_inner_row = self._intValCuts["epdB_inner_row"]
        self.epdB_outer_row = self._intValCuts["epdB_outer_row"]

        self.sqrt_s_NN      = self._floatValCuts["sqrt_s_NN"]
        self.order_n        = self._floatValCuts["order_n"]
        self.order_m        = self._floatValCuts["order_m"]
        self.epd_threshold  = self._floatValCuts["epd_threshold"]
        self.nHits_ratio    = self._floatValCuts["nHits_ratio"]
        self.dca            = self._floatValCuts["dca"]
        self.tpc_A_low_eta  = self._floatValCuts["tpc_A_low_eta"]
        self.tpc_A_high_eta = self._floatValCuts["tpc_A_high_eta"]
        self.tpc_B_low_eta  = self._floatValCuts["tpc_B_low_eta"]
        self.tpc_B_high_eta = self._floatValCuts["tpc_B_high_eta"]
        self.r_vtx          = self._floatValCuts["r_vtx"]
        self.z_vtx_low      = self._floatValCuts["z_vtx_low"]
        self.z_vtx_high     = self._floatValCuts["z_vtx_high"]
        self.y_mid          = self._floatValCuts["y_mid"]
        self.nSig_pi_low    = self._floatValCuts["nSig_pi_low"]
        self.nSig_pi_high   = self._floatValCuts["nSig_pi_high"]
        self.nSig_ka_low    = self._floatValCuts["nSig_ka_low"]
        self.nSig_ka_high   = self._floatValCuts["nSig_ka_high"]
        self.nSig_pr_low    = self._floatValCuts["nSig_pr_low"]
        self.nSig_pr_high   = self._floatValCuts["nSig_pr_high"]
        self.z_de_low       = self._floatValCuts["z_de_low"]
        self.z_de_high      = self._floatValCuts["z_de_high"]
        self.z_tr_low       = self._floatValCuts["z_tr_low"]
        self.z_tr_high      = self._floatValCuts["z_tr_high"]
        self.m2_pi_low      = self._floatValCuts["m2_pi_low"]
        self.m2_pi_high     = self._floatValCuts["m2_pi_high"]
        self.m2_ka_low      = self._floatValCuts["m2_ka_low"]
        self.m2_ka_high     = self._floatValCuts["m2_ka_high"]
        self.m2_de_low      = self._floatValCuts["m2_de_low"]
        self.m2_de_high     = self._floatValCuts["m2_de_high"]
        self.m2_tr_low      = self._floatValCuts["m2_tr_low"]
        self.m2_tr_high     = self._floatValCuts["m2_tr_high"]

        self.yCM_pid_pi_low       = self._floatValCuts["yCM_pid_pi_low"]
        self.yCM_pid_pi_high      = self._floatValCuts["yCM_pid_pi_high"]
        self.yCM_flow_pi_low      = self._floatValCuts["yCM_flow_pi_low"]
        self.yCM_flow_pi_high     = self._floatValCuts["yCM_flow_pi_high"]
        self.yCM_ext_flow_pi_low  = self._floatValCuts["yCM_ext_flow_pi_low"]
        self.yCM_ext_flow_pi_high = self._floatValCuts["yCM_ext_flow_pi_high"]

        self.yCM_pid_ka_low       = self._floatValCuts["yCM_pid_ka_low"]
        self.yCM_pid_ka_high      = self._floatValCuts["yCM_pid_ka_high"]
        self.yCM_flow_ka_low      = self._floatValCuts["yCM_flow_ka_low"]
        self.yCM_flow_ka_high     = self._floatValCuts["yCM_flow_ka_high"]
        self.yCM_ext_flow_ka_low  = self._floatValCuts["yCM_ext_flow_ka_low"]
        self.yCM_ext_flow_ka_high = self._floatValCuts["yCM_ext_flow_ka_high"]

        self.yCM_pid_pr_low       = self._floatValCuts["yCM_pid_pr_low"]
        self.yCM_pid_pr_high      = self._floatValCuts["yCM_pid_pr_high"]
        self.yCM_flow_pr_low      = self._floatValCuts["yCM_flow_pr_low"]
        self.yCM_flow_pr_high     = self._floatValCuts["yCM_flow_pr_high"]
        self.yCM_dep_flow_pr_low  = self._floatValCuts["yCM_dep_flow_pr_low"]
        self.yCM_dep_flow_pr_high = self._floatValCuts["yCM_dep_flow_pr_high"]
        self.yCM_ext_flow_pr_low  = self._floatValCuts["yCM_ext_flow_pr_low"]
        self.yCM_ext_flow_pr_high = self._floatValCuts["yCM_ext_flow_pr_high"]
        self.yCM_sym_flow_pr_low  = self._floatValCuts["yCM_sym_flow_pr_low"]
        self.yCM_sym_flow_pr_high = self._floatValCuts["yCM_sym_flow_pr_high"]
        self.yCM_for_flow_pr_low  = self._floatValCuts["yCM_for_flow_pr_low"]
        self.yCM_for_flow_pr_high = self._floatValCuts["yCM_for_flow_pr_high"]

        self.yCM_pid_de_low       = self._floatValCuts["yCM_pid_de_low"]
        self.yCM_pid_de_high      = self._floatValCuts["yCM_pid_de_high"]
        self.yCM_flow_de_low      = self._floatValCuts["yCM_flow_de_low"]
        self.yCM_flow_de_high     = self._floatValCuts["yCM_flow_de_high"]
        self.yCM_ext_flow_de_low  = self._floatValCuts["yCM_ext_flow_de_low"]
        self.yCM_ext_flow_de_high = self._floatValCuts["yCM_ext_flow_de_high"]

        self.yCM_pid_tr_low       = self._floatValCuts["yCM_pid_tr_low"]
        self.yCM_pid_tr_high      = self._floatValCuts["yCM_pid_tr_high"]
        self.yCM_flow_tr_low      = self._floatValCuts["yCM_flow_tr_low"]
        self.yCM_flow_tr_high     = self._floatValCuts["yCM_flow_tr_high"]
        self.yCM_ext_flow_tr_low  = self._floatValCuts["yCM_ext_flow_tr_low"]
        self.yCM_ext_flow_tr_high = self._floatValCuts["yCM_ext_flow_tr_high"]

        self.pt_pid_pi_low  = self._floatValCuts["pt_pid_pi_low"]
        self.pt_pid_pi_high = self._floatValCuts["pt_pid_pi_high"]

        self.pt_pid_ka_low  = self._floatValCuts["pt_pid_ka_low"]
        self.pt_pid_ka_high = self._floatValCuts["pt_pid_ka_high"]

        self.pt_pid_pr_low        = self._floatValCuts["pt_pid_pr_low"]
        self.pt_pid_pr_high       = self._floatValCuts["pt_pid_pr_high"]
        self.pt_flow_pr_low       = self._floatValCuts["pt_flow_pr_low"]
        self.pt_flow_pr_high      = self._floatValCuts["pt_flow_pr_high"]
        self.pt_ydep_flow_pr_low  = self._floatValCuts["pt_ydep_flow_pr_low"]
        self.pt_ydep_flow_pr_high = self._floatValCuts["pt_ydep_flow_pr_high"]
        self.pt_ext_flow_pr_low   = self._floatValCuts["pt_ext_flow_pr_low"]
        self.pt_ext_flow_pr_high  = self._floatValCuts["pt_ext_flow_pr_high"]
        self.pt_sym_flow_pr_low   = self._floatValCuts["pt_sym_flow_pr_low"]
        self.pt_sym_flow_pr_high  = self._floatValCuts["pt_sym_flow_pr_high"]
        self.pt_for_flow_pr_low   = self._floatValCuts["pt_for_flow_pr_low"]
        self.pt_for_flow_pr_high  = self._floatValCuts["pt_for_flow_pr_high"]

        self.pt_pid_de_low  = self._floatValCuts["pt_pid_de_low"]
        self.pt_pid_de_high = self._floatValCuts["pt_pid_de_high"]

        self.pt_pid_tr_low  = self._floatValCuts["pt_pid_tr_low"]
        self.pt_pid_tr_high = self._floatValCuts["pt_pid_tr_high"]

        

    def read(self, fileName):
        with open(fileName) as configFile:
            allLines = configFile.readlines()

            for line in allLines:
                line = line.strip()

                if line == "":
                    continue
                elif line[0] == '#':             # Ignore the commented out stuff
                    continue
                elif line.find("=") == -1:     # Make sure there is even a "="
                    self._errorFlag = True
                    print("Missing '='.")
                    break

                content = line.split("=", 1) # Take off '\n' and then split by '='
                key           = content[0]
                self._lastKey = content[0]
                value           = content[1]
                self._lastValue = content[1]

                if key == "triggers":
                    triggersReadIn = value.split(",")
                    for entry in triggersReadIn:
                        if entry.isdigit():
                            self.triggers = np.append(self.triggers, [int(entry)])
                        else:
                            self._errorFlag = True
                            print("One of the triggers is not a positive integer!")
                            break
                elif key in self._intValCuts and value.isdigit():
                    self._intValCuts[key] = int(value)
                elif key in self._floatValCuts:
                    try: self._floatValCuts[key] = float(value)
                    except ValueError: 
                        self._errorFlag = True
                        print("Error converting a value to float.")
                else:
                    print("Unknown config key: ", key)
                    self._errorFlag = True

            if self._errorFlag:
                self._notifyError()
            else:
                self._setAllCuts()
        # End with open(fileName) as configFile
    # End read()
                


