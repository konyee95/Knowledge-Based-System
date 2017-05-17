(defrule askPatient
	(LDS)
	=>(printout t " **********Welcome to Lung Diagnosis System**********" crlf)
	(printout t "Do you have any symptoms of these ??" crlf)
	(printout t "Fever? [yes/no] ")
	(assert (fever (read))))

(defrule tuberculosis
	(and
		(persistent_cough yes)
		(constant_fatigue yes)
		(weight_loss yes)
		(lack_of_apetite yes)
		(fever yes)
		(coughing_blood yes)
		(night_sweats yes))
	=> (printout t "Diagnosing a lung disease..............." crlf)
	(printout t "That lung disease could be tuberculosis." crlf))

(defrule pneumonia
	(and
		(cough yes)
		(fever yes)
		(shaking_chills yes)
		(shortness_of_breath yes))
	=> (printout t "Diagnosing a lung disease..............." crlf)
	(printout t "That lung disease could be pneumonia." crlf))

(defrule byssinosis
	(and
		(chest_tightness yes)
		(cough yes)
		(wheezing yes)
		(shortness_of_breath no))
	=> (printout t "Diagnosing a lung disease..............."crlf)
	(printout t "That lung disease could be byssinosis." crlf))

(defrule pertusis
	(and
		(runny_nose yes)
		(mild_fever yes))
	=> 	(printout t "Diagnosing a lung disease..............." crlf)
	(printout t "That lung disease could be pertusis."crlf))

(defrule pneumoconiosis
	(and
		(chronic_cough yes)
		(shortness_of_breath yes))
	=>	(printout t "Diagnosing a lung disease..............." crlf)
	(printout t "That lung disease could be pneumoconiosis."crlf))

(defrule sarcoidosis
	(and
		(dry_cough yes)
		(shortness_of_breath yes)
		(mild_chest_pain yes)
		(scaly_rash yes)
		(fever yes)
		(red_bumps_on_legs yes)
		(sore_eyes yes)
		(swollen_ankles yes))
	=> (printout t "Diagnosing a lung disease..............." crlf)
	(printout t "That lung disease could be sarcoidosis." crlf))

(defrule asbestosis
	(and
		(chest_tightness yes)
		(shortness_of_breath yes)
		(chest_pain yes)
		(lack_of_apetite yes))
	=>	(printout t "Diagnosing a lung disease..............." crlf)
	(printout t "That lung disease could be asbestosis." crlf))

(defrule asthma
	(and
		(wheezing yes)
		(cough yes)
		(chest_tightness yes)
		(shortness_of_breath yes))
	=>	(printout t "Diagnosing a lung disease..............."crlf)
	(printout t "That lung disease could be asthma." crlf))

(defrule bronchiolitis
	(and
		(wheezing yes)
		(fever yes)
		(blue_skin yes)
		(rapid_breath yes))
	=>	(printout t "Diagnosing a lung disease..............."crlf)
	(printout t "That lung disease could be bronchiolitis." crlf))

(defrule influenza
	(and
		(headache yes)
		(fever yes)
		(shaking_chills yes)
		(nasal_congestion yes)
		(runny_nose yes)
		(sore_throat yes))
	=>	(printout t "Diagnosing a lung disease..............."crlf)
	(printout t "That lung disease could be influenza." crlf))

(defrule lung_cancer
	(and
		(cough yes)
		(fever yes)
		(hoarseness yes)
		(chest_pain yes)
		(wheezing yes)
		(weight_loss yes)
		(lack_of_apetite yes)
		(coughing_blood yes)
		(headache yes)
		(shortness_of_breath yes))
	=>	(printout t "Diagnosing a lung disease..............."crlf)
	(printout t "That lung disease could be lung_cancer." crlf))

(defrule MildFeverNormalFever
	(fever yes)
	=>(printout t "Is it mild fever or serious fever? " crlf)
	(printout t " Mild fever? [yes/no] ")
	(assert (mild_fever (read))))

(defrule NormalFever
	(mild_fever no)
	=> (printout t " Serious fever? [yes/no] ")
	(assert (normal_fever (read))))

(defrule RunnyNose
	(or
		(and
			(fever yes)
			(mild_fever yes))
		(and
			(fever yes)
			(normal_fever yes)
			(cough no)
			(wheezing no)
			(headache yes)
			(shaking_chills yes)
			(nasal_congestion yes)))
	=> (printout t "Do you have runny nose? [yes/no] ")
	(assert (runny_nose (read))))

(defrule Cough
	(or
		(and
			(fever no)
			(chest_tightness yes))
		(normal_fever yes))
	=> (printout t "Do you cough? [yes/no] ")
	(assert (cough (read))))

(defrule DryCough
	(and
		(normal_fever yes)
		(cough yes))
	=> (printout t "Is it dry cough, persistent cough or  normal cough ?" crlf)
	(printout t " Dry cough? [yes/no] ")
	(assert (dry_cough (read))))

