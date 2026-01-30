#!/bin/bash
# Quick Notion Task Queries
# Usage: ./notion-tasks.sh [command]

NOTION_KEY=$(cat ~/.config/notion/api_key)
NOTION_VERSION="2022-06-28"
DATABASE_ID="2f60c00f-5fec-8157-b0e5-cc48faac3393"

case "$1" in
    all)
        # List all tasks
        curl -X POST "https://api.notion.com/v1/databases/$DATABASE_ID/query" \
          -H "Authorization: Bearer $NOTION_KEY" \
          -H "Notion-Version: $NOTION_VERSION" \
          -H "Content-Type: application/json" \
          -d '{"page_size": 100}' 2>&1 | \
          jq -r '.results[] | "[\(.properties.Status.select.name)] [\(.properties.Priority.select.name)] \(.properties.Task.title[0].text.content)"'
        ;;
    
    todo)
        # Only To Do tasks
        curl -X POST "https://api.notion.com/v1/databases/$DATABASE_ID/query" \
          -H "Authorization: Bearer $NOTION_KEY" \
          -H "Notion-Version: $NOTION_VERSION" \
          -H "Content-Type: application/json" \
          -d '{"filter": {"property": "Status", "select": {"equals": "📝 To Do"}}}' 2>&1 | \
          jq -r '.results[] | "[\(.properties.Priority.select.name)] \(.properties.Task.title[0].text.content)"'
        ;;
    
    high)
        # High priority tasks
        curl -X POST "https://api.notion.com/v1/databases/$DATABASE_ID/query" \
          -H "Authorization: Bearer $NOTION_KEY" \
          -H "Notion-Version: $NOTION_VERSION" \
          -H "Content-Type: application/json" \
          -d '{"filter": {"property": "Priority", "select": {"equals": "🔴 High"}}}' 2>&1 | \
          jq -r '.results[] | "[\(.properties.Status.select.name)] \(.properties.Task.title[0].text.content)"'
        ;;
    
    count)
        # Count by status
        echo "Task counts:"
        curl -X POST "https://api.notion.com/v1/databases/$DATABASE_ID/query" \
          -H "Authorization: Bearer $NOTION_KEY" \
          -H "Notion-Version: $NOTION_VERSION" \
          -H "Content-Type: application/json" \
          -d '{"page_size": 100}' 2>&1 | \
          jq -r '.results[].properties.Status.select.name' | sort | uniq -c
        ;;
    
    *)
        echo "Notion Task Query Tool"
        echo "Usage: $0 <command>"
        echo ""
        echo "Commands:"
        echo "  all      - List all tasks"
        echo "  todo     - List To Do tasks only"
        echo "  high     - List high priority tasks"
        echo "  count    - Count tasks by status"
        ;;
esac
