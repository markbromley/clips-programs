; Plant classifier
; Templates
(deftemplate plant
        (slot growth
                (allowed-symbols nil stunted stunted-root)
                (default nil))
        (slot color
                (allowed-symbols nil pale-yellow purplish)
                (default nil))
        (slot leaf-edges
                (allowed-symbols nil reddish-brown scorched)
                (default nil))
        (slot seeds 
                (allowed-symbols nil shriveled)
                (default nil))
        (slot stalk 
                (allowed-symbols nil spindly)
                (default nil))
        (slot matured 
                (allowed-symbols nil delayed)
                (default nil))
        (slot stems
                (allowed-symbols nil weakened)
                (default nil)))

(deftemplate response
        (slot diagnosis 
                (allowed-symbols nil nitrogen-deficiency 
                phosphorus-deficiency potassium-deficiency)
                (default nil)))
; Initial Facts
(deffacts initial
        (plant (growth stunted-root)
                (color purplish)
                (seeds shriveled)))

; Rules
(defrule stunted-growth
        "Plant with stunted root growth may have nitrogen deficiency"
        (plant (growth stunted))
        =>
        (assert(response (diagnosis nitrogen-deficiency))))

(defrule pale-yellow
        "Plant with pale yellow color may have a nitrogen deficiency"
        (plant (color pale-yellow))
        =>
        (assert(response(diagnosis nitrogen-deficiency))))

(defrule reddish-brown
        "Plant with reddish-brown leaf edges may have a nitrogen deficiency"
        (plant (leaf-edges reddish-brown))
        =>
        (assert(response(diagnosis nitrogen-deficiency))))

(defrule stunted-root-growth
        "Plant with stunted root growth may have phosphorus deficiency"
        (plant (growth stunted-root))
        =>
        (assert(response(diagnosis phosphorus-deficiency))))

(defrule spindly-stalk
        "Plant with a spindly stalk may have a phosphorus deficiency"
        (plant (stalk spindly))
        =>
        (assert(response(diagnosis phosphorus-deficiency))))

(defrule purplish-color
        "Plant with a purplish color may have a phosphorus deficiency"
        (plant (color purplish))
        =>
        (assert(response(diagnosis phosphorus-deficiency))))

(defrule delayed-maturing
        "Plant that has delayed in maturing may have a phosphorus deficiency"
        (plant (matured delayed))
        =>
        (assert(response(diagnosis phosphorus-deficiency))))

(defrule leaf-edges-scorched
        "Plant that has leaf edges scorched may have a potassium deficiency"
        (plant (leaf-edges scorched))
        =>
        (assert(response(diagnosis potassium-deficiency))))

(defrule weakened-stems 
        "Plant that has weakened stems may have a potassium deficiency"
        (plant (stems weakened))
        =>
        (assert(response(diagnosis potassium-deficiency))))

(defrule shriveled-seeds 
        "Plant with shriveled seeds or fruits may have a potassium deficiency"
        (plant (seeds shriveled))
        =>
        (assert(response(diagnosis potassium-deficiency))))