-- compléter l'entête 
-- ==================

-- NOM    :
-- Prénom :

-- NOM    :
-- Prénom :

-- Groupe :
-- binome :

-- ================================================

-- nettoyer le compte
-- ------------------
--drop type T_un_type force;


-- Définition des types de données
-- -------------------------------



-- TYPE MATIERE
CREATE TYPE Matiere AS OBJECT (
  nom VARCHAR2(20),
  prix NUMBER(4,2),
  masseVolumique NUMBER(4,2)
);
/
SHOW ERRORS


CREATE TYPE Dimension AS OBJECT (
  n NUMBER(2)
);
/
SHOW ERRORS
CREATE TYPE T_Dimension AS TABLE OF Dimension;
/
SHOW ERRORS

-- TYPE Piece de base
CREATE TYPE Base AS OBJECT (
  nom VARCHAR2(20),
  m REF Matiere,
  d T_Dimension
) NOT FINAL;
/
SHOW ERRORS

-- TYPE Liste de pieces (polymorphe)
CREATE TYPE CouplePQ AS OBJECT (
  cpiece REF Base,
  cquantite NUMBER(4,2)
);
/
SHOW ERRORS

CREATE TYPE ListePQ AS TABLE OF CouplePQ;
/
SHOW ERRORS

-- TYPE Piece composites
CREATE TYPE Composite UNDER Base (
  coutAssemblage NUMBER(4,2),
  nb_pieces NUMBER(4,2),
  l ListePQ
);
/
SHOW ERRORS



-- liste de tous les types créés
@liste

-- DROP APRES
DROP TYPE Matiere force;
DROP TYPE Base force;
DROP TYPE ListeP force;
DROP TYPE Composite force;
