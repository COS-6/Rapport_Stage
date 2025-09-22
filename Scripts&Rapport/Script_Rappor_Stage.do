
*																									              *                    
*				 ███████╗███╗   ██╗███████╗ █████╗ ███████╗                                                       *
*				 ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔════╝                                                       *
*				 ████╗   ██╔██╗ ██║███████╗███████║█████╗                                                         *
*				 ██╔═╝   ██║╚██╗██║╚════██║██╔══██║██╔══╝                                                         *
*			     ███████╗██║ ╚████║███████║██║  ██║███████╗                                                       *
*				╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝                                                        *
*													                                                                                                       

********************************************************************************
*************************** ENSAE - AS2 - 2024-2025 ****************************
** Stage : Rapport de stage                                                   **
** Theme : Construction d'indicateur de l'habitat au Snénégal                 **
** Superviseur: M. Cheikh Lima GUEYE                                          **
** Auteur du dofile : Cheikh Oumar SAKHO                                      **
***************************+++++++++++++++++++++++++****************************
********************************************************************************


clear all
set more off
set maxvar 32000

cd "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Fichiers_Menage&Individus\Fichiers_Menage&Individus"

use "s11_me_SEN2021"

/*==============================================================================
CONFIGURATION ET IMPORTATION DES DONNEES
==============================================================================*/
*global path "https://raw.githubusercontent.com/COS-6/Rapport_Stage/main/EHCVM_2021/Fichiers_Menage&Individus/Fichiers_Menage&Individus"

*use "${path}/s11_me_SEN2021.dta", clear

/*==============================================================================
DETERMINATION DES DIMENTIONONS ET VARIABLES DE L'INDICATEUR ==============================================================================*/

/* ================DIMENSION 1 : CARACTERISTIQUE DE L'HABITAT================ */
rename s11q00 ID_repondant_s11
rename s11q01 type_logement
rename s11q02 nbr_pieces
rename s11q03__1 clim
rename s11q03__2 chauff_eau
rename s11q03__3 ventilateur
rename s11q04 statut_occupation
rename s11q04_autre autre_statut_occupation
rename s11q05 mont_mensuel_loyer_impute_paye
rename s11q06 mont_mensuel_loyer_paye
rename s11q07 loyer_tiers_nonmen_partot
rename s11q08 pers_nonmen_paie_loyer_partot
rename s11q08_autre autr_prs_nomen_paie_loyer_partot
rename s11q09 mont_tot_mensuel_loyer
rename s11q13 raison_nonpropriete_men
rename s11q13_autre autre_raison_nonpropriete_men
rename s11q14 doc_droit_prpriete
rename s11q14_autre autre_doc_droit_prpriete
rename s11q15 credit_logement
rename s11q16 mont_mensuel_credit_logmnt 
rename s11q17 entprse_dans_logement 
rename s11q18 materiau_murs
rename s11q18_autre autre_materiau_murs
rename s11q19 materiau_toit
rename s11q19_autre autre_materiau_toit
rename s11q20 materiau_sol
rename s11q20_autre autre_materiau_sol
rename s11q21 eau_courante
rename s11q22 srvce_eau_dans_loyer
rename s11q23a mont_der_facture_eau 
rename s11q23b periodicite_facture_eau
rename s11q24 achat_eau 
rename s11q25 mont_achat_eau 
rename s11q26a src_eau_boiss_saisn_seche
rename s11q26a_autre autr_src_eau_boiss_saisn_sche
rename s11q26b src_eau_boiss_saisn_plui
rename s11q26b_autre autr_src_eau_boiss_saisn_plui
rename s11q26c satisfait_eau_boiss
rename s11q27 dist_eau_boiss_sais_sche
rename s11q28a min_src_eau_boiss_maison_sche
rename s11q28b_minute min_approv_eau_boiss_sais_sche
rename s11q29 dist_eau_boiss_sais_plui
rename s11q30a min_src_eau_boiss_maison_plui
rename s11q30b_minute min_approv_eau_boiss_sais_plui
rename s11q31 rendre_sain_eau
rename s11q32__1 bouillir_eau 
rename s11q32__2 eau_javel_chlore_comprime
rename s11q32__3 filtrer_linge_eau
rename s11q32__4 filtrer_ceramique_eau
rename s11q32__5 desinfection_solaire_eau
rename s11q32__6 laiss_reposer_eau
rename  s11q32_autre rendre_sain_eau_autre
rename s11q33 connect_reseau_elec
rename s11q34 frais_elec_dans_logmnt
rename s11q35 typ_abonnmnt_elec
rename s11q36a mont_fact_elec
rename s11q36b periodicite_fact
rename s11q37 source_eclairage
rename s11q37_autre autre_source_eclairage
rename s11q40 nbr_moy_coupure_elec
rename s11q41 duree_moy_coupure_elec
rename s11q45 internet
rename s11q46 internet_dans_logmnt 
rename s11q48 type_connexion
rename s11q49 abonnmnt_tele
rename s11q51a mont_abonnmnt_tele
rename s11q51b periodicite_abonnmnt_tele
rename s11q52__1 cuisine_bois_ramasse
rename s11q52__2 cuisine_bois_achete
rename s11q52__3 cuisine_charbon_bois
rename s11q52__4 cuisine_gaz
rename s11q52__5 cuisine_elec
rename s11q52__6 cuisine_petrol_huile
rename s11q52__7 cuisine_excremnt
rename s11q52_autre cuisine_autre
rename s11q53 gestion_ordure
rename s11q53_autre autre_gestion_ordure
rename s11q54 type_sanitaire
rename s11q54_autre autre_type_sanitaire 
rename s11q55 partage_sanitaire
rename s11q57 evacu_excremnt
rename s11q57_autre autre_evacu_excremnt
rename s11q58 debarras_excremnt
rename s11q58_autre autre_debarras_excremnt
rename s11q59 evacu_eau_usee
rename s11q59_autre autre_evacu_eau_usee

