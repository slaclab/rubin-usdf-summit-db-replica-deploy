
\c exposurelog
ALTER SUBSCRIPTION usdf_exposurelog DISABLE;
ALTER SUBSCRIPTION usdf_exposurelog SET (slot_name=NONE);
DROP SUBSCRIPTION usdf_exposurelog;

\c narrativelog
ALTER SUBSCRIPTION usdf_narrativelog DISABLE;
ALTER SUBSCRIPTION usdf_narrativelog SET (slot_name=NONE);
DROP SUBSCRIPTION usdf_narrativelog;

\c nightreport
ALTER SUBSCRIPTION usdf_nightreport DISABLE;
ALTER SUBSCRIPTION usdf_nightreport SET (slot_name=NONE);
DROP SUBSCRIPTION usdf_nightreport;
