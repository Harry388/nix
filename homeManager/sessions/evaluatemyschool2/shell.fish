set TOKEN (grep SUPER_API_TOKEN < .env | cut -d = -f2 | tr -d '"')

alias curl 'curl -s -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json"'
