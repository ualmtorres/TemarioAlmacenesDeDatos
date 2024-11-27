-- Tabla --
CREATE TABLE location (
city VARCHAR2(30),
state VARCHAR2(30),
country VARCHAR2(30),
mayor VARCHAR2(30),
governor VARCHAR2(30) );

-- Dimensión Location --

CREATE DIMENSION location_dim
LEVEL city IS location.city
LEVEL state IS location.state
LEVEL country IS location.country

HIERARCHY loc_rollup (
city CHILD OF
state CHILD OF
country )
ATTRIBUTE city DETERMINES (location.mayor)
ATTRIBUTE state DETERMINES (location.governor);

-- Dimensión Time

CREATE DIMENSION Time_dim
LEVEL curDate IS time.curDate
LEVEL month IS time.month
LEVEL quarter IS time.quarter
LEVEL year IS time.year
LEVEL season IS time.season
LEVEL week_num IS time.week_num


HIERARCHY calendar_rollup (
curDate CHILD OF
month CHILD OF
quarter CHILD OF year )

HIERARCHY weekly_rollup (
curDate CHILD OF week_num )

HIERARCHY seasonal_rollup (
curDate CHILD OF season )

ATTRIBUTE curDate DETERMINES (time.dayofweek)
ATTRIBUTE month DETERMINES (time.month_name);
