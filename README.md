
# Conversion from Oracle to MySQL syntax #

## Changes to convert from SQLSERVER to MySQL Syntax ##

1. Replace Number with INT. Remove number size requirement
2. Replace VARCHAR2 with VARCHAR
3. Date insertion replaced with  str_to_date('01-Jun-1998','%d-%M-%Y')
4. Sequence is not supported. The script removes some lines but any usage of sequences to insert in tables must be manually deleted.
5. Ensure the following is set at beginning - SET SQL_SAFE_UPDATES = 0;
6. Manually replace any occurrences of TO_DATE in the right form - -- STR_TO_DATE('13-OCT-2011 10:35:24', '%d-%M-%Y %H:%i:%s')
 -- also remove AM/PM and replace with appropriate military time value


## Replacement Pattern using sed ##

```
cat cis_037_mysql_extra_tables.sql \
    | gsed  's|\(.[0-9]*-\w*-[0-9]*.\)|str_to_date('\\1',\x27%d-%M-%Y\x27)|g' \
    | gsed 's|NUMBER(\w.\w*)|INT|g' | gsed 's|NUMBER(\w*)|INT|g'  \
    | gsed 's|VARCHAR2|VARCHAR|g' \
    | gsed 's|INT;|INT);|g' \
    |  egrep -v '(^CREATE SEQUENCE|^START WITH|^INCREMENT BY)' \
     > temp.sql
```

## Replacment Pattern for converting NUMBER to INT ##

```
echo "(MIN_PRICE    NUMBER(2,0)," | gsed 's|NUMBER(\w,\w*)|INT|g'
echo "(SEQUENCE_NUMBER    NUMBER(5)," | gsed 's|NUMBER(\w*)|INT|g'

```