(defrule NormalCough
	(persistent_cough no)
	=> (printout t " Normal cough ?[yes/no] ")
	(assert (normal_cough (read))))

(defrule PersistentCough
	(and
		(fever yes)
		(cough yes) 
		(dry_cough no))
	=> (printout t " Persistent cough? [yes/no] ")
	(assert (persistent_cough (read))))

(defrule Wheezing
	(or
		(and
			(fever no)
			(chest_tightness yes)
			(cough yes))
		(and
			(normal_fever yes)
			(cough no))
		(and
			(fever yes)
			(cough yes)
			(dry_cough no)
			(persistent_cough no)
			(normal_cough yes)
			(shortness_of_breath yes)
			(shaking_chills no)
			(hoarseness yes)
			(chest_pain yes)))
	=> (printout t "Do you wheezing? [yes/no] ")
	(assert (wheezing (read))))
(defrule ChestTightness
	(fever no)
	=> (printout t "Do you have chest tightness? [yes/no] ")
	(assert (chest_tightness (read))))


(defrule ConstantFatigue
	(persistent_cough yes)
	=> (printout t "Do you have constant fatigue? [yes/no] ")
	(assert (constant_fatigue (read))))

(defrule ShortnessOfBreath
	(or
		(and
			(normal_fever yes)
			(cough yes)
			(dry_cough yes))
		(and
			(normal_fever yes)
			(cough yes)
			(dry_cough no)
			(persistent_cough no)
			(normal_cough yes))
		(and 
			(fever no)
			(chest_tightness yes)
			(cough yes)
			(wheezing yes))
		(and
			(fever no)
			(chest_tightness no)
			(chronic_cough yes)))
	=> (printout t "Do you have shortness of breath? [yes/no] ")
	(assert (shortness_of_breath (read))))

(defrule WeightLoss
	(or
		(and
			(fever yes)
			(dry_cough no)
			(persistent_cough yes)
			(constant_fatigue yes))
		(and
			(fever yes)
			(cough yes)
			(dry_cough no)
			(persistent_cough no)
			(normal_cough yes)
			(shortness_of_breath yes)
			(shaking_chills no)
			(hoarseness yes)
			(chest_pain yes)
			(wheezing yes)))
	=> (printout t "Do you have any weight loss? [yes/no] ")
	(assert (weight_loss (read))))

(defrule LackOfAppetite
	(or 
		(and
			(fever no)
			(chest_tightness yes)
			(cough no)
			(chest_pain yes))
		(and
			(fever yes)
			(cough yes)
			(persistent_cough yes)
			(constant_fatigue yes)
			(weight_loss yes))
		(and
			(fever yes)
			(cough yes)
			(normal_cough yes)
			(shortness_of_breath yes)
			(shaking_chills no)
			(hoarseness yes)
			(chest_pain yes)
			(wheezing yes)
			(weight_loss yes)))
	=> (printout t "Are you lack of appetite? [yes/no] ")
	(assert (lack_of_apetite (read))))

(defrule CoughingBlood
	(or 
		(and
			(fever yes)
			(cough yes)
			(persistent_cough yes)
			(constant_fatigue yes)
			(weight_loss yes)
			(lack_of_apetite yes))
		(and
			(fever yes)
			(cough yes)
			(normal_cough yes)
			(shortness_of_breath yes)
			(shaking_chills no)
			(hoarseness yes)
			(chest_pain yes)
			(wheezing yes)
			(weight_loss yes)
			(lack_of_apetite yes)))
		=>(printout t "Are you coughing blood? [yes/no] ")
		(assert (coughing_blood (read))))

(defrule ChestPain
	(or
		(and
			(fever no)
			(chest_tightness yes)
			(cough no))
		(and
			(fever yes)
			(cough yes)
			(normal_cough yes)
			(shortness_of_breath yes)
			(shaking_chills no)
			(hoarseness yes)))
	=>(printout t "Do you have chest pain? [yes/no] ")
	(assert (chest_pain (read))))

(defrule Headache
	(or
		(and
			(fever yes)
			(normal_fever yes)
			(cough no)
			(wheezing no))
		(and
			(fever yes)
			(cough yes)
			(shortness_of_breath yes)
			(shaking_chills no)
			(hoarseness yes)
			(chest_pain yes)
			(wheezing yes)
			(weight_loss yes)
			(lack_of_apetite yes)
			(coughing_blood yes)))
	=>(printout t "Do you suffering headache? [yes/no] ")
	(assert(headache (read))))

(defrule ShakingChills
	(or
		(and
			(fever yes)
			(normal_cough yes)
			(shortness_of_breath yes))
		(and
			(fever yes)
			(cough no)
			(wheezing no)
			(headache yes)))
	=>(printout t "Do you have shaking chills? [yes/no] ")
	(assert (shaking_chills (read))))

