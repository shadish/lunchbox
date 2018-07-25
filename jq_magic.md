## Find something by key-name
```
cat store.json | jq -c 'paths | select(.[-1] == "some-value")'
```

## Find something by value
```
cat store.json | jq '[paths as $path | select(getpath($path) == "some-value") | $path]'
```
