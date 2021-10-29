SET @i = 0;
SELECT REPEAT( '* ', @i := @i + 1 ) FROM information_schema.tables WHERE @i < 20;

SET @i = 21;
SELECT REPEAT( '* ', @i := @i - 1 ) FROM information_schema.tables WHERE @i > 0;