(defrule ChronicCough
	(and
		(fever no)
		(chest_tightness no))
	=>(printout t "Do you have chronic cough? [yes/no] ")
	(assert (chronic_cough (read))))

(defrule MildChestPain
	(and
		(fever yes)
		(dry_cough yes)
		(shortness_of_breath yes))
	=>(printout t "Do you have mild chest pain? [yes/no] ")
	(assert (mild_chest_pain (read))))

(defrule ScalyRash
	(and
		(fever yes)
		(dry_cough yes)
		(shortness_of_breath yes)
		(mild_chest_pain yes))
	=>(printout t "Do you have scaly_rash? [yes/no] ")
	(assert (scaly_rash (read))))

(defrule RedBumpsOnLegs
	(and
		(fever yes)
		(dry_cough yes)
		(shortness_of_breath yes)
		(mild_chest_pain yes)
		(scaly_rash yes))
	=>(printout t "Do you have red bumps on legs? [yes/no] ")
	(assert (red_bumps_on_legs (read))))

(defrule SoreEyes
	(and
		(fever yes)
		(dry_cough yes)
		(shortness_of_breath yes)
		(mild_chest_pain yes)
		(scaly_rash yes)
		(red_bumps_on_legs yes))
	=>(printout t "Do you have sore eyes? [yes/no] ")
	(assert (sore_eyes (read))))

(defrule SwollenAnkles
	(and
		(fever yes)
		(dry_cough yes)
		(shortness_of_breath yes)
		(mild_chest_pain yes)
		(scaly_rash yes)
		(red_bumps_on_legs yes)
		(sore_eyes yes))
	=>(printout t "Do you have swollen ankles? [yes/no] ")
	(assert (swollen_ankles (read))))

(defrule NightSweats
	(and
		(fever yes)
		(persistent_cough yes)
		(constant_fatigue yes)
		(weight_loss yes)
		(lack_of_apetite yes)
		(coughing_blood yes))
	=>(printout t "Do you have night sweats? [yes/no] ")
	(assert (night_sweats (read))))

(defrule Hoarseness
	(and
		(fever yes)
		(normal_cough yes)
		(shortness_of_breath yes)
		(shaking_chills no))
	=>(printout t "Are you suffering hoarseness? [yes/no] ")
	(assert (hoarseness (read))))

(defrule RapidBreath
	(and
		(fever yes)
		(cough no)
		(wheezing yes))
	=>(printout t "Do you have rapid breath? [yes/no] ")
	(assert (rapid_breath (read))))

(defrule BlueSkin
	(and
		(fever yes)
		(cough no)
		(wheezing yes)
		(rapid_breath yes))
	=>(printout t "Do you have blue skin? [yes/no] ")
	(assert (blue_skin (read))))

(defrule NasalCongestion
	(and
		(fever yes)
		(cough no)
		(wheezing no)
		(headache yes)
		(shaking_chills yes))
	=>(printout t "Do you have nasal congestion? [yes/no] ")
	(assert (nasal_congestion (read))))

(defrule SoreThroat
	(and
		(fever yes)
		(cough no)
		(wheezing no)
		(headache yes)
		(shaking_chills yes)
		(nasal_congestion yes)
		(runny_nose yes))
	=>(printout t "Do you have sore throat? [yes/no] ")
	(assert (sore_throat (read))))

(defrule ErrorMessage
	(or
		(runny_nose no)
		(normal_cough no)
		(constant_fatigue no)
		(mild_chest_pain no)
		(scaly_rash no)
		(red_bumps_on_legs no)
		(sore_eyes no)
		(swollen_ankles no)
		(weight_loss no)
		(coughing_blood no)
		(night_sweats no)
		(hoarseness no)
		(headache no)
		(rapid_breath no)
		(blue_skin no)
		(nasal_congestion no)
		(sore_throat no)
		(chronic_cough no)
		(chest_pain no)
		(and
			(fever yes)
			(mild_fever no)
			(normal_fever no))
		(and
			(fever yes)
			(shortness_of_breath no))
		(and
			(fever yes)
			(wheezing no)
			(headache yes)
			(shaking_chills no))
		(and
			(fever yes)
			(cough yes)
			(hoarseness yes)
			(chest_pain yes)
			(wheezing no))
		(and
			(fever no)
			(chest_tightness yes)
			(cough yes)
			(wheezing no))
		(and
			(fever no)
			(chest_tightness no)
			(chronic_cough yes)
			(shortness_of_breath no))
		(and
			(fever no)
			(lack_of_apetite no))
		(and
			(fever yes)
			(lack_of_apetite no)))
	=> (printout t "Sorry, we may not be able to diagnose the disease!!" crlf)
	(printout t "~~~Bye ! Thanks for using this system.~~~" crlf))