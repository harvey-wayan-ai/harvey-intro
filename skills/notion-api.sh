#!/bin/bash
# Notion API Helper Script
# Usage: ./notion-api.sh <command> [args]

NOTION_KEY=$(cat ~/.config/notion/api_key)
NOTION_VERSION="2022-06-28"

notion_request() {
    local method=$1
    local endpoint=$2
    local data=$3
    
    if [ -z "$data" ]; then
        curl -X "$method" "https://api.notion.com/v1/$endpoint" \
          -H "Authorization: Bearer $NOTION_KEY" \
          -H "Notion-Version: $NOTION_VERSION" \
          -H "Content-Type: application/json"
    else
        curl -X "$method" "https://api.notion.com/v1/$endpoint" \
          -H "Authorization: Bearer $NOTION_KEY" \
          -H "Notion-Version: $NOTION_VERSION" \
          -H "Content-Type: application/json" \
          -d "$data"
    fi
}

case "$1" in
    search)
        notion_request POST "search" '{"query": "'"$2"'", "page_size": 10}'
        ;;
    list)
        notion_request POST "search" '{"page_size": 100}'
        ;;
    get-page)
        notion_request GET "pages/$2"
        ;;
    get-database)
        notion_request GET "databases/$2"
        ;;
    query-database)
        notion_request POST "databases/$2/query" '{"page_size": 100}'
        ;;
    *)
        echo "Notion API Helper"
        echo "Usage: $0 <command> [args]"
        echo ""
        echo "Commands:"
        echo "  search <query>        - Search for pages/databases"
        echo "  list                  - List all accessible pages/databases"
        echo "  get-page <id>         - Get page details"
        echo "  get-database <id>     - Get database details"
        echo "  query-database <id>   - Query database entries"
        ;;
esac
