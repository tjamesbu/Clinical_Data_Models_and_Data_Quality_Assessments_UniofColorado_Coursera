WITH diagnoses1 as (
   SELECT DISTINCT m3.SUBJECT_ID as person_id
   FROM mimic3_demo.DIAGNOSES_ICD m3
   ),
   diagnoses2 as (
   SELECT DISTINCT d1.person_id, m3.HADM_ID as visit_occurrence_id
   FROM diagnoses1 d1
   JOIN mimic3_demo.DIAGNOSES_ICD m3 on d1.person_id = m3.SUBJECT_ID
   ),
   CONDITION_OCCURRENCE as (
   SELECT DISTINCT d2.person_id, d2.visit_occurrence_id, m3.ICD9_CODE as condition_source_value
   FROM diagnoses2 d2
   JOIN mimic3_demo.DIAGNOSES_ICD m3 on d2.visit_occurrence_id = m3.HADM_ID
   )
   
SELECT * FROM CONDITION_OCCURRENCE
