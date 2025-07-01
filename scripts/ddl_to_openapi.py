import re
import os
import yaml
from pathlib import Path

# 設定
DDL_PATH = './ddl/all_tables_ddl.sql'
OUTPUT_DIR = './docs/components/schemas'

# 型マッピング
PG_TO_OAPI_TYPE = {
    'bigint': 'integer',
    'smallint': 'integer',
    'integer': 'integer',
    'character varying': 'string',
    'character': 'string',
    'text': 'string',
    'timestamp': 'string',
    'timestamp without time zone': 'string',
    'numeric': 'number',
    'boolean': 'boolean'
}

def map_pg_type_to_openapi(pg_type: str) -> dict:
    pg_type = pg_type.strip().lower()
    for pg, oapi in PG_TO_OAPI_TYPE.items():
        if pg_type.startswith(pg):
            field = {'type': oapi}
            if oapi == 'string' and 'timestamp' in pg_type:
                field['format'] = 'date-time'
            return field
    return {'type': 'string'}  # fallback

def parse_ddl(ddl_text: str) -> dict:
    tables = {}
    current_table = None
    inside_table = False

    for line in ddl_text.splitlines():
        line = line.strip()

        # テーブル開始検出
        if line.upper().startswith('CREATE TABLE'):
            match = re.match(r'CREATE TABLE\s+[\w"]+\.(\w+)\s*\(', line, re.IGNORECASE)
            if match:
                current_table = match.group(1)
                tables[current_table] = {'properties': {}, 'required': []}
                inside_table = True
            continue

        # テーブル終了検出
        if inside_table and line == ');':
            inside_table = False
            current_table = None
            continue

        # カラム定義行のパース
        if inside_table and current_table:
            col_match = re.match(r'"?([\w\d_]+)"?\s+([a-zA-Z0-9_ ]+)(\s+NOT NULL)?', line)
            if col_match:
                col_name, col_type, not_null = col_match.groups()
                col_def = map_pg_type_to_openapi(col_type)
                tables[current_table]['properties'][col_name] = col_def
                if not_null:
                    tables[current_table]['required'].append(col_name)

    return tables

def to_pascal_case(snake_str: str) -> str:
    return ''.join(word[:1].upper() + word[1:] for word in snake_str.split('_'))

def write_schemas(tables: dict):
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    for table_name, schema in tables.items():
        pascal_name = to_pascal_case(table_name)
        filepath = Path(OUTPUT_DIR) / f"{pascal_name}.yaml"
        schema_doc = {
            'type': 'object',
            'properties': schema['properties']
        }
        if schema['required']:
            schema_doc['required'] = schema['required']

        with open(filepath, 'w', encoding='utf-8') as f:
            yaml.dump(schema_doc, f, allow_unicode=True, sort_keys=False)
        print(f"[OK] Generated: {filepath}")

def main():
    with open(DDL_PATH, 'r', encoding='utf-8') as f:
        ddl_text = f.read()

    tables = parse_ddl(ddl_text)
    write_schemas(tables)

if __name__ == '__main__':
    main()
