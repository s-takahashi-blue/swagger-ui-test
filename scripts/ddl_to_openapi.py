import re
import sys

def pg_type_to_openapi(pg_type):
    # PostgreSQL型→OpenAPI型の簡易マッピング
    t = pg_type.lower()
    if t.startswith('bigint') or t.startswith('integer'):
        return {'type': 'integer', 'format': 'int64'}
    if t.startswith('smallint'):
        return {'type': 'integer', 'format': 'int32'}
    if t.startswith('character varying') or t.startswith('varchar') or t.startswith('text'):
        m = re.search(r'\\((\\d+)\\)', t)
        return {'type': 'string', 'maxLength': int(m.group(1))} if m else {'type': 'string'}
    if t.startswith('timestamp'):
        return {'type': 'string', 'format': 'date-time'}
    if t.startswith('numeric'):
        return {'type': 'number'}
    return {'type': 'string'}

def parse_table(lines):
    table_name = None
    columns = []
    required = []
    for line in lines:
        m = re.match(r'CREATE TABLE [^\\.]+\\.([^( ]+)', line)
        if m:
            table_name = m.group(1)
        m = re.match(r'\\s*([a-zA-Z0-9_\"\\-]+) ([a-zA-Z0-9_\\(\\), ]+)( NOT NULL)?', line)
        if m and not line.strip().startswith('--'):
            col, typ, notnull = m.group(1), m.group(2), m.group(3)
            col = col.strip('"')
            prop = pg_type_to_openapi(typ.strip())
            columns.append((col, prop))
            if notnull:
                required.append(col)
    return table_name, columns, required

def extract_tables(sql):
    tables = []
    lines = sql.splitlines()
    i = 0
    while i < len(lines):
        if lines[i].startswith('CREATE TABLE'):
            tbl_lines = []
            while not lines[i].strip().endswith(';'):
                tbl_lines.append(lines[i])
                i += 1
            tbl_lines.append(lines[i])
            tables.append(tbl_lines)
        i += 1
    return tables

def table_to_yaml(name, columns, required):
    out = [f'{name.capitalize()}:', '  type: object', '  properties:']
    for col, prop in columns:
        out.append(f'    {col}:')
        for k, v in prop.items():
            out.append(f'      {k}: {v}')
    if required:
        out.append('  required:')
        for r in required:
            out.append(f'    - {r}')
    return '\\n'.join(out)

if __name__ == '__main__':
    with open(sys.argv[1], encoding='utf-8') as f:
        sql = f.read()
    for tbl in extract_tables(sql):
        name, cols, req = parse_table(tbl)
        if name:
            print(table_to_yaml(name, cols, req))
            print()