save "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Base_Rapport\dimension_logement.dta", replace 

use "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Base_Rapport\dimension_logement.dta", clear 

drop s11q*

save "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Base_Rapport\dimension_logement.dta", replace 

/* ============================DIMENSION 2 : SANTE============================ */
use "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Fichiers_Menage&Individus\Fichiers_Menage&Individus\s03_me_SEN2021.dta", clear

rename s01q00a ID_repondant_s03
rename s03q20 hospitalisation
rename s03q05 consultation
rename s03q06 raison_non_consultation
rename s03q09 satisfait_consultation
rename s03q10__1 etab_sante_sale
rename s03q10__2 etab_long_attent_visit
rename s03q10__3 etab_pers_non_qualifie
rename s03q10__4 service_sante_cher
rename s03q10__5 medecin_absent
rename s03q10__6 traitmnt_inefficace
rename s03q10__7 mauvais_accueil_sante 
rename s03q11 distance_etab_sante
rename s03q32 assurance_maladie
rename s03q34 financeur_assurance_maladie
rename s03q36 prise_charge
rename s03q37__1 prise_charge_mutuel
rename s03q37__2 prise_charge_cons_gratuit
rename s03q37__3 prise_charge_gratos_cible
rename s03q37__4 prise_charge_grtos_total
rename s03q37_autre autre_prise_charge
rename s03q52 vaccin
rename s03q53 raison_non_vaccin

save "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Base_Rapport\dimension_sante.dta", replace

use "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Base_Rapport\dimension_sante.dta", clear

drop s03q*

save "C:\AS2_2024-2025\Semestre 2\Rapport_Stage_2024_2025_Cheikh_Oumar_SAKHO\EHCVM_2021\Base_Rapport\dimension_sante.dta", replace

/* ================DIMENSION 3 : CARACTERISTIQUE DE L'HABITAT================ */
































































































































