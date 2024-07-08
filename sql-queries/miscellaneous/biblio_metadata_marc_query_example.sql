/*================================================================
 Query Name  : biblio_metadata_marc_query_example
 Description : Exempel på hur det går att få ut marcdata från 
 databasen
 Author      : Stefan Norinder
 Created     : 2024-07-08
 Updated     : 
 ================================================================*/
SELECT b.title,
    SUBSTRING(EXTRACTVALUE(metadata, '//leader'), 7, 1),
    EXTRACTVALUE(metadata, '//leader'),
    EXTRACTVALUE(
        metadata,
        '//datafield[@tag="866"]/subfield[@code="a"]'
    )
FROM biblio b
    JOIN biblio_metadata i USING (biblionumber)
WHERE trim(
        SUBSTRING(EXTRACTVALUE(metadata, '//leader'), 7, 1)
    ) = 'a' -- TRIM(COALESCE(ExtractValue(metadata, '//datafield[@tag="866"]/subfield[@code="a"]'), '')) <> ''