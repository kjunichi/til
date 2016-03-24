# Check trigger

```sql
SELECT 
 TRIGGER_NAME, STATUS 
FROM 
 USER_TRIGGERS
WHERE 
 TABLE_NAME = 'table_name' ;
```

# Disable trigger

```sql
ALTER TRIGGER trigger_name DISABLE;
```
