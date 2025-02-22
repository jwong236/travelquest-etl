-- Enable pg_trgm extension if needed
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Create function for name-only search
CREATE OR REPLACE FUNCTION fuzzy_search_restaurant_name(
    search_term TEXT
)
RETURNS TABLE (
    id INT,
    name TEXT,
    address TEXT,
    confidence DOUBLE PRECISION
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.id,
        r.name,
        r.address,
        CAST(similarity(r.name, search_term) AS DOUBLE PRECISION) AS confidence
    FROM
        restaurant r
    ORDER BY
        confidence DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;