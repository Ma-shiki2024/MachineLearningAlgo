DROP TABLE IF EXISTS observation;
DROP TABLE IF EXISTS classification;

CREATE TABLE classification (
    classid BIGINT PRIMARY KEY,  -- Unique identifier classification
    class VARCHAR(10) NOT NULL  -- Classification category
);

CREATE TABLE observation (
    observationid BIGINT PRIMARY KEY,  -- Unique identifier for each observation
    classid BIGINT REFERENCES classification(classid) ON DELETE CASCADE,  -- Links to classification table
    objid VARCHAR(100) NOT NULL,  -- Identifier for celestial objects
    ra DOUBLE PRECISION NOT NULL,  -- Right Ascension
    dec DOUBLE PRECISION NOT NULL,  -- Declination
    u DOUBLE PRECISION NOT NULL,  -- Ultraviolet magnitude
    g DOUBLE PRECISION NOT NULL,  -- Green magnitude
    r DOUBLE PRECISION NOT NULL,  -- Red magnitude
    i DOUBLE PRECISION NOT NULL,  -- Near Infrared magnitude
    z DOUBLE PRECISION NOT NULL,  -- Infrared magnitude
    redshift DOUBLE PRECISION NOT NULL,  -- Redshift value
    run INT NOT NULL,  -- Run number
    rerun INT NOT NULL,  -- Rerun number
    camcol INT NOT NULL,  -- Camera column (1-6)
    field NUMERIC NOT NULL,  -- Change to NUMERIC to support extremely large values
    specobjid VARCHAR(100) NOT NULL,  -- Spectroscopic object identifier
    plate INT NOT NULL,  -- Spectroscopic plate number
    mjd INT NOT NULL,  -- Modified Julian Date of observation
    fiberid INT NOT NULL  -- Fiber ID used in the telescope
);